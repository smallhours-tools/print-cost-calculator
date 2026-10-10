import { describe, expect, it } from 'vitest';
import { jobHash, parseHashJob } from './hash';

describe('parseHashJob', () => {
  it('reads grams and seconds', () => {
    expect(parseHashJob('#g=62.1&s=26707')).toEqual({ weightG: 62.1, seconds: 26707 });
    expect(parseHashJob('#s=60')).toEqual({ seconds: 60 });
  });
  it('ignores anything else or out of range', () => {
    for (const h of ['', '#', '#g=-1', '#g=0', '#g=1e9', '#g=abc', '#g=1,5', '#s=99999999', '#g= 5', '#g=Infinity', '#g=12.34567', '#feePct=90'])
      expect(parseHashJob(h)).toEqual({});
  });
});

describe('jobHash', () => {
  it('round-trips through parseHashJob', () => {
    expect(jobHash(62.1, 26707)).toBe('#g=62.1&s=26707');
    expect(parseHashJob(jobHash(12.345, 59.6))).toEqual({ weightG: 12.35, seconds: 60 });
    expect(jobHash(0, 0)).toBe('');
    expect(jobHash(NaN, 120)).toBe('#s=120');
  });
});
