// Written by an AI agent (Claude): sums extrusion per feature from PrusaSlicer/OrcaSlicer-style
// `;TYPE:` comments (hq t036). Only moves with X or Y count, so retract/unretract pairs don't
// inflate the totals; on real files the sum matches the slicer's own `filament used [mm]`.

export type FeatureGroup = 'walls' | 'solid' | 'sparse' | 'tower' | 'support' | 'other';

const GROUPS: Record<string, FeatureGroup> = {
  'perimeter': 'walls',
  'external perimeter': 'walls',
  'overhang perimeter': 'walls',
  'outer wall': 'walls',
  'inner wall': 'walls',
  'overhang wall': 'walls',
  'solid infill': 'solid',
  'top solid infill': 'solid',
  'bridge infill': 'solid',
  'internal solid infill': 'solid',
  'top surface': 'solid',
  'bottom surface': 'solid',
  'bridge': 'solid',
  'internal bridge': 'solid',
  'ironing': 'solid',
  'internal infill': 'sparse',
  'sparse infill': 'sparse',
  'wipe tower': 'tower',
  'prime tower': 'tower',
  'support material': 'support',
  'support material interface': 'support',
  'support': 'support',
  'support interface': 'support',
  'support transition': 'support',
};

export const featureGroup = (type: string): FeatureGroup => GROUPS[type.trim().toLowerCase()] ?? 'other';

/** Filament length (mm) extruded per feature group. Empty when the file has no `;TYPE:` comments. */
export function featureLengths(text: string): Partial<Record<FeatureGroup, number>> {
  const out: Partial<Record<FeatureGroup, number>> = {};
  let relative = false;
  let lastE = 0;
  let group: FeatureGroup | null = null;
  for (const raw of text.split('\n')) {
    if (raw.startsWith(';TYPE:')) {
      group = featureGroup(raw.slice(6));
      continue;
    }
    const line = raw.split(';')[0].trim();
    if (!line) continue;
    const cmd = line.split(/\s+/)[0].toUpperCase();
    if (cmd === 'M83') relative = true;
    else if (cmd === 'M82') relative = false;
    else if (cmd === 'G92') {
      const m = /E(-?[\d.]+)/i.exec(line);
      if (m) lastE = parseFloat(m[1]);
    } else if (cmd === 'G0' || cmd === 'G1' || cmd === 'G2' || cmd === 'G3') {
      const m = /E(-?[\d.]+)/i.exec(line);
      if (!m) continue;
      const e = parseFloat(m[1]);
      const d = relative ? e : e - lastE;
      if (!relative) lastE = e;
      if (d > 0 && group && /[XY]/i.test(line)) out[group] = (out[group] ?? 0) + d;
    }
  }
  return out;
}
