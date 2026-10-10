// Pro: batch quoting and CSV export. Pure functions; not wired into the UI until the Pro unlock exists.
// Written by an AI agent (Claude).
import { computeCost, type CostBreakdown } from '../cost';
import { parseFile, type ParsedFile } from '../parsers';
import { defaultValues, type ProfileValues } from './profiles';

export const MAX_BATCH_FILES = 50;

export interface BatchRow {
  /** File name as dropped (display only; sanitised in CSV). */
  file: string;
  quantity: number;
  /** Set when the file could not be parsed. */
  error?: string;
  slicer?: string;
  weightG?: number;
  printTimeHours?: number;
  warnings: string[];
  /** Cost of ONE unit. */
  cost?: CostBreakdown;
}

export interface BatchTotals {
  count: number;
  failed: number;
  weightG: number;
  printTimeHours: number;
  subtotal: number;
  fees: number;
  profit: number;
  price: number;
}

/** Price one already-parsed file with a profile. */
export function priceParsed(file: string, parsed: ParsedFile, profile: ProfileValues, quantity = 1): BatchRow {
  const weightG = parsed.totalWeightG;
  const printTimeHours = parsed.printTimeSeconds === undefined ? undefined : parsed.printTimeSeconds / 3600;
  const warnings = [...parsed.warnings];
  if (weightG === undefined) warnings.push('No filament weight found; material cost is 0.');
  if (printTimeHours === undefined) warnings.push('No print time found; time-based costs are 0.');
  return {
    file, quantity: clampQty(quantity), slicer: parsed.slicer, weightG, printTimeHours, warnings,
    cost: computeCost({ ...defaultValues(), ...profile, weightG: weightG ?? 0, printTimeHours: printTimeHours ?? 0 }),
  };
}

export async function priceFile(file: string, bytes: Uint8Array, profile: ProfileValues, quantity = 1): Promise<BatchRow> {
  try {
    return priceParsed(file, await parseFile(bytes), profile, quantity);
  } catch (e) {
    return { file, quantity: clampQty(quantity), error: e instanceof Error ? e.message : 'Could not read file', warnings: [] };
  }
}

function clampQty(q: number): number {
  return Number.isFinite(q) ? Math.min(Math.max(Math.round(q), 1), 100_000) : 1;
}

export function totals(rows: BatchRow[]): BatchTotals {
  const t: BatchTotals = { count: 0, failed: 0, weightG: 0, printTimeHours: 0, subtotal: 0, fees: 0, profit: 0, price: 0 };
  for (const r of rows) {
    if (!r.cost) { t.failed++; continue; }
    const q = r.quantity;
    t.count += q;
    t.weightG += (r.weightG ?? 0) * q;
    t.printTimeHours += (r.printTimeHours ?? 0) * q;
    t.subtotal += r.cost.subtotal * q;
    t.fees += r.cost.fees * q;
    t.profit += r.cost.profit * q;
    t.price += r.cost.suggestedPrice * q;
  }
  return t;
}

/** Guard against spreadsheet formula injection and CSV quoting problems (file names are attacker-controlled). */
export function csvCell(v: string | number | undefined): string {
  if (v === undefined) return '';
  let s = typeof v === 'number' ? String(Math.round(v * 10000) / 10000) : v.replace(/[\u0000-\u001f\u007f]/g, ' ');
  if (typeof v === 'string' && /^[=+\-@\t\r]/.test(s)) s = "'" + s;
  return /[",\n]/.test(s) || s !== s.trim() ? `"${s.replace(/"/g, '""')}"` : s;
}

const HEADER = ['File', 'Quantity', 'Slicer', 'Weight (g)', 'Print time (h)', 'Material', 'Electricity', 'Wear', 'Labor',
  'Cost per unit', 'Fees per unit', 'Price per unit', 'Line price', 'Notes'];

export function toCsv(rows: BatchRow[]): string {
  const lines = [HEADER.map(csvCell).join(',')];
  for (const r of rows) {
    const c = r.cost;
    const note = r.error ?? r.warnings.join(' ');
    lines.push([
      r.file, r.quantity, r.slicer, r.weightG, r.printTimeHours, c?.material, c?.electricity, c?.wear, c?.labor,
      c?.subtotal, c?.fees, c?.suggestedPrice, c ? c.suggestedPrice * r.quantity : undefined, note,
    ].map((x) => csvCell(x as string | number | undefined)).join(','));
  }
  const t = totals(rows);
  lines.push(['TOTAL', t.count, '', t.weightG, t.printTimeHours, '', '', '', '', t.subtotal, t.fees, '', t.price, ''].map((x) => csvCell(x as string | number)).join(','));
  // CRLF + BOM so Excel opens UTF-8 correctly.
  return '﻿' + lines.join('\r\n') + '\r\n';
}
