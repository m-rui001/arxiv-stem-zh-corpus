#import "macros.typ": *

// 命题 4.7 的证明自 frag_7 末尾的 proofBegin 延续到本片段（式 (4.36)–(4.43)）。
// #include 无法跨文件传递内容参数，故这里用 proofContinue 接续同一缩进块：
// 开头不再印“证明。”，只在本证明真正结束处补上证毕方块 □，避免出现第二个“证明。”。
#let proofContinue(body) = block(
  width: 100%,
  above: 0em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #set par(first-line-indent: 0em)
    #body
    #align(right)[□]
  ],
)

#proofContinue[
最后，我们断言如下估计：

#eqn("(4.36)")[ $ frac(1, L _ 0) integral_(Sigma ∩ {2 L _ 0 < cal(D) < 4 L _ 0}) integral_(b _ -)^(b _ +) (abs(nabla u)^2 - tilde(xi)^2) upright(d) t <= C N L _ 0 ^ (-2) "log" L _ 0 , $ ]

#eqn("(4.37)")[ $ frac(1, L _ 0) integral_(cal(S)_(3 L _ 0) ∖ (cal(S)_(5 L _ 0 / 2) ∪ F(cal(N) ∩ {b _ - < t < b _ +}))) abs(nabla u)^2 <= C N L _ 0 ^ (-4) , $ ]

#eqn("(4.38)")[ $ frac(1, L _ 0) integral_(Sigma ∩ {2 L _ 0 < cal(D) < 4 L _ 0}) ( integral_(b _ - - 1)^(b _ -) tilde(xi)^2 upright(d) t + integral_(b _ +)^(b _ + + 1) tilde(xi)^2 upright(d) t ) <= C N L _ 0 ^ (-2) . $ ]

关于式 (4.36)：在未延长的区间上 $phi = tilde(phi) = 1$，于是由式 (4.11) 与式 (4.20) 有 $abs(nabla u)^2 - tilde(xi)^2 = abs(nabla _ (Gamma ^ t) u)^2 + (partial _ t u) _ -^2 <= C cal(D)(y)^(-4)$；这里用到，若 $partial _ t u < 0$，则式 (4.20) 本身给出 $abs(nabla u)$ 的上界。在长度不超过 $6 "log" cal(D)(y)$ 的区间上积分，并用引理 4.6，即得第一个估计。

要证式 (4.38)，把同一面积估计与外部单位窄带上的 $tilde(xi)^2 <= C cal(D)(y)^(-4)$ 相结合即可（回顾式 (4.21)）。

最后看式 (4.37)。积分区域中几乎每个点都满足 $"dist"(x, Sigma _ 0) >= 3 "log" L _ 0$。事实上，几乎每个更靠近的点都有唯一最近的零点 $y$，满足 $2 L _ 0 < cal(D)(y) < 4 L _ 0$ 且 $abs(t) < 3 "log" L _ 0 < T(y)$；沿该线段，这同一个零点始终保持唯一最近，故 $b _ - (y) < t < b _ + (y)$，这与这些像被排除在外相矛盾。仿照引理 2.2 的证明，利用离 $Sigma _ 0$ 足够远处 $abs(u) (1 + abs(u)) >= 3 / 2$，可得 $abs(nabla u) <= C e ^ ( - "dist"(x, Sigma _ 0) )$。于是由式 (3.7)，最后一项不超过 $C L _ 0 ^ (-7) abs(cal(S)_(3 L _ 0)) <= C N L _ 0 ^ (-4)$。

将式 (4.36)、(4.37)、(4.38) 代入式 (4.34)、(4.35)，即得式 (4.26)。

现在把式 (4.26) 右端的积分与式 (4.25) 中的几何项相比较，得到：

*第 2 步。* 有如下不等式

#eqn("(4.39)")[ $ integral_(cal(N))(1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) <= frac(9 sigma _ 0, 8) integral_(Sigma) abs(nabla _ Sigma phi)^2 - frac(3 sigma _ 0, 4) integral_(Sigma ∖ cal(S)_(4 L _ 0)) abs(upright("II") _ Sigma)^2 phi^2 + C integral_(Sigma ∖ cal(S)_(2 L _ 0)) cal(D)^(-13/4) phi^2 . $ ]

事实上，先在 $cal(N)$ 上分部积分，并用 $tilde(xi) = (partial _ t u) _ + tilde(phi) in H _ 0 ^ 1 (cal(N))$，得

#eqn("(4.40)")[ $ integral_(cal(N))(1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) &= integral_(cal(N))(1 - chi _ 0) (partial _ t u) _ + tilde(phi)^2 (-Delta + W''(u)) partial _ t u \ &+ integral_(cal(N))(1 - chi _ 0) (partial _ t u) _ + ^ 2 abs(nabla tilde(phi))^2 - integral_(cal(N))(partial _ t u) _ + ^ 2 tilde(phi) dot nabla chi _ 0 dot nabla tilde(phi) , $ ]

