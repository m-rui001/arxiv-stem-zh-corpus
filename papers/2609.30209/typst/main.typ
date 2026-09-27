// 2609.30209《格点 Anderson–Bernoulli 模型在任意维下谱边缘附近的定域化》中文译本
// 原文：Linjun Li (UPenn), Shihe Liu (PKU), Lingfu Zhang (Caltech) —— arXiv:2609.30209v1，amsart 单栏 48 页
// 排版：A4 单栏 10 pt；5 节（含附录 A），式 (1.1)–(A.20)、图 1–8（全部由 TikZ 示意改为 CeTZ 重画）、
//   定理/引理/定义/注记/命题/构造共用一个按节计数的序号，Claim 单独计数；文献 57 条。
//   编号权威 = 本地 pdflatex 编译出的 ABM_final.aux，全部地图见 CONVENTIONS.md §2。

#set document(title: "格点 Anderson–Bernoulli 模型在任意维下谱边缘附近的定域化")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#show raw: set text(lang: "zh")

#import "macros.typ": *

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.3em, below: 0.5em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}
#show heading.where(level: 2): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1em, below: 0.35em)[
    #text(weight: "bold", size: 10pt)[#it.body]
  ]
}

#align(center)[
  #text(size: 13pt, weight: "bold")[格点 Anderson–Bernoulli 模型在任意维下\
  谱边缘附近的定域化\
  #v(3pt)
  #text(size: 10.5pt)[Localization near the edge for the lattice Anderson-Bernoulli model on general dimension]]

  #v(0.9em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Linjun Li#super[1]　Shihe Liu#super[2]　Lingfu Zhang#super[3]
  ]

  #v(0.4em)
  #text(size: 9pt)[
    #super[1]　美国宾夕法尼亚大学数学系（费城）\
    #super[2]　北京大学数学科学学院（中国北京）\
    #super[3]　美国加州理工学院物理、数学与天文学部（帕萨迪纳）
  ]

  #v(0.5em)
  #text(size: 9pt, style: "italic")[谨以此文纪念 Jean Bourgain 教授]
]

#v(1.1em)

#block(width: 100%, inset: (left: 1.5em, right: 1.5em, top: 1.1em, bottom: 1.1em), radius: 2pt, stroke: 0.6pt + black)[
  #set par(first-line-indent: 2em)
  #align(center)[#text(weight: "bold")[摘要]]
  安德森紧束缚模型是描述无序介质中量子输运与定域化的基本模型。Bourgain 与 Kenig 曾把伯努利势情形留作公开问题，本文把它补上：对任意维数 $d >= 2$，带伯努利势的格点安德森模型在谱的下边缘附近满足安德森定域化。证明沿用 Fröhlich–Spencer 与 Bourgain–Kenig 的多尺度框架，其中的主要新成分是一个针对离散薛定谔方程的*概率型离散唯一延拓原理*（PDUC）。这一 PDUC 由自举（bootstrap）论证建立，关键的一步是一条概率引理，其证法是把随机势自适应地逐格揭示出来。
]

#v(0.9em)

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
#include "frag_11.typ"

#v(1em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
#bibliography("refs.bib", style: "ieee", title: [参考文献])
