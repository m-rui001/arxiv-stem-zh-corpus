// 图 2 重绘：低温晶圆探针台（CWP）剖面示意
// 依 D:\cetz-skill-release\SKILL.md 工作流，CeTZ 0.4.2
#import "@preview/cetz:0.4.2": canvas, draw

#let W = (paint: black, thickness: 1pt)
#let T = (paint: black, thickness: 0.7pt)
#let link = (paint: gray.darken(35%), thickness: 2.6pt)
#let wire = (paint: gray.darken(15%), thickness: 1.1pt)
#let lead = (paint: black, thickness: 0.4pt)

#let labL(p, txt, to) = {
  draw.line(p, to, stroke: lead)
  draw.content(p, [#text(size: 7pt)[#txt]], anchor: "east")
}
#let labR(p, txt, to) = {
  draw.line(p, to, stroke: lead)
  draw.content(p, [#text(size: 7pt)[#txt]], anchor: "west")
}

#canvas(length: 0.42cm, {
  // ---- 底座与支脚 ----
  draw.rect((0.0, 0.0), (10.2, 0.55), fill: none, stroke: W)
  draw.rect((0.9, -0.75), (2.3, 0.0), fill: none, stroke: W)
  draw.rect((7.9, -0.75), (9.3, 0.0), fill: none, stroke: W)

  // ---- 外真空容器 ----
  draw.line((0.5, 0.55), (0.5, 8.3), stroke: W)
  draw.line((9.7, 0.55), (9.7, 5.1), stroke: W)
  draw.line((0.5, 8.3), (6.1, 8.3), stroke: W)
  draw.line((6.1, 8.3), (6.1, 7.9), stroke: W)
  draw.rect((0.15, 7.9), (6.45, 8.3), fill: none, stroke: W)
  // 右侧脉管接口
  draw.rect((6.7, 5.1), (9.7, 5.5), fill: none, stroke: W)
  draw.rect((6.9, 5.5), (9.5, 7.5), fill: none, stroke: W)
  for x in (7.4, 8.2, 9.0) {
    draw.rect((x - 0.16, 7.5), (x + 0.16, 8.15), fill: none, stroke: T)
  }

  // ---- 嵌套辐射屏蔽罩（50 K / 4 K / 1 K）----
  draw.line((1.35, 7.0), (1.35, 1.35), stroke: W)
  draw.line((1.35, 1.35), (8.85, 1.35), stroke: W)
  draw.line((8.85, 1.35), (8.85, 4.6), stroke: W)
  draw.line((1.35, 7.0), (5.5, 7.0), stroke: W)
  draw.line((2.05, 5.9), (2.05, 2.0), stroke: W)
  draw.line((2.05, 2.0), (8.15, 2.0), stroke: W)
  draw.line((8.15, 2.0), (8.15, 4.0), stroke: W)
  draw.line((2.05, 5.9), (5.2, 5.9), stroke: W)
  draw.line((2.7, 4.55), (2.7, 2.6), stroke: W)
  draw.line((2.7, 2.6), (7.5, 2.6), stroke: W)
  draw.line((7.5, 2.6), (7.5, 4.55), stroke: W)
  draw.line((2.7, 4.55), (4.4, 4.55), stroke: W)

  // ---- 氦-3 蒸发器与泵抽线 ----
  draw.rect((2.35, 4.6), (3.35, 5.5), fill: none, stroke: W)
  draw.line((2.85, 5.5), (2.85, 8.3), stroke: W)
  draw.rect((2.55, 8.3), (3.15, 8.62), fill: none, stroke: T)

  // ---- 软铜编织带热链接 ----
  draw.line((2.85, 4.6), (2.85, 3.35), stroke: link)
  draw.line((2.85, 3.35), (4.55, 3.35), stroke: link)
  draw.line((3.35, 5.05), (4.55, 5.05), stroke: link)
  draw.line((4.55, 5.05), (4.55, 3.9), stroke: link)

  // ---- 双绞线束 ----
  draw.line((4.15, 8.9), (4.15, 6.3), stroke: wire)
  draw.line((4.35, 8.9), (4.35, 6.3), stroke: wire)
  draw.line((4.35, 6.3), (5.55, 6.3), stroke: wire)
  draw.line((5.55, 6.3), (5.55, 5.35), stroke: wire)
  // ---- 对准光路 ----
  draw.line((6.35, 7.9), (6.35, 5.4), stroke: T)
  draw.line((6.75, 7.9), (6.75, 5.4), stroke: T)

  // ---- 探针卡与探针 ----
  draw.rect((4.5, 5.05), (6.9, 5.3), fill: black, stroke: none)
  for x in (5.35, 5.75, 6.15) {
    draw.line((x - 0.12, 5.05), (x, 4.72), stroke: T)
    draw.line((x + 0.12, 5.05), (x, 4.72), stroke: T)
  }
  // ---- 晶圆、卡盘与位移台 ----
  draw.rect((4.35, 4.55), (7.05, 4.72), fill: none, stroke: W)
  draw.rect((4.75, 4.15), (6.65, 4.4), fill: none, stroke: W)
  draw.line((5.7, 4.15), (5.7, 2.6), stroke: W)
  draw.line((6.1, 4.15), (6.1, 2.6), stroke: W)
  draw.rect((5.35, 1.35), (6.45, 2.6), fill: none, stroke: W)

  // ---- 标注 ----
  labL((-0.6, 9.5), [氦泵抽线], (2.75, 8.45))
  labL((-0.6, 8.1), [外真空容器], (0.5, 7.4))
  labL((-0.6, 6.7), [50 K 屏蔽罩], (1.35, 6.1))
  labL((-0.6, 5.5), [4 K 屏蔽罩], (2.05, 5.0))
  labL((-0.6, 4.3), [氦-3 蒸发器], (2.35, 5.0))
  labL((-0.6, 3.0), [软铜编织热链接], (2.85, 3.5))
  labR((10.8, 6.8), [脉管制冷级], (9.5, 6.6))
  labR((10.8, 5.6), [探针卡], (6.9, 5.2))
  labR((10.8, 4.4), [被测晶圆], (7.05, 4.64))
  labR((10.8, 3.2), [晶圆卡盘], (6.65, 4.25))
  labR((10.8, 2.0), [1 K 屏蔽罩], (7.5, 3.2))
  draw.line((2.95, 9.1), (4.2, 8.9), stroke: lead)
  draw.content((2.6, 9.2), [#text(size: 7pt)[双绞线束]], anchor: "south")
  draw.line((7.3, 9.1), (6.6, 8.0), stroke: lead)
  draw.content((7.6, 9.2), [#text(size: 7pt)[对准光路]], anchor: "south")
})
