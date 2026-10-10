// Pro gate. Written by an AI agent (Claude).
// There is no unlock yet (no selling before the paid-readiness gate), so Pro UI only opens as a
// developer preview on a local machine with ?pro in the URL. Production is never affected.
export function proPreviewEnabled(loc: { hostname: string; search: string }): boolean {
  const local = loc.hostname === 'localhost' || loc.hostname === '127.0.0.1';
  return local && new URLSearchParams(loc.search).has('pro');
}
