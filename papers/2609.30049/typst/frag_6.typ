// frag_6：第 5 节 理论基础（引子）+ 5.1 极小元的存在性（tex 1538–1901 行）
// 本节公式 (22)–(25)；注记 5.1、引理 5.1（含证明）、定理 5.1（含证明）
// 交叉引用：eqn:var-problem-Sobolev=(5)，eqn:finite-dim-var=(9)，eqn:uz=(7)，eqn:u-star=(10)
#import "macros.typ": *

= 5　理论基础

本节用 Γ–收敛理论为所提数值方法建立理论基础（附录 B 给出该理论的简要回顾）。要证两件事：1) 对每个 $M in ℕ_+$，有限维问题 (9) 存在极小元 $u _M^*$；2) 当 $M → ∞$ 时，$u _M^*$ 收敛到无穷维问题 (5) 的极小元 $u^*$。本节中 $| ⋅ |$ 一律表示欧氏 $2$–范数。下面假设泛函 $J$ 满足通常的下述条件：

#block(inset: (left: 1.5em), spacing: 0.6em)[
  #set par(first-line-indent: 0em)
  *C.1*　$G(x, u, xi)$ 联合光滑连续，即 $G in C^1 (overline(Omega) times ℝ times ℝ^d)$。

  *C.2*　对每个 $x in overline(Omega)$，映射 $(u, xi) → G(x, u, xi)$ 严格凸。

  *C.3*　存在常数 $alpha_1 > 0$ 与 $alpha_2$，使得
  #eqnb[ $ G(x, u, xi) >= alpha_1 |xi|^p + alpha_2, quad forall (x, u, xi) in overline(Omega) times ℝ times ℝ^d. $ ]

  *C.4*　泛函 $J$ 在 $W^(1,p)(Omega)$ 上强连续，即
  #eqnb[ $ "lim" _(M → ∞) J(u_M) = J(u) quad "只要" quad "lim" _(M → ∞) ‖u_M - u‖ _(W^(1,p)(Omega)) = 0. $ ]
]

#thm("注记 5.1")[
  只要能量密度 $G$ 满足条件 C.1、C.2 与 C.3，极小元的存在唯一性就有保证。条件 C.3 至关重要，泛函 $J$ 的强制性——即当 $‖u‖ _(W _0^(s,p)(Omega)) → ∞$ 时 $J(u) → ∞$——正是靠它来证明。进一步，凸性条件 C.2 与条件 C.3 合起来蕴含 $J$ 的弱下半连续性：只要 $u_M$ 在 $W^(1,p)(Omega)$ 中弱收敛于 $u$，就有 $"lim inf" _M J(u_M) >= J(u)$。最后，强连续性条件 C.4 通常可由 $G$ 的一个附加的上界增长条件推出。为行文简洁，这里略去这些细节，变分法直接方法的更多内容可参考文献 @dacorogna2007direct。
]

回顾：$cal(U)$ 是核 $K$ 诱导的 RKHS，$bold(x) = {x_1, …, x_M}$ 是配点集。对每个 $i = 1, …, M$，记 $psi _i in cal(U)$ 为下面第 $i$ 个最优恢复问题的解

#eqn("(22)")[
  $
    & min _(u in cal(U)) ‖u‖ _cal(U) \
    "满足" & u (x _j) = 1, && "若" j = i, \
    & u (x _j) = 0, && "若" j != i.
  $
]

这些线性无关的解 $psi _i, i = 1, …, M$ 张成 $M$ 维子空间

#eqnb[ $ cal(U) _M ≜ "span" {psi_1, …, psi_M} subset cal(U). $ ]

为套用 Γ–收敛理论，定义一列泛函 $F _M : W^(1,p)(Omega) → (-∞, ∞]$：

#eqn("(23)")[ $ F _M (u) = cases( J(u) &"若" u in cal(U) _M "且" u (x _i) = 0 quad "其中" i = M _Ω + 1 dots.h M, infinity &"否则".) $ ]

