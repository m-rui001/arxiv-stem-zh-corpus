// 图 8 重画：跨多尺度立方体的环状自举示意（§3.5 Step 3 配图）。
// 三层嵌套立方体 Q_{r_j} ⊂ Q_{r_{j+1}} ⊂ Q_{r_{j+2}}（蓝/橙/青），
// 两两之间形成环状区域；每条虚线折线是各尺度上单独选取的自由轨迹
// mathfrak{B}，橙色与青色箭头表示逐层的计数估计传播方向。
// 坐标沿用原 TikZ 源码的单位（1 单位 = 1.8 cm），y 轴向上。
#import "@preview/cetz:0.4.2": canvas, draw

#let blue = rgb("356EAC")
#let orange = rgb("C98432")
#let teal = rgb("318778")
#let orange-dark = rgb(171, 112, 43)
#let teal-dark = rgb(42, 115, 102)
// TikZ `color!10` 等价的浅色不透明填充（10%/13% 混白）
#let teal-fill = rgb(234, 243, 242)
#let orange-fill = rgb(248, 239, 228)
#let blue-fill = rgb(230, 238, 246)

#let box-stroke(c) = (paint: c, thickness: 0.95pt)
#let trace-stroke(c) = (paint: c, thickness: 0.75pt, dash: (3pt, 2.5pt))
#let arrow-stroke(c) = (paint: c, thickness: 1.3pt, cap: "round", join: "round")
#let arrow-mark(c) = (symbol: "stealth", length: 16pt, width: 10pt, fill: c)

#canvas(length: 1.8cm, {
  // 嵌套立方体：逐层覆盖形成两个环状区域
  draw.rect((-3.4, -3.4), (3.4, 3.4),
    fill: teal-fill, stroke: box-stroke(teal))
  draw.rect((-2.25, -2.25), (2.25, 2.25),
    fill: orange-fill, stroke: box-stroke(orange))
  draw.rect((-1.15, -1.15), (1.15, 1.15),
    fill: blue-fill, stroke: box-stroke(blue))

  // 中层环上的自由轨迹（示意性不规则开折线）
  draw.line((-1.77, 1.91), (-1.77, 1.02), (-1.64, 1.02), (-1.64, 0.35),
    (-1.80, 0.35), (-1.80, -0.60), (-1.67, -0.60), (-1.67, -1.72),
    (-0.65, -1.72), (-0.65, -1.85), (0.27, -1.85), (0.27, -1.69),
    (1.76, -1.69), (1.76, -0.52), (1.62, -0.52), (1.62, 0.36),
    (1.80, 0.36), (1.80, 1.20), (1.67, 1.20), (1.67, 1.91),
    stroke: trace-stroke(orange-dark))
  draw.content((-1.77, 1.40),
    [#text(size: 8pt, fill: orange-dark)[$"𝔅"^"(j)"_(iota_j)$]],
    anchor: "center", fill: orange-fill, padding: 1.2pt)

  // 外层环上的自由轨迹
  draw.line((-2.90, 3.05), (-2.90, 1.94), (-2.74, 1.94), (-2.74, 0.75),
    (-2.92, 0.75), (-2.92, -0.48), (-2.78, -0.48), (-2.78, -1.62),
    (-2.94, -1.62), (-2.94, -2.86), (-1.56, -2.86), (-1.56, -2.72),
    (-0.32, -2.72), (-0.32, -2.94), (1.03, -2.94), (1.03, -2.80),
    (2.87, -2.80), (2.87, -1.33), (2.72, -1.33), (2.72, -0.14),
    (2.93, -0.14), (2.93, 1.18), (2.77, 1.18), (2.77, 2.15),
    (2.92, 2.15), (2.92, 3.05),
    stroke: trace-stroke(teal-dark))
  draw.content((-2.83, 1.40),
    [#text(size: 8pt, fill: teal-dark)[$"𝔅"^"(j+1)"_(iota_(j+1))$]],
    anchor: "center", fill: teal-fill, padding: 1.2pt)

  // 箭头：逐层计数估计的传播方向（非格点路径）
  draw.bezier((-0.55, -0.48), (-1.47, -1.50), (-0.78, -0.95), (-1.10, -1.35),
    stroke: arrow-stroke(orange), mark: (end: arrow-mark(orange)))
  draw.bezier((-1.92, -1.98), (-2.62, -2.57), (-2.10, -2.25), (-2.40, -2.50),
    stroke: arrow-stroke(teal), mark: (end: arrow-mark(teal)))

  // 立方体标签，避开虚线轨迹
  draw.content((0, 0),
    [#text(size: 10pt, fill: blue)[$Q_(r_j)$]], anchor: "center")
  draw.content((1.45, -2.00),
    [#text(size: 10pt, fill: orange)[$Q_(r_(j+1))$]],
    anchor: "center", fill: white, padding: 2pt)
  draw.content((2.05, -3.10),
    [#text(size: 10pt, fill: teal)[$Q_(r_(j+2))$]],
    anchor: "center", fill: white, padding: 2pt)
})
