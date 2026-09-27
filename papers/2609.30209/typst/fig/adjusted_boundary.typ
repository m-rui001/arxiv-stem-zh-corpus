// 图 5 重画：二维里的高度函数 h(v) 与调整边界 𝔅_k（对应 §3.3 引理 3.7「最小碗形边界」）
// 圆内数字是该格点的高度 h(v)，按高度 1–9 分九档深浅色填充（色值照抄原 TikZ 的 bkdepth1–9）；
// 带黑框的圆 = 受冻结点影响、高度低于「无冻结点」基准 h̄ 的位置；
// 小方块 = 原始迹 T_9（底部两层加左右两列，顶边故意不留）；青色叉 = 冻结点。
// 高度不手写：由 Typst 侧按递推 h(v) = 1_{{v 非冻结}} + min(四个前驱高度) 逐层算出，
// 前驱取 (t-1,z), (t-2,z), (t-1,z-1), (t-1,z+1)，所以等值线自下往上张成碗形。
#import "@preview/cetz:0.4.2": canvas, draw

// ---- 配色（照抄原图 \definecolor{bkdepth1..9}{...} 与 bkfrozen）----
// 第 k 档（高度为 k）用 bk-fill.at(k - 1)
#let bk-fill = (
  rgb("#CBDCF3"),
  rgb("#FBE7AA"),
  rgb("#F3CADA"),
  rgb("#CAE5D4"),
  rgb("#DDD1EE"),
  rgb("#F5D0AD"),
  rgb("#C6E4EB"),
  rgb("#E0E7B8"),
  rgb("#D9DCE3"),
)
#let bk-frozen = rgb("#008A91")
#let bk-trace = (paint: rgb("#A6A6A6"), thickness: 0.5pt)
#let bk-cross = (paint: bk-frozen, thickness: 1.1pt, cap: "round")
#let bk-gridline = (paint: rgb("#F0F0F0"), thickness: 0.3pt)
#let bk-axis = (paint: rgb("#404040"), thickness: 0.7pt)
#let bk-tick = (paint: rgb("#5A5A5A"), thickness: 0.6pt)

// ---- 冻结点 (z, t) ----
#let bk-frozen-sites = ((-3, -5), (8, 0))
#let bk-is-frozen(z, t) = bk-frozen-sites.any(p => p.at(0) == z and p.at(1) == t)

// ---- 高度函数：逐层递推，行下标 = t + 10，列下标 = z + 10 ----
#let bk-rows = {
  let zero-row = (0,) * 21
  let rows = (zero-row, zero-row)
  for t in range(-8, 10) {
    let r1 = rows.at(rows.len() - 1)
    let r2 = rows.at(rows.len() - 2)
    let cur = range(-10, 11).map(z => {
      if calc.abs(z) == 10 {
        0
      } else {
        let m = calc.min(r1.at(z + 10), r2.at(z + 10), r1.at(z + 9), r1.at(z + 11))
        m + 1 - (if bk-is-frozen(z, t) { 1 } else { 0 })
      }
    })
    rows.push(cur)
  }
  rows
}
#let bk-depth(z, t) = bk-rows.at(t + 10).at(z + 10)
// 无冻结点时的基准高度 h̄
#let bk-base(z, t) = calc.min(calc.floor((t + 10) / 2), 10 - calc.abs(z))

// 负数用真减号
#let bk-num(n) = if n < 0 { "−" + str(calc.abs(n)) } else { str(n) }
// 实心箭头：CeTZ 的 mark 字典写法不生效、字符串 ">" 又只有空心，
// 所以直接用闭合折线画一个填色三角形（tip 是箭尖，base 是箭底中点）。
#let bk-arrowhead(tip, dir) = {
  let w = 0.16
  let l = 0.45
  let bx = tip.at(0) - dir.at(0) * l
  let by = tip.at(1) - dir.at(1) * l
  draw.line(
    tip,
    (bx - dir.at(1) * w, by + dir.at(0) * w),
    (bx + dir.at(1) * w, by - dir.at(0) * w),
    close: true,
    fill: rgb("#404040"),
    stroke: none,
  )
}

