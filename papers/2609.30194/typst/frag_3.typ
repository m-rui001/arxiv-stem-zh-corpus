#import "macros.typ": *

= 2　预备知识

本节先给出一批预备结果及其推论，它们在整个证明中都会反复用到。

== 2.1　记号

除另有说明外，本文中的 $u$ 恒指式 (1.1) 在 $ℝ^3$ 中的有界整体稳定解。记
#eqnb[ $ sigma _ 0 := integral _ ℝ g'(t)^2 dif t = frac(2 sqrt(2), 3), quad Sigma _ lambda = {u = lambda}. $ ]
再定义
#eqnb[ $ cal(A)(u)^2 = frac(abs(D^2 u)^2 - abs(nabla abs(nabla u))^2, abs(nabla u)^2) quad "在" {nabla u != 0} "上", quad cal(A) = 0 quad "在" {nabla u = 0} "上." $ ]
在一个正则水平集上，取法向 $nu = nabla u slash abs(nabla u)$，并设第二基本形式为 $upright("II")(X, Y) = - ⟨D _ X nu, Y⟩$，则有
#eqnb[ $ cal(A)^2 = abs(upright("II") _(Sigma _ lambda))^2 + abs(nabla _(Sigma _ lambda) "log" abs(nabla u))^2. $ ]
此外还有恒等式
#eqnb[ $ cal(A)^2 abs(nabla u)^2 = abs(D^2 u)^2 - abs(nabla abs(nabla u))^2 quad "几乎处处." $ ]
用 $H = "tr" upright("II")$ 表示平均曲率。对尺寸相同的实矩阵 $A$ 与 $B$，记 $A : B := sum_(i,j) A_(i j) B_(i j) = "tr"(A^("T") B)$ 为它们的 Frobenius 内积。

== 2.2　已知工具

稳定性不等式有一个用 $cal(A)$ 表述的标准形式，即 Sternberg–Zumbrun 不等式 @SZ98：

#thm("引理", title: "2.1（Sternberg–Zumbrun 不等式）")[设 $U subset ℝ^3$ 为开集，$u$ 是式 (1.1) 在 $U$ 中的经典稳定解。则对每个 $phi in C _ c ^(0,1) (U)$，
#eqnb[ $ integral _ U cal(A)^2 abs(nabla u)^2 phi^2 <= integral _ U abs(nabla u)^2 abs(nabla phi)^2. $ ]
]

下面回顾 Allen–Cahn 方程经典解的标准正则性估计：

#thm("引理", title: "2.2（一致正则性与衰减）")[式 (1.1) 的每个有界整体经典解都满足
#eqn("(2.1)")[ $ abs(u) <= 1, quad abs(nabla u) <= frac(1, sqrt(2)), quad abs(D^m u) <= C _ m quad "对" m >= 2, $ ]
其中 $C _ m$ 只依赖于 $m$。另有普适常数 $c, C > 0$，使得对一切 $x in ℝ^3$ 成立
#eqnb[ $ 1 - abs(u(x)) + abs(nabla u(x)) + abs(D^2 u(x)) <= C e^(-c "dist" (x, Sigma _ 0)). $ ]
特别地，无零点的有界整体解必恒等于 $1$ 或 $-1$。]

#proof[一致界来自 @FS2025 的引理 2.1 与内部椭圆估计。指数衰减来自 @KLP2012 引理 4.2 的证明，而该证明在 $ℝ^3$ 中同样适用。]

== 2.3　Wang–Wei 的估计

这里给出 Wang–Wei 的结果 @WW2019 的一些推论（由于我们在式 (1.1) 里对双阱势的选取与 @WW2019 相差一个常数因子，相应的归一化也作了调整）。下文中 $B' _ r$ 表示 $ℝ^2$ 中半径为 $r > 0$ 的球。

#thm("定理", title: "2.3（Wang–Wei 分层与剖面估计）")[存在普适常数 $c, c _ ∘, C, macron(delta) > 0$ 与 $R _ ast >= 4$，使得下述结论成立。

设 $R >= R _ ast$，且 $u: B_(2R) -> (-1, 1)$ 是式 (1.1) 的稳定解。假设对每个 $x in B_(3R slash 2)$ 都存在 $e _ x in bb(S)^2$ 与 $a _ x in ℝ$，使得
#eqn("(2.2)")[ $ "sup" _ (y in B _ 2 (x)) abs(u(y) - g(e _ x dot y + a _ x)) <= macron(delta). $ ]
则在 $Sigma _ 0 ∩ B _ R$ 上有 $abs(nabla u) >= c _ ∘$，于是 $Sigma _ 0$ 在该处光滑。

