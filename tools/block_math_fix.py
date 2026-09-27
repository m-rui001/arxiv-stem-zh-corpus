"""扫描 Typst 片段里的「误显示公式」：Typst 规定 `$` 之后或之前紧跟空白即成为显示公式，
正文句子里写 `$ x $` 会单独占一行，属零告警缺陷。

做法：按未转义的 `$` 把每行切成奇偶段，奇数段是公式体；若公式体首尾带空白、且该行不是
`#eqn(` 的定义行，就判为误显示。

用法：
    python tools/block_math_fix.py <typst 目录> [--apply] [--out 报告文件]
默认只报告，报告写文件（Windows 控制台是 GBK，不能直接打印 CJK）。
"""
import glob
import os
import re
import sys

EQSPLIT = re.compile(r'(?<!\\)\$')


def scan_line(line):
    parts = EQSPLIT.split(line)
    bad = []
    for i in range(1, len(parts), 2):
        body = parts[i]
        if body != body.strip() and (body.startswith((' ', '\t')) or body.endswith((' ', '\t'))):
            if body.strip():
                bad.append('$' + body + '$')
    return bad


def main():
    d = sys.argv[1]
    apply_fix = '--apply' in sys.argv
    out = sys.argv[sys.argv.index('--out') + 1] if '--out' in sys.argv else os.path.join(d, '_b_blockmath.txt')
    lines_report = []
    total = 0
    for f in sorted(glob.glob(os.path.join(d, 'frag_*.typ'))):
        text_lines = open(f, encoding='utf-8').read().split('\n')
        for i, line in enumerate(text_lines):
            if '#eqn' in line or line.lstrip().startswith('//'):
                continue
            bad = scan_line(line)
            if not bad:
                continue
            total += len(bad)
            lines_report.append('%s:%d  %s' % (os.path.basename(f), i + 1, ' | '.join(bad)))
            if apply_fix:
                parts = EQSPLIT.split(line)
                for j in range(1, len(parts), 2):
                    if parts[j].strip():
                        parts[j] = parts[j].strip()
                text_lines[i] = '$'.join(parts)
        if apply_fix:
            open(f, 'w', encoding='utf-8', newline='\n').write('\n'.join(text_lines))
    lines_report.append('共 %d 处%s' % (total, '（已修正）' if apply_fix else '，加 --apply 修正'))
    open(out, 'w', encoding='utf-8').write('\n'.join(lines_report) + '\n')
    print('hits=%d report=%s' % (total, os.path.basename(out)))


if __name__ == '__main__':
    main()
