// 2609.30040 二次谱相超宽带光脉冲（一）中文译本共用宏

// 编号公式助手：num 传带括号的字符串 "(3a)"，编号原样右对齐
#let eqn(num, body) = block(
  width: 100%,
  above: 0.8em,
  below: 0.8em,
  grid(
    columns: (1fr, auto),
    gutter: 12pt,
    align: (center + horizon, right + horizon),
    body,
    text(size: 10pt)[#num],
  ),
)

// 译注：小字号、不缩进，用于标注原文可能的笔误
#let note(body) = par(
  first-line-indent: 0em,
  text(size: 8.5pt)[#text(weight: "bold")[译注：] #body],
)
