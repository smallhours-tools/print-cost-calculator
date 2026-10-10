// Tests for the split printer/material/shop libraries. Written by an AI agent (Claude).
import { describe, expect, it } from 'vitest';
import { computeCost } from '../cost';
import { defaultValues, exportProfiles, PROFILE_KEYS } from './profiles';
import {
  blendMaterials, combine, emptyLibrary, exportLibrary, importLibrary, MATERIAL_KEYS, PRINTER_KEYS, removeItem,
  SHOP_KEYS, suggestMaterial, suggestPrinter, upsertItem, type Library,
} from './library';

const d = defaultValues();
function sample(): Library {
  let lib = emptyLibrary();
  lib = upsertItem(lib, 'printers', { name: 'P1S', match: 'Bambu Lab P1S', values: { printerPowerW: 105, printerCost: 700, printerLifetimeHours: 5000, maintenancePerHour: 0.05 } });
  lib = upsertItem(lib, 'printers', { name: 'MK4S', values: { printerPowerW: 80, printerCost: 1100, printerLifetimeHours: 6000, maintenancePerHour: 0.04 } });
  lib = upsertItem(lib, 'materials', { name: 'Cheap PLA', values: { filamentPricePerKg: 15, wastePct: 5 } });
  lib = upsertItem(lib, 'materials', { name: 'Prusament PETG', match: 'PETG', values: { filamentPricePerKg: 30, wastePct: 10 } });
  lib = upsertItem(lib, 'shops', { name: 'Etsy', values: { electricityPerKwh: 0.18, laborPerHour: 20, laborMinutes: 10, marginPct: 30, feePct: 9.5, feeFixed: 0.45 } });
  return lib;
}

