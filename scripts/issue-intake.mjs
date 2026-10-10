// Issue intake: turns GitHub issue-form dropdown answers into allowlisted labels.
// Written by an AI agent (Claude). No dependencies, no network. Free text is never
// returned: only labels from the fixed tables below can come out.
import { fileURLToPath } from 'node:url';

export const FORMS = {
  bug: {
    Slicer: ['slicer', { PrusaSlicer: 'prusa', OrcaSlicer: 'orca', 'Bambu Studio': 'bambu', Cura: 'cura', SuperSlicer: 'super', Other: 'other' }],
    'File type': ['file', { '.gcode': 'gcode', '.bgcode': 'bgcode', '.3mf': '3mf', '.ufp': 'ufp', Other: 'other' }],
    Problem: ['problem', { 'File not recognised': 'not-recognised', 'Wrong print time': 'wrong-time', 'Wrong weight': 'wrong-weight', 'Wrong cost math': 'wrong-cost', 'Page broken': 'page-broken', Other: 'other' }],
    Browser: ['browser', { 'Chrome/Edge': 'chromium', Firefox: 'firefox', Safari: 'safari', Other: 'other' }],
  },
  feature: {
    Area: ['area', { Parsing: 'parsing', 'Cost model': 'cost-model', 'Pro features': 'pro', Other: 'other' }],
  },
};

export const PREFIXES = ['slicer:', 'file:', 'problem:', 'browser:', 'area:', 'intake:'];
export const MAX_BODY = 20000;

// Returns { labels: string[] }. Always includes exactly one intake:* label.
export function classify(body) {
  const bad = { labels: ['intake:malformed'] };
  if (typeof body !== 'string' || body.length === 0 || body.length > MAX_BODY) return bad;
  const text = body.replace(/\r\n?/g, '\n');
  // Fields come before the free-text "Details" section; ignore everything after it.
  const di = text.search(/^### Details[ \t]*$/m);
  const head = di === 0 ? '' : di > 0 ? text.slice(0, di) : text;
  const sections = new Map();
  const parts = head.split(/^### /m);
  if (parts[0].trim() !== '') return bad; // text before the first heading
  for (const part of parts.slice(1)) {
    const nl = part.indexOf('\n');
    if (nl < 0) return bad;
    const name = part.slice(0, nl).trim();
    if (sections.has(name)) return bad; // duplicate heading
    sections.set(name, part.slice(nl + 1).trim());
  }
  const form = Object.values(FORMS).find((f) => Object.keys(f).every((k) => sections.has(k)) && sections.size === Object.keys(f).length);
  if (!form) return bad;
  const labels = [];
  for (const [field, [prefix, map]] of Object.entries(form)) {
    const v = sections.get(field);
    if (!Object.prototype.hasOwnProperty.call(map, v)) return bad;
    labels.push(`${prefix}:${map[v]}`);
  }
  return { labels: [...labels, 'intake:ok'] };
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  process.stdout.write(JSON.stringify(classify(process.env.ISSUE_BODY ?? '')) + '\n');
}
