export type Slicer = 'bambu' | 'orca' | 'prusa' | 'cura' | 'unknown';

export interface FilamentUsage {
  /** Filament material, e.g. "PLA", when the file says so. */
  type?: string;
  weightG?: number;
  lengthMm?: number;
  /** Slicer-reported volume in cm3; used internally to estimate weight, then removed. */
  volumeCm3?: number;
  /** True when weightG was derived from length (not read from the file). */
  weightEstimated?: boolean;
}

export interface ParsedFile {
  slicer: Slicer;
  printTimeSeconds?: number;
  filaments: FilamentUsage[];
  /** Sum of known filament weights, in grams. Undefined if none known. */
  totalWeightG?: number;
  /** Printer model from slicer metadata, e.g. "MK4S" or "Bambu Lab P1S" (cleaned, max 64 chars). */
  printerModel?: string;
  /** Slicer printer preset name, e.g. "Original Prusa MK4S 0.4 nozzle" (cleaned, max 64 chars). */
  printerPreset?: string;
  /** Grams the slicer says went to the wipe tower (already included in totalWeightG). Multi-material only. */
  wipeTowerG?: number;
  /** Human-readable notes (never contain file text beyond numbers). */
  warnings: string[];
}

export class ParseError extends Error {}

/** Make a metadata string safe to show as text and to match on: printable chars only, single spaces, max 64 chars. */
export function cleanLabel(s: unknown): string | undefined {
  if (typeof s !== 'string') return undefined;
  const t = s.replace(/[\p{C}]/gu, ' ').replace(/^["']+|["']+$/g, '').replace(/\s+/g, ' ').trim().slice(0, 64).trim();
  return t || undefined;
}
