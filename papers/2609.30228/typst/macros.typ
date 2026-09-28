// 2609.30228《三维聚焦能量临界 NLS 的整体适定性与散射》中文译本宏
//
// 原文 amsart 11pt 单栏 23 页：5 节，式按节计数 (4.36)，
// 定理/命题/引理/推论/定义/注记共用一个按节计数的序号（所以"引理 4.1""命题 5.1"是同一列队）。
// 全文无图、无表。编号权威 = 本地 pdflatex 编译两遍出的 arXiv.aux，地图见 CONVENTIONS.md §2。
// Typst 侧一律 #set heading(numbering: none)，所有编号都是写进稿子的字面字符串。

// 带编号的显示公式：#eqn("(2.13)")[ $ ... $ ]
#let eqn(num, body) = block(
  width: 100%,
  above: 0.8em,
  below: 0.8em,
  grid(
    columns: (1fr, auto),
    gutter: 12pt,
    align: (center + horizon, right + horizon),
    body,
    text(size: 10pt)[#num],
  ),
)

// 不编号的显示公式（equation*、\notag、\[ \] 用这个）
#let eqnb(body) = block(width: 100%, above: 0.8em, below: 0.8em, align(center, body))

// 定理类：#thm("引理 4.1")[ 陈述…… ]　kind 字符串连号一起写，编号不许自己数。
#let thm(kind, body) = block(
  width: 100%,
  above: 0.7em,
  below: 0.7em,
  inset: (left: 1.2em, right: 0.6em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold")[#kind。]#body
  ],
)

// 带小标题的定理类：#thmof("命题 2.3", "频率定域化的相互作用 Morawetz 估计")[ ... ]
#let thmof(kind, title, body) = block(
  width: 100%,
  above: 0.7em,
  below: 0.7em,
  inset: (left: 1.2em, right: 0.6em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold")[#kind（#title）。]#body
  ],
)

// 证明：结尾自动证毕方块
#let proof(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[证明。]#body
    #align(right)[□]
  ],
)

// \begin{proof}[Proof of Proposition~\ref{prop:morawetz}] 用这个
#let proofof(what, body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[#what 的证明。]#body
    #align(right)[□]
  ],
)

// 行内比值走 slash：Typst 里数学模式的 ASCII `/` 会自动升级成堆叠分式，
// 且 $|S|/2$ 这种"竖线 + 斜杠"会把收尾的竖线吞进分子、印成坏分数且零告警。
#let s = sym.slash
