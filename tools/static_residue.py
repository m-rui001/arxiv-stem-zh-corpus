import io, os, re, sys

PAPERS = [
    "2609.26714", "2609.12596", "2609.24759", "2609.20043", "2609.08569",
    "2609.13673", "2609.27601", "2609.11214", "2609.01694", "2609.10146",
    "2609.28795", "2609.20775",
]

# LaTeX command residue: backslash + latin letters, excluding legit typst escapes
RES = re.compile(r"\\([A-Za-z][A-Za-z]*)")
OKW = {"%"}


def read(p):
    return io.open(p, encoding="utf-8", errors="replace").read()


for pid in PAPERS:
    typ = os.path.join("papers", pid, "typst", "main.typ")
    sup = os.path.join("papers", pid, "typst", "supple.typ")
    files = [f for f in (typ, sup) if os.path.exists(f)]
    print("=" * 8, pid)
    for f in files:
        lines = read(f).split("\n")
        odd_d = [i for i, l in enumerate(lines, 1) if (l.count("$") - l.count(r"\$")) % 2]
        odd_q = [i for i, l in enumerate(lines, 1) if l.count('"') % 2]
        if odd_d:
            print("  ODD-$", f, odd_d[:12])
        if odd_q:
            print('  ODD-"', f, odd_q[:12])
        hits = {}
        for i, l in enumerate(lines, 1):
            for m in RES.finditer(l):
                w = m.group(1)
                if w in OKW:
                    continue
                hits.setdefault("\\" + w, []).append(i)
        # typst-native commands that legitimately start with #, not \
        latexy = {k: v for k, v in hits.items() if k not in
                  ("\\%", "\\#", "\\_", "\\[", "\\]", "\\{", "\\}")}
        if latexy:
            for k in sorted(latexy, key=lambda x: -len(latexy[x]))[:14]:
                print("  RES", f, k, latexy[k][:8], "n=", len(latexy[k]))
    bib = os.path.join("papers", pid, "typst", "refs.bib")
    if os.path.exists(bib):
        b = read(bib)
        for pat in (r"\\relax", r"\\emph", r"\\textbf", r"\\url", r"\\doi",
                    r"\\bibitem", r"\$[0-9A-Za-z]", r"year\s*=\s*\{[^}]*[^0-9}][^}]*\}"):
            n = len(re.findall(pat, b))
            if n:
                print("  BIB", pid, pat, n)
