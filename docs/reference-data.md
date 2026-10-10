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

Still missing: a real OrcaSlicer G-code and a Cura file in the Marlin header style (`;TIME:` / `;Filament used:`).

## Printer power (average while printing)

- Prusa knowledge base FAQ: MK-series about 80 W with PLA, 120 W with ABS, at 26 °C room temperature.
  https://help.prusa3d.com/article/faq-frequently-asked-questions_1932
- Bambu Lab wiki, "Printer and AMS power parameters" (PLA / ABS / PC average W):
  A1 mini 80 (PETG 75); A1 95 / 200 / 150; P1P 110 / 170 / 160; P1S 105 / 140 / 135;
  X1/X1C 105 / 150 / 135; X1E 185 / 260 / 230; P2S 200 (PLA); H2D 197 PLA, 150 PETG, 395 PC;
  X2D 250 PLA, 550 PC; A2L about 145 (PLA, 1 h).
  https://wiki.bambulab.com/en/general/power-consumption

The calculator defaults to 100 W, the typical PLA figure from these sources.
