#import "macros.typ": *

= 3　坏集与有界簇

定理 2.3 与引理 2.4 十分自然地引出“坏球”这一概念；下面沿 @CFFS2026 的做法将它引入。核心想法是：
- 离坏球越远，${u = 0}$ 就越接近一张极小曲面，参见式 (2.3)；
- 坏集则由稳定性来控制，这依靠引理 2.1。

一次性固定引理 2.4 在 $epsilon = "min" {macron(delta)/2, 1/100}$ 时给出的普适常数 $delta > 0$，其中 $macron(delta)$ 来自定理 2.3。这一取法与 $u$ 无关。

#thm("定义", title: "3.1（坏集、干净球）")[设 $u$ 是式 (1.1) 的有界整体稳定解，令
#eqn("(3.1)")[ $ cal(X) = {x: integral _ (B _ 2 (x)) cal(A)^2 abs(nabla u)^2 > delta} . $ ]
取一个极大的集合 $cal(Z) ⊂ cal(X)$，使得其中不同两点 $z, z'$ 恒有 $abs(z - z') >= 1$。若 $B _ (2R) (x) ∩ cal(X) = ∅$，则称球 $B _ R (x)$ 是干净的。]

由引理 2.4 以及 $delta$ 的这一定法，半径 $R >= R _ ast$ 的每个干净球都满足式 (2.2)。至于 $cal(X)$ 之外的零点，同样的 $C ^ 2$ 逼近给出：沿剖面方向的导数在该点的半单位球内有一致的正下界。于是，必要时把 $c _ ∘$ 改小一些，便有
#eqn("(3.2)")[ $ abs(nabla u) >= c _ ∘ quad "在" Sigma _ 0 ∖ cal(X) . $ ]
此外，对每个 $y ∈ Sigma _ 0 ∖ cal(X)$，$Sigma _ 0 ∩ B _ (1/2) (y)$ 是一张斜率一致有界的图。集合 $cal(Z)$ 局部有限；以它的各点为中心的单位球覆盖 $cal(X)$，而半径加倍之后这些球的重数不超过 $5^3$。

#thm("注记", title: "3.2")[对这个固定的 $delta$，$cal(X) = ∅$ 蕴含 $u$ 是一维的。事实上，引理 2.4 在每个 $x ∈ ℝ^3$ 附近都可用，故定理 2.3 的假设对任意大的 $R$ 都成立；令 $R → ∞$ 即知 $u$ 是一维的（例如参见式 (2.6)）。]

与 @CFFS2026 的引理 10.8 类似，一个对数截断的论证能找出任意宽的干净环域：

#thm("引理", title: "3.3（干净环域的存在）")[设 $cal(X) != ∅$。对每个 $L >= 1$ 与 $Lambda > 0$，存在 $z _ Lambda ∈ cal(Z)$ 与 $R _ Lambda > 1$，使得
#eqn("(3.3)")[ $ "dist"(x, cal(X)) >= L quad "对一切" x ∈ B _ (R _ Lambda + Lambda) (z _ Lambda) ∖ B _ (R _ Lambda) (z _ Lambda) . $ ]
]

#proof[这一论证是 @CFFS2026 中引理 10.8 证明的一个变体。首先注意到，由引理 2.1 与引理 2.2，
#eqn("(3.4)")[ $ integral cal(A)^2 abs(nabla u)^2 eta^2 <= integral abs(nabla u)^2 abs(nabla eta)^2 <= frac(1, 2) integral abs(nabla eta)^2 quad "对一切" eta ∈ C _ c ^ (0,1) (ℝ^3) . $ ]
取 $eta$ 在 $B _ t (a)$ 上恒等于 $1$、支撑在 $B _ (2t) (a)$ 中且 $abs(nabla eta) <= C / t$，并利用上面提到的重数界，得当 $t >= 1$ 时
#eqn("(3.5)")[ $ integral _ (B _ t (a)) cal(A)^2 abs(nabla u)^2 <= C t comma quad delta "#"(cal(Z) ∩ B _ t (a)) <= C integral _ (B _ (t + 2) (a)) cal(A)^2 abs(nabla u)^2 <= C t . $ ]
现在，若式 (3.3) 不成立，则对每个 $z ∈ cal(Z)$ 与每个 $r > 1$，都存在 $q ∈ cal(Z)$ 使得 $r - L - 1 < abs(q - z) < r + Lambda + L + 1$。取这样一列互不相交的区间并利用式 (3.5)，由此得到
#eqnb[ $ c t <= "#"(cal(Z) ∩ B _ t (z)) <= C t quad "对一切" z ∈ cal(Z) comma t >= t _ 0 , $ ]
其中 $t _ 0 >= 2$ 与 $c, C > 0$ 只依赖于 $L, Lambda$。这些线性界允许我们构造一个对数截断函数，它的 Dirichlet 能量小于它所保留的曲率质量：

