#import "macros.typ": *

// frag_5.typ —— 对应 tex 第 1091–1537 行：4.2 稀疏 Cholesky 分解、4.3 Hessian 矩阵的稀疏分解。
// 本节公式 (14)–(21)；图 1–3（<fig-grid> / <fig-sparsity> / <fig-hesspars>）；
// 例 4.1、定理 4.1（含证明）、算法 2 与算法 3。tex 第 1330 行的 % 注释步骤不译。

== 4.2　稀疏 Cholesky 分解

按照 @sparseCholFact @chen2025sparse 的做法，下面通过对配点 $bold(x)$ 重新排序，来描述精度矩阵 $K _{alpha}^(-1)(bold(x), bold(x))$ 的稀疏 Cholesky 分解。回顾高斯过程的记号 $sans(g) ~ cal("GP")(0, K)$，并记随机变量

#eqnb[ $ sans(g) _{k _i} ≜ sans(g)(x _{k _i}) = sans(g)(x _(P(i))) = sans(g)(tilde(x) _i) ~ cal("N")(0, K(tilde(x) _i, tilde(x) _i)), quad i ∈ cal("I"). $ ]

最近的工作表明，$K(tilde(bold(x)), tilde(bold(x)))^(-1)$ 的 Cholesky 因子 $U$ 与高斯过程的条件协方差之间存在内在联系。确切地说，对每个 $j ∈ cal("I")$，

#eqn("(14)")[ $ abs( frac(U _"ij", U _"jj") ) = frac( "Cov"(sans(g) _{k _i}, sans(g) _{k _j} | sans(g) _{k _1}, …, hat(sans(g) _{k _i}), …, sans(g) _{k _{j - 1}}), "Var"(sans(g) _{k _i} | sans(g) _{k _1}, …, hat(sans(g) _{k _i}), …, sans(g) _{k _{j - 1}})) ), quad i < j, $ ]

其中 $hat(sans(g) _{k _i})$ 表示该项被省略（推导见 @sparseCholFact @chen2025sparse）。

为了让 $U$ 尽可能稀疏，式 (14) 所刻画的关系加上屏蔽效应提示了如下做法：选定 $tilde(x) _i$（$i = 1, …, j - 1$）之后，下一个下标 $k _j$ 应当让 $tilde(x) _j$（即 $x _{k _j}$）离集合 ${tilde(x) _1, …, tilde(x) _{j - 1}}$ 尽可能远。这样一来，相距较远的变量 $sans(g) _{k _j}$ 与 $sans(g) _{k _i}$ 之间的相关性，便在经过 $(sans(g) _{k _1}, …, hat(sans(g) _{k _i}), …, sans(g) _{k _{j - 1}})$ 条件化后被有效屏蔽。把这一策略递归地施加到 $bold(x)$ 上，就得到如下的（无条件）极大排序 @guinness2018permutation，

#eqn("(15)")[ $ k _1 "任取于" cal("I") quad "且" k _j = op("argmax") _{k ∈ cal("I") ∖ {k _1, …, k _{j - 1}}} "dist"(x _k, {x _{k _1}, …, x _{k _{j - 1}}}), quad j = 2, …, M, $ ]

它随之给出一列长度

#eqn("(16)")[ $ l _1 = ∞ quad "且" quad l _j = "dist"(x _{k _j}, {x _{k _1}, …, x _{k _{j - 1}}}), quad j = 2, …, M. $ ]

此后，$P$ 专指由上述极大排序诱导的置换函数（及置换矩阵）。

#thm("例 4.1", [ 作为演示，@fig-grid 的左图给出了 $5 times 5$ 均匀网格上的极大排序 $P$ 与长度序列 $l$。配点原本按从左到右、从下到上的顺序编号。极大排序 $P$ 把配点集 $bold(x)$ 按由粗到细重排，得到的重排点集 $tilde(bold(x))$ 呈现出双尺度格局：在重排后的配点集 $tilde(bold(x))$ 中，粗 $3 times 3$ 网格的红点排在细 $5 times 5$ 网格的绿点之前。屏蔽效应意味着，一旦以粗尺度观测（红点）为条件，细尺度观测（绿点）之间就几乎不相关；再借助式 (14)，Cholesky 因子中的元素 $U _"ij"$（$i < j$）便几乎为零。 ])

