#import "macros.typ": *
// frag_3.typ —— 原文 GP_VAR_0923.tex 第 687–942 行
// 内容：第 3 节节首段落 + 3.1 最优恢复表述
// 本片段公式 (5)–(12)（编号照 CONVENTIONS 第 7 节总表）；tex 908、917、925 行的 equation* 用 #eqnb 不编号
// 环境：算法 1、注记 3.1、注记 3.2、例 3.1

= 3　最优恢复在变分问题中的应用

第 2 节用最优恢复求解线性与非线性 PDE，这一思路恰好可以移植到变分问题上。本节据此给出一个基于最优恢复的两步求解流程。这里非用最优恢复不可，关键在于它能把解上附加的各类约束自然而然地纳入框架。

== 3.1　最优恢复表述

为叙述简便，先考虑一个带 Dirichlet 边界条件的模型变分问题：

#eqn("(5)")[
  $ inf _ (u in W^(1,p)(Ω)) brace.l J(u) = integral _ Ω G(x, u, gradient _ x u) dif x quad "满足" quad u = 0 quad "在" partial Ω "上" brace.r $
]

这里只写了零边界条件；形如 $cal(B) u = b$（按迹的意义理解）的更复杂边界条件，用同样的办法就能纳进来。$W^(1,p)(Ω)$（$p in (1, ∞)$）是通常的 Sobolev 空间，其中的函数一阶弱导数的 $L^p$ 范数有限。这个极小化问题在 $Ω$ 内部不含任何逐点约束（当然，前提是不去动用欧拉–拉格朗日方程），所以第 2 节那套面向 PDE 的最优恢复方法没法直接用。为此，我们把基于最优恢复的变分问题求解过程拆成两步。

和求解 PDE 时一样，我们在内部配点 $bold(x) _ Ω$ 处取 $M _ Ω$ 个观测泛函 $bold(phi) _ Ω$，在边界点 $bold(x) _ "∂Ω"$ 处取 $M _ "∂Ω"$ 个观测泛函 $bold(phi) _ "∂Ω"$，并记 $M = M _ Ω + M _ "∂Ω"$。边界条件按经典意义逐点施加，因此把边界观测泛函 $bold(phi) _ "∂Ω"$ 直接取成 $bold(x) _ "∂Ω"$ 处的点赋值泛函最为自然。与面向 PDE 的最优恢复相比，本框架并不要求 $bold(phi) _ (M _ Ω)$ 一定是配点型泛函。第一步是求解如下最优恢复问题

#eqn("(6)")[
  $ min _ (u in cal(U)) norm(u)_cal(U) \
    "满足" & [phi_i, u] = z_i, quad i = 1, dots.c, M _ Ω \
    & [phi_i, u] = 0, quad i = M _ Ω + 1, dots.c, M $
]

其中 $bold(z) = (z _ 1, dots.c, z _ (M _ Ω))^"T"$ 是与 $bold(phi) _ Ω$ 相配套的隐变量。由表示定理，上述最优恢复问题有唯一解

#eqn("(7)")[
  $ u _ M ^(bold(z))(x) = K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) mat(bold(z); 0) $
]

上标 $bold(z)$ 是为了强调解依赖隐变量 $bold(z)$。实际物理系统往往还在有限个点 $x$ 处给出含噪实验观测 $tilde(u)(x) = u(x) + epsilon$。这类关于解的含噪约束，只需再补若干观测泛函 $phi_i$ 就能直接写进最优恢复表述，可见该框架在构造试探空间时相当灵活。此外，框架也不要求每个 $phi_i$ 都是局部的微分算子：$phi_i$ 可以是某个检验函数诱导的积分算子，于是适用范围就超出了（内部）配点这一设定。例如，可以把观测泛函 $phi_i in cal(U)^*$ 取成如下形式

#eqn("(8)")[
  $ phi_i (u) ≝ integral _ Ω v _ i (x) u (x) dif x, quad i = 1, dots.c, M _ Ω $
]

其中 $v_i in L^2(Ω)$ 是一组线性无关的检验函数。事实证明，这样的推广对许多应用都至关重要，比如求解系数粗糙的椭圆 PDE @owhadi2017gamblets @owhadi2017multigrid，以及外力粗糙的非线性 PDE @baptista2025solving。

