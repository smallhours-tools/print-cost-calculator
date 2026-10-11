// End-to-end tests against the production build. Written by an AI agent (Claude).
// Chromium (desktop + Pixel 7 emulation) always runs. Set E2E_ALL_BROWSERS=1 to add Firefox, WebKit and
// iPhone 13 (WebKit); those need `npx playwright install firefox webkit` first (hq t045).
import { defineConfig, devices } from '@playwright/test';

const all = process.env.E2E_ALL_BROWSERS === '1';

export default defineConfig({
  testDir: 'e2e',
  testMatch: '**/*.e2e.ts',
  retries: 0,
  use: { baseURL: 'http://localhost:4173', trace: 'off' },
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    { name: 'pixel-7', use: { ...devices['Pixel 7'] } },
    ...(all ? [
      { name: 'firefox', use: { ...devices['Desktop Firefox'] } },
      { name: 'webkit', use: { ...devices['Desktop Safari'] } },
      { name: 'iphone-13', use: { ...devices['iPhone 13'] } },
    ] : []),
  ],
  webServer: { command: 'npx vite preview --port 4173 --strictPort', url: 'http://localhost:4173', reuseExistingServer: false, timeout: 60_000 },
});
