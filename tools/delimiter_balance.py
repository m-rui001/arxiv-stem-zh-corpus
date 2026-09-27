import io, sys

fn = sys.argv[1]
lines = io.open(fn, encoding="utf-8").read().split("\n")
p = b = cu = 0
for i, l in enumerate(lines, 1):
    if l.lstrip().startswith("//"):
        continue
    s = l.replace(r"\%", "")
    p += s.count("(") - s.count(")")
    b += s.count("[") - s.count("]")
    cu += s.count("{") - s.count("}")
    if i % 1 == 0 and (p or b or cu):
        pass
    print("%4d p=%-3d b=%-3d c=%-3d | %s" % (i, p, b, cu, l[:70]))
