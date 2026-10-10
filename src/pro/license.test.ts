// License check tests with a mocked fetch only: no real requests. Written by an AI agent (Claude).
import { describe, expect, it, vi } from 'vitest';
import { checkLicense, cleanKey, GRACE_MS, LICENSE_ENABLED, readState, RECHECK_MS, validateKey, VALIDATE_URL } from './license';

const KEY = '38b1460a-5104-4067-a91d-77b872934d51';
const reply = (status: number, body: unknown) => vi.fn(async () => ({ ok: status < 300, status, json: async () => body }));
const active = { valid: true, license_key: { status: 'active' }, meta: { store_id: 1, product_id: 2 } };
const DAY = 24 * 3600 * 1000;
const now = 1_800_000_000_000;

describe('license', () => {
  it('is disabled until the owner sets up a product', () => {
    expect(LICENSE_ENABLED).toBe(false);
  });

  it('posts the key form-encoded to the validate endpoint', async () => {
    const f = reply(200, active);
    expect(await validateKey(KEY, f)).toEqual({ ok: true });
    const [url, init] = f.mock.calls[0] as unknown as [string, RequestInit];
    expect(url).toBe(VALIDATE_URL);
    expect(init.method).toBe('POST');
    expect(init.body).toBe(`license_key=${KEY}`);
  });

  it('treats inactive, disabled, expired or malformed answers as invalid', async () => {
    for (const body of [{ valid: false }, { valid: true, license_key: { status: 'disabled' } }, { valid: true, license_key: { status: 'expired' } }, null, 'x'])
      expect(await validateKey(KEY, reply(200, body))).toEqual({ ok: false, reason: 'invalid' });
    expect(await validateKey(KEY, reply(404, { valid: false, error: 'license_key not found.' }))).toEqual({ ok: false, reason: 'invalid' });
  });

  it('treats failures, rate limits and server errors as network problems', async () => {
    expect(await validateKey(KEY, vi.fn(async () => { throw new TypeError('Failed to fetch'); }))).toEqual({ ok: false, reason: 'network' });
    expect(await validateKey(KEY, reply(429, {}))).toEqual({ ok: false, reason: 'network' });
    expect(await validateKey(KEY, reply(503, {}))).toEqual({ ok: false, reason: 'network' });
  });

  it('rejects junk keys without a request', async () => {
    const f = reply(200, active);
    for (const k of ['', '   ', 'a&b=c', 'x'.repeat(101), '<script>']) expect(await validateKey(k, f)).toEqual({ ok: false, reason: 'invalid' });
    expect(f).not.toHaveBeenCalled();
    expect(cleanKey(`  ${KEY} `)).toBe(KEY);
  });

  it('needs no network for a check under a week old', async () => {
    const f = reply(200, active);
    const r = await checkLicense({ key: KEY, validatedAt: now - RECHECK_MS + 1 }, now, f);
    expect(r.status).toBe('unlocked');
    expect(f).not.toHaveBeenCalled();
  });

  it('re-validates weekly and refreshes the timestamp', async () => {
    const r = await checkLicense({ key: KEY, validatedAt: now - 8 * DAY }, now, reply(200, active));
    expect(r).toEqual({ status: 'unlocked', state: { key: KEY, validatedAt: now } });
  });

  it('keeps the unlock offline for 30 days, then asks for a re-check without forgetting the key', async () => {
    const offline = vi.fn(async () => { throw new TypeError('offline'); });
    expect((await checkLicense({ key: KEY, validatedAt: now - 20 * DAY }, now, offline)).status).toBe('grace');
    const late = await checkLicense({ key: KEY, validatedAt: now - GRACE_MS - 1 }, now, offline);
    expect(late.status).toBe('recheck');
    expect(late.state?.key).toBe(KEY);
  });

  it('locks and forgets a refunded or disabled key', async () => {
    const r = await checkLicense({ key: KEY, validatedAt: now - 8 * DAY }, now, reply(200, { valid: true, license_key: { status: 'disabled' } }));
    expect(r).toEqual({ status: 'locked', state: null });
  });

  it('rejects tampered or malformed stored state', async () => {
    expect((await checkLicense(null, now)).status).toBe('locked');
    expect((await checkLicense({ key: KEY, validatedAt: now + DAY }, now)).status).toBe('locked');
    expect(readState('{"key":"<b>","validatedAt":1}')).toBeNull();
    expect(readState('garbage')).toBeNull();
    expect(readState(JSON.stringify({ key: KEY, validatedAt: 5 }))).toEqual({ key: KEY, validatedAt: 5 });
  });
});