事实上，在极大排序之下有两条关键结论（@chen2025sparse 的定理 4.1 与 @schafer2021compression 的定理 6.1）：其一，式 (14) 中归一化的条件协方差 $U _"ij" / U _"jj"$ 随距离 $"dist"(x _{k _i}, x _{k _j})$ 指数衰减；其二，对角元 $U _"jj"$ 的界可以取得与下标 $j$ 无关。两条合起来说明非对角元 $U _"ij"$ 指数地小，只要距离 $"dist"(x _{k _i}, x _{k _j})$ 足够大，就可以把它们当作填充元直接置零（回想一下，极大排序选 $x _{k _j}$ 靠的正是这一点）。

稀疏 Cholesky 分解在精度与稀疏度之间的权衡，可以通过由稀疏参数 $rho > 0$ 给出的稀疏模式来调节：

#eqnb[ $ S _rho = {(i, j) ∈ (cal("I"), cal("I")): i <= j, "dist"(x _{P(i)}, x _{P(j)}) <= rho l _j}. $ ]

给定稀疏模式 $S _rho$ 后，最优稀疏 Cholesky 因子 $U$ 由极小化 Kullback–Leibler（KL）散度 @kullback1951information 得到，即

#eqn("(17)")[ $ min _(U ∈ cal("M")) "KL"( cal("N")(0, K(tilde(bold(x)), tilde(bold(x)))) parallel cal("N")(0, (U U^("T"))^(-1)) ), $ ]

其中

#eqnb[ $ cal("M") = {U ∈ ℝ^(M times M): U _"ij" = 0 quad "若" quad (i, j) ∉ S _rho} $ ]

是所有上三角矩阵 $U$ 构成的集合：只要下标 $(i, j)$ 不在稀疏模式 $S _rho$ 里，元素 $U _"ij"$ 就置零。对每个列下标 $j ∈ cal("I")$，定义下标子集

#eqnb[ $ cal("I") _j = {i ∈ cal("I"): (i, j) ∈ S _rho}, $ ]

其基数记为 $abs(cal("I") _j)$。引人注目的是，极小化式 (17) 的 KL 散度有闭式解

#eqnb[ $ U _{cal("I") _j, j} = frac( K(tilde(bold(x)) _(cal("I") _j), tilde(bold(x)) _(cal("I") _j))^(-1) "e" _(abs(cal("I") _j)), sqrt( "e" _(abs(cal("I") _j))^("T") K(tilde(bold(x)) _(cal("I") _j), tilde(bold(x)) _(cal("I") _j))^(-1) "e" _(abs(cal("I") _j)) ) ), quad j = 1, …, M, $ ]

这里 $tilde(bold(x)) _(cal("I") _j) = bold(x) _(P(cal("I") _j))$ 是 $tilde(bold(x))$ 的一个子集，而 $"e" _(abs(cal("I") _j)) = (0, …, 0, 1)^("T") ∈ ℝ^(abs(cal("I") _j) times 1)$ 是 $ℝ^(abs(cal("I") _j))$ 的第 $abs(cal("I") _j)$ 个基向量。该公式表明，上三角 Cholesky 因子可以逐列算出：只需对 $M$ 个规模为 $abs(cal("I") _j) times abs(cal("I") _j)$ 的子矩阵 $K(tilde(bold(x)) _(cal("I") _j), tilde(bold(x)) _(cal("I") _j))^(-1)$ 分别做分解。于是分解复杂度从 $cal("O")(M^3)$ 降为 $sum_(j=1)^M cal("O")(abs(cal("I") _j)^3)$。

