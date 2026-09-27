import io, os, subprocess, sys
import numpy as np
from PIL import Image

pdf = sys.argv[1] if len(sys.argv) > 1 else "main.pdf"
tag = sys.argv[2] if len(sys.argv) > 2 else "_b_bw"
DPI = 75
subprocess.run(["pdftoppm", "-png", "-r", str(DPI), pdf, tag], check=False)
pngs = sorted(f for f in os.listdir(".") if f.startswith(tag) and f.endswith(".png"))
for f in pngs:
    im = np.asarray(Image.open(f).convert("L"))
    H = im.shape[0]
    ink = (im < 245).sum(axis=1)
    rows = np.where(ink > 2)[0]
    if len(rows) == 0:
        print(f, "EMPTY PAGE")
        continue
    top, bot = rows[0], rows[-1]
    seg = ink[top:bot + 1] <= 2
    best = cur = 0
    bstart = bend = 0
    run = 0
    for idx, b in enumerate(seg):
        if b:
            run += 1
            if run > best:
                best = run
                bend = idx
        else:
            run = 0
    bstart = bend - best + 1
    cm = best / DPI * 2.54
    if cm > 4.0:
        print("%-12s gap %5.2fcm at %.0f%%-%.0f%% of page height (page ink ends %.0f%%)"
              % (f, cm, 100 * (top + bstart) / H, 100 * (top + bend) / H, 100 * bot / H))
for f in pngs:
    os.remove(f)
