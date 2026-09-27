#import "macros.typ": *

// 命题 4.7 的证明横跨本片段与 frag_8（式 (4.36)–(4.44) 在下一片段）。
// #include 不能跨文件传内容参数，故此处用 proofBegin 只印"证明。"而不印证毕方块，
// 证毕方块由 frag_8 末尾的 proofEnd 补上，避免出现第二个"证明。"或悬空的 □。
#let proofBegin(body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #text(weight: "bold", style: "italic")[证明。]
    #set par(first-line-indent: 0em)
    #body
  ],
)

== 4.2　稳定性不等式

下面沿用定义 4.1 中的坐标以及上文得到的估计。我们先记录两个较为粗糙的面积界。

#thm("引理", title: "4.6（局部与三次面积界）")[
在定义 3.4 的设定下，存在一个普适常数 $C > 0$，使得
#eqn("(4.23)")[ $ cal(H)^2 (Sigma _ 0 ∩ B _ 1 (x)) <= C quad "若" "dist"(x, cal(X)) >= 2 , $ ]
以及
#eqn("(4.24)")[ $ cal(H)^2 (Sigma ∩ { cal(D) < t }) <= C N t^3 quad "对所有" quad t >= L _ 0 . $ ]
]

#proof[
对每个 $y in Sigma _ 0 ∖ cal(X)$，$Sigma _ 0 ∩ B _ (1/2) (y)$ 都是一个斜率一致有界的图，于是它在 $B _ (1/2) (y)$ 内的面积有一致界。若 $"dist"(x, cal(X)) >= 2$，取有限覆盖即得式 (4.23)。

固定 $t >= L _ 0$，并在 $Sigma ∩ { cal(D) < t }$ 中取一个极大的、两两距离不小于 $1$ 的点族。各点处半径为 $1/2$ 的不交球都落在 $cal(S) _ (t + 1/2)$ 中，而由式 (3.7) 该集合可被 $N$ 个半径为 $t + 3/2$ 的球覆盖。体积比较说明点族至多有 $C N t^3$ 个点。这些点处的单位球覆盖 $Sigma ∩ { cal(D) < t }$，且由式 (4.23) 每个单位球内零水平集的面积不超过 $C$：式 (3.8) 保证这些球心到整个坏集 $cal(X)$ 的距离满足 $cal(D) > L _ 0 >= 2$。把上述估计相加，即得式 (4.24)。
]

我们把稳定性归结为 $Sigma$ 上的一个条件，同时保留坏集的曲率贡献（回顾式 (3.1) 中坏集的定义）。

#thm("命题", title: "4.7（稳定性的一种几何形式）")[
考虑定义 3.4 中的设定。必要时增大 $R _ *$，并设 $L _ 0 >= 4 R _ *$、$Lambda >= 32 L _ 0$。设 $phi: Sigma _ 0 -> [0, 1]$ 满足 $phi| _ Sigma in C ^ (0,1) (Sigma)$ 且
#eqnb[ $ phi = 1 quad "在" Sigma _ 0 ∩ cal(S) _ (4 L _ 0) , quad quad phi = 0 quad "在" Sigma _ 0 ∩ { cal(D) >= Lambda / 4 } . $ ]
则存在普适常数 $C$，使得
#eqn("(4.25)")[ $ mat(delim: #none, frac(1, sigma _ 0) integral_(cal(S) _ 2) cal(A)^2 abs(nabla u)^2 + integral_(Sigma ∖ cal(S) _ (4 L _ 0)) abs(upright("II") _ Sigma)^2 phi^2, <= frac(3,2) integral _ Sigma abs(nabla _ Sigma phi)^2 + C integral_(Sigma ∖ cal(S) _ (2 L _ 0)) cal(D) ^ (-13/4) phi^2 + C N L _ 0 ^ (-1/4) .) $ ]
]

#proofBegin[
我们先简要说明证明的思路。在远离坏集处，把 $phi$ 沿法向射线延拓，并在每个法向区间的端点附近将其截断。通常的 Sternberg–Zumbrun 计算用形如 $xi = phi abs(nabla u)$ 的函数去测试稳定性。这里的思路是改用 $tilde(xi) = tilde(phi) (partial _t u) _ +$：由式 (4.20)，正的法向导数在区间内部逼近 $abs(nabla u)$，而式 (4.21) 又使它在法向截断起作用的外部单位窄带上很小。在这些窄带上，$tilde(phi)$ 由截断 $phi$ 得到，而这种小性让我们能控制住由此产生的截断误差。

需要强调的是，$tilde(xi)$ 未必真能定义一个单值的环境测试函数，因为（即便引入了截断）在外部单位窄带上仍可能出现重叠。因此我们转而工作在式 (4.3) 的“参数化流形”$cal(N)$ 上，并赋予它拉回后的欧氏度量。稳定性给出线性化方程的一个正解，其拉回使我们能在 $cal(N)$ 上使用一个带权的分部积分恒等式。我们在 $cal(N)$ 上把这个恒等式用于 $tilde(xi)$，又在环境空间中用互补的截断权函数把它用于 $abs(nabla u)$。在后一种用法中，逐点的 Sternberg–Zumbrun 恒等式在坏集附近给出曲率项。比较所得公式，使我们得以保留这一正贡献。

