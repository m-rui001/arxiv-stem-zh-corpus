import io, re, sys

p = 'supple.typ'
lines = io.open(p, encoding='utf-8').read().split('\n')

num = 0
mapping = {}
skip_until = None
in_nonum = 0
for i, ln in enumerate(lines):
    if 'set math.equation(numbering: none)' in ln:
        in_nonum = 1
    if in_nonum and ln.strip() == ']':
        in_nonum = 0
    m = re.match(r'^\$ .* \$\s*(?:<([A-Za-z0-9_]+)>)?\s*$', ln)
    if m:
        if in_nonum:
            continue
        num += 1
        if m.group(1):
            mapping[m.group(1)] = num

print('total numbered equations:', num)
for k, v in sorted(mapping.items(), key=lambda kv: kv[1]):
    print('S%d\t%s' % (v, k))
