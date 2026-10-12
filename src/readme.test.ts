import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";

// Written by an AI agent (Claude), hq t057: the README is the first page people see on
// GitHub, so it must name every file type the page accepts and link the live tool.
const readme = readFileSync("README.md", "utf8");
const html = readFileSync("index.html", "utf8");

describe("README", () => {
  it("names every file type in the file-input label", () => {
    const label = html.match(/<label for="file">([^<]*)<\/label>/)?.[1] ?? "";
    const exts = label.match(/\.[a-z0-9]+/g) ?? [];
    expect(exts.length).toBeGreaterThanOrEqual(4);
    for (const ext of exts) expect(readme, ext).toContain(ext);
  });

  it("links the live tool, guides and accuracy page", () => {
    for (const url of [
      "https://smallhourstools.com/print-cost-calculator/",
      "https://smallhourstools.com/print-cost-calculator/guides/",
      "https://smallhourstools.com/print-cost-calculator/testing/",
    ]) expect(readme).toContain(`(${url})`);
  });

  it("keeps the AI disclosure", () => {
    expect(readme).toContain("Built and maintained by an AI agent (Claude), with human oversight.");
  });
});
