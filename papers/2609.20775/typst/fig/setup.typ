// 附图 S1 重绘：低温测量线路示意（原图 Setup.pdf 是矢量框图，按 §0 要求以 CeTZ 重画）。
// 原图里嵌的器件 SEM 照片不复制——同一张照片已是主文图 1a，这里用虚线框 + 标注代替。
#import "@preview/cetz:0.4.2": canvas, draw

#let ln = (paint: black, thickness: 0.8pt)
#let thin = (paint: black, thickness: 0.7pt)
#let dash(c) = (paint: c, thickness: 0.9pt, dash: "dashed")
#let box(x0, y0, x1, y1) = draw.rect((x0, y0), (x1, y1), stroke: ln)
#let t(x, y, s, a: "center") = draw.content((x, y), [#text(size: 6pt)[#s]], anchor: a)

// 衰减器：细长矩形
#let att(cx, cy, lbl) = {
  draw.rect((cx - 0.28, cy - 0.62), (cx + 0.28, cy + 0.62), stroke: ln)
  if lbl != none { t(cx + 0.5, cy, lbl, a: "west") }
}

// 低通滤波器：矩形 + 内部「平–降」折线
#let lp(cx, cy, lbl) = {
  draw.rect((cx - 0.85, cy - 0.42), (cx + 0.85, cy + 0.42), stroke: ln)
  draw.line((cx - 0.45, cy + 0.17), (cx + 0.03, cy + 0.17), (cx + 0.45, cy - 0.22), stroke: thin)
  if lbl != none { t(cx + 1.1, cy, lbl, a: "west") }
}

// 放大器：空心三角，顶点朝上
#let amp(cx, cy, h: 1.7, w: 0.85) = {
  draw.line((cx - w, cy - h / 2), (cx + w, cy - h / 2), (cx, cy + h / 2), close: true, stroke: ln)
}

#let wire(..pts) = draw.line(..pts, stroke: ln)

#let band(y0, y1, c, lbl, ly: none) = {
  draw.rect((0.3, y0), (19.0, y1), stroke: dash(c))
  t(0.6, if ly == none { (y0 + y1) / 2 } else { ly }, lbl, a: "west")
}

