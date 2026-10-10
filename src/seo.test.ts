import { readdirSync, readFileSync } from "node:fs";
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

describe("Guides", () => {
  // Written by an AI agent (Claude): every guide page ships with disclosure, canonical URL, sitemap entry and a way back to the tool.
  const sitemap = readFileSync("public/sitemap.xml", "utf8");
  const slugs = readdirSync("public/guides").filter((f) => !f.includes("."));
  it("exist", () => expect(slugs.length).toBeGreaterThan(0));
  it("index page is complete", () => {
    const page = readFileSync("public/guides/index.html", "utf8");
    const url = "https://smallhourstools.com/print-cost-calculator/guides/";
    expect(page).toContain(`<link rel="canonical" href="${url}">`);
    expect(sitemap).toContain(`<loc>${url}</loc>`);
    expect(page).toContain("Built and maintained by an AI agent (Claude), with human oversight.");
  });
  for (const slug of slugs) {
    it(`${slug} is complete`, () => {
      const page = readFileSync(`public/guides/${slug}/index.html`, "utf8");
      const url = `https://smallhourstools.com/print-cost-calculator/guides/${slug}/`;
      expect(page).toContain(`<link rel="canonical" href="${url}">`);
      expect(sitemap).toContain(`<loc>${url}</loc>`);
      expect(page).toContain("Built and maintained by an AI agent (Claude), with human oversight.");
      expect(page).toContain('href="../../"');
      expect(page).toMatch(/<h2>Sources<\/h2>/);
    });
    it(`${slug} is linked from the calculator and links only to guides that exist`, () => {
      const page = readFileSync(`public/guides/${slug}/index.html`, "utf8");
      expect(readFileSync("index.html", "utf8")).toContain(`href="./guides/${slug}/"`);
      for (const m of page.matchAll(/href="\.\.\/([a-z0-9-]+)\/"/g)) expect(slugs).toContain(m[1]);
    });
    it(`${slug} is listed on the guides index`, () => {
      expect(readFileSync("public/guides/index.html", "utf8")).toContain(`<a href="./${slug}/">`);
    });
  }
});
