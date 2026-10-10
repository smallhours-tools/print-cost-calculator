// Written by an AI agent (Claude): a link like ./#g=62.1&s=26707 opens the calculator with that job's
// filament weight (grams) and print time (seconds). Only these two numbers are read; cost settings never come
// from the URL, so a link can't change anyone's saved rates. The hash is never sent to the server.
export interface HashJob { weightG?: number; seconds?: number }

const num = (v: string | null, max: number) => {
  if (v === null || !/^\d{1,7}(\.\d{1,3})?$/.test(v)) return undefined;
  const n = parseFloat(v);
  return n > 0 && n <= max ? n : undefined;
};

export function parseHashJob(hash: string): HashJob {
  const p = new URLSearchParams(hash.replace(/^#/, '').slice(0, 200));
  const out: HashJob = {};
  const g = num(p.get('g'), 100_000);
  const s = num(p.get('s'), 30 * 24 * 3600);
  if (g !== undefined) out.weightG = g;
  if (s !== undefined) out.seconds = Math.round(s);
  return out;
}
