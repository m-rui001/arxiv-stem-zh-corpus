// 2609.30049 译文宏

// 带编号的显示公式：#eqn("(12)")[ $ ... $ ]
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

// 不编号的显示公式
#let eqnb(body) = block(width: 100%, above: 0.8em, below: 0.8em, align(center, body))

// 窄图居中
#let figc(img) = block(width: 100%, inset: 0pt)[#align(center, img)]

// 定理类环境：#thm("定理 6.1", "证明"){...}
#let thm(kind, title: "", body) = block(
  width: 100%,
  above: 0.7em,
  below: 0.7em,
  inset: (left: 1.2em, right: 0.6em),
  [
    #text(weight: "bold")[#kind#if title != "" [　#title]。]
    #set par(first-line-indent: 0em)
    #body
  ],
)

// 证明：结尾自动加证毕方块
#let proof(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #text(weight: "bold", style: "italic")[证明。]
    #set par(first-line-indent: 0em)
    #body
    #align(right)[□]
  ],
)

// 译注
#let note(body) = block(
  width: 100%,
  above: 0.3em,
  below: 0.7em,
  inset: (left: 1.6em, right: 1.6em),
  text(size: 8.5pt)[#body],
)
