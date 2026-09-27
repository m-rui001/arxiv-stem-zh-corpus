// 补充材料（S1–S11）：由五个片段拼成，公式与表按 (S1)… 自动续排。
// 原文各节用 \section 自动编号，这里把编号写进标题文字；\setcounter 归零在下面的 update 里做。

#counter(math.equation).update(0)
#counter(table).update(0)

= 补充材料

#par(first-line-indent: 0em)[#text(weight: "bold")[补充内容目录]]

#par(first-line-indent: 0em)[
  第 1 节　概述与预言问题\
  第 2 节　自旋空间群及其对磁结构的作用\
  第 3 节　由 SSG 对称性给磁有序分类\
  第 4 节　自旋平移对称性与守恒的超自旋分量\
  第 5 节　完整的基于对称性的预言流程\
  第 6 节　材料层面的预言层级\
  第 7 节　与实验测定磁结构的基准比较\
  第 8 节　Materials Project 中的高通量搜索\
  第 9 节　VGe₃ 的第一性原理研究\
  第 10 节　非共面磁序带来的混合波磁性\
  第 11 节　四方相 Fe₂SiO₄ 的能量筛查
]

#include "supp_1.typ"
#include "supp_2.typ"
#include "supp_3.typ"
#include "supp_4.typ"
#include "supp_5.typ"
