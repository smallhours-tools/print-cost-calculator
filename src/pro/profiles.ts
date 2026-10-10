// Pro: saved printer/material profiles with strict JSON import/export.
// Written by an AI agent (Claude). Pure functions; not wired into the UI until the Pro unlock exists.
import { DEFAULTS, type CostInputs } from '../cost';

/** Fields a profile may carry: everything except the per-file values. */
export const PROFILE_KEYS = [
  'filamentPricePerKg', 'wastePct', 'printerPowerW', 'electricityPerKwh', 'printerCost',
  'printerLifetimeHours', 'maintenancePerHour', 'laborMinutes', 'laborPerHour', 'marginPct', 'feePct', 'feeFixed',
] as const satisfies readonly (keyof CostInputs)[];

export type ProfileValues = Pick<CostInputs, (typeof PROFILE_KEYS)[number]>;
export interface Profile { name: string; values: ProfileValues }
export interface ProfileFile { format: 'smallhours-profiles'; version: 1; profiles: Profile[] }

export const MAX_PROFILES = 100;
export const MAX_IMPORT_BYTES = 200_000;
const MAX_NAME = 60;

const isNum = (v: unknown): v is number => typeof v === 'number' && Number.isFinite(v) && v >= 0 && v <= 1e9;

export function defaultValues(): ProfileValues {
  return Object.fromEntries(PROFILE_KEYS.map((k) => [k, DEFAULTS[k]])) as ProfileValues;
}

/** Trim, collapse whitespace, strip control chars; null if empty. */
export function cleanName(raw: unknown): string | null {
  if (typeof raw !== 'string') return null;
  const s = raw.replace(/[\u0000-\u001f\u007f]/g, ' ').replace(/\s+/g, ' ').trim().slice(0, MAX_NAME);
  return s || null;
}

/** Add or replace (case-insensitive name match). Returns a new list. */
export function upsert(list: Profile[], name: string, values: ProfileValues): Profile[] {
  const n = cleanName(name);
  if (!n) throw new Error('Profile name is required');
  const rest = list.filter((p) => p.name.toLowerCase() !== n.toLowerCase());
  if (rest.length >= MAX_PROFILES) throw new Error('Too many profiles');
  return [...rest, { name: n, values: { ...values } }].sort((a, b) => a.name.localeCompare(b.name));
}

export const remove = (list: Profile[], name: string): Profile[] =>
  list.filter((p) => p.name.toLowerCase() !== name.toLowerCase());

export function exportProfiles(list: Profile[]): string {
  const file: ProfileFile = { format: 'smallhours-profiles', version: 1, profiles: list };
  return JSON.stringify(file, null, 2);
}

/** Parse an exported file. Unknown keys are dropped, bad values reject the whole file. */
export function importProfiles(text: string): Profile[] {
  if (text.length > MAX_IMPORT_BYTES) throw new Error('File too large');
  let data: unknown;
  try { data = JSON.parse(text); } catch { throw new Error('Not valid JSON'); }
  const f = data as Partial<ProfileFile> | null;
  if (!f || typeof f !== 'object' || f.format !== 'smallhours-profiles' || f.version !== 1 || !Array.isArray(f.profiles))
    throw new Error('Not a Small Hours profile file');
  if (f.profiles.length > MAX_PROFILES) throw new Error('Too many profiles');
  let out: Profile[] = [];
  for (const p of f.profiles as unknown[]) {
    const o = p as { name?: unknown; values?: Record<string, unknown> } | null;
    const name = cleanName(o?.name);
    if (!name || !o?.values || typeof o.values !== 'object') throw new Error('Malformed profile');
    const values = defaultValues();
    for (const k of PROFILE_KEYS) {
      const v = Object.prototype.hasOwnProperty.call(o.values, k) ? o.values[k] : undefined;
      if (v === undefined) continue;
      if (!isNum(v)) throw new Error(`Bad value for ${k}`);
      values[k] = v;
    }
    out = upsert(out, name, values);
  }
  return out;
}
