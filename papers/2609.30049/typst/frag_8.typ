#import "macros.typ": *
// frag_8：第 6 节数值实验引子 + 6.1–6.3（tex 2120–2342）
// 本节公式 (30)–(31)；图 4–8；表 1。算法 1 = 基本求解器，算法 2 = 稀疏求解器，算法 3 = 预条件求解器。

= 6　数值实验

本节在若干基准问题上检验前面提出的算法。除另有说明外，本节所有实验都使用均匀网格上的配置点，计算一律采用双精度。求积方面，所有实验都用 $61 times 61$ 的求积网格，并在网格的每个单元上取 $2$ 点 Gauss 求积。

== 6.1　Poisson 方程

第一个演示是二维 Poisson 方程对应的变分问题，区域取 $Ω = [0, 1]^2$，即

#eqnb[$
  "inf" _ (u in "H" _0^1 (Ω)) brace.l J(u) = integral _Ω 1/2 abs(gradient u(x))^2 - f(x) u(x) "d"x brace.r
$]

外力 $f$ 的选取使该问题有唯一极小元

#eqn("(30)")[
  $u(x) = sin(pi x^1) sin(pi x^2) + 4 sin(4 pi x^1) sin(4 pi x^2).$
]

#figure(
  placement: top,
  kind: table,
  supplement: [表],
  text(size: 9pt, table(
    columns: 7,
    stroke: .5pt,
    align: center + horizon,
    inset: (x: 4pt, y: 2.5pt),
    fill: (x, y) => if y == 0 {{ gray.lighten(88%) }},
    [填充距离 $h$], [1/20], [1/25], [1/30], [1/35], [1/40], [1/60],
    [$"cond"(K)$], [$5.27 times 10^9$], [$2.50 times 10^10$], [$8.88 times 10^10$], [$2.60 times 10^11$], [$6.59 times 10^11$], [$1.12 times 10^14$],
    [$"cond"(H)$], [$151$], [$238$], [$343$], [$469$], [$598$], [$1348$],
    [CG 迭代（$K$）], [$>4410$], [$>6760$], [$>9610$], [$>12960$], [$>16810$], [$>37210$],
    [PCG 迭代（$K$）], [$17$], [$18$], [$19$], [$17$], [$20$], [$22$],
    [CG 迭代（$H$）], [$64$], [$80$], [$95$], [$112$], [$128$], [$189$],
    [PCG 迭代（$H$）], [$9$], [$10$], [$12$], [$12$], [$14$], [$21$],
    [$norm(u - u _h) _"L2"$], [$4.07 times 10^(-3)$], [$1.73 times 10^(-3)$], [$8.36 times 10^(-4)$], [$4.48 times 10^(-4)$], [$2.81 times 10^(-4)$], [$8.30 times 10^(-5)$],
    [$norm(gradient u - gradient u _h) _"L2"$], [$3.03 times 10^(-1)$], [$1.60 times 10^(-1)$], [$9.30 times 10^(-2)$], [$5.72 times 10^(-2)$], [$3.43 times 10^(-2)$], [$1.30 times 10^(-2)$],
  )),
  caption: [用 Matérn-5/2 核求解 Poisson 方程时的逼近误差与 PCG 迭代次数。],
) <tab-poisson>

