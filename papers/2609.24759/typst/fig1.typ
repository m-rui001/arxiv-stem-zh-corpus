// Fig.1 重绘 —— 按 D:\cetz-skill-release SKILL.md 工作流（CeTZ 0.4.2）
// 面板 (a) S-AM-S 三层结构与 Andreev 能支示意；(b) 类 transmon 电路；(c)-(e) 三种结区间的约瑟夫森势与波函数
#import "@preview/cetz:0.4.2": canvas, draw

#let sblue = rgb(168, 204, 240)
#let jblue = rgb(26, 89, 191)

#let gsampling(a, b, n) = range(n).map(i => a + (b - a) * i / n)

// 曲线：f 在 [a,b] 上采样为折线
#let curve(f, a, b, n: 60, stroke: 1pt, fill: none, name: none) = {
  let pts = gsampling(a, b, n).map(x => (x, f(x)))
  draw.line(..pts, stroke: stroke, fill: fill, name: name)
}

// 高斯波包阴影（从基线 y0 向上填充）
#let bump(mu, s, A, y0, a, b, col) = {
  let xs = gsampling(a, b, 40)
  let up = xs.map(x => (x, y0 + A * calc.exp(-calc.pow((x - mu) / s, 2))))
  let dn = xs.map(x => (x, y0))
  let dn = range(dn.len()).map(i => dn.at(dn.len() - 1 - i))
  draw.line(..up, ..dn, stroke: none, fill: col)
}

// Josephson 结符号：方框内画叉
#let jj(cx, cy) = {
  draw.rect((cx - 0.22, cy - 0.22), (cx + 0.22, cy + 0.22),
    fill: white, stroke: (paint: jblue, thickness: 1.2pt))
  draw.line((cx - 0.22, cy - 0.22), (cx + 0.22, cy + 0.22), stroke: 1pt)
  draw.line((cx - 0.22, cy + 0.22), (cx + 0.22, cy - 0.22), stroke: 1pt)
}

