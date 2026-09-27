// 2609.30268 译文宏 —— 原文用 mdframed 给定理类环境上了浅色底 + 细边框，
// 这里按原配色复刻（MainBlue/AccentTeal/SoftBlue/SoftTeal/SoftGray/RuleGray）。

// 配色（照抄 tex L18–23）
#let c-main = rgb("#173B57")
#let c-teal = rgb("#247B7B")
#let c-softblue = rgb("#F1F6FA")
#let c-softteal = rgb("#EFF8F7")
#let c-softgray = rgb("#F5F6F7")
#let c-rule = rgb("#D8DEE4")

// 带编号的显示公式：#eqn("(2.1)")[ $ ... $ ]
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

// 定理类环境：#thm("定理", title: "2.4")[ ... ]
// 底色/边框按 kind 自动选，与 tex 的 \surroundwithmdframed 一致：
//   theorem/definition → theoremframe（浅蓝 + 主蓝框）
//   proposition/corollary → propositionframe（浅青 + 青框）
//   lemma → lemmaframe（浅灰 + 灰框）
//   remark → 原文无框、斜体，中文不排斜体，故只留普通段落 + 粗体小标题
#let thm(kind, title: "", body) = {
  let (fl, st) = if kind == "注" {(none, none)} else if kind == "引理" {(c-softgray, c-rule)} else if kind == "命题" or kind == "推论" {(c-softteal, c-teal)} else {(c-softblue, c-main)}
  block(
    width: 100%,
    above: 0.7em,
    below: 0.7em,
    inset: (left: 0.85em, right: 0.85em, top: 0.6em, bottom: 0.6em),
    fill: fl,
    stroke: if st == none { none } else { (thickness: 0.55pt, paint: st) },
    radius: 1.5pt,
    [
      #set par(first-line-indent: 0em)
      #text(weight: "bold")[#kind#if title != "" [　#title]。]#body
    ],
  )
}

// 证明：结尾自动加证毕方块
#let proof(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[证明。]#body
    #align(right)[□]
  ],
)

// 跨片段接缝：证明开始处（不出方块），收尾片段用 prooftail 补方块
#let proofbegin(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.3em,
  inset: (left: 1.2em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[证明。]#body
  ],
)
#let prooftail(body) = block(
  width: 100%,
  above: 0.2em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
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

// 原文 \begin{center}\itshape 提出的问题
#let question(body) = block(
  width: 100%,
  above: 0.7em,
  below: 0.7em,
  inset: (left: 2.2em, right: 2.2em),
  align(center)[#text(size: 10.5pt)[#body]],
)
