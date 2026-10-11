// Renders public/testing/index.html ("How accurate is the calculator?") from test data (hq t047).
// Written by an AI agent (Claude). Never edit the HTML by hand: src/testing-page.test.ts gathers the data
// (manifest, live parser results, test counts) and fails when the committed page differs. To regenerate:
// `npm run testing-page`.

export interface CorpusRow {
  file: string;
  slicer: string;
  committed: boolean;
  reject: boolean;
  statedWeightG: number | null;
  statedTimeS: number | null;
  statedLengthMm?: number | number[] | null;
  statedVolumeMm3?: number | number[] | null;
  readWeightG?: number;
  readTimeS?: number;
  weightEstimated?: boolean;
  /** For reject cases: the file was refused with the expected message. */
  rejected?: boolean;
}

export interface PageData {
  asOf: string;
  slicers: [string, string][];
  rows: CorpusRow[];
  publicFiles: number;
  unitTests: number;
  fuzzCopies: number;
  e2e: { project: string; tests: number }[];
  largeFiles: string[][];
}

const esc = (s: string) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
const nf = (n: number) => n.toLocaleString('en-US');

export function fmtTime(s: number): string {
  const h = Math.floor(s / 3600), m = Math.floor((s % 3600) / 60), sec = s % 60;
  return [h ? `${h} h` : '', h || m ? `${m} min` : '', `${sec} s`].filter(Boolean).join(' ');
}

export const weightOk = (r: CorpusRow) => r.statedWeightG !== null && r.readWeightG !== undefined && Math.abs(r.readWeightG - r.statedWeightG) <= 0.01 + 1e-9;
export const timeOk = (r: CorpusRow) => r.statedTimeS !== null && r.readTimeS !== undefined && Math.abs(r.readTimeS - r.statedTimeS) <= 1;

/** One passing verdict per row, the same rules as src/corpus.test.ts. */
export function rowOk(r: CorpusRow): boolean {
  if (r.reject) return r.rejected === true;
  if (r.statedWeightG === null) return timeOk(r) && r.weightEstimated === true;
  return timeOk(r) && weightOk(r);
}

const AND = (xs: string[]) => (xs.length < 2 ? xs.join('') : `${xs.slice(0, -1).join(', ')} and ${xs[xs.length - 1]}`);
const ofAll = (ok: number, n: number) => (ok === n ? `all ${n}` : `${ok} of ${n}`);

export function headline(d: PageData) {
  const checked = d.rows.filter((r) => r.committed);
  const weighed = checked.filter((r) => !r.reject && r.statedWeightG !== null);
  const lengthOnly = checked.filter((r) => !r.reject && r.statedWeightG === null);
  const rejects = checked.filter((r) => r.reject);
  const slicerNames = [...new Set(checked.map((r) => r.slicer))];
  return {
    files: checked.length,
    slicers: slicerNames.length,
    weighed: weighed.length,
    weighedOk: weighed.filter(rowOk).length,
    lengthOnly: lengthOnly.length,
    lengthOnlyOk: lengthOnly.filter(rowOk).length,
    rejects: rejects.length,
    rejectsOk: rejects.filter(rowOk).length,
    slicerNames,
  };
}

/** The FAQ answer on the calculator page, kept in sync by the same test. */
export function faqAnswer(d: PageData): string {
  const h = headline(d);
  return `It reads the print time and filament weight your slicer wrote into the file, so it is as accurate as the slicer's own estimate. On ${h.weighed} files we sliced ourselves in ${h.slicers} slicers, it read the same time and weight as the slicer on ${h.weighedOk === h.weighed ? 'every one' : `${h.weighedOk} of them`}. Every file and result is on the test results page.`;
}

/** One amount per extruder, e.g. "4,045 + 2,379". */
const amounts = (v: number | number[]) => [v].flat().map((x) => nf(Math.round(x))).join(' + ');

function cells(r: CorpusRow): [string, string, string] {
  if (!r.committed) return [r.statedTimeS !== null ? `${fmtTime(r.statedTimeS)}, ${r.statedWeightG} g` : '', 'not checked automatically (over 3 MB, not in the repository)', '–'];
  if (r.reject) return ['unsliced project', r.rejected ? 'refused: “slice it first”' : 'not refused', rowOk(r) ? 'yes' : 'NO'];
  const said = r.statedWeightG !== null
    ? `${fmtTime(r.statedTimeS!)}, ${r.statedWeightG.toFixed(2)} g`
    : `${fmtTime(r.statedTimeS!)}, ${r.statedLengthMm ? `${amounts(r.statedLengthMm)} mm of filament` : `${amounts(r.statedVolumeMm3 ?? [])} mm³ of filament`}`;
  const read = r.readTimeS === undefined ? 'nothing' : `${fmtTime(r.readTimeS)}, ${r.readWeightG?.toFixed(2)} g${r.weightEstimated ? ' (estimated)' : ''}`;
  return [said, read, rowOk(r) ? 'yes' : 'NO'];
}

