import { ParseError } from './types';

const MAX_ENTRY_BYTES = 256 * 1024 * 1024; // zip-bomb guard

export interface ZipEntry {
  name: string;
  /** Uncompressed size as declared by the archive (read() never returns more than this + 1 KB). */
  size: number;
  read(): Promise<Uint8Array>;
}

const u16 = (d: DataView, o: number) => d.getUint16(o, true);
const u32 = (d: DataView, o: number) => d.getUint32(o, true);
const u64 = (d: DataView, o: number) => Number(d.getBigUint64(o, true));
const MAX32 = 0xffffffff;

export async function inflate(data: Uint8Array, limit: number, format: CompressionFormat = 'deflate-raw'): Promise<Uint8Array> {
  const stream = new Blob([data as BlobPart]).stream().pipeThrough(new DecompressionStream(format));
  const reader = stream.getReader();
  const chunks: Uint8Array[] = [];
  let size = 0;
  for (;;) {
    const { done, value } = await reader.read();
    if (done) break;
    size += value.length;
    if (size > limit) {
      await reader.cancel();
      throw new ParseError('Archive entry is too large');
    }
    chunks.push(value);
  }
  const out = new Uint8Array(size);
  let o = 0;
  for (const c of chunks) {
    out.set(c, o);
    o += c.length;
  }
  return out;
}

/**
 * Minimal zip central-directory reader (stored + deflate; zip64 sizes/offsets as written by OrcaSlicer; no encryption).
 */
export function listZip(buf: Uint8Array): ZipEntry[] {
  const d = new DataView(buf.buffer, buf.byteOffset, buf.byteLength);
  let eocd = -1;
  for (let i = buf.length - 22; i >= Math.max(0, buf.length - 22 - 65535); i--) {
    if (u32(d, i) === 0x06054b50) {
      eocd = i;
      break;
    }
  }
  if (eocd < 0) throw new ParseError('Not a valid zip/3MF file');
  let count = u16(d, eocd + 10);
  let p = u32(d, eocd + 16);
  // Zip64: the locator sits right before the classic end record and points at the zip64 end record.
  if (eocd >= 20 && u32(d, eocd - 20) === 0x07064b50) {
    const z = u64(d, eocd - 12);
    if (z + 56 > buf.length || u32(d, z) !== 0x06064b50) throw new ParseError('Corrupt zip directory');
    count = u64(d, z + 32);
    p = u64(d, z + 48);
  }
  const entries: ZipEntry[] = [];
  for (let i = 0; i < count; i++) {
    if (p + 46 > buf.length || u32(d, p) !== 0x02014b50) throw new ParseError('Corrupt zip directory');
    const method = u16(d, p + 10);
    let csize = u32(d, p + 20);
    let usize = u32(d, p + 24);
    const nlen = u16(d, p + 28);
    const elen = u16(d, p + 30);
    const clen = u16(d, p + 32);
    let lho = u32(d, p + 42);
    const name = new TextDecoder().decode(buf.subarray(p + 46, p + 46 + nlen));
    if (usize === MAX32 || csize === MAX32 || lho === MAX32) {
      // Zip64 extra field (id 1) holds, in order, only the values that overflowed.
      const end = Math.min(p + 46 + nlen + elen, buf.length);
      for (let x = p + 46 + nlen; x + 4 <= end; ) {
        const id = u16(d, x);
        const len = u16(d, x + 2);
        if (id === 1) {
          let q = x + 4;
          const next = () => {
            if (q + 8 > x + 4 + len || q + 8 > end) throw new ParseError('Corrupt zip directory');
            const v = u64(d, q);
            q += 8;
            return v;
          };
          if (usize === MAX32) usize = next();
          if (csize === MAX32) csize = next();
          if (lho === MAX32) lho = next();
          break;
        }
        x += 4 + len;
      }
    }
    p += 46 + nlen + elen + clen;
    entries.push({
      name,
      size: usize,
      async read() {
        if (usize > MAX_ENTRY_BYTES) throw new ParseError('Archive entry is too large');
        if (lho + 30 > buf.length || u32(d, lho) !== 0x04034b50) throw new ParseError('Corrupt zip entry');
        const start = lho + 30 + u16(d, lho + 26) + u16(d, lho + 28);
        const raw = buf.subarray(start, start + csize);
        if (method === 0) return raw.slice();
        if (method === 8) return inflate(raw, Math.min(MAX_ENTRY_BYTES, usize + 1024));
        throw new ParseError('Unsupported zip compression');
      },
    });
  }
  return entries;
}
