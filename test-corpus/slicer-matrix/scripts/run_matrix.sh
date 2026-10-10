#!/usr/bin/env bash
# Written by an AI agent (Claude).
# Slice every test model with the owner's installed slicers. Outputs land in shtest/cases/<case>/.
set -u
# Run from WSL on a Windows PC with the slicers installed. Set both paths to the same work folder:
#   SHTEST=/mnt/c/.../shtest  SHTEST_WIN='C:\...\shtest'  (needs models/ and profiles/ inside; see README.md)
S=${SHTEST:?set SHTEST}; W=${SHTEST_WIN:?set SHTEST_WIN}
PS="/mnt/c/Program Files/Prusa3D/PrusaSlicer/prusa-slicer-console.exe"
BS="/mnt/c/Program Files/Bambu Studio/bambu-studio.exe"; OS="/mnt/c/Program Files/OrcaSlicer/orca-slicer.exe"
for f in mk4s_pla mk4s_petg; do sed 's/^binary_gcode = .*/binary_gcode = 0/' $S/profiles/$f.ini > $S/profiles/${f}_ascii.ini; done
BM='C:\Program Files\Bambu Studio\resources\profiles\BBL\machine\Bambu Lab P1S 0.4 nozzle.json'
OM='C:\Program Files\OrcaSlicer\resources\profiles\Creality\machine\Creality K1C 0.4 nozzle.json'
rm -rf $S/cases; mkdir -p $S/cases
prusa() { # case ini model ext [extra args...]
  local c=$1 ini=$2 m=$3 ext=$4; shift 4; mkdir -p $S/cases/$c
  "$PS" --load "$W\\profiles\\$ini.ini" "$@" --output "$W\\cases\\$c\\$c.$ext" "$W\\models\\$m.stl" > $S/cases/$c/log.txt 2>&1; echo "$c exit $?"
}
bo() { # slicer case machine process filament model [slice: yes|no]
  local exe=$1 c=$2 mach=$3 proc=$4 fil=$5 m=$6 sl=${7:-yes}; mkdir -p $S/cases/$c
  local args=(--load-settings "$mach;$W\\profiles\\$proc.json" --load-filaments "$W\\profiles\\$fil.json" --outputdir "$W\\cases\\$c")
  if [ "$sl" = yes ]; then args+=(--arrange 1 --curr-bed-type "Textured PEI Plate" --slice 0 --export-3mf "$c.gcode.3mf"); else args+=(--export-3mf "$c.3mf"); fi
  timeout 900 "$exe" "${args[@]}" "$W\\models\\$m.stl" > $S/cases/$c/log.txt 2>&1; echo "$c exit $?"
}
prusa P01_cube_bgcode    mk4s_pla        cube20 bgcode --export-gcode
prusa P02_cube_gcode     mk4s_pla_ascii  cube20 gcode  --export-gcode
prusa P03_cube_petg      mk4s_petg_ascii cube20 gcode  --export-gcode
prusa P04_tiny           mk4s_pla_ascii  tiny5  gcode  --export-gcode
prusa P05_supports       mk4s_pla_ascii  tee_overhang gcode --export-gcode --support-material --support-material-auto
prusa P06_vase           mk4s_pla_ascii  vase_cyl gcode --export-gcode --spiral-vase --no-support-material
prusa P07_long           mk4s_pla_ascii  slab_long gcode --export-gcode --fill-density 100% --fill-pattern rectilinear
prusa P08_bgcode_as_gcode mk4s_pla       cube20 gcode  --export-gcode
prusa P09_project_3mf    mk4s_pla        cube20 3mf    --export-3mf
for p in B O; do
  if [ $p = B ]; then exe=$BS mach=$BM proc=bbl_std pla=bbl_pla petg=bbl_petg; else exe=$OS mach=$OM proc=k1c_std pla=k1c_pla petg=k1c_petg; fi
  bo "$exe" ${p}01_cube     "$mach" $proc       $pla  cube20
  bo "$exe" ${p}02_petg     "$mach" $proc       $petg cube20
  bo "$exe" ${p}03_tiny     "$mach" $proc       $pla  tiny5
  bo "$exe" ${p}04_supports "$mach" ${proc}_sup  $pla tee_overhang
  bo "$exe" ${p}05_vase     "$mach" ${proc}_vase $pla vase_cyl
  bo "$exe" ${p}06_long     "$mach" ${proc}_full $pla slab_long
  bo "$exe" ${p}07_project_unsliced "$mach" $proc $pla cube20 no
done
