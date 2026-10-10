// Pro: separate printer, material and shop libraries that the user mixes and matches (hq task t009).
// Written by an AI agent (Claude). Pure functions; the UI still uses the flat profiles from profiles.ts.
import type { FilamentUsage } from '../parsers/types';
import { cleanName, defaultValues, MAX_IMPORT_BYTES, MAX_PROFILES, PROFILE_KEYS, type ProfileValues } from './profiles';

export const PRINTER_KEYS = ['printerPowerW', 'printerCost', 'printerLifetimeHours', 'maintenancePerHour'] as const;
export const MATERIAL_KEYS = ['filamentPricePerKg', 'wastePct'] as const;
export const SHOP_KEYS = ['electricityPerKwh', 'laborPerHour', 'laborMinutes', 'marginPct', 'feePct', 'feeFixed'] as const;

export type Kind = 'printers' | 'materials' | 'shops';
const KEYS = { printers: PRINTER_KEYS, materials: MATERIAL_KEYS, shops: SHOP_KEYS } as const;

type Vals<K extends readonly (keyof ProfileValues)[]> = Pick<ProfileValues, K[number]>;
export interface Item<V> {
  name: string;
  values: V;
  /** Printer model or material type used to preselect this entry from a file, e.g. "PETG". */
  match?: string;
}
export type PrinterItem = Item<Vals<typeof PRINTER_KEYS>>;
export type MaterialItem = Item<Vals<typeof MATERIAL_KEYS>>;
export type ShopItem = Item<Vals<typeof SHOP_KEYS>>;
export interface Library { printers: PrinterItem[]; materials: MaterialItem[]; shops: ShopItem[] }
export interface LibraryFile extends Library { format: 'smallhours-profiles'; version: 2 }

const isNum = (v: unknown): v is number => typeof v === 'number' && Number.isFinite(v) && v >= 0 && v <= 1e9;
const own = (o: object, k: string) => Object.prototype.hasOwnProperty.call(o, k);
const pick = <K extends readonly (keyof ProfileValues)[]>(v: ProfileValues, keys: K) =>
  Object.fromEntries(keys.map((k) => [k, v[k]])) as Vals<K>;

export const emptyLibrary = (): Library => ({ printers: [], materials: [], shops: [] });

/** Add or replace an entry (case-insensitive name) in one library. Returns a new library. */
export function upsertItem<T extends Kind>(lib: Library, kind: T, item: Library[T][number]): Library {
  const name = cleanName(item.name);
  if (!name) throw new Error('Name is required');
  const list = (lib[kind] as Item<object>[]).filter((p) => p.name.toLowerCase() !== name.toLowerCase());
  if (list.length >= MAX_PROFILES) throw new Error('Too many entries');
  const values = pick({ ...defaultValues(), ...item.values } as ProfileValues, KEYS[kind]);
  const match = cleanName(item.match) ?? undefined;
  const next = [...list, { name, values, ...(match ? { match } : {}) }].sort((a, b) => a.name.localeCompare(b.name));
  return { ...lib, [kind]: next };
}

export const removeItem = (lib: Library, kind: Kind, name: string): Library =>
  ({ ...lib, [kind]: (lib[kind] as Item<object>[]).filter((p) => p.name.toLowerCase() !== name.toLowerCase()) });

/** The full set of cost assumptions for one printer + material + shop choice (missing parts use defaults). */
export function combine(printer?: PrinterItem, material?: MaterialItem, shop?: ShopItem): ProfileValues {
  return { ...defaultValues(), ...printer?.values, ...material?.values, ...shop?.values };
}

/**
 * Multi-material: one material per filament slot. Returns the weight-averaged price per kg with each slot's
 * own waste already applied, so wastePct is 0. Slots without a known weight or material are skipped.
 */
export function blendMaterials(slots: { weightG?: number; material?: MaterialItem }[]): Vals<typeof MATERIAL_KEYS> | undefined {
  let grams = 0;
  let cost = 0;
  for (const s of slots) {
    if (!s.material || !isNum(s.weightG) || s.weightG === 0) continue;
    grams += s.weightG;
    cost += s.weightG * s.material.values.filamentPricePerKg * (1 + s.material.values.wastePct / 100);
  }
  return grams > 0 ? { filamentPricePerKg: cost / grams, wastePct: 0 } : undefined;
}

