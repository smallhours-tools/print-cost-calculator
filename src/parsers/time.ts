/** Parse durations like "1d 2h 3m 4s" or "45m 10s". Returns seconds, or undefined. */
export function parseDuration(s: string): number | undefined {
  const re = /(\d+(?:\.\d+)?)\s*([dhms])\b/g;
  const mult: Record<string, number> = { d: 86400, h: 3600, m: 60, s: 1 };
  let total = 0;
  let found = false;
  for (const m of s.matchAll(re)) {
    total += parseFloat(m[1]) * mult[m[2]];
    found = true;
  }
  return found ? Math.round(total) : undefined;
}