#canvas(length: 0.4cm, {
  // ---- 淡底纹：依赖网格（并非边界条件） ----
  for z in range(-9, 10) {
    draw.line((z, -10), (z, 9), stroke: bk-gridline)
  }
  for t in range(-10, 10) {
    draw.line((-9, t), (9, t), stroke: bk-gridline)
  }

  // ---- 原始迹 T_9：底部两层 + 左右两列（无顶边） ----
  for t in (-10, -9) {
    for z in range(-9, 10) {
      draw.rect((z - 0.17, t - 0.17), (z + 0.17, t + 0.17), fill: white, stroke: bk-trace)
    }
  }
  for z in (-10, 10) {
    for t in range(-9, 9) {
      draw.rect((z - 0.17, t - 0.17), (z + 0.17, t + 0.17), fill: white, stroke: bk-trace)
    }
  }

  // ---- 高度圆点：按高度分档填色，被冻结点压低者加黑框 ----
  for t in range(-8, 10) {
    for z in range(-9, 10) {
      let q = bk-depth(z, t)
      if bk-is-frozen(z, t) {
        draw.line((z - 0.23, t - 0.23), (z + 0.23, t + 0.23), stroke: bk-cross)
        draw.line((z - 0.23, t + 0.23), (z + 0.23, t - 0.23), stroke: bk-cross)
      } else {
        draw.circle(
          (z, t),
          radius: 0.385,
          fill: bk-fill.at(q - 1),
          stroke: if q < bk-base(z, t) { bk-trace } else { none },
        )
        draw.content((z, t), [#text(size: 5.6pt)[#q]], anchor: "center")
      }
    }
  }

  // ---- 坐标轴（t 向上、z 向右）与刻度 ----
  draw.line((-11.3, -10.6), (-11.3, 10.15), stroke: bk-axis)
  draw.line((-10.6, -11.6), (10.65, -11.6), stroke: bk-axis)
  bk-arrowhead((-11.3, 10.62), (0, 1))
  bk-arrowhead((11.12, -11.6), (1, 0))
  draw.content((-11.3, 10.85), [$t$], anchor: "south")
  draw.content((11.35, -11.6), [$z$], anchor: "west")
  for t in range(-10, 9, step: 2) {
    draw.line((-11.42, t), (-11.18, t), stroke: bk-tick)
    draw.content((-11.6, t), [#text(size: 6pt)[#bk-num(t)]], anchor: "east")
  }
  for z in range(-10, 11, step: 2) {
    draw.line((z, -11.72), (z, -11.48), stroke: bk-tick)
    draw.content((z, -11.9), [#text(size: 6pt)[#bk-num(z)]], anchor: "north")
  }

  // ---- 图例（右侧三列） ----
  draw.content((12.7, 4.3), [#text(size: 8.5pt, weight: "bold")[调整边界]], anchor: "west")
  for k in range(1, 10) {
    let x = 13 + calc.rem(k - 1, 3) * 3.6
    let y = 3.0 - calc.floor((k - 1) / 3) * 1.4
    draw.circle((x, y), radius: 0.385, fill: bk-fill.at(k - 1), stroke: none)
    draw.content((x, y), [#text(size: 5.6pt)[#k]], anchor: "center")
    draw.content((x + 0.75, y), [#text(size: 7.5pt)[$frak(B)_#k$]], anchor: "west")
  }
  draw.rect((12.83, -1.57), (13.17, -1.23), fill: white, stroke: bk-trace)
  draw.content((14, -1.4), [#text(size: 7.5pt)[$T_9$ 的格点]], anchor: "west")
  draw.line((12.77, -3.53), (13.23, -3.07), stroke: bk-cross)
  draw.line((12.77, -3.07), (13.23, -3.53), stroke: bk-cross)
  draw.content((14, -3.3), [#text(size: 7.5pt)[冻结点]], anchor: "west")
  draw.circle((13, -5.2), radius: 0.385, fill: bk-fill.at(2), stroke: bk-trace)
  draw.content((13, -5.2), [#text(size: 5.6pt)[#3]], anchor: "center")
  draw.content((14, -5.2), [
    #set par(leading: 0.45em)
    #text(size: 7pt)[$h < macron(h)$ 的位置。\
    $macron(h)$：无冻结点时的高度。]
  ], anchor: "west")
})
