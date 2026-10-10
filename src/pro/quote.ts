// Pro: customer quote as a standalone printable HTML document (print CSS; the browser saves it as PDF).
// Written by an AI agent (Claude). Pure function; every user-supplied string is HTML-escaped.
import { totals, type BatchRow } from './batch';

export interface QuoteMeta {
  seller: string;
  customer: string;
  /** ISO date YYYY-MM-DD. */
  date: string;
  validDays: number;
  terms: string;
  currency: string;
}

export const esc = (s: string): string =>
  s.replace(/[\u0000-\u0008\u000b\u000c\u000e-\u001f\u007f]/g, '').replace(/[&<>"']/g, (c) =>
    ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);

const money = (n: number, cur: string) => esc(cur.slice(0, 4)) + n.toFixed(2);

export function renderQuote(rows: BatchRow[], m: QuoteMeta): string {
  const ok = rows.filter((r) => r.cost);
  const t = totals(ok);
  const line = (r: BatchRow) => {
    const unit = r.cost!.suggestedPrice;
    return `<tr><td>${esc(r.file.slice(0, 120))}</td><td class="n">${r.quantity}</td><td class="n">${money(unit, m.currency)}</td><td class="n">${money(unit * r.quantity, m.currency)}</td></tr>`;
  };
  const valid = Number.isFinite(m.validDays) && m.validDays > 0 ? Math.min(Math.round(m.validDays), 365) : 30;
  return `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Security-Policy" content="default-src 'none'; style-src 'unsafe-inline'">
<title>Quote</title>
<style>
body{font:14px/1.5 system-ui,sans-serif;color:#111;background:#fff;max-width:760px;margin:2rem auto;padding:0 1rem}
h1{font-size:1.6rem;margin:0 0 .25rem}table{width:100%;border-collapse:collapse;margin:1.5rem 0}
th,td{padding:.4rem .5rem;border-bottom:1px solid #ccc;text-align:left}.n{text-align:right}
tfoot td{font-weight:700;border-top:2px solid #111}.terms{white-space:pre-wrap;color:#333}
footer{margin-top:2rem;font-size:.8rem;color:#555}@media print{body{margin:0}}
</style></head><body>
<h1>Quote</h1>
<p>${m.seller ? `<strong>${esc(m.seller)}</strong><br>` : ''}${m.customer ? `For: ${esc(m.customer)}<br>` : ''}Date: ${esc(m.date)}<br>Valid for ${valid} days</p>
<table><thead><tr><th>Item</th><th class="n">Qty</th><th class="n">Unit</th><th class="n">Total</th></tr></thead>
<tbody>${ok.map(line).join('')}</tbody>
<tfoot><tr><td colspan="3">Total</td><td class="n">${money(t.price, m.currency)}</td></tr></tfoot></table>
${m.terms ? `<p class="terms">${esc(m.terms.slice(0, 2000))}</p>` : ''}
<footer>Made with Small Hours Print Cost Calculator. Built and maintained by an AI agent (Claude), with human oversight.</footer>
</body></html>
`;
}
