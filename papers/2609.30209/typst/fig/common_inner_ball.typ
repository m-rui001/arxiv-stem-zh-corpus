// 图 3 重画：公共内切球与扇形截口的体积账（对应式 (2.23)/(2.21)）
// 黑色大圆 = 输入体 B_{R_in}（浅灰填充）；白心小圆 = 公共内切球 B_{tau/C_0}；
// 红 / 绿 / 蓝三条带 = 三个方向（8° / 60° / 120°）的扇截口，斜纹为带内保留体积。
#import "@preview/cetz:0.4.2": canvas, draw

#let rout = 3.0
#let rin = 0.70

// 每条带：倾角、颜色（red!65!black / green!45!black / blue!65!black）、半宽；
// 8 位十六进制的末两位 73 即 45% 不透明度，用于斜纹。
#let bands = (
  (angle: 8deg,   col: "#a60000", hatch: "#a6000073", hw: 0.98),
  (angle: 60deg,  col: "#007300", hatch: "#00730073", hw: 0.86),
  (angle: 120deg, col: "#0000a6", hatch: "#0000a673", hw: 0.75),
)

// 带内局部坐标 (x', y') -> 世界坐标
#let toWorld(b, x, y) = {
  let ca = calc.cos(b.angle)
  let sa = calc.sin(b.angle)
  (x * ca - y * sa, x * sa + y * ca)
}

// 手动斜纹：局部 (x0, -hw) -> (x0 + 0.55, +hw)，裁剪到半径 rout 的圆内
#let hatches(b) = {
  let hw = b.hw
  let col = rgb(b.hatch)
  for i in range(-16, 17) {
    let s = toWorld(b, 0.34 * i, -hw)
    let e = toWorld(b, 0.34 * i + 0.55, hw)
    let d = (e.at(0) - s.at(0), e.at(1) - s.at(1))
    let A = d.at(0) * d.at(0) + d.at(1) * d.at(1)
    let B = 2 * (s.at(0) * d.at(0) + s.at(1) * d.at(1))
    let C = s.at(0) * s.at(0) + s.at(1) * s.at(1) - rout * rout
    let disc = B * B - 4 * A * C
    if disc > 0 {
      let sq = calc.sqrt(disc)
      let t0 = calc.clamp((-B - sq) / (2 * A), 0, 1)
      let t1 = calc.clamp((-B + sq) / (2 * A), 0, 1)
      if t1 > t0 + 1e-6 {
        draw.line(
          (s.at(0) + t0 * d.at(0), s.at(1) + t0 * d.at(1)),
          (s.at(0) + t1 * d.at(0), s.at(1) + t1 * d.at(1)),
          stroke: (paint: col, thickness: 0.35pt))
      }
    }
  }
}

// CeTZ 0.4.2 的 canvas 无 width/height 参数，用 length 控制单位尺寸：
// 画面约 7.6 个单位宽，1.62cm/单位 -> 总宽约 12.3cm（含右侧标注 ≤ 14cm）。
#canvas(length: 1.62cm, {
  // 输入体浅灰填充
  draw.circle((0, 0), radius: rout,
    fill: rgb("#0000000a"), stroke: none)

  // 三条带：先斜纹，再延伸到圆外的边界线
  for b in bands {
    hatches(b)
    let col = rgb(b.col)
    let st = (paint: col, thickness: 0.85pt)
    draw.line(toWorld(b, -3.55, b.hw), toWorld(b, 3.55, b.hw), stroke: st)
    draw.line(toWorld(b, -3.55, -b.hw), toWorld(b, 3.55, -b.hw), stroke: st)
  }

  // 输入体边界与公共内切球
  draw.circle((0, 0), radius: rout, stroke: (paint: black, thickness: 1pt))
  draw.circle((0, 0), radius: rin, fill: white,
    stroke: (paint: black, thickness: 1pt))

  // 标注
  draw.content((0, 0), [#align(center)[#text(size: 8pt)[内切球]\
    #text(size: 9pt)[$B_(τ ∕ C_0)$]]], anchor: "center")
  draw.content((2.65, -2.25),
    [#text(size: 9pt)[输入体 $B_(R_"in")$]], anchor: "west")
})
