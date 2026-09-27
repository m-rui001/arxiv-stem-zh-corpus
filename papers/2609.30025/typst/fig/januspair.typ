// 图 2 重绘：Janus 颗粒取向映射为有效 XY 自旋，以及键依赖相互作用的由来。
// 原图 pair_interaction.pdf 左列是带径向渐变的三维球体渲染、右列是二维示意（黑点 + 红箭头 + 绿键）。
// 两列画的其实是同一件事（金属半球的朝向 = 自旋方向），三维渲染在中文排版里反而糊掉颜色边界，
// 故整体以 CeTZ 重画为二维版：每个颗粒画成"金属半盘（蓝）+ 介质半盘（灰白）+ 中心黑点 + 红色自旋箭头"。
#import "@preview/cetz:0.4.2": canvas, draw

#let metal = rgb(43, 74, 196)
#let diele = rgb(226, 228, 232)
#let bond = rgb(168, 208, 168)
#let red = rgb(230, 20, 20)
#let dark = rgb(40, 40, 40)
#let outline = (paint: black, thickness: 0.8pt)

#let pol(dist, ang) = (dist * calc.cos(ang * calc.pi / 180), dist * calc.sin(ang * calc.pi / 180))
#let at(pos, dist, ang) = { let d = pol(dist, ang); (pos.at(0) + d.at(0), pos.at(1) + d.at(1)) }

// 一个 Janus 颗粒：ang 为自旋方向（由介质半球指向金属半球），单位度。
// 注意 CeTZ 的 draw.arc 第一个位置参数是弧的 *起点*（圆周上的点），不是圆心，
// 所以扇形要自己算起点，否则整块会偏移一个半径。
#let janus(pos, ang, r: 1.0) = {
  draw.arc(at(pos, r, ang - 90), start: (ang - 90) * 1deg, stop: (ang + 90) * 1deg,
    radius: r, mode: "PIE", fill: metal, stroke: none)
  draw.arc(at(pos, r, ang + 90), start: (ang + 90) * 1deg, stop: (ang + 270) * 1deg,
    radius: r, mode: "PIE", fill: diele, stroke: none)
  draw.circle(pos, radius: r, fill: none, stroke: outline)
}

// 有效自旋箭头：穿过颗粒中心的红杆，箭头指向自旋方向
#let spin(pos, ang) = {
  draw.line(at(pos, -0.55, ang), at(pos, 1.75, ang),
    stroke: (paint: red, thickness: 2.2pt),
    mark: (end: ">", stroke: (paint: red, thickness: 2.2pt)))
}

#canvas(length: 0.86cm, {
  // 三行的自旋构型：(a) 反平行、金属半球相互背向；(b) 平行但与键成 45°；(c) 平行且沿键方向
  let rows = ((ang1: 180, ang2: 0), (ang1: 45, ang2: 45), (ang1: 0, ang2: 0))
  let labels = ([(a)], [(b)], [(c)])
  for i in range(3) {
    let y = 6.8 - i * 3.4
    let r = rows.at(i)
    draw.content((-1.35, y), labels.at(i), anchor: "center")
    janus((0.9, y), r.ang1)
    janus((3.3, y), r.ang2)
    draw.line((5.75, y), (8.45, y), stroke: (paint: bond, thickness: 2.6pt))
    draw.circle((6.1, y), radius: 0.3, fill: dark, stroke: outline)
    draw.circle((8.1, y), radius: 0.3, fill: dark, stroke: outline)
    spin((6.1, y), r.ang1)
    spin((8.1, y), r.ang2)
  }
  // (b) 行标注自旋与键的夹角 θ_i 与自旋矢量 S_i
  draw.arc(at((6.1, 3.4), 0.95, 0), start: 0deg, stop: 45deg, radius: 0.95,
    stroke: (paint: black, thickness: 0.7pt))
  draw.content((7.3, 3.62), [$theta _ i$], anchor: "west")
  draw.content((7.6, 5.1), [$S _ i$], anchor: "center")
})
