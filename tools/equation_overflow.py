import io, re, subprocess, sys
import numpy as np
from PIL import Image

src = io.open('supple.typ', encoding='utf-8').read().split('\n')
head = [l for l in src[:25] if l.startswith('#set') or l.startswith('#let')]
eqs = [(i + 1, l) for i, l in enumerate(src) if re.match(r'^\$ .* \$\s*(<[A-Za-z0-9_]+>)?\s*$', l)]
print('equations found:', len(eqs))

out = []
out.append('#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm))')
out.append('#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")')
for l in head:
    if l.startswith('#set page') or l.startswith('#set text'):
        continue
    out.append(l)
out.append('#set math.equation(numbering: "(1)")')
for idx, (lineno, ln) in enumerate(eqs):
    out.append(ln)
    out.append('#v(-1.2em)')
    if idx != len(eqs) - 1:
        out.append('#pagebreak()')
io.open('_b_eqs.typ', 'w', encoding='utf-8', newline='').write('\n'.join(out) + '\n')

r = subprocess.run(['typst', 'compile', '_b_eqs.typ', '_b_eqs.pdf'], capture_output=True, text=True)
if r.returncode:
    print(r.stdout[:2000], r.stderr[:2000])
    sys.exit(1)

DPI = 150
px = lambda cm: int(cm / 2.54 * DPI)
subprocess.run(['pdftoppm', '-png', '-r', str(DPI), '_b_eqs.pdf', '_b_eq'], check=True)
MARG, TOL = px(2.4), px(0.06)
W, H = px(21.0), px(29.7)
bad = []
for idx, (lineno, ln) in enumerate(eqs):
    f = '_b_eq-%03d.png' % (idx + 1)
    try:
        im = np.asarray(Image.open(f).convert('L'))
    except Exception:
        print('missing', f)
        continue
    body = im[px(1.0):H - px(1.0), :W]
    L = (body[:, :MARG - TOL] < 245).sum()
    R = (body[:, W - MARG + TOL:] < 245).sum()
    lab = re.search(r'<([A-Za-z0-9_]+)>\s*$', ln)
    if L > 4 or R > 4:
        bad.append((idx + 1, lineno, lab.group(1) if lab else '?', L, R))
for b in bad:
    print('OVERFLOW eq#S%d line %d label %s L=%d R=%d' % b)
import glob, os
for f in glob.glob('_b_eq-*.png'):
    os.remove(f)
