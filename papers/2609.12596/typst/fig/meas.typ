// 附录 B 测量线路图重绘（CeTZ 0.4.2）
#import "@preview/cetz:0.4.2": canvas, draw

#let B = (paint: black, thickness: 1pt)
#let D = (paint: black, thickness: 0.8pt, dash: "dashed")

#let box(x0, y0, x1, y1, body, fs: 6.5pt, fill: white) = {
  draw.rect((x0, y0), (x1, y1), fill: fill, stroke: B)
  draw.content(((x0 + x1) / 2, (y0 + y1) / 2),
    [#align(center)[#text(size: fs)[#body]]], anchor: "center")
}

// 竖直双绞线
#let pair(cx, y0, y1, amp: 0.14, k: 5.0) = {
  let n = 24
  let p1 = range(n + 1).map(i => {
    let t = y0 + (y1 - y0) * i / n
    (cx + amp * calc.sin(k * t), t)
  })
  let p2 = range(n + 1).map(i => {
    let t = y0 + (y1 - y0) * i / n
    (cx - amp * calc.sin(k * t), t)
  })
  draw.line(..p1, stroke: (paint: black, thickness: 0.6pt))
  draw.line(..p2, stroke: (paint: black, thickness: 0.6pt))
}

#canvas(length: 0.44cm, {
  // ---- 仪器 ----
  box(0.0, 9.2, 3.4, 10.5, [锁相放大器 1])
  box(3.9, 9.2, 7.3, 10.5, [锁相放大器 2])
  box(7.8, 9.2, 11.2, 10.5, [I/V 源])
  box(0.0, 7.3, 3.4, 8.4, [电流前置放大器])
  draw.line((1.7, 8.4), (1.7, 9.2), stroke: B, mark-end: ">")

  // ---- 触发线 ----
  draw.line((9.5, 10.5), (9.5, 11.4), stroke: D)
  draw.line((9.5, 11.4), (1.7, 11.4), stroke: D)
  draw.line((1.7, 11.4), (1.7, 10.5), stroke: D, mark-end: ">")
  draw.line((5.6, 11.4), (5.6, 10.5), stroke: D, mark-end: ">")
  draw.content((11.5, 11.4), [#text(size: 6.5pt)[触发]], anchor: "west")

  // ---- BNC 转接盒与三条信号线 ----
  box(-0.8, 5.4, 11.8, 6.4, [BNC 转接盒], fs: 7.5pt)
  draw.line((1.7, 7.3), (1.7, 6.4), stroke: B)
  draw.line((5.3, 9.2), (5.3, 6.4), stroke: B)
  draw.line((5.9, 9.2), (5.9, 6.4), stroke: B)
  draw.line((9.5, 9.2), (9.5, 6.4), stroke: B)
  draw.content((2.1, 6.85), [#text(size: 6pt)[电流输出]], anchor: "west")
  draw.content((6.3, 6.85), [#text(size: 6pt)[差分电压输出]], anchor: "west")
  draw.content((9.9, 6.85), [#text(size: 6pt)[偏置输入]], anchor: "west")

  // ---- 温级横杆与穿过的线束 ----
  for (yy, nm) in ((4.5, "300 K"), (3.05, "1 K"), (1.5, "600 mK")) {
    draw.rect((-1.6, yy - 0.16), (12.6, yy + 0.16), fill: gray.lighten(45%), stroke: B)
    draw.content((-1.85, yy), [#text(size: 6.5pt)[#nm]], anchor: "east")
  }
  for cx in (4.4, 5.3, 6.2, 7.1) { pair(cx, 0.9, 5.4) }
  draw.content((7.7, 5.0), [#text(size: 6pt)[屏蔽双绞多芯线束]], anchor: "west")
  box(3.1, 2.5, 8.4, 3.6, [低温 π 型低通滤波器], fs: 6.5pt)

  // ---- 探针卡、晶圆、卡盘与位移台 ----
  box(1.5, 0.2, 10.5, 0.8, [探针卡], fs: 7pt)
  for x in (5.0, 6.5) {
    draw.line((x - 0.35, 0.2), (x, -0.32), stroke: B)
    draw.line((x + 0.35, 0.2), (x, -0.32), stroke: B)
  }
  draw.rect((2.8, -0.6), (8.8, -0.32), fill: none, stroke: B)
  draw.content((9.1, -0.46), [#text(size: 6.5pt)[被测晶圆]], anchor: "west")
  box(1.2, -1.55, 7.0, -0.6, [晶圆卡盘], fs: 7pt, fill: gray.lighten(35%))
  box(2.4, -2.7, 5.8, -1.55, [$x$, $y$, $z$, $theta$ 台], fs: 7pt, fill: gray.lighten(35%))
})
