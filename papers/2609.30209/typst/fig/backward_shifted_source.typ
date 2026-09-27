// 图 7 重画：式 (3.49) D(X_{n_0}+e_1)=0 的图示（原 TikZ fig:backward-shifted-source-block）。
// 两个同心立方体 Q_s（外）与 Q_r（内）；
// 斜纹三角 = Q_r 中已控制的时钟区 {t - x ≤ κ_f}（源线左下侧，斜纹方向 -1）；
// 淡绿带 = 源线与后移线之间、Q_r 内的平移带；
// 红色不规则开口的折线 = 调整后的迹 𝔅（顶部故意开口，不是矩形）；
// 黑色粗斜线 𝒥_f（t = x - 3 限于 Q_r）与其上黑点 X_n；
// 绿色斜线 L(κ_f+1,ζ_f)（后移线）与其上绿点 X_n+e_1，短箭头指向左下示意 n 递减的回代。
#import "@preview/cetz:0.4.2": canvas, draw

#let c-green = rgb("#087F6B")
#let c-red = rgb("#B6474A")
#let c-box = (thickness: 0.9pt, paint: luma(15%), cap: "round", join: "round")
#let c-box-in = (thickness: 0.85pt, paint: luma(15%), cap: "round", join: "round")

// 白底小标签（对应 TikZ 的 btlabel 样式）
#let tag(pos, col: black, anchor: "center", body) = draw.content(
  pos,
  [#box(fill: white, inset: (x: 1.3pt, y: 0.6pt))[#text(size: 8.5pt, fill: col)[#body]]],
  anchor: anchor,
)

// 实心 stealth 箭头（仿 TikZ Latex 头）
#let tip(col, len, wid) = (symbol: ">>", fill: col, stroke: 0.25pt + col,
  length: len, width: wid)

// 红色不规则迹 𝔅 的折点（照抄原 TikZ 坐标，顶部开口）
#let btrace = (
  (-4.9, 5.1), (-4.9, 4.55), (-4.55, 4.55), (-4.55, 3.7),
  (-4.85, 3.7), (-4.85, 3.2), (-4.4, 3.2),
  (-4.4, 2.4), (-4.7, 2.4), (-4.7, 1.75),
  (-4.35, 1.75), (-4.35, 0.9), (-4.7, 0.9),
  (-4.7, 0.25), (-4.45, 0.25), (-4.45, -0.6),
  (-4.8, -0.6), (-4.8, -1.3), (-4.55, -1.3),
  (-4.55, -2.1), (-4.85, -2.1), (-4.85, -2.8),
  (-4.5, -2.8), (-4.5, -4.6),
  (-3.9, -4.6), (-3.9, -4.35), (-3.15, -4.35),
  (-3.15, -4.65), (-2.65, -4.65), (-2.65, -4.25),
  (-2, -4.25), (-2, -4),
  (-1.35, -4), (-1.35, -4.45), (-0.55, -4.45),
  (-0.55, -4.2), (0.3, -4.2), (0.3, -4.6),
  (1.05, -4.6), (1.05, -4.15), (1.8, -4.15),
  (1.8, -4.45), (2.65, -4.45), (2.65, -4.2),
  (3.4, -4.2), (3.4, -4.5), (4.7, -4.5),
  (4.7, -3.3), (5, -3.3), (5, -2.55),
  (4.65, -2.55), (4.65, -1.8), (4.35, -1.8),
  (4.35, -1.1), (4.75, -1.1), (4.75, -0.2),
  (4.5, -0.2), (4.5, 0.55), (4.95, 0.55),
  (4.95, 1.35), (4.55, 1.35), (4.55, 2),
  (4.85, 2), (4.85, 2.8), (4.6, 2.8),
  (4.6, 3.5), (5, 3.5), (5, 4.3),
  (4.6, 4.3), (4.6, 5.1),
)

