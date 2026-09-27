#import "macros.typ": *

= 3　精确的单时对偶

本节找出与每种检验器归一化相对偶的平滑集合。这一节独立于渐近逆命题：所得的对偶稍后给出平滑 AEP 中的下界。本节统一使用 Choi 缩写 $N_n = (J^cal(N))^(⊗ n)$ 与 $M_n = (J^cal(M))^(⊗ n)$。

令
#eqnb[ $ cal(P)_n = { J^cal(C)_1 ⊗ dots.h ⊗ J^cal(C)_n: cal(C)_1, …, cal(C)_n : A → B space "CPTP" }. $ ]
考虑下面几类 Choi 算符集合：
#eqn("(3.1)")[ $
  cal(K)_("all",n) &= { Q ≥ 0: "Tr"_(B^n) Q = bb(1)_(A^n) }, \
  cal(K)_("aff",n) &= "aff"_bb(R) (cal(P)_n) ∩ { Q : Q ≥ 0 }, \
  cal(K)_("prod",n) &= "conv" (cal(P)_n), \
  cal(K)_("iid",n) &= "conv" { (J^cal(C))^(⊗ n): cal(C) : A → B space "CPTP" }.
$ ]
这里 $"aff"_bb(R)$ 表示实仿射包。这些集合都是非空的凸紧集，并且满足
#eqn("(3.2)")[ $ cal(K)_("iid",n) ⊆ cal(K)_("prod",n) ⊆ cal(K)_("aff",n) ⊆ cal(K)_("all",n). $ ]
事实上，式 (3.1) 中每个仿射组合的偏迹都是 $bb(1)_(A^n)$，其中的正元素因此落在紧集 $cal(K)_("all",n)$ 内，而有限维空间中的仿射包是闭集。另外两个集合是有限维空间中紧集的凸包，因而也是紧的。仿射约束只是线性归一化约束，并不强加槽位之间的可分性。IID 集合由相同张量幂的混合构成，混合本身未必是乘积算符。

对 $• in { "all", "aff", "prod", "iid" }$ 与 $0 ≤ δ < 1$，定义修正平滑最大相对熵
#eqn("(3.3)")[ $ tilde(D)_("max",•)^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) = "log" "inf" { lambda ≥ 0: N_n ≤ lambda M_n + δ Q, quad Q in cal(K)_(•,n) }, $ ]
若不存在可行的有限 $lambda$，取值规定为 $+∞$。预算 $delta$ 乘在指定集合内的一个归一化 Choi 算符上，因此度量的是一个可加的正修正。该定义既不要求存在接近的 CPTP 逼近，也不对分别平滑后的输出态施加距离约束。这一约定推广了 @RegulaLamiDatta2026 在态情形对偶中所用的修正平滑。

两边取迹即知每个可行的 $lambda$ 都满足 $lambda ≥ 1 - δ$。在 Choi 支撑包含条件下，直接控制还给出
#eqn("(3.4)")[ $ 1 - δ ≤ "exp" [ tilde(D)_("max",•)^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ] ≤ e^(n D_"max" (cal(N) parallel cal(M))). $ ]
于是下确界可以取到：把 $lambda$ 限制在这一紧区间内，并利用 Choi 集合的紧性即可。特别地，该熵可以为负。由集合的包含关系，在相同的参数与预算下，
#eqn("(3.5)")[ $ tilde(D)_("max","all")^δ ≤ tilde(D)_("max","aff")^δ ≤ tilde(D)_("max","prod")^δ ≤ tilde(D)_("max","iid")^δ. $ ]

与态的情形类似，假设检验相对熵与修正平滑最大相对熵之间有如下对偶。

#thm("定理", title: "3.1")[
  精确的单时对偶。设有限维 CPTP 映射 $cal(N), cal(M) : A → B$ 满足 $"supp" J^cal(N) ⊆ "supp" J^cal(M)$。对每个 $n ≥ 1$ 与 $q in (0, 1)$，
  #eqn("(3.6)")[ $ D_H^(1-q,"par") (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) = "inf"_(0 ≤ δ < q) { tilde(D)_("max","all")^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) - "log" (q - δ) }, $ ]
  #eqn("(3.7)")[ $ D_H^(1-q,"gen") (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) = "inf"_(0 ≤ δ < q) { tilde(D)_("max","aff")^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) - "log" (q - δ) }. $ ]
  这里 $q$ 是所要求的原假设接受概率，$delta$ 是平滑预算。
]

