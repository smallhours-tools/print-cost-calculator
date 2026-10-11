// Real slicer files through the real page, on every browser project (hq t045). Written by an AI agent (Claude).
// The expected numbers come from test-corpus/slicer-matrix/manifest.json: what each slicer itself stated.
import { test, expect, type Page } from '@playwright/test';
import { readFileSync } from 'node:fs';

interface Entry { file: string; stated_weight_g: number | null; stated_time_s: number | null; reject_message: string | null }
const DIR = 'test-corpus/slicer-matrix/files/';
const manifest: Entry[] = JSON.parse(readFileSync('test-corpus/slicer-matrix/manifest.json', 'utf8')).files;
const entry = (file: string) => {
  const e = manifest.find((m) => m.file === file);
  if (!e) throw new Error(`${file} is not in the manifest`);
  return e;
};

function trackErrors(page: Page) {
  const errors: string[] = [];
  // The live page loads Cloudflare Web Analytics; offline in tests it would only log network errors.
  void page.route(/cloudflareinsights\.com/, (r) => r.fulfill({ status: 200, contentType: 'text/javascript', body: '' }));
  page.on('pageerror', (e) => errors.push(e.message));
  page.on('console', (m) => { if (m.type() === 'error') errors.push('console: ' + m.text()); });
  page.on('dialog', (d) => { errors.push('dialog: ' + d.message()); void d.dismiss(); });
  return errors;
}

/** What the time fields should show for a stated time: whole hours, then the remaining minutes rounded. */
function shownTime(s: number) {
  const mins = Math.round(s / 60);
  return { h: String(Math.floor(mins / 60)), m: String(mins % 60) };
}

// One file per slicer and format (P = PrusaSlicer, B = Bambu Studio, O = OrcaSlicer, C = CuraEngine).
const PARSE = [
  'P02_cube_gcode.gcode',
  'P01_cube_bgcode.bgcode',
  'P08_bgcode_as_gcode.gcode',
  'B01_cube.gcode.3mf',
  'B01_cube.plate_1.gcode',
  'O01_cube.gcode.3mf',
  'O01_cube.plate_1.gcode',
  'C01_ender3_cube.gcode',
];

for (const name of PARSE) {
  test(`real file ${name}: shows the slicer's own weight and time, and a price`, async ({ page }) => {
    const errors = trackErrors(page);
    const e = entry(name);
    await page.goto('/');
    await page.setInputFiles('#file', DIR + name);
    await expect(page.locator('#file-status')).toContainText('Detected slicer');
    if (e.stated_weight_g !== null) {
      await expect(page.locator('#f-weightG')).toHaveValue(String(Math.round(e.stated_weight_g * 10) / 10));
    } else {
      // Cura states length only; the page estimates the weight and says so.
      await expect(page.locator('#f-weightG')).toHaveValue(/^\d+(\.\d)?$/);
      await expect(page.locator('#file-status')).toContainText(/estimat/i);
    }
    const t = shownTime(e.stated_time_s!);
    await expect(page.locator('#f-hours')).toHaveValue(t.h);
    await expect(page.locator('#f-mins')).toHaveValue(t.m);
    await expect(page.locator('#price')).toHaveText(/^\$ \d+\.\d\d$/);
    await expect(page.locator('#price')).not.toHaveText('$ 0.00');
    expect(errors).toEqual([]);
  });
}

const NOT_SLICED = /^This doesn't look like a sliced file: .* Enter weight and time manually below\.$/;
const REJECT: { name: string; file: string | { name: string; mimeType: string; buffer: Buffer }; message: RegExp }[] = [
  ...['B07_project_unsliced.3mf', 'O07_project_unsliced.3mf', 'P09_project_3mf.3mf'].map((f) => ({
    name: f, file: DIR + f, message: new RegExp('^' + entry(f).reject_message!.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ' Enter weight and time manually below\\.$'),
  })),
  { name: 'an ASCII .stl', file: { name: 'part.stl', mimeType: 'model/stl', buffer: Buffer.from('solid part\nfacet normal 0 0 1\nouter loop\nvertex 0 0 0\nvertex 1 0 0\nvertex 0 1 0\nendloop\nendfacet\nendsolid part\n') }, message: NOT_SLICED },
  { name: 'a binary .stl', file: { name: 'part.stl', mimeType: 'model/stl', buffer: Buffer.concat([Buffer.alloc(80), Buffer.from([1, 0, 0, 0]), Buffer.alloc(50)]) }, message: NOT_SLICED },
  { name: 'an empty file', file: { name: 'empty.gcode', mimeType: 'text/plain', buffer: Buffer.alloc(0) }, message: /^This file is empty\. Enter weight and time manually below\.$/ },
];

for (const r of REJECT) {
  test(`${r.name} is explained in the page, and typing values by hand still prices`, async ({ page }) => {
    const errors = trackErrors(page);
    await page.goto('/');
    // Load a good file first: a rejected file must not leave its numbers behind.
    await page.setInputFiles('#file', DIR + 'P02_cube_gcode.gcode');
    await expect(page.locator('#f-weightG')).toHaveValue('3.8');
    await page.setInputFiles('#file', r.file);
    await expect(page.locator('#file-status')).toHaveText(r.message);
    await expect(page.locator('#f-weightG')).toHaveValue('');
    await expect(page.locator('#f-hours')).toHaveValue('0');
    await expect(page.locator('#f-mins')).toHaveValue('0');
    await expect(page.locator('#feature-split')).toBeHidden();
    await page.fill('#f-weightG', '62.1');
    await page.fill('#f-hours', '7');
    await page.fill('#f-mins', '25');
    // Same job and default settings as the pricing guide's worked example.
    await expect(page.locator('#price')).toHaveText('$ 8.31');
    expect(errors).toEqual([]);
  });
}
