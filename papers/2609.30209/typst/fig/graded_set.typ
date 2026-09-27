// 图 4 重画：(2, ε, ρ)-分级集合（graded set）在窗口 Q_R(a) 内的几何示意。
// 原图为 TikZ 手绘（ABM_final.tex 1529–1630）：两级尺度 ρ₁ < ρ₂ 的球族，
// 每级分族 1（实线）与族 2（虚线），另有半径 1 的格点小球与图例。
// 配色照抄原文：gfunit #6B7280、gfblue #0072B2、gfteal #008A67、
// gforange #D55E00、gfpurple #9B5198。
#import "@preview/cetz:0.4.2": canvas, draw

#let gfunit = rgb("6B7280")
#let gfblue = rgb("0072B2")
#let gfteal = rgb("008A67")
#let gforange = rgb("D55E00")
#let gfpurple = rgb("9B5198")

// 球的描边与填充：族 2 用虚线；填充不透明度 0.14
#let solid(col) = (paint: col, thickness: 0.85pt)
#let dashed(col) = (paint: col, thickness: 0.85pt, dash: "densely-dashed")
// fill opacity 0.14 over white, precomputed
#let fade-orange = rgb("F9E8DB")
#let fade-purple = rgb("F1E7F1")
#let fade-blue   = rgb("DBEBF4")
#let fade-teal   = rgb("DBEFEA")
#let fade-unit   = rgb("E4E6E8")

// 图例文字样式
#let lg(body) = text(size: 8pt, body)
#let lgb(body) = text(size: 8pt, weight: "bold", body)

// 画布：TikZ 原图横向约 13.95 个单位。0.4.2 的 canvas 无 width/height 参数，
// 用 length 定标：内容包围盒约 13.95 x 10.6 单位 -> 13cm x 9.9cm。
#let u = 13cm / 13.95

