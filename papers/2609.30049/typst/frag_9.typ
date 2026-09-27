#import "macros.typ": *

// frag_9 —— 对应 GP_VAR_0923.tex 第 2343–2738 行
// 内容：6.4 向量值情形（带状态方程的线性弹性）、6.5 受约束情形（Stokes 问题）。
// 本节带编号公式只有 (32)、(33)；tex 2353、2358、2406、2499、2552 是 equation*，
// 连同原文所有 \[ \] 一律用 #eqnb（居中不编号）。
// 图（按原文出现顺序，Typst 自动编号为图 9–11）：<fig-eosrates>、<fig-elast>、<fig-elastrho>。
// 表（自动编号为表 2、表 3）：<tab-stokes-discrete>、<tab-stokes-m72>。

== 6.4　向量值情形：带状态方程的线性弹性

我们考察带体积变形的线性弹性问题，体积部分取 Murnaghan 状态方程的形式 @landau2012theory @murnaghan1944compressibility。位移场记作 $bold(u): Omega subset RR^d arrow.r RR^d$，其中 $d$ 是空间维数；区域 $Omega$ 用坐标 $x = (x^1, dots.c, x^d)$ 参数化。空间位移梯度 $gradient bold(u)$ 定义为

#eqnb[ $ gradient bold(u) _ "ij" = frac(partial u _ i, partial x ^ j), space i, j = 1, dots.c, d. $ ]

应变张量取 $gradient bold(u)$ 的对称部分

#eqnb[ $ gradient^"s" bold(u) = frac(1, 2)(gradient bold(u) + (gradient bold(u))^ "T"). $ ]

设应变能密度 $G$ 由体积部分与偏量部分相加而成

#eqnb[ $ G(gradient bold(u)) = Psi("div" bold(u)) + mu (gradient^"s" bold(u) : gradient^"s" bold(u) - frac(1, 3) ("div" bold(u))^ 2), $ ]

其中 $mu$ 是剪切模量。$Psi$ 只表示纯体积变形带来的能量密度，取作

#eqnb[ $ Psi(a) = frac(kappa, kappa _ 0) (frac((1 + a)^(kappa _ 0 + 1) - 1, kappa _ 0 + 1) - a), $ ]

这里 $kappa$ 是环境压力处的体积模量，$kappa_0$ 是体积模量对压力的导数（同样取在环境压力处）。求导即可看出，$Psi'$ 给出的压力正是 Murnaghan 状态方程

#eqnb[ $ p("div" bold(u)) = frac(kappa, kappa _ 0) ((1 + "div" bold(u))^(kappa _ 0) - 1). $ ]

我们把 $kappa$ 写成 $kappa = lambda + frac(2, 3) mu$，其中 $lambda$ 是 Lamé 常数。给定能量密度 $G$ 与体力 $bold(f)$，$Omega$ 内弹性体的平衡构型就是下面这个变分问题的极小元

#eqnb[ $ inf _ (bold(u) in H^1(Omega; RR^2)) brace.l J(bold(u)) = integral _ Omega G(gradient bold(u)) - bold(f) dot bold(u) dif x : bold(u) = bold(g) space "on" space partial Omega brace.r $ ]

数值实验取 $Omega = [0, 1]^2$，即 $d = 2$，弹性常数 $lambda = 0.5$、$mu = 0.1$。

$kappa_0 = 1$ 时 $Psi(a) = frac(kappa, 2) a^2$，这就是线性弹性情形。我们采用一个构造解

#eqn("(32)")[ $ bold(u)(x^1, x^2) = delta (sin(2 pi x^1) + sin(2 pi x^2), cos(2 pi x^1) + cos(2 pi x^2))^ "T", $ ]

它对应的体力为

#eqnb[ $ bold(f)(x^1, x^2) = 4 delta pi^2 mat(delim: "(", (lambda + 2 mu) sin(pi x^1) + mu sin(pi x^2); (lambda + 2 mu) cos(pi x^2) + mu cos(pi x^1)), $ ]