#proof[
  在本证明中记 $beta_n^S (q) = beta_(1-q)^S (cal(N)^(⊗ n), cal(M)^(⊗ n))$。对并行检验器，$sigma ≥ 0$ 由 $T_1 + T_2 = sigma ⊗ bb(1) ≥ 0$ 自动成立，无须另行施加。把 $sigma$ 视作 Hermite 算符，式 (2.4) 的 SDP 对偶为
  #eqn("(3.8)")[ $ beta_n^"par" (q) = "sup"_(u ≥ 0, Z ≥ 0, v in bb(R), u N_n ≤ M_n + Z, "Tr"_(B^n) Z = v bb(1)_(A^n)) (u q - v). $ ]
  具体地，对原假设成功约束取乘子 $u ≥ 0$，对 $T_1 + T_2 = sigma ⊗ bb(1)$ 取 $Z = Z^dagger$，对 $"Tr" sigma = 1$ 取 $v$。对 $T_1, T_2 ≥ 0$ 作最小化，给出 $M_n + Z - u N_n ≥ 0$ 与 $Z ≥ 0$；对 Hermite 的 $sigma$ 作最小化，给出偏迹等式。当 $q < ξ < 1$ 时，点 $sigma = bb(1) slash d_A^n$、$T_1 = ξ bb(1) slash d_A^n$、$T_2 = (1 - ξ) bb(1) slash d_A^n$ 严格可行，故强对偶成立。正性迫使 $v ≥ 0$：若 $v > 0$，则 $Z = v Q$ 且 $Q in cal(K)_("all",n)$；若 $v = 0$，则 $Z = 0$。无须为次归一化的松弛量作任何补全。

  对一般检验器，令 $Delta$ 为完全去极化信道，记 $P_0 = (J^Delta)^(⊗ n)$，并设
  #eqnb[ $ cal(V)_n = "span"_bb(R) { P - P_0: P in cal(P)_n }. $ ]
  取 $cal(V)_n$ 的一组 Hermite 实基 $F_1, …, F_m$。记 $W = T_1 + T_2$，一般归一化等价于 $"Tr" (W P_0) = 1$ 且对一切 $j$ 有 $"Tr" (W F_j) = 0$。这些等式的 Lagrange 乘子给出 $Z = v P_0 + sum_j z_j F_j$。于是对正的 $T_1, T_2$ 作最小化，给出
  #eqn("(3.9)")[ $ beta_n^"gen" (q) = "sup"_(u ≥ 0, Z ≥ 0, v in bb(R), u N_n ≤ M_n + Z, Z in v P_0 + cal(V)_n) (u q - v). $ ]
  同样这组严格正的 $T_1, T_2$ 满足全部一般归一化等式，故强对偶再次成立。每个 $F_j$ 在 $B^n$ 上的偏迹为零，于是 $"Tr"_(B^n) Z = v bb(1)$，从而 $v ≥ 0$。若 $v > 0$，则
  #eqnb[ $ Z slash v in (P_0 + cal(V)_n) ∩ { Q : Q ≥ 0 } = cal(K)_("aff",n). $ ]
  若 $v = 0$，则 $Z = 0$，该集合中任一元素都表示零项。这样无须假设凸乘积分解，就认出了仿射对偶集合。

  两种情形最终都化为
  #eqnb[ $ beta_n^S (q) = "sup"_(u, v ≥ 0, Q in cal(K)_(•,n), u N_n ≤ M_n + v Q) (u q - v), $ ]
  其中 $(S, •) = ("par", "all")$ 或 $(S, •) = ("gen", "aff")$。Choi 控制给出
  #eqnb[ $ beta_n^S (q) ≥ q e^(-n D_"max" (cal(N) parallel cal(M))) > 0. $ ]
  于是目标值非正的候选皆可丢弃。剩下的每个候选都有 $u > 0$，而可逆变换
  #eqnb[ $ lambda = 1 slash u, quad δ = v slash u $ ]
  给出 $lambda > 0$、$0 ≤ δ < q$ 与 $N_n ≤ lambda M_n + δ Q$，目标值为 $(q - δ) slash lambda$。反过来，每个这样的可行平滑候选经逆替换都给出一个对偶候选。对每个 $delta$ 关于 $lambda$ 作优化并取负对数，两个等式即得证。端点 $delta = 0$ 始终包含在内；全程没有对零取倒数或取对数。
]
