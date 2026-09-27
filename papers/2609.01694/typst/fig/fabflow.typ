// 图 3 重绘：制备流程框图 (a) 与蒸发/溅射覆盖机理示意 (b)（原 fabrication_combined.pdf 中 (a)(c) 两幅示意图，以 CeTZ 重绘；(b)(d) 照片另用裁剪图）
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.7pt)
#let thin = (paint: black, thickness: 0.45pt)
#let sub = blue.lighten(80%)
#let gold = orange.darken(15%)
#let boxfill = yellow.lighten(70%)
#let t7 = 7pt
#let t75 = 7.5pt

// 流程框：圆角矩形 + 文字
#let fbox(cx, cy, w, h, txt, fs: t75, dashed: false) = {
  draw.rect((cx - w / 2, cy - h / 2), (cx + w / 2, cy + h / 2), fill: boxfill,
    stroke: (paint: black, thickness: 0.7pt, dash: if dashed { "dashed" }),
    radius: 0.15)
  draw.content((cx, cy), [#text(size: fs)[#txt]], anchor: "center")
}

// 定向沉积箭头（带金原子圆点）
#let dep_arrow(x, y0, y1, col) = {
  draw.circle((x, y0), radius: 0.22, fill: col, stroke: none)
  draw.line((x, y0 - 0.25), (x, y1), mark: (end: ">", stroke: (paint: col.darken(10%), thickness: 0.7pt)), stroke: (paint: col.darken(10%), thickness: 0.7pt))
}

#canvas(length: 0.5cm, {
  // ================= (a) 工艺流程 =================
  draw.content((0.2, 12.6), [#text(size: t75, weight: "bold")[(a)]], anchor: "north-west")
  fbox(4.4, 11.4, 5.2, 1.5, [SLE])
  fbox(12.2, 11.4, 7.4, 1.5, [溅射或蒸发])
  fbox(20.6, 11.4, 5.2, 1.5, [电镀])
  fbox(28.6, 11.4, 7.6, 1.5, [装架与引线键合], fs: t7)
  draw.line((7.0, 11.4), (8.5, 11.4), mark: (end: ">", stroke: (paint: black, thickness: 0.8pt)), stroke: (paint: black, thickness: 0.8pt))
  draw.line((15.9, 11.4), (18.0, 11.4), mark: (end: ">", stroke: (paint: black, thickness: 0.8pt)), stroke: (paint: black, thickness: 0.8pt))
  draw.line((23.2, 11.4), (24.8, 11.4), mark: (end: ">", stroke: (paint: black, thickness: 0.8pt)), stroke: (paint: black, thickness: 0.8pt))
  // 替代序列（虚线）：溅射或蒸发 → 装架与引线键合 → 电镀
  draw.line((12.2, 10.65), (12.2, 9.2), (19.6, 9.2), stroke: (paint: gray.darken(20%), thickness: 0.7pt, dash: "dashed"))
  draw.line((19.6, 9.2), (19.6, 9.2), mark: (end: ">", stroke: (paint: gray.darken(20%), thickness: 0.7pt)), stroke: (paint: gray.darken(20%), thickness: 0.7pt))
  fbox(23.4, 9.2, 7.6, 1.5, [装架与引线键合], fs: t7, dashed: true)
  fbox(31.4, 9.2, 4.6, 1.5, [电镀], dashed: true)
  draw.line((27.2, 9.2), (29.1, 9.2), mark: (end: ">", stroke: (paint: gray.darken(20%), thickness: 0.7pt, dash: "dashed")), stroke: (paint: gray.darken(20%), thickness: 0.7pt, dash: "dashed"))
  draw.content((15.9, 9.2), [#text(size: t7, fill: gray.darken(25%))[替代序列]], anchor: "center")

  // ================= (b) 覆盖机理：蒸发 vs 溅射 =================
  draw.content((0.2, 7.0), [#text(size: t75, weight: "bold")[(b)]], anchor: "north-west")

  // ---- 左：蒸发（定向）----
  let ox = 1.0
  draw.rect((ox, 0), (ox + 13, 4.2), fill: sub, stroke: edge)
  draw.rect((ox + 4.4, 2.0), (ox + 6.0, 4.2), fill: white, stroke: edge)
  draw.rect((ox + 8.0, 2.0), (ox + 9.6, 4.2), fill: white, stroke: edge)
  // 金层（定向蒸发：面向束流的一侧镀上，右侧壁被自遮挡）
  draw.line((ox, 4.2), (ox + 4.4, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox + 6.0, 4.2), (ox + 8.0, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox + 9.6, 4.2), (ox + 13, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox + 4.5, 3.4), (ox + 4.5, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox + 6.0, 2.6), (ox + 6.0, 3.4), stroke: (paint: gold, thickness: 2.2pt))
  draw.content((ox + 6.8, 1.5), [#text(size: 6.5pt, fill: gray.darken(25%))[中央岛接地]], anchor: "center")
  // 定向入射箭头
  for i in range(4) {
    dep_arrow(ox + 2.0 + i * 2.6, 7.4, 5.0, gold)
  }
  draw.content((ox + 6.5, 8.1), [#text(size: t75, weight: "bold")[蒸发（定向）]], anchor: "south")

  // ---- 右：溅射（近似各向同性）----
  let ox2 = 17.5
  draw.rect((ox2, 0), (ox2 + 13, 4.2), fill: sub, stroke: edge)
  draw.rect((ox2 + 4.4, 2.0), (ox2 + 6.0, 4.2), fill: white, stroke: edge)
  draw.rect((ox2 + 8.0, 2.0), (ox2 + 9.6, 4.2), fill: white, stroke: edge)
  // 金层（溅射：全表面覆盖）
  draw.line((ox2, 4.2), (ox2 + 4.4, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox2 + 6.0, 4.2), (ox2 + 8.0, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox2 + 9.6, 4.2), (ox2 + 13, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox2 + 4.4, 3.4), (ox2 + 4.4, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox2 + 9.6, 3.4), (ox2 + 9.6, 4.2), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox2 + 6.0, 2.6), (ox2 + 6.0, 3.4), stroke: (paint: gold, thickness: 2.2pt))
  draw.line((ox2 + 8.0, 2.6), (ox2 + 8.0, 3.4), stroke: (paint: gold, thickness: 2.2pt))
  draw.content((ox2 + 6.8, 1.5), [#text(size: 6.5pt, fill: gray.darken(25%))[中央岛接地]], anchor: "center")
  // 各向同性箭头：方向各异
  let dirs = ((19.9, 7.4, 5.4, 0.9), (21.6, 7.6, 5.7, -0.6), (23.4, 7.2, 5.0, 1.3), (25.4, 7.7, 5.9, -1.1), (27.2, 7.3, 5.2, 0.8), (28.9, 7.5, 5.5, -0.9))
  for d in dirs {
    let (ax, ay0, ay1, dx) = d
    draw.line((ax, ay0), (ax + dx, ay1), mark: (end: ">", stroke: (paint: gold.darken(15%), thickness: 0.7pt)), stroke: (paint: gold.darken(15%), thickness: 0.7pt))
    draw.circle((ax, ay0), radius: 0.22, fill: gold, stroke: none)
  }
  draw.content((ox2 + 6.5, 8.1), [#text(size: t75, weight: "bold")[溅射（近似各向同性）]], anchor: "south")
})
