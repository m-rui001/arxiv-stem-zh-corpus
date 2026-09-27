#import "macros.typ": *

// frag_2 —— 原文 GP_VAR_0923.tex 第 432–686 行：第 2 节（2.1、2.2）。
// 本节编号公式共 3 个：(2)（tex 493）、(3)（tex 515）、(4)（tex 531）。
// 不编号显示公式：tex 483、539、560 三处 equation*，以及原文所有 \[ ... \] 均用 #eqnb。
// tex 429–430 的 %\subsection{Notations} 是死代码，未译。

= 2　强形式偏微分方程的最优恢复方法

本节梳理基于核的最优恢复方法所需的几个基本工具，并说明它如何用于求解线性强形式偏微分方程（PDE）。

== 2.1　最优恢复的抽象对偶框架

先给基于核的最优恢复问题搭好合适的函数空间。设 $cal(U)$ 是一个可分 Banach 空间，$cal(U)^*$ 是它的对偶空间。对任意 $u in cal(U)$ 和 $phi in cal(U)^*$，把二者的对偶配对记作 $bracket.l phi, u bracket.r$。假设存在线性双射 $cal(K): cal(U)^* -> cal(U)$，并且满足

- 对称性：对一切 $phi_1, phi_2 in cal(U)^*$，都有 $bracket.l phi_1, cal(K) phi_2 bracket.r = bracket.l phi_2, cal(K) phi_1 bracket.r$；
- 正性：对 $cal(U)^*$ 中一切非零的 $phi$，都有 $bracket.l phi, cal(K) phi bracket.r > 0$。

这个双射 $cal(K)$ 会自动在 $cal(U)$ 上诱导出一个内积，定义为

#eqnb[ $ ⟨ u_1, u_2 ⟩ _ cal(U) := bracket.l cal(K)^(-1) u_1, u_2 bracket.r quad "对所有" u_1, u_2 in cal(U) $ ]

进一步假设 $cal(U)$ 上配有由 $cal(K)$ 诱导的二次范数 $‖⋅‖ _ cal(U)$，即

#eqnb[ $ ‖u‖ _ cal(U)^2 = bracket.l cal(K)^(-1) u, u bracket.r quad "对所有" u in cal(U) $ ]

当算子 $cal(K)$ 由某个连续、对称正定（spd）核函数 $K: overline(Omega) times overline(Omega) -> ℝ$ 给出，也就是

#eqnb[ $ (cal(K) phi)(x) = bracket.l phi, K(x, ⋅) bracket.r quad "对所有" x in overline(Omega), phi in cal(U)^* $ ]

时，赋范空间 $(cal(U), ‖⋅‖ _ cal(U))$ 恰好就是核 $K$ 诱导的再生核 Hilbert 空间（RKHS）#footnote[当观测泛函性态良好、满足 $phi in L^2(Omega) subset cal(U)^*$ 时，$cal(K)$ 作用在 $phi$ 上就退化成大家熟悉的 Fredholm 积分算子（对一切 $x in overline(Omega)$ 与 $phi in cal(U)^*$），即 #eqnb[ $ integral_Omega K(x, x′) phi(x′) quad "d" x′ $ ]]。

给定列向量 $bold(z) = (z_1, …, z_M)^("T") in ℝ^(M times 1)$ 和按序排列的观测泛函集合 $bold(phi) = {phi_1, …, phi_M}$（每个 $phi_i$ 都属于 $cal(U)^*$），那么在约束 $bracket.l phi_i, u bracket.r = z_i$（$i = 1, …, M$）下对函数 $u$ 的最优恢复，就是求解

#eqnb[ $ &"min" _(u in cal(U)) ‖u‖ _ cal(U) \
  &"满足" quad bracket.l phi_i, u bracket.r = z_i, quad i = 1, …, M $ ]

记 $delta_x in cal(U)^*$ 是点 $x in overline(Omega)$ 处的点求值泛函。在适当条件下，表示定理断言：上面的最优恢复问题在 $cal(U)$ 中存在唯一解 @owhadi2019operator

#eqn("(2)")[ $ u_M(x) = K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) bold(z) $ ]

其中 $K(x, bold(phi)) in ℝ^(1 times M)$ 是行向量，它的第 $i$ 个分量为

#eqnb[ $ K(x, phi_i) ≜ bracket.l delta_x, cal(K) phi_i bracket.r $ ]

