#import "macros.typ": *

= 附录 A　引理 5.3 的证明

#proof[
以下沿用第 5 节的记号。

由构造，$Sigma ∩ partial cal(B)$ 是一条光滑的紧致曲线，它可以为空，也可以不连通。从 $Sigma ∩ partial cal(B)$ 出发、长度不超过 $r$ 的每一条外部道路都落在
#eqn("(A.1)")[ $ Sigma _ 0 ∩ {4 L _ 0 <= cal(D) <= 4 L _ 0 + 2 + r} ⋐ Sigma comma quad r <= Lambda / 16 $ ]
之中。下界来自 $cal(S) _ (4 L _ 0) subset cal(B)$，上界则因为 $cal(D)$ 是 $1$-Lipschitz 的。若 $Sigma ∩ partial cal(B) = ∅$，则在 $Sigma ∖ cal(B)$ 上有 $d _ cal(B) = + infinity$，于是结论式 (5.2) 立得。

记 $K$ 为 $Sigma$ 的高斯曲率，并注意
#eqn("(A.2)")[ $ abs(upright("II") _ Sigma) <= frac(abs(D^2 u), abs(nabla u)) <= C comma quad K >= -frac(1, 2) abs(upright("II") _ Sigma)^2 >= -C^2 $ ]
这里 $C >= 1$ 是一个取定的普适常数。从 $Sigma ∩ partial cal(B)$ 出发的极小道路不可能再次碰到这条边界。对每个 $q in Sigma ∩ partial cal(B)$，取从 $q$ 出发、在 $Sigma$ 内垂直于该曲线、并指向 $Sigma ∖ cal(B)$ 一侧的单位速度测地线。用 $kappa(q)$ 记它的截点时间，在此时间之前它极小化到内边界的距离；用 $J(q,t)$ 记长度 Jacobi 因子，并以内边界上的弧长作为初始坐标。除去截迹（其面积测度为零）之外，距离有限且小于 $Lambda / 16$ 的每一点都落在唯一一条极小化法射线上。由 Jacobi 方程与面积公式得
#eqn("(A.3)")[ $ &J _ (t t) (q, t) = -K(q,t) J(q,t) comma quad J(q,0) = 1 comma quad J(q,t) > 0 quad "对" quad 0 < t < kappa(q) , \ &Theta(s) = integral_(Sigma ∩ partial cal(B)) integral _ 0 ^ (min {s, kappa(q)}) J(q,t) upright(d)t upright(d)cal(H)^1 (q) quad "对" quad 0 < s < Lambda / 16 . $ ]

对 $0 < t < kappa(q)$，由式 (A.3) 与式 (A.2) 得
#eqn("(A.4)")[ $ lr((J _ t / J))' + lr((J _ t / J))^2 = -K <= C^2 comma quad J _ t / J <= C coth(C t) . $ ]
式 (A.4) 中的第二个不等式由比较即得，因为 $J _ t / J$ 在零点处有限，而 $C coth(C t)$ 在该处趋于 $+ infinity$。特别地，由此得到的界在 $[1/2, 1]$ 上一致，且与内边界的曲率无关。

接着在这一区间中选取一条长度同样受控的水平集。由于 $d _ cal(B)$ 在其取值有限的分支上是局部 Lipschitz 的，并且在正距离处几乎处处有 $abs(nabla _ Sigma d _ cal(B)) = 1$，由协面积公式可取到 $b in [1/2, 1]$，使得 $cal(H)^1 ({d _ cal(B) = b}) <= 2 Theta(2)$。我们还可以要求这条水平集与截迹相交于一个长度为零的集合。把这一选取与式 (A.4) 的比较估计合起来，就有
#eqn("(A.5)")[ $ &lr(J _ t (q, b)) _ + <= C J(q,b) quad "只要" quad kappa(q) > b , \ &integral _ {q in Sigma ∩ partial cal(B): kappa(q) > b} J(q,b) upright(d)cal(H)^1 (q) = cal(H)^1 ({d _ cal(B) = b}) <= 2 Theta(2) . $ ]

固定 $2 <= r < Lambda / 16$。对 $b < t < kappa(q)$，将 Jacobi 方程积分两次，得
#eqnb[ $ J(q,t) <= J(q,b) + (t-b) lr(J _ t (q,b)) _ + + integral _ b ^ t (t-s) K(q,s) _ - J(q,s) upright(d)s , $ ]
先在 $b < t < min {r, kappa(q)}$ 上积分，再对满足 $kappa(q) > b$ 的那些射线积分；若积分至截点时间，则从下方取极限。为了恢复 $Theta(r)$，还要把距离不超过 $b$ 的点也计入，这部分的面积由 $Theta(2)$ 控制。加上这一贡献，并利用 Fubini 定理以及式 (A.3)–(A.5)，我们得到
#eqnb[ $ Theta(r) &<= C r^2 Theta(2) + frac(1, 2) integral_(Sigma ∖ cal(B)) K _ - lr((r - d _ cal(B))) _ + ^ 2 upright(d)cal(H)^2 \ &<= C r^2 Theta(2) + frac(1, 4) integral_(Sigma ∖ cal(B)) abs(upright("II") _ Sigma)^2 lr((r - d _ cal(B))) _ + ^ 2 upright(d)cal(H)^2 , $ ]
这里用到的事实是式 (A.2) 给出的 $K _ - <= abs(upright("II") _ Sigma)^2 / 2$。
]
