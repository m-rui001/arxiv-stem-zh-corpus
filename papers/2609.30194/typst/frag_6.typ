#import "macros.typ": *

== 4.1　切向与法向估计

本节沿用定义 4.1 中的法坐标与端点。先记录法向导数所满足的方程。

#thm("引理", title: [4.3（沿 $partial _t$ 方向的求导方程）])[
设 $Gamma$ 为带单位法向量 $nu$ 的光滑定向曲面。在 $F(y,t) = y + t nu(y)$ 确定光滑法坐标之处，式 (1.1) 的解满足
#eqn("(4.10)")[ $ ( -Delta + W''(u) ) partial _t u = -abs(upright("II") _ (Gamma^t))^2 partial _t u + 2 upright("II") _ (Gamma^t) : nabla _ (Gamma^t)^2 u + nabla _ (Gamma^t) H _ (Gamma^t) dot nabla _ (Gamma^t) u . $ ]
其中 $Gamma^t = F(Gamma, t)$ 由法向量 $nu (F(y,t)) = nu (y)$ 定向，并采用约定 $upright("II") _ (Gamma^t) = - D nu | _ (T Gamma^t)$ 与 $H _ (Gamma^t) = "tr" upright("II") _ (Gamma^t)$。这里的 Hessian $nabla _ (Gamma^t)^2 u$ 是内蕴的。
]

#proof[
Fermi 坐标下的拉普拉斯算子为
#eqnb[ $ Delta = partial _ t ^ 2 - H _ (Gamma^t) partial _t + Delta _ (Gamma^t) . $ ]
此外，@CM2020 附录 A 中的 (A.3) 与 (A.7) 两个变分公式（在 $ℝ^3$ 中套用，并取我们的符号约定）给出
#eqnb[ $ mat(delim: #none, partial _t H _ (Gamma^t) = abs(upright("II") _ (Gamma^t))^2 comma quad quad quad; lr([partial _t comma Delta _ (Gamma^t)]) u = 2 upright("II") _ (Gamma^t) : nabla _ (Gamma^t)^2 u + nabla _ (Gamma^t) H _ (Gamma^t) dot nabla _ (Gamma^t) u) $ ]
再对 $Delta u = W'(u)$ 关于 $t$ 求导，即得式 (4.10)。
]

接下来在整个区域 $cal(N)$ 上建立切向导数与衰减估计。

#thm("引理", title: [4.4（切向导数与衰减估计）])[
在本节开头固定的设定下，必要时增大 $L _ 0$ 后，对某个普适常数 $C$，下列估计对一切 $(y,t) in cal(N)$ 成立：
#eqn("(4.11)")[ $ abs(nabla _ (Gamma^t) u) + abs(nabla _ (Gamma^t)^2 u) <= C cal(D)(y) ^ (-2) , $ ]
#eqn("(4.12)")[ $ abs(nabla _ (Gamma^t) H _ (Gamma^t)) <= C cal(D)(y) ^ (-4/3) , $ ]
#eqn("(4.13)")[ $ abs(nabla u) + abs(D^2 u) <= C (e ^ (-sqrt(2) abs(t)) + cal(D)(y) ^ (-2)) . $ ]
]

#proof[
固定 $y in Sigma$，并在扩张后的坐标卡中，取线段 $\{F(y,t): 0 <= t <= b _ + (y) + 1\}$ 的一个固定的单位邻域。记 $r$ 为到上邻叶的距离（当它出现在局部图中时）。定理 2.3 保证 $r$ 在整个该邻域内光滑；在其最近点处记该叶的法向量为 $nu _ + = - nabla r$。我们将用到的剖面近似（它是式 (2.5) 的推论，见下文）为
#eqn("(4.14)")[ $ mat(delim: #none, sum _ (k = 0) ^ 2 abs(D ^ k (u - g(t) - g(r) + 1)) <= C cal(D)(y) ^ (-2) comma; nabla r = -nu _ + comma quad partial _t r = -nu (y) dot nu _ + comma quad "在" F(y,t) .) $ ]
这里求和中的导数是 $F(y,t)$ 处的环境欧氏导数，而 $t$ 表示到起始叶的局部带符号距离函数。若不存在上邻叶，则省略项 $g(r) - 1$ 及其导数。任何进入或离开该坐标卡的叶，到所考察的点 $F(y,t)$ 的距离至少为 $c cal(D)(y)$，因此它的剖面尾部及其前两阶导数指数小，可吸收进 $C cal(D)(y) ^ (-2)$ 的误差。

