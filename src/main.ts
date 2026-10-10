import { computeCost, DEFAULTS, perHour, type CostInputs } from './cost';
import { parseFile, type ParsedFile } from './parsers/index';
import { isBgcode } from './parsers/bgcode';
import { featureLengthsFromBytes, featureSummary } from './parsers/features';
import { bgcodeFeatureLengths } from './parsers/bgcode-gcode';
import { jobHash, parseHashJob } from './hash';
import { powerHint } from './printer-power';
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
  const rate = perHour(v);
  $('per-hour').hidden = !rate;
  if (rate) {
    $('per-hour-text').textContent =
      `Per print hour: ${rate.gramsPerHour.toFixed(1)} g of filament, and ${cur} ${money(rate.machinePerHour)} of machine cost (electricity + wear).`;
  }
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

/** Offer the manufacturer's average power for the file's printer, unless the power setting already matches it. */
function showPowerHint(model?: string) {
  const box = $('power-hint');
  const hint = powerHint(model);
  const current = parseFloat(input('printerPowerW').value);
  box.hidden = !hint || current === hint.watts;
  if (!hint || box.hidden) return;
  $('power-hint-text').textContent =
    `This file is for a ${hint.label}, which averages about ${hint.watts} W printing PLA (manufacturer figure; see the electricity guide). Your setting is ${Number.isFinite(current) ? current : 0} W.`;
  $('power-hint-use').onclick = () => {
    input('printerPowerW').value = String(hint.watts);
    box.hidden = true;
    render();
  };
}

/** hq t039/t041: per-feature split for single-filament G-code or .bgcode with feature comments; hidden otherwise. */
const FEATURE_MAX_BYTES = 64 * 1024 * 1024;
let featureRun = 0;
async function showFeatureSplit(bytes: Uint8Array, parsed: ParsedFile) {
  const box = $('feature-split');
  box.hidden = true;
  const run = ++featureRun;
  const isZip = bytes[0] === 0x50 && bytes[1] === 0x4b;
  if (isZip || bytes.length > FEATURE_MAX_BYTES || parsed.filaments.length !== 1 || !parsed.totalWeightG) return;
  const lengths = isBgcode(bytes) ? await bgcodeFeatureLengths(bytes) : featureLengthsFromBytes(bytes);
  const line = featureSummary(lengths, parsed.totalWeightG, parsed.filaments[0].lengthMm);
  if (!line || run !== featureRun) return; // nothing to show, or another file was dropped meanwhile
  $('feature-split-text').textContent = line;
  box.hidden = false;
}

async function handleFile(file: File) {
  const status = $('file-status');
  status.textContent = 'Reading file locally…';
  $('feature-split').hidden = true;
  featureRun++;
  try {
    const bytes = new Uint8Array(await file.arrayBuffer());
    const parsed = await parseFile(bytes);
    input('weightG').value = parsed.totalWeightG !== undefined ? String(Math.round(parsed.totalWeightG * 10) / 10) : '';
    setTime(parsed.printTimeSeconds);
    const bits = [`Detected slicer: ${parsed.slicer}`, `${parsed.filaments.length} filament(s)`];
    if (parsed.printerModel) bits.push(`printer: ${parsed.printerModel}`);
    if (parsed.wipeTowerG !== undefined) bits.push(`${Math.round(parsed.wipeTowerG * 10) / 10} g of it is wipe tower (purge), already counted`);
    if (parsed.totalWeightG === undefined) bits.push('no weight found: enter it manually');
    if (parsed.printTimeSeconds === undefined) bits.push('no print time found: enter it manually');
    status.textContent = [...bits, ...parsed.warnings].join(' · ');
    render();
    // Pro preview listens for this to preselect saved materials. Only types and weights, never file text beyond them.
    document.dispatchEvent(new CustomEvent('pcc:parsed', { detail: parsed.filaments.map((f) => ({ type: f.type, weightG: f.weightG })) }));
    // ...and this to preselect a saved printer (model and preset are cleaned short labels).
    document.dispatchEvent(new CustomEvent('pcc:printer', { detail: { model: parsed.printerModel, preset: parsed.printerPreset } }));
    showPowerHint(parsed.printerModel);
    showFeatureSplit(bytes, parsed).catch(() => { /* unreadable G-code blocks: the split just stays hidden */ });
  } catch (e) {
    $('power-hint').hidden = true;
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
  // The link carries only weight and time, never cost settings (see src/hash.ts).
  $('copy-link').addEventListener('click', async () => {
    const v = read();
    const hash = jobHash(v.weightG, v.printTimeHours * 3600);
    const status = $('copy-status');
    if (!hash) { status.textContent = 'Enter a weight or time first.'; return; }
    history.replaceState(null, '', hash);
    try {
      await navigator.clipboard.writeText(location.href);
      status.textContent = 'Link copied (weight and time only, not your settings).';
    } catch {
      status.textContent = 'Copy the link from the address bar (weight and time only).';
    }
  });
  const job = parseHashJob(location.hash);
  if (job.weightG !== undefined) input('weightG').value = String(job.weightG);
  if (job.seconds !== undefined) setTime(job.seconds);
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
