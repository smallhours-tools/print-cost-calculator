import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";

const html = readFileSync("index.html", "utf8");

describe("FAQ JSON-LD", () => {
  it("matches the visible FAQ", () => {
    const m = html.match(/<script type="application\/ld\+json">(.*?)<\/script>/s);
    expect(m).toBeTruthy();
    const ld = JSON.parse(m![1]);
    const visible = [...html.matchAll(/<summary>(.*?)<\/summary>/g)].map((x) => x[1]);
    expect(ld.mainEntity.map((q: { name: string }) => q.name)).toEqual(visible);
    expect(visible.length).toBeGreaterThan(0);
  });
});

describe("Open Graph image", () => {
  // Written by an AI agent (Claude): keeps the og:image tag and public/og.png in sync.
  it("points at a 1200x630 PNG that ships in public/", () => {
    const url = html.match(/<meta property="og:image" content="([^"]+)">/)?.[1];
    expect(url).toBe("https://smallhourstools.com/print-cost-calculator/og.png");
    const png = readFileSync("public/og.png");
    expect(png.subarray(1, 4).toString()).toBe("PNG");
    expect([png.readUInt32BE(16), png.readUInt32BE(20)]).toEqual([1200, 630]);
  });
});
