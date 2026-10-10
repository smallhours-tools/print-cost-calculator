# Written by an AI agent (Claude).
# Usage: python3 flatten_ini.py "<Program Files>/Prusa3D/PrusaSlicer/resources/profiles/PrusaResearch.ini" <dir>/profiles/mk4s_pla.ini \
#   "printer:Original Prusa MK4S 0.4 nozzle" "print:0.20mm SPEED @MK4S 0.4" "filament:Prusament PLA @PG"   (PETG: "filament:Prusament PETG @PG" -> mk4s_petg.ini)
# Resolve a PrusaSlicer vendor-bundle preset (inherits = a; b; ...) into a flat .ini for --load.
import sys, re
def parse(path):
    secs, cur = {}, None
    for line in open(path, encoding='utf-8'):
        line = line.rstrip('\n')
        m = re.match(r'^\[(\w+):(.+)\]$', line)
        if m: cur = (m[1], m[2]); secs[cur] = {}; continue
        if cur and ' = ' in line and not line.startswith('#'):
            k, v = line.split(' = ', 1); secs[cur][k] = v
        elif cur and line.endswith(' =') : secs[cur][line[:-2]] = ''
    return secs
def flat(secs, kind, name):
    s = secs[(kind, name)]; out = {}
    for parent in [p.strip() for p in s.get('inherits', '').split(';') if p.strip()]:
        out.update(flat(secs, kind, parent))
    out.update(s); out.pop('inherits', None); return out
if __name__ == '__main__':
    bundle, out, *specs = sys.argv[1:]
    secs = parse(bundle); merged = {}
    for spec in specs:
        kind, name = spec.split(':', 1); merged.update(flat(secs, kind, name))
    for k in ('renamed_from', 'compatible_printers', 'compatible_printers_condition', 'compatible_prints', 'compatible_prints_condition'):
        merged.pop(k, None)
    with open(out, 'w', encoding='utf-8') as f:
        for k, v in merged.items(): f.write(f'{k} = {v}\n')
    print(out, 'density', merged.get('filament_density'), 'model', merged.get('printer_model'))
