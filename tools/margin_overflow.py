import os, subprocess, sys
import numpy as np
from PIL import Image

pdf = sys.argv[1] if len(sys.argv) > 1 else 'main.pdf'
tag = sys.argv[2] if len(sys.argv) > 2 else '_b_mg'
DPI = 150
subprocess.run(['pdftoppm', '-png', '-r', str(DPI), pdf, tag], check=False)
px = lambda cm: int(cm / 2.54 * DPI)
W, H = px(21.0), px(29.7)
MARG = px(2.4)                 # left/right text margin
TOL = px(0.06)                 # tolerance
TOP, BOT = px(1.0), H - px(1.0)  # skip header/footer (page number)
pngs = sorted(f for f in os.listdir('.') if f.startswith(tag) and f.endswith('.png'))
for f in pngs:
    im = np.asarray(Image.open(f).convert('L'))
    if im.shape[1] < W - 10:
        continue
    body = im[TOP:BOT, :W]
    lb = (body[:, :MARG - TOL] < 245)
    rb = (body[:, W - MARG + TOL:] < 245)
    L, R = lb.sum(), rb.sum()
    if L > 4 or R > 4:
        rl = np.where(lb.any(axis=1))[0]
        rr = np.where(rb.any(axis=1))[0]
        fmt = lambda a: ('%d-%d' % (a[0] + TOP, a[-1] + TOP)) if len(a) else '-'
        print('%-14s L=%-6d R=%-6d leftY=%s rightY=%s' % (f, L, R, fmt(rl), fmt(rr)))
for f in pngs:
    os.remove(f)
