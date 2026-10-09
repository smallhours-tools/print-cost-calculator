# STATE

Venture-wide notes, backlog and digest live in the private smallhours-tools/hq repo.

## NEEDS_OWNER
- Enable GitHub Pages (Settings → Pages → Source: GitHub Actions) if not done yet. Scaffold PR #1 is merged.
- Enable private vulnerability reporting in repo settings (SECURITY.md points to it).

## Last run: 2026-10-09 (run 4)
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
