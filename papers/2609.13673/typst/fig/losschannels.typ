// 图 1 重绘：溅射 Nb/InP 谐振器的微波损耗通道示意（原图 device_crosssection_extended.pdf 为 11 MB 位图拼合，以 CeTZ 重绘）
// 布局：上为 CPW 芯片三维示意，中为 (a)(b)(c) 三种衬底制备的剖面堆叠，下为界面区定义条。
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: black, thickness: 0.7pt)
#let thin = (paint: black, thickness: 0.45pt)
#let lead = (paint: gray.darken(25%), thickness: 0.4pt)
#let inp = blue.lighten(80%)
#let nbcol = luma(199)
#let nbox = red.darken(12%)
#let msi = orange
#let sulf = yellow.darken(10%)
#let nat = blue.darken(28%)
#let t7 = 7pt
#let t65 = 6.5pt

// Nb 膜内的晶界斜线，spacing 控制晶粒粗细
#let grains(x0, x1, y0, y1, spacing) = {
  let n = int((x1 - x0) / spacing) + 1
  for i in range(n) {
    let xx = x0 + i * spacing
    draw.line((xx, y0), (xx + 0.28, y1), stroke: (paint: gray.darken(35%), thickness: 0.45pt))
  }
}

// 衬底内的压电波纹
#let waves(cx, cy) = {
  for i in range(3) {
    let x = cx + i * 1.5
    draw.line((x, cy), (x + 0.3, cy + 0.18), (x + 0.6, cy - 0.18), (x + 0.9, cy),
      stroke: (paint: gray.darken(20%), thickness: 0.5pt))
  }
}

// (b) 面板的金字塔齿：InP 表面沿 [110] 的 {111} 面族
#let teeth(x0, x1, ybase, w, h) = {
  let pts = ((x0, ybase),)
  let n = int((x1 - x0) / w)
  for i in range(n) {
    let xx = x0 + i * w
    pts.push((xx + w * 0.5, ybase + h))
    pts.push((xx + w, ybase))
  }
  pts.push((x1, ybase))
  pts.push((x1, 0))
  pts.push((x0, 0))
  draw.line(..pts, close: true, fill: inp, stroke: edge)
  // 界面处的橙色无序带沿齿廓走
  let surf = ((x0, ybase),)
  for i in range(n) {
    let xx = x0 + i * w
    surf.push((xx + w * 0.5, ybase + h))
    surf.push((xx + w, ybase))
  }
  draw.line(..surf, stroke: (paint: msi, thickness: 1.6pt))
}

// 肘形引线：从文本 (x,y) 水平走到 (mx,y) 再竖直落到 (mx,ty) 打箭头；竖直引线时跳过重复点
#let elbow(x, y, mx, ty) = {
  let pts = if x == mx { ((x, y), (mx, ty)) } else { ((x, y), (mx, y), (mx, ty)) }
  draw.line(..pts, mark: (end: ">", fill: gray.darken(25%), stroke: lead), stroke: lead)
}

