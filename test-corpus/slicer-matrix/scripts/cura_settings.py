# Written by an AI agent (Claude).
# Usage: python3 cura_settings.py "<Cura>/share/cura/resources" creality_ender3 <outdir> [key=value ...]
# CuraEngine on its own only reads each setting's default_value; the Cura app evaluates the Python "value"
# formulas (e.g. infill_line_distance from infill density) before sending settings to the engine. This
# resolves machine + extruder definitions and those formulas, then writes flat <outdir>/global.def.json and
# <outdir>/extruder_N.def.json for: CuraEngine slice -j global.def.json -e0 -j extruder_0.def.json -l model.stl -o out.gcode
# Not resolved: the app's quality / material / variant profiles (pass the few that matter as key=value overrides).
# So engine output differs from what the Cura app would produce for the same printer.
import json, math, os, sys

RES, MACHINE, OUT, *OVR = sys.argv[1:]

def load(name):
    for sub in ('definitions', 'extruders'):
        p = os.path.join(RES, sub, name + '.def.json')
        if os.path.exists(p): return json.load(open(p, encoding='utf-8'))
    raise SystemExit('definition not found: ' + name)

def chain(name):  # [leaf, ..., root]
    out = []
    while name:
        d = load(name); out.append(d); name = d.get('inherits')
    return out

def walk(tree, out):
    for k, v in tree.items():
        out[k] = dict(v)
        if 'children' in v: walk(v['children'], out)

def settings_of(ch):  # base settings from the root definition, then overrides leaf-first wins
    base = {}
    for cat in ch[-1]['settings'].values(): walk(cat.get('children', {}), base); base.setdefault(cat.get('key', ''), {})
    for d in reversed(ch[:-1]):
        for k, v in d.get('overrides', {}).items():
            s = base.setdefault(k, {}); s.update(v)
            if 'default_value' in v and 'value' not in v: s.pop('value', None)
    return base

g_ch = chain(MACHINE)
glob = settings_of(g_ch)
trains = {}
for d in reversed(g_ch): trains.update(d.get('metadata', {}).get('machine_extruder_trains', {}))
user = dict(kv.split('=', 1) for kv in OVR)
ext_defs = {int(i): settings_of(chain(n)) for i, n in trains.items()}

class Scope(dict):
    def __init__(self, defs, parent, nr):
        super().__init__(); self.defs, self.parent, self.nr = defs, parent, nr
    def __missing__(self, k):
        if k in FUNCS: return FUNCS[k]
        mine = self.defs is not None and (k in ext_only.get(self.nr, set()) or (k not in glob and k in self.defs))
        if self.parent is not None and not mine and not per_extruder(k):
            v = self.parent[k]; self[k] = v; return v
        src = self.defs[k] if mine else glob.get(k)
        if src is None: raise KeyError(k)
        self[k] = None  # cycle guard
        if k in user: v = conv(user[k], src)
        elif self.parent is None and per_extruder(k) and 'resolve' in src: v = ev(src['resolve'], self)
        elif self.parent is None and per_extruder(k) and 'value' not in src and 'default_value' not in src: v = None
        elif 'value' in src: v = ev(src['value'], self)
        else: v = src.get('default_value')
        self[k] = v; return v

def per_extruder(k): return glob.get(k, {}).get('settable_per_extruder', False)
def conv(s, src):
    t = src.get('type')
    if t in ('float',): return float(s)
    if t in ('int',): return int(s)
    if t == 'bool': return s.lower() in ('true', '1', 'yes', 'on')
    return s
# Extruder definitions override some settings (machine_nozzle_size, offsets...): those keys live in the extruder scope.
ext_only = {}
for i, n in trains.items():
    keys = set()
    for d in chain(n)[:-1]: keys |= set(d.get('overrides', {}))
    keys |= {k for k, v in ext_defs[int(i)].items() if k not in glob and 'type' in v}   # fdmextruder-only settings
    ext_only[int(i)] = keys

def ev(expr, scope):
    if not isinstance(expr, str): return expr
    try: return eval(expr, {'math': math, '__builtins__': __builtins__}, scope)
    except Exception as e: raise SystemExit(f'cannot evaluate {expr!r}: {e}')

G = Scope(None, None, -1)
E = {i: Scope(ext_defs[i], G, i) for i in ext_defs} or {0: Scope(None, G, 0)}
def ext(i):
    i = int(i) if str(i).lstrip('-').isdigit() else 0
    return E.get(i if i >= 0 else 0, E[min(E)])
FUNCS = {
    'extruderValue': lambda i, k: ext(i)[k],
    'extruderValues': lambda k: [E[i][k] for i in sorted(E)],
    'resolveOrValue': lambda k: G[k],
    'anyExtruderWithMaterial': lambda k: E[min(E)][k],
    'anyExtruderNrWithOrDefault': lambda k: E[min(E)][k],
    'defaultExtruderPosition': lambda: '0',
    'valueFromContainer': lambda *a: None, 'valueFromExtruderContainer': lambda *a: None,
}

def fmt(v):
    if isinstance(v, bool): return 'true' if v else 'false'
    if isinstance(v, float): return repr(round(v, 6))
    if isinstance(v, (list, dict)): return json.dumps(v)
    return '' if v is None else str(v)

def dump(scope, keys, path):
    out = {}
    for k in keys:
        if glob.get(k, {}).get('type') == 'category': continue
        try: v = scope[k]
        except KeyError: continue
        out[k] = {'default_value': fmt(v)}
    json.dump({'version': 2, 'name': os.path.basename(path), 'metadata': {}, 'settings': out}, open(path, 'w', encoding='utf-8'), indent=0)
    return out

os.makedirs(OUT, exist_ok=True)
allkeys = list(dict.fromkeys([k for k, v in glob.items() if 'type' in v] + [k for d in ext_defs.values() for k, v in d.items() if 'type' in v]))
g = dump(G, allkeys, os.path.join(OUT, 'global.def.json'))
for i in sorted(E):
    dump(E[i], allkeys, os.path.join(OUT, f'extruder_{i}.def.json'))
print(OUT, len(g), 'settings;', len(E), 'extruder(s);', 'layer_height', g.get('layer_height'), 'infill_line_distance', g.get('infill_line_distance'))
