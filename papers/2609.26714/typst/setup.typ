// 附录图：ADR 微波测量装置示意 —— 按 D:\cetz-skill-release 工作流重绘（原图 setup.pdf）
#import "@preview/cetz:0.4.2": canvas, draw

#let navy = rgb(31, 71, 127)
#let line-col = rgb(70, 70, 70)
#let brown = rgb(140, 100, 40)

#let cbox(x, y, w, h, label, size: 7pt, fill: white) = {
  draw.rect((x - w / 2, y - h / 2), (x + w / 2, y + h / 2),
    fill: fill, stroke: (paint: navy, thickness: 1pt))
  draw.content((x, y), text(size: size)[#label], anchor: "center")
}

#let stage(y, label) = {
  draw.line((-7.2, y), (7.2, y), stroke: (paint: gray, thickness: 0.8pt, dash: "dashed"))
  draw.content((-7.45, y), text(size: 6.8pt, fill: gray.darken(25%))[#label], anchor: "east")
}

#canvas(length: 0.85cm, {
  // 三个温区
  stage(4.0, [室温 ~300 K])
  stage(1.5, [3 K 级])
  stage(-1.8, [100 mK 级])

  // 三层真空罐
  draw.rect((-7.0, 1.3), (7.0, -3.2),
    stroke: (paint: gray, thickness: 0.7pt, dash: "dashed"))
  draw.content((-6.85, 1.02), text(size: 6.2pt, fill: gray.darken(30%))[三层真空罐（内两层覆黑）], anchor: "north-west")

  // Cryoperm 磁屏蔽筒（锚定 3 K 级）
  draw.rect((-3.7, -2.95), (3.7, -0.55),
    stroke: (paint: brown, thickness: 0.9pt, dash: "dashed"))
  draw.line((0, -0.55), (0, 1.5), stroke: (paint: brown, thickness: 0.6pt, dash: "dashed"))
  draw.content((0, -0.32), text(size: 6.4pt, fill: brown)[Cryoperm 屏蔽筒（锚定 3 K 级）], anchor: "center")

  // 顶部 VNA
  cbox(0, 4.7, 13.4, 0.9, [矢量网络分析仪（Agilent N5230A，S21 传输测量）], size: 7.5pt)

  // 输入链（左，x = -6，向下）
  draw.line((-6, 4.25), (-6, -1.8), (-2.1, -1.8),
    stroke: (paint: line-col, thickness: 1.1pt), mark: (end: ">"))
  cbox(-6, 3.2, 3.4, 0.7, [50 dB 室温衰减器])
  cbox(-6, 0.85, 3.6, 0.7, [43 dB 低温衰减器])
  cbox(-6, -0.35, 3.4, 0.7, [ECCOSORB 滤波器])
  draw.content((-5.75, 3.9), text(size: 6.4pt)[输入], anchor: "west")

  // 输出链（右，x = 6，向上）
  draw.line((2.1, -1.8), (6, -1.8), (6, 4.25),
    stroke: (paint: line-col, thickness: 1.1pt), mark: (end: ">"))
  cbox(6, -0.35, 3.4, 0.7, [ECCOSORB 滤波器])
  cbox(6, 0.85, 3.6, 0.7, [HEMT 放大器（3 K）])
  cbox(6, 3.2, 3.4, 0.7, [室温放大器])
  draw.content((6.25, 3.9), text(size: 6.4pt)[输出], anchor: "west")

  // 样品：铝封装盒内的 Nb CPW 谐振器
  draw.rect((-2.0, -2.45), (2.0, -1.15),
    fill: rgb(225, 238, 250), stroke: (paint: navy, thickness: 1.2pt))
  draw.content((0, -1.55), text(size: 7.5pt)[Nb CPW 谐振器芯片], anchor: "center")
  draw.content((0, -2.15), text(size: 6.2pt, fill: gray.darken(30%))[铝封装盒（Al 地平面缝合键合）], anchor: "center")

  // RuOx 温度计
  cbox(-2.9, -2.62, 1.7, 0.55, [RuOx 温度计], size: 6.2pt)
  draw.line((-2.05, -2.62), (-1.95, -2.45), stroke: 0.8pt)

  // ADR 冷指标注
  draw.content((3.1, -1.55), text(size: 6.2pt, fill: gray.darken(25%))[OFHC 冷指], anchor: "west")
})