再定义泛函 $F : W^(1,p)(Omega) → (-∞, ∞]$：

#eqn("(24)")[ $ F(u) = cases( J(u) &"若" u in W _0^(1,p)(Omega), infinity &"否则".) $ ]

按定义，$F$ 有唯一极小元，恰好就是变分问题 (5) 的极小元 $u^*$。

== 5.1　极小元的存在性

下面来证式 (23) 定义的 $F _M$ 存在极小元，也就是式 (9) 存在极小元。先给出一个二次型估计，它相当于有限维情形下的强制性。

#thm("引理 5.1")[
  设 $K : overline(Omega) times overline(Omega) → ℝ$ 为正定核。若序列 ${bold(z)_n} subset ℝ^(M_Ω)$ 满足 $"lim" _n |bold(z)_n| = ∞$，则 $"lim" _n integral _Omega |gradient u _M ^bold(z)_n (x)|^2 dif x = ∞$。
]

#proof[
  注意由定义 (7) 有
  #eqnb[ $ integral _Omega |gradient u _M ^bold(z)_n (x)|^2 dif x = mat(bold(z)_n; bold(0))^"T" bold(M) mat(bold(z)_n; bold(0)) = bold(z)_n^"T" bold(M)_11 bold(z)_n >= 0, $ ]
  其中
  #eqnb[ $ bold(M) = integral _Omega K(bold(phi), bold(phi))^(-"T") gradient _x K(x, bold(phi))^"T" gradient _x K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) dif x in ℝ^(M times M) $ ]
  而 $bold(M)_11 in ℝ^(M_Ω times M_Ω)$ 是 $bold(M)$ 的左上角子块。$bold(M)$ 半正定，$bold(M)_11$ 自然也是半正定。我们断言它实际上是正定的。事实上，$integral _Omega |gradient u _M ^bold(z)_n (x)|^2 dif x = 0$ 意味着
  #eqnb[ $ u _M ^bold(z)_n (x) = K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) mat(bold(z)_n; bold(0)) ≡ C $ ]
  对某个常数 $C$ 成立。但 $u _M ^bold(z)_n$ 在边界配点处为零，故 $C = 0$，进而 $bold(z)_n = bold(0)$（注意 $bold(z)_n = u _M ^bold(z)_n (bold(x)_Ω)$）。于是存在常数 $alpha > 0$（即 $bold(M)_11$ 的最小特征值），使得
  #eqnb[ $ integral _Omega |gradient u _M ^bold(z)_n (x)|^2 dif x >= alpha |bold(z)_n|^2. $ ]
  因此当 $|bold(z)_n| → ∞$ 时，$integral _Omega |gradient u _M ^bold(z)_n (x)|^2 dif x → ∞$。
]

接下来证明如下存在性结果。

#thm("定理 5.1")[
  设 $K : overline(Omega) times overline(Omega) → ℝ$ 为正定核，其 RKHS $cal(U)$ 连续嵌入 $W^(1,p)(Omega)$。再设 $cal(U)$ 含有变分问题 (5) 的唯一极小元 $u^*$。则对每个固定的 $M in ℕ_+$，极小化问题
  #eqn("(25)")[ $ "inf" _(u in cal(U)_M) F _M (u) $ ]
  存在由式 (10) 定义的极小元 $u _M^*$。
]

