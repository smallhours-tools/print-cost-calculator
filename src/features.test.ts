import { readdirSync, readFileSync } from 'node:fs';
import { join } from 'node:path';
import { describe, expect, it } from 'vitest';
import { featureGroup, featureLengths } from './parsers/features';

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
