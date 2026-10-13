// Large files stay responsive (hq t046). Written by an AI agent (Claude).
// Builds big G-code at test time (nothing large is committed): the real header and footer of our own
// P05_supports.gcode around its moves repeated to the target size. CI runs 50 MB; set BIG_SIZES_MB=50,200,500
// to measure more locally. The page must show the file's numbers and never block the main thread for long.
import { test, expect } from '@playwright/test';
import { closeSync, existsSync, ftruncateSync, mkdirSync, openSync, readFileSync, writeSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { featureLengths } from '../src/parsers/features';

const SIZES = (process.env.BIG_SIZES_MB ?? '50').split(',').map(Number);
const SRC = 'test-corpus/slicer-matrix/files/P05_supports.gcode';
const MAX_BLOCK_MS = 200;

function bigGcode(mb: number): string {
  const dir = join(tmpdir(), 'pcc-big');
  mkdirSync(dir, { recursive: true });
  const out = join(dir, `big${mb}.gcode`);
  if (existsSync(out)) return out;
  const text = readFileSync(SRC, 'latin1');
  const i = text.indexOf('\n;TYPE:'), j = text.indexOf('\n; filament used [mm]');
  const [head, body] = [text.slice(0, i + 1), text.slice(i + 1, j + 1)];
  let foot = text.slice(j + 1);
  const copies = Math.ceil((mb * 1024 * 1024 - head.length) / body.length);
  // State the length the repeated moves really extrude, so the walls/infill split can check out and show.
  const sum = (t: string) => Object.values(featureLengths(t)).reduce((a, b) => a + b, 0);
  const one = sum(head + body + foot), perCopy = sum(head + body + body + foot) - one;
  foot = foot.replace(/^; filament used \[mm\] = [\d.]+$/m, `; filament used [mm] = ${(one + (copies - 1) * perCopy).toFixed(2)}`);
  const fd = openSync(out, 'w');
  writeSync(fd, head);
  const chunk = Buffer.from(body, 'latin1');
  for (let n = 0; n < copies; n++) writeSync(fd, chunk);
  writeSync(fd, foot);
  closeSync(fd);
  return out;
}

for (const mb of SIZES) {
  test(`${mb} MB G-code: priced without freezing the page`, async ({ page, browserName }) => {
    test.setTimeout(120_000);
    const path = bigGcode(mb);
    await page.route(/cloudflareinsights\.com/, (r) => r.fulfill({ status: 200, contentType: 'text/javascript', body: '' }));
    await page.goto('/');
    // A 20 ms ticker: the largest gap between ticks is the longest time the page could not respond.
    // Where the browser supports it, also record the longest animation frame and which script ran in it
    // (hq t060), so a failure says whether our code or something else (e.g. a busy CI runner) held the page.
    await page.evaluate(() => {
      const w = window as unknown as { maxGap: number; last: number; loaf: string };
      w.maxGap = 0; w.last = performance.now(); w.loaf = 'n/a';
      setInterval(() => { const t = performance.now(); w.maxGap = Math.max(w.maxGap, t - w.last - 20); w.last = t; }, 20);
      if (!PerformanceObserver.supportedEntryTypes?.includes('long-animation-frame')) return;
      w.loaf = 'none over 50 ms';
      let longest = 0;
      new PerformanceObserver((list) => {
        for (const e of list.getEntries() as (PerformanceEntry & { scripts: { invoker: string; sourceURL: string; duration: number }[] })[]) {
          if (e.duration <= longest) continue;
          longest = e.duration;
          const s = e.scripts.map((x) => `${x.invoker} ${x.sourceURL.split('/').pop()} ${Math.round(x.duration)} ms`).join('; ');
          w.loaf = `${Math.round(e.duration)} ms at ${Math.round(e.startTime)} ms (${s || 'no script'})`;
        }
      }).observe({ type: 'long-animation-frame' });
    });
    const t0 = Date.now();
    await page.setInputFiles('#file', path);
    await expect(page.locator('#f-weightG')).toHaveValue('7', { timeout: 60_000 });
    const shownMs = Date.now() - t0;
    await expect(page.locator('#f-mins')).toHaveValue('27');
    await expect(page.locator('#price')).not.toHaveText('$ 0.00');
    // Up to 64 MB the filament split streams the whole file in the background; above that it is skipped and said so.
    if (mb <= 64) await expect(page.locator('#feature-split')).toBeVisible({ timeout: 60_000 });
    else await expect(page.locator('#file-status')).toContainText('over 64 MB, so the walls/infill split is skipped');
    const doneMs = Date.now() - t0;
    await page.waitForTimeout(100); // performance entries are delivered asynchronously
    const { maxGap, loaf } = await page.evaluate(() => { const w = window as unknown as { maxGap: number; loaf: string }; return { maxGap: w.maxGap, loaf: w.loaf }; });
    console.log(`[t046] ${browserName} ${mb} MB: numbers shown after ${shownMs} ms, split done after ${doneMs} ms (incl. file transfer), longest block ${Math.round(maxGap)} ms; longest frame ${loaf}`);
    expect(maxGap).toBeLessThan(MAX_BLOCK_MS);
  });
}

for (const [name, h, m] of [['B06_long.gcode.3mf', '21', '32'], ['O06_long.gcode.3mf', '22', '28']] as const) {
  test(`${name} (a 1.6 kg, 21-22 h print): its numbers and split, page responsive`, async ({ page }) => {
    const e = JSON.parse(readFileSync('test-corpus/slicer-matrix/manifest.json', 'utf8')).files.find((f: { file: string }) => f.file === name);
    await page.route(/cloudflareinsights\.com/, (r) => r.fulfill({ status: 200, contentType: 'text/javascript', body: '' }));
    await page.goto('/');
    await page.evaluate(() => {
      const w = window as unknown as { maxGap: number; last: number };
      w.maxGap = 0; w.last = performance.now();
      setInterval(() => { const t = performance.now(); w.maxGap = Math.max(w.maxGap, t - w.last - 20); w.last = t; }, 20);
    });
    await page.setInputFiles('#file', 'test-corpus/slicer-matrix/files/' + name);
    await expect(page.locator('#f-weightG')).toHaveValue(String(Math.round(e.stated_weight_g * 10) / 10));
    expect([Math.floor(Math.round(e.stated_time_s / 60) / 60), Math.round(e.stated_time_s / 60) % 60].map(String)).toEqual([h, m]);
    await expect(page.locator('#f-hours')).toHaveValue(h);
    await expect(page.locator('#f-mins')).toHaveValue(m);
    await expect(page.locator('#feature-split')).toBeVisible({ timeout: 30_000 });
    expect(await page.evaluate(() => (window as unknown as { maxGap: number }).maxGap)).toBeLessThan(MAX_BLOCK_MS);
  });
}

test('a 3MF over 512 MB gets a plain message, not a frozen tab', async ({ page, browserName }) => {
  // Only Chromium: the file is sparse on disk but still about 513 MB to hand to the browser.
  test.skip(browserName !== 'chromium', 'one browser is enough for the size limit');
  test.setTimeout(120_000);
  const dir = join(tmpdir(), 'pcc-big');
  mkdirSync(dir, { recursive: true });
  const path = join(dir, 'huge.3mf');
  if (!existsSync(path)) {
    const fd = openSync(path, 'w');
    writeSync(fd, Buffer.from('PK\x03\x04', 'latin1'));
    ftruncateSync(fd, 512 * 1024 * 1024 + 1024);
    closeSync(fd);
  }
  await page.goto('/');
  await page.setInputFiles('#file', path);
  await expect(page.locator('#file-status')).toHaveText('This file is larger than 512 MB, too big to read in the browser. Enter weight and time manually below.', { timeout: 60_000 });
});
