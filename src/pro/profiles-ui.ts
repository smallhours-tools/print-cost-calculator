// Pro: printer, material and shop libraries for the cost settings, with JSON import/export (hq task t009).
// Written by an AI agent (Claude). Libraries live in localStorage and pass through the strict importer on every load.
import type { FilamentUsage } from '../parsers/types';
import type { ProfileValues } from './profiles';
import { MAX_IMPORT_BYTES } from './profiles';
import {
  blendMaterials, emptyLibrary, exportLibrary, importLibrary, removeItem, suggestMaterial, upsertItem, MATERIAL_KEYS,
  PRINTER_KEYS, SHOP_KEYS, type Kind, type Library, type MaterialItem,
} from './library';

const STORE = 'pcc.pro.library.v2';
const OLD_STORE = 'pcc.pro.profiles.v1';
const PICKED = 'pcc.pro.library.picked';
const KINDS: { kind: Kind; label: string; keys: readonly (keyof ProfileValues)[]; example: string }[] = [
  { kind: 'printers', label: 'Printer', keys: PRINTER_KEYS, example: 'e.g. P1S' },
  { kind: 'materials', label: 'Material', keys: MATERIAL_KEYS, example: 'e.g. PETG HF' },
  { kind: 'shops', label: 'Shop', keys: SHOP_KEYS, example: 'e.g. Etsy' },
];

/** Load the stored library (or migrate v1 flat profiles); anything that fails validation is dropped. */
export function loadLibrary(raw: string | null, oldRaw: string | null = null): Library {
  for (const r of [raw, oldRaw]) {
    if (!r) continue;
    try { return importLibrary(r); } catch { /* try the next source */ }
  }
  return emptyLibrary();
}

