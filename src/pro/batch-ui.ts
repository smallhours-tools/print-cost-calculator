// Pro: batch table UI with CSV download. Written by an AI agent (Claude).
// Loaded by dynamic import only when the Pro gate is open. All text goes in via textContent.
import { parseFile, type ParsedFile } from '../parsers/index';
import { priceParsed, toCsv, totals, MAX_BATCH_FILES, type BatchRow } from './batch';
import type { ProfileValues } from './profiles';

const el = <K extends keyof HTMLElementTagNameMap>(tag: K, props: Record<string, unknown> = {}, ...kids: (Node | string)[]): HTMLElementTagNameMap[K] => {
  const e = Object.assign(document.createElement(tag), props);
  e.append(...kids);
  return e;
};

/** One dropped file. Weight and time start from the parse and can be corrected by hand. */
interface Item { file: string; parsed?: ParsedFile; error?: string; weightG?: number; seconds?: number; qty: number }

const hhmm = (hours: number) => { const m = Math.round(hours * 60); return `${Math.floor(m / 60)}h ${String(m % 60).padStart(2, '0')}m`; };
const displayName = (s: string) => s.replace(/[\u0000-\u001f\u007f]/g, ' ').slice(0, 120);

export function mountBatch(after: Element, getProfile: () => ProfileValues, getCurrency: () => string, onSettingsChange: (cb: () => void) => void) {
  let items: Item[] = [];
  let priced: BatchRow[] = [];
  let cells: { unit: HTMLElement; line: HTMLElement; note: HTMLElement }[] = [];
  const status = el('p', { id: 'batch-status', role: 'status' });
  const picker = el('input', { id: 'batch-files', type: 'file', multiple: true, accept: '.gcode,.gco,.3mf,.bgcode,.ufp,text/plain' });
  const tbody = el('tbody');
  const tfoot = el('tfoot');
  const head = el('tr', {}, ...['File', 'Weight (g)', 'Time (min)', 'Qty', 'Unit price', 'Line price', 'Notes', ''].map((h) => el('th', { scope: 'col', textContent: h })));
  const table = el('table', { id: 'batch-table', className: 'batch' }, el('thead', {}, head), tbody, tfoot);
  const csv = el('button', { id: 'batch-csv', type: 'button', textContent: 'Download CSV' });
  const clear = el('button', { type: 'button', textContent: 'Clear batch' });
  const section = el('section', { id: 'pro-batch', ariaLabel: 'Batch pricing' },
    el('h2', { textContent: 'Batch pricing (Pro preview)' }),
    el('p', {}, el('label', { htmlFor: 'batch-files', textContent: 'Add several sliced files. They are read in your browser and never uploaded.' })),
    el('p', { className: 'note', textContent: 'Each row is priced as its own item with your settings above (its own labor and fixed fee), then multiplied by quantity.' }),
    picker, status, el('div', { className: 'scroll' }, table), el('p', {}, csv, ' ', clear));
  after.after(section);

  const toRow = (it: Item): BatchRow => {
    if (it.error && it.weightG === undefined && it.seconds === undefined) return { file: it.file, quantity: it.qty, error: it.error, warnings: [] };
    const base: ParsedFile = it.parsed ?? { slicer: 'unknown', filaments: [], warnings: [] };
    return priceParsed(it.file, { ...base, totalWeightG: it.weightG, printTimeSeconds: it.seconds }, getProfile(), it.qty);
  };

  // Inputs keep their elements while the user edits; only computed cells are refreshed.
  const num = (label: string, value: number | undefined, step: string, set: (n: number | undefined) => number | undefined) => {
    const i = el('input', { type: 'number', min: '0', step, inputMode: 'decimal', value: value === undefined ? '' : String(value) });
    i.setAttribute('aria-label', label);
    i.addEventListener('change', () => {
      const n = parseFloat(i.value);
      const shown = set(Number.isFinite(n) && n >= 0 ? n : undefined);
      i.value = shown === undefined ? '' : String(shown);
      refresh();
    });
    return i;
  };

  /** Rebuild rows: only after adding, removing or clearing files. */
  function render() {
    cells = [];
    tbody.replaceChildren(...items.map((it, idx) => {
      const name = displayName(it.file);
      const del = el('button', { type: 'button', textContent: 'Remove' });
      del.setAttribute('aria-label', `Remove ${name}`);
      del.addEventListener('click', () => { items.splice(idx, 1); render(); });
      const c = { unit: el('td'), line: el('td'), note: el('td', { className: 'note' }) };
      cells.push(c);
      return el('tr', {},
        el('th', { scope: 'row', textContent: name }),
        el('td', {}, num(`Weight for ${name}`, it.weightG === undefined ? undefined : Math.round(it.weightG * 100) / 100, '0.1', (n) => (it.weightG = n))),
        el('td', {}, num(`Minutes for ${name}`, it.seconds === undefined ? undefined : Math.round(it.seconds / 60), '1',
          (n) => { it.seconds = n === undefined ? undefined : n * 60; return n; })),
        el('td', {}, num(`Quantity for ${name}`, it.qty, '1', (n) => { it.qty = toRow({ ...it, qty: n ?? 1 }).quantity; return it.qty; })),
        c.unit, c.line, c.note,
        el('td', {}, del));
    }));
    table.hidden = csv.hidden = clear.hidden = items.length === 0;
    refresh();
  }

  /** Recompute prices and totals in place. */
  function refresh() {
    const cur = getCurrency();
    const m = (n: number) => `${cur} ${n.toFixed(2)}`;
    priced = items.map(toRow);
    priced.forEach((r, idx) => {
      cells[idx].unit.textContent = r.cost ? m(r.cost.suggestedPrice) : '–';
      cells[idx].line.textContent = r.cost ? m(r.cost.suggestedPrice * r.quantity) : '–';
      cells[idx].note.textContent = r.error ? `Could not read file (${r.error}). Enter weight and time.` : r.warnings.join(' ');
    });
    const t = totals(priced);
    const left = t.failed ? ` (${t.failed} unread file(s) left out)` : '';
    tfoot.replaceChildren(el('tr', {},
      el('th', { scope: 'row', textContent: `Total: ${t.count} item(s)${left}` }),
      el('td', { textContent: `${t.weightG.toFixed(1)} g` }),
      el('td', { textContent: hhmm(t.printTimeHours) }),
      el('td'), el('td', { textContent: `Cost ${m(t.subtotal)}` }),
      el('td', { textContent: m(t.price) }),
      el('td', { textContent: `Fees ${m(t.fees)} · Profit ${m(t.profit)}` }), el('td')));
  }

  async function add(files: FileList | File[]) {
    const list = Array.from(files);
    const room = MAX_BATCH_FILES - items.length;
    if (room <= 0) { status.textContent = `A batch holds up to ${MAX_BATCH_FILES} files.`; return; }
    const take = list.slice(0, room);
    for (let i = 0; i < take.length; i++) {
      status.textContent = `Reading ${i + 1} of ${take.length} locally…`;
      try {
        const parsed = await parseFile(new Uint8Array(await take[i].arrayBuffer()));
        items.push({ file: take[i].name, parsed, weightG: parsed.totalWeightG, seconds: parsed.printTimeSeconds, qty: 1 });
      } catch (e) {
        items.push({ file: take[i].name, error: e instanceof Error && e.message ? e.message : 'unreadable', qty: 1 });
      }
      render();
    }
    status.textContent = `${items.length} file(s) in batch.` + (list.length > take.length ? ` ${list.length - take.length} skipped (limit ${MAX_BATCH_FILES}).` : '');
  }

  csv.addEventListener('click', () => {
    const url = URL.createObjectURL(new Blob([toCsv(priced)], { type: 'text/csv;charset=utf-8' }));
    const a = el('a', { href: url, download: 'print-batch.csv' });
    document.body.append(a); a.click(); a.remove();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
  });
  picker.addEventListener('change', () => { if (picker.files) add(picker.files).then(() => { picker.value = ''; }); });
  section.addEventListener('dragover', (e) => e.preventDefault());
  section.addEventListener('drop', (e) => { e.preventDefault(); if (e.dataTransfer?.files.length) add(e.dataTransfer.files); });
  clear.addEventListener('click', () => { items = []; status.textContent = ''; render(); });
  onSettingsChange(refresh);
  render();
}
