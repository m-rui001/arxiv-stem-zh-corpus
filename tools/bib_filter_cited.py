import re, sys

BS = chr(92)
tex_path = sys.argv[1]
bib_path = sys.argv[2]
out_path = sys.argv[3]

src = open(tex_path, encoding='utf-8', errors='replace').read()

cited = []
for m in re.finditer(re.escape(BS) + r'cite[aept]?\{([^}]*)\}', src):
    for k in m.group(1).split(','):
        k = k.strip()
        if k and k not in cited:
            cited.append(k)


def sanitize(k):
    return re.sub(r'[^A-Za-z0-9_\-]', '_', k)


text = open(bib_path, encoding='utf-8', errors='replace').read()

entries = {}
for m in re.finditer(r'(?m)^@\w+\{([^,\s]+),', text):
    key = m.group(1).strip()
    if not re.fullmatch(r'[A-Za-z0-9_$.\-]+', key):
        continue
    start = m.start()
    i = text.index('{', m.start())
    depth = 0
    j = i
    while True:
        c = text[j]
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                break
        j += 1
    entries[key] = (text[start:j + 1], key)

out = []
missing = []
mapping = []
for k in cited:
    if k in entries:
        body, orig = entries[k]
        newkey = sanitize(k)
        head = body[:body.index('{') + 1]
        rest = body[body.index(','):]
        out.append(head + newkey + rest)
        mapping.append((k, newkey, k != newkey))
    else:
        missing.append(k)

open(out_path, 'w', encoding='utf-8').write('\n\n'.join(out) + '\n')
print("cited:", len(cited), "written:", len(out))
for k, n, ch in mapping:
    if ch:
        print("RENAME", k, "->", n)
print("MISSING:", missing)