下面进入两步流程的第二步。定义函数 $I _ M : ℝ^(M _ Ω) → ℝ$

#eqn("(9)")[
  $ I _ M (bold(z)) ≝ J (u _ M ^(bold(z))) = integral _ Ω G (x, u _ M ^(bold(z))(x), gradient _ x u _ M ^(bold(z))(x)) dif x $
]

并求如下极小化问题的极小元

#eqnb[ $ bold(z)^* in "argmin" _ (bold(z) in ℝ^(M _ Ω)) I _ M (bold(z)) $ ]

边界条件在 $bold(x) _ "∂Ω"$ 处已由插值函数 $u _ M ^(bold(z))$ 自动满足。把 $bold(z)^*$ 代回式 (7) 的最优恢复解，便得到最终解，记作

#eqn("(10)")[ $ u _ M ^* ≝ u _ M ^(bold(z)^*) $ ]

下标 $M$ 表示该解基于 $M$ 个观测。本文用 Newton 法 @nocedal2006numerical 关于 $bold(z)$ 极小化 $I _ M$，因此需要算出 $I _ M$ 的梯度与 Hessian

#eqn("(11)")[
  $ & gradient _ (bold(z)) I _ M (bold(z)) = integral _ Ω frac(partial G, partial u) gradient _ (bold(z)) u _ M ^(bold(z)) + sum _ (j = 1)^d frac(partial G, partial xi _ j) gradient _ (bold(z)) partial _ j u _ M ^(bold(z)) dif x in ℝ^(1 times M _ Ω) \
    & gradient^2 _ (bold(z)) I _ M (bold(z)) = integral _ Ω frac(partial^2 G, partial u^2) (gradient _ (bold(z)) u _ M ^(bold(z)))^"T" gradient _ (bold(z)) u _ M ^(bold(z)) \
    & quad + 2 sum _ (j = 1)^d frac(partial^2 G, partial xi _ i partial u) (gradient _ (bold(z)) partial _ j u _ M ^(bold(z)))^"T" gradient _ (bold(z)) u _ M ^(bold(z)) \
    & quad + sum _ (i, j = 1)^d frac(partial^2 G, partial xi _ i partial xi _ j) (gradient _ (bold(z)) partial _ i u _ M ^(bold(z)))^"T" gradient _ (bold(z)) partial _ j u _ M ^(bold(z)) dif x in ℝ^(M _ Ω times M _ Ω) $
]

其中

#eqn("(12)")[
  $ & gradient _ (bold(z)) u _ M ^(bold(z))(x) = K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) mat(bold(I) _ (M _ Ω times M _ Ω); bold(O) _ (M _ "∂Ω" times M _ Ω)) in ℝ^(1 times M _ Ω) \
    & gradient _ (bold(z)) partial _ j u _ M ^(bold(z))(x) = partial _ j K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) mat(bold(I) _ (M _ Ω times M _ Ω); bold(O) _ (M _ "∂Ω" times M _ Ω)) in ℝ^(1 times M _ Ω) $
]

二者都与 $bold(z)$ 无关，原因就在于 $u _ M ^(bold(z))$ 关于 $bold(z)$ 是线性的。这里用 $partial _ j u _ M ^(bold(z))$ 表示 $u _ M ^(bold(z))$ 关于 $x$ 的第 $j$ 个分量的偏导，即 $partial _ j u _ M ^(bold(z)) = frac(partial u _ M ^(bold(z)), partial x^j)$。式 (11) 中梯度与 Hessian 里的积分，我们在背景网格上用 Gauss–Legendre 求积公式计算。需要强调的是，这个背景求积网格只用于计算积分。更专门的核方法/Bayesian 求积公式同样可以算这些积分 @rasmussen2003bayesian @glaubitz2021towards @smola2007hilbert，留待后续工作考察。所得算法见算法 1。