再将式 (4.10) 代入式 (4.40)，得

#eqn("(4.41)")[ $ integral_(cal(N))(1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) &= integral_(cal(N))(1 - chi _ 0) (partial _ t u) _ + ^ 2 (abs(nabla tilde(phi))^2 - abs(upright("II")_(Gamma ^ t))^2 tilde(phi)^2) \ &+ I _ 1 - I _ 2 . $ ]

其中

#eqnb[ $ I _ 1 &:= integral_(cal(N))(1 - chi _ 0) (partial _ t u) _ + tilde(phi)^2 (2 upright("II")_(Gamma ^ t) : nabla^2_(Gamma ^ t) u + nabla_(Gamma ^ t) H_(Gamma ^ t) dot nabla_(Gamma ^ t) u) , \ I _ 2 &:= integral_(cal(N))(partial _ t u) _ + ^ 2 tilde(phi) nabla chi _ 0 dot nabla tilde(phi) . $ ]

利用 $a b <= a ^ 2 / 8 + 2 b ^ 2$ 有

#eqnb[ $ (abs(upright("II")_(Gamma ^ t)) (partial _ t u) _ +) (2 abs(nabla^2_(Gamma ^ t) u)) <= frac(1, 8) abs(upright("II")_(Gamma ^ t))^2 (partial _ t u) _ +^2 + 8 abs(nabla^2_(Gamma ^ t) u)^2 , $ ]

于是由式 (4.11) 与式 (4.12) 可估计

#eqnb[ $ I _ 1 &<= frac(1, 8) integral_(cal(N))(1 - chi _ 0) abs(upright("II")_(Gamma ^ t))^2 (partial _ t u) _ +^2 tilde(phi)^2 + C integral_(Sigma ∖ cal(S)_(2 L _ 0)) (cal(D)^(-4) "log" cal(D) + cal(D)^(-10/3) "log" cal(D)) phi^2 \ &<= frac(1, 8) integral_(cal(N))(1 - chi _ 0) abs(upright("II")_(Gamma ^ t))^2 (partial _ t u) _ +^2 tilde(phi)^2 + C integral_(Sigma ∖ cal(S)_(2 L _ 0)) cal(D)^(-13/4) phi^2 . $ ]

这里用到 $b _ + - b _ - + 2 <= 6 "log" cal(D)(y) + 2$ 与 $(partial _ t u) _ + <= C$。

下面断言

#eqnb[ $ abs(I _ 2) <= C integral_(Sigma ∖ cal(S)_(2 L _ 0)) cal(D)^(-5) phi^2 . $ ]

在 ${nabla chi _ 0 != 0}$ 上有 $2 L _ 0 < cal(D)(y) < 4 L _ 0$ 且 $phi = chi(cal(D)(y) - L _ 0) = 1$。于是当 $b _ - < t < b _ +$ 时 $nabla tilde(phi) = 0$，故定义 $I _ 2$ 的被积函数只可能在

#eqnb[ $ b _ - - 1 < t < b _ - quad "或" quad b _ + < t < b _ + + 1 $ ]

上非零。在那里，式 (4.6) 与式 (4.21) 给出

#eqnb[ $ lr(abs((partial _ t u) _ +^2 tilde(phi) nabla chi _ 0 dot nabla tilde(phi))) <= C cal(D)(y)^(-4) phi^2 cal(D)(y)^(-1) . $ ]

积分即得断言。

综合上述估计，式 (4.41) 化为

#eqn("(4.42)")[ $ integral_(cal(N))(1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) <= integral_(cal(N))(1 - chi _ 0) (partial _ t u) _ + ^ 2 (abs(nabla tilde(phi))^2 - frac(7, 8) abs(upright("II")_(Gamma ^ t))^2 tilde(phi)^2) + C integral_(Sigma ∖ cal(S)_(2 L _ 0)) cal(D)^(-13/4) phi^2 . $ ]

剩下的，是对右端第一个积分沿法向方向积分，从而把 $cal(N)$ 换回 $Sigma$。我们断言：当 $L _ 0$ 充分大时，

#eqnb[ $ integral_(cal(N))(1 - chi _ 0) (partial _ t u) _ + ^ 2 abs(nabla tilde(phi))^2 &<= frac(9 sigma _ 0, 8) integral_(Sigma) abs(nabla _ Sigma phi)^2 + C integral_(Sigma ∖ cal(S)_(2 L _ 0)) cal(D)^(-4) phi^2 , \ integral_(cal(N))(1 - chi _ 0) abs(upright("II")_(Gamma ^ t))^2 (partial _ t u) _ +^2 tilde(phi)^2 &>= frac(7 sigma _ 0, 8) integral_(Sigma ∖ cal(S)_(4 L _ 0)) abs(upright("II") _ Sigma)^2 phi^2 . $ ]

对这两个不等式，都用式 (4.7) 与式 (4.13)，它们给出

