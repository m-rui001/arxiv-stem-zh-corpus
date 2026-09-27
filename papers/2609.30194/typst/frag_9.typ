#import "macros.typ": *

= 5　定理 1.1 的证明

现在借助命题 4.8 的几何稳定性不等式、内蕴面积估计与对数截断函数把证明收尾。我们先取 $L _ 0$ 充分大，并在尺度 $L _ 0$ 上为坏簇构造一个光滑邻域，使其边界与 $Sigma$ 横截相交。

#thm("引理", title: "5.1（坏集的大光滑邻域）")[在定义 3.4 的设定下，存在一个具有光滑边界的有界开集 $cal(B)$，使得：
#enum[
  下面这个包含关系成立
  #eqn("(5.1)")[ $ cal(S) _ (4 L _ 0) subset cal(B), quad quad overline(cal(B)) subset cal(S) _ (4 L _ 0 + 2) ⋐ B _ (R _ Lambda) (z _ Lambda). $ ]

  $partial cal(B) subset { 3 L _ 0 < cal(D) < 5 L _ 0 }$，且 $partial cal(B)$ 与 $Sigma _ 0$ 横截。特别地，$Sigma ∩ partial cal(B)$ 是一条光滑的紧曲线，可以为空，也可以不连通。
]
]

#proof[
把 $cal(D)$ 磨光，得到光滑函数 $tilde(cal(D))$，满足 $abs(tilde(cal(D)) - cal(D)) < 1/4$。由于 $overline(cal(X) _ Lambda)$ 有界，$tilde(cal(D))$ 在无穷远处趋于无穷。由式 (3.8) 与式 (3.9)，零水平集在 ${ 3 L _ 0 < cal(D) < 5 L _ 0 } subset { L _ 0 < cal(D) < Lambda/3 }$ 上是光滑的。由 Sard 定理，存在 $t _ 0 in (4 L _ 0 + 1/2, 4 L _ 0 + 1)$，它既是 $tilde(cal(D))$ 在 $ℝ^3$ 上的正则值，也是它在这部分 $Sigma _ 0$ 上的正则值。于是 $cal(B) = { tilde(cal(D)) < t _ 0 }$ 是一个具有光滑边界的有界集，并且由逼近估计与式 (3.6) 即得式 (5.1)。其边界含于 ${ 3 L _ 0 < cal(D) < 5 L _ 0 }$，且由 $t _ 0$ 的取法与 $Sigma _ 0$ 横截。
]

固定这一选取的 $cal(B)$，它扮演的角色相当于文献 @CFFS2026 中 (10.13)–(10.17) 的有界坏区域；较小的集合 $cal(S) _ 2 subset cal(B)$ 则按照式 (3.7) 携带着正曲率质量。

我们先引入从 $partial cal(B)$ 出发的内蕴距离，以及距离邻域的内蕴面积。

#thm("定义", title: "5.2（内蕴距离与内蕴面积）")[对 $y in Sigma ∖ cal(B)$，令
#eqnb[ $ d _ cal(B) (y) = "dist" _ (Sigma ∖ cal(B)) (y, Sigma ∩ partial cal(B)) , $ ]
即 $Sigma ∖ cal(B)$ 内连接 $y$ 与 $Sigma ∩ partial cal(B)$ 的路径长度之下确界；在不与该边界相交的连通分支上它取值为 $+ infinity$，并在 $Sigma ∩ cal(B)$ 上按零延拓。

把内蕴邻域的面积记作
#eqnb[ $ Theta(r) = cal(H)^2 lr({ y in Sigma: 0 < d _ cal(B) (y) < r }) . $ ]
]

下面的结果把内蕴面积与稳定性中的曲率项联系起来。在 $d _ cal(B) = + infinity$ 处，我们约定 $(r - d _ cal(B)) _ + = 0$。

#thm("引理", title: "5.3（面积与曲率的关系）")[对 $2 <= r < Lambda/16$，有
#eqn("(5.2)")[ $ Theta(r) <= frac(1, 4) integral_(Sigma ∖ cal(B)) abs(upright("II") _ Sigma)^2 lr((r - d _ cal(B)) _ +)^2 d cal(H)^2 + C r^2 Theta(2) , $ ]
其中 $C$ 为普适常数。
]

#proof[
类似的面积–曲率估计出现在文献 @CFFS2026 的引理 10.16 及命题 10.17 的证明中。为完整起见，我们在附录 A 中用法向的 Jacobi 场给出一个自洽的证明。
]