#block(
  width: 100%,
  inset: (x: 1.4em, y: 1em),
  radius: 2pt,
  stroke: 0.6pt + gray,
)[
  #par(first-line-indent: 0em)[#text(weight: "bold")[算法 1　基于最优恢复的变分求解器]]
  #set par(first-line-indent: 0em)
  #set enum(numbering: "1.", indent: 0pt, body-indent: 1.8em)
  + 选取核 $K$ 及其尺度参数 $sigma$。
  + 计算 Cholesky 分解 $K(bold(phi), bold(phi)) = L^"T" L$。
  + *初始化*：令迭代计数 $n = 0$，给定初值 $bold(z) _ 0$。
  + 当 $I _ M (bold(z) _ n)$ 未收敛时，反复执行第 5–9 步。
  + 按式 (11) 计算 $gradient _ (bold(z)) I _ M (bold(z) _ n)$ 与 $gradient^2 _ (bold(z)) I _ M (bold(z) _ n)$。
  + 更新 $bold(z) _ n ← bold(z) _ n - [gradient^2 _ (bold(z)) I _ M (bold(z) _ n)]^(-1) gradient _ (bold(z)) I _ M (bold(z) _ n)$。
  + 按式 (7) 更新 $u _ M ^(bold(z) _ n)$。
  + 计算 $I _ M (bold(z) _ n) = J (u _ M ^(bold(z) _ n))$。
  + 令 $n ← n + 1$，返回第 4 步。
]

对上述算法，有以下几点观察。

#thm("注记 3.1")[
  算法 1 的主要计算瓶颈在于 Gram 矩阵 $K(bold(phi), bold(phi))$ 的求逆，这需要 $cal(O)(M^3)$ 次浮点运算。各类稀疏近似都可以用来压低这一开销 @quinonero2005unifying。下一小节介绍稀疏 Cholesky 分解在本文的具体应用。
]

#thm("注记 3.2")[
  该算法可以自然地推广到向量值情形，即解为 $bold(u) : Ω → ℝ^N$（数值例子见 6.4 小节与 6.5 小节）。设 $bold(K) : overline(Ω) × overline(Ω) → ℝ^(N times N)$ 是一个矩阵值核，它诱导出配备范数 $norm(·)_cal(U)$ 的向量值 RKHS $cal(U)$ @alvarez2012kernels @micchelli2005learning @owhadi2023ideas。最简的取法是取对角核 $bold(K)(x, y) = K(x, y) bold(I) _ (N times N)$，其中 $K$ 为某个标量值核。向量值的最优恢复问题完全可以照式 (6) 的方式写出。为完整起见，附录 A 简要回顾矩阵值核。
]

#thm("例 3.1")[
  这里拿一个简单泛函——二次型 $J$——来说明方法的具体运作。此时式 (5) 的极小化问题化为

  #eqnb[
    $ inf _ (u in H^1(Ω)) brace.l J(u) = integral _ Ω 1/2 |gradient _ x u(x)|^2 dif x quad "满足" quad u(x) = b(x) quad "在" partial Ω "上" brace.r $
  ]

  其中 $H^1(Ω) ≝ W^(1, 2)(Ω)$。假定极小元 $u^*$ 落在 RKHS $cal(U) subset H^1(Ω)$ 内，并把观测泛函全取为点赋值泛函，即对所有 $i = 1, dots.c, M$ 有 $phi_i = delta _ (x _ i)$。于是最优恢复问题化为

  #eqnb[
    $ min _ (u in cal(U)) norm(u)_cal(U) \
      "满足" & u(x _ i) = z _ i, quad i = 1, dots.c, M _ Ω \
      & u(x _ i) = b(x _ i), quad i = M _ Ω + 1, dots.c, M $
  ]

  函数 $I _ M : ℝ^(M _ Ω) → ℝ$ 随之变成

  #eqnb[
    $ I _ M (bold(z)) = integral _ Ω & 1/2 bold(y)^"T" K(bold(x), bold(x))^(-1) gradient _ x K(x, bold(x))^"T" \
      & gradient _ x K(x, bold(x)) K(bold(x), bold(x))^(-1) bold(y) dif x $
  ]

  其中 $bold(y) = (bold(z)^"T", b(bold(x) _ "∂Ω")^"T")^"T" in ℝ^(M times 1)$。注意 $I _ M (bold(z))$ 是 $bold(z)$ 的二次函数，因此只需一步 Newton 迭代即可求得唯一极小元。
]