describe('library', () => {
  it('splits every profile field into exactly one library', () => {
    const all = [...PRINTER_KEYS, ...MATERIAL_KEYS, ...SHOP_KEYS];
    expect([...all].sort()).toEqual([...PROFILE_KEYS].sort());
  });

  it('combines one of each, defaults for missing parts', () => {
    const lib = sample();
    const v = combine(lib.printers[1], lib.materials[1], lib.shops[0]);
    expect(v.printerPowerW).toBe(105);
    expect(v.filamentPricePerKg).toBe(30);
    expect(v.feePct).toBe(9.5);
    expect(combine()).toEqual(d);
    expect(combine(undefined, lib.materials[0]).printerPowerW).toBe(d.printerPowerW);
    expect(computeCost({ ...v, weightG: 100, printTimeHours: 2 }).suggestedPrice).toBeGreaterThan(0);
  });

  it('upsert sorts, replaces case-insensitively, keeps only its own keys; remove works', () => {
    let lib = sample();
    lib = upsertItem(lib, 'materials', { name: 'cheap pla', values: { filamentPricePerKg: 16, wastePct: 0, printerPowerW: 999 } as never });
    expect(lib.materials.map((m) => m.name)).toEqual(['cheap pla', 'Prusament PETG']);
    expect(Object.keys(lib.materials[0].values).sort()).toEqual([...MATERIAL_KEYS].sort());
    expect(removeItem(lib, 'printers', 'mk4s').printers.map((p) => p.name)).toEqual(['P1S']);
    expect(() => upsertItem(lib, 'shops', { name: '  ', values: lib.shops[0].values })).toThrow();
  });

  it('blends materials per filament slot by weight, with each slot’s waste', () => {
    const lib = sample();
    const [pla, petg] = lib.materials;
    const b = blendMaterials([{ weightG: 30, material: pla }, { weightG: 10, material: petg }, { weightG: 5 }])!;
    // (30*15*1.05 + 10*30*1.10) / 40 = (472.5 + 330) / 40
    expect(b.filamentPricePerKg).toBeCloseTo(20.0625, 6);
    expect(b.wastePct).toBe(0);
    expect(blendMaterials([{ material: pla }])).toBeUndefined();
  });

  it('suggests a material from the file’s filament type and a printer from a model string', () => {
    const lib = sample();
    expect(suggestMaterial(lib, { type: 'petg' })?.name).toBe('Prusament PETG');
    expect(suggestMaterial(lib, { type: 'PLA' })?.name).toBe('Cheap PLA');
    expect(suggestMaterial(lib, { type: 'ASA' })).toBeUndefined();
    expect(suggestMaterial(lib, {})).toBeUndefined();
    expect(suggestPrinter(lib, 'Bambu Lab P1S 0.4 nozzle')?.name).toBe('P1S');
    expect(suggestPrinter(lib, 'Bambu Lab P1')).toBeUndefined();
  });

  it('suggests a printer by name when no match is set, preferring the longest hit (hq t012)', () => {
    let lib = sample();
    expect(suggestPrinter(lib, 'MK4S Original Prusa MK4S 0.4 nozzle')?.name).toBe('MK4S');
    expect(suggestPrinter(lib, 'MK4 Original Prusa MK4 0.4 nozzle')).toBeUndefined();
    lib = upsertItem(lib, 'printers', { name: 'MINI', values: lib.printers[1].values });
    lib = upsertItem(lib, 'printers', { name: 'Prusa MINI+', values: lib.printers[1].values });
    expect(suggestPrinter(lib, 'MINIIS Original Prusa MINI & MINI+ Input Shaper')?.name).toBe('Prusa MINI+');
    expect(suggestPrinter(lib, 'MINI My MINI 0.4 nozzle')?.name).toBe('MINI');
    expect(suggestPrinter(lib, '')).toBeUndefined();
    expect(suggestPrinter(lib, undefined)).toBeUndefined();
  });

  it('round-trips a v2 export', () => {
    const lib = sample();
    expect(importLibrary(exportLibrary(lib))).toEqual(lib);
  });

  it('imports v1 flat profiles by splitting them', () => {
    const v1 = exportProfiles([{ name: 'Shop A', values: { ...d, printerPowerW: 150, filamentPricePerKg: 22, feePct: 6.5 } }]);
    const lib = importLibrary(v1);
    expect(lib.printers[0]).toEqual({ name: 'Shop A', values: { printerPowerW: 150, printerCost: d.printerCost, printerLifetimeHours: d.printerLifetimeHours, maintenancePerHour: d.maintenancePerHour } });
    expect(lib.materials[0].values.filamentPricePerKg).toBe(22);
    expect(lib.shops[0].values.feePct).toBe(6.5);
  });

  it('rejects hostile or malformed imports', () => {
    const ok = JSON.parse(exportLibrary(sample()));
    const bad = (mut: (f: Record<string, unknown>) => void) => {
      const f = structuredClone(ok);
      mut(f);
      return () => importLibrary(JSON.stringify(f));
    };
    expect(() => importLibrary('x'.repeat(300_000))).toThrow(/too large/);
    expect(() => importLibrary('{')).toThrow(/JSON/);
    expect(bad((f) => { f.format = 'other'; })).toThrow();
    expect(bad((f) => { f.version = 3; })).toThrow(/version/);
    expect(bad((f) => { (f.materials as { values: Record<string, unknown> }[])[0].values.filamentPricePerKg = -1; })).toThrow(/filamentPricePerKg/);
    expect(bad((f) => { (f.materials as { values: Record<string, unknown> }[])[0].values.wastePct = '5'; })).toThrow();
    expect(bad((f) => { (f.printers as { match: unknown }[])[0].match = { x: 1 }; })).toThrow();
    expect(bad((f) => { f.shops = Array.from({ length: 101 }, (_, i) => ({ name: `s${i}`, values: {} })); })).toThrow();
    expect(bad((f) => { f.printers = 'nope'; })).toThrow();
  });

  it('drops unknown and prototype keys and cleans names', () => {
    const text = '{"format":"smallhours-profiles","version":2,"printers":[{"name":"  A\\u0000 <b>x</b> ","values":{"__proto__":{"polluted":1},"printerPowerW":90,"evil":1}}]}';
    const lib = importLibrary(text);
    expect(lib.printers[0].name).toBe('A <b>x</b>');
    expect(Object.keys(lib.printers[0].values).sort()).toEqual([...PRINTER_KEYS].sort());
    expect(lib.materials).toEqual([]);
    expect(({} as Record<string, unknown>).polluted).toBeUndefined();
  });
});
