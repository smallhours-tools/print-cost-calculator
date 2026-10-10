// Written by an AI agent (Claude). Every committed file in test-corpus/slicer-matrix/ (our own models,
// sliced by real PrusaSlicer, Bambu Studio and OrcaSlicer installs) must give the numbers the slicer
// itself stated, or be rejected with the exact message the manifest expects (hq t044).
import { describe, expect, it } from 'vitest';
import { readFileSync } from 'node:fs';
import { parseFile, ParseError } from './parsers/index';

interface CorpusFile {
  file: string;
  committed: boolean;
  stated_weight_g: number | null;
  stated_time_s: number | null;
  expect: 'parse' | 'reject';
  expect_slicer: string | null;
  reject_message: string | null;
}

const DIR = new URL('../test-corpus/slicer-matrix/', import.meta.url);
const manifest = JSON.parse(readFileSync(new URL('manifest.json', DIR), 'utf8')) as { files: CorpusFile[] };
const committed = manifest.files.filter((f) => f.committed);
const load = (name: string) => new Uint8Array(readFileSync(new URL(`files/${name}`, DIR)));

describe('slicer-matrix corpus', () => {
  it('has files from all three slicers, including rejections', () => {
    expect(new Set(committed.map((f) => f.file[0]))).toEqual(new Set(['P', 'B', 'O']));
    expect(committed.some((f) => f.expect === 'reject')).toBe(true);
  });

  for (const f of committed.filter((f) => f.expect === 'parse')) {
    it(`${f.file}: matches the slicer's own weight and time`, async () => {
      const r = await parseFile(load(f.file));
      expect(r.slicer).toBe(f.expect_slicer);
      expect(Math.abs((r.totalWeightG ?? NaN) - f.stated_weight_g!)).toBeLessThanOrEqual(0.01);
      expect(Math.abs((r.printTimeSeconds ?? NaN) - f.stated_time_s!)).toBeLessThanOrEqual(1);
      expect(r.warnings.filter((w) => /No print time|No filament/.test(w))).toEqual([]);
    });
  }

  for (const f of committed.filter((f) => f.expect === 'reject')) {
    it(`${f.file}: is rejected with the manifest's message`, async () => {
      const err = await parseFile(load(f.file)).then(() => null, (e: unknown) => e);
      expect(err).toBeInstanceOf(ParseError);
      expect((err as Error).message).toBe(f.reject_message);
    });
  }
});
