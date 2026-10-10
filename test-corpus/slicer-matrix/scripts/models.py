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
