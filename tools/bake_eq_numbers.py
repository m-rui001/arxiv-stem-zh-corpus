import io, re

src = io.open('supple.typ', encoding='utf-8').read()

# rebuild mapping with the same logic as _b_map.py
lines = src.split('\n')
num = 0
mapping = {}
for ln in lines:
    m = re.match(r'^\$ .* \$\s*(?:<([A-Za-z0-9_]+)>)?\s*$', ln)
    if m and m.group(1):
        num += 1
        mapping[m.group(1)] = num
    elif m:
        num += 1

changed = 0
def sub(mm):
    global changed
    lab = mm.group(1)
    if lab not in mapping:
        print('NO MAP:', lab)
        return mm.group(0)
    changed += 1
    return '(S%d)' % mapping[lab]

src = re.sub(r'@(eq[a-zA-Z0-9_]*)', sub, src)
io.open('supple.typ', 'w', encoding='utf-8', newline='').write(src)
print('replaced', changed)
