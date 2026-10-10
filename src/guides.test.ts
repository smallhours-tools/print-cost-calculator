import { readdirSync, readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { DEFAULTS } from './cost';
import { parseGcodeText } from './parsers/gcode';
import { parseSliceInfo } from './parsers/threemf';

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

describe('filament guide worked example', () => {
  // Written by an AI agent (Claude): the two-plate example's numbers, recomputed (hq t021).
  it('matches grams × price, with and without 5% waste', () => {
    const html = text('filament-cost-per-gram');
    const g = 149.85;
    for (const p of [20, 30]) {
      expect(html).toContain(`<strong>${((g / 1000) * p).toFixed(2)}</strong>`);
      expect(html).toContain(`<strong>${((g / 1000) * p * 1.05).toFixed(2)}</strong>`);
    }
    expect(html).toContain('href="../../#g=149.85&amp;s=9295"');
  });
});

describe('printer wear guide', () => {
  // Written by an AI agent (Claude): recomputes the wear guide's tables and worked figures (hq t024).
  const html = text('printer-wear-cost');
  const hours = 26707 / 3600;
  it('depreciation table matches net price ÷ hours', () => {
    const r = rows(html).filter((x) => x[0].endsWith(' net'));
    expect(r.length).toBe(5);
    for (const [label, ...cells] of r) {
      const p = parseFloat(label.replace(/,/g, ''));
      expect(cells).toEqual([2000, 4000, 8000].map((h) => (p / h).toFixed(3)));
    }
  });
  it('maintenance worksheet adds up', () => {
    const parts = rows(html).filter((x) => x[2]?.endsWith(' h'));
    expect(parts.length).toBe(3);
    let sum = 0;
    for (const [, price, every, perHour] of parts) {
      const v = parseFloat(price) / parseFloat(every.replace(/,/g, ''));
      expect(perHour).toBe(v.toFixed(3));
      sum += v;
    }
    expect(html).toContain(`<strong>${sum.toFixed(3)}</strong>`);
    const dep = 400 / (20 * 52 * 3);
    expect(html).toContain(`20 × 52 × 3 = <strong>${(20 * 52 * 3).toLocaleString('en-US')} hours</strong>`);
    expect(html).toContain(`costs ${dep.toFixed(3)} per hour, plus ${sum.toFixed(3)} maintenance`);
    expect(html).toContain(`<strong>${(dep + sum).toFixed(3)} per print hour</strong>`);
    expect(html).toContain(`${(dep * hours).toFixed(2)} of depreciation and ${(sum * hours).toFixed(2)} of maintenance, <strong>${((dep + sum) * hours).toFixed(2)}</strong>`);
  });
  it('describes the calculator defaults correctly', () => {
    expect(html).toContain(`starts with a ${DEFAULTS.printerCost} printer over ${DEFAULTS.printerLifetimeHours.toLocaleString('en-US')} hours (${(DEFAULTS.printerCost / DEFAULTS.printerLifetimeHours).toFixed(2)} per hour) and ${DEFAULTS.maintenancePerHour} per hour of maintenance, so ${(DEFAULTS.printerCost / DEFAULTS.printerLifetimeHours + DEFAULTS.maintenancePerHour).toFixed(2)} per print hour`);
    expect(html).toContain('href="../../#g=62.1&amp;s=26707"');
  });
});

describe('slicer metadata guide', () => {
  // Written by an AI agent (Claude): the quoted lines must parse to the numbers the guide states (hq t027).
  const html = text('slicer-print-time-and-filament');
  const pre = (label: string) => {
    const m = html.match(new RegExp(`<pre tabindex="0" aria-label="${label}">([\\s\\S]*?)</pre>`));
    return m![1].replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&amp;/g, '&');
  };
  const grams = (f: { weightG?: number }[]) => f.reduce((s, x) => s + (x.weightG ?? 0), 0).toFixed(2);
  it('PrusaSlicer footer', () => {
    const r = parseGcodeText(pre('PrusaSlicer G-code footer lines'));
    expect([r.printTimeSeconds, grams(r.filaments)]).toEqual([4843, '10.18']);
  });
  it('Cura Marlin header and its length-to-grams table', () => {
    const r = parseGcodeText(pre('Cura G-code header lines'));
    expect([r.printTimeSeconds, grams(r.filaments)]).toEqual([870, '3.23']);
    const cm3 = Math.PI * 0.0875 ** 2 * 108.208;
    expect(html).toContain(`<td>${cm3.toFixed(3)} cm³</td>`);
    for (const d of [1.24, 1.26]) expect(html).toContain(`at ${d} g/cm³</th><td>${(cm3 * d).toFixed(2)} g</td>`);
  });
  it('Cura Griffin header', () => {
    const r = parseGcodeText(pre('Cura Griffin header lines'));
    expect([r.printTimeSeconds, grams(r.filaments)]).toEqual([92579, '94.89']);
    expect(html).toContain(`<strong>${((76525 / 1000) * 1.24).toFixed(2)} g</strong>`);
    expect(html).toContain(`is ${Math.floor(92579 / 3600)} h ${Math.floor((92579 % 3600) / 60)} min`);
  });
  it('Bambu slice_info', () => {
    const r = parseSliceInfo(`<plate>${pre('Bambu Studio slice_info.config lines')}</plate>`);
    expect([r.printTimeSeconds, grams(r.filaments)]).toEqual([843, '3.69']);
    expect(html).toContain(`843 s is ${Math.floor(843 / 60)} min ${843 % 60} s`);
  });
});