现在给出严格的论证。我们先确立并回顾一些约定与设定。把 $z _ Lambda$ 平移到原点。回顾：$cal(N)$ 上的导数与积分都是用 $F(y,t) = y + t nu(y)$ 拉回的欧氏度量来计算的。类似地，环境函数在 $(y,t)$ 坐标下与 $F$ 复合。特别地 $partial _t u (y,t) = partial _t (u compose F)(y,t) = nabla u(F(y,t)) dot nu(y)$，且
#eqnb[ $ integral_(cal(N)) f = integral _ Sigma integral _ (b _ - (y) - 1) ^(b _ + (y) + 1) f(y,t) upright("det") (upright("Id") - t upright("II") _ Sigma (y)) thin upright(d)t thin upright(d)cal(H)^2 (y) . $ ]
每个起始零点都只被积分一次，不论延长后的区间是否有重叠的像。取 $chi: ℝ -> [0, 1]$ 光滑，满足 $chi equiv 0$ 于 $(-oo, 0]$、$chi equiv 1$ 于 $[1/2, oo)$。令
#eqnb[ $ mat(delim: #none, tilde(phi)(y,t), = phi(y) lr([ chi(cal(D)(y) - L _ 0) chi(b _ + (y) + 1 - t) chi(t - b _ - (y) + 1) ]) comma; tilde(xi)(y,t), = tilde(phi)(y,t) (partial _t u(y,t)) _ + comma) $ ]
于是 $tilde(phi)$ 在 $cal(D)(y) = L _ 0$ 以及法向端点 $t = b _ - (y) - 1$、$t = b _ + (y) + 1$ 处消失，并且它与 $phi$ 只在这些边界单位距离以内（即 $nabla chi$ 起作用之处）有所不同。特别地，当 $cal(D) >= Lambda / 4$ 时 $tilde(phi) = 0$，$tilde(xi) in H _ 0 ^ 1 (cal(N))$，且 $F("supp" tilde(xi)) ⋐ B _ (R _ Lambda + Lambda / 3)$。

现在注意到，我们希望得到式 (4.25) 中的那一项 $integral_(cal(S) _ 2) cal(A)^2 abs(nabla u)^2$，它来自用 $xi = phi abs(nabla u)$（而不是 $tilde(xi)$）的通常 Sternberg–Zumbrun 计算。尽管如此，我们仍能把两者联系起来。

