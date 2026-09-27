// 附录 C：最小成本燃气输运问题（对应 Main.tex 817--888 行）
// 编号公式：(32)　表：<tab-c1> <tab-c2>
// 记号：cal(S) 供气集，cal(R) 需求集，cal(L)^(k) 场景 k 下的存活边集，cal(K) 故障场景集，v_ref 参考节点。
// 注：`#include` 不继承外层作用域，故本片段需自行导入共用宏（不重复定义，不改 set 规则）。
#import "macros.typ": *
// 编号一律由 #eqn 助手硬编码给出，关掉本片段内的公式自动编号，避免与硬编码编号重复。
#set math.equation(numbering: none)
// 上标里的场景号要保留圆括号：Typst 会把 `^(k)` 的括号当成分组吞掉，须写 `^("("k")")`。

= 附录 C　最小成本燃气输运问题

本文进一步在最小成本燃气输运问题上验证所提方法，算例取自 GasLib-135 基准 @gaslib。给定燃气网络 $G=(V,E)$：节点 $v ∈ V$ 表示一个供气点或需求点，边 $e ∈ E$ 各带容量上界与输运成本。优化目标是在满足节点流量平衡约束与边容量约束的前提下，寻求成本最低的流量分配方案。每个测试实例对应一种运行场景，需求水平互不相同，拓扑也可能改变，例如删去某条边或计入故障。为考察不同网络工况下的泛化能力，已见与未见场景一并纳入评估。优化问题建模如式 (32)：

#eqn("(32)")[
  $
    min _(bold(g)^("("k")"), bold(f)^("("k")")) & sum _(s in cal(S)) alpha _s g _s^("("k")") + sum _(ell in cal(L)^("("k")")) rho _ell abs(f _ell^("("k")")) \
    "s.t." & sum _(s in cal(S(v))) g _s^("("k")") + sum _(ell in cal(L)^("("k")")) A _(v ell)^("("k")") f _ell^("("k")") = d _v, quad forall v in cal(V) ∖ {v_"ref"} \
    & sum _(s in cal(S)) g _s^("("k")") = sum _(r in cal(R)) d _r \
    & 0 <= g _s^("("k")") <= overline(g) _s, quad forall s in cal(S) \
    & -overline(f) _ell <= f _ell^("("k")") <= overline(f) _ell, quad forall ell in cal(L)^("("k")") \
    & k in {0} ∪ cal(K).
  $
]
其中
#block(width: 100%, above: 0.4em, below: 0.4em)[
  $ cal(L)^("("0")") = cal(L), quad cal(L)^("("k")") = cal(L) ∖ {k}, quad k in cal(K). $
]

#figure(
  supplement: [表],
  {
    set text(size: 8.5pt)
    set par(justify: false)
    table(
      columns: (2.2cm, 2.7cm, 3.2cm, 3.4cm, 3.0cm),
      align: (left, center, center, center, center),
      inset: (x: 3pt, y: 4pt),
      table.header[方法][前向时间 (ms)][最大等式违背][最大不等式违背][最优性间隙 (%)],
      [HGNN], [3.810~±~2.074], [473.6~/~2337.0], [100.5~/~416.8], [0.008~/~0.009],
    )
  },
  caption: [HGNN 单独预测在最小成本燃气输运问题上的预测质量。除前向时间外，各指标均按“已见 / 未见”格式给出。],
) <tab-c1>

#figure(
  supplement: [表],
  {
    set text(size: 8pt)
    set par(justify: false)
    table(
      columns: (1.6cm, 1.9cm, 1.5cm, 1.6cm, 1.9cm, 1.5cm, 1.6cm, 1.5cm, 2.4cm),
      align: (left, center, center, center, center, center, center, center, center),
      inset: (x: 2.5pt, y: 4pt),
      table.header[方法][等式投影 (ms)][等式加速比][不等式迭代][不等式时间 (ms)][不等式加速比][SKM 时间 (ms)][SKM 加速比][最优性间隙 (%)],
      [T-SKM], [2.19~±~1.06], [1.00×], [15.21 (128)], [0.96~±~1.22], [1.00×], [3.15], [1.00×], [0.006~/~0.019],
      [AT-SKM], [0.53~±~0.35], [4.13×], [5.33 (78)], [0.37~±~0.71], [2.59×], [0.90], [3.50×], [0.006~/~0.019],
    )
  },
  caption: [SKM 层在最小成本燃气输运问题上的性能。最优性间隙给出均值，格式为“已见 / 未见”。],
) <tab-c2>

由 @tab-c1 可见，只用 HGNN 预测时平均最优性间隙很小，最坏情形下的等式与不等式违背却相当严重，未见场景尤其如此；仅靠神经网络的直接预测，达不到安全攸关约束优化对可行性的要求。

@tab-c2 则显示，T-SKM-Net 与 AT-SKM-Net 在已见与未见场景上均做到零等式违背、零不等式违背。相对 T-SKM-Net，AT-SKM-Net 把等式投影时间由 $2.19$ ms 压到 $0.53$ ms，加速 $4.13×$；不等式迭代时间由 $0.96$ ms 降到 $0.37$ ms，加速 $2.59×$。总体来看，SKM 的总计算时间从 $3.15$ ms 缩短至 $0.90$ ms，相当于 $3.50×$ 的加速，严格可行性得以保持，平均最优性间隙也基本持平。
