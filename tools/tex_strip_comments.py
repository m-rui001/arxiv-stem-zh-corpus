# 剥掉 tex 源里的注释行与行尾注释，得到"真正会被排版"的正文，便于逐节对照翻译。
# 用法：在解包出的 tex 目录里 `python ../../tools/tex_strip_comments.py *.tex`
import re, io, os, sys, glob

COMMENT = re.compile(r"(?<!\\)%")
os.makedirs("clean", exist_ok=True)
for src in (sys.argv[1:] or glob.glob("*.tex")):
    out = []
    for line in io.open(src, encoding="utf-8", errors="replace"):
        if line.lstrip().startswith("%"):
            continue
        m = COMMENT.search(line)
        if m:
            line = line[: m.start()].rstrip() + "\n"
        out.append(line)
    s = re.sub(r"\n{3,}", "\n\n", "".join(out))
    dst = os.path.join("clean", os.path.basename(src))
    io.open(dst, "w", encoding="utf-8").write(s)
    print(src, "->", dst, len(s))