固定 $z _ 0 ∈ cal(Z)$，取 $R$ 充分大，并令
#eqnb[ $ d _ R (x) = "dist"(x, ⋃ _ (q ∈ cal(Z) ∩ B _ R (z _ 0)) overline(B) _ 2 (q)) . $ ]
对 $3 t _ 0 <= t <= R$，集合 $cal(Z) ∩ B _ R (z _ 0)$ 的极大 $t$-分离子集至多有 $C R / t$ 个点，因为其互不相交的 $t/3$-球各含至少 $c t$ 个中心，而这些中心全都落在 $B _ (2R) (z _ 0)$ 内。由极大性，相应的 $3t$-球覆盖 ${d _ R < t}$。当 $t < 3 t _ 0$ 时，我们改为把原来的每个球 $B _ 2 (q)$ 放大到 $B _ (t + 2) (q)$ 来覆盖该集合，因为这样的球至多有 $C R$ 个。这两个覆盖给出
#eqnb[ $ abs({d _ R < t}) <= C R (1 + t)^ 2 quad "当" 0 < t <= R . $ ]
由于截断函数 $eta _ R = lr(( 1 - frac("log"(1 + d _ R), "log"(1 + R)) )) _ +$ 在定义 $d _ R$ 时所用的那些球 $B _ 2 (q)$ 上等于 $1$，于是
#eqnb[ $ integral cal(A)^2 abs(nabla u)^2 eta _ R^2 >= 5 ^ (-3) sum _ (q ∈ cal(Z) ∩ B _ R (z _ 0)) integral _ (B _ 2 (q)) cal(A)^2 abs(nabla u)^2 >= c R , $ ]
而前面的体积界则给出
#eqnb[ $
  integral abs(nabla eta _ R)^2 &<= frac(1, ("log"(1 + R))^2) integral _ ({0 < d _ R < R}) frac(upright(d)x, (1 + d _ R)^2) \
  &<= frac(1, ("log"(1 + R))^2) lr(( frac(abs({d _ R < R}), (1 + R)^2) + 2 integral _ 0 ^ R frac(abs({d _ R < t}), (1 + t)^3) upright(d)t )) \
  &<= frac(C R, "log"(1 + R)) ,
$ ]
这与式 (3.4) 在 $R → ∞$ 时矛盾。
]

#thm("定义", title: "3.4（有界簇及其邻域）")[设 $cal(X) != ∅$，固定 $L _ 0 >= 2$ 与 $Lambda >= 32 L _ 0$。在引理 3.3 中取 $L = 8 L _ 0$ 选出 $z _ Lambda, R _ Lambda$，并令
#eqnb[ $ cal(X) _ Lambda = cal(X) ∩ B _ (R _ Lambda) (z _ Lambda) comma quad cal(Z) _ Lambda = cal(Z) ∩ B _ (R _ Lambda) (z _ Lambda) comma quad N = "#"cal(Z) _ Lambda , $ ]
再定义到这一有界簇的距离及其邻域
#eqnb[ $ cal(D)(x) = "dist"(x, cal(X) _ Lambda) comma quad cal(S) _ alpha = {x: cal(D)(x) < alpha} quad (alpha > 0) , $ ]
并令 $Sigma = Sigma _ 0 ∩ {L _ 0 < cal(D) < Lambda / 3}$。]

由于式 (3.3) 中的环域与每个以 $z ∈ cal(X)$ 为中心、半径为 $8 L _ 0$ 的球 $B _ (8 L _ 0) (z)$ 都不相交，于是
#eqn("(3.6)")[ $ mat(delim: #none, align: std.left, abs(z - z _ Lambda) <= R _ Lambda - 8 L _ 0, quad "对一切" z ∈ cal(X) _ Lambda ","; abs(z - z _ Lambda) >= R _ Lambda + Lambda + 8 L _ 0, quad "对一切" z ∈ cal(X) ∖ cal(X) _ Lambda ".") $ ]
特别地，$overline(cal(X) _ Lambda)$ 非空且紧，并且 $1 <= N < ∞$。又 $cal(X) _ Lambda$ 的每一点到 $cal(Z) _ Lambda$ 的距离都不超过 $1$，由重数界，
#eqn("(3.7)")[ $ cal(S) _ alpha ⊂ ⋃ _ (z ∈ cal(Z) _ Lambda) B _ (alpha + 1) (z) comma quad delta N <= sum _ (z ∈ cal(Z) _ Lambda) integral _ (B _ 2 (z)) cal(A)^2 abs(nabla u)^2 <= 5^3 integral _ cal(S) _ 2 cal(A)^2 abs(nabla u)^2 . $ ]
再有，若 $cal(D)(x) < Lambda / 3$，则簇外的每个坏点到 $x$ 的距离至少为 $Lambda + 16 L _ 0 - cal(D)(x)$，而它大于 $cal(D)(x)$。由此
#eqn("(3.8)")[ $ "dist"(x, cal(X)) = cal(D)(x) quad "只要" cal(D)(x) < Lambda / 3 . $ ]
特别地，当 $L _ 0 < cal(D)(x) < Lambda / 3$ 时有 $B _ (cal(D)(x)/2) (x) ∩ cal(X) = ∅$，从而 $B _ (cal(D)(x)/4) (x)$ 是干净球。于是由式 (3.2)，$Sigma$ 是一张光滑嵌入曲面，且
#eqn("(3.9)")[ $ abs("II" _ Sigma (y)) <= C cal(D)(y) ^ (-1) comma quad abs(H _ Sigma (y)) <= C cal(D)(y) ^ (-2) quad "对一切" y ∈ Sigma . $ ]
当 $cal(D)(y) >= 4 R _ ast$ 时，这些界来自定理 2.3；在其余尺度上，它们来自式 (3.2) 与引理 2.2。
