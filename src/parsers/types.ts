export type Slicer = 'bambu' | 'orca' | 'prusa' | 'cura' | 'unknown';

export interface FilamentUsage {
  /** Filament material, e.g. "PLA", when the file says so. */
  type?: string;
  weightG?: number;
  lengthMm?: number;
  /** True when weightG was derived from length (not read from the file). */
  weightEstimated?: boolean;
}

export interface ParsedFile {
  slicer: Slicer;
  printTimeSeconds?: number;
  filaments: FilamentUsage[];
  /** Sum of known filament weights, in grams. Undefined if none known. */
  totalWeightG?: number;
  /** Human-readable notes (never contain file text beyond numbers). */
  warnings: string[];
}

export class ParseError extends Error {}
