// Pro: customer quote form and printable preview. Written by an AI agent (Claude).
// The quote HTML (escaped, CSP default-src 'none') goes into a sandboxed iframe via srcdoc. The sandbox
// allows same-origin only so we can call print() on it; scripts inside it can never run.
import { renderQuote, type QuoteMeta } from './quote';
import type { BatchRow } from './batch';

const STORE = 'pcc.pro.quote.v1';
type Saved = Pick<QuoteMeta, 'seller' | 'validDays' | 'terms'>;

export function loadSaved(raw: string | null): Saved {
  const out: Saved = { seller: '', validDays: 30, terms: '' };
  try {
    const o = JSON.parse(raw ?? '{}');
    if (typeof o.seller === 'string') out.seller = o.seller.slice(0, 120);
    if (typeof o.terms === 'string') out.terms = o.terms.slice(0, 2000);
    if (typeof o.validDays === 'number' && Number.isFinite(o.validDays) && o.validDays > 0) out.validDays = Math.min(Math.round(o.validDays), 365);
  } catch { /* corrupt storage: defaults */ }
  return out;
}

export const today = (d = new Date()) =>
  `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;

export function mountQuote(container: HTMLElement, getRows: () => BatchRow[], getCurrency: () => string) {
  let saved: Saved;
  try { saved = loadSaved(localStorage.getItem(STORE)); } catch { saved = loadSaved(null); }
  const field = (label: string, input: HTMLInputElement | HTMLTextAreaElement) => {
    const l = document.createElement('label'); l.textContent = label; l.append(input); return l;
  };
  const mk = (id: string, value: string, type = 'text') => Object.assign(document.createElement('input'), { id, value, type });
  const seller = mk('q-seller', saved.seller); seller.maxLength = 120;
  const customer = mk('q-customer', ''); customer.maxLength = 120;
  const valid = mk('q-valid', String(saved.validDays), 'number'); valid.min = '1'; valid.max = '365';
  const terms = Object.assign(document.createElement('textarea'), { id: 'q-terms', value: saved.terms, rows: 3, maxLength: 2000 });
  const show = Object.assign(document.createElement('button'), { type: 'button', id: 'q-show', textContent: 'Preview quote' });
  const print = Object.assign(document.createElement('button'), { type: 'button', id: 'q-print', textContent: 'Print or save as PDF', hidden: true });
  const note = Object.assign(document.createElement('p'), { className: 'note', role: 'status' });
  const frame = document.createElement('iframe');
  frame.id = 'q-frame'; frame.title = 'Quote preview'; frame.hidden = true;
  frame.setAttribute('sandbox', 'allow-same-origin allow-modals');
  frame.style.cssText = 'width:100%;height:32rem;border:1px solid var(--bd);border-radius:8px;background:#fff';

  const fs = document.createElement('fieldset');
  fs.className = 'grid';
  const legend = document.createElement('legend'); legend.textContent = 'Customer quote';
  fs.append(legend, field('Your shop name', seller), field('Customer', customer), field('Valid for (days)', valid), field('Terms (printed on the quote)', terms));
  const p = document.createElement('p'); p.append(show, ' ', print);
  container.append(fs, p, note, frame);

  function build() {
    const rows = getRows();
    const meta: QuoteMeta = { seller: seller.value, customer: customer.value, date: today(), validDays: parseFloat(valid.value), terms: terms.value, currency: getCurrency() };
    try { localStorage.setItem(STORE, JSON.stringify({ seller: meta.seller, validDays: meta.validDays, terms: meta.terms })); } catch { /* ignore */ }
    const left = rows.filter((r) => !r.cost).length;
    note.textContent = left ? `${left} unread file(s) are not on the quote. Enter their weight and time to include them.` : '';
    frame.srcdoc = renderQuote(rows, meta);
    frame.hidden = print.hidden = false;
  }
  show.addEventListener('click', build);
  print.addEventListener('click', () => { build(); frame.addEventListener('load', () => frame.contentWindow?.print(), { once: true }); });
  return { setVisible(v: boolean) { fs.hidden = p.hidden = v ? false : true; if (!v) { frame.hidden = true; note.textContent = ''; } } };
}
