// 图 1 重绘：HLP-EME 的工作原理（原矢量图 figs/fig1-4.pdf，四段流程 + 四级层级装配）
// 重画约定：
//   1. 原图 FDE 本征模分面用色标热图（求解器输出），此处改为强度剖面曲线——热图数值不属于示意信息。
//   2. 光栅包络按正弦起伏采样折线绘制，锯齿状分段常数近似用橙色阶梯线表示。
//   3. 配色沿用原图：蓝色 = 波导/周期，绿色 = 块，橙色 = 切片层与分段常数近似。
#import "@preview/cetz:0.4.2": canvas, draw

#let blue = rgb(45, 95, 160)
#let lblue = rgb(205, 222, 244)
#let green = rgb(80, 150, 80)
#let orange = rgb(225, 130, 45)
#let tan = rgb(250, 235, 220)
#let lg = rgb(232, 244, 232)
#let edge = (paint: blue, thickness: 0.6pt)
#let thin = (paint: blue, thickness: 0.45pt)
#let gdash = (paint: green, thickness: 0.7pt, dash: "dash-dotted")
#let bdash = (paint: blue, thickness: 0.6pt, dash: "dashed")
#let gbox = (paint: gray.darken(35%), thickness: 0.6pt, dash: "dashed")
#let blk = (paint: black, thickness: 0.6pt)
#let t7 = 7pt
#let t65 = 6.5pt
#let lerp(a, b, t) = a + (b - a) * t

// 以 (x0,yc)-(x1,yc) 为中轴、幅度 amp、周期数 per 的正弦上下包络闭合成一条光带
#let band(x0, x1, yc, amp, per, n: 72, fillc: lblue, strokev: edge) = {
  let ts = range(n + 1).map(k => k / n)
  let top = ts.map(t => (lerp(x0, x1, t), yc + amp * calc.sin(2 * calc.pi * per * t)))
  let bot = ts.map(t => (lerp(x0, x1, 1 - t), yc - amp * calc.sin(2 * calc.pi * per * (1 - t))))
  draw.line(..(top + bot), close: true, fill: fillc, stroke: strokev)
}

// 同一条光带按切片阶梯化：ns 片，每片取中心处宽度
#let slicer(x0, x1, yc, amp, per, ns, fillc: lblue) = {
  for k in range(ns) {
    let tm = (k + 0.5) / ns
    let ha = amp * calc.sin(2 * calc.pi * per * tm)
    draw.rect((lerp(x0, x1, k / ns), yc - ha), (lerp(x0, x1, (k + 1) / ns), yc + ha),
      fill: fillc, stroke: thin)
  }
}

// 阶梯状分段常数近似（橙色）；f(t) 给出连续曲线，取 nblocks 段
#let stairs(x0, x1, y0, ymax, nblocks, f) = {
  let s = (paint: orange, thickness: 0.8pt)
  for i in range(nblocks) {
    let ta = i / nblocks
    let tb = (i + 1) / nblocks
    let v = f((ta + tb) / 2) * ymax
    draw.line((lerp(x0, x1, ta), y0 + v), (lerp(x0, x1, tb), y0 + v), stroke: s)
    if i > 0 {
      let pv = f((i - 0.5) / nblocks) * ymax
      draw.line((lerp(x0, x1, ta), y0 + pv), (lerp(x0, x1, ta), y0 + v), stroke: s)
    }
  }
}

#let curve(x0, x1, y0, ymax, f, n: 48) = {
  let pts = range(n + 1).map(k => {
    let t = k / n
    (lerp(x0, x1, t), y0 + f(t) * ymax)
  })
  draw.line(..pts, stroke: (paint: blue, thickness: 0.8pt))
}

