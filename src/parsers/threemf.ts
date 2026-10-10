import type { FilamentUsage, ParsedFile } from './types';
import { ParseError } from './types';
import { parseGcodeText, sumWeights } from './gcode';
import { listZip } from './zip';

function attrs(tag: string): Record<string, string> {
  const out: Record<string, string> = {};
  for (const m of tag.matchAll(/([\w:-]+)\s*=\s*"([^"]*)"/g)) out[m[1]] = m[2];
  return out;
}

/**
 * Parse Metadata/slice_info.config from Bambu Studio / OrcaSlicer 3MF exports.
 * A project can have several sliced plates; time and filament are totalled across all of them.
 */
export function parseSliceInfo(xml: string): Pick<ParsedFile, 'printTimeSeconds' | 'filaments'> & { plates: number } {
  let printTimeSeconds: number | undefined;
  let plates = 0;
  const filaments: FilamentUsage[] = [];
  for (const m of xml.matchAll(/<metadata\b[^>]*>/g)) {
    const a = attrs(m[0]);
    if (a.key === 'prediction') {
      const v = parseFloat(a.value);
      if (Number.isFinite(v)) {
        printTimeSeconds = (printTimeSeconds ?? 0) + Math.round(v);
        plates++;
      }
    }
  }
  for (const m of xml.matchAll(/<filament\b[^>]*>/g)) {
    const a = attrs(m[0]);
    const f: FilamentUsage = {};
    if (a.type) f.type = a.type;
    const g = parseFloat(a.used_g);
    if (Number.isFinite(g)) f.weightG = g;
    const meters = parseFloat(a.used_m);
    if (Number.isFinite(meters)) f.lengthMm = meters * 1000;
    if (f.weightG !== undefined || f.lengthMm !== undefined) filaments.push(f);
  }
  return { printTimeSeconds, filaments, plates };
}

export async function parse3mf(bytes: Uint8Array): Promise<ParsedFile> {
  const entries = listZip(bytes);
  const dec = new TextDecoder();
  const info = entries.find((e) => e.name === 'Metadata/slice_info.config');
  if (info) {
    const { printTimeSeconds, filaments, plates } = parseSliceInfo(dec.decode(await info.read()));
    if (filaments.length || printTimeSeconds !== undefined) {
      const warnings: string[] = [];
      if (plates > 1) warnings.push(`This project has ${plates} sliced plates. Time and filament are totals for all of them.`);
      if (!filaments.length) warnings.push('No filament usage found in this file. Enter it manually.');
      if (printTimeSeconds === undefined) warnings.push('No print time found in this file. Enter it manually.');
      return { slicer: 'bambu', printTimeSeconds, filaments, totalWeightG: sumWeights(filaments), warnings };
    }
  }
  // Bambu/Orca plate G-code, else any G-code in the package (UltiMaker .ufp keeps it at /3D/model.gcode).
  const gcode =
    entries.find((e) => /^Metadata\/plate_\d+\.gcode$/.test(e.name)) ?? entries.find((e) => /\.gcode$/i.test(e.name));
  if (gcode) {
    const r = parseGcodeText(dec.decode(await gcode.read()));
    return r.slicer === 'unknown' ? { ...r, slicer: 'bambu' } : r;
  }
  throw new ParseError('This 3MF has no print metadata. Export a sliced 3MF (or G-code) from your slicer, or enter values manually.');
}