其中 $delta$ 取 $0.001$。为求解这个向量值问题，我们选对角形式的 $RR^(2 times 2)$ 值核，即 $bold(K)(x, y) = K(x, y) bold(I) _ (2 times 2)$，底层是一个标量值核 $K$。给定一组配点 $bold(x)$，核 $bold(K)$ 诱导的 Gram 矩阵 $bold(K)(bold(x), bold(x))$ 呈分块对角形式 $"diag"(K(bold(x), bold(x)), K(bold(x), bold(x)))$。我们在均匀配点网格上检验所提方法关于填充距离的收敛速率，结果见 @fig-eosrates；其中 $RR^(2 times 2)$ 值核分别由 Matérn-3/2 核与 Matérn-5/2 核构造。

#figure(
  placement: top,
  figc(image("fig/eos_rates.pdf", width: 12cm)),
  caption: [带 Murnaghan 状态方程的线性弹性：$kappa_0 = 1$ 时误差关于填充距离的收敛速率。],
) <fig-eosrates>

#figure(
  placement: top,
  figc(image("fig/nonlinear_elasticity.pdf", width: 16.2cm)),
  caption: [$kappa_0 = 2$ 的线性弹性。（从左到右）$L_2$ 范数的衰减、$H^1$ 半范数的衰减、$u_1$ 的点态误差、$u_2$ 的点态误差。],
) <fig-elast>

$kappa_0 = 2$ 时 $Psi(a) = frac(kappa, 6) a^3 + frac(kappa, 2) a^2$，此时体积模量随体积变形线性变化。构造解 $bold(u)(x^1, x^2)$ 在 $kappa_0 = 2$ 情形下继续沿用式 (32)，相应的合外力 $bold(f)$ 由该变分问题的欧拉–拉格朗日方程数值算出。我们在网格间距 $h = 0.05$ 的等距配点网格上，用长度尺度 $sigma = 1.0$ 的 Matérn-5/2 核执行算法 1，数值结果见 @fig-elast。需要强调的是，这个非二次的情形并不保证全局收敛，必须给解一个合适的初始猜测。$delta$ 很小时解的量级也小，因此我们把 $bold(z)$ 初始化为一组小幅标准高斯噪声。最后，我们再看算法 2 的稀疏求解器在 $kappa_0 = 2$ 情形下的精度。Gram 矩阵 $bold(K)(bold(x), bold(x))$ 是分块对角的，所以稀疏 Cholesky 分解可以直接对每个分块对角子块 $K(bold(x), bold(x))$ 分别进行。从 @fig-elastrho 可以清楚看到，稀疏求解器的精度与效率之间存在明显的折中。

#figure(
  placement: top,
  figc(image("fig/nonlinear_elasticity_rho.pdf", width: 12cm)),
  caption: [带状态方程的线性弹性：$kappa_0 = 2$ 时稀疏求解器误差关于 $rho$ 的衰减。],
) <fig-elastrho>

== 6.5　受约束情形：Stokes 问题

最后，我们在受不可压缩流动约束的定常 Stokes 问题上测试求解器。设 $Omega subset RR^2$ 是有界单连通开集，考虑最小化问题

#eqn("(33)")[ $ inf _ (u in cal(D)) brace.l J(bold(u)) = integral _ Omega frac(1, 2) nu D bold(u) : D bold(u) - bold(f) dot bold(u) dif x brace.r $ ]

其中容许集

#eqnb[ $ cal(D) = brace.l bold(u) in H^1(Omega; RR^2): "div" bold(u) = 0 space "in" space Omega, bold(u) = bold(b) space "on" space partial Omega brace.r $ ]

由满足不可压缩约束的函数组成。众所周知，存在静水压力 $p$，使得 $(bold(u), p)$ 在弱意义下满足下列欧拉–拉格朗日方程 @evans2022partial

