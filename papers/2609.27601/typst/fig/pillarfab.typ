// 图 1(a)-(d) 重绘：SiC 纳米柱集成色心的制备流程（原图 Figure1.jpg 为位图，(e)(f) 仿真数据另用裁剪原图）
// (a) PMMA 掩模 patterning + 离子注入；(b) 镍层蒸发与剥离前的堆叠；(c) 反应离子刻蚀；(d) 成品柱参数与两种收集几何。
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.7pt)
#let thin = (paint: black, thickness: 0.45pt)
#let epi = green.lighten(62%)
#let wafer = green.darken(18%)
#let pmma = red.lighten(38%)
#let nicol = luma(70)
#let ionc = yellow.darken(12%)
#let riec = teal
#let t7 = 7pt
#let t8 = 8pt

// 面板标签
#let plabel(x, y, txt) = {
  draw.content((x, y), [#text(size: t8, weight: "bold")[#txt]], anchor: "north-west")
}

// 离子束：圆 + 竖直箭头
#let ion(x, y0, y1, col) = {
  draw.circle((x, y0), radius: 0.28, fill: col, stroke: edge)
  draw.line((x, y0 - 0.3), (x, y1), mark: (end: ">", fill: col, stroke: (paint: col, thickness: 0.9pt)), stroke: (paint: col, thickness: 0.9pt))
}

// 双向尺寸箭头
#let dimarrow(a, b, col) = {
  draw.line(a, b, mark: (end: ">", start: ">", fill: col, stroke: (paint: col, thickness: 0.6pt)), stroke: (paint: col, thickness: 0.6pt))
}

// 空位：白色小圆
#let vacancy(x, y) = {
  draw.circle((x, y), radius: 0.26, fill: white, stroke: thin)
}

