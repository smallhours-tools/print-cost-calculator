// Pro license check against the Lemon Squeezy License API, straight from the browser (hq task t004).
// Written by an AI agent (Claude). DISABLED: no store or product exists yet, nothing imports this module, and
// selling waits for the paid-readiness gate. Plan A per hq playbooks/pro-addon-spec.md (CORS verified 2026-10-09).
//
// Rules: validate on unlock; re-check at most weekly; if the network fails, the unlock holds for 30 days since the
// last good check, then the UI shows a soft "re-check" prompt. Saved profiles and exports never depend on this.

export const LICENSE_ENABLED = false;
/** Fill in when the owner creates the product. A key for any other store/product is rejected. */
export const EXPECTED = { storeId: null as number | null, productId: null as number | null };
export const VALIDATE_URL = 'https://api.lemonsqueezy.com/v1/licenses/validate';
export const RECHECK_MS = 7 * 24 * 3600 * 1000;
export const GRACE_MS = 30 * 24 * 3600 * 1000;
const MAX_KEY = 100;

export interface LicenseState { key: string; validatedAt: number }
export type Status = 'unlocked' | 'grace' | 'recheck' | 'locked';
export type Validation = { ok: true } | { ok: false; reason: 'invalid' | 'network' };
type FetchFn = (url: string, init: RequestInit) => Promise<{ ok: boolean; status: number; json(): Promise<unknown> }>;

/** Keys look like UUIDs; anything else is rejected before a request is made. */
export function cleanKey(raw: string): string | null {
  const k = raw.trim();
  return k.length > 0 && k.length <= MAX_KEY && /^[A-Za-z0-9-]+$/.test(k) ? k : null;
}

/** POST the key to Lemon Squeezy. Only a definite answer from the API counts as "invalid". */
export async function validateKey(key: string, fetchFn: FetchFn = fetch as unknown as FetchFn): Promise<Validation> {
  const k = cleanKey(key);
  if (!k) return { ok: false, reason: 'invalid' };
  let res: Awaited<ReturnType<FetchFn>>;
  let body: unknown;
  try {
    res = await fetchFn(VALIDATE_URL, {
      method: 'POST',
      headers: { Accept: 'application/json', 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({ license_key: k }).toString(),
    });
    body = await res.json();
  } catch {
    return { ok: false, reason: 'network' };
  }
  if (res.status === 429 || res.status >= 500) return { ok: false, reason: 'network' };
  const b = body as { valid?: unknown; license_key?: { status?: unknown }; meta?: { store_id?: unknown; product_id?: unknown } } | null;
  const valid =
    b?.valid === true &&
    b.license_key?.status === 'active' &&
    (EXPECTED.storeId === null || b.meta?.store_id === EXPECTED.storeId) &&
    (EXPECTED.productId === null || b.meta?.product_id === EXPECTED.productId);
  return valid ? { ok: true } : { ok: false, reason: 'invalid' };
}

/**
 * Decide the unlock status for a stored state. Returns the new state to store (null = forget the key).
 * A fresh check (< 7 days) needs no network.
 */
export async function checkLicense(
  state: LicenseState | null, now: number, fetchFn?: FetchFn,
): Promise<{ status: Status; state: LicenseState | null }> {
  if (!state || !cleanKey(state.key) || !Number.isFinite(state.validatedAt) || state.validatedAt > now) return { status: 'locked', state: null };
  const age = now - state.validatedAt;
  if (age < RECHECK_MS) return { status: 'unlocked', state };
  const v = await validateKey(state.key, fetchFn);
  if (v.ok) return { status: 'unlocked', state: { key: state.key, validatedAt: now } };
  if (v.reason === 'invalid') return { status: 'locked', state: null };
  return { status: age < GRACE_MS ? 'grace' : 'recheck', state };
}

/** Parse stored JSON; anything malformed counts as no license. */
export function readState(raw: string | null): LicenseState | null {
  try {
    const o = JSON.parse(raw ?? 'null') as Partial<LicenseState> | null;
    if (o && typeof o.key === 'string' && typeof o.validatedAt === 'number' && cleanKey(o.key)) return { key: o.key, validatedAt: o.validatedAt };
  } catch { /* fall through */ }
  return null;
}