#eqn("(4.43)")[ $ integral_(- frac(1,2) "log" cal(D)(y))^(frac(1,2) "log" cal(D)(y)) (partial _ t u)^2 upright(d) t = sigma _ 0 + o(1) , quad integral_(b _ - - 1)^(b _ + + 1) (partial _ t u) _ +^2 upright(d) t = sigma _ 0 + o(1) , $ ]

其中 $o(1) -> 0$ 关于 $cal(D)(y) >= L _ 0$ 在 $L _ 0 -> oo$ 时一致成立。在较小的区间上 $partial _ t u > 0$。

对第一个不等式，注意当 $cal(D)(y) <= 2 L _ 0$ 时 $1 - chi _ 0 = 0$。当 $cal(D)(y) > 2 L _ 0$ 时，在 $b _ - < t < b _ +$ 上有 $tilde(phi) = phi$，而式 (4.6) 与式 (4.21) 给出

#eqnb[ $ ( integral_(b _ - - 1)^(b _ -) + integral_(b _ +)^(b _ + + 1) ) (partial _ t u) _ +^2 abs(nabla tilde(phi))^2 "det"(upright("Id") - t upright("II") _ Sigma) upright(d) t <= C cal(D)(y)^(-4) (phi(y)^2 + abs(nabla _ Sigma phi(y))^2) . $ ]

在 $F$ 之下，切向导数乘以 $(upright("Id") - t upright("II") _ Sigma)^(-1) = upright("Id") + O(abs(t) cal(D)(y)^(-1))$，面积元乘以 $"det"(upright("Id") - t upright("II") _ Sigma) = 1 + O(abs(t) cal(D)(y)^(-1))$。于是式 (4.43) 给出第一个不等式。

对第二个不等式，把积分限制在满足 $cal(D)(y) >= 4 L _ 0$ 且 $abs(t) <= frac(1,2) "log" cal(D)(y)$ 的 $(y, t)$ 上——其余区域由正性直接舍去。在那里 $chi _ 0 = 0$、$tilde(phi) = phi$，且 $abs(upright("II")_(Gamma ^ t))^2 "det"(upright("Id") - t upright("II") _ Sigma) >= (1 - C abs(t) cal(D)(y)^(-1)) abs(upright("II") _ Sigma)^2$。因此式 (4.43) 的第一个等式给出第二个不等式。

把这两个不等式代入式 (4.42) 即得式 (4.39)。再结合式 (4.26)，便得到式 (4.25)。

]

式 (4.25) 中最后两个“误差”项可以立刻被吸收。这里的幂次 $- 13 / 4 < - 3$ 至关重要。

#thm("命题", title: "4.8（几何稳定性，去掉误差项）")[

考虑定义 3.4 中的设定。必要时增大 $R _ *$ 后，设 $L _ 0 >= 4 R _ *$ 且 $Lambda >= 32 L _ 0$。设 $phi : Sigma _ 0 -> [0, 1]$ 满足 $phi| _ Sigma in C ^ (0,1) (Sigma)$ 且

#eqnb[ $ phi = 1 quad "在" Sigma _ 0 ∩ cal(S)_(4 L _ 0) , space space phi = 0 quad "在" Sigma _ 0 ∩ {cal(D) >= Lambda / 4} . $ ]

则当 $L _ 0$ 充分大时，有

#eqn("(4.44)")[ $ frac(delta N, 2 dot 5^3 sigma _ 0) + integral_(Sigma ∖ cal(S)_(4 L _ 0)) abs(upright("II") _ Sigma)^2 phi^2 <= frac(3, 2) integral_(Sigma) abs(nabla _ Sigma phi)^2 . $ ]

$L _ 0$ 的下界阈值是普适的，与 $u$、$N$、$R _ Lambda$ 和 $Lambda$ 无关。

]

#proof[

在集合 $2^k L _ 0 <= cal(D) < 2^(k + 1) L _ 0$（$k >= 1$）上应用引理 4.6 中的三次面积界，并用 $0 <= phi <= 1$，得

#eqnb[ $ integral_(Sigma ∖ cal(S)_(2 L _ 0)) phi^2 cal(D)^(-13/4) upright(d) cal(H)^2 <= integral_(Sigma ∖ cal(S)_(2 L _ 0)) cal(D)^(-13/4) upright(d) cal(H)^2 <= C N sum_(k = 1)^oo (2^k L _ 0)^(-1/4) <= C N L _ 0 ^ (-1/4) . $ ]

取 $L _ 0$ 充分大，使式 (4.25) 的最后两项不超过 $frac(delta N, 2 dot 5^3 sigma _ 0)$。由于式 (3.7) 给出 $sigma _ 0^(-1) integral_(cal(S)_2) cal(A)^2 abs(nabla u)^2 >= frac(delta N, 5^3 sigma _ 0)$，这两项可被左端吸收，从而得到式 (4.44)。

]