对每个 $x _ 0 in Sigma _ 0 ∩ B _ R$，存在以 $x _ 0$ 为中心的标准正交坐标 $(x', s)$，以及 $B'_(8 c R)$ 上一列依次排列的光滑有序零图 $f _ 1 < dots.c < f _ Q$，它们整体包含在 $B_(R slash 2)(x _ 0)$ 中，并具有下面这些性质：记
#eqnb[ $ Gamma _ j = {(x', f _ j (x')): x' in B'_(4 c R)}. $ ]
则：

（i）*图表示与几何估计。*
#eqn("(2.3)")[ $ mat(delim: #none, align: std.left, Sigma _ 0 ∩ B_(2 c R)(x _ 0) = ⋃_(j=1)^Q (Gamma _ j ∩ B_(2 c R)(x _ 0)) "," ; norm(D f _ j)_oo + R norm(upright("II")_(Gamma _ j))_(C^(0,1)) + R^2 norm(H_(Gamma _ j))_(C^(0, 1 slash 2)) <= C ".") $ ]

（ii）*叶的分离。*
#eqn("(2.4)")[ $ "dist" (y, Gamma _ k) >= sqrt(2) "log" R - C quad "对" y in Gamma _ j ∩ B_(2 c R)(x _ 0), quad k != j. $ ]

（iii）*剖面逼近。*记 $d _ j$ 为到延拓后的第 $j$ 张图的带号距离，在其上方取正。每个 $d _ j$ 在 $B_(c R)(x _ 0)$ 内光滑，且存在 $sigma in {-1, 1}$，使得未平移的剖面和满足
#eqn("(2.5)")[ $ mat(delim: #none, align: std.left, norm(u - G _ 0)_(C^(2)(B_(c R)(x _ 0))) <= C R^(-2) "," ; sigma G _ 0 (x) = sum_(j=1)^Q (-1)^(j-1) g(d _ j (x)) - frac(1 + (-1)^Q, 2) ".") $ ]
]

#proof[由 @WW2019 的推论 1.3（第 4 页）及其证明（第 71 页），并结合三维极小曲面的稳定 Bernstein 定理，
#eqn("(2.6)")[ $ abs(nabla u) >= c _ ∘, quad cal(A)(u) <= C R^(-1) quad "在" B_(R slash 4)(x _ 0) ∩ {abs(u) <= 9 slash 10} "内." $ ]
这就是说 $u$ 满足 Wang–Wei 估计所需的"分层假设"。于是 @WW2019 的引理 2.2、式 (3.3)、引理 3.1、式 (11.1) 及其下方显示式、命题 10.1 给出式 (2.3)，而 @WW2019 的命题 10.1 对应式 (2.4)。

至于式 (2.5)，记 $G _ h$ 为 @WW2019 第 (4.3) 式与命题 4.1 中构造的、经过平移与截断的剖面和，并用我们原来的坐标来表达它（本质上它就是式 (2.5) 中的剖面，只是在法方向上带有平移 $h _ j (x)$，并且在远离各层之处被截断）。由 @WW2019 的式 (11.1) 及其后的显示式（第 67 页）与引理 4.6，
#eqn("(2.7)")[ $ norm(u - G _ h)_(C^(2)(B_(c R)(x _ 0))) + "sup" _ j norm(h _ j)_(C^(2)(Gamma _ j)) <= C R^(-2). $ ]
接下来注意到：去掉截断与去掉平移所带来的误差可以求和，并且对叶的个数一致。事实上，式 (2.4) 一致地控制了与任一定点的距离不超过 $C "log" R$ 的那些叶的个数，而其余各叶及其前两阶导数的贡献由指数衰减可求和。因此 @WW2019 第 4.1 节的截断构造与式 (2.7) 给出
#eqnb[ $ norm(G _ h - G _ 0)_(C^(2)(B_(c R)(x _ 0))) <= C R^(-2), $ ]
其中的 $C$ 与 $Q$ 无关。把上述估计合起来即得式 (2.5)。]

满足式 (2.2) 的球被视作"好球"（参见下文的干净球），因为在其中 ${u = 0}$ 是光滑的并带有相应的估计。条件 (2.2) 与稳定性不等式很容易联系起来，下面是我们真正要用到的形式：

#thm("引理", title: "2.4")[对每个 $epsilon > 0$，存在 $delta > 0$，使得只要式 (1.1) 的有界整体稳定解 $u$ 满足
#eqnb[ $ integral _(B _ 2) cal(A)^2 abs(nabla u)^2 <= delta, $ ]
就存在 $e in bb(S)^2$ 与 $t _ 0 in ℝ$，使得
#eqnb[ $ norm(u(x) - g(e dot x - t _ 0))_(C^(2)(B _ 2)) < epsilon. $ ]
]

#proof[固定 $epsilon > 0$。由紧性（如 @FS2025 定理 3.4 证明中的做法），存在 $lambda > 0$，使得凡满足 $abs(u(0)) > 1 - lambda$ 的解，在 $C^(2)(B _ 2)$ 中与某个常数 $±1$ 的距离都不超过 $epsilon slash 2$。而这些常数是平移异宿解的极限，故此时结论成立。

若在余下的情形中，当 $delta ↓ 0$ 时结论不成立，则紧性给出 $C^(2) _("loc") (ℝ^3)$ 中的一个稳定极限 $u _ infinity$，且 $abs(u _ infinity (0)) <= 1 - lambda$。于是在 $B _ 2 ∩ {nabla u _ infinity != 0}$ 上使用 Fatou 引理可得曲率消失，从而在 $B _ 2$ 中 $cal(A)(u _ infinity) equiv 0$。但这样一来（见 @FS2025 的引理 2.6 与命题 2.8）$u _ infinity$ 就是一个平移异宿解，与在 $C^(2)(B _ 2)$ 中逼近不成立相矛盾。]