export function mountProfiles(fieldset: HTMLElement, read: () => ProfileValues, write: (v: Partial<ProfileValues>) => void) {
  let lib: Library;
  let picked: Partial<Record<Kind, string>> = {};
  try {
    lib = loadLibrary(localStorage.getItem(STORE), localStorage.getItem(OLD_STORE));
    const p = JSON.parse(localStorage.getItem(PICKED) ?? '{}');
    if (p && typeof p === 'object') for (const { kind } of KINDS) if (typeof p[kind] === 'string') picked[kind] = p[kind];
  } catch { lib = emptyLibrary(); picked = {}; }

  const mk = <K extends keyof HTMLElementTagNameMap>(tag: K, props: Record<string, unknown> = {}) => Object.assign(document.createElement(tag), props) as HTMLElementTagNameMap[K];
  const status = mk('p', { className: 'note', role: 'status' });
  const save = () => {
    try { localStorage.setItem(STORE, exportLibrary(lib)); localStorage.setItem(PICKED, JSON.stringify(picked)); }
    catch { status.textContent = 'This browser is not saving data, so profiles last only until you close the page.'; }
  };
  const label = (text: string, ctl: HTMLElement) => { const l = mk('label', { textContent: text }); l.append(ctl); return l; };

  const box = mk('div', { id: 'pro-profiles', className: 'grid' });
  box.style.gridColumn = '1 / -1';
  const fills: (() => void)[] = [];

  for (const { kind, label: text, keys, example } of KINDS) {
    const id = kind.slice(0, -1);
    const select = mk('select', { id: `p-${id}` });
    const name = mk('input', { id: `p-${id}-name`, type: 'text', maxLength: 60, placeholder: example });
    const saveBtn = mk('button', { type: 'button', id: `p-${id}-save`, textContent: `Save ${text.toLowerCase()}` });
    const delBtn = mk('button', { type: 'button', id: `p-${id}-delete`, textContent: 'Delete' });
    const actions = mk('p');
    actions.append(saveBtn, ' ', delBtn);
    box.append(label(`${text} (Pro preview)`, select), label(`Name for this ${text.toLowerCase()}`, name), actions);

    const items = () => lib[kind] as { name: string; values: Partial<ProfileValues> }[];
    const fill = () => {
      const sel = picked[kind] ?? '';
      const opt = (value: string, t: string) => mk('option', { value, textContent: t, selected: value === sel });
      select.replaceChildren(opt('', items().length ? `Choose a ${text.toLowerCase()}…` : `No saved ${kind} yet`), ...items().map((p) => opt(p.name, p.name)));
      delBtn.disabled = !items().some((p) => p.name === sel);
    };
    fills.push(fill);

    select.addEventListener('change', () => {
      const p = items().find((x) => x.name === select.value);
      picked[kind] = p?.name;
      delBtn.disabled = !p;
      save();
      if (!p) return;
      write(p.values);
      name.value = p.name;
      status.textContent = `Loaded ${text.toLowerCase()} "${p.name}".`;
    });
    saveBtn.addEventListener('click', () => {
      try {
        const current = read();
        const values = Object.fromEntries(keys.map((k) => [k, current[k]]));
        lib = upsertItem(lib, kind, { name: name.value || select.value, values } as never);
        const want = (name.value || select.value).trim().replace(/\s+/g, ' ').toLowerCase();
        picked[kind] = items().find((p) => p.name.toLowerCase() === want)?.name;
        save(); fill();
        status.textContent = `Saved ${text.toLowerCase()} "${picked[kind] ?? ''}".`;
      } catch (e) { status.textContent = e instanceof Error ? e.message : 'Could not save'; }
    });
    delBtn.addEventListener('click', () => {
      const n = select.value;
      if (!n) return;
      lib = removeItem(lib, kind, n); picked[kind] = undefined; save(); fill();
      status.textContent = `Deleted ${text.toLowerCase()} "${n}".`;
    });
  }

  const expBtn = mk('button', { type: 'button', id: 'p-export', textContent: 'Export JSON' });
  const imp = mk('input', { type: 'file', id: 'p-import', accept: '.json,application/json' });
  const actions = mk('p');
  actions.append(expBtn);
  box.append(actions, label('Import JSON', imp), status);
  fieldset.querySelector('legend')!.after(box);

  expBtn.addEventListener('click', () => {
    const url = URL.createObjectURL(new Blob([exportLibrary(lib)], { type: 'application/json' }));
    const a = mk('a', { href: url, download: 'smallhours-profiles.json' });
    document.body.append(a); a.click(); a.remove();
    setTimeout(() => URL.revokeObjectURL(url), 1000);
  });
  imp.addEventListener('change', async () => {
    const f = imp.files?.[0];
    imp.value = '';
    if (!f) return;
    try {
      if (f.size > MAX_IMPORT_BYTES) throw new Error('File too large');
      const incoming = importLibrary(await f.text());
      let n = 0;
      let next = lib;
      for (const { kind } of KINDS) for (const item of incoming[kind]) { next = upsertItem(next, kind, item as never); n++; }
      lib = next;
      save(); fills.forEach((f) => f());
      status.textContent = `Imported ${n} entr${n === 1 ? 'y' : 'ies'}. Entries with the same name were replaced.`;
    } catch (e) { status.textContent = `Import failed: ${e instanceof Error ? e.message : 'unreadable file'}. Nothing was changed.`; }
  });
  fills.forEach((f) => f());

  // Preselect saved materials from the file's filament types. Several filaments: blend by weight.
  document.addEventListener('pcc:parsed', (e) => {
    const filaments = ((e as CustomEvent).detail ?? []) as FilamentUsage[];
    const slots = filaments.map((f) => ({ weightG: f.weightG, material: suggestMaterial(lib, f) }));
    const matched = slots.filter((s): s is { weightG: number | undefined; material: MaterialItem } => !!s.material);
    if (!matched.length) return;
    const names = [...new Set(matched.map((s) => s.material.name))];
    const select = box.querySelector<HTMLSelectElement>('#p-material')!;
    if (names.length === 1) {
      const m = matched[0].material;
      picked.materials = m.name; save(); fills[1]();
      write(m.values);
      status.textContent = `Matched material "${m.name}" from the file's filament type. Pick another if that's wrong.`;
      return;
    }
    const blend = blendMaterials(slots);
    if (!blend) return;
    picked.materials = undefined; save(); fills[1]();
    select.value = '';
    write(blend);
    status.textContent = `Matched ${names.length} materials from the file (${names.map((n) => `"${n}"`).join(', ')}). The material price is their weight-weighted average, with each one's waste included.`;
  });
}