#figure(
  placement: top,
  figc(image("fig/grid.pdf", width: 12cm)),
  caption: [方形区域 $Omega = [0, 1]^2$ 及其上 $M = 25$ 个等距配点，其中 $M _Omega = 9$、$M _{partial Omega} = 16$。全配点集 $bold(x)$ 与内部配点集 $bold(x) _Omega$ 都按从左到右、从下到上的顺序编号。图中分别给出了 $bold(x)$（左）与 $bold(x) _Omega$（右）上各观测泛函的极大排序 $P$、$Q$ 和长度序列 $l$、$l'$。],
) <fig-grid>

@fig-sparsity 展示了精度矩阵 $K _{3/2}^(-1)(tilde(bold(x)), tilde(bold(x)))$ 在不同 $rho$ 下的稀疏 Cholesky 因子 $U _rho$，这里 $tilde(bold(x))$ 取为 $bar(Omega) = [0, 1]^2$ 上 $M = 61 times 61$ 个等距配点。分解的精度用相对误差衡量：

#eqnb[ $ frac( norm( K(tilde(bold(x)), tilde(bold(x))) - (U _rho U _rho^("T"))^(-1) ) _F, norm( K(tilde(bold(x)), tilde(bold(x))) ) _F ), $ ]

稀疏度则定义为 $U _rho$ 上三角部分中非零元素的百分比。可以清楚看到稀疏度与精度之间的取舍；引人注目的是，即便 $rho$ 只是适度偏大，稀疏 Cholesky 分解也只需少量非零元就能给出几乎精确的近似。

#figure(
  placement: top,
  figc(image("fig/sparsity_M32_03.png", width: 12cm)),
  caption: [采用 Matérn-3/2 核时，对 $K^(-1)(tilde(bold(x)), tilde(bold(x))) approx U _rho U _rho^("T")$ 取不同 $rho$ 的稀疏上三角 Cholesky 近似 $U _rho$。],
) <fig-sparsity>

回顾一下，由置换函数 $P$ 诱导的置换矩阵仍记作 $P$（满足 $P^("T") P = I$），于是用重排后的 $tilde(bold(x))$ 立即得到表示式

#eqn("(18)")[ $ u _M ^(bold(z))(x) = K(x, bold(x)) P^("T") P K(bold(x), bold(x))^(-1) P^("T") P bold(y) = K(x, tilde(bold(x))) K(tilde(bold(x)), tilde(bold(x)))^(-1) P bold(y), $ ]

这里回顾一下，$K(x, bold(x)) P^("T") = K(x, tilde(bold(x)))$ 且 $P K(bold(x), bold(x))^(-1) P^("T") = K(tilde(bold(x)), tilde(bold(x)))^(-1)$。类似地，在排序 $tilde(bold(x))$ 下可以推出关于 $bold(z)$ 的梯度：

#eqn("(19)")[ $ gradient _{bold(z)} u _M ^(bold(z))(x) = K(x, tilde(bold(x))) K(tilde(bold(x)), tilde(bold(x)))^(-1) P mat(delim: "(", bold(I) _(M _Omega times M _Omega); bold(O) _(M _{partial Omega} times M _Omega)), $
$ gradient _{bold(z)} partial _j u _M ^(bold(z))(x) = partial _j K(x, tilde(bold(x))) K(tilde(bold(x)), tilde(bold(x)))^(-1) P mat(delim: "(", bold(I) _(M _Omega times M _Omega); bold(O) _(M _{partial Omega} times M _Omega)). $ ]

给定稀疏参数 $rho$ 后，用稀疏 Cholesky 分解可把 $u _M ^(bold(z))(x)$ 近似为

#eqn("(20)")[ $ u _{M, rho} ^(bold(z))(x) ≜ K(x, tilde(bold(x))) U _rho U _rho^("T") P bold(y), $ ]

并相应得到依赖 $rho$ 的能量

#eqnb[ $ I _{M, rho}(bold(z)) ≜ J( u _{M, rho} ^(bold(z)) ) = integral _Ω G( x, u _{M, rho} ^(bold(z))(x), gradient _x u _{M, rho} ^(bold(z))(x) ) dif x. $ ]

