// 可调谐双曲超材料增强单光子发射
// arXiv:2609.30179 中文译本
//
// 原文：achemso (jacsat) 预印本 23 页单栏，章节只有标题无编号；公式全局连续 (1)(2)，
//   图 1–5（原文均为跨栏 figure*）、表 1。
// 编号：全部取自本地编译的 Main.aux 的 \newlabel，权威表见 CONVENTIONS.md §2。
// 文献：41 条，achemso 的 ACS 数字式本就按正文首引顺序编号，与 Typst ieee 样式同序，
//   故译本文献号与原文 [1]–[41] 逐条对齐。
// 图：五幅均取自源包（Fig1.png、Fig2_NEW.png、Fig3.png、Fig4.png、Fig5.png），
//   全是数据/仿真图与示意图混排的原图，只译图注，不重画。

#set document(title: "可调谐双曲超材料增强单光子发射")
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
  #text(size: 13pt, weight: "bold")[可调谐双曲超材料增强单光子发射\
  Tunable Hyperbolic Metamaterials for Brightening Single-Photon Emission]

  #v(0.8em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Manobina Karmakar　　Pavel Klok　　Filip Ligmajer　　Leonardo de S. Menezes
  ]

  #v(0.3em)
  #text(size: 8.5pt)[
    慕尼黑大学物理学院混合纳米系统讲席与慕尼黑纳米研究所，Königinstraße 10, 80539 München，德国\
    布尔诺理工大学机械工程学院物理工程研究所，Technická 2, 61669 Brno，捷克\
    布尔诺理工大学中欧技术研究所，Purkyňova 123, 61200 Brno，捷克\
    伯南布哥联邦大学物理系，50670-901 Recife-PE，巴西
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
