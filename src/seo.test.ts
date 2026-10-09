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