而 $K(bold(phi), bold(phi)) in ℝ^(M times M)$ 是 Gram 矩阵，它的第 $(i,j)$ 个分量为

#eqnb[ $ K(phi_i, phi_j) ≜ bracket.l phi_i, cal(K) phi_j bracket.r $ ]

== 2.2　最优恢复在线性偏微分方程中的应用

最优恢复方法可以用来求解形如下的线性偏微分方程

#eqn("(3)")[ $ &cal(L) u(x) = f(x), & x in Omega, \
  &cal(B) u(x) = b(x), & x in partial Omega, $ ]

其中 $cal(L)$ 和 $cal(B)$ 分别是 $Omega$ 上、边界 $partial Omega$ 上的有界线性微分算子，对应的数据是 $f$ 和 $b$。该方法在 $overline(Omega)$ 上放置 $M$ 个配点 $bold(x)$，这些配点由 $Omega$ 内部的 $M_Omega$ 个内部配点和边界 $partial Omega$ 上的 $M _ (partial Omega)$ 个边界配点组成，即

#eqnb[ $ bold(x) = bold(x)_Omega union bold(x) _ (partial Omega) = {x_1, …, x_(M_Omega)} union {x_(M_Omega + 1), …, x_M} $ ]

假设 PDE 的解 $u^*$ 落在 RKHS $cal(U)$ 中，那么 $u^*$ 就能用下面这个最优恢复问题 @wendland2004scattered @berlinet2011reproducing 的解 $u_M^*$ 来近似，

#eqn("(4)")[ $ &"min" _(u in cal(U)) ‖u‖ _ cal(U) \
  &"满足" quad bracket.l phi_i, u bracket.r = f(x_i), & i = 1, …, M_Omega \
  &quad bracket.l phi_i, u bracket.r = b(x_i), & i = M_Omega + 1, …, M $ ]

其中的观测泛函

#eqnb[ $ phi_i = cases(delta_(x_i) ∘ cal(L) & quad i = 1 ", …, " M_Omega, delta_(x_i) ∘ cal(B) & quad i = M_Omega + 1 ", …, " M) $ ]

在 RKHS $cal(U)$ 上有界且线性，因此 $phi_i in cal(U)^*$。为书写方便，记 $bold(x)_Omega$ 和 $bold(x) _ (partial Omega)$ 处的数据列向量分别为

#eqnb[ $ f(bold(x)_Omega) = (f(x_1), …, f(x_(M_Omega)))^("T") in ℝ^(M_Omega times 1), quad b(bold(x) _ (partial Omega)) = (b(x_(M_Omega + 1)), …, b(x_M))^("T") in ℝ^(M _ (partial Omega) times 1) $ ]

此时表示式 (2) 化为

#eqnb[ $ u_M(x) = K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) mat(f(bold(x)_Omega),; b(bold(x) _ (partial Omega)),), $ ]

其中各矩阵元可以显式写成

#eqnb[ $ K(phi_i, phi_j) = cases(
  cal(L) cal(L)^' K(x_i, x_j) & quad 1 <= i <= M_Omega ", " 1 <= j <= M_Omega,
  cal(L) cal(B)^' K(x_i, x_j) & quad 1 <= i <= M_Omega ", " M_Omega + 1 <= j <= M,
  cal(B) cal(L)^' K(x_i, x_j) & quad M_Omega + 1 <= i <= M ", " 1 <= j <= M_Omega,
  cal(B) cal(B)^' K(x_i, x_j) & quad M_Omega + 1 <= i <= M ", " M_Omega + 1 <= j <= M
) $ ]

以及

#eqnb[ $ K(x, phi_i) = cases(cal(L)^' K(x, x_i) & quad 1 <= i <= M_Omega, cal(B)^' K(x, x_i) & quad M_Omega + 1 <= i <= M) $ ]

这里用 $cal(L)^'$（相应地 $cal(B)^'$）表示把 $cal(L)$（相应地 $cal(B)$）作用在 $K$ 的第二个变元上。最优恢复方法还能推广到非线性偏微分方程的求解 @chen2021solving @chen2024gaussian。