@tab-poisson 给出用算法 1 求解 Poisson 方程时的逼近误差，误差分别按 $L_2$ 范数和 $H^1$ 半范数度量。长度尺度取 $sigma = 1.0$，这让 Gram 矩阵 $K(bold(x), bold(x))$ 的条件数变得很大。此时若用标准 Cholesky 分解去算式 (7) 中的解 $u _bold(M)^bold(z)$，就会因条件数过大而失稳。所以我们改用 PCG 求解式 (7)，并以稀疏近似 $U _rho$ 充当预条件子。同一张表还记录了在不同稀疏参数 $rho$ 下，把残差压到目标容差 $epsilon = 10^(-8)$ 所需的 PCG 迭代次数。这里有一点必须交代：条件数太大，CG 求解器即便迭代到上限（配置点数的 $10$ 倍）也不收敛；相比之下，PCG 即使只取很小的 $rho$，迭代次数也大幅下降，算出来的结果精度依然很高。@fig-poissonrates 画的是分别用 Matérn-7/2 核与 Matérn-5/2 核求解 Poisson 问题时、误差关于填充距离的收敛速率。可以看到 Matérn-7/2 的收敛速率高于 Matérn-5/2，这与「核越光滑、收敛速率越高」的规律一致；但光滑核在长度尺度 $sigma$ 偏大、填充距离 $h$ 偏小时也更难稳定。

#figure(
  placement: top,
  figc(image("fig/Poisson_rates.pdf", width: 12cm)),
  caption: [Poisson 问题中误差关于填充距离的收敛速率。],
) <fig-poissonrates>

为了加快计算，我们改用算法 2 的稀疏求解器来解 Poisson 问题。这组实验固定填充距离 $h$ = 1/60、长度尺度 $sigma = 0.1$。@fig-poissonrho 画出逼近误差随稀疏参数 $rho$ 的变化：精度与稀疏性之间的折衷非常清楚。用光滑度较低的 Matérn-3/2 核时，稀疏求解器的精度很快就饱和不再提升；而用更光滑的 Matérn-5/2 核时，误差随 $rho$ 增大还在继续下降。

#figure(
  placement: top,
  figc(image("fig/sparse_Poisson_rho.pdf", width: 12cm)),
  caption: [Poisson 问题中稀疏求解器的误差关于半径 $rho$ 的衰减。],
) <fig-poissonrho>

== 6.2　半线性椭圆问题

我们再考虑 $Ω = [0, 1]^2$ 上的半线性问题：

#eqnb[$
  "inf" _ (u in "H" ^1 (Ω)) brace.l J(u) = integral _Ω 1/2 abs(gradient u(x))^2 + 1/4 u^4(x) - f(x) u(x) "d"x brace.r
$]

真解仍取式 (30)，边界条件与外力 $f$ 相应地反算得到。Gauss 迭代次数固定为 $5$ 次，已经足够让方法收敛。@fig-semilinear 是用算法 3 求解时的收敛速率（按 $L_2$ 范数度量）与 CPU 时间关于填充距离 $h$ 的曲线，其中预条件子 $U _rho$ 与 $V _rho$ 由取 $rho = 8$ 的稀疏 Cholesky 分解给出，长度尺度设为 $sigma = 0.3$。结果显示，Matérn-5/2 核的收敛速率比光滑度较低的 Matérn-3/2 核大约快一个数量级。就 CPU 时间而言，Matérn-3/2 核反而略快于 Matérn-5/2 核：前者的 Gram 矩阵条件数更小，稀疏 Cholesky 分解的质量因而更好，预条件共轭梯度的迭代次数也随之减少。

#figure(
  placement: top,
  figc(image("fig/semilinear_rates.pdf", width: 12cm)),
  caption: [半线性椭圆问题。左：收敛速率（$L_2$ 范数）关于填充距离的变化；右：CPU 时间关于填充距离的变化。],
) <fig-semilinear>

== 6.3　p-Laplace 问题

接下来考虑 $p > 2$ 的 p-Laplace 问题：

#eqnb[$
  "inf" _ (u in "W" _0^(1, p) (Ω)) brace.l J(u) = integral _Ω 1/p abs(gradient u(x))^p - f(x) u(x) "d"x brace.r
$]

对应的欧拉–拉格朗日方程是

#eqnb[$
  cases(-"div"(abs(gradient u)^(p - 2) gradient u) = f & "在 "Ω" 内", u = 0 & "在 "partial Ω" 上")
$]

不难验证，p-Laplace 变分问题满足变分法直接法的通常条件，因此解存在且唯一。