#eqnb[ $ cases(-nu Delta bold(u) &= bold(f) - gradient p & space "in" space Omega, "div" bold(u) &= 0 & space "in" space Omega, bold(u) &= bold(b) & space "on" space partial Omega.) $ ]

这类方程的稳定数值方法（例如有限元）通常要采用混合离散，才能保证速度 $bold(u)$ 与压力 $p$ 的近似之间满足 inf-sup（#text(font: "New Computer Modern")[Ladyzhenskaya–Babuška–Brezzi]）条件 @braess2001finite @trask2018compatible。

本实验要直接在容许集上最小化能量，从而解出速度场 $bold(u)$。具体地，取区域 $Omega = [-1, 1]^2$、$nu = 1$，外力为

#eqnb[ $ bold(f)(x) = bold(f)(x^1, x^2) = (-3 |x^1| x^2 + 1, frac(3, 2) "sgn"(x^1) (x^2)^ 2 + frac(3, 2) x^1 |x^1|)^ "T" in H^(-1)(Omega; RR^2), $ ]

其中 $"sgn"(x)$ 是符号函数

#eqnb[ $ "sgn"(a) = cases(-1 & "若" a < 0, 0 & "若" a = 0, + 1 & "若" a > 0.) $ ]

容易验证极小元为

#eqnb[ $ bold(u)(x) = bold(u)(x^1, x^2) = (frac(1, 2) (x^1)^ 2 |x^1| x^2, -frac(3, 4) x^1 |x^1| (x^2)^ 2)^ "T", $ ]

相应的边界数据 $bold(b)$ 随之给出。注意解 $bold(u)$ 属于 $H^1(Omega; RR^2)$ 却不属于 $C^2(Omega; RR^2)$，因此它并不满足欧拉–拉格朗日方程。

用核方法施加无散约束有两条路子。第一条在有限个配点上强加该约束，得到一个最优恢复表述

#eqnb[ $
  "min" _ (bold(u) in cal(U)) norm(bold(u)) _ cal(U) \
  "满足" quad bold(u)(x _ i) = z _ i, space i = 1, dots.c, M _ Omega space "(内部)" \
  quad "div" bold(u)(x _ i) = 0, space i = 1, dots.c, M _ Omega space "(无散)" \
  quad bold(u)(x _ i) = bold(b)(x _ i), space i = M _ Omega + 1, dots.c, M space "(边界)"
$ ]

给定 $RR^(2 times 2)$ 值核 $bold(K)$，该问题有唯一解

#eqnb[ $ bold(u)(x) = bold(K)(x, bold(phi)) bold(K)^ (-1)(bold(phi), bold(phi)) mat(delim: "(", bold(z); bold(0); bold(b)(bold(x) _ (partial Omega))), $ ]

这里的观测泛函是

#eqnb[ $ bold(phi) = (delta _ (x _ 1), dots.c, delta _ (x _ (M _ Omega)), delta _ (x _ 1) ∘ "div", dots.c, delta _ (x _ (M _ Omega)) ∘ "div", delta _ (x _ (M _ Omega + 1)), dots.c, delta _ (x _ M)), $ ]

三段依次对应内部配点上的观测、无散约束对应的观测和边界配点上的观测。与前面的例子相同，我们取 $bold(K)(x, y) = K(x, y) bold(I) _ (2 times 2)$，其中 $K(x, y)$ 是 Matérn-7/2 核，配点网格等距，长度尺度 $sigma$ 取 $1.0$。关于填充距离的逼近误差见 @tab-stokes-discrete。结果表明，随着配点数增加，方法出现明显的不收敛行为；特别是 $"div" bold(u)$ 的 $L^2$ 误差不趋于零。细看 $"div" bold(u)$ 就能发现，在配点之间的区域里 $"div" bold(u)(x)$ 完全不受控制。我们猜测，不收敛的原因是：用有限个配点约束去逼近无散空间本身就不稳定。

