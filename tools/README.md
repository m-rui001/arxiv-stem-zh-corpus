# 排版体检脚本

每个脚本都只依赖 `typst` / `pdftoppm` / `pdfinfo` 加 PIL + numpy，在论文自己的 `typst/`
目录下运行（除注明"跨论文扫描"的那几个要在仓库根目录运行）。全部来自实测踩坑，
用法与判据同步记在 `../经验记录.md`。

| 脚本 | 干什么 | 典型调用 |
| --- | --- | --- |
| `blank_bands.py` | 逐页量正文区最大空白带，>6 cm 就是图块不可切分造成的空洞 | `python ../../tools/blank_bands.py main.pdf _chk` |
| `margin_overflow.py` | 150 dpi 渲染，标出压在左右页边距上的墨迹（公式顶出右栏最常见） | `python ../../tools/margin_overflow.py main.pdf _chk` |
| `equation_overflow.py` | 把当前文件里所有 `$ ... $` 编号公式一条一页铺开编译，逐条报哪条越界 | `python ../../tools/equation_overflow.py`（默认读 `supple.typ`） |
| `eq_map.py` | 按行正则数出编号公式，打印 `SNN<TAB>label` 与总数 | `python ../../tools/eq_map.py` |
| `bake_eq_numbers.py` | 交付前把正文里的 `@label` 公式引用烘焙成字面 `(SNN)`（`lang: "zh"` 下 `@ref` 会丢掉 S 前缀） | `python ../../tools/bake_eq_numbers.py` |
| `figure_heights.py` | 列出每张 `image("fig/…", width: N%)` 的实际高度（cm），用来判断能不能塞进某页的空洞 | `python ../../tools/figure_heights.py` |
| `delimiter_balance.py` | 逐行 `$` / `"` 奇偶校验（跨行的显式公式要人工确认） | `python ../../tools/delimiter_balance.py main.typ` |
| `math_parity.py` | 扫数学模式里的 LaTeX 残留：`\cmd`、`_{}`、`\boldsymbol` 一类 | `python ../../tools/math_parity.py main.typ` |
| `static_residue.py` | 跨论文扫描：编译产物里是否还留着 `\relax`、`\ensuremath`、字面花括号组 | 在仓库根 `python tools/static_residue.py` |
| `pdf_text_scan.py` | 跨论文扫描：`pdftotext` 抽出的正文里是否混进 TeX 命令（`pdftotext` 抽不出中文，但 ASCII 与反斜杠抽得出来） | 在仓库根 `python tools/pdf_text_scan.py` |
| `normalize_frags.py` | 合并并行分片：给缺 `#import` 的 `frag_*.typ` 补一行，并按标题表把 `===` 归一到正确层级（幂等） | `python tools/normalize_frags.py <typst 目录> --levels 层级表`（表每行 `层级	标题名`） |
| `block_math_fix.py` | 扫「误显示公式」：Typst 里 `$ x $`（`$` 后带空格）会单独占一行，属零告警缺陷 | `python tools/block_math_fix.py <typst 目录>`，报告写 `_b_blockmath.txt` |

## 从 tex 源到 refs.bib

| 脚本 | 干什么 | 典型调用 |
| --- | --- | --- |
| `tex_strip_comments.py` | 剥掉 tex 注释，只留真正会被排版的正文，对照翻译时省一半阅读量 | 在解包目录 `python ../../tools/tex_strip_comments.py *.tex` |
| `bib_filter_cited.py` | 从原始 `references.bib` 里只挑正文 `\cite` 到的条目，生成 `refs.bib` | `python ../../tools/bib_filter_cited.py main.tex references.bib refs.bib` |
| `bib_clean_residue.py` | 删掉 ieee 样式不会打印、只会撑大文件的字段（abstract 等），并把标题里的 LaTeX 残留换成 Unicode | `python ../../tools/bib_clean_residue.py refs.bib` |

`bib_clean_residue.py` 用 python `str.replace` 改 bib 时，普通字符串里的 `\times`
会被解释成"制表符 + imes"、匹配数静默为 0 —— 一律用 `r'...'` 原始串，
**而且改完必须 grep 复验**。

## 编号完整性的一条便宜校验

`pdftotext` 在这类中文 PDF 上基本抽不出正文，但**能抽出 ASCII 的 `(S119)`**。
于是"`eq_map.py` 报的总数"对上"PDF 里最大的 `(SNN)`"就说明编号没错位、没有漏计或多计。
零成本，交付前值得跑一次。

## Windows 下的两个坑

- python 打不开 `/e/...`、`/tmp/...` 这类路径，一律用相对路径。
- 打印非 ASCII 前先 `PYTHONIOENCODING=utf-8`，否则 GBK 编码直接抛异常。