#canvas(length: 0.46cm, {
  // ================= (a) 离子注入 =================
  plabel(0, 10.9, [(a)])
  draw.rect((0.5, 1.0), (9.5, 2.2), fill: wafer, stroke: edge)
  draw.rect((0.5, 2.2), (9.5, 4.8), fill: epi, stroke: edge)
  // PMMA 三段，中间留两个孔
  draw.rect((0.5, 4.8), (2.6, 5.8), fill: pmma, stroke: edge)
  draw.rect((3.8, 4.8), (6.2, 5.8), fill: pmma, stroke: edge)
  draw.rect((7.4, 4.8), (9.5, 5.8), fill: pmma, stroke: edge)
  // 离子：孔上方两束穿入，两侧两束被 PMMA 挡住
  ion(3.0, 7.4, 5.0, ionc)
  ion(3.5, 7.4, 5.0, ionc)
  ion(6.5, 7.4, 5.0, ionc)
  ion(7.0, 7.4, 5.0, ionc)
  ion(1.4, 7.4, 6.0, ionc)
  ion(8.7, 7.4, 6.0, ionc)
  draw.content((5, 8.4), [#text(size: t8, weight: "bold", fill: ionc.darken(35%))[离子（N / C / O）]], anchor: "south")
  draw.content((1.55, 5.3), [#text(size: t7, fill: pmma.darken(45%))[PMMA]], anchor: "center")
  draw.content((5, 3.5), [#text(size: t7)[外延层]], anchor: "center")
  draw.content((5, 1.6), [#text(size: t7, fill: white)[晶圆]], anchor: "center")

  // ================= (b) 镍层蒸发 =================
  plabel(12, 10.9, [(b)])
  draw.rect((12.5, 1.0), (21.5, 2.2), fill: wafer, stroke: edge)
  draw.rect((12.5, 2.2), (21.5, 4.8), fill: epi, stroke: edge)
  draw.rect((12.5, 4.8), (14.6, 5.8), fill: pmma, stroke: edge)
  draw.rect((15.8, 4.8), (18.2, 5.8), fill: pmma, stroke: edge)
  draw.rect((19.4, 4.8), (21.5, 5.8), fill: pmma, stroke: edge)
  // 镍层：盖住全部顶面并填充孔直达 SiC
  draw.rect((12.5, 5.8), (21.5, 6.15), fill: nicol, stroke: edge)
  draw.rect((14.6, 4.8), (15.8, 6.15), fill: nicol, stroke: edge)
  draw.rect((18.2, 4.8), (19.4, 6.15), fill: nicol, stroke: edge)
  // 孔下外延层中的空位
  vacancy(15.2, 3.7)
  vacancy(18.8, 3.7)
  draw.content((17, 2.9), [#text(size: t7, fill: white)[空位]], anchor: "center")
  draw.line((16.2, 3.05), (15.4, 3.55), stroke: (paint: white, thickness: 0.55pt))
  draw.line((17.8, 3.05), (18.6, 3.55), stroke: (paint: white, thickness: 0.55pt))
  draw.content((17, 6.7), [#text(size: t8, weight: "bold")[镍层]], anchor: "south")

  // ================= (c) 反应离子刻蚀 =================
  plabel(0, -1.1, [(c)])
  draw.rect((0.5, -9.4), (9.5, -8.2), fill: wafer, stroke: edge)
  // 已刻蚀的表面：两侧下降，柱体残留
  draw.rect((0.5, -8.2), (9.5, -6.4), fill: epi, stroke: edge)
  draw.rect((2.6, -6.4), (3.8, -5.2), fill: epi, stroke: edge)
  draw.rect((6.2, -6.4), (7.4, -5.2), fill: epi, stroke: edge)
  // 柱顶镍帽
  draw.rect((2.6, -5.2), (3.8, -4.85), fill: nicol, stroke: edge)
  draw.rect((6.2, -5.2), (7.4, -4.85), fill: nicol, stroke: edge)
  vacancy(3.2, -5.8)
  vacancy(6.8, -5.8)
  // 刻蚀气体离子
  ion(1.4, -3.2, -4.6, riec)
  ion(3.2, -3.2, -4.6, riec)
  ion(5.0, -3.2, -4.6, riec)
  ion(6.8, -3.2, -4.6, riec)
  ion(8.6, -3.2, -4.6, riec)
  draw.content((5, -2.6), [#text(size: t8, weight: "bold", fill: riec.darken(20%))[SF#sub[6] + O#sub[2] + Ar]], anchor: "south")

  // ================= (d) 成品柱与两种收集几何 =================
  plabel(12, -1.1, [(d)])
  // 膜
  draw.rect((12.5, -8.2), (21.5, -6.9), fill: epi, stroke: edge)
  // 柱体：底部外扩（锥角），上部圆柱
  draw.line((15.6, -6.9), (16.1, -4.9), (16.1, -2.4), (17.9, -2.4), (17.9, -4.9), (18.4, -6.9), close: true,
    fill: epi, stroke: edge)
  // 偶极子：蓝（PL5，沿 c 轴）、橙（PL6）
  draw.circle((16.6, -3.6), radius: 0.26, fill: blue.lighten(35%), stroke: edge)
  draw.line((16.6, -3.6), (17.15, -3.05), mark: (end: ">", stroke: (paint: black, thickness: 0.55pt)), stroke: (paint: black, thickness: 0.55pt))
  draw.circle((17.5, -4.3), radius: 0.26, fill: orange, stroke: edge)
  // h_dp：偶极子深度
  draw.line((18.55, -4.3), (18.55, -2.4), stroke: (paint: black, thickness: 0.45pt, dash: "dashed"))
  draw.content((18.75, -3.35), [#text(size: t7)[h#sub[dp]]], anchor: "west")
  // h_p
  dimarrow((14.9, -6.9), (14.9, -2.4), black)
  draw.content((14.7, -4.65), [#text(size: t7)[h#sub[p]]], anchor: "east")
  // d_up / d_bot
  dimarrow((16.1, -1.95), (17.9, -1.95), black)
  draw.content((17, -1.75), [#text(size: t7)[d#sub[up]]], anchor: "south")
  dimarrow((15.6, -7.45), (18.4, -7.45), black)
  draw.content((17, -7.65), [#text(size: t7)[d#sub[bot]]], anchor: "north")
  // 锥角 α
  draw.content((18.85, -6.55), [#text(size: t7)[$alpha$]], anchor: "south-west")
  // t_m
  dimarrow((21.1, -8.2), (21.1, -6.9), black)
  draw.content((21.3, -7.55), [#text(size: t7)[t#sub[m]]], anchor: "west")
  // 物镜：(e) 上方体检测，(f) 下方膜检测；尖端朝向样品
  draw.line((16.4, -1.7), (17.6, -1.7), (18.1, -0.8), (15.9, -0.8), close: true, fill: luma(215), stroke: edge)
  draw.content((17, -1.25), [#text(size: t7, weight: "bold")[(e)]], anchor: "center")
  draw.line((16.4, -9.7), (17.6, -9.7), (18.1, -10.6), (15.9, -10.6), close: true, fill: luma(215), stroke: edge)
  draw.content((17, -10.15), [#text(size: t7, weight: "bold")[(f)]], anchor: "center")
  draw.content((19.0, -1.25), [#text(size: t7, fill: gray.darken(25%))[物镜]], anchor: "west")
  draw.content((19.0, -10.15), [#text(size: t7, fill: gray.darken(25%))[物镜]], anchor: "west")
})
