// 色动力学解耦中以电路深度换脉冲稀疏度
// arXiv:2609.30175 中文译本
//
// 原文：revtex4-2 (prx) 双栏 16 页，五个主节 + 附录 A，9 幅图、1 张三线表、3 个定理、
//   26 个正文编号公式（含 2a/2b、3a–3c、4a/4b 子行）+ 附录 (A1)–(A9)。
// 编号：公式全局连续（不按节重置），全部取自本地编译的 cgdd7.aux，权威表见 CONVENTIONS.md §2。
// 图：图 1、5–9 是源包里的矢量 PDF，直接嵌；图 2/3/4 原文是 TikZ 示意（色点 + 符号矩阵 +
//   脉冲序列），在 frag_3/frag_4/frag_5 里用 macros.typ 的 sigmatrix 重画。
// 文献：tex 内手写 53 条 \bibitem（apsrev4-2 生成的 bbl），已核对 bibitem 顺序 == 正文首引
//   顺序，故 ieee 样式印出的 [1]–[53] 与原文一致；原刊不印论文标题，refs.bib 亦不设 title。

#set document(title: "色动力学解耦中以电路深度换脉冲稀疏度")
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
  block(width: 100%, inset: 0pt, above: 1.0em, below: 0.35em)[
    #text(weight: "bold", size: 10pt)[#it.body]
  ]
}

#align(center)[
  #text(size: 13pt, weight: "bold")[色动力学解耦中以电路深度换脉冲稀疏度\
  Trading Circuit Depth for Pulse Sparsity in Chromatic Dynamical Decoupling]

  #v(0.8em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Amy F. Brown　Daniel A. Lidar
  ]

  #v(0.3em)
  #text(size: 8.5pt, font: ("New Computer Modern", "Noto Serif SC"))[
    南加州大学物理与天文系、量子信息与科学技术中心，洛杉矶，加州 90089，美国\
    D. A. Lidar 另任南加州大学电气与计算机工程系、化学系，及 Quantum Elements（加州 Westlake Village 91361）
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
#include "frag_7.typ"
#include "frag_8.typ"
#include "frag_9.typ"

#v(0.5em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
// 53 条文献刚好溢出到次页一行；收紧参考条目的行距与条间距，把末条拉回上一页。
#show bibliography: set par(leading: 0.52em, spacing: 0.3em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
