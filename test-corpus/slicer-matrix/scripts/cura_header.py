# Written by an AI agent (Claude).
# Usage: python3 cura_header.py <CuraEngine -v log> <out.gcode>
# Run standalone, CuraEngine writes a placeholder header (;TIME:6666, ;Filament used: 0m) at the top of the file
# and logs the real one ("Gcode header after slicing: ...") at the end. The Cura app swaps the real header in
# when it saves; this does the same so the file looks like an app export (minus the app's ;SETTING_3 footer).
# It also cuts ;MESH: lines down to the file name: the engine writes the full input path there (the app writes the name).
import re, sys
log, gcode = sys.argv[1:3]
txt = open(log, encoding='utf-8', errors='replace').read()
m = re.search(r'Gcode header after slicing: (.*?)\n\n', txt, re.S)
if not m: raise SystemExit('no header in log')
header = m[1].rstrip('\n') + '\n'
g = open(gcode, encoding='utf-8', errors='replace', newline='').read()
g = re.sub(r'^;MESH:[^\r\n]*[\\/]', ';MESH:', g, flags=re.M)
nl = '\r\n' if '\r\n' in g[:500] else '\n'
end = g.index(';Generated with')   # placeholder block = everything before this line
open(gcode, 'w', encoding='utf-8', newline='').write(header.replace('\n', nl) + nl + g[end:])
print(gcode, ' '.join(l for l in header.splitlines() if l.startswith((';TIME', ';Filament', ';PRINT.TIME', ';EXTRUDER_TRAIN.0.MATERIAL.VOLUME'))))
