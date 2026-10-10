// Written by an AI agent (Claude).
import { describe, expect, it } from 'vitest';
import { powerHint } from './printer-power';

describe('powerHint (hq t013)', () => {
  it('knows Bambu Lab models from the wiki table, exact names only', () => {
    expect(powerHint('Bambu Lab P1S')).toEqual({ watts: 105, label: 'Bambu Lab P1S' });
    expect(powerHint('Bambu Lab A1 mini')?.watts).toBe(80);
    expect(powerHint('Bambu Lab A1')?.watts).toBe(95);
    expect(powerHint('Bambu Lab X1 Carbon')?.watts).toBe(105);
    expect(powerHint('Bambu Lab X1E')?.watts).toBe(185);
    expect(powerHint('Bambu Lab H2C')).toBeUndefined(); // not in the wiki table we cite
    expect(powerHint('Bambu Lab P1S Pro Max')).toBeUndefined();
  });
  it('gives Prusa MK-series 80 W, but not the MINI or other printers', () => {
    expect(powerHint('MK4S')).toEqual({ watts: 80, label: 'Prusa MK4S' });
    expect(powerHint('MK4IS')?.watts).toBe(80);
    expect(powerHint('MK3S')?.watts).toBe(80);
    expect(powerHint('Prusa MK3.5')).toEqual({ watts: 80, label: 'Prusa MK3.5' });
    expect(powerHint('MINIIS')).toBeUndefined();
    expect(powerHint('Elegoo Centauri Carbon')).toBeUndefined();
    expect(powerHint('Generic Klipper Printer')).toBeUndefined();
    expect(powerHint(undefined)).toBeUndefined();
    expect(powerHint('')).toBeUndefined();
  });
});