近似梯度 $gradient _{bold(z)} I _{M, rho}(bold(z))$ 与 Hessian 矩阵 $gradient _{bold(z)}^2 I _{M, rho}(bold(z))$ 仍按式 (11) 计算，只需把其中的 $u _M ^(bold(z))(x)$ 换成近似 $u _{M, rho} ^(bold(z))(x)$。由此得到的稀疏算法见算法 2。另一种做法是：当需要更高精度时，可把稀疏 Cholesky 因子 $U _rho$ 用作预条件子，来计算式 (18)、(19) 中出现的矩阵–向量乘积 $K(tilde(bold(x)), tilde(bold(x)))^(-1) P bold(y)$ 与矩阵–矩阵乘积 $K(tilde(bold(x)), tilde(bold(x)))^(-1) P [bold(I) _(M _Omega times M _Omega); bold(O) _(M _Omega times M _{partial Omega})]^("T")$。

#block(
  width: 100%,
  above: 1em,
  below: 1em,
  inset: (x: 1em, y: 0.9em),
  radius: 2pt,
  stroke: 0.6pt + gray,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold")[算法 2　基于稀疏最优恢复的变分求解器]
  #v(0.5em)

  1. 选取长度尺度为 $sigma$、稀疏参数为 $rho$ 的核 $K$；
  2. 对 $bold(x)$ 计算极大排序 $P$；
  3. 用 $P$ 把 $bold(x)$ 重排为 $tilde(bold(x))$；
  4. 求 $K(tilde(bold(x)), tilde(bold(x)))^(-1) approx U _rho U _rho^("T")$ 的稀疏上三角 Cholesky 近似 $U _rho$；
  5. 初始化：时间步 $n = 0$，初值 $bold(z) _0$；
  6. 当 $I _{M, rho}(bold(z) _n)$ 未收敛时，依次执行：（a）计算近似梯度 $gradient _{bold(z)} I _{M, rho}(bold(z) _n)$ 与 Hessian 矩阵 $gradient _{bold(z)}^2 I _{M, rho}(bold(z) _n)$；（b）更新 $bold(z) _n ← bold(z) _n - [gradient _z^2 I _{M, rho}(bold(z) _n)]^(-1) gradient _z I _{M, rho}(bold(z) _n)$；（c）按式 (20) 更新 $u _{M, rho} ^(bold(z) _n)$；（d）计算能量 $I _{M, rho}(bold(z) _n) = J(u _{M, rho} ^(bold(z) _n))$；（e）令 $n ← n + 1$。
]

== 4.3　Hessian 矩阵的稀疏分解

尽管精度矩阵 $K^(-1)(tilde(bold(x)), tilde(bold(x)))$ 的稀疏 Cholesky 分解已大幅降低本方法的计算复杂度，每次 Newton 迭代仍要解一个涉及 Hessian 矩阵 $gradient _z^2 I _M(bold(z))$ 的线性方程组；当 $M$ 很大时，这一步的代价依然可观。Hessian 矩阵由 Gram 矩阵拼装而成（见式 (11)），因此我们有理由期待：只要 Hessian 正定，其 Cholesky 因子就会继承与 Gram 矩阵相近的稀疏模式。本节先用数值实验考察这一设想，并从一个充分条件入手——在该条件下，Hessian 诱导出一个正定核。

#thm("定理 4.1", [ 设映射 $(u, xi) ⟼ G(x, u, xi)$ 对一切 $x ∈ Ω$ 都是强凸的。给定 $bold(z) ∈ ℝ^(M _Omega)$，记 ${z _1, …, z _{M _Omega}}$ 为由 $bold(z)$ 的各分量构成的有限集。则由

#eqnb[ $ H(z _i, z _j) ≜ partial ^2 _{z _i, z _j} I(bold(z)) $ ]

定义的对称函数 $H: {z _1, …, z _{M _Omega}} times {z _1, …, z _{M _Omega}} -> ℝ$ 是有限集 ${z _1, …, z _{M _Omega}}$ 上的正定核。 ])