// 一只迷你坐标框：左轴 + 底轴 + 轴名
#let mini(x0, x1, y0, y1, ylab) = {
  draw.line((x0, y0), (x0, y1), stroke: blk, mark: (end: (arrow: (size: 3pt))))
  draw.line((x0, y0), (x1, y0), stroke: blk, mark: (end: (arrow: (size: 3pt))))
  draw.content((x0 - 0.5, (y0 + y1) / 2), [#text(size: t7)[#ylab]], anchor: "east")
}

#let sbox(cx, cy, w, h, txt, fillc: white, fs: t65) = {
  draw.rect((cx - w / 2, cy - h / 2), (cx + w / 2, cy + h / 2),
    fill: fillc, stroke: (paint: black, thickness: 0.7pt))
  draw.content((cx, cy), [#text(size: fs)[#txt]], anchor: "center")
}

#let txt(x, y, body, anchor: "center", size: t65, fillc: black, weight: "regular") = {
  draw.content((x, y), [#text(size: size, fill: fillc, weight: weight)[#body]], anchor: anchor)
}

#let arrowh(x0, x1, y) = {
  draw.line((x0, y), (x1, y),
    stroke: (paint: blue, thickness: 2.2pt), mark: (end: (arrow: (size: 4pt))))
}

#let arrowv(x, y0, y1) = {
  draw.line((x, y0), (x, y1),
    stroke: (paint: blue, thickness: 2.2pt), mark: (end: (arrow: (size: 4pt))))
}

// 高斯型模场强度剖面（代替原图的色标热图）
#let profile(cx, cy, w, h, col) = {
  draw.rect((cx - w / 2, cy - h / 2), (cx + w / 2, cy + h / 2), fill: white,
    stroke: (paint: col, thickness: 0.6pt))
  let pts = range(25).map(k => {
    let u = k / 24 - 0.5
    (cx + w * u, cy - h * 0.36 + h * 0.62 * calc.exp(-14 * u * u))
  })
  draw.line(..pts, stroke: (paint: col, thickness: 0.8pt))
}

