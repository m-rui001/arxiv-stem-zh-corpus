// 图 S9 重绘：Bluefors SD 稀释制冷机谐振器射频测量线路（原图 bluey_wiring_NO-TWPA.pdf，以 CeTZ 重绘）
// 左线 RF1＝输出链（放大），右线 RF2＝输入链（衰减），底部 QCage 样品腔；横虚线为各级温区。
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.7pt)
#let wire = (paint: black, thickness: 0.8pt)
#let coax = (paint: black, thickness: 0.9pt, dash: "dashed")
#let stage = (paint: gray.darken(30%), thickness: 0.5pt, dash: "dashed")
#let attcol = blue.lighten(40%)
#let ecccol = aqua.lighten(35%)
#let klcol = green.lighten(30%)
#let t65 = 6.5pt
#let t7 = 7pt

// 温区虚线与标签
#let stline(y, label) = {
  draw.line((3.2, y), (23.2, y), stroke: stage)
  draw.content((23.45, y), [#text(size: t7, weight: "bold")[#label]], anchor: "west")
}

// 白底元件盒（两行文字用 \ 换行）
#let cbox(cx, cy, w, h, txt, fs: t65) = {
  draw.rect((cx - w / 2, cy - h / 2), (cx + w / 2, cy + h / 2), fill: white, stroke: edge)
  draw.content((cx, cy), [#text(size: fs)[#txt]], anchor: "center")
}

// 彩色小方块（衰减器 / 滤波器）
#let sq(cx, cy, col, s: 0.85) = {
  draw.rect((cx - s / 2, cy - s / 2), (cx + s / 2, cy + s / 2), fill: col, stroke: edge)
}

// HEMT 放大器三角
#let tri(cx, cy, txt, side: "west") = {
  draw.line((cx - 0.55, cy - 0.6), (cx + 0.75, cy), (cx - 0.55, cy + 0.6), close: true,
    fill: red.lighten(20%), stroke: edge)
  let lx = if side == "west" { cx + 1.0 } else { cx - 1.0 }
  draw.content((lx, cy), [#text(size: t65)[#txt]], anchor: side)
}

// 隔直器：小方块加斜杠
#let dcblock(cx, cy) = {
  draw.rect((cx - 0.42, cy - 0.42), (cx + 0.42, cy + 0.42), fill: white, stroke: edge)
  draw.line((cx - 0.3, cy - 0.3), (cx + 0.3, cy + 0.3), stroke: (paint: black, thickness: 0.6pt))
}

// 隔离器：圆圈内箭头
#let isolator(cx, cy, txt, side: "west") = {
  draw.circle((cx, cy), radius: 0.62, fill: white, stroke: edge)
  draw.line((cx - 0.34, cy), (cx + 0.2, cy), mark: (end: ">", stroke: (paint: black, thickness: 0.7pt)), stroke: (paint: black, thickness: 0.7pt))
  let lx = if side == "west" { cx + 0.85 } else { cx - 0.85 }
  draw.content((lx, cy), [#text(size: t65)[#txt]], anchor: side)
}

#canvas(length: 0.45cm, {
  let x1 = 5.5 // RF1 输出链
  let x2 = 15.5 // RF2 输入链

  // ---- 温区线 ----
  stline(11.0, [300 K])
  stline(8.6, [50 K])
  stline(6.6, [4 K])
  stline(5.1, [Still])
  stline(3.7, [Mxc])

  // ---- QCage 样品腔 ----
  draw.rect((11.0, 0.2), (22.0, 2.2), fill: luma(240), stroke: (paint: black, thickness: 1.3pt))
  draw.content((16.5, 1.55), [#text(size: 9pt, weight: "bold")[QCage 样品腔]], anchor: "center")
  draw.content((16.5, 0.75), [#text(size: 6pt)[Qdevil Qcage.24（18 GHz 内无谐振）]], anchor: "center")

  // ---- RF2：输入链（自上而下衰减） ----
  draw.content((x2, 15.9), [#text(size: t7, weight: "bold")[Input（RF2）]], anchor: "south")
  draw.line((x2, 15.8), (x2, 2.2), stroke: wire)
  cbox(x2, 14.7, 7.6, 1.15, [程控衰减器 \ Vaunix LDA-133（0–50 dB）])
  dcblock(x2, 11.8)
  draw.content((x2 - 0.65, 11.8), [#text(size: t65)[隔直]], anchor: "east")
  sq(x2, 9.9, attcol)
  sq(x2, 7.6, attcol)
  sq(x2, 6.0, attcol)
  sq(x2, 4.6, attcol)
  draw.content((x2 + 0.65, 9.9), [#text(size: t65, fill: gray.darken(25%))[固定衰减器]], anchor: "west")
  sq(x2, 3.0, ecccol)
  sq(x2, 2.55, klcol)
  draw.content((x2 + 0.65, 2.9), [#text(size: t65, fill: gray.darken(25%))[进腔滤波]], anchor: "west")

  // ---- RF1：输出链（自下而上放大） ----
  draw.line((11.0, 1.3), (x1, 1.3), stroke: wire)
  sq(10.45, 1.3, ecccol)
  cbox(7.9, 1.3, 4.0, 1.0, [带通 \ 3.4–13 GHz])
  draw.content((7.9, 0.55), [#text(size: t65)[Mini-Circuits]], anchor: "north")
  draw.line((x1, 1.3), (x1, 15.8), stroke: wire)
  draw.content((x1, 15.9), [#text(size: t7, weight: "bold")[Output（RF1）]], anchor: "south")
  isolator(x1, 3.7, [隔离器 Quinstar])
  // Mxc–50 K 之间为超导同轴
  draw.line((x1, 4.5), (x1, 8.6), stroke: coax)
  tri(x1, 6.6, [LNF HEMT +44 dB], side: "east")
  draw.line((x1, 8.6), (x1, 11.0), stroke: wire)
  dcblock(x1, 11.7)
  draw.content((x1 - 0.65, 11.7), [#text(size: t65)[隔直]], anchor: "east")
  cbox(x1, 12.45, 5.0, 0.7, [VXHF-392+])
  tri(x1, 13.35, [LNA-30 +30 dB], side: "east")
  cbox(x1, 14.25, 5.0, 0.7, [VXHF-392+])
  tri(x1, 15.1, [LNA-40 +40 dB], side: "east")

  // ---- 图例 ----
  draw.rect((25.6, 2.2), (34.6, 14.2), fill: white, stroke: edge)
  draw.content((30.1, 13.8), [#text(size: t7, weight: "bold")[图例]], anchor: "center")
  let ly = 13.0
  tri(26.7, ly, [HEMT 放大器])
  sq(26.7, ly - 1.5, attcol)
  draw.content((27.6, ly - 1.5), [#text(size: t65)[固定衰减器]], anchor: "west")
  sq(26.7, ly - 2.7, ecccol)
  draw.content((27.6, ly - 2.7), [#text(size: t65)[Eccosorb 低通
    （截止 10 GHz）]], anchor: "west")
  sq(26.7, ly - 4.3, klcol)
  draw.content((27.6, ly - 4.3), [#text(size: t65)[K&L 带通
    （截止 12 GHz）]], anchor: "west")
  dcblock(26.7, ly - 5.9)
  draw.content((27.6, ly - 5.9), [#text(size: t65)[直流隔直器（INMET）]], anchor: "west")
  draw.line((26.0, ly - 7.1), (27.4, ly - 7.1), stroke: coax)
  draw.content((27.6, ly - 7.1), [#text(size: t65)[SNJ86 0.86 mm
    超导同轴（SCuNi-CuNi）]], anchor: "west")
  isolator(26.7, ly - 8.7, [隔离器])
})