为得到式 (4.14)，取 $R = cal(D)(y) / 4$ 套用式 (2.5)。这在 $C^2$ 意义下把 $u - G _ 0$ 控制到 $C cal(D)(y) ^ (-2)$，故只需估计被省略剖面的贡献。对此注意到：坐标卡内，从保留叶之间的区域通往第 $k$ 个更远叶的线段要穿过 $k$ 个连续间隙，于是由式 (2.4)，其长度至少为 $k (sqrt(2) "log" R - C)$。把区域扩大一个固定的单位邻域，至多使该下界减少一个普适常数。因此，剖面的指数衰减把被省略尾部之和及其前两阶导数控制到
#eqnb[ $ C sum _ (k >= 1) e ^ (-sqrt(2) k (sqrt(2) "log" R - C)) + C Q e ^ (-c R) <= C R ^ (-2) . $ ]
（这里用到带符号距离的导数有界以及 $Q <= C R$；最后一项对应距离至少为 $c R$ 的叶。）若无上邻叶，则只剩下方一侧的求和。式 (4.14) 中的符号之所以成立，是因为在这两张叶之间 $u > 0$，而它们使 $u$ 增大的法向指向相反方向。

若不存在上邻叶，则由 $g(t)$ 在 $Gamma^t$ 上为常数，式 (4.14) 立刻给出式 (4.11)。故可设有上邻叶。先设式 (4.1) 中的 $b _ + (y)$ 为等距端点。定理 2.3 中的间距估计给出
#eqn("(4.15)")[ $ e ^ (-sqrt(2) b _ + (y)) (2 b _ + (y) - sqrt(2) "log" cal(D)(y) + C) <= C cal(D)(y) ^ (-1) . $ ]
在 $t = b _ + (y) - s$（$0 <= s <= b _ + (y)$）处，邻叶的法向量 $nu _ +$ 在到 $F(y,t)$ 的最近点处的取值，与其在 $t = b _ + (y)$ 处的取值之差至多为 $C s cal(D)(y) ^ (-1)$，而 $r >= b _ + (y) + s / 2$。把法向比较式 (4.8) 与式 (4.15) 结合，得到
#eqn("(4.16)")[ $ mat(delim: #none, ( g'(r) + abs(g''(r)) ) abs(nabla _ (Gamma^t) r) <=; C cal(D)(y) ^ (-1) e ^ (-sqrt(2) b _ + (y) - s / sqrt(2)) (2 b _ + (y) - sqrt(2) "log" cal(D)(y) + C + s) <= C cal(D)(y) ^ (-2) .) $ ]
式 (4.16) 对 $b _ + (y) <= t < b _ + (y) + 1$ 同样成立：距离 $r$ 至多变化 $1$，而由式 (2.3)，邻叶法向量 $nu _ + = - nabla r$ 至多变化 $C cal(D)(y) ^ (-1)$；此外，对两张叶用式 (2.3) 得 $g'(r) <= C cal(D)(y) ^ (-1)$ 与 $abs(nabla _ (Gamma^t)^2 r) <= C cal(D)(y) ^ (-1)$。由链式法则
#eqn("(4.17)")[ $ nabla _ (Gamma^t)^2 g(r) = g''(r) nabla _ (Gamma^t) r ⊗ nabla _ (Gamma^t) r + g'(r) nabla _ (Gamma^t)^2 r , $ ]
于是，由于 $g(t)$ 在 $Gamma^t$ 上为常数，由式 (4.14)、式 (4.16) 与式 (4.17) 可推出该半段区间上的式 (4.11)。反之，若在达到等距之前端点就已截断，即 $b _ + (y) = T(y)$，则 $r(y, T(y)) >= T(y)$。若存在 $t _ 0 in [0, T(y)]$ 使 $r(y, t _ 0) < T(y)$，则由 $1$-Lipschitz 性质，在 $[0, T(y)]$ 上恒有 $r(y,t) <= r(y,t _ 0) + abs(t - t _ 0) < 2 T(y) = 6 "log" cal(D)(y)$。于是由 @WW2019 的引理 3.4 与式 (4.14) 得 $partial _t r <= 0$，从而 $r(y, T(y)) <= r(y, t _ 0) < T(y)$，矛盾。故在该线段上 $r(y,t) >= T(y)$。在附加的单位窄带上利用 $abs(partial _t r) <= 1$，邻叶尾部满足
#eqnb[ $ mat(delim: #none, r(y,t) >= T(y) - (t - T(y)) _ + >= T(y) - 1 comma; sum _ (k = 0) ^ 2 abs(D ^ k (g(r) - 1)) <= C e ^ (-sqrt(2) r(y,t)) <= C cal(D)(y) ^ (-3 sqrt(2)) <= C cal(D)(y) ^ (-2) comma quad 0 <= t < T(y) + 1) $ ]
（这里用到 $abs(nabla r) = 1$、$abs(D^2 r) <= C cal(D)(y) ^ (-1)$ 以及 $T(y) = 3 "log" cal(D)(y)$。）这就在截断情形（连同其外部单位窄带）也建立了式 (4.11)。改用下邻叶，同一论证证明 $t <= 0$ 时的式 (4.11)。对 $(y,t) in cal(N)$，其余每张叶的距离都至少为 $abs(t) - 2$，把指数衰减的剖面前两阶导数求和，即得式 (4.13)。

