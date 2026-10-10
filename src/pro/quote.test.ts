import { describe, it, expect } from 'vitest';
import { esc, renderQuote } from './quote';
import { priceParsed } from './batch';
import { defaultValues } from './profiles';

const meta = { seller: 'Shop <b>', customer: '"Bob" & Co', date: '2026-10-10', validDays: 14, terms: '<script>alert(1)</script>', currency: '$' };
const row = (name: string, q = 2) =>
  priceParsed(name, { slicer: 'prusa', filaments: [], totalWeightG: 40, printTimeSeconds: 3600, warnings: [] }, defaultValues(), q);

describe('pro quote', () => {
  it('escapes everything user-supplied', () => {
    const html = renderQuote([row('<img src=x onerror=alert(1)>.gcode')], meta);
    expect(html).not.toContain('<img');
    expect(html).not.toContain('<script>alert');
    expect(html).toContain('&lt;img');
    expect(html).toContain('&quot;Bob&quot; &amp; Co');
  });
  it('totals lines, skips failed rows, includes disclosure', () => {
    const r = row('a.gcode', 2);
    const html = renderQuote([r, { file: 'bad', quantity: 1, error: 'x', warnings: [] }], meta);
    expect(html).toContain((r.cost!.suggestedPrice * 2).toFixed(2));
    expect(html).not.toContain('>bad<');
    expect(html).toContain('Built and maintained by an AI agent');
    expect(html).toContain("default-src 'none'");
  });
  it('esc strips control chars', () => expect(esc('a\u0000b\u0007')).toBe('ab'));
});
