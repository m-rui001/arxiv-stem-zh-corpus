// 三维 Allen–Cahn 方程的稳定解是一维的
// arXiv:2609.30194 中文译本
//
// 原文：amsart 单栏 44 页，六节，无照片/数据图，只有一幅 TikZ 示意图（L777，
//   "Schematic periodic one-dimensional transition"）—— 本轮用 CeTZ 重画。
// 编号：`\numberwithin{equation}{section}`，式号形如 (4.23)；
//   Theorem/Lemma/Corollary/Proposition/Claim/Conjecture/Problem/Definition/
//   Notation/Remark 共用一个按节计数的计数器，所以"引理 4.6""命题 4.7"是同一个序列。
//   Assumption 独立编号为 A/B/…。全部编号地图见 CONVENTIONS.md，不许自己数。
// 术语表与 Typst 约定见 CONVENTIONS.md。

#set document(title: "三维 Allen–Cahn 方程的稳定解是一维的")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set figure(numbering: "1", supplement: [图])
#show figure.where(kind: table): set figure(supplement: [表])
#set math.equation(numbering: none, supplement: [式])

#import "macros.typ": *

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.2em, below: 0.4em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}
#show heading.where(level: 2): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 0.9em, below: 0.3em)[
    #text(weight: "bold", size: 10pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)

#align(center)[
  #text(size: 13pt, weight: "bold")[三维 Allen–Cahn 方程的稳定解是一维的\
  Stable solutions of the Allen–Cahn equation in dimension three are one-dimensional]

  #v(0.8em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Hardy Chan　Xavier Fernández-Real　Alessio Figalli　Enric Florit-Simon　Joaquim Serra
  ]

  #v(0.3em)
  #text(size: 8.5pt, font: ("New Computer Modern", "Noto Serif SC"))[
    H. Chan：巴塞尔大学数学与信息学系（瑞士巴塞尔 4051，Spiegelgasse 1）。\
    X. Fernández-Real：洛桑联邦理工学院 EPFL SB（瑞士洛桑 1015，Station 8）。\
    A. Figalli、E. Florit-Simon、J. Serra：苏黎世联邦理工学院数学系（瑞士苏黎世 8092，Rämistrasse 101）。
  ]
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
