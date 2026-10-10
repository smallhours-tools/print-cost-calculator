import { describe, it, expect } from 'vitest';
import { cleanName, defaultValues, exportProfiles, importProfiles, remove, upsert, MAX_PROFILES } from './profiles';

describe('pro profiles', () => {
  it('round-trips export/import', () => {
    const v = { ...defaultValues(), filamentPricePerKg: 31.5 };
    const list = upsert(upsert([], 'Prusa MK4 PETG', v), 'A1 PLA', defaultValues());
    expect(importProfiles(exportProfiles(list))).toEqual(list);
  });
  it('upsert replaces by case-insensitive name and sorts; remove works', () => {
    let l = upsert([], 'b', defaultValues());
    l = upsert(l, 'A', defaultValues());
    l = upsert(l, 'B', { ...defaultValues(), marginPct: 50 });
    expect(l.map((p) => p.name)).toEqual(['A', 'B']);
    expect(l[1].values.marginPct).toBe(50);
    expect(remove(l, 'a').map((p) => p.name)).toEqual(['B']);
  });
  it('cleans names', () => {
    expect(cleanName('  x\u0000\n y  ')).toBe('x y');
    expect(cleanName('   ')).toBeNull();
    expect(cleanName(5)).toBeNull();
    expect(cleanName('z'.repeat(500))!.length).toBe(60);
  });
  it('rejects hostile imports', () => {
    const bad = (s: string) => expect(() => importProfiles(s)).toThrow();
    bad('not json');
    bad('{}');
    bad('null');
    bad(JSON.stringify({ format: 'smallhours-profiles', version: 2, profiles: [] }));
    bad(JSON.stringify({ format: 'smallhours-profiles', version: 1, profiles: [{ name: 'x', values: { marginPct: 'NaN' } }] }));
    bad(JSON.stringify({ format: 'smallhours-profiles', version: 1, profiles: [{ name: 'x', values: { marginPct: -1 } }] }));
    bad(JSON.stringify({ format: 'smallhours-profiles', version: 1, profiles: [{ name: '', values: {} }] }));
    bad(JSON.stringify({ format: 'smallhours-profiles', version: 1, profiles: Array.from({ length: MAX_PROFILES + 1 }, (_, i) => ({ name: 'p' + i, values: {} })) }));
    bad('x'.repeat(300_000));
  });
  it('drops unknown and prototype keys, fills missing with defaults', () => {
    const txt = '{"format":"smallhours-profiles","version":1,"profiles":[{"name":"p","values":{"marginPct":10,"evil":1,"__proto__":{"x":1},"weightG":999}}]}';
    const [p] = importProfiles(txt);
    expect(p.values.marginPct).toBe(10);
    expect(p.values.feePct).toBe(defaultValues().feePct);
    expect(Object.keys(p.values)).not.toContain('evil');
    expect(Object.keys(p.values)).not.toContain('weightG');
    expect(({} as Record<string, unknown>).x).toBeUndefined();
  });
});
