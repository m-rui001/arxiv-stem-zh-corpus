#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: gray.darken(55%), thickness: 0.5pt)
#let si = rgb("cfcfcf")
#let sio = rgb("9ec9e8")
#let au = rgb("e0b64a")
#let ti = rgb("6b6b6b")
#let nw = rgb("f6a3a3")
#let qd = rgb("c8102e")
#let lbl(txt) = text(size: 7.5pt, txt)
#let hd(txt) = text(size: 8pt, weight: "bold", txt)

#let substrate(cx, y0, h, col, w: 9) = {
  draw.line((cx - w / 2, y0), (cx + w / 2, y0), (cx + w / 2, y0 - h), (cx - w / 2, y0 - h),
    close: true, fill: col, stroke: edge)
}

#let wire(cx, ybase, h, w, topw) = {
  draw.line((cx - w / 2, ybase), (cx - w / 2, ybase + h * 0.72),
    (cx - topw / 2, ybase + h), (cx + topw / 2, ybase + h),
    (cx + w / 2, ybase + h * 0.72), (cx + w / 2, ybase),
    close: true, fill: nw, stroke: edge)
}

#let vwave(cx, y0, y1, amp, n) = {
  let pts = ()
  for i in range(n + 1) {
    let t = i / n
    pts.push((cx + amp * calc.sin(t * 4 * 180deg), y0 + t * (y1 - y0)))
  }
  pts
}

#figure(canvas(length: 0.19cm, {
  /* ---------- a：原位生长 ---------- */
  substrate(-2, 0, 1.6, si)
  draw.line((-6.5, 0), (4.5, 0), stroke: (paint: sio.darken(40%), thickness: 1.2pt))
  wire(-1, 0, 7, 1.5, 0.55)
  draw.circle((-1, 2.2), radius: 0.26, fill: qd, stroke: none)
  draw.line((-6.5, 2.2), (4.5, 2.2), stroke: (paint: gray, thickness: 0.5pt), dash: "dashed")
  draw.line((-1, 7.4), (-1, 9.8), stroke: (paint: qd, thickness: 1pt), end: ">")
  draw.line((-1, 1.6), (-1, -1.2), stroke: (paint: qd, thickness: 1pt), end: ">")
  draw.content((0.4, 8.6), [#lbl[$50 %$]], anchor: "west")
  draw.content((0.4, 0.2), [#lbl[$50 %$]], anchor: "west")
  draw.content((-1, 10.4), [#hd[a）原位生长]], anchor: "south")
  draw.content((-6.5, -2.2), [#lbl[Si 衬底，热氧化层开 $100 $ nm 孔；\\纳米线从孔中长出，根部直径突变。]], anchor: "north west")

  /* ---------- b：立在金镜上 ---------- */
  let X = 18
  substrate(X, -0.3, 2.5, si)
  substrate(X, -0.15, 0.15, ti, w: 9)
  substrate(X, 0.12, 0.27, au, w: 9)
  substrate(X, 0.28, 0.16, sio, w: 9)
  wire(X - 1, 0.28, 7, 1.5, 0.55)
  draw.circle((X - 1, 2.5), radius: 0.26, fill: qd, stroke: none)
  draw.line(..vwave(X - 1, 0.5, 2.2, 0.42, 60), stroke: (paint: qd, thickness: 0.7pt))
  draw.line((X - 1, 7.6), (X - 1, 10), stroke: (paint: qd, thickness: 1pt), end: ">")
  draw.line((X - 2.6, 7.6), (X - 3.6, 10.2), stroke: (paint: qd, thickness: 0.5pt), dash: "dashed")
  draw.line((X + 0.6, 7.6), (X + 1.6, 10.2), stroke: (paint: qd, thickness: 0.5pt), dash: "dashed")
  draw.content((X + 2.2, 9.4), [#lbl[绝热锥转成自由空间高斯模，\\顶部收集效率 $75 %$]], anchor: "west")
  draw.content((X + 2.2, 1.4), [#lbl[底镜模式反射率 $r _ "m" approx 0.95$，\\与偶极子之间形成弱腔（驻波）]], anchor: "west")
  draw.content((X + 2.2, -1.8), [#lbl[Ti/Au $100 $ nm + SiO#sub[2] $10 $ nm\\覆层，本征 Si 上自由空间反射率 $97.9 %$]], anchor: "west")
  draw.content((X - 1, 10.4), [#hd[b）转移到 Au/SiO#sub[2] 镜面]], anchor: "south")

  /* ---------- c：四极栅之间 ---------- */
  let Y = 41
  substrate(Y, -0.6, 2.2, si)
  substrate(Y, 0.1, 0.7, sio, w: 11)
  for s in (-1, 1) {
    draw.line((Y + s * 1.7, 0.1), (Y + s * 4.3, 0.1), (Y + s * 4.3, 2.1), (Y + s * 1.7, 2.1),
      close: true, fill: au, stroke: edge)
  }
  draw.content((Y - 3, 2.3), [#lbl[栅 1、2 接地]], anchor: "south")
  draw.content((Y + 3, 2.3), [#lbl[栅 3、4 加 $V$]], anchor: "south")
  wire(Y, 0.1, 5.4, 1.2, 0.5)
  draw.circle((Y, 2.4), radius: 0.24, fill: qd, stroke: none)
  draw.line((Y - 5.5, 2.4), (Y + 5.5, 2.4), stroke: (paint: gray, thickness: 0.5pt), dash: "dashed")
  for dy in (-0.6, 0.0, 0.6) {
    draw.line((Y - 1.5, 2.4 + dy), (Y + 1.3, 2.4 + dy), stroke: (paint: qd, thickness: 0.8pt), end: ">")
  }
  draw.content((Y + 5.8, 0.4), [#lbl[Ti/Au 电极由 $1.5 $ µm 厚 SiO#sub[2]\\抬到与量子点共面；横向偶极场\\经 Stark 效应红移 $3.6 $ GHz]], anchor: "north west")
  draw.content((Y, 10.4), [#hd[c）置于四极栅之间]], anchor: "south")
}), caption: [本文转移工艺涉及的三种几何（依正文与"方法"的工艺描述重画，尺寸不按比例）。a）纳米线量子点在生长衬底上的原位形态：InP 纳米线从热氧化层的 $100 $ nm 孔中竖直长出，InAsP 量子点（红点）位于距衬底约 $1.5 $ µm 处，发射均分进波导的上、下两个模式，顶部最多收到 $50 %$。b）用 EBID 拾取—放置把纳米线竖直转移到镀金衬底上：$10 $ nm SiO#sub[2] 间隔层抬高 HE#sub[11] 模的模式反射率，$r _ "m" approx 0.95$ 的背反射在量子点与镜面之间形成弱腔（红色驻波），向上的一支经绝热锥转成自由空间高斯模，收集效率提高到 $75 %$，并带来 $1.58$ 的 Purcell 增强。c）转移到四极栅模板上：Ti/Au 电极由 $1.5 $ µm 厚 SiO#sub[2] 间隔层抬高到与量子点共面，对置栅上加差分偏压，在量子点处产生横向偶极电场，靠量子限制 Stark 效应把发射波长调谐 $3.6 $ GHz。],
) <fig-device>
