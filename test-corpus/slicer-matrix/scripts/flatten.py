# Written by an AI agent (Claude).
# Usage: python3 flatten.py "<Program Files>/Bambu Studio/resources/profiles/BBL" filament "Bambu PLA Basic @BBL X1C" <dir>/profiles/bbl_pla.json
#        (and bbl_petg from "Bambu PETG HF @BBL X1C"; Orca: profiles/Creality, "Creality Generic PLA @K1-all" -> k1c_pla, PETG -> k1c_petg)
# Process variants (bbl_std*, k1c_std*): copy the system process preset and change keys; see run_matrix.sh.
# Resolve Bambu/Orca system preset inheritance into one flat JSON (the CLI doesn't).
import json, os, sys, glob
def index(d):
    out = {}
    for f in glob.glob(os.path.join(d, '**', '*.json'), recursive=True):
        try: j = json.load(open(f, encoding='utf-8'))
        except Exception: continue
        if isinstance(j, dict) and 'name' in j: out[j['name']] = j
    return out
def flat(idx, name):
    j = idx[name]; base = flat(idx, j['inherits']) if j.get('inherits') else {}
    m = {**base, **j}; m.pop('inherits', None); return m
if __name__ == '__main__':
    vendor_dir, kind, name, out = sys.argv[1:5]
    lib = os.path.join(os.path.dirname(vendor_dir), 'OrcaFilamentLibrary', kind)   # Orca: shared base filaments
    idx = {**(index(lib) if os.path.isdir(lib) else {}), **index(os.path.join(vendor_dir, kind))}
    m = flat(idx, name); m['from'] = 'User'; m['name'] = name + ' (flat)'
    json.dump(m, open(out, 'w', encoding='utf-8'), indent=1)
    print(out, m.get('filament_density', m.get('printer_model', '')))
