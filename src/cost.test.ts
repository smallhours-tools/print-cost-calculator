import { describe, expect, it } from 'vitest';
import { computeCost, DEFAULTS } from './cost';

describe('computeCost', () => {
  it('computes each component', () => {
    const c = computeCost({ ...DEFAULTS, weightG: 100, printTimeHours: 5, wastePct: 0, printerPowerW: 100 });
    expect(c.material).toBeCloseTo(2);
    expect(c.electricity).toBeCloseTo(0.075);
    expect(c.wear).toBeCloseTo(0.5 + 0.25);
    expect(c.labor).toBeCloseTo(2.5);
  });
  it('price covers costs, fees and margin', () => {
    const c = computeCost({ ...DEFAULTS, weightG: 100, printTimeHours: 5 });
    expect(c.suggestedPrice - c.fees - c.subtotal).toBeCloseTo(c.profit);
    expect(c.profit / c.suggestedPrice).toBeCloseTo(0.3);
  });
  it('ignores NaN/negative input', () => {
    const c = computeCost({ ...DEFAULTS, weightG: NaN, printTimeHours: -3, laborMinutes: 0 });
    expect(c.subtotal).toBe(0);
    expect(c.suggestedPrice).toBeGreaterThanOrEqual(0);
  });
  it('returns 0 price for impossible margin+fee', () => {
    expect(computeCost({ ...DEFAULTS, weightG: 10, marginPct: 90, feePct: 50 }).suggestedPrice).toBe(0);
  });
});
