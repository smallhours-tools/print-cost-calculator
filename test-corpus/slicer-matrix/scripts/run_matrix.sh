#!/usr/bin/env bash
# Written by an AI agent (Claude).
# Slice every test model with the owner's installed slicers. Outputs land in shtest/cases/<case>/.
set -u
# Run from WSL on a Windows PC with the slicers installed. Set both paths to the same work folder:
#   SHTEST=/mnt/c/.../shtest  SHTEST_WIN='C:\...\shtest'  (needs models/ and profiles/ inside; see README.md)
# CASES='^(P1|C)' re-runs only matching cases and keeps the others.
S=${SHTEST:?set SHTEST}; W=${SHTEST_WIN:?set SHTEST_WIN}
PS="/mnt/c/Program Files/Prusa3D/PrusaSlicer/prusa-slicer-console.exe"
BS="/mnt/c/Program Files/Bambu Studio/bambu-studio.exe"; OS="/mnt/c/Program Files/OrcaSlicer/orca-slicer.exe"
for f in mk4s_pla mk4s_petg xl2t_pla_petg; do sed 's/^binary_gcode = .*/binary_gcode = 0/' $S/profiles/$f.ini > $S/profiles/${f}_ascii.ini; done
BM='C:\Program Files\Bambu Studio\resources\profiles\BBL\machine\Bambu Lab P1S 0.4 nozzle.json'
OM='C:\Program Files\OrcaSlicer\resources\profiles\Creality\machine\Creality K1C 0.4 nozzle.json'
SC=$(cd "$(dirname "$0")" && pwd)
CURA="/mnt/c/Program Files/UltiMaker Cura 5.13.0"; CR="$CURA/share/cura/resources"
if [ -z "${CASES:-}" ]; then rm -rf $S/cases; fi; mkdir -p $S/cases
want() { [ -z "${CASES:-}" ] || [[ $1 =~ $CASES ]]; }
prusa() { # case ini model ext [extra args...]
  local c=$1 ini=$2 m=$3 ext=$4; shift 4; want $c || return 0; rm -rf $S/cases/$c; mkdir -p $S/cases/$c
  [[ $m == *.* ]] || m=$m.stl
  "$PS" --load "$W\\profiles\\$ini.ini" "$@" --output "$W\\cases\\$c\\$c.$ext" "$W\\models\\$m" > $S/cases/$c/log.txt 2>&1; echo "$c exit $?"
}
bo() { # slicer case machine process filament model [slice: yes|no]
  local exe=$1 c=$2 mach=$3 proc=$4 fil=$5 m=$6 sl=${7:-yes}; want $c || return 0; rm -rf $S/cases/$c; mkdir -p $S/cases/$c
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

# --- Round 2: multi-material, multi-plate, CuraEngine ---
prusa P10_xl2t_pla_petg        xl2t_pla_petg_ascii pair_prusa.3mf gcode  --export-gcode   # objects on T0/T1 + wipe tower
prusa P11_xl2t_pla_petg_bgcode xl2t_pla_petg       pair_prusa.3mf bgcode --export-gcode
multi() { # slicer case "settings" "filaments" ids models...   one STL per filament id
  local exe=$1 c=$2 set=$3 fil=$4 ids=$5; shift 5; want $c || return 0; rm -rf $S/cases/$c; mkdir -p $S/cases/$c
  local ms=(); for m in "$@"; do ms+=("$W\\models\\$m.stl"); done
  timeout 900 "$exe" --load-settings "$set" --load-filaments "$fil" --load-filament-ids "$ids" --arrange 1 --curr-bed-type "Textured PEI Plate" \
    --outputdir "$W\\cases\\$c" --slice 0 --export-3mf "$c.gcode.3mf" "${ms[@]}" > $S/cases/$c/log.txt 2>&1; echo "$c exit $?"
}
plates() { # slicer case "settings" filament bed_width models...   one model per plate
  local exe=$1 c=$2 set=$3 fil=$4 bw=$5; shift 5; want $c || return 0; rm -rf $S/cases/$c; mkdir -p $S/cases/$c/src
  local ms=(); for m in "$@"; do ms+=("$W\\models\\$m.stl"); done
  timeout 900 "$exe" --load-settings "$set" --load-filaments "$fil" --arrange 1 --curr-bed-type "Textured PEI Plate" \
    --outputdir "$W\\cases\\$c\\src" --export-3mf one_plate.3mf "${ms[@]}" > $S/cases/$c/src/log.txt 2>&1
  python3 "$SC/split_plates.py" $S/cases/$c/src/one_plate.3mf $S/cases/$c/src/two_plates.3mf $bw
  timeout 900 "$exe" --outputdir "$W\\cases\\$c" --slice 0 --export-3mf "$c.gcode.3mf" "$W\\cases\\$c\\src\\two_plates.3mf" > $S/cases/$c/log.txt 2>&1
  echo "$c exit $?"; rm -rf $S/cases/$c/src
}
BSYS="$W\\profiles\\bbl_p1s_sys.json;$W\\profiles\\bbl_std_sys.json"; OSYS="$OM;$W\\profiles\\k1c_std.json"
multi  "$BS" B08_ams_pla_petg "$BSYS" "$W\\profiles\\bbl_pla_c.json;$W\\profiles\\bbl_petg_c.json" 1,2 pair_a pair_b
plates "$BS" B09_two_plates   "$BSYS" "$W\\profiles\\bbl_pla_c.json" 256 cube20 tee_overhang
multi  "$OS" O08_two_pla      "$OSYS" "$W\\profiles\\k1c_pla_a.json;$W\\profiles\\k1c_pla_b.json" 1,2 pair_a pair_b   # PLA+PETG: "nozzle temperatures are incompatible"
plates "$OS" O09_two_plates   "$OSYS" "$W\\profiles\\k1c_pla.json" 220 cube20 tee_overhang
cura() { # case machine "<-e N model>..."   engine-only; settings resolved by cura_settings.py, header fixed by cura_header.py
  local c=$1 mach=$2; shift 2; want $c || return 0; rm -rf $S/cases/$c; mkdir -p $S/cases/$c
  local ovr=(layer_height=0.2); [[ $mach == ultimaker_* ]] && ovr+=("machine_nozzle_id=AA 0.4")   # the app's variant profile sets this
  python3 "$SC/cura_settings.py" "$CR" $mach $S/cura/$mach "${ovr[@]}" > /dev/null
  local args=(-j "$W\\cura\\$mach\\global.def.json") n
  for n in $(ls $S/cura/$mach | grep -o '[0-9]*' | sort -rn); do   # highest extruder first: -l attaches meshes to the current one
    args+=(-e$n -j "$W\\cura\\$mach\\extruder_$n.def.json"); for m in "$@"; do [[ $m == $n:* ]] && args+=(-l "$W\\models\\${m#*:}.stl"); done
  done
  timeout 900 "$CURA/CuraEngine.exe" slice -v "${args[@]}" -o "$W\\cases\\$c\\$c.gcode" > $S/cases/$c/log.txt 2>&1; echo "$c exit $?"
  python3 "$SC/cura_header.py" $S/cases/$c/log.txt $S/cases/$c/$c.gcode > /dev/null
}
cura C01_ender3_cube creality_ender3 0:cube20
cura C02_s5_cube     ultimaker_s5    0:cube20
cura C03_s5_dual     ultimaker_s5    0:pair_a 1:pair_b
