// 2609.30260《投影非晶拓扑绝缘体》中文译本宏
//
// 原文 revtex4-2 prl 双栏 7 页，正文小节是行首斜体标签（Introduction、Key results …），
// 没有编号章节；公式全局连续编号 (1)…(8)（其中 (5) 是 \label{eq:Heff}，正文唯一
// 被回引的公式），图 1–4，表 I（本译本排作"表 1"）。全部编号取自本地编译
// statistical_brane.aux 的 \newlabel，权威表见 CONVENTIONS.md §2。

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

// 行首小节标签（对应原文的 {\it Introduction}.~）：只返回粗体行内内容，
// 这样 #runin[引言。]随后正文 仍落在同一段里，段首缩进走全局设置。
//   注意：不要把它包成 block —— block 会把标签单独断成一段（零告警，只有看图能发现）。
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

// 数学里的正体多字母名：$op("tr")$、$op("sgn")$、$op("Im")$ 直接写也行，
// 这里给三个高频的起个名，省得每个片段各写一遍。
#let Tr = math.op("tr")
#let Sgn = math.op("sgn")
#let ImOp = math.op("Im")
