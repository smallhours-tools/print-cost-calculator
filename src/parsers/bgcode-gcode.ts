// Written by an AI agent (Claude), hq t041: decodes the G-code blocks of a Prusa binary G-code file
// (.bgcode) so the per-feature filament split also works for it. Written from the format description in
// https://github.com/prusa3d/libbgcode (doc/specifications.md): no code copied.
// Block compression: 0 none, 1 deflate, 2 heatshrink (window 11, lookahead 4), 3 heatshrink (12, 4).
// G-code block encoding parameter: 0 plain, 1 MeatPack, 2 MeatPack keeping comments.
import { ParseError } from './types';
import { inflate } from './zip';
import { FeatureCounter, type FeatureGroup } from './features';

const BLOCK_GCODE = 1;
const BLOCK_THUMBNAIL = 5;
const MAX_BLOCK_BYTES = 16 * 1024 * 1024;

/** Heatshrink LZSS decoder: tag bit 1 = literal byte, 0 = back-reference (index, count; both stored minus 1). */
export function heatshrinkDecode(src: Uint8Array, windowBits: number, lookaheadBits: number, outSize: number): Uint8Array {
  const out = new Uint8Array(outSize);
  let n = 0;
  let pos = 0; // bit position
  const total = src.length * 8;
  const bits = (k: number): number => {
    if (pos + k > total) return -1;
    let v = 0;
    for (let i = 0; i < k; i++, pos++) v = (v << 1) | ((src[pos >> 3] >> (7 - (pos & 7))) & 1);
    return v;
  };
  while (n < outSize) {
    const tag = bits(1);
    if (tag < 0) break;
    if (tag === 1) {
      const b = bits(8);
      if (b < 0) break;
      out[n++] = b;
    } else {
      const idx = bits(windowBits);
      const cnt = bits(lookaheadBits);
      if (idx < 0 || cnt < 0) break;
      const back = idx + 1;
      if (back > n) throw new ParseError('Corrupt .bgcode file');
      for (let c = 0; c <= cnt && n < outSize; c++, n++) out[n] = out[n - back];
    }
  }
  return n === outSize ? out : out.subarray(0, n);
}

// MeatPack: two 4-bit codes per byte (low nibble first); 0b1111 means "a full byte follows".
// 0xFF 0xFF <cmd> switches modes; in no-spaces mode code 11 stands for 'E' instead of ' '.
const MP_CODES = [...'0123456789. \nGX'].map((c) => c.charCodeAt(0));
const LATIN1 = new TextDecoder('latin1');
export class MeatPackDecoder {
  private packing = false;
  private noSpaces = false;
  private pending: number[] = [];

  decode(src: Uint8Array): string {
    const data = this.pending.length ? Uint8Array.from([...this.pending, ...src]) : src;
    this.pending = [];
    const out = new Uint8Array(data.length * 2);
    let n = 0;
    let i = 0;
    while (i < data.length) {
      const b = data[i];
      if (b === 0xff && i + 1 >= data.length) { this.pending = [b]; break; }
      if (b === 0xff && data[i + 1] === 0xff) {
        if (i + 2 >= data.length) { this.pending = [...data.subarray(i)]; break; }
        const cmd = data[i + 2];
        if (cmd === 251) this.packing = true;
        else if (cmd === 250) this.packing = false;
        else if (cmd === 247) this.noSpaces = true;
        else if (cmd === 246) this.noSpaces = false;
        else if (cmd === 249) { this.packing = false; this.noSpaces = false; }
        i += 3;
        continue;
      }
      if (!this.packing) { out[n++] = b; i++; continue; }
      const lo = b & 15, hi = b >> 4;
      const need = (lo === 15 ? 1 : 0) + (hi === 15 ? 1 : 0);
      if (i + need >= data.length) { this.pending = [...data.subarray(i)]; break; }
      i++;
      out[n++] = lo === 15 ? data[i++] : this.code(lo);
      out[n++] = hi === 15 ? data[i++] : this.code(hi);
    }
    return LATIN1.decode(out.subarray(0, n));
  }

  private code(c: number): number {
    return this.noSpaces && c === 11 ? 69 /* E */ : MP_CODES[c];
  }
}

/** Calls onText with the decoded G-code of each G-code block, in order. */
export async function forEachBgcodeGcode(bytes: Uint8Array, onText: (text: string) => void): Promise<void> {
  const d = new DataView(bytes.buffer, bytes.byteOffset, bytes.byteLength);
  const checksumBytes = d.getUint16(8, true) === 1 ? 4 : 0;
  const dec = new TextDecoder();
  const mp = new MeatPackDecoder();
  let o = 10;
  let blocks = 0;
  while (o + 8 <= bytes.length) {
    // Let the page breathe on big files (a 7-hour print has ~400 blocks).
    if (++blocks % 32 === 0) await new Promise((r) => setTimeout(r, 0));
    const type = d.getUint16(o, true);
    const compression = d.getUint16(o + 2, true);
    const usize = d.getUint32(o + 4, true);
    o += 8;
    let size = usize;
    if (compression !== 0) {
      if (o + 4 > bytes.length) break;
      size = d.getUint32(o, true);
      o += 4;
    }
    const paramBytes = type === BLOCK_THUMBNAIL ? 6 : 2;
    if (o + paramBytes + size > bytes.length) throw new ParseError('Corrupt .bgcode file');
    const encoding = d.getUint16(o, true);
    o += paramBytes;
    if (type === BLOCK_GCODE) {
      if (usize > MAX_BLOCK_BYTES) throw new ParseError('Corrupt .bgcode file');
      const raw = bytes.subarray(o, o + size);
      let data: Uint8Array;
      if (compression === 0) data = raw;
      else if (compression === 1) data = await inflate(raw, usize + 1024, 'deflate');
      else if (compression === 2 || compression === 3) data = heatshrinkDecode(raw, compression === 2 ? 11 : 12, 4, usize);
      else throw new ParseError('Unsupported .bgcode compression');
      onText(encoding === 1 || encoding === 2 ? mp.decode(data) : dec.decode(data, { stream: true }));
    }
    o += size + checksumBytes;
  }
}

/** Per-feature filament lengths of a .bgcode file (see features.ts). */
export async function bgcodeFeatureLengths(bytes: Uint8Array): Promise<Partial<Record<FeatureGroup, number>>> {
  const c = new FeatureCounter();
  await forEachBgcodeGcode(bytes, (t) => c.push(t));
  return c.lengths();
}
