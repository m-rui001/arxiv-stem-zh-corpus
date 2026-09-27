// 超出确定因果序的量子信道 Stein 定理
// arXiv:2609.30268 中文译本
//
// 原文：单栏 pdflatex 20 页，七个主节 + 附录 A，**无图无表**，
//   定理类环境用 mdframed 上浅色底 + 细框（配色见 tex L18–23，已在 macros.typ 复刻）。
// 编号：`\numberwithin{equation}{section}` → 式号 (2.1)…(A.2) 共 60 式；
//   Theorem/Proposition/Lemma/Corollary/Definition/Remark 共用一个按节计数器（aliascnt），
//   所以"定义 2.1…定理 2.4""定理 5.1…注 5.5"同序列。全部编号取自原文编译出的
//   main-qcst.aux，权威表见 CONVENTIONS.md §2/§3，不许自己数。
// 文献：tex 内手写 23 条 \bibitem，已核对 bibitem 顺序 == 正文首引顺序，
//   故 refs.bib + ieee 样式自动印出的 [1]–[23] 与原文一致。

#set document(title: "超出确定因果序的量子信道 Stein 定理")
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
  #text(size: 13pt, weight: "bold")[超出确定因果序的量子信道 Stein 定理\
  Quantum Channel Stein Theorem beyond Definite Causal Order]

  #v(0.8em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Chengkai Zhu　Xin Wang
  ]

  #v(0.3em)
  #text(size: 8.5pt, font: ("New Computer Modern", "Noto Serif SC"))[
    C. Zhu：QudeLeap Research，中国上海 200030。\
    X. Wang：香港科技大学（广州）信息枢纽人工智能主题，中国广州 511453（通讯作者）。
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
#include "frag_10.typ"

#v(1em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
#bibliography("refs.bib", style: "ieee", title: [参考文献])
