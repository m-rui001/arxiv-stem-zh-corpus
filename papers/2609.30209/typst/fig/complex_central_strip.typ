// 图 2 重画：引理 2.3 示意 —— 输入体 K（倾斜椭圆，整体再旋 10°）被中央条带
// K ∩ {|L| ≤ tau} 截割；黑线为 ker L，蓝色虚线为支撑线（宽度 w_K(L)），
// 红色双箭头标出条带半宽 tau。原 TikZ 几何参数：a=3.2, b=1.05, tilt=20°,
// tau=0.40, 整体 scope rotate=10°。
// 注：cetz 0.4.2 的 canvas 无 width/height 参数，尺寸由内容包围盒 × length 决定，
// 此处 length 使总宽约 13cm（≤14cm）。
#import "@preview/cetz:0.4.2": canvas, draw

// ---- 几何参数（帧坐标，帧整体绕原点逆时针旋 10°）----
#let c10 = calc.cos(10deg)
#let s10 = calc.sin(10deg)
#let a = 3.2
#let b = 1.05
#let c20 = calc.cos(20deg)
#let s20 = calc.sin(20deg)
#let tw = 0.40
#let wsup = calc.sqrt((a * s20) * (a * s20) + (b * c20) * (b * c20))

// 帧坐标 -> 画布坐标
#let fr(x, y) = (x * c10 - y * s10, x * s10 + y * c10)
// 帧坐标 -> 椭圆局部坐标（反旋 20°）
#let loc(x, y) = (x * c20 + y * s20, -x * s20 + y * c20)
// 椭圆上点（帧坐标）
#let ell(th) = {
  let u = a * calc.cos(th)
  let v = b * calc.sin(th)
  (u * c20 - v * s20, u * s20 + v * c20)
}

#let gray = rgb(247, 247, 247)
#let red = rgb(166, 0, 0)       // red!65!black
#let blue = rgb(0, 0, 140)      // blue!55!black
#let bandfill = rgb(255, 232, 232) // red!9
#let hatchc = rgb(255, 140, 140)   // red!45

#let quad(aa, bb, cc) = {
  let disc = bb * bb - 4 * aa * cc
  if disc > 0 {
    let r = calc.sqrt(disc)
    ((-bb - r) / (2 * aa), (-bb + r) / (2 * aa))
  } else { () }
}

#canvas(length: 1.25cm, {
  // ---- 支撑虚线 y = ±w_K(L) ----
  for sy in (wsup, -wsup) {
    draw.line(fr(-4.25, sy), fr(4.25, sy),
      stroke: (paint: blue, thickness: 0.65pt, dash: "dashed"))
  }

  // ---- 椭圆（输入体 K）填充 ----
  let epts = ()
  for i in range(0, 96) { epts.push(fr(..ell(i * 3.75deg))) }
  draw.line(..epts, close: true, fill: gray, stroke: none)

  // ---- 条带与椭圆的交集：淡红填充 ----
  let bpts = ()
  for i in range(0, 720) {
    let p = ell(i * 0.5deg)
    if calc.abs(p.at(1)) <= tw { bpts.push(fr(..p)) }
  }
  // 条带边 y=±tau 与椭圆的交点（补上，保证直线段端点精确）
  let qa = c20 * c20 / (a * a) + s20 * s20 / (b * b)
  let qc = s20 * s20 / (a * a) + c20 * c20 / (b * b)
  for sy in (tw, -tw) {
    let qb = 2 * sy * s20 * c20 * (1 / (a * a) - 1 / (b * b))
    for x in quad(qa, qb, qc * sy * sy - 1) { bpts.push(fr(x, sy)) }
  }
  bpts = bpts.sorted(key: q => calc.atan2(q.at(1), q.at(0)))
  draw.line(..bpts, close: true, fill: bandfill, stroke: none)

  // ---- 斜纹线（clip 到椭圆内）----
  for k in range(-22, 23) {
    let p0 = (0.24 * k, tw)
    let d = (0.8, -0.8)
    let l0 = loc(..p0)
    let ld = loc(..d)
    let aa = (ld.at(0) / a) * (ld.at(0) / a) + (ld.at(1) / b) * (ld.at(1) / b)
    let bb = 2 * (l0.at(0) * ld.at(0) / (a * a) + l0.at(1) * ld.at(1) / (b * b))
    let cc = (l0.at(0) / a) * (l0.at(0) / a) + (l0.at(1) / b) * (l0.at(1) / b) - 1
    let ts = quad(aa, bb, cc)
    if ts.len() == 2 {
      let t0 = calc.max(ts.at(0), 0)
      let t1 = calc.min(ts.at(1), 1)
      if t1 > t0 {
        draw.line(fr(p0.at(0) + t0 * 0.8, p0.at(1) - t0 * 0.8),
                  fr(p0.at(0) + t1 * 0.8, p0.at(1) - t1 * 0.8),
          stroke: (paint: hatchc, thickness: 0.35pt))
      }
    }
  }

  // ---- ker L 主线 ----
  draw.line(fr(-4.35, 0), fr(4.45, 0), stroke: (paint: black, thickness: 0.8pt))
  draw.content(fr(4.55, 0.02), [#text(size: 9pt)[$"ker" L$]], anchor: "west")

  // ---- 条带边界 ----
  for sy in (tw, -tw) {
    draw.line(fr(-4.25, sy), fr(4.25, sy), stroke: (paint: red, thickness: 0.85pt))
  }

  // ---- 椭圆轮廓 ----
  draw.line(..epts, close: true, stroke: (paint: black, thickness: 1pt))

  // ---- 宽度 w_K(L)：蓝色双箭头 ----
  draw.line(fr(-3.90, 0), fr(-3.90, wsup),
    mark: (start: ">>", end: ">>"), stroke: (paint: blue, thickness: 0.75pt))
  draw.content(fr(-4.08, wsup / 2),
    [#text(size: 9pt, fill: blue)[$w_K(L)$]], anchor: "east")

  // ---- 半宽 tau：红色双箭头 ----
  draw.line(fr(3.85, 0), fr(3.85, tw),
    mark: (start: ">>", end: ">>", scale: 0.65),
    stroke: (paint: red, thickness: 0.75pt))
  draw.content(fr(4.02, tw / 2), [#text(size: 9pt, fill: red)[$tau$]],
    anchor: "west")

  // ---- 标签 K ----
  draw.content(fr(1.35, 1.03), [#text(size: 9pt)[#math.equation($K$)]],
    anchor: "center")

  // ---- 指引箭头与条带标签 ----
  let tip = fr(0.75, -0.15)
  draw.bezier(fr(1.45, -1.92), tip,
    fr(1.45 + 0.7 * calc.cos(110deg), -1.92 + 0.7 * calc.sin(110deg)),
    fr(0.98, -0.65),
    mark: (end: ">>"), stroke: (paint: red, thickness: 0.75pt))
  draw.content(fr(1.45, -2.0),
    [#text(size: 9pt, fill: red)[$K ∩ "{" abs(L) ≤ tau "}"$]], anchor: "north")
})
