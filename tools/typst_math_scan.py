#!/usr/bin/env python3
"""扫描 Typst 文件里数学串中未闭合的双引号。

Typst 数学模式用 `"…"` 包裹正文内容。少写一个收尾引号不会报错，
解析器会一路吞到下一个 `"`（可能在几百字之外），中间所有文字被当成
字符串原样打印 —— 编译 0 error 0 warning，产物却是坏的。

用法: python tools/typst_math_scan.py <文件|目录> ...
"""
import re
import sys
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")


def spans(text):
    """把文本切成 (kind, start, end) 的 `$…$` 数学串与普通区间。"""
    out, i = [], 0
    while True:
        a = text.find("$", i)
        if a < 0:
            break
        if a > 0 and text[a - 1] == "\\":
            i = a + 1
            continue
        b = text.find("$", a + 1)
        if b < 0:
            out.append(("unterminated", a, len(text)))
            break
        out.append(("math", a, b))
        i = b + 1
    return out


def check(path):
    text = path.read_text(encoding="utf-8", errors="replace")
    bad = []
    for kind, a, b in spans(text):
        body = text[a + 1 : b]
        if kind == "unterminated":
            body = text[a:]
        if body.count('"') % 2:
            line = text.count("\n", 0, a) + 1
            snippet = body.replace("\n", " ")
            # 报告第一个落单的引号位置，便于定位
            bad.append((line, snippet[:160]))
    return bad


def main(argv):
    targets = []
    for arg in argv:
        p = Path(arg)
        if p.is_dir():
            targets += sorted(p.rglob("*.typ"))
        elif p.is_file():
            targets.append(p)
    hits = 0
    for f in targets:
        for line, snip in check(f):
            hits += 1
            print(f"{f}:{line}: 数学串内双引号未闭合 -> {snip}")
    if not hits:
        print(f"OK: {len(targets)} 个文件，未发现未闭合引号")
    return 1 if hits else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
