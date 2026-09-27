"""合并后统一片段：补 #import、归一标题层级。
用法: python tools/normalize_frags.py <typst 目录> [--import-line TEXT] [--level MAPFILE]
只处理 frag_*.typ，幂等。
"""
import re
import sys
import os
import glob

IMPORT_RE = re.compile(r'^\s*#import\s+"macros\.typ"\s*:\s*\*', re.M)


def add_import(text, line):
    if IMPORT_RE.search(text):
        return text, 0
    lines = text.split('\n')
    idx = 0
    while idx < len(lines) and (idx == 0 or lines[idx].startswith('//') or not lines[idx].strip()):
        idx += 1
    lines.insert(idx, line)
    return '\n'.join(lines), 1


PREFIX_RE = re.compile(r'^(?:[A-Z]\.\s+|附录\s*[A-Z][：:]\s*)')


def fix_heading_levels(text, mapping):
    """mapping: {标题名: 期望层级}；只改 `^(=+) 标题` 的行，按去掉 'A. ' 前缀后的标题精确匹配。"""
    n = 0
    out = []
    for line in text.split('\n'):
        m = re.match(r'^(=+)\s+(.*)$', line)
        if m:
            title = m.group(2).strip()
            probe = PREFIX_RE.sub('', title)
            if probe in mapping:
                mark = '=' * mapping[probe]
                if m.group(1) != mark:
                    line = '%s %s' % (mark, title)
                    n += 1
        out.append(line)
    return '\n'.join(out), n


def main():
    d = sys.argv[1]
    imp = '#import "macros.typ": *'
    if '--import-line' in sys.argv:
        imp = sys.argv[sys.argv.index('--import-line') + 1]
    mapping = {}
    if '--levels' in sys.argv:
        for raw in open(sys.argv[sys.argv.index('--levels') + 1], encoding='utf-8'):
            raw = raw.strip()
            if not raw or raw.startswith('#'):
                continue
            lvl, _, name = raw.partition('\t')
            mapping[name.strip()] = int(lvl)
    report = []
    for f in sorted(glob.glob(os.path.join(d, 'frag_*.typ'))):
        text = open(f, encoding='utf-8').read()
        if not text.strip() or text.strip() == '// 占位':
            report.append('%s: 占位，跳过' % os.path.basename(f))
            continue
        text, a = add_import(text, imp)
        text, b = fix_heading_levels(text, mapping) if mapping else (text, 0)
        open(f, 'w', encoding='utf-8', newline='\n').write(text)
        report.append('%s: +%d import, %d 标题改级' % (os.path.basename(f), a, b))
    print('\n'.join(report))


if __name__ == '__main__':
    main()
