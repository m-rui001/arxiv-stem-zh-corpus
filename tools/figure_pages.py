r"""按页统计彩色像素占比，用来定位示意图所在页（正文只有黑白，图里有红绿蓝）。

用法：在渲染好的 PNG 目录里跑 `python ../../../tools/figure_pages.py "_b-*.png"`
"""
import glob, os, sys

from PIL import Image

sys.stdout.reconfigure(encoding="utf-8")
pat = sys.argv[1] if len(sys.argv) > 1 else "_bq-*.png"
for p in sorted(glob.glob(pat)):
    im = Image.open(p).convert("RGB")
    w, h = im.size
    px = im.load()
    colored = 0
    top, bottom = h, 0
    for y in range(0, h, 2):
        for x in range(0, w, 2):
            r, g, b = px[x, y]
            if max(r, g, b) - min(r, g, b) > 40:
                colored += 1
                top, bottom = min(top, y), max(bottom, y)
    if colored > 60:
        print("%s  彩色采样点 %5d  纵向 %d%%–%d%%" %
              (os.path.basename(p), colored, 100 * top // h, 100 * bottom // h))
print("—— 其余页无彩色（纯文字/黑白图）")