*第 1 步。* 有如下估计
#eqn("(4.26)")[ $ integral_(cal(S) _ 2) cal(A)^2 abs(nabla u)^2 <= integral_(cal(N)) (1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) + C N L _ 0 ^ (-1/4) , $ ]
其中 $chi _ 0$ 是一个光滑截断函数，满足 $chi _ 0 equiv 1$ 于 $cal(S) _ (5 L _ 0 / 2)$、$chi _ 0 equiv 0$ 于 $cal(S) _ (3 L _ 0)$ 之外（故 $"supp" chi _ 0 subset B _ (R _ Lambda + Lambda / 3)$），并满足
#eqn("(4.27)")[ $ 0 <= chi _ 0 <= 1 , quad quad abs(nabla chi _ 0) <= C / L _ 0 , quad quad abs(Delta chi _ 0) <= C / L _ 0 ^ 2 . $ ]
由于 $chi _ 0 equiv 1$ 于 $cal(S) _ 2$ 上，只需把 $integral chi _ 0 cal(A)^2 abs(nabla u)^2$ 用式 (4.26) 右端的那一项来控制即可。对 Allen–Cahn 方程求导，在 ${ nabla u != 0 }$ 上逐点地有
#eqn("(4.28)")[ $ mat(delim: #none, abs(nabla u) (-Delta + W''(u)) abs(nabla u), = -frac(1,2) Delta abs(nabla u)^2 + abs(nabla abs(nabla u))^2 + W''(u) abs(nabla u)^2 ; , = -abs(D^2 u)^2 + abs(nabla abs(nabla u))^2 = -cal(A)^2 abs(nabla u)^2 .) $ ]
这促使我们使用下面这个源自稳定性的加权基态恒等式：对试验函数 $f$ 与 $eta$，其中 $eta >= 0$ 光滑，且 $eta$ 紧支撑或 $f$ 迹为零，有
#eqn("(4.29)")[ $ integral eta f (-Delta + W''(u)) f = integral eta h^2 abs(nabla (f / h))^2 - integral f^2 lr( frac(1,2) Delta eta + nabla eta dot nabla "log" h ) , $ ]
其中 $h$ 求解线性化方程
#eqn("(4.30)")[ $ cases(-Delta h + W''(u) h &= 0 quad "在" B _ (R _ Lambda + Lambda) comma , h &= 1 quad "在" partial B _ (R _ Lambda + Lambda) .) $ ]
稳定性以及第一 Dirichlet 特征值关于区域的严格单调性给出 $lambda _ 1 (-Delta + W''(u), B _ (R _ Lambda + Lambda)) > 0$。因此该 Dirichlet 问题有唯一解；分部积分即得式 (4.29)。极值原理给出 $h > 0$，而单位尺度上的 Harnack 估计与内部梯度估计给出
#eqn("(4.31)")[ $ abs(nabla "log" h) <= C quad "在" B _ (R _ Lambda + Lambda / 2) . $ ]
在式 (4.29) 中取 $f = abs(nabla u)$、$eta = chi _ 0$，并利用式 (4.28)，我们便得到
#eqn("(4.32)")[ $ mat(delim: #none, integral chi _ 0 cal(A)^2 abs(nabla u)^2 - integral _ ℝ^3 abs(nabla u)^2 lr( frac(1,2) Delta chi _ 0 + nabla chi _ 0 dot nabla "log" h ) , = -integral chi _ 0 h^2 abs(nabla frac(abs(nabla u), h))^2 <= 0 .) $ ]
现在我们在 $cal(N)$ 上应用式 (4.29)，取 $f = tilde(xi)$、$eta = 1 - chi _ 0$。准确地说：$F$ 在 $cal(N)$ 上是局部等距，故 $h compose F$ 满足同一线性化方程。因此我们能在 $cal(N)$ 上执行由式 (4.30) 推出式 (4.29) 的同一分部积分。同理，由于 $tilde(xi)$ 在 $t = b _ - - 1$ 与 $t = b _ + + 1$ 处消失，不产生边界项。于是得到
#eqn("(4.33)")[ $ mat(delim: #none, integral_(cal(N)) (1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) - integral_(cal(N)) tilde(xi)^2 lr( frac(1,2) Delta chi _ 0 + nabla chi _ 0 dot nabla "log" h ), = integral_(cal(N)) (1 - chi _ 0) h^2 abs(nabla (tilde(xi) / h))^2 ; , >= 0 .) $ ]
用式 (4.32) 减去式 (4.33)，并记 $Psi _ 0 := frac(1,2) Delta chi _ 0 + nabla chi _ 0 dot nabla "log" h$，我们得到
#eqn("(4.34)")[ $ mat(delim: #none, integral chi _ 0 cal(A)^2 abs(nabla u)^2, <= integral_(cal(N)) (1 - chi _ 0) tilde(xi) (-Delta + W''(u)) tilde(xi) + integral _ ℝ^3 abs(nabla u)^2 Psi _ 0 - integral_(cal(N)) tilde(xi)^2 Psi _ 0 .) $ ]
要达到式 (4.26)，只剩下把最后两项之差用 $C N L _ 0 ^ (-1/4)$ 控制。我们把它按三个区域拆开计算：
#eqn("(4.35)")[ $ mat(delim: #none, integral _ ℝ^3, abs(nabla u)^2 Psi _ 0 - integral_(cal(N)) tilde(xi)^2 Psi _ 0 = integral_(cal(N) ∩ {b _ - < t < b _ +}) lr(abs(nabla u)^2 - tilde(xi)^2) Psi _ 0 ; , + integral _ (ℝ^3 ∖ F(cal(N) ∩ {b _ - < t < b _ +})) abs(nabla u)^2 Psi _ 0 ; , - integral_(cal(N) ∩ ({t <= b _ - } ∪ {t >= b _ +})) tilde(xi)^2 Psi _ 0 ; , <= frac(C, L _ 0) integral _ (Sigma ∩ {2 L _ 0 < cal(D) < 4 L _ 0}) integral _ (b _ -) ^(b _ +) lr(abs(nabla u)^2 - tilde(xi)^2) thin upright(d)t ; , + frac(C, L _ 0) integral _ (cal(S) _ (3 L _ 0) ∖ (cal(S) _ (5 L _ 0 / 2) ∪ F(cal(N) ∩ {b _ - < t < b _ +}))) abs(nabla u)^2 ; , + frac(C, L _ 0) integral _ (Sigma ∩ {2 L _ 0 < cal(D) < 4 L _ 0}) lr( integral _ (b _ - - 1) ^(b _ -) tilde(xi)^2 thin upright(d)t + integral _ (b _ +) ^(b _ + + 1) tilde(xi)^2 thin upright(d)t ) . ) $ ]
这里我们用到了式 (4.27) 中 $chi _ 0$ 的支撑与导数界、式 (4.31) 中 $nabla "log" h$ 的界，以及 Jacobi 行列式有界。此外，每个与 $chi _ 0$ 的导数的支撑相交的区间都始于 $2 L _ 0 < cal(D)(y) < 4 L _ 0$，此处 $phi = 1$。在其未延拓的部分上 $tilde(phi) = 1$ 且 $tilde(xi) = (partial _t u) _ +$，故上式中各平方之差都是非负的。
]
