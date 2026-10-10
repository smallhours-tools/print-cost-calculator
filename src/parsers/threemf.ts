import type { FilamentUsage, ParsedFile } from './types';
import { ParseError, cleanLabel } from './types';
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

/**
 * OrcaSlicer writes Bambu Studio's 3MF layout (even `Application: BambuStudio-…` in 3D/3dmodel.model),
 * but adds an `OrcaSlicer-Version` header item to slice_info.config. Anything else stays 'bambu'.
 */
export function sliceInfoSlicer(xml: string): 'bambu' | 'orca' {
  return /<header_item\b[^>]*\bkey\s*=\s*"OrcaSlicer-Version"/.test(xml) ? 'orca' : 'bambu';
}

const MAX_PROJECT_SETTINGS_BYTES = 4 * 1024 * 1024;

/** Printer model and preset from Metadata/project_settings.config (JSON in Bambu Studio / OrcaSlicer 3MFs). */
export function parseProjectSettings(json: string): Pick<ParsedFile, 'printerModel' | 'printerPreset'> {
  try {
    const o = JSON.parse(json) as Record<string, unknown>;
    if (!o || typeof o !== 'object') return {};
    return { printerModel: cleanLabel(o.printer_model), printerPreset: cleanLabel(o.printer_settings_id) };
  } catch {
    return {};
  }
}

export async function parse3mf(bytes: Uint8Array): Promise<ParsedFile> {
  const entries = listZip(bytes);
  const dec = new TextDecoder();
  const info = entries.find((e) => e.name === 'Metadata/slice_info.config');
  if (info) {
    const infoXml = dec.decode(await info.read());
    const { printTimeSeconds, filaments, plates } = parseSliceInfo(infoXml);
    if (filaments.length || printTimeSeconds !== undefined) {
      const warnings: string[] = [];
      if (plates > 1) warnings.push(`This project has ${plates} sliced plates. Time and filament are totals for all of them.`);
      if (!filaments.length) warnings.push('No filament usage found in this file. Enter it manually.');
      if (printTimeSeconds === undefined) warnings.push('No print time found in this file. Enter it manually.');
      const settings = entries.find((e) => e.name === 'Metadata/project_settings.config' && e.size <= MAX_PROJECT_SETTINGS_BYTES);
      const printer = settings ? parseProjectSettings(dec.decode(await settings.read().catch(() => new Uint8Array()))) : {};
      return { slicer: sliceInfoSlicer(infoXml), printTimeSeconds, filaments, totalWeightG: sumWeights(filaments), ...printer, warnings };
    }
  }
  // Bambu/Orca plate G-code, else any G-code in the package (UltiMaker .ufp keeps it at /3D/model.gcode).
  const gcode =
    entries.find((e) => /^Metadata\/plate_\d+\.gcode$/.test(e.name)) ?? entries.find((e) => /\.gcode$/i.test(e.name));
  if (gcode) {
    const r = parseGcodeText(dec.decode(await gcode.read()));
    return r.slicer === 'unknown' ? { ...r, slicer: 'bambu' } : r;
  }
  throw new ParseError(unslicedMessage(entries.map((e) => e.name)));
}

/**
 * Explain why a 3MF without print results can't be priced, based on which slicer wrote it.
 * Full sentences: the UI shows them as-is, followed by the manual-entry hint.
 * Bambu/Orca are checked first: their exports also carry 3D/3dmodel.model.
 */
export function unslicedMessage(names: string[]): string {
  const has = (n: string) => names.includes(n);
  if (has('Metadata/project_settings.config') || has('Metadata/model_settings.config') || has('Metadata/slice_info.config'))
    return (
      "This Bambu Studio / OrcaSlicer project hasn't been sliced, so it has no print time or filament use yet. " +
      'Slice it and save the project, or use File > Export > Export plate sliced file, then drop that in.'
    );
  if (has('Metadata/Slic3r_PE.config') || has('Metadata/Slic3r_PE_model.config'))
    return "PrusaSlicer project files don't store print results. Slice it, export G-code (.gcode or .bgcode) and drop that in.";
  if (names.some((n) => n.startsWith('Cura/')))
    return "Cura project files don't store print results. Slice it, save the G-code (or a .ufp) and drop that in.";
  return 'This is a 3D model, not a sliced file. Open it in your slicer, slice it, and drop in the exported G-code or sliced 3MF.';
}
