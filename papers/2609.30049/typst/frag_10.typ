#import "macros.typ": *
// frag_10：第 7 节 结论 + 附录 A + 附录 B + 致谢（tex 2739–2984）
// 本节无编号显示公式（原文全为 equation* / 行内式），全稿式号止于 (33)。
// 定义/定理编号：定义 A.1；定义 B.1–B.4、定理 B.1（照 CONVENTIONS 第 9 节）。

= 7　结论

本文提出了一套基于核的最优恢复框架，用于最小化物理系统的变分能量泛函。这一表述能把物理约束与观测数据无缝整合到同一框架中。方法本质上是变分式的，因此所需的正则性条件比基于强形式欧拉–拉格朗日方程的做法低得多。在变分分析的若干标准假设下，我们借助 Γ–收敛证明：本方法算出的数值解按适当意义收敛到真解。我们还表明，利用近期发展起来的稀疏 Cholesky 技术，核方法那个经典的三次方计算量瓶颈可以得到大幅缓解。大量数值实验验证了所提方法既高效又精确。未来还有几个值得推进的方向。其一，把现行的 Γ–收敛分析推广到正则化变分问题，即便所选的核被误设，也能建立收敛速率。其二，无散度核在 Stokes 问题上的成功应用启发我们思考：更一般的物理约束能否直接嵌入核的构造？沿此方向深入，有望形成一套面向变分问题的、普适的保结构最优恢复框架。

= 附录 A　矩阵值核与最优恢复

为求完整，这里简要回顾矩阵值核及其在向量值插值/回归（亦称多输出学习）中的应用 @alvarez2012kernels @micchelli2005learning。我们只讨论向量值情形，不过这套理论可以很自然地推广到算子值场合 @kadri2016operator。

#thm("定义 A.1")[
  矩阵值核是满足下列两条性质的函数 $bold(K): overline(Omega) times overline(Omega) -> ℝ^(d times d)$：
  
  1. $bold(K)$ 是对称的，即对一切 $x, y ∈ overline(Omega)$ 有 $bold(K)(x, y) = bold(K)(y, x)$；
  2. $bold(K)$ 是半正定（PSD）的，即对任意正整数 $n$、任意点 $x_1, dots.c, x_n ∈ overline(Omega)$ 与向量 $c_1, dots.c, c_n ∈ ℝ^d$，
  
     #eqnb[$ sum_(i=1)^n sum_(j=1)^n c_i^"T" bold(K)(x_i, x_j) c_i >= 0 $]
]

一个 PSD 核 $bold(K): overline(Omega) times overline(Omega) -> ℝ^(d times d)$ 诱导出一个向量值再生核 Hilbert 空间（vRKHS）$(cal(U), ∥·∥_cal(U))$，它由满足下述条件的函数 $bold(u): overline(Omega) -> ℝ^d$ 组成：对每个 $c ∈ ℝ^d$ 和每个 $x ∈ overline(Omega)$，

1. $bold(K)(x, ·) c ∈ cal(U)$；
2. 对一切 $bold(u) ∈ cal(U)$，都有 $⟨bold(u), bold(K)(·, x) c⟩_cal(U) = bold(u)(x)^"T" c$。

具体来说，vRKHS 可以按如下方式构造。先定义预 Hilbert 空间

#eqnb[$ cal(U)_0 = brace.l bold(u): overline(Omega) -> ℝ^d ∣ bold(u) = sum_(i=1)^n bold(K)(·, x_i) c_i, ∀ n ∈ ℕ, x_i ∈ overline(Omega), c_i ∈ ℝ^d brace.r $]

并赋予内积

#eqnb[$ ⟨bold(u), tilde(bold(u))⟩_(cal(U)_0) = sum_(i=1)^m sum_(j=1)^n c_i^"T" bold(K)(x_i, tilde(x)_j) tilde(c)_j $]

其中 $bold(u) = sum_(i=1)^m bold(K)(·, x_i) c_i$，$tilde(bold(u)) = sum_(j=1)^n bold(K)(·, tilde(x)_j) tilde(c)_j$。再取 $cal(U)_0$ 关于诱导范数 $∥·∥_(cal(U)_0)$ 的闭包，就得到 vRKHS，即 $cal(U) = "cl"(cal(U)_0)$。

设已在点集 $bold(x) = (x_1, dots.c, x_M) ⊂ ℝ^d$ 上观测到函数 $bold(u)$ 的取值，便可在 $cal(U)$ 上提出最优恢复问题

#eqnb[$ mat(delim: #none, min_(bold(u) ∈ cal(U)) norm(bold(u))_cal(U)^2 ; "满足" quad bold(u)(x_i) = z_i "," quad i = 1 "," dots.c "," M) $]

表示定理给出其解

#eqnb[$ bold(u)(x) = bold(K)(x, bold(x)) bold(K)(bold(x), bold(x)) mat(delim: "(", z_1; dots.v; z_M) $]

其中