对式 (4.12)，式 (2.3) 中的估计给出
#eqn("(4.18)")[ $ norm(H _ Gamma) _ (C ^ (0, 1/2)) <= C cal(D)(y) ^ (-2) comma quad quad norm(upright("II") _ Gamma) _ (C ^ (0, 1)) <= C cal(D)(y) ^ (-1) , $ ]
其中各范数都在固定大小的局部片上取值。为估计 $D H _ Gamma$，我们把 $H _ Gamma$ 的 Hölder 界与 $D^2 H _ Gamma$ 的一致界插值。为得到后者，注意式 (4.7) 给出 $abs(nabla u) >= g'(0) - C cal(D)(y) ^ (-2) >= c > 0$ 在每个零点处成立；把它与式 (1.1) 的内部正则性结合，由隐函数定理便得一致的 $C^4$ 图界，从而在图坐标下 $abs(D^2 H _ Gamma) <= C$。把这一界与式 (4.18) 结合，并沿坐标线套用 Taylor 公式，得到
#eqn("(4.19)")[ $ abs(D H _ Gamma) <= C cal(D)(y) ^ (-2) h ^ (-1/2) + C h <= C cal(D)(y) ^ (-4/3) comma quad quad h = cal(D)(y) ^ (-4/3) . $ ]
平行曲面的第二基本形式为 $upright("II") _ (Gamma^t) = upright("II") _ Gamma (upright("Id") - t upright("II") _ Gamma) ^ (-1)$，对其迹求导并利用式 (4.18) 与式 (4.19)，得
#eqnb[ $ abs(nabla _ (Gamma^t) H _ (Gamma^t)) <= C abs(nabla _ Gamma H _ Gamma) + C abs(t) abs(upright("II") _ Gamma) abs(nabla _ Gamma upright("II") _ Gamma) <= C cal(D)(y) ^ (-4/3) + C cal(D)(y) ^ (-2) "log" cal(D)(y) <= C cal(D)(y) ^ (-4/3) , $ ]
这就证明了式 (4.12)。
]

最后，下面这条引理沿法向射线比较 $abs(nabla u)$ 与 $partial _t u$，并证明过了端点之后 $(partial _t u) _ +$ 很小。在一个理想化的情形（参见 @fig-periodic）中，我们穿过 $u$ 的极大点与极小点，因而 $partial _t u$ 变号。

#figure(
  include "fig/periodic.typ",
  caption: [周期性一维转变的示意。],
  placement: none,
) <fig-periodic>

#thm("引理", title: [4.5（与正法向导数的比较）])[
在本节开头固定的设定下，
#eqn("(4.20)")[ $ 0 <= abs(nabla u) - (partial _t u) _ + <= C cal(D)(y) ^ (-2) quad "当" b _ - (y) <= t <= b _ + (y) . $ ]
此外，在端点之外的单位窄带上还有如下估计：
#eqn("(4.21)")[ $ (partial _t u) _ + <= C cal(D)(y) ^ (-2) quad "若" b _ + (y) <= t < b _ + (y) + 1 quad "或" b _ - (y) - 1 < t <= b _ - (y) . $ ]
]

#proof[
使用引理 4.4 证明中的剖面表示式 (4.14)。若局部坐标卡中没有上邻叶，它给出 $nabla u = g'(t) nu (y) + O (cal(D)(y) ^ (-2))$。截断之前任何前来竞争的零点距 $y$ 不超过 $2 T(y)$，故属于式 (2.3) 中的那些图。由于不存在上邻叶图，$b _ + (y) = T(y)$，于是在外部单位窄带上 $g'(t) <= C cal(D)(y) ^ (-3 sqrt(2))$，从而两个结论在上半段都成立。

故可设有上邻叶。在 $0 <= t <= b _ + (y)$ 上，有 $r >= t$，且 $g'$ 在 $[0, oo)$ 上递减，于是
#eqn("(4.22)")[ $ partial _t u = g'(t) - g'(r) nu (y) dot nu _ + + O (cal(D)(y) ^ (-2)) >= -C cal(D)(y) ^ (-2) . $ ]
把式 (4.22) 与式 (4.11) 以及 $abs(nabla u) <= abs(partial _t u) + abs(nabla _ (Gamma^t) u)$ 结合，即在上半段证明式 (4.20)。越过等距端点后，在 $b _ + (y) <= t < b _ + (y) + 1$ 上改为有 $r <= t$，从而
#eqnb[ $ partial _t u <= g'(r) (1 - nu (y) dot nu _ +) + C cal(D)(y) ^ (-2) <= C cal(D)(y) ^ (-2) , $ ]
这是由式 (4.16) 与近乎平行性得到的。在截断端点处，起始叶与邻叶剖面的导数被 $C e ^ (-sqrt(2) T(y)) <= C cal(D)(y) ^ (-2)$ 控制（在外部单位窄带上亦然）。改用下邻叶的同一论证给出 $t <= 0$ 时的界，从而完成式 (4.20) 与式 (4.21)。
]
