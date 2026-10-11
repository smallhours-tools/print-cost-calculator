// Pro: license key entry and unlock (hq t050). Written by an AI agent (Claude).
// Only mounted in the local ?pro preview. While LICENSE_ENABLED is false, keys are checked by a stand-in
// (previewFetch) that never touches the network; the real Lemon Squeezy call is used only once the owner has
// created the product and the flag is turned on. Saved printers, materials and shops never depend on this.
import { checkLicense, cleanKey, LICENSE_ENABLED, readState, validateKey, type LicenseState, type Status } from './license';

export const LICENSE_STORE = 'pcc.pro.license.v1';
export const DEMO = { valid: 'DEMO-VALID', invalid: 'DEMO-INVALID', offline: 'DEMO-OFFLINE' };
type FetchFn = NonNullable<Parameters<typeof validateKey>[1]>;

/** Stand-in for the License API: DEMO-VALID is active, DEMO-OFFLINE fails like a lost connection, anything else is unknown. */
export const previewFetch: FetchFn = async (_url, init) => {
  const key = new URLSearchParams(String(init.body ?? '')).get('license_key');
  if (key === DEMO.offline) throw new TypeError('Failed to fetch');
  const body = key === DEMO.valid
    ? { valid: true, license_key: { status: 'active' }, meta: { store_id: null, product_id: null } }
    : { valid: false, error: 'license_key not found.' };
  return { ok: key === DEMO.valid, status: key === DEMO.valid ? 200 : 404, json: async () => body };
};

/** Pro features are usable in every status except locked; recheck is only a prompt. */
export const isUnlocked = (s: Status) => s !== 'locked';

const MESSAGES: Record<Status, string> = {
  unlocked: 'Pro is unlocked on this device.',
  grace: "Pro is unlocked. The key couldn't be re-checked just now (are you offline?). That's fine for up to 30 days.",
  recheck: "Pro still works, but your key hasn't been checked for over 30 days. Connect to the internet and press Re-check.",
  locked: 'Enter your Pro license key to unlock batch pricing and quotes. Your saved printers, materials and shops stay available either way.',
};

export async function mountLicense(
  after: Element,
  onChange: (status: Status) => void,
  opts: { now?: () => number; fetchFn?: FetchFn } = {},
): Promise<{ section: HTMLElement; status: Status }> {
  const now = opts.now ?? Date.now;
  const fetchFn = opts.fetchFn ?? (LICENSE_ENABLED ? undefined : previewFetch);
  const store = (s: LicenseState | null) => {
    try { if (s) localStorage.setItem(LICENSE_STORE, JSON.stringify(s)); else localStorage.removeItem(LICENSE_STORE); } catch { /* storage off: unlock lasts this visit */ }
  };
  let stored: LicenseState | null = null;
  try { stored = readState(localStorage.getItem(LICENSE_STORE)); } catch { /* treated as no key */ }

  const mk = <K extends keyof HTMLElementTagNameMap>(tag: K, props: object = {}): HTMLElementTagNameMap[K] => Object.assign(document.createElement(tag), props);
  const msg = mk('p', { id: 'l-status', role: 'status' });
  const keyInput = mk('input', { id: 'l-key', type: 'text', maxLength: 100, autocomplete: 'off', spellcheck: false });
  const unlock = mk('button', { id: 'l-unlock', type: 'button', textContent: 'Unlock' });
  const recheck = mk('button', { id: 'l-recheck', type: 'button', textContent: 'Re-check' });
  const remove = mk('button', { id: 'l-remove', type: 'button', textContent: 'Remove key from this device' });
  const label = mk('label', { htmlFor: 'l-key', textContent: 'License key' });
  const form = mk('p', {}); form.append(label, ' ', keyInput, ' ', unlock);
  const actions = mk('p', {}); actions.append(recheck, ' ', remove);
  const section = mk('section', { id: 'pro-license' });
  section.setAttribute('aria-label', 'Pro license');
  section.append(mk('h2', { textContent: 'Pro license (preview)' }), msg, form, actions);
  if (!LICENSE_ENABLED) {
    section.append(mk('p', { className: 'note', textContent: `Preview: keys are checked by a stand-in, not by the payment provider. ${DEMO.valid} unlocks, ${DEMO.invalid} is refused, ${DEMO.offline} acts as if you were offline.` }));
  }
  after.after(section);

  let status: Status = 'locked';
  const show = (s: Status, note?: string) => {
    status = s;
    msg.textContent = note ? `${note} ${MESSAGES[s]}` : MESSAGES[s];
    form.hidden = s !== 'locked';
    actions.hidden = s === 'locked';
    recheck.hidden = s !== 'recheck' && s !== 'grace';
    onChange(s);
  };

  const busy = (on: boolean) => { unlock.disabled = recheck.disabled = remove.disabled = on; };
  unlock.addEventListener('click', async () => {
    const key = cleanKey(keyInput.value);
    if (!key) { msg.textContent = 'That doesn\'t look like a license key. Copy it from your receipt.'; return; }
    busy(true);
    msg.textContent = 'Checking the key…';
    const v = await validateKey(key, fetchFn);
    busy(false);
    if (v.ok) {
      store({ key, validatedAt: now() });
      keyInput.value = '';
      show('unlocked');
    } else if (v.reason === 'network') {
      msg.textContent = "Couldn't reach the license server. Check your connection and try again.";
    } else {
      msg.textContent = "That key wasn't accepted. Check it against your receipt.";
    }
  });
  recheck.addEventListener('click', async () => {
    const state = (() => { try { return readState(localStorage.getItem(LICENSE_STORE)); } catch { return null; } })();
    busy(true);
    // Force a fresh check: pretend the last one was long enough ago.
    const r = await checkLicense(state && { ...state, validatedAt: Math.min(state.validatedAt, now() - 7 * 24 * 3600 * 1000) }, now(), fetchFn);
    busy(false);
    if (r.status === 'unlocked') store(r.state);
    else if (r.status === 'locked') store(null);
    show(r.status, r.status === 'locked' ? "The key isn't valid any more, so it was removed." : undefined);
  });
  remove.addEventListener('click', () => {
    store(null);
    show('locked', 'The key was removed from this device.');
  });

  const r = await checkLicense(stored, now(), fetchFn);
  if (r.state !== stored) store(r.state);
  show(r.status, r.status === 'locked' && stored ? "Your saved key isn't valid any more, so it was removed." : undefined);
  return { section, status };
}
