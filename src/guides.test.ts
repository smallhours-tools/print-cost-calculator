import { readdirSync, readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';

// Written by an AI agent (Claude): recomputes the guides' tables from their own stated inputs, so an arithmetic
// slip or an edited input can't ship (hq t018 found "0.19" where 1 kWh at 0.18 is 0.18).
const text = (slug: string) => readFileSync(`public/guides/${slug}/index.html`, 'utf8');
const rows = (html: string) =>
  [...html.matchAll(/<tr><th scope="row">(.*?)<\/th>(.*?)<\/tr>/g)].map((m) => [m[1], ...[...m[2].matchAll(/<td>(.*?)<\/td>/g)].map((c) => c[1])]);

describe('electricity guide', () => {
  const html = text('electricity-cost');
  const price = 18.31;
  it('states the price it uses', () => expect(html).toContain('18.31¢ per kWh'));
  it('per-printer table matches watts × price', () => {
    const r = rows(html).filter((x) => x[1]?.endsWith(' W'));
    expect(r.length).toBeGreaterThan(5);
    for (const [, w, hour, ten] of r) {
      const watts = parseFloat(w);
      expect(hour).toBe(`${((watts / 1000) * price).toFixed(1)}¢`);
      expect(ten).toBe(`${((watts / 100) * price).toFixed(1)}¢`);
    }
  });
  it('any-rate table matches rate × kWh', () => {
    const r = rows(html).filter((x) => x[0].endsWith('per kWh'));
    expect(r.length).toBe(6);
    for (const [label, a, b, c] of r) {
      const rate = parseFloat(label);
      expect([a, b, c]).toEqual([0.8, 1, 2].map((kwh) => (rate * kwh).toFixed(2)));
    }
  });
});

describe('filament guide', () => {
  const html = text('filament-cost-per-gram');
  it('grams per meter and meters per kg match the density', () => {
    const r = rows(html).filter((x) => x[2]?.endsWith(' g'));
    expect(r.length).toBeGreaterThan(5);
    for (const [, d, gpm, mpk] of r) {
      const g = Math.PI * 0.0875 ** 2 * 100 * parseFloat(d);
      expect(gpm).toBe(`${g.toFixed(2)} g`);
      expect(mpk).toBe(`${Math.round(1000 / g)} m`);
    }
  });
  it('spool price table matches price ÷ 1000 × grams', () => {
    const r = rows(html).filter((x) => x[0].endsWith('per kg'));
    expect(r.length).toBe(7);
    for (const [label, ...cells] of r) {
      const p = parseFloat(label);
      expect(cells).toEqual([(p / 1000).toFixed(3), ...[10, 50, 100, 250].map((g) => ((p / 1000) * g).toFixed(2))]);
    }
  });
});

describe('guide structured data', () => {
  // Written by an AI agent (Claude): Article JSON-LD must say what the page visibly says.
  const unescape = (s: string) => s.replace(/&amp;/g, '&').replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"');
  for (const slug of readdirSync('public/guides')) {
    it(`${slug} has Article JSON-LD matching the page`, () => {
      const html = text(slug);
      const ld = JSON.parse(html.match(/<script type="application\/ld\+json">(.*?)<\/script>/s)![1]);
      expect(ld['@type']).toBe('Article');
      expect(ld.headline).toBe(unescape(html.match(/<h1>(.*?)<\/h1>/)![1]));
      expect(ld.description).toBe(unescape(html.match(/<meta name="description" content="([^"]*)">/)![1]));
      expect(ld.url).toBe(html.match(/<link rel="canonical" href="([^"]+)">/)![1]);
      expect(ld.publisher.name).toBe('Small Hours');
      expect(ld.dateModified >= ld.datePublished && /^\d{4}-\d{2}-\d{2}$/.test(ld.dateModified)).toBe(true);
    });
  }
});
