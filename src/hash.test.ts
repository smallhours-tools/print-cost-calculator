import { describe, expect, it } from 'vitest';
import { parseHashJob } from './hash';

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