export function renderTestingPage(d: PageData): string {
  const h = headline(d);
  const url = 'https://smallhourstools.com/print-cost-calculator/testing/';
  const repo = 'https://github.com/smallhours-tools/print-cost-calculator';
  const title = 'How accurate is the 3D print cost calculator?';
  const desc = `The calculator reads the slicer's own print time and filament weight. Checked against ${h.files} files sliced in ${AND(h.slicerNames)}: the result for every file, what is not covered yet, and how to report a file it gets wrong.`;
  const rows = d.rows.map((r) => {
    const [said, read, ok] = cells(r);
    return `          <tr><th scope="row"><code>${esc(r.file)}</code></th><td>${esc(r.slicer)}</td><td>${said}</td><td>${read}</td><td>${ok}</td></tr>`;
  }).join('\n');
  const e2e = d.e2e.map((p) => `${p.tests} in ${esc(p.project)}`);
  const large = d.largeFiles.map((c) => `          <tr><th scope="row">${esc(c[0])}</th>${c.slice(1).map((x) => `<td>${esc(x)}</td>`).join('')}</tr>`).join('\n');
  const lengthLine = h.lengthOnly
    ? ` The ${h.lengthOnly} CuraEngine files state only filament length or volume, not weight: the calculator matches the print time on ${ofAll(h.lengthOnlyOk, h.lengthOnly)}, estimates the weight from PLA density and says so on the page.`
    : '';
  const rejectLine = h.rejects
    ? ` ${h.rejectsOk === h.rejects ? `All ${h.rejects}` : `${h.rejectsOk} of ${h.rejects}`} unsliced project files are refused with a message to slice them first.`
    : '';
  return `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${title}</title>
  <meta name="description" content="${esc(desc)}">
  <meta name="color-scheme" content="light dark">
  <link rel="canonical" href="${url}">
  <meta property="og:title" content="${title}">
  <meta property="og:description" content="${esc(desc)}">
  <meta property="og:type" content="article">
  <meta property="og:url" content="${url}">
  <meta property="og:site_name" content="Small Hours">
  <meta property="og:image" content="https://smallhourstools.com/print-cost-calculator/og.png">
  <meta name="twitter:card" content="summary_large_image">
  <style>
    :root{--bg:#fff;--fg:#1b1d22;--mut:#5a6070;--card:#f4f5f8;--acc:#2a5bd7;--bd:#d5d8e0}
    @media (prefers-color-scheme:dark){:root{--bg:#12141a;--fg:#e8eaf0;--mut:#9aa1b2;--card:#1c1f28;--acc:#7fa2ff;--bd:#343949}}
    *{box-sizing:border-box}
    body{margin:0;font:16px/1.6 system-ui,sans-serif;background:var(--bg);color:var(--fg)}
    main,footer,header{max-width:52rem;margin:0 auto;padding:1rem}
    a{color:var(--acc)} a:focus-visible{outline:3px solid var(--acc);outline-offset:2px} h1{margin:.3em 0;line-height:1.2} h2{margin-top:1.8em}
    .scroll{overflow-x:auto} .scroll:focus-visible{outline:3px solid var(--acc);outline-offset:2px} table{width:100%;border-collapse:collapse;font-size:.9rem} th,td{padding:.4rem;border-bottom:1px solid var(--bd);text-align:left;vertical-align:top} th{font-weight:500} code{font-size:.85rem}
    .cta{background:var(--card);border:1px solid var(--bd);border-radius:8px;padding:1rem}
    .note{color:var(--mut);font-size:.9rem}
  </style>
</head>
<body>
  <header><a href="../">3D Print Cost Calculator</a> › How accurate is it?</header>
  <main>
    <h1>${title}</h1>
    <p>The calculator reads the print time and filament weight your slicer wrote into the file, so it is as accurate as the slicer's own estimate. To check that it reads them correctly, we sliced our own test models in ${AND(h.slicerNames)}: ${h.files} files. On ${ofAll(h.weighedOk, h.weighed)} files that state a weight, it reads the same print time (within 1 second) and weight (within 0.01 g) as the slicer.${lengthLine}${rejectLine}</p>
    <p>A slicer's time is an estimate: firmware acceleration settings, pauses and filament changes can make the real print take longer or shorter. The <a href="../guides/slicer-print-time-and-filament/">slicer metadata guide</a> shows where each slicer writes these numbers.</p>

    <h2>Every test file and result</h2>
    <p>The files were sliced on ${esc(d.asOf)}; the calculator's side is re-checked on every change. "Slicer says" is read straight from each file by a separate script, not by the calculator.</p>
    <section class="scroll" aria-label="Test files: what the slicer says and what the calculator reads" tabindex="0">
      <table>
        <thead><tr><th scope="col">File</th><th scope="col">Slicer</th><th scope="col">Slicer says</th><th scope="col">Calculator reads</th><th scope="col">Same?</th></tr></thead>
        <tbody>
${rows}
        </tbody>
      </table>
    </section>

    <h2>Slicers and settings</h2>
    <ul>
${d.slicers.map(([n, v]) => `      <li><strong>${esc(n)}</strong> ${esc(v)}</li>`).join('\n')}
    </ul>
    <p>The models are simple on purpose: a cube in PLA and PETG, a tiny cube, a part that needs supports, a vase-mode cylinder, a 21 to 28 hour slab, prints with two filaments and projects with two plates. The CuraEngine files come from Cura's slicing engine run on its own, so their numbers can differ from what the Cura app would give for the same model.</p>

    <h2>Also checked: files other people published</h2>
    <p>${d.publicFiles} sliced files from public projects (PrusaSlicer's own test data, Cura, OrcaSlicer and Bambu Studio examples) were read and compared with the totals written in them, in October 2026. They are listed with their sources in <a href="${repo}/blob/main/docs/reference-data.md">reference-data.md</a>; their licences don't let us copy them into the repository, so they aren't re-checked on every change.</p>

    <h2>Not covered yet</h2>
    <ul>
      <li>Files exported from the Cura app itself (only Cura's engine so far).</li>
      <li>Slicers based on OrcaSlicer, such as Creality Print, ElegooSlicer, Anycubic Slicer Next, QIDI Studio and Snapmaker Orca. Their files usually look like OrcaSlicer's, but we haven't tested them.</li>
      <li>Other slicers, such as Simplify3D, IdeaMaker and Kiri:Moto.</li>
      <li>How close a slicer's time estimate is to the real print on your printer.</li>
    </ul>

    <div class="cta">
      <p><strong>Found a file it reads wrong?</strong> <a href="${repo}/issues/new?template=bug.yml">Open a bug report</a> and say which slicer and file type it was. Or enter the weight and time by hand in the <a href="../">calculator</a>; your file never leaves your browser either way.</p>
    </div>

    <h2>Tests that run on every change</h2>
    <p>${nf(d.unitTests)} unit tests, including ${nf(d.fuzzCopies)} deliberately corrupted copies of sample files that must give a clear error instead of a crash, and browser tests on the built page: ${AND(e2e)}. The large-file timings below are from one measurement; the 50 MB case runs on every change and fails if the page stops responding for more than 200 ms.</p>
    <section class="scroll" aria-label="Large files: how fast the numbers appear and how long the page stops responding" tabindex="0">
      <table>
        <thead><tr><th scope="col">File size</th><th scope="col">Numbers shown after</th><th scope="col">Walls/infill split</th><th scope="col">Longest pause</th></tr></thead>
        <tbody>
${large}
        </tbody>
      </table>
    </section>
    <p>The test files, the expected values and the tests are in the <a href="${repo}/tree/main/test-corpus/slicer-matrix">public repository</a>.</p>
    <p class="note">Generated from the test data. Written by an AI agent (Claude).</p>
  </main>
  <footer><p>Built and maintained by an AI agent (Claude), with human oversight. A <strong>Small Hours</strong> tool. No ads, no cookies. Page views are counted with Cloudflare Web Analytics.</p></footer>
  <!-- Cloudflare Web Analytics: cookieless page-view counts (owner-approved 2026-10-09) --><script type='module' src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "b74b89d0212e4a62b6a1f6f48c252d74"}'></script><!-- End Cloudflare Web Analytics -->
</body>
</html>
`;
}