#canvas(length: 0.46cm, {
  // ================= 顶部：CPW 芯片三维示意 =================
  // InP 衬底三个面
  draw.line((6, 9.4), (22, 9.4), (23.8, 10.4), (7.8, 10.4), close: true, fill: luma(226), stroke: edge)
  draw.line((6, 9.4), (22, 9.4), (22, 8.5), (6, 8.5), close: true, fill: luma(214), stroke: edge)
  draw.line((22, 9.4), (23.8, 10.4), (23.8, 9.5), (22, 8.5), close: true, fill: luma(202), stroke: edge)
  // Nb 膜：顶面前缘的深色窄带
  draw.line((6, 9.4), (22, 9.4), (22.9, 9.94), (6.9, 9.94), close: true, fill: blue.darken(22%), stroke: edge)
  // CPW 中心导体与两侧地：顶面上的两条深条
  draw.line((9.5, 9.47), (18.5, 9.47), (18.72, 9.6), (9.72, 9.6), close: true, fill: blue.darken(40%), stroke: none)
  draw.line((9.0, 9.7), (19.0, 9.7), (19.22, 9.83), (9.22, 9.83), close: true, fill: blue.darken(28%), stroke: none)
  draw.content((14, 9.53), [#text(size: 6pt, fill: white)[CPW]], anchor: "center")
  draw.content((14, 10.85), [#text(size: t7)[Nb 薄膜（CPW 谐振器）]], anchor: "south")
  draw.content((10, 8.95), [#text(size: t7)[InP 衬底]], anchor: "center")
  // 截面位置标记
  draw.rect((13.75, 9.28), (14.25, 9.55), stroke: (paint: black, thickness: 1.2pt), fill: none)
  draw.line((14, 9.3), (14, 7.5), stroke: (paint: gray.darken(25%), thickness: 0.5pt, dash: "dashed"))
  draw.content((14.35, 7.75), [#text(size: t65, fill: gray.darken(25%))[取此截面]], anchor: "west")

  // ================= 中部：三个剖面面板 =================
  // 面板 a：原始衬底（对照）x 4..12
  draw.rect((4, 0), (12, 2.4), fill: inp, stroke: edge)
  draw.rect((4, 2.4), (12, 2.55), fill: nat, stroke: edge)
  draw.rect((4, 2.55), (12, 2.8), fill: msi, stroke: edge)
  draw.rect((4, 2.8), (12, 4.1), fill: nbcol, stroke: edge)
  draw.rect((4, 4.1), (12, 4.22), fill: nbox, stroke: edge)
  grains(4.15, 11.9, 2.95, 4.0, 0.52)
  waves(4.7, 0.7)
  draw.content((7.6, 0.7), [#text(size: 6pt, fill: gray.darken(30%))[压电损耗]], anchor: "west")
  draw.content((8, 1.45), [#text(size: t7)[InP 衬底]], anchor: "center")
  draw.content((8, 3.5), [#text(size: t7)[Nb 薄膜]], anchor: "center")
  // 左侧标注列
  draw.content((3.7, 4.5), [#text(size: t65)[Nb 表面氧化物]], anchor: "east")
  elbow(3.75, 4.5, 4.1, 4.16)
  draw.content((3.7, 3.6), [#text(size: t65)[Nb 晶界]], anchor: "east")
  draw.line((3.75, 3.6), (4.4, 3.5), mark: (end: ">", fill: gray.darken(25%), stroke: lead), stroke: lead)
  draw.content((3.7, 2.95), [#text(size: t65)[非晶 MS 界面]], anchor: "east")
  elbow(3.75, 2.95, 4.1, 2.68)
  draw.content((3.7, 2.15), [#text(size: t65)[InP 自然氧化物]], anchor: "east")
  elbow(3.75, 2.15, 4.1, 2.47)

  // 面板 b：Ar+ 原位刻蚀，x 14..22
  draw.rect((14, 2.4), (22, 4.1), fill: nbcol, stroke: edge)
  teeth(14, 22, 2.4, 1.33, 0.55)
  draw.rect((14, 4.1), (22, 4.22), fill: nbox, stroke: edge)
  grains(14.15, 21.9, 3.35, 4.0, 0.95)
  waves(14.7, 0.7)
  draw.content((17.6, 0.7), [#text(size: 6pt, fill: gray.darken(30%))[压电损耗]], anchor: "west")
  draw.content((18, 1.45), [#text(size: t7)[InP 衬底]], anchor: "center")
  draw.content((18, 6.1), [#text(size: t65)[InP 表面金字塔化，界面粗糙度贯穿膜厚]], anchor: "south")
  elbow(18, 6.0, 18, 2.75)

  // 面板 c：硫钝化，x 24..32
  draw.rect((24, 0), (32, 2.4), fill: inp, stroke: edge)
  draw.rect((24, 2.4), (32, 2.54), fill: sulf, stroke: edge)
  draw.rect((24, 2.54), (32, 2.72), fill: msi, stroke: edge)
  draw.rect((24, 2.72), (32, 4.1), fill: nbcol, stroke: edge)
  draw.rect((24, 4.1), (32, 4.22), fill: nbox, stroke: edge)
  grains(24.15, 31.9, 2.9, 4.0, 0.68)
  waves(24.7, 0.7)
  draw.content((27.6, 0.7), [#text(size: 6pt, fill: gray.darken(30%))[压电损耗]], anchor: "west")
  draw.content((28, 1.45), [#text(size: t7)[InP 衬底]], anchor: "center")
  draw.content((28, 3.5), [#text(size: t7)[Nb 薄膜]], anchor: "center")
  draw.content((28, 5.3), [#text(size: t65)[In–S 钝化层，界面平整]], anchor: "south")
  elbow(28, 5.2, 28, 2.47)

  // 面板标题
  draw.content((8, -0.55), [#text(size: t7, weight: "bold")[(a) 原始衬底（对照）]], anchor: "north")
  draw.content((18, -0.55), [#text(size: t7, weight: "bold")[(b) Ar#super[+] 原位刻蚀]], anchor: "north")
  draw.content((28, -0.55), [#text(size: t7, weight: "bold")[(c) 硫钝化]], anchor: "north")

  // ================= 底部：界面区定义条 =================
  draw.rect((9, -3.05), (28, -2.5), fill: luma(205), stroke: edge)
  draw.rect((9, -2.5), (28, -1.95), fill: msi, stroke: edge)
  draw.rect((9, -1.95), (28, -1.4), fill: luma(205), stroke: edge)
  draw.content((18.5, -2.77), [#text(size: 6pt)[下界（IV，InP 侧）]], anchor: "center")
  draw.content((18.5, -2.22), [#text(size: 6pt)[中点（取膜厚下端）]], anchor: "center")
  draw.content((18.5, -1.67), [#text(size: 6pt)[上界（III，Nb 膜侧）]], anchor: "center")
  draw.content((8.7, -2.2), [#text(size: t7)[界面区定义]], anchor: "east")
})
