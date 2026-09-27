// 图 1：十字型约瑟夫森结 CMP 制备流程的等轴测示意（重画自 CMP_CrossJJ_FabScheme3D_rescaled.pdf）
#import "@preview/cetz:0.4.2": canvas, draw

#let edge = (paint: gray.darken(60%), thickness: 0.4pt)
#let subc = rgb("2f5c93")
#let nb = rgb("2b2b2b")
#let al = rgb("c9c9c9")
#let res = rgb("c8102e")
#let si = rgb("8cc63f")

#let slab(ox, oy, x0, x1, y0, y1, z0, z1, col) = {
  let p(X, Y, Z) = (ox + (X - Y) * 0.866, oy - (X + Y) * 0.5 + Z)
  let face(a, b, c, d, f) = draw.line(a, b, c, d, close: true, fill: f, stroke: edge)
  face(p(x0, y1, z1), p(x1, y1, z1), p(x1, y1, z0), p(x0, y1, z0), col.darken(14%))
  face(p(x1, y0, z1), p(x1, y1, z1), p(x1, y1, z0), p(x1, y0, z0), col.darken(30%))
  face(p(x0, y0, z1), p(x1, y0, z1), p(x1, y1, z1), p(x0, y1, z1), col)
}

#let lab(ox, oy, ztop, txt) = {
  draw.content((ox, oy + ztop + 1.3),
    [#text(size: 8.5pt, weight: "bold")[#txt]], anchor: "south")
}

#figure(
  canvas(length: 0.205cm, {
    // ---- a) 三层膜叠层 ----
    let A = (0, 0)
    slab(A.at(0), A.at(1), 0, 10, 0, 10, 0, 1.3, subc)
    slab(A.at(0), A.at(1), 0, 10, 0, 10, 1.3, 2.1, nb)
    slab(A.at(0), A.at(1), 0, 10, 0, 10, 2.1, 2.45, al)
    slab(A.at(0), A.at(1), 0, 10, 0, 10, 2.45, 3.25, nb)
    lab(A.at(0), A.at(1), 3.25, "a")

    // ---- b) 刻蚀成条带 + 光刻胶 ----
    let B = (19, 0)
    slab(B.at(0), B.at(1), 0, 10, 0, 10, 0, 1.3, subc)
    slab(B.at(0), B.at(1), 3.6, 6.4, 0, 10, 1.3, 2.1, nb)
    slab(B.at(0), B.at(1), 3.6, 6.4, 0, 10, 2.1, 2.45, al)
    slab(B.at(0), B.at(1), 3.6, 6.4, 0, 10, 2.45, 3.25, nb)
    slab(B.at(0), B.at(1), 3.6, 6.4, 0, 10, 3.25, 4.6, res)
    lab(B.at(0), B.at(1), 4.6, "b")

    // ---- c) 溅射 SiO2 绝缘层 ----
    let C = (38, 0)
    slab(C.at(0), C.at(1), 0, 10, 0, 10, 0, 1.3, subc)
    slab(C.at(0), C.at(1), 0, 10, 0, 10, 1.3, 3.4, si)
    slab(C.at(0), C.at(1), 3.6, 6.4, 0, 10, 3.4, 3.75, nb)
    slab(C.at(0), C.at(1), 3.6, 6.4, 0, 10, 3.75, 5.0, res)
    lab(C.at(0), C.at(1), 5.0, "c")

    // ---- d) CMP 平坦化 ----
    let D = (0, -19)
    slab(D.at(0), D.at(1), 0, 10, 0, 10, 0, 1.3, subc)
    slab(D.at(0), D.at(1), 0, 10, 0, 10, 1.3, 3.4, si)
    slab(D.at(0), D.at(1), 3.6, 6.4, 0, 10, 3.4, 3.55, nb)
    lab(D.at(0), D.at(1), 3.55, "d")

    // ---- e) 垂直布线层图形化 ----
    let E = (19, -19)
    slab(E.at(0), E.at(1), 0, 10, 0, 10, 0, 1.3, subc)
    slab(E.at(0), E.at(1), 0, 10, 0, 10, 1.3, 3.4, si)
    slab(E.at(0), E.at(1), 3.6, 6.4, 0, 10, 3.4, 3.55, nb)
    slab(E.at(0), E.at(1), 0, 10, 3.6, 6.4, 3.55, 4.35, nb)
    slab(E.at(0), E.at(1), 0, 10, 3.6, 6.4, 4.35, 5.6, res)
    lab(E.at(0), E.at(1), 5.6, "e")

    // ---- f) 湿法刻蚀 Al-AlOx、去胶，结区成形 ----
    let F = (38, -19)
    slab(F.at(0), F.at(1), 0, 10, 0, 10, 0, 1.3, subc)
    slab(F.at(0), F.at(1), 0, 10, 0, 10, 1.3, 3.4, si)
    slab(F.at(0), F.at(1), 3.6, 6.4, 0, 10, 3.4, 3.6, nb)
    slab(F.at(0), F.at(1), 0, 3.2, 3.6, 6.4, 3.6, 4.3, nb)
    slab(F.at(0), F.at(1), 6.8, 10, 3.6, 6.4, 3.6, 4.3, nb)
    lab(F.at(0), F.at(1), 4.3, "f")
  }),
  caption: [十字型结的 CMP 制备流程示意（等轴测重画）。a）在衬底上沉积 Nb/Al-AlO#sub[x]/Nb 三层膜；b）光刻加刻蚀，把三层膜做成条带；c）沉积 SiO#sub[2]，让底电极与后续布线层隔开；d）CMP 平坦化；e）垂直于三层膜条带沉积并刻蚀 Nb 布线层，同时刻掉未被覆盖的三层膜顶电极，定义结区；f）湿法刻蚀 Al-AlO#sub[x] 层并去除光刻胶。],
) <fig-fabscheme>

#v(0.3em)
#align(center)[#canvas(length: 0.205cm, {
  let key(x, col, lbl) = {
    slab(x, 0, 0, 1.8, 0, 1.8, 0, 0.9, col)
    draw.content((x + 2.9, -0.9), [#text(size: 8pt)[#lbl]], anchor: "west")
  }
  key(-18, subc, [衬底])
  key(-10.5, nb, [Nb])
  key(-3.5, al, [Al])
  key(4, res, [光刻胶])
  key(15, si, [SiO#sub[2]])
})]
