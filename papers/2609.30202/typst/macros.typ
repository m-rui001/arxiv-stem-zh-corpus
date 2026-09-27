// 2609.30202《扭曲 Bernal 双层–三层石墨烯中的初发超导与可调 Chern 绝缘体》中文译本宏
//
// 原文 revtex4-1（prl, reprint）单栏正文 + 跨栏 figure*，主文 23 页（含补充材料）。
// 全文**没有** \begin{equation}：所有关系式都是行内数学，所以本稿不设编号公式，
// 也不用 eqn/eqnb 宏（需要时另加）。
// 编号权威取自本地 pdflatex 编译的 prx_arXiv.aux 的 \newlabel：
//   主文 图 1–4；补充 图 S1–S19；表 S1（tab:chern_numbers，与 图 S1 各自独立计数）。
// 主文用 \section* 与 \medskip\noindent\textbf{} 的"行首粗体小标题"，无章节编号。

// 行首小节标签（原文 \medskip\noindent\textbf{...} 与 Methods 里的 \textbf{...}）：
// 只返回粗体行内内容，保证标签与随后正文落在同一段里。
//   注意：不要包成 block —— block 会把标签单独断成一段（零告警，只有看图能发现）。
#let runin(label) = text(weight: "bold")[#label]

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

// 本稿 23 幅跨栏图一律用上面的 fig(breakable: false) 顺序排，**不做浮动**。
// 试过 place(float: true)：Typst 会在图原本锚点处保留等高空洞，正文并不回填，
// 结果第 2 页出现 24 cm 的空白带；顺序排反而只在页底留下 5–9 cm 的自然空隙。
// （2609.30179 只有 5 幅图且与正文穿插，浮动才成立；图多到占据整页时浮动必输。）

// 表：#tbl("S1")[ 表注 ][ 内容 ]，同样是字面编号
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
