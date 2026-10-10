# Written by an AI agent (Claude).
# Independent "what did the slicer itself say" extraction, to compare against our parser.
import json, re, sys, zipfile, os, struct, zlib
def hms(s):
    t=0
    for n,u in re.findall(r'(\d+)\s*([dhms])', s): t+=int(n)*{'d':86400,'h':3600,'m':60,'s':1}[u]
    return t
def from_text(txt):
    g=t=None; L=0.0; dens=None; dia=1.75
    for line in txt.splitlines():
        m=re.match(r';\s*total filament used \[g\]\s*=\s*([\d.]+)',line) or re.match(r';\s*total filament weight \[g\]\s*:\s*([\d.,]+)',line)
        if m: g=sum(float(x) for x in m[1].split(',') if x)
        m=re.match(r';\s*estimated printing time \(normal mode\)\s*=\s*(.+)',line) or re.search(r'total estimated time:\s*([\dhms d]+)',line)
        if m and t is None: t=hms(m[1])
        m=re.match(r';\s*filament_density\s*[=:]\s*([\d.]+)',line)
        if m: dens=float(m[1])
        m=re.match(r';\s*(?:total )?filament (?:used \[mm\]\s*=|length \[mm\]\s*:)\s*([\d.,]+)',line)
        if m: L=sum(float(x) for x in m[1].split(',') if x)
    calc=round(L*3.14159265*(dia/2)**2*dens/1000,2) if (L and dens) else None
    return g,t,calc
def bg_meta(b):
    # walk .bgcode blocks, return decoded print/printer metadata text (deflate or none)
    p=10; out=[]
    while p+8<=len(b):
        typ,comp,usize=struct.unpack_from('<HHI',b,p); p+=8
        csize=usize if comp==0 else struct.unpack_from('<I',b,p)[0]
        if comp: p+=4
        params=2; data=b[p+params:p+params+csize]
        if typ in (0,1,2,3,4):  # metadata
            if typ in (2,3,4,0):
                txt=data if comp==0 else (zlib.decompress(data) if comp==1 else b'')
                out.append(txt.decode('utf-8','replace'))
        p+=params+csize+4
    return '\n'.join('; '+l.replace('=',' = ',1) for l in '\n'.join(out).splitlines())
def truth(path):
    b=open(path,'rb').read()
    if b[:4]==b'GCDE': return from_text(bg_meta(b))
    if b[:2]==b'PK':
        z=zipfile.ZipFile(path)
        if 'Metadata/slice_info.config' in z.namelist():
            x=z.read('Metadata/slice_info.config').decode()
            ps=[float(v) for v in re.findall(r'key="prediction" value="([\d.]+)"',x)]
            ws=[float(v) for v in re.findall(r'key="weight" value="([\d.]+)"',x)]
            if ps: return (round(sum(ws),2) if ws else None, int(sum(ps)), None)
        return (None,None,None)
    return from_text(b.decode('utf-8','replace'))
res=json.load(open(sys.argv[2]))
print(f"{'case':22} {'file':27} {'stated g':>9} {'ours g':>8} {'len*dens g':>10} {'stated t':>9} {'ours t':>8}  verdict")
for r in res:
    g,t,calc=truth(os.path.join(sys.argv[1],r['case'],r['file']))
    og,ot=r.get('totalWeightG'),r.get('printTimeSeconds')
    if not r['ok']: v='rejected: '+r['error'][:50]
    else:
        bad=[]
        if g is not None and (og is None or abs(og-g)>0.01): bad.append('weight')
        if t is not None and (ot is None or abs(ot-t)>1): bad.append('time')
        if t is None and ot is None: bad.append('no time anywhere?')
        v='MATCH' if not bad else 'MISMATCH '+','.join(bad)
    print(f"{r['case']:22} {r['file']:27} {str(g):>9} {str(og):>8} {str(calc):>10} {str(t):>9} {str(ot):>8}  {v}")
