# 临时脚本：清 refs.bib —— 删掉 abstract 等不会被 ieee 样式打印、只会撑大文件的字段，
# 并把标题里的 LaTeX 残留（{$\mu$}s、$g$-factor）换成 Unicode，避免原样印进参考文献。
import io, re, sys

p = sys.argv[1]
s = io.open(p, encoding='utf-8').read()

def drop_field(s, name):
    out = []
    i = 0
    pat = re.compile(r'(?m)^\s*' + name + r'\s*=\s*\{')
    while True:
        m = pat.search(s, i)
        if not m:
            out.append(s[i:])
            break
        out.append(s[i:m.start()])
        j = m.end() - 1
        depth = 0
        while True:
            if s[j] == '{':
                depth += 1
            elif s[j] == '}':
                depth -= 1
                if depth == 0:
                    break
            j += 1
        while j + 1 < len(s) and s[j + 1] in ', \t\r\n':
            j += 1
        i = j + 1
    return ''.join(out)

for f in ['abstract', 'keywords', 'owner', 'timestamp', 'urldate', 'eprint', 'archiveprefix', 'primaryclass']:
    s = drop_field(s, f)

repl = [
    ('200 {$\\mu$}s', '200 μs'),
    ('$g$-factor', 'g-factor'),
    ('$\\mu$m', 'μm'),
    ('$\\pm$', '±'),
    ('$\\times$', '×'),
    ('~', ' '),
]
for a, b in repl:
    s = s.replace(a, b)

left = [l for l in s.split('\n') if re.search(r'\\[a-zA-Z]|\$', l) and 'title' in l.lower()]
io.open(p, 'w', encoding='utf-8').write(s)
print('title lines still carrying latex:', len(left))
for l in left:
    print('  ', l[:170])
print('entries:', s.count('\n@') + s.startswith('@'))