#canvas(length: 0.295cm, {
  // ================= 第 1 步：参数离散化 =================
  txt(4.5, 36.3, [（1）光栅参数离散化], size: 7.5pt, weight: "bold")
  draw.rect((-0.2, 20.6), (9.6, 35.4), fill: none,
    stroke: (paint: blue, thickness: 0.7pt, dash: "dashed"))
  txt(4.7, 34.5, [单个块], fillc: green)

  mini(1.2, 8.8, 30.4, 33.8, [$kappa$])
  curve(1.2, 8.8, 30.4, 3.2, t => t * t)
  stairs(1.2, 8.8, 30.4, 3.2, 7, t => t * t)

  mini(1.2, 8.8, 25.6, 29.0, [$phi _"G"$])
  curve(1.2, 8.8, 25.6, 3.2, t => 1 - t * t)
  stairs(1.2, 8.8, 25.6, 3.2, 7, t => 1 - t * t)

  mini(1.2, 8.8, 21.0, 24.2, [半径])
  curve(1.2, 8.8, 21.0, 3.0, t => calc.sin(calc.pi * t))
  stairs(1.2, 8.8, 21.0, 3.0, 7, t => calc.sin(calc.pi * t))

  for xb in (3.7, 6.3) {
    draw.line((xb, 21.0), (xb, 33.8),
      stroke: (paint: green, thickness: 0.5pt, dash: "dashed"))
  }
  txt(5.0, 19.9, [⋮])

  arrowh(10.0, 12.4, 28.5)
  txt(10.2, 27.6, [（2）结构生成], anchor: "west")

  // ================= 第 2 步：生成的物理结构（连续包络） =================
  let blocks = ((13.6, 22.6, 0.55), (25.6, 34.6, 0.95), (37.6, 46.6, 1.15))
  for b in blocks {
    band(b.at(0), b.at(1), 30.2, b.at(2), 2)
  }
  for b in blocks {
    draw.line((b.at(0), 27.4), (b.at(0), 33.0), stroke: gdash)
    draw.line((b.at(1), 27.4), (b.at(1), 33.0), stroke: gdash)
    draw.line(((b.at(0) + b.at(1)) / 2, 27.6), ((b.at(0) + b.at(1)) / 2, 32.8), stroke: bdash)
  }
  txt(18.1, 34.9, [第 1 块], fillc: green, weight: "bold", size: t7)
  txt(30.1, 34.9, [第 2 块], fillc: green, weight: "bold", size: t7)
  txt(42.1, 34.9, [第 $N _b$ 块], fillc: green, weight: "bold", size: t7)
  txt(16.1, 32.5, [第 1 周期], fillc: blue)
  txt(20.1, 32.5, [第 2 周期], fillc: blue)
  txt(39.85, 32.5, [第 $N _b$ 周期], fillc: blue)
  for gx in (23.4, 35.4) {
    txt(gx + 1.1, 30.2, [⋯], size: 9pt)
  }
  draw.line((13.6, 27.0), (22.6, 27.0), stroke: bdash)
  txt(18.1, 26.1, [$N _p$ 个"第 1 周期"的复制])

  arrowv(30.1, 25.4, 23.4)
  txt(28.6, 24.4, [（3）结构切片], anchor: "east")

  // ================= 第 3 步：切片后的结构 =================
  for b in blocks {
    slicer(b.at(0), b.at(1), 20.0, b.at(2), 2, 16)
    draw.line((b.at(0), 17.4), (b.at(0), 22.6), stroke: gdash)
    draw.line((b.at(1), 17.4), (b.at(1), 22.6), stroke: gdash)
  }
  txt(15.6, 22.2, [第 1 周期（$N _s$ 片）], fillc: blue, anchor: "west")
  for gx in (23.4, 35.4) {
    txt(gx + 1.1, 20.0, [⋯], size: 9pt)
  }

  arrowv(30.1, 16.6, 14.6)
  txt(28.6, 15.6, [（4）光栅 S 矩阵求解], anchor: "east")

  // ================= 第 4 步：四级层级装配 =================
  // ---- (i) 切片层 ----
  draw.rect((-0.2, 0.2), (13.2, 13.4), fill: none, stroke: gbox)
  txt(6.5, 12.6, [（i）切片层], fillc: orange, weight: "bold", size: t7)
  band(1.0, 3.0, 9.6, 0.85, 1.5)
  draw.rect((1.6, 8.4), (2.4, 10.8), fill: none,
    stroke: (paint: orange, thickness: 0.8pt, dash: "dashed"))
  txt(2.0, 7.6, [第 $j$ 片], fillc: orange)
  draw.line((0.4, 10.2), (1.0, 10.2), stroke: blk, mark: (end: (arrow: (size: 3pt))))
  draw.line((3.0, 9.0), (3.6, 9.0), stroke: blk, mark: (start: (arrow: (size: 3pt))))
  txt(3.9, 11.6, [$y$ ↑   $x$ →], anchor: "west")
  profile(5.9, 10.2, 2.4, 2.0, blue)
  profile(5.9, 7.4, 2.4, 2.0, orange)
  txt(5.9, 5.8, [FDE 本征模剖面])
  draw.line((7.1, 10.2), (8.1, 10.2), stroke: blk, mark: (end: (arrow: (size: 3pt))))
  draw.line((7.1, 7.4), (8.1, 7.4), stroke: blk, mark: (end: (arrow: (size: 3pt))))
  txt(8.3, 9.4, [重叠与], anchor: "west")
  txt(8.3, 8.0, [传播], anchor: "west")
  sbox(11.9, 8.8, 2.6, 1.6, [$S _("i",j)$], fillc: tan)
  txt(11.7, 6.8, [单片矩阵])

  // ---- (ii) 周期层 ----
  draw.rect((13.8, 0.2), (26.4, 13.4), fill: none, stroke: gbox)
  txt(20.1, 12.6, [（ii）周期层], fillc: blue, weight: "bold", size: t7)
  sbox(16.2, 10.8, 4.0, 1.7, [$S _("period",i)$], fillc: lblue)
  txt(18.6, 10.8, [$=$  $S _("i",1)$  ★⋯★  $S _("i",N _s)$], anchor: "west")
  slicer(15.6, 24.6, 5.4, 1.5, 4, 18)
  draw.line((15.6, 3.2), (15.6, 7.6), stroke: bdash)
  draw.line((24.6, 3.2), (24.6, 7.6), stroke: bdash)
  txt(20.1, 7.9, [第 $i$ 周期（$N _s$ 片）], fillc: blue)
  txt(20.1, 2.4, [$N _s$ 片依次级联])

  // ---- (iii) 块层 ----
  draw.rect((27.0, 0.2), (39.6, 13.4), fill: none, stroke: gbox)
  txt(33.3, 12.6, [（iii）块层], fillc: green, weight: "bold", size: t7)
  sbox(30.0, 10.8, 3.4, 1.7, [$S _("blk",i)$], fillc: lg)
  txt(32.1, 10.8, [$=$  $S _("period",i)^(star N _p)$], anchor: "west")
  slicer(28.2, 33.2, 5.4, 1.2, 8, 20, fillc: rgb(226, 238, 250))
  slicer(34.2, 38.6, 5.4, 1.2, 6, 14, fillc: rgb(226, 238, 250))
  txt(33.7, 3.4, [⋯], size: 9pt)
  draw.line((28.2, 7.5), (38.6, 7.5),
    stroke: (paint: green, thickness: 0.6pt, dash: "dashed"))
  txt(33.4, 8.3, [$N _p$ 个第 $i$ 周期的复制], fillc: green)
  txt(33.4, 2.0, [块内只解一次，之后自级联复用])

  // ---- (iv) 光栅层 ----
  draw.rect((40.2, 0.2), (52.8, 13.4), fill: none, stroke: gbox)
  txt(46.5, 12.6, [（iv）光栅层], weight: "bold", size: t7)
  txt(46.5, 10.8, [$S _("blk",1)$ ★⋯★ $S _("blk",N _b)$])
  sbox(46.5, 8.0, 10.0, 2.0, [$S _"grating" = star _(i=1)^(N _b) S _("blk",i)$],
    fillc: white, fs: 7pt)
  txt(46.5, 5.4, [全局 S 矩阵 → 幅度/相位/群时延])
})
