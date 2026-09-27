// 求解变分问题的最优恢复
// arXiv:2609.30049 中文译本
//
// 原文：elsarticle / A4 单栏，31 页；主文八节 + 致谢 + 附录 A、B，
//   编号公式 38 个 label、图 12 幅、表 3 张、参考文献 68 条（源包自带 ref.bib）。
// 图片处理：12 幅全为数据曲线、收敛速率图、稀疏模式热图与 p-Laplace 解曲面，
//   重画只会把可读矢量换成对不上的坐标，一律嵌入原图只译图注（范围决定，不做 CeTZ 重画）。
// 术语表与 Typst 约定见 CONVENTIONS.md（子代理分工用），要点：
//   optimal recovery = 最优恢复；RKHS = 再生核 Hilbert 空间；Matérn kernel = Matérn 核；
//   representer theorem = 表示定理；screening effect = 屏蔽效应；fill-in = 填充元；
//   Γ–convergence = Γ–收敛；coercivity = 强制性；lower semicontinuity = 下半连续性；
//   strong/weak form = 强形式/弱形式；mesh-free = 无网格；collocation = 配点；
//   equation of state = 状态方程（EOS）；data-fitting term = 数据拟合项；nugget = 金块项。
// 章节编号手写进标题文本，交叉引用写"第 3 节""式 (12)""定理 6.1"；图走 @label。

#set document(title: "求解变分问题的最优恢复")
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
#show figure.caption: set par(first-line-indent: 0em)
#show figure: set block(below: 1em)

// ---------------------------------------------------------------- 标题与作者

#align(center)[
  #text(size: 13pt, weight: "bold")[求解变分问题的最优恢复]\
  #v(0.6em)
  #text(size: 10pt)[Ting Wang¹³、Gideon Simpson²、Jaroslaw Knap³\
  #v(0.3em)
  #text(size: 8.5pt)[\
    ¹ Booz Allen Hamilton 公司，美国弗吉尼亚州麦克莱恩 22102\
    ² 德雷塞尔大学，美国宾夕法尼亚州费城 19104\
    ³ 美国陆军作战能力发展司令部（DEVCOM）陆军研究实验室，美国马里兰州阿伯丁试验场 21005
  ]
]
]

#v(0.9em)

#block(
  width: 100%,
  inset: (x: 1.5em, y: 1.1em),
  radius: 2pt,
  stroke: 0.6pt + gray,
  fill: rgb("#fafafa"),
)[
  #par(first-line-indent: 0em)[#text(weight: "bold")[摘要]]
  #par(first-line-indent: 0em)[
    科学与工程里的许多物理定律和科学原理，天然就是"在合适的函数空间上极小化某个能量泛函"这样的变分问题。很多时候，直接找出能量泛函的极小元，比去解对应的欧拉–拉格朗日方程更有好处。传统数值求解器——比如有限元方法（FEM）——往往不够灵活，难以把先验信息或含噪观测数据纳进来。近几年，机器学习方法特别是核方法，在科学计算里受到越来越多的关注。FEM 需要对区域离散化并生成网格，核方法则从散乱节点构造解，省掉了划网格的麻烦，在高维或几何复杂的区域上尤其吃香。本文基于再生核 Hilbert 空间（RKHS）中的最优恢复表述，给出变分能量最小化的两步流程，为同时纳入物理约束与数据约束提供了一个统一框架。计算方面，用 Matérn 核的稀疏 Cholesky 分解来缓解核方法众所周知的三次复杂度瓶颈。理论方面，借助 Γ–收敛理论严格建立所提方法的极小元存在性与收敛性。若干基准问题上的数值实验显示，这套方法高效、稳健且精确。
  ]
]

#v(0.5em)

#par(first-line-indent: 0em)[
  #text(size: 9pt)[#text(weight: "bold")[关键词：]变分问题，机器学习，无网格，稀疏逼近，核方法，Γ–收敛]
]

#v(0.8em)

// ---------------------------------------------------------------- 正文各节

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

// ---------------------------------------------------------------- 参考文献

#v(1em)
#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))
#bibliography("refs.bib", style: "ieee", title: [参考文献])
