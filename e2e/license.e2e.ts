// Pro license entry and unlock in the local ?pro preview (hq t050). Written by an AI agent (Claude).
// Keys are checked by the preview stand-in; the test also fails if any request reaches the real License API.
import { test, expect, type Page } from '@playwright/test';

const DAY = 24 * 3600 * 1000;
function guard(page: Page) {
  const errors: string[] = [];
  page.on('request', (r) => { if (/lemonsqueezy/.test(r.url())) errors.push('network: ' + r.url()); });
  page.on('pageerror', (e) => errors.push(e.message));
  void page.route(/cloudflareinsights\.com/, (r) => r.fulfill({ status: 200, contentType: 'text/javascript', body: '' }));
  return errors;
}
const seed = (page: Page, key: string, ageDays: number) => page.addInitScript(([k, a]) => {
  if (!sessionStorage.getItem('seeded')) {
    localStorage.setItem('pcc.pro.license.v1', JSON.stringify({ key: k, validatedAt: Date.now() - (a as number) * 86_400_000 }));
    sessionStorage.setItem('seeded', '1');
  }
}, [key, ageDays] as const);

test('enter a key, unlock, stay unlocked after reload, remove it', async ({ page }) => {
  const errors = guard(page);
  await page.goto('/?pro');
  await expect(page.locator('#l-status')).toContainText('Enter your Pro license key');
  await page.waitForLoadState('networkidle'); // the batch chunk would have loaded by now
  await expect(page.locator('#pro-batch')).toHaveCount(0);
  await expect(page.locator('#pro-profiles')).toBeVisible(); // saved libraries never need a key

  await page.fill('#l-key', '<img src=x onerror=alert(1)>');
  await page.click('#l-unlock');
  await expect(page.locator('#l-status')).toHaveText("That doesn't look like a license key. Copy it from your receipt.");
  await page.fill('#l-key', 'DEMO-INVALID');
  await page.click('#l-unlock');
  await expect(page.locator('#l-status')).toHaveText("That key wasn't accepted. Check it against your receipt.");
  await page.fill('#l-key', 'DEMO-OFFLINE');
  await page.click('#l-unlock');
  await expect(page.locator('#l-status')).toHaveText("Couldn't reach the license server. Check your connection and try again.");
  await expect(page.locator('#pro-batch')).toHaveCount(0);

  await page.fill('#l-key', 'DEMO-VALID');
  await page.click('#l-unlock');
  await expect(page.locator('#l-status')).toHaveText('Pro is unlocked on this device.');
  await expect(page.locator('#pro-batch')).toBeVisible();
  await expect(page.locator('#l-key')).toBeHidden();

  await page.reload();
  await expect(page.locator('#l-status')).toHaveText('Pro is unlocked on this device.');
  await expect(page.locator('#pro-batch')).toBeVisible();

  await page.click('#l-remove');
  await expect(page.locator('#l-status')).toContainText('The key was removed from this device.');
  await expect(page.locator('#pro-batch')).toBeHidden();
  await expect(page.locator('#pro-profiles')).toBeVisible();
  expect(await page.evaluate(() => localStorage.getItem('pcc.pro.license.v1'))).toBeNull();
  await page.reload();
  await expect(page.locator('#l-status')).toContainText('Enter your Pro license key');
  await page.waitForLoadState('networkidle');
  await expect(page.locator('#pro-batch')).toHaveCount(0);
  expect(errors).toEqual([]);
});

test('offline for 10 days: still unlocked, with a gentle note', async ({ page }) => {
  const errors = guard(page);
  await seed(page, 'DEMO-OFFLINE', 10);
  await page.goto('/?pro');
  await expect(page.locator('#l-status')).toContainText("couldn't be re-checked just now");
  await expect(page.locator('#pro-batch')).toBeVisible();
  expect(errors).toEqual([]);
});

test('unchecked for over 30 days: Pro keeps working and asks for a re-check', async ({ page }) => {
  const errors = guard(page);
  await seed(page, 'DEMO-OFFLINE', 40);
  await page.goto('/?pro');
  await expect(page.locator('#l-status')).toContainText("hasn't been checked for over 30 days");
  await expect(page.locator('#pro-batch')).toBeVisible();
  await page.click('#l-recheck');
  await expect(page.locator('#l-status')).toContainText("hasn't been checked for over 30 days");
  expect(errors).toEqual([]);
});

test('a key that stopped being valid is removed, saved libraries stay', async ({ page }) => {
  const errors = guard(page);
  await seed(page, 'DEMO-INVALID', 10);
  await page.goto('/?pro');
  await expect(page.locator('#l-status')).toContainText("Your saved key isn't valid any more, so it was removed.");
  await page.waitForLoadState('networkidle'); // the batch chunk would have loaded by now
  await expect(page.locator('#pro-batch')).toHaveCount(0);
  await expect(page.locator('#pro-profiles')).toBeVisible();
  expect(await page.evaluate(() => localStorage.getItem('pcc.pro.license.v1'))).toBeNull();
  expect(errors).toEqual([]);
});

test('a weekly re-check that succeeds renews the unlock', async ({ page }) => {
  const errors = guard(page);
  await seed(page, 'DEMO-VALID', 40);
  await page.goto('/?pro');
  await expect(page.locator('#l-status')).toHaveText('Pro is unlocked on this device.');
  const age = await page.evaluate(() => Date.now() - JSON.parse(localStorage.getItem('pcc.pro.license.v1')!).validatedAt);
  expect(age).toBeLessThan(DAY);
  expect(errors).toEqual([]);
});
