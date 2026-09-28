r"""扫全库 refs.bib 里 Hayagriva `ieee` 样式的四类系统性失真（只读，不改文件）：

1. @incollection / @book 同时给 series 与 volume —— 卷号会被印两遍
   （"vol. 1850, in Lecture Notes in Mathematics, vol. 1850,"）。
2. journal 是缩写型刊名却缺结尾句点 —— ieee 原样打印，文献表参差不齐。
3. @article 的 number 是四位数 —— 多半是卷号误置（IMRN 那种 "Int. Math. Res. Not. 1994, 303--309"）。
4. doi 字段里塞了 arXiv 号 —— 会印成 "doi: arXiv:…"，应改用 url 或 journal。

用法：在仓库根 `python tools/bib_series_dot_scan.py`
"""
import glob
import io
import re
import sys

sys.stdout.reconfigure(encoding="utf-8")

ABBR_LAST = {
    "phys", "rev", "math", "theor", "teor", "eksp", "fiz", "lett", "commun",
    "technol", "comput", "trans", "inst", "acad", "bull", "vestn", "izv",
    "mat", "mekh", "dynam", "statist", "probab", "optim", "electron", "magn",
    "appl", "mech", "biochem", "biophys", "chem", "opt", "quant", "spectrosc",
    "therm", "acoust", "astron", "astrophys", "geophys", "geochim", "metabol",
    "mol", "anal", "infrared", "micron", "nano", "micro", "electrochem",
}


def needs_dot(val: str) -> bool:
    """刊名以缩写词收尾却缺句点才算缺陷；`Phys. Rev. B`（单字母分册）、
    `arXiv preprint arXiv:2603.07303`、`Bluefors.com` 都是合法写法。"""
    tail = re.split(r"[\s,]+", val.strip())[-1]
    return tail.lower() in ABBR_LAST


series_hit, dot_hit, num_hit, arx_hit, mix_hit = [], [], [], [], []
paths = sorted(glob.glob("papers/*/typst/refs.bib")) + sorted(glob.glob("papers/*/refs.bib"))
for path in paths:
    txt = io.open(path, encoding="utf-8", errors="replace").read()
    for blk in re.split(r"(?m)^(?=@)", txt):
        m = re.match(r"@(\w+)\{([^,]+),", blk)
        if not m:
            continue
        typ, key = m.group(1), m.group(2)
        if typ in ("incollection", "book") and \
                re.search(r"(?m)^\s*series\s*=", blk) and \
                re.search(r"(?m)^\s*volume\s*=", blk):
            series_hit.append("%s  @%s{%s}" % (path, typ, key))
        j = re.search(r"(?m)^\s*journal\s*=\s*\{(.*)\}\s*,?\s*$", blk)
        if j:
            v = j.group(1).strip()
            if "." in v and not v.endswith(".") and needs_dot(v):
                dot_hit.append("%s  %s: journal = {%s}" % (path, key, v))
        n = re.search(r"(?m)^\s*number\s*=\s*\{(\d{4})\}\s*$", blk)
        if n and typ == "article":
            num_hit.append("%s  %s: number = {%s}" % (path, key, n.group(1)))
        d = re.search(r"(?m)^\s*doi\s*=\s*\{(arXiv[^}]*)\}\s*$", blk)
        if d:
            arx_hit.append("%s  %s: doi = {%s}" % (path, key, d.group(1)))
        pg = re.search(r"(?m)^\s*pages\s*=\s*\{([^}]*)\}\s*$", blk)
        if pg and "," in pg.group(1):
            # "pages = {1805-1825, arXiv:...}" 会让 ieee 把 "pp." 降级成 "p."
            mix_hit.append("%s  %s: pages = {%s}" % (path, key, pg.group(1)))

for title, hits in (("series 与 volume 同时出现（卷号印两遍）", series_hit),
                    ("journal 缩写缺尾句点", dot_hit),
                    ("@article 的 number 是四位数（卷号误置）", num_hit),
                    ("doi 字段塞了 arXiv 号", arx_hit),
                    ("pages 里混了 arXiv 号（pp. 会降级成 p.）", mix_hit)):
    print("== %s：%d 处 ==" % (title, len(hits)))
    print("\n".join("   " + h for h in hits) or "   (无)")
    print()
print("扫描 refs.bib：%d 个" % len(paths))
