// Tests for library loading and v1 migration. Written by an AI agent (Claude).
import { describe, it, expect } from 'vitest';
import { loadLibrary } from './profiles-ui';
import { defaultValues, exportProfiles, upsert } from './profiles';
import { emptyLibrary, exportLibrary, upsertItem } from './library';

describe('profiles ui storage', () => {
  it('round-trips and drops anything invalid', () => {
    const lib = upsertItem(emptyLibrary(), 'materials', { name: 'PLA', values: { filamentPricePerKg: 20, wastePct: 5 } });
    expect(loadLibrary(exportLibrary(lib))).toEqual(lib);
    expect(loadLibrary(null)).toEqual(emptyLibrary());
    expect(loadLibrary('{"format":"x"}')).toEqual(emptyLibrary());
    expect(loadLibrary('garbage')).toEqual(emptyLibrary());
  });
  it('migrates stored v1 profiles when there is no v2 library yet', () => {
    const v1 = exportProfiles(upsert([], 'A1 PLA', defaultValues()));
    const lib = loadLibrary(null, v1);
    expect([lib.printers[0].name, lib.materials[0].name, lib.shops[0].name]).toEqual(['A1 PLA', 'A1 PLA', 'A1 PLA']);
    expect(loadLibrary('garbage', v1).printers).toHaveLength(1);
  });
});
