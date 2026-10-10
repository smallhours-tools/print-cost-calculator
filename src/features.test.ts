import { readdirSync, readFileSync } from 'node:fs';
import { join } from 'node:path';
import { describe, expect, it } from 'vitest';
import { featureGroup, featureLengths, featureLengthsFromBytes, featureSummary } from './parsers/features';

// Written by an AI agent (Claude): per-feature extrusion sums (hq t036).
describe('featureLengths', () => {
  it('sums relative extrusion per group and skips unretracts and travel', () => {
    const g = ['M83', ';TYPE:External perimeter', 'G1 X1 Y1 E1.5', 'G1 E-0.8', 'G1 E0.8', ';TYPE:Internal infill', 'G1 X2 E2', 'G0 X3 Y3', ';TYPE:Solid infill', 'G1 Y4 E0.25 ; comment'].join('\n');
    expect(featureLengths(g)).toEqual({ walls: 1.5, sparse: 2, solid: 0.25 });
  });
  it('handles absolute extrusion and G92 resets', () => {
    const g = ['M82', ';TYPE:Perimeter', 'G92 E0', 'G1 X1 E1', 'G1 X2 E3', 'G92 E0', ';TYPE:Wipe tower', 'G1 X3 E4'].join('\n');
    expect(featureLengths(g)).toEqual({ walls: 3, tower: 4 });
  });
  it('maps Orca names and unknown types', () => {
    expect([featureGroup('Outer wall'), featureGroup('Sparse infill'), featureGroup('Prime tower'), featureGroup('Support'), featureGroup('Skirt/Brim'), featureGroup('Custom')]).toEqual(['walls', 'sparse', 'tower', 'support', 'other', 'other']);
  });
  it('is empty without ;TYPE: comments', () => expect(featureLengths('G1 X1 E1\n')).toEqual({}));
});

// Optional check on real files (not committed, licences vary). Run with
// REAL_GCODE_DIR=/path/to/files npx vitest run src/features.test.ts
// Each single-extruder file's group sums must match its own `filament used [mm]` line within 2.5%.
const dir = process.env.REAL_GCODE_DIR;
describe.skipIf(!dir)('featureLengths on real files', () => {
  for (const f of dir ? readdirSync(dir).filter((n) => n.endsWith('.gcode')) : []) {
    it(f, () => {
      const text = readFileSync(join(dir!, f), 'utf8');
      const stated = text.match(/^; filament used \[mm\] = ([\d., ]+)$/m);
      // Single-extruder files only: MMU tool changes (loading/ramming) don't match the stated totals.
      if (!stated || stated[1].split(',').filter((v) => parseFloat(v) > 0).length !== 1) return;
      const sum = Object.values(featureLengths(text)).reduce((s, v) => s + v, 0);
      const parts = Object.entries(featureLengths(text)).map(([k, v]) => `${k}=${v.toFixed(1)}`).join(' ');
      console.log(`${f}: stated ${stated[1]} mm, summed ${sum.toFixed(1)} mm; ${parts}`);
      expect(Math.abs(sum / parseFloat(stated[1]) - 1)).toBeLessThan(0.025);
    });
  }
});

describe('streaming and summary', () => {
  const g = ['M83', ';TYPE:External perimeter', 'G1 X1 Y1 E3', ';TYPE:Internal infill', 'G1 X2 E1', '; FEATURE: Outer wall', 'G1 X3 E2', ';TYPE:Solid infill', 'G1 X4 E2'].join('\n');
  it('gives the same result for any chunk size', () => {
    const bytes = new TextEncoder().encode(g);
    for (const n of [1, 2, 7, 1000]) expect(featureLengthsFromBytes(bytes, n)).toEqual({ walls: 5, sparse: 1, solid: 2 });
  });
  it('reads Bambu-style FEATURE comments', () => expect(featureLengths('M83\n; FEATURE: Sparse infill\nG1 X1 E2\n; FEATURE: Prime tower\nG1 Y1 E1\n')).toEqual({ sparse: 2, tower: 1 }));
  it('summarises biggest first as grams and shares', () => {
    expect(featureSummary({ walls: 5, sparse: 1, solid: 2 }, 16, 8)).toBe('walls 10.0 g (63%), solid layers 4.0 g (25%), sparse infill 2.0 g (13%)');
  });
  it('says nothing when sums disagree with the stated length, or there is nothing to say', () => {
    expect(featureSummary({ walls: 5 }, 10, 6)).toBeUndefined();
    expect(featureSummary({ walls: 5 }, 10, 5.2)).toBe('walls 10.0 g (100%)');
    expect(featureSummary({}, 10)).toBeUndefined();
    expect(featureSummary({ walls: 999, other: 1 }, 10)).toBe('walls 10.0 g (100%)');
    expect(featureSummary({ walls: 5 }, 0)).toBeUndefined();
  });
});
