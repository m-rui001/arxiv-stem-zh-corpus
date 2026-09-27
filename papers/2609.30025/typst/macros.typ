// 2609.30025 Janus 颗粒阵列取向有序（经典罗盘自旋系统）中文译本共用宏
// 编号公式助手：num 传带括号的字符串 "(13)"，编号原样右对齐
#let eqn(num, body) = block(
  width: 100%, above: 0.8em, below: 0.8em,
  grid(columns: (1fr, auto), gutter: 12pt,
    align: (center + horizon, right + horizon),
    body, text(size: 10pt)[#num]),
)

#let figc(img) = block(width: 100%, inset: 0pt)[#align(center, img)]
