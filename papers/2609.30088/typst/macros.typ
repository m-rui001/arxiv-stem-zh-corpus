// 2609.30088 AT-SKM-Net 中文译本共用宏

// 向量与矩阵
#let xv = $bold(x)$
#let bv = $bold(b)$
#let dv = $bold(d)$
#let av = $bold(a)$
#let pv = $bold(p)$
#let ev = $bold(e)$
#let hv = $bold(h)$
#let zv = $bold(z)$
#let uv = $bold(u)$
#let vv = $bold(v)$
#let rv = $bold(r)$
#let wv = $bold(omega)$
#let Cv = $bold(C)$
#let Gm = $bold(G)$

// 花体记号
#let calG = $cal(G)$
#let calO = $cal(O)$
#let calA = $cal(A)$
#let calH = $cal(H)$
#let calN = $cal(N)$
#let calS = $cal(S)$
#let calU = $cal(U)$
#let calV = $cal(V)$
#let calE = $cal(E)$
#let calP = $cal(P)$

// 常用式子
#let Onetwo = $cal(O)(N^1)$
#let Rn = $bb(R)^n$
#let Om = $bb(R)^m$
#let norm2(v) = $norm(v)$
#let ineqset = ${1, …, m}$
#let Prj = $Pi _calP$

// 定理类环境：粗体头 + 正文
#let thm(kind, body) = {
  set par(first-line-indent: 0em, spacing: 0.5em)
  text(weight: "bold")[#kind.]
  h(0.5em)
  body
}
#let proof(body) = {
  set par(first-line-indent: 0em, spacing: 0.5em)
  text(weight: "bold")[证明.]
  h(0.5em)
  body
  h(1fr)
  text(size: 9pt)[∎]
}
#let qed = { h(1fr); text(size: 9pt)[∎] }

// 编号公式助手：num 传带括号的字符串 "(13)"，编号原样右对齐
#let eqn(num, body) = block(
  width: 100%,
  above: 0.8em,
  below: 0.8em,
  grid(
    columns: (1fr, auto),
    gutter: 12pt,
    align: (center + horizon, right + horizon),
    body,
    text(size: 10pt)[#num],
  ),
)