注意到当核 $K$ 是径向核时，即存在函数 $psi: overline(Omega) -> ℝ$ 使 $K(x, y) = psi(x - y)$，核插值方法就与径向基函数（RBF）配点方法 @fornberg2015solving 等价。但更要紧的是，最优恢复这一表述在几个方面占优：1）它为配点方法提供了函数空间框架；2）处理物理约束与数据约束（边界条件、实验数据等）时可以一气呵成。这两点对本文后面要发展的方法都至关重要。

同一套方法还可以从高斯过程（GP）回归的角度推导出来。与最优恢复表述不同，用 GP 回归求解 PDE @chen2021solving @hennig2015probabilistic @cockayne2017probabilistic 先取概率视角：为式 (3) 的解定义一个高斯随机场先验 $sans(g) ~ cal("GP")(0, K)$，其中 $cal("GP")(0, K)$ 是均值为 $0$、协方差函数为 $K$ 的高斯过程。按定义，对任意 $tilde(x), hat(x) in overline(Omega)$ 都有

#eqnb[ $ 𝔼[sans(g)(tilde(x))] = 0, quad 𝔼[sans(g)(tilde(x)) sans(g)(hat(x))] = K(tilde(x), hat(x)), $ ]

这里的期望对高斯随机场 $sans(g)$ 的一切可能实现来取。再记与 $bold(x)_Omega$、$bold(x) _ (partial Omega)$ 分别关联的观测泛函集合为

#eqnb[ $ bold(phi)_Omega = {phi_1, …, phi_(M_Omega)} in (cal(U)^*)^(⊗ M_Omega), quad bold(phi) _ (partial Omega) = {phi_(M_Omega + 1), …, phi_(M_Omega)} in (cal(U)^*)^(⊗ M _ (partial Omega)) $ ]

#note[第二个集合的末项，原文写作 $phi_(M_Omega)$，据上下文应为 $phi_M$，此处照录。]

由于 $cal(L)$ 是线性的，立即可得

#eqnb[ $ 𝔼[cal(L) sans(g)(bold(x)_Omega)] = 0 in ℝ^(M_Omega times 1), quad 𝔼[cal(L) sans(g)(bold(x)_Omega) (cal(L) sans(g)(bold(x)_Omega))^("T")] = K(bold(phi)_Omega, bold(phi)_Omega) in ℝ^(M_Omega times M_Omega) $ ]

#eqnb[ $ 𝔼[(cal(L) sans(g)(bold(x)_Omega)) sans(g)(x)] = K(bold(phi)_Omega, x) in ℝ^(M_Omega times 1), quad 𝔼[sans(g)(x) (cal(L) sans(g)(bold(x)_Omega))^("T")] = K(x, bold(phi)_Omega) in ℝ^(1 times M_Omega) $ ]

对边界算子 $cal(B)$ 和边界观测泛函 $bold(phi) _ (partial Omega)$，结论完全相同。给定配点处的线性约束（如式 (4) 所示），就能算出 $sans(g)(x)$ 在这些条件下的后验分布，即对所有 $x in overline(Omega)$，

#eqnb[ $ sans(g)(x) ~ "在条件" ~ cal(L) sans(g)(bold(x)_Omega) = f(bold(x)_Omega), \ cal(B) sans(g)(bold(x) _ (partial Omega)) = b(bold(x) _ (partial Omega)) $ ]

下服从分布 $cal(N)(mu_M(x), Sigma_M(x))$。这里 $cal(N)(mu_M(x), Sigma_M(x))$ 是正态分布，其后验均值为

#eqnb[ $ mu_M(x) = K(x, bold(phi)) K(bold(phi), bold(phi))^(-1) mat(f(bold(x)_Omega),; b(bold(x) _ (partial Omega)),) $ ]

后验方差为

#eqnb[ $ Sigma_M(x) = K(x, x) - K(x, bold(phi))^("T") K(bold(phi), bold(phi))^(-1) K(x, bold(phi)). $ ]

我们发现，均值函数 $mu_M(x)$ 与最优恢复解 $u_M(x)$ 完全一致；而且 GP 视角还额外给出了预测在测试点 $x$ 处的不确定性 $Sigma_M(x)$。更准确地说，求解式 (4) 的最优恢复问题，等价于在这些约束下求高斯过程 $sans(g)$ 的最大后验（MAP）估计。这一概率视角对文献 @sparseCholFact 发展的稀疏 Cholesky 分解至关重要，而接下来两节引入我们求解变分问题的方法时，正是用它来降低计算复杂度。