#eqnb[$ bold(K)(bold(x), bold(x)) = mat(delim: "[", bold(K)(x_1, x_1), bold(K)(x_1, x_2), dots.c, bold(K)(x_1, x_M); bold(K)(x_2, x_1), bold(K)(x_2, x_2), dots.c, bold(K)(x_2, x_M); dots.v, dots.v, ⋱, dots.v; bold(K)(x_M, x_1), bold(K)(x_M, x_2), dots.c, bold(K)(x_M, x_M)) ∈ ℝ^("Md" times "Md") $]

以及

#eqnb[$ bold(K)(x, bold(x)) = bracket.l bold(K)(x, x_1), bold(K)(x, x_2), dots.c, bold(K)(x, x_M) bracket.r ∈ ℝ^(d times "Md"). $]

本文用到以下两类矩阵值核。

- 完全解耦核
  
  #eqnb[$ bold(K)(x, y) = K(x, y) bold(I)_(d times d) $]
  
  采用标量值核 $K(x, y)$ 时，它把向量值问题约化为 $d$ 个相互独立的标量值问题（见 6.4 小节）；
- 无散度核
  
  #eqnb[$ bold(K)_("df")(x, y) = (gradient^2 psi)(x - y) - ("tr" gradient^2 psi)(x - y) bold(I)_(d times d) $]
  
  采用标量值径向核 $psi(r)$ 时，它保证插值函数 $bold(u)$ 的散度恒为零（见 6.5 小节）。

= 附录 B　Γ–收敛理论

我们在自反 Banach 空间的框架下简要回顾 Γ–收敛理论，更详细的内容见 @dal1993introduction @braides2002gamma。设 $cal(X)$ 是自反 Banach 空间，$cal(X)^*$ 是它的对偶空间。

#thm("定义 B.1", title: "弱收敛")[
  $cal(X)$ 中的序列 $u_M$ 若弱收敛到 $u ∈ cal(X)$，记作 $u_M ⇀ u$，指的是
  #eqnb[$ "lim"_(M -> ∞) psi(u_M) = psi(u), quad ∀ psi ∈ cal(X)^* $]
]

设 $Omega$ 是 $ℝ^d$ 中的有界开集，边界为 Lipschitz 的。当 $cal(X) = L^p (Omega)$（$1 < p < ∞$）时，$L^p (Omega)$ 中的弱收敛 $u_M ⇀ u$ 意味着

#eqnb[$ "lim"_(M -> ∞) integral_Omega u_M (x) psi(x) dif x = integral_Omega u(x) psi(x) dif x, quad ∀ psi ∈ L^q (Omega) $]

这里 $q$ 满足 $1/p + 1/q = 1$。当 $cal(X) = W^(1,p) (Omega)$（$1 < p < ∞$）时，在 $W^(1,p) (Omega)$ 中 $u_M ⇀ u$ 等价于

#eqnb[$ u_M ⇀ u "in" L^p (Omega), quad gradient u_M ⇀ gradient u "in" L^p (Omega) $]

下面给出一种对本文最方便的 Γ–收敛定义。

#thm("定义 B.2", title: "Γ–收敛")[
  设 $F_M, F_∞: cal(X) -> (-∞, +∞]$ 是 $cal(X)$ 上的泛函。若下列两条性质都成立，就称泛函序列 $J_M$（$M ∈ ℕ_+$）Γ–收敛到 $J_∞$：
  
  - 下极限不等式：对每个 $u ∈ cal(X)$ 以及每个满足 $M -> ∞$ 时 $u_M ⇀ u$ 的序列 $u_M ∈ cal(X)$，都有
    #eqnb[$ "lim inf"_(M -> ∞) F_M (u_M) >= F(u) $]
  - 恢复序列：对每个 $u ∈ cal(X)$，存在序列 $u_M ∈ cal(X)$，使得 $M -> ∞$ 时 $u_M ⇀ u$，并且
    #eqnb[$ "lim"_(M -> ∞) F_M (u_M) = F(u) $]
]

由于 $cal(X)$ 是自反的，我们有如下的强制性与等强制性定义。

#thm("定义 B.3", title: "强制性")[
  若对每个 $beta ∈ ℝ$，水平集 $brace.l u ∈ cal(X): F(u) <= beta brace.r$ 在 $cal(X)$ 中有界，则称泛函 $F$ 是强制的。
]

#thm("定义 B.4", title: "等强制性")[
  若对每个 $beta ∈ ℝ$，水平集的并 $union_(M ∈ ℕ_+) brace.l u ∈ cal(X): F_M (u) <= beta brace.r$ 在 $cal(X)$ 中有界，则称泛函序列 $F_M$（$M ∈ ℕ_+$）是等强制的。
]

最后，我们陈述 Γ–收敛的基本定理。

#thm("定理 B.1", title: "Γ–收敛基本定理")[
  设 $F_M$（$M ∈ ℕ_+$）是 $cal(X)$ 上一列等强制性泛函。若 $F_M$ 在 $cal(X)$ 中 Γ–收敛到 $F$，且 $F$ 有唯一极小元，则 1) $F$ 是强制的；2) $F_M$ 的任一极小元序列都在 $cal(X)$ 中弱收敛到 $F$ 的极小元。
]

= 致谢

GS 参与本工作得到 DEVCOM 陆军研究实验室的资助（项目号 W911NF-19-1-0243）。感谢 Houman Owhadi 富有启发的讨论。
