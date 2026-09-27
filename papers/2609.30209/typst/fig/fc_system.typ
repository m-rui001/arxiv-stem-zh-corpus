// 图 6 重画：构造 3.8 的线性鞅系统，左右两个面板共用一个图注。
// 左（a）：二维 (x,t) 平面上的重建区域 𝔇、候选立方体 Q_{r+ℓ+1}、核心 Q_r、
//   调整后的边界 𝔅（底部两层 + 两侧的小方格），以及按时钟 κ=-4,…,4 排开的 9 个源块
//   （空心圈 + 彩色线段）与各自的两个目标点（实心点）；蓝色虚线箭头示意
//   “源端点 → 插入 → 首个目标” 的一步。
// 右（b）：同一构造在三维锥坐标 (t,x,ζ) 下的投影示意——线框立方体、ζ=0 斜平面、
//   三条时钟 0 的源块（青/蓝/琥珀）、一条虚线紫色源块（κ=-1, ζ=1）、
//   红色源点出发的六条最近邻虚线与沿 (1,1,0) 方向的三步最快传播。
// 两个面板都用不可见的定界矩形固定成 6.6cm × 6.6cm，故大小一致、基线对齐；
// 外层再套 13.6cm 的定宽盒，保证整幅宽度 ≤ 14cm。
#import "@preview/cetz:0.4.2": canvas, draw

#let c-blue = rgb("#1766A0")
#let c-teal = rgb("#008B82")
#let c-purple = rgb("#8656A3")
#let c-red = rgb("#C84427")
#let c-amber = rgb("#B77B17")
#let c-pink = rgb("#B84B83")
#let c-olive = rgb("#71862A")
#let c-slate = rgb("#576E86")
#let c-cyan = rgb("#2898AE")

// 时钟 κ 与源块配色（与原文 foreach 顺序一致）
#let src-blocks = (
  (-4, c-slate), (-3, c-cyan), (-2, c-purple), (-1, c-teal), (0, c-blue),
  (1, c-amber), (2, c-pink), (3, c-olive), (4, c-red),
)

// 带白底的小标签，避免压线
#let tag(pos, body, anchor: "center") = draw.content(
  pos, [#box(fill: white, inset: (x: 1.2pt, y: 0.5pt))[#body]], anchor: anchor)

// 实心箭头标记（cetz 的 ">>" 是 latex 式的 stealth 尖头）
#let tip(col, len, wid) = (symbol: ">>", fill: col, stroke: 0.25pt + col,
  length: len, width: wid)

// 面板 (a)：1 单位 = 一个格点间距
#let aopen(pos, col, r: 0.2) = draw.circle(
  pos, radius: r, stroke: 0.7pt + col, fill: white)
#let asolid(pos, col, r: 0.21) = draw.circle(pos, radius: r, fill: col, stroke: none)
#let abox(pos, half: 0.13) = draw.rect(
  (pos.at(0) - half, pos.at(1) - half), (pos.at(0) + half, pos.at(1) + half),
  stroke: 0.45pt + luma(42%), fill: white)

// 面板 (b)：三维锥坐标 (t,x,ζ) 到平面的投影（与原文 scope 的基向量一致）
#let p3(t, x, z) = (0.73 * x + 0.48 * z, 0.65 * t + 0.18 * x - 0.25 * z)
#let bopen(pos, col, r: 0.115) = draw.circle(
  pos, radius: r, stroke: 0.65pt + col, fill: white)

