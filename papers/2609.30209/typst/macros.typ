// 2609.30209《任意维格点 Anderson–Bernoulli 模型谱边缘附近的定域化》中文译本宏
//
// 原文 amsart 单栏 48 页：5 节（含附录 A），式按节计数 (3.28)，
// 定理/引理/定义/注记/命题/构造 共用一个按节计数的序号（所以"引理 3.7""注记 3.9"
// 是同一列队），Claim 单独计数。编号权威 = 本地 pdflatex 编译出的 .aux，见 CONVENTIONS.md。
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

// 不编号的显示公式（equation*、\notag、align* 用这个）
#let eqnb(body) = block(width: 100%, above: 0.8em, below: 0.8em, align(center, body))

// 定理类：#thm("引理 2.4")[ 陈述…… ]　kind 字符串连号一起写，编号不许自己数。
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

// 证明：结尾自动证毕方块；#proofof("构造 3.8")[ …… ] 用于 \begin{proof}[Proof of X]
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

// 图：编号是字面值，不走 counter。#fig("3")[ 图注 ][ CeTZ 文件 include ]
// 用 float 而不是 block：示意图不可断行，若原地放不下就会在上一页底部留下几厘米大白缝；
// 浮动块让正文继续填满该页，图自己挪到下一页顶部，与原 LaTeX 的 figure 环境行为一致。
#let fig(num, caption, body, breakable: false) = figure(
  placement: auto,
  numbering: none,
  block(width: 100%, breakable: breakable)[
    #set par(first-line-indent: 0em)
    #align(center, body)
    #v(0.45em)
    #block(width: 100%, inset: (left: 1.4em, right: 1.4em))[
      #set text(size: 8.5pt)
      #text(weight: "bold")[图 #num　]#caption ]
  ],
)

// 表：#tbl("1")[ 表注 ][ 内容 ]
#let tbl(num, caption, body) = block(
  width: 100%,
  breakable: false,
  above: 1.1em,
  below: 1.1em,
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold")[表 #num　]#caption
    #v(0.4em)
    #align(center, body)
  ],
)

// 行内比值走 slash：Typst 的 `/` 在行内数学里会立成堆叠分式并撑高行距。
#let s = sym.slash