#proof[ 只需证明矩阵 $H(bold(z), bold(z))$ 正定。对一组观测泛函 $bold(phi)$，式 (11) 定义的 Hessian $gradient _z^2 I _M(bold(z))$ 可写成

#eqnb[ $ gradient _z^2 I _M(bold(z)) = integral _Ω mat(delim: "(", gradient _z u _M ^(bold(z))(x); gradient _z partial _1 u _M ^(bold(z))(x); dots.v; gradient _z partial _d u _M ^(bold(z))(x))^("T") mat(delim: "(", G _"uu" & G _{u bold(xi) _1} & dots.c & G _{u bold(xi) _d}; G _{bold(xi) _1 u} & G _{bold(xi) _1 bold(xi) _1} & dots.c & G _{bold(xi) _1 bold(xi) _d}; dots.v & dots.v & dots.v & dots.v; G _{bold(xi) _d u} & G _{bold(xi) _d bold(xi) _1} & dots.c & G _{bold(xi) _d bold(xi) _d}) mat(delim: "(", gradient _z u _M ^(bold(z))(x); gradient _z partial _1 u _M ^(bold(z))(x); dots.v; gradient _z partial _d u _M ^(bold(z))(x)) dif x ∈ ℝ^(M _Omega times M _Omega), $ ]

其中 $gradient _z partial _j u _M ^(bold(z))(x) = (partial _{z _1} partial _j u _M ^(bold(z))(x), …, partial _{z _{M _Omega}} partial _j u _M ^(bold(z))(x)) ∈ ℝ^(1 times M _Omega)$，$j = 1, …, d$。对任意 $bold(y) ∈ ℝ^(M _Omega times 1)$，由强凸性假设有 $bold(y)^("T") [gradient _z^2 I _M(bold(z))] bold(y) >= 0$。再设 $bold(y) ∈ ℝ^(M _Omega times 1)$ 满足 $bold(y)^("T") [gradient _z^2 I _M(bold(z))] bold(y) = 0$。把式 (12) 代入 $gradient _z^2 I _M(bold(z))$ 便可推出

#eqnb[ $ mat(delim: "(", K(x, bold(x)); partial _1 K(x, bold(x)); dots.v; partial _d K(x, bold(x))) K(bold(x), bold(x))^(-1) mat(delim: "(", bold(y); bold(0)) = bold(0) $ ]

对几乎一切 $x ∈ Ω$ 成立。而 $K(bold(x), bold(x))^(-1)$ 可逆，故必有 $bold(y) = bold(0)$。 ]

这一事实，加上 Gram 矩阵的稀疏 Cholesky 分解，启发我们用极大排序重排集合 ${z _1, …, z _{M _Omega}}$。回顾最优恢复表述中有 $u(x _i) = z _i$（$i = 1, …, M _Omega$），因此重排 ${z _1, …, z _{M _Omega}}$ 等价于重排内部配点 $bold(x) _Omega$。于是把式 (15) 与 (16) 施加于内部配点集 $bold(x) _Omega$，得到极大排序 $Q: {1, …, M _Omega} -> {1, …, M _Omega}$ 及相应的长度序列 $l' _1, …, l' _{M _Omega}$。记 $tilde(bold(z))$ 为用极大排序 $Q$ 重排 $bold(z)$ 所得的向量，$H^(-1)(tilde(bold(z)), tilde(bold(z)))$ 为重排后的逆 Hessian 矩阵。对它做稀疏 Cholesky 分解，得到上三角因子 $V _rho$，即

#eqnb[ $ H(tilde(bold(z)), tilde(bold(z)))^(-1) = Q H(bold(z), bold(z))^(-1) Q^("T") approx V _rho V _rho^("T"), $ ]

其中上三角因子 $V _rho$ 依赖 $bold(z)$，为记号简洁我们把这一依赖隐去。于是 Gauss–Newton 更新写作

