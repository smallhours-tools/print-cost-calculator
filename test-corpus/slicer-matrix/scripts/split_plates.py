# Written by an AI agent (Claude).
# Usage: python3 split_plates.py in.3mf out.3mf [bed_width_mm=256]
# Turn a one-plate Bambu Studio / OrcaSlicer project (exported by the CLI) into a two-plate project: the last
# object moves to plate 2. The CLI can't create plates itself and crashes on hand-written project 3MFs,
# so we edit one it wrote. Plate N sits (N-1) * bed_width * 1.2 to the right of plate 1 (the slicers' plate gap).
import re, sys, zipfile
src, dst = sys.argv[1:3]; stride = float(sys.argv[3] if len(sys.argv) > 3 else 256) * 1.2
zin = zipfile.ZipFile(src); files = {n: zin.read(n) for n in zin.namelist()}
cfg = files['Metadata/model_settings.config'].decode()
insts = re.findall(r'\s*<model_instance>.*?</model_instance>', cfg, re.S)
last = insts[-1]; oid = re.search(r'key="object_id" value="(\d+)"', last)[1]
plate1 = re.search(r'<plate>.*?</plate>', cfg, re.S)[0]
plate2 = re.sub(r'\s*<model_instance>.*?</model_instance>', '', plate1, flags=re.S).replace('value="1"/>', 'value="2"/>', 1)
plate2 = plate2.replace('_1.png', '_2.png').replace('</plate>', last + '\n  </plate>')
cfg = cfg.replace(plate1, plate1.replace(last, '') + '\n  ' + plate2)
model = files['3D/3dmodel.model'].decode()
def move(m):
    t = m[2].split(); t[9] = f'{float(t[9]) + stride:g}'; return m[1] + ' '.join(t) + '"'
model = re.sub(r'(<item objectid="' + oid + r'"[^>]*?transform=")([^"]+)"', move, model)
files['Metadata/model_settings.config'] = cfg.encode(); files['3D/3dmodel.model'] = model.encode()
with zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED) as z:
    for n, b in files.items():
        if not n.endswith('.png'): z.writestr(n, b)   # thumbnails are regenerated / optional
print(dst, 'object', oid, '-> plate 2')
