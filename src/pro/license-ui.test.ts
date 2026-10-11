// The preview stand-in for the License API (hq t050). Written by an AI agent (Claude).
import { describe, expect, it } from 'vitest';
import { checkLicense, validateKey } from './license';
import { DEMO, isUnlocked, previewFetch } from './license-ui';

describe('license preview stand-in', () => {
  it('answers like the real API would for the three demo keys', async () => {
    expect(await validateKey(DEMO.valid, previewFetch)).toEqual({ ok: true });
    expect(await validateKey(DEMO.invalid, previewFetch)).toEqual({ ok: false, reason: 'invalid' });
    expect(await validateKey(DEMO.offline, previewFetch)).toEqual({ ok: false, reason: 'network' });
    expect(await validateKey('38b1460a-5104-4067-a91d-77b872934d51', previewFetch)).toEqual({ ok: false, reason: 'invalid' });
  });
  it('drives every status, and only locked hides Pro', async () => {
    const now = 1_800_000_000_000, day = 86_400_000;
    const at = async (key: string, days: number) => (await checkLicense({ key, validatedAt: now - days * day }, now, previewFetch)).status;
    expect([await at(DEMO.valid, 1), await at(DEMO.offline, 10), await at(DEMO.offline, 40), await at(DEMO.invalid, 10)])
      .toEqual(['unlocked', 'grace', 'recheck', 'locked']);
    expect((['unlocked', 'grace', 'recheck', 'locked'] as const).map(isUnlocked)).toEqual([true, true, true, false]);
  });
});
