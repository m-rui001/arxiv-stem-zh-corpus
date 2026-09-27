r"""抓 Typst 数学里被绝对值竖线破坏的 ASCII `/`。

Typst 会把 `a/b` 自动升级成堆叠分式；若分子以 `|` 收尾（如 `|S|/2`），
竖线会被吞进分子，渲染出残缺分式。行内比值应写 `#s`，真分式写 `frac(a, b)`。

用法：在含 frag_*.typ 的目录里跑 `python ../../../tools/math_slash_scan.py`
"""
import io
import glob
import re

# find ASCII '/' inside $...$ spans, and flag ones whose numerator touches a | bar
for fn in sorted(glob.glob("frag_*.typ")) + ["main.typ"]:
    for ln, line in enumerate(io.open(fn, encoding="utf-8").read().split("\n"), 1):
        for m in re.finditer(r"\$([^$]*)\$", line):
            body = m.group(1)
            for k in re.finditer(r"/", body):
                i = k.start()
                ctx = body[max(0, i - 14): i + 12]
                # numerator ends with a closing abs-bar -> Typst mis-nests the fraction
                bad = re.search(r"\|\s*$", body[:i]) is not None
                print(("BAD " if bad else "ok  ") + f"{fn}:{ln}: …{ctx}…")