#canvas(length: 0.372cm, {
  // ---- 温级 ----
  t(0.6, 17.2, [RT], a: "west")
  band(15.1, 16.4, rgb(200, 0, 200), [50 K])
  band(13.0, 14.3, rgb(90, 60, 200), [4 K])
  band(10.9, 12.2, rgb(30, 90, 200), [900 mK])
  band(8.8, 10.1, rgb(0, 140, 215), [100 mK])
  band(0.2, 8.0, rgb(0, 190, 235), [10 mK], ly: 7.5)

  // ---- 室温仪器 ----
  box(0.5, 22.0, 9.5, 26.0)
  t(5.0, 25.3, [OPX1000（Quantum Machines）])
  box(1.3, 22.4, 4.5, 24.4)
  t(2.9, 23.4, [AWG])
  box(5.0, 22.4, 8.8, 24.4)
  t(6.9, 23.4, [Digitizer])
  box(17.5, 24.1, 23.2, 26.6)
  t(20.35, 25.35, [DMM\（34465A，\ Keysight）])
  box(5.0, 19.0, 11.2, 21.5)
  t(8.1, 20.25, [DAC\（QDAC，\ Quantum Machines）])

  amp(15.0, 21.05, h: 1.9, w: 1.0)
  t(16.4, 20.6, [差分放大器\（SR560，Stanford\ Research Systems）], a: "west")
  amp(13.2, 17.75)
  amp(16.8, 17.75)
  t(18.0, 17.6, [IV 转换器\（Basel Precision\ Instruments）], a: "west")

  // Digitizer → 差分放大器 → DMM
  wire((8.8, 23.4), (20.35, 23.4), (20.35, 24.1))
  wire((15.0, 23.4), (15.0, 22.0))
  // 两只 IV 转换器 → 差分放大器的两个输入端
  wire((13.2, 18.6), (13.2, 19.6), (14.4, 19.6), (14.4, 20.1))
  wire((16.8, 18.6), (16.8, 19.6), (15.6, 19.6), (15.6, 20.1))
  // DAC 的 V_SD 接到源极线上
  wire((11.2, 20.0), (11.9, 20.0), (11.9, 16.9), (13.2, 16.9))
  t(12.0, 20.5, [$V _"SD"$], a: "west")

  // ---- 下行线 ----
  // 射频：AWG → 逐级衰减 → 偏置三通
  wire((2.9, 22.4), (2.9, 2.2), (3.8, 2.2))
  t(3.25, 21.4, [×8], a: "west")
  att(2.9, 13.65, [−20 dB])
  att(2.9, 11.55, [−3 dB])
  att(2.9, 9.45, [−3 dB])
  att(2.9, 7.0, [0 dB])

  // 直流栅压 V_g：DAC → 225 MHz → 50 kHz → 偏置三通
  wire((7.2, 19.0), (7.2, 7.45))
  t(7.5, 18.2, [$V _"g"$], a: "west")
  lp(7.2, 7.0, [225 MHz])
  wire((7.2, 6.58), (7.2, 4.75))
  lp(7.2, 4.3, none)
  wire((7.2, 3.88), (7.2, 3.4), (4.9, 3.4), (4.9, 3.1))

  // 源极 / 漏极读出线：样品 → 50 kHz → 225 MHz → IV 转换器
  for cx in (13.2, 16.8) {
    wire((cx, 16.9), (cx, 7.45))
    lp(cx, 7.0, if cx == 16.8 { [225 MHz] } else { none })
    wire((cx, 6.58), (cx, 4.75))
    lp(cx, 4.3, if cx == 16.8 { [50 kHz] } else { none })
  }
  wire((13.2, 3.88), (13.2, 3.6), (12.1, 3.6))
  wire((16.8, 3.88), (16.8, 2.0), (12.1, 2.0))
  t(13.45, 3.0, [源极\ 欧姆], a: "west")
  t(17.1, 2.7, [漏极\ 欧姆], a: "west")

  // ---- PCB 与样品 ----
  draw.rect((2.0, 0.5), (18.5, 6.3), stroke: dash(black))
  t(18.2, 0.8, [PCB], a: "east")
  box(3.8, 1.3, 6.0, 3.1)
  // 偏置三通内部：隔直电容 + 馈电电阻
  draw.line((4.5, 1.6), (4.5, 1.85), (4.8, 2.0), (4.5, 2.15), (4.8, 2.3), (4.5, 2.45),
    (4.5, 2.7), stroke: thin)
  draw.line((5.2, 1.9), (5.55, 1.9), stroke: thin)
  draw.line((5.2, 2.35), (5.55, 2.35), stroke: thin)
  draw.line((5.375, 1.5), (5.375, 1.9), stroke: thin)
  draw.line((5.375, 2.35), (5.375, 2.85), stroke: thin)
  wire((4.9, 1.3), (4.9, 0.85), (8.3, 0.85))

  draw.rect((8.3, 0.85), (12.1, 5.4), stroke: dash(black))
  t(10.2, 4.75, [样品])
  t(10.2, 3.9, [（见图 1a）])

  // ---- 图例 ----
  t(20.2, 13.2, [图例], a: "west")
  draw.rect((20.25, 11.4), (20.8, 12.6), stroke: ln)
  t(21.2, 12.0, [衰减器], a: "west")
  lp(20.5, 10.3, none)
  t(21.7, 10.3, [低通滤波器], a: "west")
  amp(20.5, 8.9, h: 1.1, w: 0.55)
  t(21.3, 8.9, [放大器], a: "west")
  draw.rect((19.9, 7.2), (21.1, 8.0), stroke: ln)
  t(21.4, 7.6, [偏置三通], a: "west")
})
