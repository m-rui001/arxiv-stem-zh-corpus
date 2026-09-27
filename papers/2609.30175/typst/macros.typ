// 2609.30175《Chromatic Dynamical Decoupling：用电路深度换脉冲稀疏度》中文译本宏
//
// 原文 revtex4-2 prx 双栏 16 页，\numberwithin 未开 → 公式全局连续编号 (1)…(26)，
// 附录另起 (A1)…(A9)；一个 subequations 块（tex 里的 \bes/\ees）把式 (2)(3)(4) 的
// 各行拆成 2a/2b、3a/3b/3c、4a/4b。全部编号取自本地编译的 cgdd7.aux，见 CONVENTIONS.md。

#let c-main = rgb("#173B57")
#let c-teal = rgb("#247B7B")
#let c-softblue = rgb("#F1F6FA")
#let c-softgray = rgb("#F5F6F7")
#let c-rule = rgb("#D8DEE4")

// 色图（正文里 red/green/blue/gray 指配色类，不是 RGB 分量）
#let col-red = rgb("#C0392B")
#let col-green = rgb("#1E7A3C")
#let col-blue = rgb("#2A5CAA")
#let col-gray = rgb("#9AA0A6")

// 算子式正体符号：数学模式里写 #PRR，不要写 PRR（会被当变量）。
#let PRR = math.op("PRR")


// 带编号的显示公式：#eqn("(3a)")[ $ ... $ ]
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

// 定理类环境。#set par 必须写在内容块内、粗体小标题之前，且与标题同一行段落，
// 否则会把小标题单独断成一段（零告警，只有逐页看图能发现）。
#let thm(kind, title: "", body) = block(
  width: 100%,
  above: 0.7em,
  below: 0.7em,
  inset: (left: 0.85em, right: 0.85em, top: 0.6em, bottom: 0.6em),
  fill: c-softblue,
  stroke: (thickness: 0.55pt, paint: c-main),
  radius: 1.5pt,
  [ #set par(first-line-indent: 0em)
    #text(weight: "bold")[#kind　#title。]#body ],
)

#let proof(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [ #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[证明。]#body
    #align(right)[□] ],
)

// 跨片段接缝
#let proofbegin(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.3em,
  inset: (left: 1.2em),
  [ #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[证明。]#body ],
)
#let prooftail(body) = block(
  width: 100%,
  above: 0.2em,
  below: 0.9em,
  inset: (left: 1.2em),
  [ #set par(first-line-indent: 0em)
    #body
    #align(right)[□] ],
)

// 图：编号是字面值，不走 counter。#fig("2")[ 图注 ]( 内容 )
// 多面板图传 breakable: false，否则面板会被拆到两页、图注孤悬在次页。
#let fig(num, caption, body, breakable: true) = block(
  width: 100%,
  breakable: breakable,
  above: 1.1em,
  below: 1.1em,
  [
    #set par(first-line-indent: 0em)
    #align(center, body)
    #v(0.45em)
    #block(width: 100%, inset: (left: 1.4em, right: 1.4em))[
      #set text(size: 8.5pt)
      #text(weight: "bold")[图 #num　]#caption ]
  ],
)

// 子图标签 (a)(b)(c)……
#let panel(lbl, body) = block(width: 100%, above: 0.3em, below: 0.1em)[
  #set par(first-line-indent: 0em)
  #text(size: 9pt, weight: "bold")[#lbl]#body
]

// 脉冲序列等宽字
#let seq(s) = text(font: ("DejaVu Sans Mono", "New Computer Modern"), size: 9.5pt)[#s]

// 符号矩阵示意（图 2/3/4）：一行 = 一个配色类。
//   dot：圆点颜色（none 表示该行不画点）；signs："+-+" 这样的符号串；s：脉冲序列。
#let sigrow(dot, signs, s) = {
  let cells = signs.split("").map(c => text(size: 9.5pt)[#c])
  grid(
    columns: (1.8em, 1.4em) + ((1.15em,) * cells.len()) + (auto,),
    gutter: 0pt,
    align: center + horizon,
    if dot == none { [] } else { circle(fill: dot, radius: 0.42em, stroke: none) },
    [→],
    ..cells,
    seq(s),
  )
}
#let sigmatrix(rows) = block(
  width: 100%, breakable: false, above: 0.4em, below: 0.4em, inset: (left: 0.6em, right: 0.6em),
  stack(spacing: 0.5em, ..rows.map(r => sigrow(..r))),
)

