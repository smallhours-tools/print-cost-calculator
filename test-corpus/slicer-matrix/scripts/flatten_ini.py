# Written by an AI agent (Claude).
# Usage: python3 flatten_ini.py "<Program Files>/Prusa3D/PrusaSlicer/resources/profiles/PrusaResearch.ini" <dir>/profiles/mk4s_pla.ini \
#   "printer:Original Prusa MK4S 0.4 nozzle" "print:0.20mm SPEED @MK4S 0.4" "filament:Prusament PLA @PG"   (PETG: "filament:Prusament PETG @PG" -> mk4s_petg.ini)
# Multi-tool: one filament spec per extruder, e.g. xl2t_pla_petg.ini from "printer:Original Prusa XL - 2T Input Shaper 0.4 nozzle"
#   "print:0.20mm SPEED @XLIS 0.4" "filament:Prusament PLA @XLIS" "filament:Prusament PETG @XL"
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
    secs = parse(bundle); merged = {}; fils = []
    for spec in specs:
        kind, name = spec.split(':', 1)
        if kind == 'filament': fils.append(flat(secs, kind, name))
        else: merged.update(flat(secs, kind, name))
    # Several filament specs = one filament per extruder (multi-tool/MMU). Per-extruder values are joined
    # into vectors: numbers with ',' (unset = nil), strings with ';'. Keys whose values all match stay single (PrusaSlicer reuses value 0).
    for k in dict.fromkeys(k for f in fils for k in f):
        vals = [f.get(k, fils[0].get(k, '')) for f in fils]
        if len(set(vals)) == 1: merged[k] = vals[0]
        elif all(re.fullmatch(r'-?[\d.]+%?|nil|', v) for v in vals): merged[k] = ','.join(v or 'nil' for v in vals)
        else: merged[k] = ';'.join(v if v.startswith('"') else '"' + v + '"' for v in vals)
    if len(fils) > 1: merged['filament_settings_id'] = ';'.join('"' + s.split(':', 1)[1] + '"' for s in specs if s.startswith('filament:'))
    for k in ('renamed_from', 'compatible_printers', 'compatible_printers_condition', 'compatible_prints', 'compatible_prints_condition'):
        merged.pop(k, None)
    with open(out, 'w', encoding='utf-8') as f:
        for k, v in merged.items(): f.write(f'{k} = {v}\n')
    print(out, 'density', merged.get('filament_density'), 'model', merged.get('printer_model'))
