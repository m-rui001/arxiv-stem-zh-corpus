#import "macros.typ": *

// frag_4：tex 943–1090。译稿片段 4。
// 编号公式：仅 (13)（eqn:regularized-Var，tex 970）。
// tex 962 为 equation*，用 #eqnb；tex 1041–1047、1055–1058、1076–1081 的显示式均不编号。
// tex 988–997 整段被 % 注释，不译。


== 3.2　核误设问题的讨论

例 3.1 中我们假设唯一极小元满足 $u^* in cal(U) subset H^1(Omega)$，于是极小化可以从大空间 $H^1(Omega)$ 限制到 RKHS $cal(U)$ 上来做。但这个假设并不总成立。其一，点赋值泛函可能不连续，形如 $u(x_i) = z_i$ 的观测便无意义。比如当 $Omega subset RR^3$ 时，由 Sobolev 嵌入定理，$H^1(Omega)$ 中可能含不连续函数，此时点赋值不再是连续泛函，关于 $u^*$ 的最优恢复问题不适定。如前所述，在最优恢复问题（式 (6)）中改取一组合适的非局部观测泛函 $phi_i$（定义见式 (8)），即可化解这一不连续性问题。

其二，即便点赋值泛函适定，若极小元 $u^*$ 不在给定的 RKHS $cal(U)$ 中，最优恢复表述仍会受核误设之累，6.3 小节即是一例。此时把式 (5) 限制到 $cal(U)$ 上，得
#eqnb[ $
  "inf"_(u in cal(U)) brace.l J(u) = integral_Omega G(x, u, gradient_x u) "d"x space space "满足" space space u = 0 space "于" space partial Omega space "上" brace.r
$ ]
即便 $cal(U)$ 在下层 Sobolev 空间中稠密，该问题在 $cal(U)$ 内也不再有极小元。这种情况下，核方法常给出过光滑的近似，还可能因 Gram 矩阵条件数过大而数值失稳。我们的办法是转而考虑正则化变分问题
#eqn("(13)")[ $
  "inf"_(u in cal(U)) brace.l J(u) = integral_Omega G(x, u, gradient_x u) "d"x + gamma norm(u)_cal(U)^2 space space "满足" space space u = 0 space "于" space partial Omega space "上" brace.r
$ ]
该泛函关于 RKHS 范数 $norm(·)_cal(U)$ 强制，故存在 $gamma$–正则化解 $u_gamma^* in cal(U)$。可以证明，当 $gamma -> 0$ 时，$u_gamma^*$ 在适当意义下收敛到真解 $u^*$。6.3 小节给出正则化问题的数值实验；这一方向的细致分析将发表于后续工作（另可参见近期研究 @baptista2025solving）。

为避开这些技术困难、聚焦方法本身的发展，下文均假设 $cal(U)$ 连续嵌入 $C^0(overline(Omega))$。这既保证点赋值泛函适定，也保证式 (5) 的解 $u^*$ 落在 RKHS $cal(U)$ 中，从而不存在核误设。

= 4　稀疏逼近

算法 1 需求解一个线性方程组，其系数一般是稠密的 Gram 矩阵 $K(bold(phi), bold(phi))$。实践中常用紧支撑基的 RBF 来得到稀疏 Gram 矩阵 @wendland2004scattered；但这类 RBF 求解 PDE 并不占优——观测泛函 $bold(phi)$ 常含导数，求导又把 Gram 矩阵 $K(bold(phi), bold(phi))$ 重新变稠 @wendland2004scattered，况且紧支撑 RBF 的分段光滑性质已知会引入奇点 @fornberg2015solving。本节改用基于 Matérn 型核屏蔽效应的稀疏 Cholesky 分解来削减算法 1 的计算量（空间统计文献中称 Vecchia 近似）@schafer2021compression @sparseCholFact @katzfuss2021general，并把这一思想推广到 Hessian 矩阵 $gradient_z^2 I_M(z)$ 的 Cholesky 近似上。所得稀疏 Cholesky 因子既可直接用于求解（算法 2），也可作为共轭梯度（CG）法的预条件子（算法 3）。本节只讨论配点情形，即 $phi_i = delta_(x_i)$。

== 4.1　Matérn 核与屏蔽效应

对某些类型的对称正定矩阵，行列置换怎么选，会大大影响 Cholesky 因子的稀疏性。具体地，记指标集 $cal(I) = {1, dots.c, M}$，置换函数 $P: cal(I) -> cal(I)$ 满足 $P(i) = k_i$。还记得 $bold(x) = {x_1, dots.c, x_M}$ 是按序排列的配点集，令
#eqnb[ $
  tilde(bold(x)) = {tilde(x)_1, dots.c, tilde(x)_M} ≜ {x_(P(1)), dots.c, x_(P(M))} = {x_(k_1), dots.c, x_(k_M)}
$ ]
为对 $bold(x)$ 施以置换 $P$ 后重排得到的配点集。按此定义，$P(i) = k_i$ 应理解为：把 $bold(x)$ 的第 $k_i$ 个元素 $x_(k_i)$ 放到 $tilde(bold(x))$ 的第 $i$ 个位置 $tilde(x)_i$ 上。我们的目标是找一个置换 $P$，使重排后精度矩阵的上 Cholesky 分解
#eqnb[ $
  K(tilde(bold(x)), tilde(bold(x)))^(-1) = P K(bold(x), bold(x))^(-1) P^"T" approx U U^"T"$ ]
尽量稀疏；其中 $U$ 为重排后精度矩阵的上 Cholesky 因子。这里记号复用：仍以 $P in RR^(M times M)$ 表示由置换函数 $P: cal(I) -> cal(I)$ 诱导的置换矩阵。

值得指出，这一做法在空间统计界被称为高斯过程条件化（GPC）。GPC 依赖屏蔽效应：给定中间的邻近观测后，两个远距观测间的相关会显著减弱 @stein2002screening @porcu2024Matern。据此启发，观测应按由粗到细的顺序排列，让细尺度观测间的相关被粗尺度观测条件化"筛掉"。对光滑阶 $alpha$ 取半整数的 Matérn 核 $K_(alpha)$，上述线性代数做法与 GP 屏蔽效应的联系最近已被严格建立 @schafer2021compression @owhadi2015bayesian：
#eqnb[ $
  K_(alpha)(x, x') = "exp"lr(- frac(sqrt(2m+1), sigma) norm(x - x')) dot frac(m!, (2m)!) sum_(k=0)^m frac((m+k)!, k! (m-k)!) lr(frac(2 sqrt(2m+1), sigma) norm(x - x'))^(m-k)
$ ]
其中 $alpha = m + 1/2$，$m in NN_+$，$sigma$ 为程参数（尺度参数）。众所周知，当光滑参数 $s ≜ alpha + d/2$ 为整数时，$K_(alpha)$ 诱导的 RKHS 与 Sobolev 空间 $H^s(Omega) = W^(s, 2)(Omega)$ 范数等价 @kanagawa2018gaussian。下文若不致歧义，省去下标直接写 $K = K_(alpha)$。
