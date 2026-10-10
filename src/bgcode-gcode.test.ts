import { readdirSync, readFileSync } from 'node:fs';
import { join } from 'node:path';
import { describe, expect, it } from 'vitest';
import { bgcodeFeatureLengths, heatshrinkDecode, MeatPackDecoder } from './parsers/bgcode-gcode';
import { parseBgcode } from './parsers/bgcode';

// Written by an AI agent (Claude), hq t041: .bgcode G-code block decoding.
class Bits {
  bytes: number[] = []; n = 0;
  put(v: number, k: number) {
    for (let i = k - 1; i >= 0; i--) {
      if (this.n % 8 === 0) this.bytes.push(0);
      this.bytes[this.bytes.length - 1] |= ((v >> i) & 1) << (7 - (this.n % 8));
      this.n++;
    }
  }
}
const lit = (b: Bits, s: string) => { for (const c of s) { b.put(1, 1); b.put(c.charCodeAt(0), 8); } };

describe('heatshrinkDecode', () => {
  it('decodes literals and back-references', () => {
    const b = new Bits();
    lit(b, 'G1 X');
    b.put(0, 1); b.put(3, 12); b.put(5, 4); // copy 6 bytes from 4 back: "G1 XG1"
    const out = heatshrinkDecode(Uint8Array.from(b.bytes), 12, 4, 10);
    expect(new TextDecoder().decode(out)).toBe('G1 XG1 XG1');
  });
  it('rejects a reference before the start', () => {
    const b = new Bits();
    b.put(0, 1); b.put(9, 11); b.put(0, 4);
    expect(() => heatshrinkDecode(Uint8Array.from(b.bytes), 11, 4, 4)).toThrow('Corrupt');
  });
});

describe('MeatPackDecoder', () => {
  it('unpacks nibbles, full bytes and the no-spaces mode, across chunk boundaries', () => {
    // enable packing, no-spaces; "G1X5E.2\n": G=13 1=1 X=14 5=5 E=11(no-spaces) .=10 2=2 \n=12
    const bytes = [0xff, 0xff, 251, 0xff, 0xff, 247, 13 | (1 << 4), 14 | (5 << 4), 11 | (10 << 4), 2 | (12 << 4),
      15 | (12 << 4), 0x4d /* M */, 15 | (15 << 4), 0x3b /* ; */, 0x41 /* A */, 0xff, 0xff, 250, 0x5a /* Z */];
    for (const cut of [0, 1, 5, 7, 11, 13, 16]) {
      const d = new MeatPackDecoder();
      const text = d.decode(Uint8Array.from(bytes.slice(0, cut))) + d.decode(Uint8Array.from(bytes.slice(cut)));
      expect(text).toBe('G1X5E.2\nM\n;AZ');
    }
  });
});

// A minimal .bgcode: header, one uncompressed metadata block, one G-code block (heatshrink 12/4, plain text).
function bgcode(gcode: string, meta: string): Uint8Array {
  const out: number[] = [...'GCDE'].map((c) => c.charCodeAt(0));
  const u32 = (v: number) => out.push(v & 255, (v >> 8) & 255, (v >> 16) & 255, (v >>> 24) & 255);
  const u16 = (v: number) => out.push(v & 255, (v >> 8) & 255);
  u32(1); u16(0);
  const m = new TextEncoder().encode(meta);
  u16(4); u16(0); u32(m.length); u16(0); out.push(...m);
  const b = new Bits(); lit(b, gcode);
  u16(1); u16(3); u32(gcode.length); u32(b.bytes.length); u16(0); out.push(...b.bytes);
  return Uint8Array.from(out);
}

describe('bgcodeFeatureLengths', () => {
  it('sums features from heatshrink-compressed G-code blocks', async () => {
    const f = bgcode('M83\n;TYPE:Perimeter\nG1 X1 E2\n;TYPE:Internal infill\nG1 Y1 E1\n', 'filament used [mm]=3.00\nfilament used [g]=0.01\n');
    expect(await bgcodeFeatureLengths(f)).toEqual({ walls: 2, sparse: 1 });
    expect((await parseBgcode(f)).filaments[0].lengthMm).toBe(3);
  });
});

// Optional real-file check, like features.test.ts: REAL_GCODE_DIR=<dir> npx vitest run src/bgcode-gcode.test.ts
const dir = process.env.REAL_GCODE_DIR;
describe.skipIf(!dir)('bgcodeFeatureLengths on real files', () => {
  for (const f of dir ? readdirSync(dir).filter((n) => n.endsWith('.bgcode')) : []) {
    it(f, async () => {
      const bytes = new Uint8Array(readFileSync(join(dir!, f)));
      const stated = (await parseBgcode(bytes)).filaments[0]?.lengthMm;
      const t = Date.now();
      const l = await bgcodeFeatureLengths(bytes);
      const sum = Object.values(l).reduce((s, v) => s + v, 0);
      console.log(`${f}: stated ${stated} mm, summed ${sum.toFixed(1)} mm in ${Date.now() - t} ms; ${Object.entries(l).map(([k, v]) => `${k}=${v.toFixed(1)}`).join(' ')}`);
      expect(Math.abs(sum / stated! - 1)).toBeLessThan(0.025);
    });
  }
});

describe('bgcodeFeatureLengths on corrupt input', () => {
  it('only ever returns or throws ParseError (seeded mutations)', async () => {
    const base = bgcode('M83\n;TYPE:Perimeter\nG1 X1 E2\n'.repeat(20), 'filament used [mm]=40\n');
    let seed = 7;
    const rnd = () => ((seed = (seed * 1103515245 + 12345) & 0x7fffffff) / 0x7fffffff);
    for (let n = 0; n < 400; n++) {
      const f = base.slice();
      for (let k = 0; k < 1 + Math.floor(rnd() * 4); k++) f[Math.floor(rnd() * f.length)] = Math.floor(rnd() * 256);
      try { await bgcodeFeatureLengths(f); } catch (e) { expect((e as Error).constructor.name).toBe('ParseError'); }
    }
  });
});
