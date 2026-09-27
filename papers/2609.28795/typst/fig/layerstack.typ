// 图 1(a) 重绘：InAs 量子阱异质结构的层堆叠示意（原图 Figure1.png 面板 (a) 为位图，以 CeTZ 重绘）
// 自底向上：半绝缘 InP 衬底 / 晶格匹配 InAlAs / 应变超晶格 / 凸型渐变缓冲层 / 下垒 / InAs 阱 / 上垒 / 顶栅介质。
// 层厚为示意比例，未按真实尺度绘制（与原文一致）。
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.7pt)
#let x0 = 0
#let x1 = 11
#let peach = rgb(245, 173, 134)
#let yellow = rgb(235, 235, 0)
#let aqua = rgb(188, 245, 238)
#let lav = rgb(227, 220, 237)
// 渐变缓冲层的 6 段配色：Al 组分由 48 % 递减到 12.5 %，颜色由深到浅
#let gblcols = (rgb(160, 183, 204), rgb(171, 190, 208), rgb(182, 196, 210),
  rgb(193, 203, 214), rgb(205, 213, 222), rgb(217, 223, 230))

// 一层：矩形 + 居中文字。CeTZ 的图元函数返回内容，必须作为语句留在代码块里被收集，
// 不能 `let _ =` 丢弃，也不能在末尾再返回数值（会把内容和数字拼在一起报错）。
#let layer(ya, yb, col, lbl) = {
  draw.rect((x0, ya), (x1, yb), fill: col, stroke: edge)
  draw.content(((x0 + x1) / 2, (ya + yb) / 2), [#text(size: 7.5pt)[#lbl]], anchor: "center")
}

#let gbl(ya, yb) = {
  let n = gblcols.len()
  for i in range(n) {
    draw.rect((x0, ya + (yb - ya) * i / n), (x1, ya + (yb - ya) * (i + 1) / n),
      fill: gblcols.at(i), stroke: none)
  }
  draw.rect((x0, ya), (x1, yb), fill: none, stroke: edge)
  draw.content(((x0 + x1) / 2, ya + (yb - ya) * 0.68),
    [#text(size: 7.5pt, weight: "bold")[凸型渐变缓冲层]], anchor: "center")
  draw.content(((x0 + x1) / 2, ya + (yb - ya) * 0.34),
    [#text(size: 7.5pt)[In#sub[0.875]Al#sub[0.125]As，1250 nm]], anchor: "center")
}

#canvas(length: 0.42cm, {
  layer(0.0, 3.2, lav, [InP (001) 半绝缘衬底])
  layer(3.2, 4.7, aqua, [In#sub[0.52]Al#sub[0.48]As，100 nm])
  layer(4.7, 6.8, aqua, [In#sub[0.58]Ga#sub[0.42]As / In#sub[0.47]Al#sub[0.53]As\ 应变超晶格，25 nm])
  gbl(6.8, 12.0)
  layer(12.0, 14.4, peach, [In#sub[0.875]Al#sub[0.125]As 下垒，25 nm])
  layer(14.4, 16.3, yellow, [InAs 量子阱，厚度 $d$])
  layer(16.3, 19.9, peach, [In#sub[0.875]Al#sub[0.125]As 上垒，120 nm])
  // 顶栅介质要走完器件工艺才有，用虚线框与外延层区分
  draw.rect((x0, 19.9), (x1, 22.0), fill: rgb(240, 240, 240),
    stroke: (paint: gray.darken(45%), thickness: 0.7pt, dash: "dashed"))
  draw.content(((x0 + x1) / 2, 20.4),
    [#text(size: 7.5pt)[HfO#sub[2] 顶栅介质，11 nm]], anchor: "center")
  draw.content(((x0 + x1) / 2, 21.4),
    [#text(size: 7.5pt)[（器件工艺，非外延层）]], anchor: "center")
  draw.line((x1 + 0.8, 0.2), (x1 + 0.8, 21.8),
    stroke: (paint: black, thickness: 0.8pt), mark: (end: ">"))
  draw.content((x1 + 1.15, 11.0), [#rotate(-90deg)[#text(size: 7pt)[生长方向]]], anchor: "center")
})
