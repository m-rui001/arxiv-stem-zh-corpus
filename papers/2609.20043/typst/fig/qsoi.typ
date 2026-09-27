// 图 1 重绘：QSOI 量子点阵列剖面示意（原图为位图 PNG）
// 依 D:\cetz-skill-release\SKILL.md 工作流，CeTZ 0.4.2
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.8pt)
#let thin = (paint: black, thickness: 0.5pt)
#let lead = (paint: black, thickness: 0.4pt)
#let metal = gray.darken(45%)
#let via = purple.darken(10%)
#let diel = blue.lighten(82%)
#let box = blue.lighten(72%)
#let bulk = luma(248)

// 在 (x0,y0)-(x1,y1) 内画斜线填充，表示重掺杂区
#let hatch(x0, y0, x1, y1) = {
  let s = 0.42
  let n = int((x1 - x0 + (y1 - y0)) / s) + 1
  for i in range(n) {
    let a = x0 + i * s
    let p0 = (a, y0)
    let p1 = (a + (y1 - y0), y1)
    if a + (y1 - y0) > x1 {
      p1 = (x1, y0 + (x1 - a))
    }
    if a > x1 { break }
    draw.line(p0, p1, stroke: (paint: gray.darken(30%), thickness: 0.4pt))
  }
}

// 一只栅极：金属块 + 上方介质包层
#let gate(x0, x1, top, col) = {
  draw.rect((x0, 3.15), (x1, top), fill: col, stroke: edge)
}

#canvas(length: 0.52cm, {
  // ---- 介质背景（层间介质 + 栅间介质）----
  draw.rect((0.4, 3.15), (17.5, 5.55), fill: diel, stroke: edge)

  // ---- 衬底 / 埋氧层 / 硅沟道 ----
  draw.rect((0.0, 0.0), (17.9, 1.05), fill: bulk, stroke: edge)
  draw.rect((0.0, 1.05), (17.9, 2.15), fill: box, stroke: edge)
  draw.rect((0.6, 2.15), (8.4, 3.15), fill: white, stroke: edge)
  draw.rect((9.5, 2.15), (17.3, 3.15), fill: white, stroke: edge)

  // ---- 浅槽隔离：把两条纳米线分开 ----
  draw.rect((8.4, 0.0), (9.5, 5.55), fill: box, stroke: edge)
  draw.line((8.4, 3.15), (8.4, 5.55), stroke: (paint: via, thickness: 1.4pt))
  draw.line((9.5, 3.15), (9.5, 5.55), stroke: (paint: via, thickness: 1.4pt))

  // ---- 源区 / 漏区（重掺杂）----
  draw.rect((0.6, 2.15), (1.7, 3.15), fill: white, stroke: none)
  hatch(0.62, 2.17, 1.68, 3.13)
  draw.rect((0.6, 2.15), (1.7, 3.15), fill: none, stroke: thin)
  draw.rect((15.6, 2.15), (17.3, 3.15), fill: white, stroke: none)
  hatch(15.62, 2.17, 17.28, 3.13)
  draw.rect((15.6, 2.15), (17.3, 3.15), fill: none, stroke: thin)

  // ---- 左条：存取栅 + 三只柱塞栅，中间夹势垒通孔 ----
  gate(1.7, 2.9, 5.55, metal)
  gate(2.9, 3.4, 5.05, via)
  gate(3.4, 4.6, 5.55, metal)
  gate(4.6, 5.1, 5.05, via)
  gate(5.1, 6.3, 5.55, metal)
  gate(6.3, 6.8, 5.05, via)
  gate(6.8, 8.0, 5.55, metal)

  // ---- 右条：三只柱塞栅 + 存取栅 ----
  gate(9.9, 11.1, 5.55, metal)
  gate(11.1, 11.6, 5.05, via)
  gate(11.6, 12.8, 5.55, metal)
  gate(12.8, 13.3, 5.05, via)
  gate(13.3, 14.5, 5.55, metal)
  gate(14.5, 15.6, 5.55, metal)

  // ---- 接触孔：落在漏区上方 ----
  for cx in (1.15, 16.45) {
    draw.rect((cx - 0.16, 3.15), (cx + 0.16, 5.55), fill: white, stroke: thin)
  }

  // ---- 顶部标签 ----
  let topLab(x, y, txt) = {
    draw.line((x, 5.6), (x, y - 0.15), stroke: lead)
    draw.content((x, y), [#text(size: 7.5pt)[#txt]], anchor: "south")
  }
  topLab(2.3, 6.8, "存取栅 AG")
  topLab(6.55, 6.8, "势垒栅 B")
  topLab(15.05, 6.8, "存取栅 AG")
  topLab(4.0, 8.4, "柱塞栅 G")

  // ---- 右侧分层标签 ----
  draw.line((17.35, 2.65), (18.6, 2.65), stroke: lead)
  draw.content((18.75, 2.65), [#text(size: 7.5pt)[硅纳米线沟道]], anchor: "west")
  draw.line((17.9, 1.6), (18.6, 1.6), stroke: lead)
  draw.content((18.75, 1.6), [#text(size: 7.5pt)[埋氧层 BOX]], anchor: "west")
  draw.line((17.9, 0.5), (18.6, 0.5), stroke: lead)
  draw.content((18.75, 0.5), [#text(size: 7.5pt)[衬底，兼作背栅 BG]], anchor: "west")

  // ---- 底部标签 ----
  draw.content((1.15, 2.05), [#text(size: 7.5pt)[源区]], anchor: "north")
  draw.content((16.45, 2.05), [#text(size: 7.5pt)[漏区]], anchor: "north")
  draw.content((8.95, 6.0), [#text(size: 7.5pt)[浅槽隔离]], anchor: "south")

  // 省略号：阵列沿沟道方向继续延伸
  draw.content((8.95, 0.52), [#text(size: 9pt)[⋯]], anchor: "center")
})
