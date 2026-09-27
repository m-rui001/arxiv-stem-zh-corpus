// 扭曲 Bernal 双层–三层石墨烯中的初发超导与可调 Chern 绝缘体
// arXiv:2609.30202 中文译本（Typst 0.15.1）
//
// 原文：revtex4-1 [reprint,prl,aps] 双栏预印本，含正文与补充材料共 23 页。
//   本译文按语料既成约定排为 A4 单栏；图 1–4 与图 S1–S19 原本都是跨栏 figure*，
//   全部用 #figf 浮动（见 CONVENTIONS.md 与 macros.typ 注释）。
// 编号：全部取自本地 pdflatex 编译的 prx_arXiv.aux 的 \newlabel，权威表见 CONVENTIONS.md §2。
//   本稿全文没有 \begin{equation}，故不设编号公式；表格与图各自独立计数（图 S1 与表 S1 并存）。
// 文献：41 条，取自 tex 内联 thebibliography，revtex 数字风格按首引顺序，与 Typst ieee 同序。
// 图：23 幅矢量 PDF 原图直接嵌入 figs/，只译图注，不重画。

#set document(title: "扭曲 Bernal 双层–三层石墨烯中的初发超导与可调 Chern 绝缘体")
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

#show heading.where(level: 2): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.1em, below: 0.4em)[
    #text(weight: "bold", size: 10pt)[#it.body]
  ]
}

#align(center)[
  #text(size: 13pt, weight: "bold")[扭曲 Bernal 双层–三层石墨烯中的\
  初发超导与可调 Chern 绝缘体\
  #v(3pt)
  #text(size: 10.5pt)[Incipient superconductivity and tunable Chern insulators in twisted Bernal bilayer-trilayer graphene]]

  #v(0.8em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Derek Waleffe#super[1,∗]　Aryana Bhattacharyya#super[1,∗]　Manish Kumar#super[1]\
    Eric Maginnis#super[2]　Anna Okounkova#super[1]　Tobias Faehndrich#super[5,6]\
    Kenji Watanabe#super[3]　Takashi Taniguchi#super[4]　Joshua Folk#super[5,6]\
    Matthew Yankowitz#super[1,2,†]
  ]

  #v(0.35em)
  #text(size: 8.5pt)[
    #super[1] 美国华盛顿州西雅图 98195，华盛顿大学物理系\
    #super[2] 美国华盛顿州西雅图 98195，华盛顿大学材料科学与工程系\
    #super[3] 日本筑波 305-0044，国立材料科学中心电子与光学材料研究中心\
    #super[4] 日本筑波 305-0044，国立材料科学中心材料纳米架构研究中心\
    #super[5] 加拿大不列颠哥伦比亚省温哥华 V6T 1Z1，不列颠哥伦比亚大学物理与天文学系\
    #super[6] 加拿大不列颠哥伦比亚省温哥华 V6T 1Z1，不列颠哥伦比亚大学量子物质研究所
  ]

  #v(0.25em)
  #text(size: 8.5pt)[
    #super[∗] D. W. 与 A. B. 对本工作贡献相同　　#super[†] 通讯作者：myank\@uw.edu
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

#v(0.5em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
#bibliography("refs.bib", style: "ieee", title: [参考文献])

#pagebreak()
#align(center)[
  #text(size: 12pt, weight: "bold")[补充材料]\
  #v(2pt)
  #text(size: 9.5pt)[Incipient superconductivity and tunable Chern insulators in\ twisted Bernal bilayer-trilayer graphene（补充材料中文译本）]
]
#v(1em)
#include "frag_8.typ"
#include "frag_6.typ"
#include "frag_7.typ"
