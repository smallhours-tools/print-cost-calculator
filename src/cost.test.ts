import { readFileSync } from 'node:fs';
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

describe('pricing guide worked example', () => {
  // Written by an AI agent (Claude): public/guides/how-to-price-3d-prints/ quotes these numbers; if defaults or the model change, update the guide too.
  it('matches the guide\'s table', () => {
    const r = computeCost({ ...DEFAULTS, weightG: 62.1, printTimeHours: 26707 / 3600 });
    const c = (n: number) => n.toFixed(2);
    expect([r.material, r.electricity, r.labor, r.subtotal, r.suggestedPrice, r.fees, r.profit].map(c))
      .toEqual(['1.30', '0.11', '2.50', '5.03', '8.31', '0.79', '2.49']);
    const page = readFileSync('public/guides/how-to-price-3d-prints/index.html', 'utf8');
    for (const v of ['1.30', '0.11', '0.74', '0.37', '2.50', '5.03', '8.31', '0.79', '2.49', '6.54', '0.67', '0.83']) expect(page).toContain(v);
    const markup = r.subtotal * 1.3;
    const markupFees = markup * DEFAULTS.feePct / 100 + DEFAULTS.feeFixed;
    expect([markup, markupFees, markup - r.subtotal - markupFees].map(c)).toEqual(['6.54', '0.67', '0.83']);
  });
});