#proof[
  回顾 $u _M ^bold(z)$ 的定义 (7)，并设函数 $I _M : ℝ^(M_Ω) → ℝ$ 为
  #eqnb[ $ I _M (bold(z)) ≜ J (u _M ^bold(z)) = F _M (u _M ^bold(z)), $ ]
  最后一个等号成立，是因为 $u _M ^bold(z) in cal(U)_M$ 且当 $i = M_Ω + 1, …, M$ 时 $u _M ^bold(z)(x_i) = 0$。下面证明：$I _M$ 下半连续，且存在一个非空紧的下水平集 $cal(S)$，$I _M$ 在其上某点 $u _M^*$ 处取到下确界。

  *下半连续性。*　设 ${bold(z)_n}$ 是 $ℝ^(M_Ω)$ 中收敛于 $bold(z)$ 的序列。要证下半连续，即证 $"lim inf" _n I _M (bold(z)_n) >= I _M (bold(z))$。

  设 $lim _n |bold(z)_n| = |bold(z)| < ∞$，则序列 ${bold(z)_n}$ 关于 $n$ 有界。于是 RKHS 范数序列
  #eqnb[ $ {‖u _M ^bold(z)_n ‖_cal(U)^2} = {bold(z)_n^"T" K^(-1)(bold(x), bold(x)) bold(z)_n} $ ]
  收敛于有限极限，从而关于 $n$ 有界。$u _M ^bold(z)$ 关于 $bold(z)$ 线性，所以对一切 $x in Omega$ 立有 $u _M ^bold(z)_n (x) → u _M ^bold(z) (x)$。范数有界加上逐点收敛，就得到 $n → ∞$ 时 $u _M ^bold(z)_n ⇀ u _M ^bold(z)$ 于 $cal(U)$ 中弱收敛。又由假设 $cal(U)$ 连续嵌入 $W^(1,p)(Omega)$，进一步有 $n → ∞$ 时 $u _M ^bold(z)_n ⇀ u _M ^bold(z)$ 于 $W^(1,p)(Omega)$ 中弱收敛。对 $J$ 应用弱下半连续性，即得下极限不等式
  #eqnb[ $ "lim inf" _n I _M (bold(z)_n) = "lim inf" _n J (u _M ^bold(z)_n) >= J (u _M ^bold(z)) = I _M (bold(z)). $ ]

  *强制性。*　先证 $"inf" _bold(z) I _M (bold(z))$ 有上界。设 $u^* in cal(U)$ 为 $J$ 的极小元，记 $bold(z)^† = u^*(bold(x)_Ω) in ℝ^(M_Ω)$，即把 $u^*$ 在各内部配点处取值所得的向量。按定义，$u _M ^bold(z)^† in cal(U)_M$，且当 $i = M_Ω + 1, …, M$ 时 $u _M ^bold(z)^†(x_i) = 0$，于是
  #eqnb[ $ "inf" _(bold(z) in ℝ^(M_Ω)) I _M (bold(z)) = "inf" _(u _M ^bold(z) in cal(U)_M) F _M (u _M ^bold(z)) <= J (u^bold(z)^†) < ∞. $ ]
  因此，$I _M (bold(z))$ 的极小化可以限制在 $I _M$ 的下水平集
  #eqnb[ $ cal(S) = {bold(z) in ℝ^(M_Ω): I _M (bold(z)) <= J (u^bold(z)^†)} $ ]
  上进行。$bold(z)^† in cal(S)$，故 $cal(S)$ 显然非空。再断言 $cal(S)$ 紧。$I _M$ 关于 $bold(z)$ 下半连续，所以 $cal(S)$ 自动是闭集。有界性用反证法：若 $cal(S)$ 无界，则可取序列 $bold(z)_n in cal(S)$ 使 $|bold(z)_n| → ∞$。由 Jensen 不等式，
  #eqnb[ $ I _M (bold(z)_n) >= integral alpha_1 |gradient u _M ^bold(z)_n (x)|^p dif x - |alpha_2| |Omega| >= alpha_3 (integral |gradient u _M ^bold(z)_n (x)|^2 dif x)^(p/2) - |alpha_2| |Omega| $ ]
  对某个 $alpha_3 > 0$ 成立。令 $n → ∞$，由引理 5.1 得 $I _M (bold(z)_n) → ∞$，这与 $cal(S)$ 的定义矛盾！这就证明了 $cal(S)$ 是紧集。下半连续函数在紧集上能取到最小值，故 $I _M$ 在某 $u _M^* in cal(S)$ 处取到最小值。
]
