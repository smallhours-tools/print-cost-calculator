import { readdirSync, readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { computeCost, DEFAULTS } from './cost';
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
  for (const slug of readdirSync('public/guides').filter((f) => !f.includes('.'))) {
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

describe('cost per print hour guide', () => {
  // Written by an AI agent (Claude): the grams-per-hour table must match docs/reference-data.md, and the stated
  // ranges and machine rate must follow from it and from DEFAULTS (hq t030).
  const html = text('cost-per-print-hour');
  const ref = new Map(
    readFileSync('docs/reference-data.md', 'utf8').split('\n')
      .map((l) => l.split('|').map((c) => c.trim()))
      .filter((c) => c.length >= 6 && /^\d+$/.test(c[4]))
      .map((c) => [c[1], { s: parseInt(c[4], 10), g: parseFloat(c[5]) }] as const)
      .reverse(), // first occurrence wins
  );
  const r = rows(html).filter((x) => x[0].startsWith('<code>'));
  it('table matches the reference data', () => {
    expect(r.length).toBe(9);
    for (const [file, , time, grams, perHour, cost] of r) {
      const d = ref.get(file.replace(/<\/?code>/g, ''))!;
      expect(d).toBeDefined();
      const gph = d.g / (d.s / 3600);
      expect([time, grams, perHour, cost]).toEqual([`${(d.s / 3600).toFixed(2)} h`, `${d.g.toFixed(2)} g`, `${gph.toFixed(1)} g/h`, (gph * 0.02).toFixed(2)]);
    }
  });
  it('stated ranges and machine rate follow from the data', () => {
    const gph = r.map(([file]) => { const d = ref.get(file.replace(/<\/?code>/g, ''))!; return d.g / (d.s / 3600); });
    const lo = Math.min(...gph), hi = Math.max(...gph);
    expect(html).toContain(`<strong>${lo.toFixed(1)} to ${hi.toFixed(1)} g per hour</strong>`);
    expect(html).toContain(`from about ${(lo * 0.02).toFixed(2)} to ${(hi * 0.02).toFixed(2)} of filament per hour`);
    const machine = (DEFAULTS.printerPowerW / 1000) * DEFAULTS.electricityPerKwh + DEFAULTS.printerCost / DEFAULTS.printerLifetimeHours + DEFAULTS.maintenancePerHour;
    expect(html).toContain(`<strong>${machine.toFixed(3)} per print hour</strong>`);
    expect(html).toContain(`costs <strong>${((DEFAULTS.printerPowerW / 1000) * 18.31).toFixed(1)}¢ per hour</strong>`);
  });
});

describe('multicolor purge waste guide', () => {
  // Written by an AI agent (Claude): quoted lines parse to the stated total; shares and costs recompute (hq t033).
  const html = text('multicolor-purge-waste');
  const tot = 68.66, tower = 47.82, price = 26.99, model = tot - tower;
  it('quoted footer parses to the per-filament sum', () => {
    const m = html.match(/<pre tabindex="0" aria-label="PrusaSlicer multi-material G-code footer lines">([\s\S]*?)<\/pre>/)!;
    const r = parseGcodeText(m[1]);
    expect(r.filaments.reduce((s, f) => s + (f.weightG ?? 0), 0).toFixed(2)).toBe('68.67');
    expect(m[1]).toContain(`total filament used for wipe tower [g] = ${tower}`);
  });
  it('table and text recompute', () => {
    const r = rows(html).filter((x) => x[1]?.endsWith(' g'));
    expect(r.map((x) => x.slice(1))).toEqual([
      [`${tower.toFixed(2)} g`, `${Math.round((tower / tot) * 100)}%`, ((tower / 1000) * price).toFixed(2)],
      [`${model.toFixed(2)} g`, `${Math.round((model / tot) * 100)}%`, ((model / 1000) * price).toFixed(2)],
      [`${tot.toFixed(2)} g`, '100%', ((tot / 1000) * price).toFixed(2)],
    ]);
    expect(html).toContain(`spends ${(tower / model).toFixed(1)} g on the wipe tower`);
    expect(html).toContain(`about ${(0.14 * 1.08).toFixed(2)} g each time`);
    expect(html).toContain(`not ${model.toFixed(2)} g`);
  });
});

describe('infill guide', () => {
  // Written by an AI agent (Claude): the share table and the savings text recompute from the per-feature
  // totals in docs/reference-data.md, and those totals add up to each file's stated length (hq t036).
  const html = text('infill-and-filament-cost');
  const ref = readFileSync('docs/reference-data.md', 'utf8').split('## Filament by feature')[1].split('\n## ')[0].split('\n')
    .filter((l) => /^\| \S+\.gcode \|/.test(l))
    .map((l) => l.split('|').slice(1, -1).map((c) => c.trim()))
    .map(([file, infill, stated, ...rest]) => ({ file, infill, stated: +stated, parts: rest.slice(0, 4).map(Number), grams: +rest[4] }));
  const share = (r: (typeof ref)[0], i: number) => r.parts[i] / r.parts.reduce((s, v) => s + v, 0);
  it('reference totals match the stated lengths', () => {
    expect(ref.length).toBe(7);
    for (const r of ref) expect(Math.abs(r.parts.reduce((s, v) => s + v, 0) / r.stated - 1)).toBeLessThan(0.025);
  });
  it('table recomputes from the reference data', () => {
    const t = rows(html).filter((x) => x[2]?.endsWith(' g') && x[1]?.endsWith('%'));
    expect(t.map((x) => x.slice(1))).toEqual(ref.map((r) => [r.infill, `${r.grams.toFixed(2)} g`, ...[0, 1, 2, 3].map((i) => `${Math.round(share(r, i) * 100)}%`)]));
  });
  it('ranges and the Benchy example recompute', () => {
    const s15 = ref.filter((r) => r.infill === '15%').map((r) => share(r, 2));
    const [lo, hi] = [Math.min(...s15), Math.max(...s15)];
    expect(html).toContain(`between <strong>${Math.round(lo * 100)}% and ${Math.round(hi * 100)}%</strong>`);
    expect(html).toContain(`roughly <strong>${Math.round(lo * 50)} to ${Math.round(hi * 50)}%</strong>`);
    expect(html).toContain(`(${Math.round(lo * 100)} to ${Math.round(hi * 100)}% at 15% infill)`);
    const b = ref.find((r) => r.file === '3DBenchy.gcode')!;
    const saved = (b.grams * share(b, 2)) / 2;
    expect(html).toContain(`about ${saved.toFixed(1)} g of its ${b.grams.toFixed(2)} g`);
    expect(html).toContain(`At ${DEFAULTS.filamentPricePerKg} per kg (the calculator's default filament price) it saves about ${((saved / 1000) * DEFAULTS.filamentPricePerKg).toFixed(2)}`);
    expect(html).toContain(`at most ${(b.grams * share(b, 2)).toFixed(1)} g`);
    const top = ref.filter((r) => r.infill === '15%').sort((a, c) => share(c, 2) - share(a, 2));
    expect(top[0].file).toBe('test_sequential.gcode');
    expect(html).toContain(`most at ${Math.round(share(top[0], 2) * 100)}%, the calicat figure ${Math.round(share(top[1], 2) * 100)}%`);
    expect(ref.filter((r) => share(r, 0) === Math.max(...[0, 1, 2, 3].map((i) => share(r, i)))).length).toBe(4);
    expect(html).toContain('biggest share in 4 of the 7 files');
  });
});

describe('failed prints guide', () => {
  // Written by an AI agent (Claude): every figure recomputes from computeCost with the defaults on the
  // pricing guide's real file (62.10 g, 26707 s), so a change to DEFAULTS or the model fails here (hq t037).
  const html = text('failed-prints-cost');
  const base = { ...DEFAULTS, weightG: 62.1, printTimeHours: 26707 / 3600 };
  const c = computeCost(base);
  const attempt = c.material + c.electricity + c.wear;
  const price = (cost: number) => (cost + DEFAULTS.feeFixed) / (1 - DEFAULTS.feePct / 100 - DEFAULTS.marginPct / 100);
  it('states the per-attempt split', () => {
    expect(html).toContain(`<strong>${c.material.toFixed(2)}</strong> in material`);
    expect(html).toContain(`<strong>${(c.electricity + c.wear).toFixed(2)}</strong> in machine time`);
    expect(html).toContain(`Labor (${c.labor.toFixed(2)}, ${DEFAULTS.laborMinutes} minutes`);
    expect(price(c.subtotal).toFixed(2)).toBe(c.suggestedPrice.toFixed(2));
  });
  it('table recomputes', () => {
    const t = rows(html).filter((x) => /^\d+%$/.test(x[0]));
    expect(t).toEqual([0, 5, 10, 20].map((f) => {
      const a = attempt / (1 - f / 100);
      return [`${f}%`, (1 / (1 - f / 100)).toFixed(3), a.toFixed(2), (a + c.labor).toFixed(2), price(a + c.labor).toFixed(2)];
    }));
  });
  it('text figures recompute', () => {
    expect(html).toContain(`adds ${(attempt / 0.9 - attempt).toFixed(2)} to the cost and ${(price(attempt / 0.9 + c.labor) - price(attempt + c.labor)).toFixed(2)} to the price`);
    const waste = (1 + DEFAULTS.wastePct / 100) / 0.9 - 1;
    expect(html).toContain(`<strong>${(waste * 100).toFixed(1)}%</strong>`);
    // Folding failures into waste % gives exactly material ÷ 0.9.
    expect(computeCost({ ...base, wastePct: waste * 100 }).material).toBeCloseTo(c.material / 0.9, 10);
    expect(html).toContain(`it is ${((c.electricity + c.wear) * (1 / 0.9 - 1)).toFixed(2)} per good print at 10%`);
    expect(html).toContain('adding 20% covers 1.2 attempts, but you really need 1.25');
  });
});
