// 2609.30179《可调谐双曲超材料增强单光子发射》中文译本宏
//
// 原文 achemso (jacsat) 预印本 23 页，章节有标题但无编号；公式全局连续编号，
// 正文只有式 (1)（\label{eq:momentum_matching}）被回引，方法节的 F_P 定义式是 (2)。
// 图 1–5（原文全是跨栏 figure*），表 1。全部编号取自本地编译 Main.aux 的 \newlabel，
// 权威表见 CONVENTIONS.md §2。

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

// 行首小节标签（原文 Methods 节里的 {\it Purcell factor calculation:} 等）：
// 只返回粗体行内内容，保证标签与随后正文落在同一段里。
//   注意：不要包成 block —— block 会把标签单独断成一段（零告警，只有看图能发现）。
#let runin(label) = text(weight: "bold")[#label]

// 图：编号是字面值，不走 counter。#fig("2")[ 图注 ]( 内容 )
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

// 整页级的高图：包成浮动体，让正文回填它撑出的空洞（不浮动时，排不下的整块图会被
// 整体推到下一页，上一页底部留下十几厘米的空白带）。
#let figf(num, caption, body) = place(
  auto,
  float: true,
  clearance: 1.2em,
  fig(num, caption, body, breakable: false),
)

// 表：#tbl("1")[ 表注 ]( 内容 )，同样是字面编号
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