#canvas(length: u, padding: (top: 4pt, x: 2pt, bottom: 2pt), {
  // 环境窗口 Q_R(a)
  draw.rect((0, 0), (10, 10), stroke: (paint: rgb("8C8C8C"), thickness: 0.7pt))
  draw.content((0, 10.12), [#lg[$Q_R(a)$]], anchor: "south-west")

  // 尺度 rho_2：族 1（橙色实线，半径 0.8）
  for (x, y) in ((2, 7.5), (6.5, 7.5), (2.2, 2.3)) {
    draw.circle((x, y), radius: 0.8, fill: fade-orange, stroke: solid(gforange))
  }
  // 尺度 rho_2：族 2（紫色虚线，半径 0.8）
  for (x, y) in ((2.6, 6.5), (7, 6.4), (7, 2.2)) {
    draw.circle((x, y), radius: 0.8, fill: fade-purple, stroke: dashed(gfpurple))
  }

  // 尺度 rho_1：族 1（蓝色实线，半径 0.4）
  for (x, y) in ((1, 1), (4.3, 1.2), (9, 4.2), (4.3, 5), (1, 4.8), (4.5, 9), (8.5, 8.8)) {
    draw.circle((x, y), radius: 0.4, fill: fade-blue, stroke: solid(gfblue))
  }
  // 尺度 rho_1：族 2（青绿虚线，半径 0.4）
  for (x, y) in ((1.4, 1.2), (3.1, 2.8), (4.6, 5.5), (8.5, 4.5), (8.7, 1.2), (1, 8.8), (7, 9)) {
    draw.circle((x, y), radius: 0.4, fill: fade-teal, stroke: dashed(gfteal))
  }

  // 单位尺度 F_0 的格点小球（半径 1，图上画成 0.1 的灰点）
  for (x, y) in (
    (0.7, 2.7), (1.1, 3.2), (1.7, 4), (3, 0.8), (3, 4.5), (3.6, 3.8),
    (3.8, 6.5), (4.6, 7), (5.1, 1.9), (5.5, 3.7), (5.6, 6), (5.5, 8.6),
    (6.2, 4.8), (7.3, 4.4), (8.3, 5.8), (9.1, 6.9), (9.4, 2.6), (9.3, 9.1),
    (0.8, 6.3), (4, 8), (6.8, 1), (8.8, 0.6), (2, 7.5)
  ) {
    draw.circle((x, y), radius: 0.1,
      fill: fade-unit, stroke: (paint: gfunit, thickness: 0.5pt))
    draw.circle((x, y), radius: 0.022, fill: gfunit, stroke: none)
  }

  // 两球（而非球心）之间的距离标注
  draw.line((2.8, 7.5), (5.7, 7.5), stroke: (paint: gforange, thickness: 0.65pt),
    mark: (start: ">>", end: ">>"))
  draw.content((4.25, 7.49), [
    #rect(fill: white, inset: (x: 1.5pt, y: 0pt), radius: 0pt)[#lg[$>= rho_2^(1+epsilon)$]]
  ], anchor: "south")

  // 每个正尺度一个半径标记
  draw.circle((2.2, 2.3), radius: 0.03, fill: gforange, stroke: none)
  draw.line((2.2, 2.3), (3, 2.3), stroke: (paint: gforange, thickness: 0.65pt),
    mark: (end: ">>"))
  draw.content((2.6, 2.24), [#lg[$rho_2$]], anchor: "north")
  draw.circle((4.3, 1.2), radius: 0.026, fill: gfblue, stroke: none)
  draw.line((4.3, 1.2), (4.7, 1.2), stroke: (paint: gfblue, thickness: 0.6pt),
    mark: (end: ">>"))
  draw.content((4.3, 0.55), [#lg[$rho_1$]], anchor: "center")

  // ---- 图例：每个（尺度, 族）组合一种颜色 ----
  draw.content((10.55, 9.55), [#text(size: 9pt)[$cal(F) = cal(F)_0 union cal(F)_1 union cal(F)_2$]],
    anchor: "west")
  draw.content((10.55, 8.95), [#lg[$cal(F)_i = cal(F)_i^(1) union cal(F)_i^(2)$，$i = 1,2$]],
    anchor: "west")

  draw.circle((10.75, 8.05), radius: 0.1,
    fill: fade-unit, stroke: (paint: gfunit, thickness: 0.6pt))
  draw.circle((10.75, 8.05), radius: 0.022, fill: gfunit, stroke: none)
  draw.content((11.2, 8.05), [#lg[$cal(F)_0$ 半径 $1$]], anchor: "west")

  draw.content((10.55, 7.15), [#lgb[尺度 $rho_1$]], anchor: "west")
  draw.circle((10.75, 6.55), radius: 0.18, fill: fade-blue, stroke: solid(gfblue))
  draw.content((11.2, 6.55), [#lg[$cal(F)_1^(1)$ 族 $1$]], anchor: "west")
  draw.circle((10.75, 5.95), radius: 0.18, fill: fade-teal, stroke: dashed(gfteal))
  draw.content((11.2, 5.95), [#lg[$cal(F)_1^(2)$ 族 $2$]], anchor: "west")

  draw.content((10.55, 4.95), [#lgb[尺度 $rho_2$]], anchor: "west")
  draw.circle((10.75, 4.35), radius: 0.25, fill: fade-orange, stroke: solid(gforange))
  draw.content((11.2, 4.35), [#lg[$cal(F)_2^(1)$ 族 $1$]], anchor: "west")
  draw.circle((10.75, 3.6), radius: 0.25, fill: fade-purple, stroke: dashed(gfpurple))
  draw.content((11.2, 3.6), [#lg[$cal(F)_2^(2)$ 族 $2$]], anchor: "west")

  draw.content((10.55, 2.55), [#lg[$1 < rho_1 < rho_2$，$N = 2$]], anchor: "west")
  draw.content((10.55, 1.9), [#lg[$rho_2 >= rho_1^(1+2 epsilon)$]], anchor: "west")
  draw.content((10.55, 0.8), [#lg[$F = cal(F) ∩ bb(Z)^2$]], anchor: "west")
})