#eqn("(21)")[ $ bold(z) _{n + 1} = bold(z) _n - H(bold(z) _n, bold(z) _n)^(-1) gradient _z I _M(bold(z) _n) = bold(z) _n - Q^("T") H(tilde(bold(z)) _n, tilde(bold(z)) _n)^(-1) [Q gradient _z I _M(bold(z) _n)]. $ ]

@fig-grid 的右图给出了内部配点的极大排序 $Q$ 与相应的长度 $l'$。我们把 $Q$ 用于例 3.1 中 Poisson 问题的逆 Hessian 矩阵，以数值实验检验其效果。对 Matérn-3/2 核，@fig-hesspars 显示：在 $Omega = (0, 1)^2$ 上取 $M _Omega = 59 times 59$ 个等距配点时，因子 $V _rho$ 呈现出清晰的稀疏模式。但我们也观察到，在稀疏程度相当时，逆 Hessian 分解的相对误差比逆 Gram 分解的大。这一现象并不意外：定理 4.1 中定义的核 $H$ 对 Matérn 核 $K$ 做了一连串运算，屏蔽效应难免有所削弱。因此，我们建议在 CG 方法中把 $V _rho$ 用作求解 Gauss–Newton 更新 (21) 的预条件子。由此得到的预条件 CG（对 Gram 矩阵与 Hessian 矩阵均适用）求解算法见算法 3。

#figure(
  placement: top,
  figc(image("fig/hessian_sparsity_M32_03.png", width: 12cm)),
  caption: [采用 Matérn-3/2 核时，对逆 Hessian $H^(-1)(tilde(bold(z)), tilde(bold(z))) approx V _rho V _rho^("T")$ 取不同 $rho$ 的稀疏上三角 Cholesky 近似 $V _rho$。],
) <fig-hesspars>

#block(
  width: 100%,
  above: 1em,
  below: 1em,
  inset: (x: 1em, y: 0.9em),
  radius: 2pt,
  stroke: 0.6pt + gray,
)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold")[算法 3　基于预条件最优恢复的变分求解器]
  #v(0.5em)

  1. 选取长度尺度为 $sigma$、稀疏参数为 $rho$ 的核 $K$；
  2. 对 $bold(x)$ 计算极大排序 $P$，对 $bold(x) _Omega$ 计算极大排序 $Q$；
  3. 用 $P$ 把 $bold(x)$ 重排为 $tilde(bold(x))$，用 $Q$ 把 $bold(x) _Omega$ 重排为 $tilde(bold(x)) _Omega$；
  4. 求 $K^(-1)(tilde(bold(x)), tilde(bold(x))) approx U _rho U _rho^("T")$ 的稀疏上三角 Cholesky 近似 $U _rho$；
  5. 初始化：时间步 $n = 0$，初值 $bold(z) _0$；
  6. 当 $I _M(bold(z) _n)$ 未收敛时，依次执行：（a）用 $U _rho$ 预条件的 CG 按式 (19) 计算 $gradient _{bold(z)} u _M ^(bold(z))$ 与 $gradient _{bold(z)} partial _j u _M ^(bold(z))$；（b）按式 (11) 计算梯度 $gradient _z I _M(bold(z) _n)$ 与 Hessian 矩阵 $H(bold(z) _n, bold(z) _n) = gradient _z^2 I _M(bold(z) _n)$；（c）求 $H^(-1)(tilde(bold(z)) _n, tilde(bold(z)) _n) approx V _rho V _rho^("T")$ 的稀疏上三角 Cholesky 近似 $V _rho$；（d）用 $V _rho$ 预条件的 CG 更新 $bold(z) _n ← bold(z) _n - Q^("T") H(tilde(bold(z)) _n, tilde(bold(z)) _n)^(-1) [Q gradient _z I _M(bold(z) _n)]$；（e）按式 (18) 更新 $u _M ^(bold(z) _n)$；（f）计算能量 $I _M(bold(z) _n) = J(u _M ^(bold(z) _n))$，并令 $n ← n + 1$。
]
