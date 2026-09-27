import io, os, re, sys

def check(path):
    bad = []
    for i, l in enumerate(io.open(path, encoding="utf-8", errors="replace"), 1):
        if l.lstrip().startswith("//"):
            continue
        # strip escaped chars
        s = l.replace(r"\%", "@").replace(r"\$", "#")
        chunks = s.split("$")
        if len(chunks) % 2 == 0:
            bad.append((i, "odd-$", l.strip()[:100]))
            continue
        for k in range(1, len(chunks), 2):
            c = chunks[k]
            if c.count('"') % 2:
                bad.append((i, "odd-quote in math", c[:60]))
            for a, b in [("(", ")"), ("[", "]"), ("{", "}")]:
                if c.count(a) != c.count(b):
                    bad.append((i, "unbal %s%s %d/%d" % (a, b, c.count(a), c.count(b)), c[:60]))
        for k in range(0, len(chunks), 2):
            pass
    return bad


roots = sys.argv[1:] or ["papers"]
for root, dirs, fs in os.walk("papers"):
    dirs[:] = [d for d in dirs if d not in ("_b_audit", "fig")]
    for f in sorted(fs):
        if not f.endswith(".typ") or f.startswith("_"):
            continue
        p = os.path.join(root, f)
        b = check(p)
        if b:
            print("###", p)
            for i, kind, frag in b[:8]:
                print("   line %-5d %-28s %s" % (i, kind, frag))
