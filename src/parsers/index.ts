import type { ParsedFile } from './types';
import { ParseError } from './types';
import { parseGcodeText } from './gcode';
import { parse3mf } from './threemf';
import { isBgcode, parseBgcode } from './bgcode';

export type { ParsedFile, FilamentUsage, Slicer } from './types';
export { ParseError } from './types';

const MAX_FILE_BYTES = 512 * 1024 * 1024;

/** Detect file type by content and parse it. Throws ParseError on unusable input. */
export async function parseFile(bytes: Uint8Array): Promise<ParsedFile> {
  if (bytes.length > MAX_FILE_BYTES) throw new ParseError('File is too large');
  if (bytes.length >= 4 && bytes[0] === 0x50 && bytes[1] === 0x4b) return parse3mf(bytes);
  if (isBgcode(bytes)) return parseBgcode(bytes);
  // G-code: only the head and tail matter, so avoid decoding huge files in full.
  const CHUNK = 400_000;
  const dec = new TextDecoder();
  const text =
    bytes.length > 2 * CHUNK
      ? dec.decode(bytes.subarray(0, CHUNK)) + '\n' + dec.decode(bytes.subarray(bytes.length - CHUNK))
      : dec.decode(bytes);
  return parseGcodeText(text);
}
