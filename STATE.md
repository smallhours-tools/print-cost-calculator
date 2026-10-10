# STATE

Venture-wide notes, backlog and digest live in the private smallhours-tools/hq repo.

## NEEDS_OWNER
- None (Pages is live and private vulnerability reporting is enabled, both checked 2026-10-10).

## Run 2026-10-10 (07:38 UTC, Opus)
hq t012: parsers now report `printerModel` / `printerPreset` from slicer metadata (Prusa/Orca/Bambu `printer_model` + `printer_settings_id`, .bgcode printer block, Bambu/Orca 3MF Metadata/project_settings.config, Cura Griffin `TARGET_MACHINE.NAME`), cleaned to short printable labels. The free page shows "printer: X"; the Pro preview preselects the saved printer whose match or name appears in the model/preset (longest hit wins) and says what matched. Checked on 9 real files (docs/reference-data.md). Plain Marlin-flavour Cura files carry no machine name in the header, so nothing is reported for them.

## Run 2026-10-10 (06:11 UTC, Opus)
Also (hq t004): src/pro/license.ts, a Lemon Squeezy validate client (Plan A), DISABLED (LICENSE_ENABLED = false, not imported anywhere, store/product ids null). Weekly re-check, 30-day offline grace then a soft 'recheck' status, refunded/disabled keys lock; mocked-fetch tests only. Stores the key itself (not just a hash): re-checks need it. Before enabling: owner creates the product, set EXPECTED ids, one real test-mode key checked by a local session.
Also (hq t009, part 1): src/pro/library.ts, pure logic for separate printer / material / shop libraries: combine one of each, per-slot material blend (weight-averaged, each slot's waste), suggest material from the file's filament type and printer from a model string, v2 export/import with v1 import by splitting, same strict validation/limits. Then part 2: profiles-ui.ts now shows three pickers (printer / material / shop) that each save and load only their own fields, remembers the last selection, migrates stored v1 profiles, and imports/exports v2 (v1 files are split); e2e test incl. hostile names and a bad import. Then part 3: main.ts dispatches `pcc:parsed` (filament types + weights only); the Pro panel preselects the saved material whose name/match fits the file's filament type, or for several filaments writes the weight-weighted price with each material's waste. t009 done. Possible later: a per-slot material override UI; printer auto-match once a parser reports the printer model.
Also (hq t003, part 1): first guide public/guides/electricity-cost/ (sourced watts per printer, EIA July 2026 US price 18.31¢/kWh, any-rate table), linked from a new Guides section; sitemap entry; seo.test checks every guide has canonical, sitemap entry, AI footer, link back and Sources. Then guide 2: public/guides/filament-cost-per-gram/ (densities from Bambu Lab profiles shipped in OrcaSlicer, g/m and m/kg, cost table for any spool price); wide tables are focusable labelled regions (axe). Next guide: Etsy pricing/fees, but etsy.com and help.etsy.com return 403 to routines, so Etsy's own fee page must be checked by a local session first.
Done (hq t008): unsliced/project 3MFs now get a specific message (Bambu/Orca project not sliced yet, PrusaSlicer project, Cura project, plain model) instead of a generic error; the UI shows those sentences as-is. Real files found a bigger bug: OrcaSlicer writes zip64 archives, which the zip reader rejected ("Corrupt zip directory"), so every Orca-written 3MF failed. zip64 support added + unit test (mutation-checked) + e2e test. FAQ (visible + JSON-LD), drop-zone label and description now say "sliced". Sources in docs/reference-data.md. Still synthetic only: unsliced Bambu/Orca project and Cura project (needs a local session's code search).

## Run 2026-10-10 (04:40 UTC, Opus)
Done: Pro batch UI (`src/pro/batch-ui.ts`, lazy chunk) on top of the batch/CSV logic another run merged in #14: editable weight/time/qty per row, totals, CSV download. Pro UI opens only as a dev preview on localhost with `?pro` (`src/pro/gate.ts`); production is unchanged. Verified headless on the built site with 3 real public files (weights match docs/reference-data.md), CSV download, hostile file names (rendered as text) and an unreadable 3MF. Then (PR after #17): quote form + sandboxed preview iframe + print (`src/pro/quote-ui.ts`), checked headless incl. an A4 PDF (1 page) and hostile seller/terms/file names. Then: profile picker (`src/pro/profiles-ui.ts`): save/load/delete named settings, JSON import/export, re-prices result and batch; hostile import rejected. Next: the real unlock (Lemon Squeezy, owner opens the account when the paid-readiness gate allows), Pro landing copy. Also this run: fixed sideways scroll at 320px + axe clean (#20); og:image added (public/og.png, source docs/og-image.html).

## Run 2026-10-10 (third)
Done: Pro batch pricing + CSV export (PR #14) and printable quote renderer (PR #15), both pure logic, merged, not wired to UI. Next: Pro unlock + UI (batch table, profile picker, quote button), then T7 parser samples.

## Run 2026-10-10
Done: issue forms + issue-intake workflow (PR #9, awaiting owner merge since it touches .github/); Pro profile store `src/pro/profiles.ts` (PR #10, not wired to UI). Next: Pro batch table, quote page, CSV (see hq playbooks/pro-addon-spec.md).

## Owner-session update: 2026-10-09 (evening, local session)
Parsers checked against 16 real slicer files from public repos (docs/reference-data.md). Added .bgcode, Cura Griffin, .ufp; multi-plate 3MF now totals time and filament. Default power 100 W (sourced). Real OrcaSlicer and Marlin-style Cura files now checked too (2026-10-10, docs/reference-data.md); zero-density Orca bug fixed.

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
4. SEO — explainer + FAQ + canonical done. sitemap.xml + FAQ JSON-LD done (robots.txt lives on the root domain only). og:image DONE 2026-10-10. TODO: link home page card once tool is published (owner decides).
