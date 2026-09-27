// 图 1 重画：二维实输入体 K（旋转椭圆，浅灰填充）与同一扇（fan）中的三个汇
// Y_{f,k_1}（红）、Y_{f,k_2}（绿）、Y_{f,k_3}（蓝）——彩色直线即非零实线性汇的核；
// 体内的黑点是输入 v。几何取自原 TikZ 源码（椭圆 rx=2.9 ry=1.05 旋转 28°）。
#import "@preview/cetz:0.4.2": canvas, draw

#let c-red = rgb("#a60000")
#let c-green = rgb("#007300")
#let c-blue = rgb("#0000a6")
#let thin = (thickness: 0.9pt, cap: "round", join: "round")

// 旋转椭圆的采样点（局部椭圆 -> 逆时针转 28°）
#let body-pts = {
  let rx = 2.9
  let ry = 1.05
  let th = 28deg
  let c = calc.cos(th)
  let s = calc.sin(th)
  range(36).map(i => {
    let a = 360deg / 36 * i
    let lx = rx * calc.cos(a)
    let ly = ry * calc.sin(a)
    (lx * c - ly * s, lx * s + ly * c)
  })
}

#canvas(length: 1.2cm, {
  // 输入体 K 的浅灰填充
  draw.catmull(..body-pts, close: true, fill: rgb("#f5f5f5"), stroke: none)

  // 三个汇的核（彩色直线）
  draw.line((-3.7, 1.65), (3.7, -1.65), stroke: (paint: c-red, ..thin))
  draw.line((4.1, 1.5), (-4.1, -1.5), stroke: (paint: c-green, ..thin))
  draw.line((0, -2.8), (0, 2.8), stroke: (paint: c-blue, ..thin))

  // 输入体 K 的边界（压在彩色线之上）
  draw.catmull(..body-pts, close: true, fill: none,
    stroke: (paint: black, thickness: 0.95pt))

  // 体内的输入 v
  draw.circle((1.4, 1.02), radius: 0.055, fill: black, stroke: none)
  draw.content((1.52, 1.12), [#text(size: 9pt, [$v$])], anchor: "south-west")
  draw.content((3.0, 0.45), [#text(size: 9pt, [$K$])], anchor: "center")

  // 三个汇的标注（与线端留出空隙，避免压线）
  draw.content((3.95, -1.85), [#text(size: 9pt, fill: c-red, [$Y_{f,k_1}$])],
    anchor: "west")
  draw.content((-4.32, -1.55), [#text(size: 9pt, fill: c-green, [$Y_{f,k_2}$])],
    anchor: "east")
  draw.content((0, 2.98), [#text(size: 9pt, fill: c-blue, [$Y_{f,k_3}$])],
    anchor: "south")
})
