# Test-model generator for slicer round-trip tests. Written by an AI agent (Claude).
# Each model targets one parser edge case; all are original geometry (MIT with the repo).
import math, os, sys
OUT = sys.argv[1]
def box(x0,y0,z0,x1,y1,z1):
    v=lambda i,j,k:((x0,x1)[i],(y0,y1)[j],(z0,z1)[k])
    quads=[((0,0,0),(0,1,0),(1,1,0),(1,0,0)),((0,0,1),(1,0,1),(1,1,1),(0,1,1)),
           ((0,0,0),(1,0,0),(1,0,1),(0,0,1)),((0,1,0),(0,1,1),(1,1,1),(1,1,0)),
           ((0,0,0),(0,0,1),(0,1,1),(0,1,0)),((1,0,0),(1,1,0),(1,1,1),(1,0,1))]
    t=[]
    for q in quads:
        a,b,c,d=[v(*p) for p in q]; t+=[(a,b,c),(a,c,d)]
    return t
def cyl(cx,cy,r,h,n=96):
    t=[]; p=[(cx+r*math.cos(2*math.pi*i/n), cy+r*math.sin(2*math.pi*i/n)) for i in range(n)]
    for i in range(n):
        a,b=p[i],p[(i+1)%n]
        t+=[((cx,cy,0),(b[0],b[1],0),(a[0],a[1],0)), ((cx,cy,h),(a[0],a[1],h),(b[0],b[1],h)),
            ((a[0],a[1],0),(b[0],b[1],0),(b[0],b[1],h)), ((a[0],a[1],0),(b[0],b[1],h),(a[0],a[1],h))]
    return t
def stl(name, tris):
    with open(os.path.join(OUT, name + '.stl'), 'w') as f:
        f.write(f'solid {name}\n')
        for a,b,c in tris:
            f.write(' facet normal 0 0 0\n  outer loop\n' + ''.join(f'   vertex {p[0]:.4f} {p[1]:.4f} {p[2]:.4f}\n' for p in (a,b,c)) + '  endloop\n endfacet\n')
        f.write(f'endsolid {name}\n')
stl('cube20', box(0,0,0,20,20,20))                 # baseline
stl('tiny5', box(0,0,0,5,5,5))                     # under a minute of printing: seconds-only time strings
stl('tee_overhang', box(-4,-4,0,4,4,30) + box(-30,-4,30,30,4,36))  # 26 mm horizontal arms: needs supports
stl('vase_cyl', cyl(0,0,30,80))                    # spiral/vase mode
stl('slab_long', box(-75,-75,0,75,75,60))            # with 100% infill: a multi-day print (day units in time strings)
stl('pair_a', box(0,0,0,20,20,10)); stl('pair_b', box(30,0,0,50,20,10))   # two objects for multi-material

# Multi-material input for PrusaSlicer: a 3MF whose Metadata/Slic3r_PE_model.config puts each object on its own
# extruder (the CLI has no per-object extruder option). Bambu Studio / OrcaSlicer crash on hand-written project
# 3MFs, so their multi-filament cases use --load-filament-ids with STLs instead (see run_matrix.sh).
import zipfile
def prusa3mf(name, objects, at=(0, 0)):   # objects: (name, tris, extruder)
    objs, cfg = [], []
    for oid, (oname, tris, ext) in enumerate(objects, 1):
        idx = {}; ts = [[idx.setdefault(p, len(idx)) for p in tri] for tri in tris]
        mesh = ('<mesh><vertices>' + ''.join(f'<vertex x="{x:.4f}" y="{y:.4f}" z="{z:.4f}"/>' for x, y, z in sorted(idx, key=idx.get)) +
                '</vertices><triangles>' + ''.join(f'<triangle v1="{a}" v2="{b}" v3="{c}"/>' for a, b, c in ts) + '</triangles></mesh>')
        objs.append(f'<object id="{oid}" name="{oname}" type="model">{mesh}</object>')
        cfg.append(f'<object id="{oid}" instances_count="1"><metadata type="object" key="name" value="{oname}"/>'
                   f'<metadata type="object" key="extruder" value="{ext}"/><volume firstid="0" lastid="{len(ts)-1}">'
                   f'<metadata type="volume" key="name" value="{oname}"/><metadata type="volume" key="volume_type" value="ModelPart"/></volume></object>')
    build = ''.join(f'<item objectid="{i}" transform="1 0 0 0 1 0 0 0 1 {at[0]} {at[1]} 0"/>' for i in range(1, len(objects) + 1))
    with zipfile.ZipFile(os.path.join(OUT, name + '.3mf'), 'w', zipfile.ZIP_DEFLATED) as z:
        z.writestr('[Content_Types].xml', '<?xml version="1.0" encoding="UTF-8"?>\n<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
                   '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
                   '<Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
        z.writestr('_rels/.rels', '<?xml version="1.0" encoding="UTF-8"?>\n<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
                   '<Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>')
        z.writestr('3D/3dmodel.model', '<?xml version="1.0" encoding="UTF-8"?>\n<model unit="millimeter" xml:lang="en-US" '
                   'xmlns="http://schemas.microsoft.com/3dmanufacturing/core/2015/02"><resources>' + ''.join(objs) + '</resources><build>' + build + '</build></model>')
        z.writestr('Metadata/Slic3r_PE_model.config', '<?xml version="1.0" encoding="UTF-8"?>\n<config>' + ''.join(cfg) + '</config>')
prusa3mf('pair_prusa', [('pair_a', box(0,0,0,20,20,10), 1), ('pair_b', box(30,0,0,50,20,10), 2)], at=(110, 120))   # PLA on T0, PETG on T1