最后给出主定理（定理 1.1）的证明：

#proof[
假设 $u$ 不是一维的。则由注记 3.2，$cal(X) != ∅$。先取充分大的普适常数 $L _ 0$，再取 $Lambda$ 充分大、仅依赖于 $L _ 0$。

从此刻起，我们在定义 3.4 的设定下工作。考虑引理 5.1 中构造的光滑集合 $cal(B)$，以及定义 5.2 中的内蕴距离与内蕴面积。注意命题 4.8 对每个容许的 $phi$ 都适用，并且 $L _ 0$ 与 $Lambda$ 的下界阈值只依赖于普适常数，与坏中心的个数 $N$ 以及簇的半径 $R _ Lambda$ 无关。

#text(weight: "bold")[第 1 步：面积的二次增长。]　我们首先证明
#eqn("(5.3)")[ $ Theta(r) <= C r^2 Theta(2) quad "对" quad 2 <= r < Lambda/16 comma quad quad "且" quad Theta(2) <= C N L _ 0^3 . $ ]

事实上，固定满足 $2 <= r < Lambda/16$ 的 $r$，在 $Sigma _ 0 ∩ cal(B)$ 上令 $phi = 1$，在 $Sigma ∖ cal(B)$ 上令 $phi = lr((1 - d _ cal(B) / r) _ +)$，在其余的零水平集上置 $phi = 0$。它在 $cal(B)$ 之外的支撑含于
#eqn("(5.4)")[ $ { 4 L _ 0 <= cal(D) <= 4 L _ 0 + 2 + r } ⋐ { L _ 0 < cal(D) < Lambda/4 } . $ ]
于是 $phi$ 对命题 4.8 是容许的；把它与引理 5.3 结合起来，得到
#eqnb[ $ frac(Theta(r), r^2) &<= frac(1, 4) integral_(Sigma ∖ cal(B)) abs(upright("II") _ Sigma)^2 lr((1 - d _ cal(B)/r) _ +)^2 + C Theta(2) \ &<= frac(3, 8) integral_Sigma abs(nabla _ Sigma phi)^2 + C Theta(2) = frac(3, 8) frac(Theta(r), r^2) + C Theta(2) . $ ]
吸收即得式 (5.3) 中的第一个估计。最后，$Theta(2)$ 的界来自式 (4.24)，因为 ${ 0 < d _ cal(B) < 2 } subset Sigma ∩ { cal(D) < 4 L _ 0 + 4 }$。

#text(weight: "bold")[第 2 步：对数截断与矛盾。]　考虑第二个测试函数：在 $Sigma _ 0 ∩ cal(B)$ 上仍有 $phi = 1$，而在 $Sigma ∖ cal(B)$ 上令
#eqn("(5.5)")[ $ phi = lr(1 - frac("log" lr("max" lr({ 2, d _ cal(B) }) / 2), "log" (Lambda/64))) _ + quad quad "在" quad Sigma ∖ cal(B) . $ ]
在其余的零水平集上以及 $d _ cal(B) = + infinity$ 处，仍置 $phi = 0$。其外部支撑满足 $d _ cal(B) <= Lambda/32$，故由式 (5.4)（取 $r = Lambda/32$）可知容许性成立。在 $2^j < d _ cal(B) < 2^(j+1)$ 上，式 (5.5) 给出 $abs(nabla _ Sigma phi) <= 2^(-j) / "log" (Lambda/64)$。与梯度支撑相交的那些区间满足 $j >= 1$ 且 $2^j < Lambda/32$，从而 $2^(j+1) < Lambda/16$。因此式 (5.3) 在每个区间上都可用，于是
#eqnb[ $ integral_Sigma abs(nabla _ Sigma phi)^2 &<= frac(1, "log"^2 (Lambda/64)) sum _ (mat(delim: #none, "对" "j >= 1"; "且" "2^j < Lambda/32")) 2^(-2j) Theta(2^(j+1)) <= frac(C Theta(2), "log" Lambda) \ &<= frac(C N L _ 0^3, "log" Lambda) . $ ]
把它与式 (4.44) 结合，得 $c delta N <= frac(C N L _ 0^3, "log" Lambda)$；当 $Lambda$ 充分大（仅依赖于 $L _ 0$）时这是不可能的，矛盾。因此 $u$ 是一维的。稳定的一维解只有常数 $±1$ 和异宿剖面 $g$ 的平移，再结合 $abs(u) < 1$，得 $u(x) = g(e dot x - t _ 0)$。
]