#let panel-a = canvas(length: 0.9cm, {
  // S-AM-S 三层
  draw.rect((0, 0), (0.85, 2.6), fill: sblue, stroke: none)
  draw.rect((4.15, 0), (5.0, 2.6), fill: sblue, stroke: none)
  draw.content((0.42, 1.3), [S], anchor: "center")
  draw.content((4.58, 1.3), [S], anchor: "center")
  // 中间交替磁体区
  draw.line((0.85, 0), (0.85, 2.6), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
  draw.line((4.15, 0), (4.15, 2.6), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
  draw.content((2.5, 2.25), [AM], anchor: "center")
  // Andreev 能支：上（红，自旋向上）下（蓝，自旋向下）两支 + 灰色包络
  let eye-top(x) = 1.55 + 0.42 * calc.sin(calc.pi * (x - 1.15) / 2.7)
  let eye-bot(x) = 1.05 - 0.42 * calc.sin(calc.pi * (x - 1.15) / 2.7)
  curve(eye-top, 1.15, 3.85, stroke: (paint: red, thickness: 1.1pt))
  curve(eye-bot, 1.15, 3.85, stroke: (paint: blue, thickness: 1.1pt))
  curve(x => 1.3 + 0.18 * calc.sin(calc.pi * (x - 1.15) / 2.7), 1.15, 3.85,
    stroke: (paint: gray, thickness: 0.7pt))
  draw.content((3.95, 1.98), [#text(size: 6pt)[$E _ arrow.t$]], anchor: "west")
  draw.content((3.95, 0.72), [#text(size: 6pt)[$E _ arrow.b$]], anchor: "west")
  // 厚度 L 双箭头
  draw.line((0.85, 2.85), (4.15, 2.85), stroke: 0.8pt, mark: (start: ">", end: ">"))
  draw.content((2.5, 3.0), [L], anchor: "center")
  // 相位 phi
  draw.content((2.5, 0.28), [#text(size: 7pt)[$phi$]], anchor: "center")
})

#let panel-b = canvas(length: 0.9cm, {
  // SQUID 型 transmon：左环两结，右电容
  let w = (paint: black, thickness: 1pt)
  draw.line((0.6, 2.3), (3.6, 2.3), stroke: w)
  draw.line((0.6, 0.3), (3.6, 0.3), stroke: w)
  draw.line((0.6, 0.3), (0.6, 2.3), stroke: w)
  draw.line((3.6, 0.3), (3.6, 2.3), stroke: w)
  jj(1.6, 2.3)
  jj(1.6, 0.3)
  // 外磁通
  draw.circle((2.45, 1.3), radius: 0.34, fill: none, stroke: 0.8pt)
  draw.content((2.45, 1.3), [#text(size: 6.5pt)[$Phi$]], anchor: "center")
  draw.content((2.45, 0.8), [#text(size: 5.5pt)[ext]], anchor: "center")
  // 电容（右侧极板）
  draw.line((4.2, 1.45), (4.2, 2.3), stroke: w)
  draw.line((4.2, 0.3), (4.2, 1.22), stroke: w)
  draw.line((3.6, 2.3), (4.2, 2.3), stroke: w)
  draw.line((3.6, 0.3), (4.2, 0.3), stroke: w)
  draw.line((3.92, 1.34), (4.48, 1.34), stroke: 1.4pt)
  draw.line((3.92, 1.10), (4.48, 1.10), stroke: 1.4pt)
  draw.content((4.2, 0.72), [#text(size: 6pt)[C]], anchor: "center")
})

#let pot-panel(f, bumps, label, lab-pos) = canvas(length: 0.9cm, {
  let a = 0.0
  let b = 4.0
  // 基线
  draw.line((a, 0.4), (b, 0.4), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
  for bp in bumps {
    bump(bp.mu, bp.s, bp.A, bp.y0, bp.a, bp.b, bp.col)
    draw.line((bp.a, bp.y0 + bp.A), (bp.b, bp.y0 + bp.A),
      stroke: (paint: bp.col.darken(20%), thickness: 0.5pt, dash: "dashed"))
  }
  curve(f, a, b, stroke: (paint: gray.darken(30%), thickness: 1.1pt))
  draw.content(lab-pos, [#text(size: 8pt)[#label]], anchor: "center")
})

#let u-phi(x) = 1.35 - 0.95 * calc.cos(1.6 * (x - 2.0) + 0.9) - 0.45 * calc.cos(3.2 * (x - 2.0) + 1.6)
#let u-0(x) = 1.7 - 1.05 * calc.cos(1.55 * (x - 2.0))
#let u-2phi(x) = 1.5 - 0.62 * calc.cos(3.1 * (x - 2.0)) - 0.28 * calc.cos(1.55 * (x - 2.0))

#let fig1 = grid(
  columns: (58%, 42%),
  rows: (auto, auto),
  column-gutter: 0.6em,
  row-gutter: 0.4em,
  align(center + horizon)[#panel-a],
  align(center + horizon)[#panel-b],
  grid.cell(colspan: 2, align(center)[
    #grid(
      columns: 3,
      column-gutter: 0.5em,
      align(center + horizon)[
        #pot-panel(u-phi,
          ((mu: 1.15, s: 0.34, A: 0.62, y0: 0.42, a: 0.2, b: 2.1, col: blue.lighten(70%)),
           (mu: 1.15, s: 0.42, A: 1.30, y0: 0.42, a: 0.1, b: 2.2, col: red.lighten(60%)),
           (mu: 2.9, s: 0.5, A: 1.95, y0: 0.42, a: 1.9, b: 3.9, col: yellow.lighten(45%))),
          [$phi$ 结], (0.7, 3.35))
      ],
      align(center + horizon)[
        #pot-panel(u-0,
          ((mu: 2.0, s: 0.42, A: 0.55, y0: 0.62, a: 1.1, b: 2.9, col: blue.lighten(70%)),
           (mu: 2.0, s: 0.62, A: 1.05, y0: 0.62, a: 0.7, b: 3.3, col: red.lighten(60%)),
           (mu: 2.0, s: 0.9, A: 1.55, y0: 0.62, a: 0.3, b: 3.7, col: yellow.lighten(45%))),
          [$0$ 结], (2.0, 3.35))
      ],
      align(center + horizon)[
        #pot-panel(u-2phi,
          ((mu: 0.98, s: 0.3, A: 0.6, y0: 0.42, a: 0.15, b: 1.8, col: blue.lighten(70%)),
           (mu: 3.02, s: 0.3, A: 0.6, y0: 0.42, a: 2.2, b: 3.85, col: blue.lighten(70%)),
           (mu: 2.0, s: 0.45, A: 1.35, y0: 0.42, a: 0.9, b: 3.1, col: red.lighten(60%)),
           (mu: 2.0, s: 0.8, A: 2.0, y0: 0.42, a: 0.2, b: 3.8, col: yellow.lighten(45%))),
          [$2phi$ 结], (3.3, 3.35))
      ],
    )
  ]),
)

#fig1