#figure(
  placement: top,
  kind: table,
  supplement: [表],
  table(
    columns: 7,
    align: (left, center, center, center, center, center, center),
    [填充距离 $h$], [$1/10$], [$1/15$], [$1/20$], [$1/25$], [$1/30$], [$1/35$],
    [$norm(bold(u) - bold(u) _ h) _ (L_2)$], [$2.27 times 10 ^ (-1)$], [$2.29 times 10 ^ (-1)$], [$2.38 times 10 ^ (-1)$], [$2.47 times 10 ^ (-1)$], [$2.50 times 10 ^ (-1)$], [$2.59 times 10 ^ (-1)$],
    [$norm(D bold(u) - D bold(u) _ h) _ (L_2)$], [$6.30 times 10 ^ (-1)$], [$6.22 times 10 ^ (-1)$], [$6.30 times 10 ^ (-1)$], [$6.40 times 10 ^ (-1)$], [$6.44 times 10 ^ (-1)$], [$6.56 times 10 ^ (-1)$],
    [$norm("div" bold(u) _ h) _ (L_2)$], [$4.97 times 10 ^ (-1)$], [$4.92 times 10 ^ (-1)$], [$4.93 times 10 ^ (-1)$], [$4.96 times 10 ^ (-1)$], [$4.97 times 10 ^ (-1)$], [$5.01 times 10 ^ (-1)$],
  ),
  caption: [用非无散核求解 Stokes 问题的逼近误差。],
) <tab-stokes-discrete>

无散约束不必一定靠配点来施加，也可以直接写进核的设计里。给定径向形式的实值核 $K$，即 $psi(r) = K(x, y)$、$r = x - y in RR^2$，可以构造一个 $RR^(2 times 2)$ 值的无散核 @wendland2009divergence

#eqnb[ $
  bold(K) _ ("df") (x, y) = (gradient^ 2 psi)(r) - "tr"(gradient^ 2 psi)(r) bold(I) _ (2 times 2) = mat(delim: "(", -frac(partial^ 2 psi, partial r _ 2^ 2) & frac(partial^ 2 psi, partial r _ 1 partial r _ 2); frac(partial^ 2 psi, partial r _ 1 partial r _ 2) & -frac(partial^ 2 psi, partial r _ 1^ 2))
$ ]

于是对矩阵每一行取散度都有 $"div" _ x (bold(K) _ ("df") (x, y)) = 0$，无散约束自动满足。数值实验中基核 $K$ 仍取 Matérn-7/2 核，长度尺度 $sigma = 1.0$。@tab-stokes-m72 给出了用无散核的结果：配点网格一加密，无散约束就满足得很好；近似的 $L_2$ 范数与 $H^1$ 半范数也都随配点数增加而下降。

#figure(
  placement: top,
  kind: table,
  supplement: [表],
  table(
    columns: 7,
    align: (left, center, center, center, center, center, center),
    [填充距离 $h$], [$1/10$], [$1/15$], [$1/20$], [$1/25$], [$1/30$], [$1/35$],
    [$norm(bold(u) - bold(u) _ h) _ (L_2)$], [$1.80 times 10 ^ (-2)$], [$1.07 times 10 ^ (-2)$], [$7.62 times 10 ^ (-3)$], [$5.95 times 10 ^ (-3)$], [$5.36 times 10 ^ (-3)$], [$4.20 times 10 ^ (-3)$],
    [$norm(D bold(u) - D bold(u) _ h) _ (L_2)$], [$1.82 times 10 ^ (-1)$], [$1.39 times 10 ^ (-1)$], [$1.19 times 10 ^ (-1)$], [$1.07 times 10 ^ (-1)$], [$1.03 times 10 ^ (-1)$], [$9.21 times 10 ^ (-2)$],
    [$norm("div" bold(u) _ h) _ (L_2)$], [$0$], [$0$], [$0$], [$0$], [$0$], [$0$],
  ),
  caption: [用无散核求解 Stokes 问题的逼近误差。],
) <tab-stokes-m72>