我们先看解是光滑的（$C^∞$ 极小元，即式 (30)）这一情形，此时外力 $f$ 由欧拉–拉格朗日方程反算，区域取 $Ω = [0, 1]^2$。@fig-plaplace 用 Matérn-7/2 核（长度尺度 $sigma = 0.8$）给出了 $p = 6, 8, 10$ 时 $L_2$ 范数误差与最终逐点误差的衰减情况，配置点取 $h$ = 1/40 的等距点集。可以看出，逼近误差和迭代次数都随问题阶数 $p$ 上升，这是问题强非线性的必然结果。即便如此，所有算例都在 $30$ 次迭代内快速收敛。

#figure(
  placement: top,
  figc(image("fig/p_Laplace.pdf", width: 16.2cm)),
  caption: [解连续的 p-Laplace 问题，$p = 6, 8, 10$。上排：$L_2$ 误差随迭代次数的衰减；下排：$30$ 次迭代后的逐点误差。],
) <fig-plaplace>

为了在光滑性较差的问题上检验求解器，我们在区域 $Ω = [-1, 1]^2$ 上再取一个人工真解

#eqn("(31)")[
  $u(x) = (1 - abs(x^1)^beta) (1 - abs(x^2)^beta), #h(1.5em) beta in (1, 2)$
]

该解属于 $C^1 (overline(Ω))$ 却不属于 $C^2 (overline(Ω))$：二阶偏导 $partial^2 u / partial x _1^2$（相应地 $partial^2 u / partial x _2^2$）在直线 $x _1 = 0$（相应地 $x _2 = 0$）上无界。因此，基于欧拉–拉格朗日方程的核方法在这里用不了；相反，我们基于变分形式的核方法只涉及一阶导数，正好绕开了误设问题。数值演示取 $p = 3$、$beta = 1.1$，此时解 $u$ 的 Sobolev 正则性为 $H^s (Ω)$，其中 $s < beta + 0.5 = 1.6$。我们选用 Matérn-1/2 核，它诱导的 RKHS 与 Sobolev 空间 $H^"3/2" (Ω)$ 范数等价，而真解恰好含于其中。再由 Sobolev 嵌入定理，$H^"3/2" (Ω)$ 嵌入该问题的函数空间 $W^(1, 3) (Ω)$，所以说把 RKHS 取成 $H^"3/2" (Ω)$ 对目标解是正确设定。至于更光滑的核（比如 Matérn-5/2），误设问题会让它们把解逼近得过于光滑，因此我们改为求解式 (13) 的正则化变分问题，正则化参数取 $gamma = 10^(-6)$。@fig-plapsol 给出数值解，可以看出变分求解器确实管用。配置集取 $h$ = 1/30 的等距网格，Matérn-1/2 与 Matérn-5/2 核的长度尺度都设为 $sigma = 1.0$。正确设定的 Matérn-1/2 核准确捕捉到了解在原点处的尖角，更光滑的 Matérn-5/2 核则把原点附近抹得太平。不过也要指出：Matérn-1/2 核虽然设定正确，却把边界上原本光滑的那部分解逼近得相当粗糙，因为它在整个区域上默认解连续但处处不可导。

#figure(
  placement: top,
  grid(
    columns: 2,
    gutter: 8pt,
    figc(image("fig/p_Laplace_solution_M12.pdf", width: 7.6cm)),
    figc(image("fig/p_Laplace_solution_M52.pdf", width: 7.6cm)),
  ),
  caption: [带奇点的 3-Laplace 问题。每张子图从左到右依次为解的逐点误差、沿 $x _2 = 0$ 的解、沿 $x _1 = 0$ 的解。(a) 不加正则化的 Matérn-1/2 核结果；(b) 取正则化参数 $gamma = 10^(-6)$ 的 Matérn-5/2 核结果。],
) <fig-plapsol>
