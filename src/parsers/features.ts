// Written by an AI agent (Claude): sums extrusion per feature from PrusaSlicer/OrcaSlicer `;TYPE:` and
// Bambu Studio `; FEATURE:` comments (hq t036, t039). Only moves with X or Y count, so retract/unretract
// pairs don't inflate the totals; on real single-extruder files the sum matches the slicer's own
// `filament used [mm]`.

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

const FEATURE = /^;\s*(?:TYPE|FEATURE):(.*)$/;
const E = /E(-?\d*\.?\d+)/i;

/** Streaming accumulator: push text in any chunks, then read lengths(). */
export class FeatureCounter {
  private relative = false;
  private lastE = 0;
  private group: FeatureGroup | null = null;
  private rest = '';
  private out: Partial<Record<FeatureGroup, number>> = {};

  push(chunk: string): void {
    const text = this.rest + chunk;
    let start = 0;
    for (let nl = text.indexOf('\n'); nl !== -1; nl = text.indexOf('\n', start)) {
      this.line(text.slice(start, nl));
      start = nl + 1;
    }
    this.rest = text.slice(start);
  }

  /** Filament length (mm) per feature group. Empty when the file has no feature comments. */
  lengths(): Partial<Record<FeatureGroup, number>> {
    if (this.rest) { this.line(this.rest); this.rest = ''; }
    return { ...this.out };
  }

  private line(raw: string): void {
    if (raw.charCodeAt(0) === 59 /* ; */) {
      const m = FEATURE.exec(raw.trimEnd());
      if (m) this.group = featureGroup(m[1]);
      return;
    }
    const semi = raw.indexOf(';');
    const line = (semi === -1 ? raw : raw.slice(0, semi)).trim();
    if (!line) return;
    const cmd = line.split(/\s+/)[0].toUpperCase();
    if (cmd === 'M83') this.relative = true;
    else if (cmd === 'M82') this.relative = false;
    else if (cmd === 'G92') {
      const m = E.exec(line);
      if (m) this.lastE = parseFloat(m[1]);
    } else if (cmd === 'G0' || cmd === 'G1' || cmd === 'G2' || cmd === 'G3') {
      const m = E.exec(line);
      if (!m) return;
      const e = parseFloat(m[1]);
      const d = this.relative ? e : e - this.lastE;
      if (!this.relative) this.lastE = e;
      if (d > 0 && this.group && /[XY]/i.test(line)) this.out[this.group] = (this.out[this.group] ?? 0) + d;
    }
  }
}

/** Filament length (mm) extruded per feature group. Empty when the file has no feature comments. */
export function featureLengths(text: string): Partial<Record<FeatureGroup, number>> {
  const c = new FeatureCounter();
  c.push(text);
  return c.lengths();
}

/** Same, from file bytes, decoded in chunks so large files never become one big string. */
export function featureLengthsFromBytes(bytes: Uint8Array, chunk = 4 << 20): Partial<Record<FeatureGroup, number>> {
  const dec = new TextDecoder();
  const c = new FeatureCounter();
  for (let i = 0; i < bytes.length; i += chunk) c.push(dec.decode(bytes.subarray(i, i + chunk), { stream: i + chunk < bytes.length }));
  return c.lengths();
}

const LABELS: Record<FeatureGroup, string> = {
  walls: 'walls', solid: 'solid layers', sparse: 'sparse infill', tower: 'wipe tower', support: 'supports', other: 'other',
};

/**
 * One line for the result: "walls 6.8 g (56%), solid layers ...", biggest first, shares of the file's weight.
 * Undefined when there is nothing to show, or when the sums disagree with the slicer's stated length by
 * more than 5% (then something in the file isn't what this counter expects, so it says nothing).
 */
export function featureSummary(lengths: Partial<Record<FeatureGroup, number>>, totalWeightG: number, statedLengthMm?: number): string | undefined {
  const entries = (Object.entries(lengths) as [FeatureGroup, number][]).filter(([, v]) => v > 0);
  const sum = entries.reduce((s, [, v]) => s + v, 0);
  if (!(sum > 0) || !(totalWeightG > 0)) return undefined;
  if (statedLengthMm !== undefined && statedLengthMm > 0 && Math.abs(sum / statedLengthMm - 1) > 0.05) return undefined;
  return entries
    .sort((a, b) => b[1] - a[1])
    .map(([k, v]) => `${LABELS[k]} ${(Math.round((totalWeightG * v) / sum * 10) / 10).toFixed(1)} g (${Math.round((100 * v) / sum)}%)`)
    .join(', ');
}
