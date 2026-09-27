import io, os, re, subprocess, sys

PAPERS = ["2609.26714", "2609.12596", "2609.24759", "2609.20043", "2609.08569",
          "2609.13673", "2609.27601", "2609.11214", "2609.01694", "2609.10146",
          "2609.28795"]

PATS = {
    "backslash": r"\\[A-Za-z]",
    "brace": r"[{}]",
    "dollar": r"\$",
    "relax": r"\\?relax",
    "emph": r"emph",
    "texsup": r"textsuperscript|times10",
    "lt_gt": r"\{\$<\$\}|\{/\$\}|\{\$>\$\}",
    "uni_escape": r"\\u\{[0-9A-Fa-f]{4}\}",
    "qq": r"\?\?",
    "TODO": r"TODO|FIXME|XXX",
    "double_space_cjk": r"[\u4e00-\u9fff]  +[\u4e00-\u9fff]",
    "latex_cmd": r"\\(cite|ref|label|textbf|mathrm|begin|end|item|approx|mu|alpha|Delta|sum|int)\b",
}

outdir = "papers/2609.20775/typst/_b_audit"
for pid in PAPERS:
    pdf = os.path.join("papers", pid, "typst", "main.pdf")
    if not os.path.exists(pdf):
        print("== %s  NO PDF" % pid)
        continue
    txt = os.path.join(outdir, "_b_" + pid + ".txt")
    subprocess.run(["pdftotext", "-layout", pdf, txt], check=False)
    s = io.open(txt, encoding="utf-8", errors="replace").read()
    pages = len(re.findall(r"\f", s)) + 1
    rep = []
    for k, p in PATS.items():
        ms = re.findall(p, s)
        if ms:
            rep.append("%s=%d" % (k, len(ms)))
    print("== %s  pages=%d  chars=%d  %s" % (pid, pages, len(s), " ".join(rep)))
    for k, p in PATS.items():
        for m in list(re.finditer(p, s))[:3]:
            a = max(0, m.start() - 60)
            frag = s[a:m.end() + 60].replace("\n", " ")
            print("   [%s] %s" % (k, frag))
