// Plausibility checks on parsed values (hq t049). Written by an AI agent (Claude).
// Slicers with half-configured profiles write nonsense (density 0, mm³ labelled cm³), so flag values
// outside what real prints produce. These only add warnings; numbers are never changed here.
import type { ParsedFile } from './types';

/** Real files in docs/reference-data.md and our slicer matrix span about 3.7 to 77 g per print hour. */
export const GRAMS_PER_HOUR_MIN = 0.5;
export const GRAMS_PER_HOUR_MAX = 200;
/** Common filaments are 1.0-1.4 g/cm³; filled/metal blends go higher, but nothing prints outside this. */
export const DENSITY_MIN = 0.8;
export const DENSITY_MAX = 2.5;

const CHECK = 'Check the weight and time against your slicer before trusting the price.';

export function implausibleTotals(r: Pick<ParsedFile, 'totalWeightG' | 'printTimeSeconds'>): string[] {
  const g = r.totalWeightG, s = r.printTimeSeconds;
  if (g === undefined || s === undefined || !(g > 0)) return [];
  if (s < 10) return g > 1 ? [`A print time of ${s} s for ${round(g)} g of filament is not plausible. ${CHECK}`] : [];
  const perHour = g / (s / 3600);
  if (perHour < GRAMS_PER_HOUR_MIN || perHour > GRAMS_PER_HOUR_MAX)
    return [`${round(g)} g in ${duration(s)} is ${round(perHour)} g per print hour; real prints use about 3 to 80. ${CHECK}`];
  return [];
}

/** Density implied by a stated weight and length (diameter in mm), in g/cm³. */
export function impliedDensity(weightG: number, lengthMm: number, diameterMm: number): number {
  return weightG / ((Math.PI * (diameterMm / 2) ** 2 * lengthMm) / 1000);
}

export function implausibleDensity(weightG: number, lengthMm: number, diameterMm: number): string | undefined {
  if (!(weightG > 0 && lengthMm > 0 && diameterMm > 0)) return undefined;
  const d = impliedDensity(weightG, lengthMm, diameterMm);
  if (d >= DENSITY_MIN && d <= DENSITY_MAX) return undefined;
  return `The file's filament weight and length imply a density of ${round(d)} g/cm³, which no filament has. Check the filament density (and diameter) in your slicer profile.`;
}

const round = (n: number) => (n >= 10 ? Math.round(n) : Math.round(n * 100) / 100).toString();
function duration(s: number): string {
  const h = Math.floor(s / 3600), m = Math.round((s % 3600) / 60);
  return h ? `${h} h ${m} min` : `${m} min`;
}
