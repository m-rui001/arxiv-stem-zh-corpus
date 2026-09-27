// 2609.30155《冷等离子体理论的奇点：低密度边缘等离子体 ICRF 运行的建模挑战》中文译本宏
//
// 原文 revtex4-1（aip, reprint）双栏 5 页 letter，无 \section：正文是一整条连续论述。
// 编号权威取自本地 pdflatex+bibtex 编译的 aipsamp.aux 的 \newlabel：
//   式 (1)–(13)（其中 (6) 是两行 align 的第二行，第一行 \nonumber）；
//   图 1–10；表 I（revtex 的 aip 风格用罗马数字编号表）。文献 27 条。
// 与多数稿子不同，本篇**有**编号公式，故保留 eqn/eqnb 两个宏。

// 带编号的显示公式：#eqn("(3)")[ $ ... $ ]
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

// 不编号的显示公式
#let eqnb(body) = block(width: 100%, above: 0.8em, below: 0.8em, align(center, body))

// 图：编号是字面值，不走 counter。#fig("2")[ 图注 ][ 内容 ]
// 多面板图传 breakable: false，否则面板会被拆到两页、图注孤悬在次页。
#let fig(num, caption, body, breakable: true) = block(
  width: 100%,
  breakable: breakable,
  above: 1.1em,
  below: 1.1em,
  [
    #set par(first-line-indent: 0em)
    #align(center, body)
    #v(0.45em)
    #block(width: 100%, inset: (left: 1.4em, right: 1.4em))[
      #set text(size: 8.5pt)
      #text(weight: "bold")[图 #num　]#caption ]
  ],
)

// 表：#tbl("I")[ 表注 ][ 内容 ]，同样是字面编号
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

// 行内比值一律走 slash：Typst 的 `/` 在行内数学里会立成上下堆叠分式并撑高行距。
#let s = sym.slash
