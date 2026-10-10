# STATE

Venture-wide notes, backlog and digest live in the private smallhours-tools/hq repo.

## NEEDS_OWNER
- Enable GitHub Pages (Settings → Pages → Source: GitHub Actions) if not done yet. Scaffold PR #1 is merged.
- Enable private vulnerability reporting in repo settings (SECURITY.md points to it).

## Run 2026-10-10 (04:40 UTC, Opus)
Done: Pro batch UI (`src/pro/batch-ui.ts`, lazy chunk) on top of the batch/CSV logic another run merged in #14: editable weight/time/qty per row, totals, CSV download. Pro UI opens only as a dev preview on localhost with `?pro` (`src/pro/gate.ts`); production is unchanged. Verified headless on the built site with 3 real public files (weights match docs/reference-data.md), CSV download, hostile file names (rendered as text) and an unreadable 3MF. Next: wire the quote renderer (#15) and a profile picker into the preview.

## Run 2026-10-10 (third)
Done: Pro batch pricing + CSV export (PR #14) and printable quote renderer (PR #15), both pure logic, merged, not wired to UI. Next: Pro unlock + UI (batch table, profile picker, quote button), then T7 parser samples.

## Run 2026-10-10
Done: issue forms + issue-intake workflow (PR #9, awaiting owner merge since it touches .github/); Pro profile store `src/pro/profiles.ts` (PR #10, not wired to UI). Next: Pro batch table, quote page, CSV (see hq playbooks/pro-addon-spec.md).

## Owner-session update: 2026-10-09 (evening, local session)
Parsers checked against 16 real slicer files from public repos (docs/reference-data.md). Added .bgcode, Cura Griffin, .ufp; multi-plate 3MF now totals time and filament. Default power 100 W (sourced). Still wanted: a real OrcaSlicer G-code and a Marlin-style Cura file.

## Earlier run: 2026-10-09 (run 4)
Done: FAQ JSON-LD (test keeps it in sync with visible FAQ), public/sitemap.xml. Not done: og:image (needs asset), home-page card stays 'in development' until owner publishes.

## Earlier run: 2026-10-09 (run 3)
Done: cost model (src/cost.ts + tests), full UI wired to parseFile (drop zone, manual entry, localStorage settings, reset), explainer + FAQ, canonical/OG tags. Verified in headless Chromium with a Prusa G-code fixture.

## Earlier run: 2026-10-09 (run 2)
Done: removed BACKLOG.md, added parsers + 10 tests (@types/node pinned for the test helper). Could not delete the stale `scaffold` branch (no branch-delete tool/permission); owner may delete it.

## Earlier run: 2026-10-09
Done: first run. Created STATE/BACKLOG, scaffold (Vite + TS + Vitest, README with AI disclosure + support policy, MIT LICENSE, SECURITY.md, CI and Pages deploy workflows, placeholder page with AI-disclosure footer). Tests and build pass. No issues or PRs were open.

## Roadmap
1. Scaffold — DONE (PR #1 merged).
2. Parsers — DONE in src/parsers (G-code: Prusa/Orca/Bambu/Cura; 3MF: slice_info.config + plate gcode fallback; own minimal zip reader using DecompressionStream; multi-filament; weight estimated from length when absent). Fixtures are synthetic; real-world sample files would improve confidence (owner-cleared issue with a sample is the way to get them).
   Next: wire parseFile() into UI (file drop) as part of step 3.
3. Cost model + UI — DONE (single saved settings profile, currency symbol). Possible later: named presets, a11y audit, test with real slicer files.
4. SEO — explainer + FAQ + canonical done. sitemap.xml + FAQ JSON-LD done (robots.txt lives on the root domain only). TODO: og:image (needs asset), link home page card once tool is published (owner decides).
