# Reference data

Real-world files and published measurements used to check the parsers and the cost defaults.
Third-party sample files are **not** committed (their licences vary); the unit tests use
synthetic fixtures that copy only the shape and numbers of these files.

## Real slicer files (checked 2026-10-09)

Values in the table are what the parser returned; each matched the file's own metadata.

| File | Source | Slicer | Time (s) | Weight (g) |
|---|---|---|---|---|
| 3DBenchy.gcode | [xyz-tools/gcode-preview](https://github.com/xyz-tools/gcode-preview/tree/develop/demo/gcodes) (MIT) | PrusaSlicer 2.9.2 | 3251 | 12.08 |
| calicat.gcode | same | PrusaSlicer 2.9.2 | 2235 | 6.64 |
| plant-sign.gcode | same | PrusaSlicer 2.7.4 | 1634 | 4.91 |
| screw.gcode | same | PrusaSlicer 2.7.4 | 1863 | 5.09 |
| vase.gcode | same | PrusaSlicer 2.7.4 | 4000 | 8.94 |
| easel.gcode | same | CNC (not a 3D print) | none, as expected | none |
| test.gcode | [prusa3d/PrusaSlicer resources/test_data](https://github.com/prusa3d/PrusaSlicer/tree/master/resources/test_data) | PrusaSlicer 2.9.0 | 4843 | 10.18 |
| test.bgcode | same | PrusaSlicer 2.9.0 (binary) | 26707 | 62.10 |
| test_multimaterial.gcode | same | PrusaSlicer 2.9.0, 5 tools | 30949 | 68.67 |
| test_sequential.gcode | same | PrusaSlicer 2.9.0 | 4756 | 9.70 |
| test_vase.gcode | same | PrusaSlicer 2.9.0 | 1047 | 1.76 |
| simple.gcode | [Ultimaker/GHermeneus resources](https://github.com/Ultimaker/GHermeneus/tree/master/resources) | Cura 4.7 (Griffin) | 92579 | 94.89 (from volume) |
| big.gcode | same | Cura 4.6 (Griffin), 2 extruders | 353667 | 447.65 (from volume) |
| cube_h2c.gcode.3mf | [MichaelDanCurtis/BambuMate fixtures](https://github.com/MichaelDanCurtis/BambuMate/tree/main/src-tauri/tests/fixtures/slicer) | Bambu Studio 02.08 | 843 | 3.69 |
| two_plates_h2c.gcode.3mf | same | Bambu Studio 02.08, 2 plates | 9295 | 149.85 |
| warning_h2c.gcode.3mf | same | Bambu Studio 02.08 | 1037 | 4.21 |

## More real files (checked 2026-10-10; found by a local session with GitHub code search)

| File | Source | Slicer | Time (s) | Weight (g) |
|---|---|---|---|---|
| cubewithironing.gcode | [harpua555/OpenFilamentSensor tools/](https://github.com/harpua555/OpenFilamentSensor) | OrcaSlicer | 395 | 1.20 |
| orcaslicer.gcode | [mjonuschat/acceleration-control GCode/](https://github.com/mjonuschat/acceleration-control) | OrcaSlicer (ABS) | 220 | 0.59 |
| cube_10mm_petg.gcode | [tommasobbianchi/ShidaoSlicer validation/orca_gcode/](https://github.com/tommasobbianchi/ShidaoSlicer) | OrcaSlicer, `filament_density = 0` | 515 | 0.72 (est. from 0.58 cm³) |
| SimpleCuraTest.gcode | [mriscoc/Ender3V2S1 slicer scripts/cura/](https://github.com/mriscoc/Ender3V2S1) | Cura, Marlin header | 420 | 0.98 (from length) |
| xyzCalibration_cube.gcode | [YouMakeTech/klipper-ender3 demo/](https://github.com/YouMakeTech/klipper-ender3) | Cura, Marlin header | 870 | 3.23 (from length) |
| AA8_cover_usb.gcode | [verlab/hero_common hero_resources/3d_printer/](https://github.com/verlab/hero_common) | Cura, Marlin header | 168 | 0.25 (from length) |

cube_10mm_petg.gcode exposed a bug: its profile has no density, so the slicer wrote `total filament used [g] = 0.00` and we used to report 0 g. The parser now treats 0 g with filament used as missing, ignores densities <= 0, prefers `filament used [cm3]` x density, falls back to the material type's typical density (else PLA), and warns "Your slicer profile has no filament density, so weight is estimated." Note that the same file labels its filament `PLA` although the file name says PETG. We trust the label, giving 0.72 g; at PETG density it would be 0.74 g.

## Printer model (checked 2026-10-10, hq t012)

What the parser reports as `printerModel` / `printerPreset` for the real files above; times and weights were unchanged.

| File | printerModel | printerPreset |
|---|---|---|
| 3DBenchy.gcode | MINIIS | Original Prusa MINI & MINI+ Input Shaper - no purge line |
| test.gcode, test.bgcode | MINI | Original Prusa MINI & MINI+ |
| cubewithironing.gcode | Elegoo Centauri Carbon | My Elegoo Centauri Carbon 0.4 nozzle - DELTANOPURGE |
| orcaslicer.gcode | Generic Klipper Printer | MyKlipper 0.4 nozzle |
| cube_h2c.gcode.3mf | Bambu Lab H2C (from Metadata/project_settings.config) | Bambu Lab H2C 0.4 nozzle |
| simple.gcode (Cura Griffin) | Ultimaker S5 | none |
| SimpleCuraTest.gcode, xyzCalibration_cube.gcode (Cura, Marlin) | none (the machine is only inside the `;SETTING_3` blob) | none |

PrusaSlicer's `printer_model` is a short code (MINIIS, MK4S), so the Pro preview matches against the model and the preset name together.

## Printer power (average while printing)

- Prusa knowledge base FAQ: MK-series about 80 W with PLA, 120 W with ABS, at 26 °C room temperature.
  https://help.prusa3d.com/article/faq-frequently-asked-questions_1932
- Bambu Lab wiki, "Printer and AMS power parameters" (PLA / ABS / PC average W):
  A1 mini 80 (PETG 75); A1 95 / 200 / 150; P1P 110 / 170 / 160; P1S 105 / 140 / 135;
  X1/X1C 105 / 150 / 135; X1E 185 / 260 / 230; P2S 200 (PLA); H2D 197 PLA, 150 PETG, 395 PC;
  X2D 250 PLA, 550 PC; A2L about 145 (PLA, 1 h).
  https://wiki.bambulab.com/en/general/power-consumption

The calculator defaults to 100 W, the typical PLA figure from these sources.

## Unsliced and project 3MFs (checked 2026-10-10)

These files carry no print results, so the parser must explain what to do instead of failing generically.

| File | Source | What it is | Result |
|---|---|---|---|
| box.3mf, cube_gears.3mf | [3MFConsortium/3mf-samples examples/core](https://github.com/3MFConsortium/3mf-samples/tree/master/examples/core) | plain model | "This is a 3D model, not a sliced file..." |
| flowrate-test-pass1.3mf, -pass2.3mf | [SoftFever/OrcaSlicer resources/calib/filament_flow](https://github.com/SoftFever/OrcaSlicer/tree/main/resources/calib/filament_flow) | plain model written by OrcaSlicer (zip64) | same; used to fail with "Corrupt zip directory" |
| Büchse.3mf | [prusa3d/PrusaSlicer tests/data/test_3mf/Geräte](https://github.com/prusa3d/PrusaSlicer/tree/master/tests/data/test_3mf) | plain model | same |
| seam_test_object.3mf | [prusa3d/PrusaSlicer tests/data](https://github.com/prusa3d/PrusaSlicer/tree/master/tests/data) | PrusaSlicer project (Metadata/Slic3r_PE.config) | "PrusaSlicer project files don't store print results..." |
| cube_h2c.gcode.3mf, two_plates_h2c.gcode.3mf | BambuMate fixtures (above) | sliced Bambu exports, re-checked | unchanged: 843 s / 3.69 g, 9295 s / 149.85 g |

The OrcaSlicer files exposed a real bug: OrcaSlicer writes **zip64** archives (sizes and offsets in a zip64 extra field), which the zip reader didn't support, so every Orca-written 3MF was rejected. Fixed with zip64 support in src/parsers/zip.ts.

Still missing real samples (synthetic fixtures only): a Bambu Studio / OrcaSlicer project saved **before** slicing (project_settings.config, slice_info without `prediction`) and a Cura project (`Cura/` entries). Finding them needs GitHub code search, so a local session.