#align(center)[
  #box(width: 13.6cm)[
    #grid(columns: (1fr, 1fr), gutter: 6pt, align: horizon, [
      #align(center)[
        #canvas(length: 0.3cm, {
          // 定界矩形：22 × 22 单位 = 6.6cm 见方
          draw.rect((-11, -11), (11, 11), stroke: none, fill: none)

          // 重建区域 𝔇（浅灰底 + 淡边框）
          draw.rect((-8.35, -7.35), (8.35, 8.35), stroke: none, fill: luma(98%))
          draw.rect((-8.35, -7.35), (8.35, 8.35), stroke: 0.4pt + luma(87%), fill: none)

          // 候选立方体 Q_{r+ℓ+1}：淡蓝底、单位网格、虚线边框
          draw.rect((-5, -5), (5, 5), stroke: none, fill: c-blue.lighten(97%))
          for i in range(-4, 5) {
            draw.line((i, -5), (i, 5), stroke: 0.3pt + luma(92%))
            draw.line((-5, i), (5, i), stroke: 0.3pt + luma(92%))
          }
          draw.rect((-5, -5), (5, 5), fill: none,
            stroke: (thickness: 0.7pt, dash: "dashed", paint: luma(50%)))

          // 核心 Q_r：白底、网格、实线边框
          draw.rect((-2, -2), (2, 2), stroke: none, fill: white)
          for i in range(-1, 2) {
            draw.line((i, -2), (i, 2), stroke: 0.3pt + luma(87%))
            draw.line((-2, i), (2, i), stroke: 0.3pt + luma(87%))
          }
          draw.rect((-2, -2), (2, 2), stroke: 0.9pt + luma(25%), fill: none)

          // 调整后的边界 𝔅：底部两行 + 左右两列的小方格
          for t in (-7, -6) {
            for x in range(-8, 9) { abox((x, t)) }
          }
          for t in range(-5, 9) {
            abox((-8, t))
            abox((8, t))
          }

          // 源块（空心圈 + 彩色线段）与目标点（实心点）
          for bk in src-blocks {
            let kap = bk.at(0)
            let col = bk.at(1)
            let amin = if -2 - kap > -2 { -2 - kap } else { -2 }
            let amax = if 2 - kap < 2 { 2 - kap } else { 2 }
            if amin != amax {
              draw.line((amin, kap + amin), (amax, kap + amax), stroke: 0.9pt + col)
            }
            for aa in range(amin, amax + 1) { aopen((aa, kap + aa), col) }
            draw.line(
              (amax + 1, kap + amax + 2), (amax + 2, kap + amax + 3),
              stroke: 0.7pt + col)
            asolid((amax + 1, kap + amax + 2), col)
            asolid((amax + 2, kap + amax + 3), col)
          }

          // 示意的一条连接：源端点 -> 插入 -> 首个目标
          draw.line((2, 2), (2, 3), (3, 4), fill: none,
            mark: (end: tip(c-blue, 0.5, 0.34)),
            stroke: (thickness: 0.9pt, dash: "densely-dashed", paint: c-blue))

          // 区域标签
          tag((0, 6.35), [#text(size: 8pt)[$Q_(r+ℓ+1)$]])
          tag((-5.9, 7.55), [#text(size: 8pt)[𝔇]])
          tag((-3.5, -0.3), [#text(size: 8pt)[$Q _r$]], anchor: "east")
          draw.line((-2.9, -0.3), (-2.15, -0.3), stroke: 0.4pt + luma(45%))
          tag((0, -8.25), [#text(size: 8pt)[𝔅]])

          // 目标点 / 源块 指引
          tag((5.5, 3.0), [#text(size: 7.5pt, fill: c-blue)[目标点]], anchor: "west")
          draw.line((5.45, 3.35), (4.3, 4.75), stroke: 0.45pt + c-blue.lighten(35%))
          tag((-3.2, -3.35), [#text(size: 7.5pt, fill: c-blue)[源块]], anchor: "east")
          draw.line((-3.1, -3.25), (-1.6, -1.75), stroke: 0.55pt + c-blue.lighten(35%))

          // 坐标轴
          draw.line((-9.1, -7.8), (-9.1, 8.5), mark: (end: tip(luma(25%), 0.6, 0.4)),
            stroke: 0.75pt + luma(25%))
          draw.content((-9.1, 8.75), [#text(size: 8pt, style: "italic")[$t$]],
            anchor: "south")
          draw.content((-9.5, 5.8), [#text(size: 8pt)[$e _1$]], anchor: "east")
          draw.line((-8.4, -9.15), (8.8, -9.15),
            mark: (end: tip(luma(25%), 0.6, 0.4)), stroke: 0.75pt + luma(25%))
          draw.content((9.05, -9.15), [#text(size: 8pt, style: "italic")[$x$]],
            anchor: "west")
        })
      ]

      #v(-3pt)
      #align(center)[#text(size: 8pt)[（a）二维情形下线性鞅系统构造的示意。]]
    ], [
      #align(center)[
        #canvas(length: 0.9167cm, {
          // 定界矩形：7.2 × 7.2 单位 = 6.6cm 见方
          draw.rect((-3.6, -2.9), (3.6, 4.3), stroke: none, fill: none)

          // 时钟 0 的斜平面（淡蓝）与线框立方体
          draw.line(p3(-2, -2, -2), p3(2, 2, -2), p3(2, 2, 2), p3(-2, -2, 2),
            close: true, fill: c-blue.lighten(95%), stroke: none)
          for aa in (-2, 2) {
            for bb in (-2, 2) {
              draw.line(p3(-2, aa, bb), p3(2, aa, bb), stroke: 0.45pt + luma(75%))
              draw.line(p3(aa, -2, bb), p3(aa, 2, bb), stroke: 0.45pt + luma(75%))
              draw.line(p3(aa, bb, -2), p3(aa, bb, 2), stroke: 0.45pt + luma(75%))
            }
          }

          // 三条时钟 0 的源块
          for bz in ((-1, c-teal), (0, c-blue), (1, c-amber)) {
            let z = bz.at(0)
            let col = bz.at(1)
            draw.line(p3(-2, -2, z), p3(2, 2, z), stroke: 0.9pt + col)
            for aa in range(-2, 3) { bopen(p3(aa, aa, z), col) }
          }

          // 紫色源块（κ=-1, ζ=1，虚线）
          draw.line(p3(-2, -1, 1), p3(1, 2, 1), fill: none,
            stroke: (thickness: 0.8pt, dash: "dashed", paint: c-purple))
          for aa in range(-1, 3) { bopen(p3(aa - 1, aa, 1), c-purple) }

          // 红色源点的六条最近邻虚线
          for nb in ((1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1)) {
            draw.line(p3(0, 0, 0), p3(nb.at(0), nb.at(1), nb.at(2)), fill: none,
              stroke: (thickness: 0.7pt, dash: "densely-dashed", paint: luma(35%)))
            draw.circle(p3(nb.at(0), nb.at(1), nb.at(2)), radius: 0.09,
              stroke: 0.6pt + luma(35%), fill: white)
          }

          // 红色注入与三步最快传播
          draw.line(p3(0, 0, 0), p3(1, 0, 0), fill: none,
            mark: (end: tip(c-red, 0.17, 0.11)),
            stroke: (thickness: 1.2pt, dash: "densely-dashed", paint: c-red))
          for i in range(0, 3) {
            draw.line(p3(1 + i, i, 0), p3(2 + i, 1 + i, 0),
              mark: (end: tip(c-red, 0.17, 0.11)), stroke: 1.05pt + c-red)
          }
          for i in range(0, 4) {
            draw.circle(p3(1 + i, i, 0), radius: 0.1, fill: c-red, stroke: none)
          }
          draw.circle(p3(0, 0, 0), radius: 0.16, fill: c-red, stroke: none)

          // 两个标签
          tag((1.5, 3.55), [#text(size: 8pt, fill: c-red)[目标点]], anchor: "east")
          draw.line((1.58, 3.45), p3(4, 3, 0), stroke: 0.45pt + c-red.lighten(35%))
          tag((2.2, 1.9), [#text(size: 8pt, fill: c-blue)[源块]], anchor: "west")
          draw.line((2.14, 1.85), p3(2, 2, 0), stroke: 0.45pt + c-blue.lighten(35%))
        })
      ]

      #v(-3pt)
      #align(center)[#text(size: 8pt)[（b）三维情形下源块及其传播的示意。]]
    ])
  ]
]
