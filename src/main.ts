import { computeCost, DEFAULTS, type CostInputs } from './cost';
import { parseFile } from './parsers/index';
import { proPreviewEnabled } from './pro/gate';

const STORE = 'pcc.settings.v1';
const $ = <T extends HTMLElement>(id: string) => document.getElementById(id) as T;
const keys = Object.keys(DEFAULTS) as (keyof CostInputs)[];
const input = (k: string) => $<HTMLInputElement>('f-' + k);

function load(): CostInputs {
  try {
    const saved = JSON.parse(localStorage.getItem(STORE) ?? '{}');
    const out = { ...DEFAULTS };
    for (const k of keys) if (typeof saved[k] === 'number' && Number.isFinite(saved[k])) out[k] = saved[k];
    return out;
  } catch {
    return { ...DEFAULTS };
  }
}

function read(): CostInputs {
  const v = { ...DEFAULTS };
  for (const k of keys) v[k] = parseFloat(input(k).value) || 0;
  // time is entered as hours + minutes
  v.printTimeHours = (parseFloat($<HTMLInputElement>('f-hours').value) || 0) + (parseFloat($<HTMLInputElement>('f-mins').value) || 0) / 60;
  return v;
}

const money = (n: number) => n.toFixed(2);

function render() {
  const v = read();
  const c = computeCost(v);
  const cur = $<HTMLInputElement>('f-currency').value.trim().slice(0, 4);
  const rows: [string, number][] = [
    ['Material', c.material], ['Electricity', c.electricity], ['Printer wear', c.wear], ['Labor', c.labor],
    ['Total cost', c.subtotal], ['Marketplace fees', c.fees], ['Profit', c.profit],
  ];
  const body = $('breakdown');
  body.replaceChildren();
  for (const [label, n] of rows) {
    const tr = document.createElement('tr');
    const th = document.createElement('th'); th.scope = 'row'; th.textContent = label;
    const td = document.createElement('td'); td.textContent = `${cur} ${money(n)}`;
    tr.append(th, td); body.append(tr);
  }
  $('price').textContent = `${cur} ${money(c.suggestedPrice)}`;
  try {
    const store: Record<string, number> = {};
    for (const k of keys) if (k !== 'weightG' && k !== 'printTimeHours') store[k] = v[k];
    localStorage.setItem(STORE, JSON.stringify(store));
    localStorage.setItem(STORE + '.cur', cur);
  } catch { /* storage unavailable: presets just won't persist */ }
}

function setTime(seconds?: number) {
  const h = seconds ? Math.floor(seconds / 3600) : 0;
  $<HTMLInputElement>('f-hours').value = String(h);
  $<HTMLInputElement>('f-mins').value = seconds ? String(Math.round((seconds % 3600) / 60)) : '0';
}

async function handleFile(file: File) {
  const status = $('file-status');
  status.textContent = 'Reading file locally…';
  try {
    const parsed = await parseFile(new Uint8Array(await file.arrayBuffer()));
    input('weightG').value = parsed.totalWeightG !== undefined ? String(Math.round(parsed.totalWeightG * 10) / 10) : '';
    setTime(parsed.printTimeSeconds);
    const bits = [`Detected slicer: ${parsed.slicer}`, `${parsed.filaments.length} filament(s)`];
    if (parsed.totalWeightG === undefined) bits.push('no weight found: enter it manually');
    if (parsed.printTimeSeconds === undefined) bits.push('no print time found: enter it manually');
    status.textContent = [...bits, ...parsed.warnings].join(' · ');
    render();
  } catch (e) {
    const msg = e instanceof Error ? e.message : '';
    // Messages written as full sentences (e.g. "This project hasn't been sliced...") read better on their own.
    status.textContent = /[.!?]$/.test(msg)
      ? `${msg} Enter weight and time manually below.`
      : `Could not read that file${msg ? ` (${msg})` : ''}. Enter weight and time manually below.`;
  }
}

function init() {
  const saved = load();
  for (const k of keys) input(k).value = k === 'weightG' || k === 'printTimeHours' ? '' : String(saved[k]);
  try { $<HTMLInputElement>('f-currency').value = localStorage.getItem(STORE + '.cur') || '$'; } catch { /* ignore */ }
  document.querySelectorAll('#calc input').forEach((el) => el.addEventListener('input', render));
  const picker = $<HTMLInputElement>('file');
  picker.addEventListener('change', () => picker.files?.[0] && handleFile(picker.files[0]));
  const drop = $('drop');
  drop.addEventListener('dragover', (e) => { e.preventDefault(); drop.classList.add('over'); });
  drop.addEventListener('dragleave', () => drop.classList.remove('over'));
  drop.addEventListener('drop', (e) => {
    e.preventDefault(); drop.classList.remove('over');
    const f = e.dataTransfer?.files[0]; if (f) handleFile(f);
  });
  $('reset').addEventListener('click', () => {
    try { localStorage.removeItem(STORE); localStorage.removeItem(STORE + '.cur'); } catch { /* ignore */ }
    location.reload();
  });
  render();
  if (proPreviewEnabled(location)) {
    import('./pro/batch-ui').then(({ mountBatch }) => mountBatch(
      $('res').parentElement!, read, () => $<HTMLInputElement>('f-currency').value.trim().slice(0, 4),
      (cb) => document.querySelectorAll('#calc input').forEach((el) => el.addEventListener('input', cb)),
    ));
    import('./pro/profiles-ui').then(({ mountProfiles }) => mountProfiles(
      input('filamentPricePerKg').closest('fieldset')!, read,
      // Setting values then firing one input event re-renders the result and the batch table.
      (v) => { for (const [k, n] of Object.entries(v)) input(k).value = String(n); input('feeFixed').dispatchEvent(new Event('input')); },
    ));
  }
}
init();
