// 图 S8 重绘：CPW 谐振器制备流程（原图 Process_Flow7x6.pdf，以 CeTZ 重绘）
// 三列：左＝对照（不刻蚀）、中＝Ar+ 刻蚀（两列共 used 步骤 1）、右＝硫钝化（整列加框，表面处理已在框内完成）。
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.7pt)
#let thin = (paint: black, thickness: 0.45pt)
#let inp = luma(233)
#let prcol = orange.darken(18%)
#let nbcol = blue.darken(28%)
#let oxcol = blue.darken(22%)
#let scol = yellow.darken(6%)
#let t7 = 7pt
#let t75 = 7.5pt

// 一个工艺状态的小截面堆叠，中心 (cx, cy)，InP 上表面在 cy
#let stack(cx, cy, oxide: false, s: false, milled: false, pr: false, nb: false, nbpat: false) = {
  draw.rect((cx - 2.7, cy - 0.95), (cx + 2.7, cy), fill: inp, stroke: edge)
  draw.content((cx, cy - 0.5), [#text(size: 8pt)[InP]], anchor: "center")
  // 表面层：自然氧化物 / 硫层；milled 时两侧氧化物被去掉
  if oxide {
    draw.rect((cx - 2.7, cy), (cx + 2.7, cy + 0.13), fill: oxcol, stroke: thin)
  }
  if s {
    draw.rect((cx - 2.7, cy), (cx + 2.7, cy + 0.13), fill: scol, stroke: thin)
  }
  if milled {
    draw.rect((cx - 2.7, cy), (cx + 2.7, cy + 0.13), fill: oxcol, stroke: none)
    draw.rect((cx - 2.7, cy), (cx - 1.15, cy + 0.13), fill: prcol.lighten(30%), stroke: none)
    draw.rect((cx + 1.15, cy), (cx + 2.7, cy + 0.13), fill: prcol.lighten(30%), stroke: none)
  }
  let base = cy + 0.13
  if nb {
    draw.rect((cx - 2.7, base), (cx + 2.7, base + 0.27), fill: nbcol, stroke: edge)
    draw.rect((cx - 2.7, base + 0.27), (cx + 2.7, base + 0.38), fill: oxcol.lighten(35%), stroke: none)
  }
  if nbpat {
    draw.rect((cx - 2.7, base), (cx - 1.35, base + 0.27), fill: nbcol, stroke: edge)
    draw.rect((cx + 1.35, base), (cx + 2.7, base + 0.27), fill: nbcol, stroke: edge)
  }
  if pr {
    let pb = if nb { base + 0.27 } else { base }
    draw.rect((cx - 1.15, pb), (cx + 1.15, pb + 0.8), fill: prcol, stroke: edge)
    draw.content((cx, pb + 0.4), [#text(size: t75, fill: white)[PR]], anchor: "center")
  }
}

// 大号流程箭头
#let bigarrow(cx, y0, y1) = {
  draw.line((cx, y0), (cx, y1),
    stroke: (paint: luma(175), thickness: 2.6pt),
    mark: (end: "straight", fill: luma(175)))
}

#canvas(length: 0.5cm, {
  // 列中心：左 8，中 15.5，右 24
  let c1 = 8
  let c2 = 15.5
  let c3 = 24

  // ---- 行 1：溶剂清洗 ----
  draw.content((11.75, 15.6), [#text(size: t75, weight: "bold")[1 溶剂清洗]], anchor: "south")
  stack(c2, 14.6, oxide: true)
  draw.content((c2, 13.35), [#text(size: t7)[外延级备用衬底]], anchor: "north")
  // 硫钝化列的行 1：硫层已在
  stack(c3, 14.6, s: true)

  // ---- 行 2：光刻 ----
  draw.content((0.3, 11.3), [#text(size: t75, weight: "bold")[2 光刻]], anchor: "west")
  draw.content((0.3, 10.7), [#text(size: t7)[负胶剥离图形]], anchor: "west")
  stack(c1, 10.6, oxide: true, pr: true)
  stack(c2, 10.6, oxide: true, pr: true)
  stack(c3, 10.6, s: true, pr: true)
  draw.content((c1, 9.35), [#text(size: t7)[单层胶 AZ5214]], anchor: "north")
  draw.content((c2, 9.35), [#text(size: t7)[单层胶 AZ5214]], anchor: "north")
  draw.content((c3, 9.35), [#text(size: t7)[单层胶 AZ5214]], anchor: "north")

  // ---- 行 3：表面处理 ----
  draw.content((0.3, 7.3), [#text(size: t75, weight: "bold")[3 表面处理]], anchor: "west")
  bigarrow(c1, 9.0, 7.9)
  bigarrow(c2, 9.0, 7.9)
  draw.content((c1, 7.15), [#text(size: t7, weight: "bold")[无刻蚀]], anchor: "south")
  draw.content((c2, 7.15), [#text(size: t7, weight: "bold")[Ar#super[+] 刻蚀]], anchor: "south")
  // 刻蚀的紫色离子束
  for dx in (-2.1, -1.3, 1.3, 2.1) {
    draw.line((c2 + dx - 0.45, 9.2), (c2 + dx, 8.05),
      stroke: (paint: purple.darken(15%), thickness: 1.1pt), mark: (end: ">", fill: purple.darken(15%)))
  }
  stack(c1, 5.9, oxide: true, pr: true)
  stack(c2, 5.9, milled: true, pr: true)

  // ---- 行 4：铌溅射 ----
  draw.content((0.3, 3.6), [#text(size: t75, weight: "bold")[4 铌溅射]], anchor: "west")
  draw.content((0.3, 3.0), [#text(size: t7)[室温]], anchor: "west")
  bigarrow(c1, 4.6, 3.6)
  bigarrow(c2, 4.6, 3.6)
  bigarrow(c3, 9.0, 3.6)
  stack(c1, 2.2, oxide: true, nb: true, pr: true)
  stack(c2, 2.2, milled: true, nb: true, pr: true)
  stack(c3, 2.2, s: true, nb: true, pr: true)

  // ---- 行 5：剥离 ----
  draw.content((0.3, -0.9), [#text(size: t75, weight: "bold")[5 剥离]], anchor: "west")
  bigarrow(c1, 0.9, -0.2)
  bigarrow(c2, 0.9, -0.2)
  bigarrow(c3, 0.9, -0.2)
  stack(c1, -1.9, oxide: true, nbpat: true)
  stack(c2, -1.9, milled: true, nbpat: true)
  stack(c3, -1.9, s: true, nbpat: true)

  // ---- 右列外框：硫钝化 ----
  draw.rect((20.4, -3.7), (27.6, 16.1), stroke: (paint: gray.darken(40%), thickness: 1.1pt), fill: none)
  draw.content((24, 15.85), [#text(size: t75, weight: "bold")[2 硫钝化]], anchor: "south")
})
