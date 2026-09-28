// 2609.30228《三维聚焦能量临界非线性薛定谔方程的整体适定性与散射》中文译本
// 原文：Qingtang Su (中国科学院数学与系统科学研究院 / 晨兴数学中心), Zehua Zhao (北京理工大学) —— arXiv:2609.30228v1
// 排版：A4 单栏 10 pt；5 节，式 (1.1)–(5.11) 共 84 条、定理类 12 项（定理/命题/引理/定义共用一个按节计数）、
//   全文无图无表；文献 28 条。编号权威 = 本地 pdflatex 编译两遍的 arXiv.aux，地图见 CONVENTIONS.md §2。

#set document(title: "三维聚焦能量临界非线性薛定谔方程的整体适定性与散射")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set math.equation(numbering: none)

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
  #text(size: 13pt, weight: "bold")[三维聚焦能量临界非线性薛定谔方程的\
  整体适定性与散射\
  #v(3pt)
  #text(size: 10.5pt)[Global well-posedness and scattering for the three-dimensional focusing energy-critical NLS]]

  #v(0.9em)
  #text(size: 10pt, font: ("New Computer Modern", "Noto Serif SC"))[
    Qingtang Su#super[1]　Zehua Zhao#super[2]
  ]

  #v(0.4em)
  #text(size: 9pt)[
    #super[1]　中国科学院数学与系统科学研究院（中国北京）；晨兴数学中心（中国北京）\
    #super[2]　北京理工大学数学与统计学院，代数李理论与分析教育部重点实验室（中国北京）
  ]
]

#v(1.1em)

#block(width: 100%, inset: (left: 1.5em, right: 1.5em, top: 1.1em, bottom: 1.1em), radius: 2pt, stroke: 0.6pt + black)[
  #set par(first-line-indent: 2em)
  #align(center)[#text(weight: "bold")[摘要]]
  本文证明三维聚焦能量临界非线性薛定谔方程在基态的能量阈值与梯度阈值之下整体适定且散射，从而确认了三维情形的阈值猜想。受我们此前关于 $H^s(ℝ^3)$（$s > 1 #s 2$）上三维散焦三次方程工作的启发，我们从一条相互作用 Morawetz 恒等式出发导出频率定域化的 $L^4_(t,x)$ 估计，全程不假定有限质量。我们把相互作用权重改造得适应投影密度，于是在聚焦情形下得到一个正的四次时空项，再利用非线性相消把频率截断误差吸进这一项之中。
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

#v(1em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
#show bibliography: set par(leading: 0.52em, spacing: 0.3em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
