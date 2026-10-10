// Tests for profile loading. Written by an AI agent (Claude).
import { describe, it, expect } from 'vitest';
import { loadProfiles } from './profiles-ui';
import { defaultValues, exportProfiles, upsert } from './profiles';

describe('profiles ui storage', () => {
  it('round-trips and drops anything invalid', () => {
    const list = upsert([], 'A1 PLA', defaultValues());
    expect(loadProfiles(exportProfiles(list))).toEqual(list);
    expect(loadProfiles(null)).toEqual([]);
    expect(loadProfiles('{"format":"x"}')).toEqual([]);
    expect(loadProfiles('garbage')).toEqual([]);
  });
});
