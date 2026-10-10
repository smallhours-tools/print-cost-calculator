# Written by an AI agent (Claude).
# Independent "what did the slicer itself say" extraction, to compare against our parser.
# Usage: python3 truth.py <cases dir> <results.json from the parser harness>
import json, re, sys, zipfile, os, struct, zlib
def hms(s):
    t=0
    for n,u in re.findall(r'(\d+)\s*([dhms])', s): t+=int(n)*{'d':86400,'h':3600,'m':60,'s':1}[u]
    return t
def nums(s): return [float(x) for x in re.split(r'[,;]', s) if x.strip()]
def from_text(txt):
    """-> dict: g (total grams), per_g (grams per filament), t (seconds), calc (length*density), length_mm, volume_mm3."""
    r=dict(g=None, per_g=None, t=None, calc=None, length_mm=None, volume_mm3=None)
    L=[]; dens=[]; dia=1.75; vol={}
    for line in txt.splitlines():
        m=re.match(r';\s*total filament used \[g\]\s*=\s*([\d.]+)',line)                    # Prusa/Orca total
        if m: r['g']=float(m[1])
        m=re.match(r';\s*filament used \[g\]\s*=\s*([\d.,\s]+)$',line)                       # Prusa/Orca per filament
        if m: r['per_g']=nums(m[1]); r['g']=r['g'] if r['g'] is not None else round(sum(r['per_g']),2)
        m=re.match(r';\s*total filament weight \[g\]\s*:\s*([\d.,]+)',line)                  # Bambu (per filament)
        if m: r['per_g']=nums(m[1]); r['g']=round(sum(r['per_g']),2)
        m=re.match(r';\s*estimated printing time \(normal mode\)\s*=\s*(.+)',line) or re.search(r'total estimated time:\s*([\dhms d]+)',line)
        if m and r['t'] is None: r['t']=hms(m[1])
        m=re.match(r';(?:PRINT\.)?TIME:(\d+)$',line)                                          # Cura Marlin / Griffin
        if m and r['t'] is None: r['t']=int(m[1])
        m=re.match(r';Filament used:\s*([\d.]+)m',line)                                        # Cura Marlin: metres, no grams
        if m: r['length_mm']=round(float(m[1])*1000,2)
        m=re.match(r';EXTRUDER_TRAIN\.(\d+)\.MATERIAL\.VOLUME_USED:([\d.]+)',line)            # Cura Griffin: mm^3, no grams
        if m: vol[int(m[1])]=float(m[2])
        m=re.match(r';\s*filament_density\s*[=:]\s*([\d.,]+)',line)
        if m: dens=nums(m[1])
        m=re.match(r';\s*(?:total )?filament (?:used \[mm\]\s*=|length \[mm\]\s*:)\s*([\d.,\s]+)$',line)
        if m: L=nums(m[1])
    if vol: r['volume_mm3']=[vol[k] for k in sorted(vol)]
    if L and dens:
        r['calc']=round(sum(l*3.14159265*(dia/2)**2*(dens[i] if i<len(dens) else dens[0])/1000 for i,l in enumerate(L)),2)
    elif r['length_mm']: r['calc']=round(r['length_mm']*3.14159265*(dia/2)**2*1.24/1000,2)   # Cura: PLA 1.24 assumed
    elif vol: r['calc']=round(sum(vol.values())*1.24/1000,2)
    return r
def bg_meta(b):
    # walk .bgcode blocks, return decoded print/printer metadata text (deflate or none)
    p=10; out=[]
    while p+8<=len(b):
        typ,comp,usize=struct.unpack_from('<HHI',b,p); p+=8
        csize=usize if comp==0 else struct.unpack_from('<I',b,p)[0]
        if comp: p+=4
        params=2; data=b[p+params:p+params+csize]
        if typ in (0,2,3,4):  # metadata
            txt=data if comp==0 else (zlib.decompress(data) if comp==1 else b'')
            out.append(txt.decode('utf-8','replace'))
        p+=params+csize+4
    return '\n'.join('; '+l.replace('=',' = ',1) for l in '\n'.join(out).splitlines())
def truth(path):
    b=open(path,'rb').read()
    if b[:4]==b'GCDE': return from_text(bg_meta(b))
    if b[:2]==b'PK':
        z=zipfile.ZipFile(path); r=dict(g=None, per_g=None, t=None, calc=None, length_mm=None, volume_mm3=None)
        if 'Metadata/slice_info.config' in z.namelist():
            x=z.read('Metadata/slice_info.config').decode()
            ps=[float(v) for v in re.findall(r'key="prediction" value="([\d.]+)"',x)]
            ws=[float(v) for v in re.findall(r'key="weight" value="([\d.]+)"',x)]
            fs=[float(v) for v in re.findall(r'<filament [^>]*used_g="([\d.]+)"',x)]
            if ps: r.update(g=round(sum(ws),2) if ws else None, t=int(sum(ps)), per_g=fs or None)
        return r
    return from_text(b.decode('utf-8','replace'))
if __name__ == '__main__':
    res=json.load(open(sys.argv[2]))
    print(f"{'case':26} {'file':32} {'stated g':>9} {'ours g':>8} {'len*dens g':>10} {'stated t':>9} {'ours t':>8}  verdict")
    for r in res:
        s=truth(os.path.join(sys.argv[1],r['case'],r['file']))
        g,t=s['g'],s['t']; og,ot=r.get('totalWeightG'),r.get('printTimeSeconds')
        if not r['ok']: v='rejected: '+r['error'][:50]
        else:
            bad=[]
            if g is not None and (og is None or abs(og-g)>0.011): bad.append('weight')   # 0.01: sum of rounded per-filament values
            if t is not None and (ot is None or abs(ot-t)>1): bad.append('time')
            if t is None and ot is None: bad.append('no time anywhere?')
            ours=[f.get('weightG') for f in r.get('filaments',[])]
            if s['per_g'] and len([x for x in s['per_g'] if x>0])>1 and ours!=[x for x in s['per_g'] if x>0]: bad.append('per-filament')
            v='MATCH' if not bad else 'MISMATCH '+','.join(bad)
            if g is None and s['calc'] is not None: v+=f' (slicer states no grams; ours vs length/volume*1.24: {og} vs {s["calc"]})'
        print(f"{r['case']:26} {r['file']:32} {str(g):>9} {str(og):>8} {str(s['calc']):>10} {str(t):>9} {str(ot):>8}  {v}")
