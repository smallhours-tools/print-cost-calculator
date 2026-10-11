// Keeps public/testing/index.html equal to what the test data says (hq t047). Written by an AI agent (Claude).
// The page is generated, never hand-edited: run `npm run testing-page` after changing the corpus, the tests or the
// copy in src/testing-page.ts. This test fails when the committed page is stale.
import { execSync } from 'node:child_process';
import { mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';
import { parseFile, ParseError } from './parsers/index';
import { faqAnswer, headline, renderTestingPage, rowOk, type CorpusRow, type PageData } from './testing-page';

const DIR = 'test-corpus/slicer-matrix/';
const PAGE = 'public/testing/index.html';
const SLICER: Record<string, string> = { P: 'PrusaSlicer', B: 'Bambu Studio', O: 'OrcaSlicer', C: 'CuraEngine' };
const PROJECT: Record<string, string> = {
  chromium: 'Chromium', 'pixel-7': 'Pixel 7 emulation', firefox: 'Firefox', webkit: "WebKit (Safari's engine)", 'iphone-13': 'iPhone 13 emulation',
};

interface Entry {
  file: string; committed: boolean; expect: 'parse' | 'reject'; reject_message: string | null;
  stated_weight_g: number | null; stated_time_s: number | null; stated_length_mm?: number | number[]; stated_volume_mm3?: number | number[];
}

async function corpusRows(entries: Entry[]): Promise<CorpusRow[]> {
  const rows: CorpusRow[] = [];
  for (const e of entries) {
    const row: CorpusRow = {
      file: e.file, slicer: SLICER[e.file[0]], committed: e.committed, reject: e.expect === 'reject',
      statedWeightG: e.stated_weight_g, statedTimeS: e.stated_time_s, statedLengthMm: e.stated_length_mm ?? null, statedVolumeMm3: e.stated_volume_mm3 ?? null,
    };
    if (e.committed) {
      try {
        const r = await parseFile(new Uint8Array(readFileSync(DIR + 'files/' + e.file)));
        row.readWeightG = r.totalWeightG;
        row.readTimeS = r.printTimeSeconds;
        row.weightEstimated = r.filaments.length > 0 && r.filaments.every((f) => f.weightEstimated);
      } catch (err) {
        row.rejected = err instanceof ParseError && err.message === e.reject_message;
      }
    }
    rows.push(row);
  }
  return rows;
}

/** Rows of the markdown tables under the given headings in docs/reference-data.md. */
function mdRows(doc: string, heading: string): string[][] {
  const part = doc.slice(doc.indexOf(heading)).split('\n## ')[0];
  return part.split('\n').filter((l) => /^\| /.test(l) && !/^\|[-| ]+\|$/.test(l)).slice(1).map((l) => l.split('|').slice(1, -1).map((c) => c.trim()));
}

function testCounts() {
  const env = { ...process.env };
  for (const k of Object.keys(env)) if (k.startsWith('VITEST') || k === 'TEST' || k === 'NODE_ENV') delete env[k];
  const unit = JSON.parse(execSync('npx vitest list --json', { env, encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] })) as { name: string }[];
  const fuzzCopies = unit.reduce((s, t) => s + Number(/: (\d+) mutated copies$/.exec(t.name)?.[1] ?? 0), 0);
  // The browsers CI really runs: all five only when the workflow turns them on.
  const all = /E2E_ALL_BROWSERS:\s*'1'/.test(readFileSync('.github/workflows/ci.yml', 'utf8'));
  const list = execSync('npx playwright test --list', { env: { ...env, E2E_ALL_BROWSERS: all ? '1' : '' }, encoding: 'utf8' });
  const counts = new Map<string, number>();
  for (const m of list.matchAll(/^\s+\[([\w-]+)\] ›/gm)) counts.set(m[1], (counts.get(m[1]) ?? 0) + 1);
  return { unitTests: unit.length, fuzzCopies, e2e: [...counts].map(([p, n]) => ({ project: PROJECT[p] ?? p, tests: n })) };
}

async function pageData(): Promise<PageData> {
  const manifest = JSON.parse(readFileSync(DIR + 'manifest.json', 'utf8')) as { generated: string; slicers: Record<string, string>; files: Entry[] };
  const doc = readFileSync('docs/reference-data.md', 'utf8');
  const publicFiles = [...mdRows(doc, '## Real slicer files'), ...mdRows(doc, '## More real files')].filter((r) => !/CNC/.test(r[2])).length;
  const asOf = new Date(manifest.generated + 'T12:00:00Z').toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'UTC' });
  return {
    asOf,
    slicers: Object.entries(manifest.slicers),
    rows: await corpusRows(manifest.files),
    publicFiles,
    ...testCounts(),
    largeFiles: mdRows(doc, '## Large files'),
  };
}

describe('public testing page', () => {
  it('is what the test data says (run `npm run testing-page` to regenerate)', async () => {
    const d = await pageData();
    const html = renderTestingPage(d);
    if (process.env.UPDATE_TESTING_PAGE === '1') {
      mkdirSync('public/testing', { recursive: true });
      writeFileSync(PAGE, html);
    }
    expect(html).not.toMatch(/NaN|undefined/);
    expect(readFileSync(PAGE, 'utf8')).toBe(html);

    // The headline counts what the table shows, and every committed file passes (as corpus.test.ts requires).
    const h = headline(d);
    expect(h.files).toBe(d.rows.filter((r) => r.committed).length);
    expect(d.rows.filter((r) => r.committed && !rowOk(r)).map((r) => r.file)).toEqual([]);
    expect(d.publicFiles).toBeGreaterThan(10);
    expect(d.largeFiles.length).toBe(3);

    // The calculator FAQ carries the same headline, in the visible text and its JSON-LD twin.
    const index = readFileSync('index.html', 'utf8');
    const answer = faqAnswer(d);
    expect(index).toContain(JSON.stringify(answer).slice(1, -1));
    expect(index).toContain(`<summary>How accurate is it?</summary><p>${answer.replace('the test results page', '<a href="./testing/">the test results page</a>')}</p>`);
  }, 120_000);
});
