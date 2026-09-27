// 图 6 重画：低密度边缘等离子体中 ICRF 天线的二维有限元仿真域剖面
// （原图 antenna_2D_diagram.pdf 是纯线条示意，按 §0 要求以 CeTZ 重画）。
// 上部矩形是仿真域，下缘中间凹下去的一块是天线盒，其开口即正文所说的 aperture；
// 凹口两侧的上边角各带一个 1 cm 的圆角，正是共振锥切点所在。
#import "@preview/cetz:0.4.2": canvas, draw

#let wall = (paint: black, thickness: 1pt)
#let note = rgb(128, 0, 128)
#let nst = (paint: note, thickness: 0.8pt)
#let k = 3 * 0.5523

#canvas(length: 0.16cm, {
  // 边界：顶边、两侧、下缘（含天线盒凹口与两处圆角）
  draw.line((0, 20), (100, 20), stroke: wall)
  draw.line((0, 20), (0, 8), stroke: wall)
  draw.line((100, 20), (100, 8), stroke: wall)
  draw.line((0, 8), (31, 8), stroke: wall)
  draw.bezier((31, 8), (34, 5), (31 + k, 8), (34, 5 + k), stroke: wall)
  draw.line((34, 5), (34, 0), stroke: wall)
  draw.line((34, 0), (66, 0), stroke: wall)
  draw.line((66, 0), (66, 5), stroke: wall)
  draw.bezier((69, 8), (66, 5), (69 - k, 8), (66, 5 + k), stroke: wall)
  draw.line((69, 8), (100, 8), stroke: wall)

  // 坐标轴：平行 / 径向
  draw.line((14, 12), (14, 19), mark: (end: ">"), stroke: nst)
  draw.line((14, 12), (38, 12), mark: (end: ">"), stroke: nst)
  draw.content((11.5, 15.5),
    [#rotate(90deg, origin: center, text(size: 8pt, fill: note)[径向])],
    anchor: "center")
  draw.content((26, 13.4), [#text(size: 8pt, fill: note)[平行]], anchor: "south")

  // 孔径尺寸线
  draw.line((34, -3), (66, -3), mark: (start: "<", end: ">"), stroke: nst)
  draw.line((34, -1.6), (34, -4.4), stroke: nst)
  draw.line((66, -1.6), (66, -4.4), stroke: nst)
  draw.content((50, -5.6), [#text(size: 8pt, fill: note)[开口（0.5 m）]],
    anchor: "north")

  // 圆角半径指引
  draw.line((67.6, 6.6), (71, 4.2), stroke: nst)
  draw.content((71.6, 3.4), [#text(size: 8pt, fill: note)[圆角半径（1 cm）]],
    anchor: "west")
})