const norm = (s: string) => s.toLowerCase().replace(/[^a-z0-9]+/g, ' ').trim();

/** Material entry to preselect for a filament from the file: exact `match` on type first, then the type in the name. */
export function suggestMaterial(lib: Library, f: FilamentUsage): MaterialItem | undefined {
  if (!f.type) return undefined;
  const t = norm(f.type);
  if (!t) return undefined;
  return (
    lib.materials.find((m) => m.match && norm(m.match) === t) ??
    lib.materials.find((m) => ` ${norm(m.name)} `.includes(` ${t} `))
  );
}

/**
 * Printer entry to preselect from the file's printer model/preset text: an entry whose `match`, else whose name,
 * appears in it as whole words. The longest hit wins, so "P1S Combo" beats "P1S".
 */
export function suggestPrinter(lib: Library, model?: string): PrinterItem | undefined {
  if (!model) return undefined;
  const m = ` ${norm(model)} `;
  const best = (key: (p: PrinterItem) => string | undefined) => {
    let hit: PrinterItem | undefined;
    let len = 0;
    for (const p of lib.printers) {
      const k = norm(key(p) ?? '');
      if (k && k.length > len && m.includes(` ${k} `)) { hit = p; len = k.length; }
    }
    return hit;
  };
  return best((p) => p.match) ?? best((p) => p.name);
}

export function exportLibrary(lib: Library): string {
  const file: LibraryFile = { format: 'smallhours-profiles', version: 2, ...lib };
  return JSON.stringify(file, null, 2);
}

function readValues(kind: Kind, raw: unknown): ProfileValues {
  if (!raw || typeof raw !== 'object') throw new Error('Malformed entry');
  const values = defaultValues();
  for (const k of KEYS[kind]) {
    if (!own(raw, k)) continue;
    const v = (raw as Record<string, unknown>)[k];
    if (!isNum(v)) throw new Error(`Bad value for ${k}`);
    values[k] = v;
  }
  return values;
}

/**
 * Parse an exported file. Version 2 is the split library; version 1 (flat profiles from profiles.ts) is split
 * into a printer, a material and a shop of the same name. Unknown keys are dropped; bad values reject the file.
 */
export function importLibrary(text: string): Library {
  if (text.length > MAX_IMPORT_BYTES) throw new Error('File too large');
  let data: unknown;
  try { data = JSON.parse(text); } catch { throw new Error('Not valid JSON'); }
  const f = data as Record<string, unknown> | null;
  if (!f || typeof f !== 'object' || f.format !== 'smallhours-profiles') throw new Error('Not a Small Hours profile file');
  let lib = emptyLibrary();
  if (f.version === 1) {
    if (!Array.isArray(f.profiles) || f.profiles.length > MAX_PROFILES) throw new Error('Not a Small Hours profile file');
    for (const p of f.profiles as unknown[]) {
      const o = p as { name?: unknown; values?: unknown } | null;
      const name = cleanName(o?.name);
      if (!name || !o?.values || typeof o.values !== 'object') throw new Error('Malformed profile');
      for (const k of PROFILE_KEYS) if (own(o.values, k) && !isNum((o.values as Record<string, unknown>)[k])) throw new Error(`Bad value for ${k}`);
      for (const kind of ['printers', 'materials', 'shops'] as const)
        lib = upsertItem(lib, kind, { name, values: readValues(kind, o.values) } as never);
    }
    return lib;
  }
  if (f.version !== 2) throw new Error('Unsupported profile file version');
  for (const kind of ['printers', 'materials', 'shops'] as const) {
    const list = own(f, kind) ? f[kind] : [];
    if (!Array.isArray(list) || list.length > MAX_PROFILES) throw new Error('Malformed profile file');
    for (const p of list as unknown[]) {
      const o = p as { name?: unknown; values?: unknown; match?: unknown } | null;
      const name = cleanName(o?.name);
      if (!name) throw new Error('Malformed entry');
      if (o?.match !== undefined && typeof o.match !== 'string') throw new Error('Malformed entry');
      lib = upsertItem(lib, kind, { name, values: readValues(kind, o?.values), match: o?.match } as never);
    }
  }
  return lib;
}