#align(center)[
  #canvas(length: 0.95cm, {
    // ---- 斜纹三角：Q_r ∩ {t - x ≤ κ_f}（黑 3% 底 + 黑 33% 斜纹，方向 x+y=cc）----
    draw.line((0, -3), (3, -3), (3, 0), close: true,
      fill: luma(97%), stroke: none)
    for k in range(-6, 7) {
      let cc = k * 0.5
      let apex = ((cc + 3) / 2, (cc - 3) / 2)
      let start = if cc <= 0 { (cc + 3, -3) } else { (3, cc - 3) }
      draw.line(start, apex, stroke: (thickness: 0.4pt, paint: luma(67%)))
    }

    // ---- 淡绿平移带（源线与其后移线之间，Q_r 内），半透明叠在斜纹之上 ----
    draw.line((-1, -3), (3, 1), (3, 0), (0, -3), close: true,
      fill: c-green.transparentize(94%), stroke: none)

    // ---- 两个同心立方体 ----
    draw.rect((-6, -6), (6, 6), stroke: c-box, fill: none)
    draw.rect((-3, -3), (3, 3), stroke: c-box-in, fill: none)
    draw.content((6.05, -5.95), [#text(size: 8.5pt)[$Q_s$]], anchor: "north-west")
    tag((3.03, -3.02), anchor: "north-west", $Q_r$)

    // ---- 红色不规则迹 𝔅（顶部开口）----
    draw.line(..btrace, stroke: (thickness: 1.05pt, paint: c-red,
      cap: "round", join: "round"), fill: none)
    tag((-4.5, 5.25), col: c-red, anchor: "west", $frak(B)$)

    // ---- 源块 𝒥_f：t = x - 3 限于 Q_r ----
    draw.line((0, -3), (3, 0), stroke: (thickness: 1.2pt, paint: black), fill: none)
    tag((3.12, 0.05), anchor: "west", $script(J)_f$)

    // ---- 递推用的连接：X_n -- X_n + e_1，X_n -- X_n - e_2 = X_(n-1) + e_1 ----
    for xx in range(0, 4) {
      draw.line((xx - 1, xx - 3), (xx, xx - 3), (xx, xx - 2), fill: none,
        stroke: (thickness: 0.7pt, paint: c-green.lighten(25%)))
    }

    // ---- 后移直线（止于不规则迹）与示意回代的短箭头 ----
    draw.line((-2, -4), (4, 2), stroke: (thickness: 1.15pt, paint: c-green), fill: none)
    draw.line((-0.9, -2.9), (-1.55, -3.55), fill: none,
      mark: (end: tip(c-green, 0.2, 0.135)),
      stroke: (thickness: 1.15pt, paint: c-green))

    // ---- 源点（黑）与后移点（绿）----
    for xx in range(0, 4) {
      draw.circle((xx, xx - 3), radius: 0.105, fill: black, stroke: none)
      draw.circle((xx, xx - 2), radius: 0.095, fill: c-green, stroke: none)
    }
    draw.circle((-2, -4), radius: 0.135, fill: c-green, stroke: none)
    draw.circle((4, 2), radius: 0.105, fill: c-green, stroke: none)

    // ---- 标注 ----
    tag((2.13, -1.12), anchor: "north-west", $X_0$)
    tag((1.86, 0.18), col: c-green, anchor: "south-east", $X_0 + e_1$)
    tag((0.87, -0.79), col: c-green, anchor: "south-east", $X_(-1) + e_1$)
    tag((3.87, 2.15), col: c-green, anchor: "south-east", $Z$)
    tag((-2, -4.93), col: c-green, anchor: "north", $X_(n_0) + e_1$)
    tag((2.13, -2.55), $D = 0$)

    // ---- 后移直线的说明标签与指引线 ----
    tag((-0.65, 1.8), col: c-green, $L(κ_f + 1, ζ_f)$)
    draw.line((0.75, 1.48), (2.9, 0.9),
      stroke: (thickness: 0.45pt, paint: c-green.lighten(35%)))
  })
]
