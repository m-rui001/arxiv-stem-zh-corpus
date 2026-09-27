import io, re, os, subprocess, json
import numpy as np
from PIL import Image

DPI = 150
px = lambda cm: int(cm / 2.54 * DPI)
TEXW = 21.0 - 4.8

def pdf_size(path):
    out = subprocess.run(['pdfinfo', path], capture_output=True, text=True).stdout
    m = re.search(r'Page size:\s+([\d.]+)\s+x\s+([\d.]+)', out)
    return float(m.group(1)), float(m.group(2))

def img_ratio(path):
    if path.lower().endswith('.pdf'):
        w, h = pdf_size(path)
        return h / w
    with Image.open(path) as im:
        return im.size[1] / im.size[0]

src = io.open('supple.typ', encoding='utf-8').read()
tot = 0.0
for m in re.finditer(r'image\("([^"]+)",\s*width:\s*([\d.]+)%\)', src):
    path, w = m.group(1), float(m.group(2))
    if not os.path.exists(path):
        print('MISSING', path)
        continue
    r = img_ratio(path)
    hcm = TEXW * w / 100.0 * r
    tot += hcm
    print('%-42s %5.1f%%  h=%5.2f cm' % (path, w, hcm))
print('total figure height: %.1f cm' % tot)
