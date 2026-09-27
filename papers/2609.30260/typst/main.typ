// 投影非晶拓扑绝缘体
// arXiv:2609.30260 中文译本
//
// 原文：revtex4-2 (prl) 双栏 7 页，无编号章节（小节是行首斜体标签），公式 (1)–(8) 全局连续，
//   图 1–4、表 I（本译本作表 1）。补充材料 4 页（S1–S4、图 S1–S3）只在源包里以 PDF 存在。
// 编号：全部取自本地编译的 statistical_brane.aux，权威表见 CONVENTIONS.md §2。
// 文献：tex 内手写 54 条 \bibitem，编号按**定义顺序**（不是正文首引顺序：正文第 1 段引
//   [1–7] 后接 [20–25]，第 2 段才引 [8–19]）。Typst 的 ieee 样式按正文首引顺序重排，
//   故本译本的文献号与原文印出的号**不同**，属已记录的取舍，见 CONVENTIONS.md §5。
// 图：四幅均直接取自源包（lattice.pdf、amorphous_phase_diagram_and_scaling.pdf、
//   bulk-boundary.png、scaling_m_pm_1.pdf），只译图注，不重画。

#set document(title: "投影非晶拓扑绝缘体")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set math.equation(numbering: none)

#import "macros.typ": *

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.4em, below: 0.5em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}

#align(center)[
  #text(size: 13pt, weight: "bold")[投影非晶拓扑绝缘体\
  Projected Amorphous Topological Insulators]

  #v(0.8em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Archisman Panigrahi　Bitan Roy
  ]

  #v(0.3em)
  #text(size: 8.5pt, font: ("New Computer Modern", "Noto Serif SC"))[
    麻省理工学院物理系，美国马萨诸塞州剑桥 02139\
    利哈伊大学物理系，美国宾夕法尼亚州伯利恒 18015
  ]

  #v(0.2em)
  #text(size: 8.5pt)[2026 年 9 月]
]

#v(1.2em)
#include "frag_1.typ"
#include "frag_2.typ"
#include "frag_3.typ"
#include "frag_4.typ"
#include "frag_5.typ"
#include "frag_6.typ"

#v(0.5em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
#bibliography("refs.bib", style: "ieee", title: [参考文献])

// 补充材料在原文里是独立 PDF，本译本也排在参考文献之后：
// 三幅整页级浮动图若排在书目之前，会被推到书目中间落版。
#pagebreak()
#include "frag_7.typ"
