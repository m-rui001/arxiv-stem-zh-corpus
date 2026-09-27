#import "macros.typ": *

= 4　从检验得分到正的 Choi 界

*平行可达性。* 定理 2.4 的下界部分只需要并行实验。固定区块长度 $k$ 以及 $cal(N)^(⊗ k)$ 与 $cal(M)^(⊗ k)$ 的一个纯参考辅助探针，把它重复 $floor(n slash k)$ 次并忽略剩余的槽位，所得输出对彼此独立。态的 Stein 引理 @OgawaNagaoka2000 在任意固定的 $ε in (0, 1)$ 下都能达到每个区块的相对熵。由于 $floor(n slash k) slash n → 1 slash k$，先对探针优化、再对 $k$ 优化，并用 $"par" ⊆ "ada" ⊆ "gen"$，即得
#eqn("(4.1)")[ $ "lim inf"_(n → ∞) frac(1, n) D_H^(ε, S)(cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ≥ D^∞(cal(N) parallel cal(M)), quad S in { "par", "ada", "gen" }, quad ε in (0, 1). $ ]
若 Choi 支撑包含不成立，取 $ρ = J^cal(N) slash d_A$、$σ = J^cal(M) slash d_A$，并让 $P_0$ 为到 $"ker" σ$ 上的投影，则 $q_0 = "Tr"(P_0 ρ) > 0$。使用相互独立的最大纠缠探针，只要至少一个输出产生 $P_0$ 就接受原假设，此时 $b = 0$ 且 $a = 1 - (1 - q_0)^n → 1$。于是对每个固定的 $ε > 0$，可达速率都是 $+∞$。单拷贝 Choi 探针同时给出 $D(cal(N) parallel cal(M)) = +∞$，速率无穷的情形就此了结。

*面向逆命题的加权得分。* 要证上界，必须控制这样的权衡：当备择假设下的接受概率 $b$ 指数地小，原假设下的接受概率 $a$ 也不太大。给定惩罚 $lambda > 0$，得分 $a - lambda b$ 正刻画了这一权衡。我们先从并行检验入手，它的归一化有简洁的 SDP 描述；把并行检验的最优得分记作
#eqnb[ $ Delta_n (lambda) := "max"_("平行检验器") (a - lambda b). $ ]
目标是把这个并行量迁移到一般检验器。我们将证明每个一般检验器都满足
#eqnb[ $ a ≤ lambda b + g_n Delta_n (lambda), quad "log" g_n = O("log" n), $ ]
其中显式因子 $g_n$ 稍后给出。其用处在于：当 $b ≤ e^(-n r)$ 且 $t < r$ 时取 $lambda = e^(n t)$，右端第一项至多为 $e^(-n (r - t))$；此后再证明对一切 $t > D^∞(cal(N) parallel cal(M))$，$Delta_n (e^(n t))$ 也指数衰减，逆命题便随之成立。

记 $N_n = (J^cal(N))^(⊗ n)$、$M_n = (J^cal(M))^(⊗ n)$。写成 Choi 形式，最优并行得分为
#eqn("(4.2)")[ $ Delta_n (lambda) = "max"_(sigma = sigma^dagger, " " "Tr" sigma = 1, 0 ≤ T ≤ sigma ⊗ bb(1)_(B^n)) "Tr"[T (N_n - lambda M_n)], quad lambda > 0. $ ]
约束 $σ ≥ 0$ 是自动的：由 $sigma ⊗ bb(1) ≥ T ≥ 0$ 即得。因此这里跑的恰好就是全部并行检验。改用式 (2.4) 中的规范探针，上式等价于
#eqn("(4.3)")[ $ Delta_n (lambda) = "sup"_(ψ) "Tr" [ ((id ⊗ cal(N)^(⊗ n))(ψ) - lambda (id ⊗ cal(M)^(⊗ n))(ψ))_+ ]. $ ]
特别地，$0 ≤ Delta_n (lambda) ≤ 1$。它只是一个辅助的松弛量预算，并非新增的信道熵。下面的引理把它与第 3 节的修正平滑 $D_"max"$ 直接联系起来。

这一得分的好处在于，它的对偶具有直接的算符解释：$Delta_n (lambda)$ 恰是使 $lambda M_n$ 得以控制 $N_n$ 所需的最小归一化正修正。

#thm("引理", title: "4.1")[
  归一化检验松弛量。对一切 $n ≥ 1$ 与 $lambda > 0$，
  #eqn("(4.4)")[ $ Delta_n (lambda) = "min" {h: Z ≥ 0, N_n ≤ lambda M_n + Z, " " "Tr"_(B^n) Z = h bb(1)_(A^n)}. $ ]
  等价地说，$Delta_n (lambda)$ 就是使 $N_n ≤ lambda M_n + h Q$ 成立的最小 $h ≥ 0$，其中 $Q$ 是某个信道的 Choi 算符。最优松弛量可以取成置换不变的。
]

#proof[
  对乘子 $Z ≥ 0$ 与 $h in bb(R)$，式 (4.2) 的 Lagrangian 为
  #eqnb[ $ h + "Tr"[T (N_n - lambda M_n - Z)] + "Tr"[sigma ("Tr"_(B^n) Z - h bb(1))]. $ ]
  它对 $T ≥ 0$ 与 Hermite 的 $sigma$ 的上确界有限，当且仅当式 (4.4) 中的约束成立。Slater 条件在 $sigma = bb(1) slash d_A^n$ 与 $T = bb(1) slash (2 d_A^n)$ 处成立。此外 $Z = N_n$、$h = 1$ 是对偶可行的；把 $h$ 限制在 $0 ≤ h ≤ 1$ 内，可行集是紧的，因为 $"Tr" Z = d_A^n h$。这就证明了等式成立且最小值可取到。正性迫使 $h ≥ 0$；若 $h = 0$，则 $Z = 0$，否则可写 $Z = h Q$。最后，对联合置换取平均保持所有约束不变，也不改变 $h$ 的值。
]

对 $0 ≤ delta < 1$ 与 $lambda > 0$，由引理与紧性可得
#eqn("(4.5)")[ $ Delta_n (lambda) ≤ delta ⟺ tilde(D)_("max","all")^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ≤ "log" lambda. $ ]
事实上，既然 $Q ≥ 0$，更小的松弛量 $h Q$ 可以放大为 $delta Q$；反之，一个可行的修正平滑项本身就是预算为 $delta$ 的松弛量。即便没有支撑包含，只要平滑下确界有限，它也能取到：把 $lambda$ 限制在任一有限的可行下水平集内，再用 $cal(K)_("all",n)$ 的紧性即可。因此 $Delta_n$ 就是同一个修正平滑最大相对熵的逆预算曲线。

*把得分迁移到一般检验器。* 归一化后的松弛量 $Q$ 可以是跨全部 $n$ 次使用的一个联合信道的 Choi 算符，而一般检验是在局域信道的乘积上归一化的，所以我们需要一个乘积信道意义下对 $Q$ 的控制。引理 4.1 给出的置换对称性，允许我们用固定边际的 de Finetti 定理以多项式损失提供这种控制。令
#eqn("(4.6)")[ $ g_n = binom(n + d_A^2 d_B^2 - 1, n). $ ]
在 $d_A, d_B$ 固定时，这满足 $"log" g_n = O("log" n)$。设 $Q ≥ 0$ 满足 $"Tr"_(B^n) Q = bb(1)_(A^n)$，且在输入–输出对的同步置换下不变。态
#eqnb[ $ rho_(A^n B^n) = Q slash d_A^n, quad "Tr"_(B^n) rho = (bb(1)_A slash d_A)^(⊗ n) $ ]
满足固定边际 de Finetti 定理的全部假设（见 @NaharEtAl2024 推论 1.1）。该定理给出一个定义在满足 $"Tr"_B omega = bb(1)_A slash d_A$ 的态 $omega_(A B)$ 上的概率测度，使得
#eqnb[ $ Q slash d_A^n ≤ g_n integral omega_(A B)^(⊗ n) dif mu(omega). $ ]
每个 $d_A omega$ 都是一个 CPTP 映射的非归一化 Choi 算符。两边乘以 $d_A^n$，并把测度推前到这些映射上，得到
#eqn("(4.7)")[ $ Q ≤ g_n integral (d_A omega_(A B))^(⊗ n) dif mu(omega) = g_n integral (J^cal(C))^(⊗ n) dif mu(cal(C)). $ ]
于是没有多出任何维数因子：真正需要的假设是置换不变性，至于支撑落在对称子空间内则无须要求。把它用于引理 4.1 中最优的归一化松弛量，给出
#eqn("(4.8)")[ $ N_n ≤ lambda M_n + g_n Delta_n (lambda) Q_(n, lambda), quad Q_(n, lambda) = integral (J^cal(C))^(⊗ n) dif mu_(n, lambda)(cal(C)). $ ]
这一混合依赖于信道对、$n$ 与 $lambda$，但与检验器无关。若 $Delta_n (lambda) = 0$，任一这样的混合都可以使用。对一般接受效应 $0 ≤ T_1 ≤ W$，归一化条件给出 $"Tr"(T_1 Q_(n, lambda)) ≤ 1$。于是每个具有接受对 $(a, b)$ 的一般检验器都满足
#eqn("(4.9)")[ $ a ≤ lambda b + g_n Delta_n (lambda) quad (lambda > 0). $ ]
算符不等式 (4.8) 经式 (4.9) 给出逆命题，之后还将为渐近等分性论证提供平滑项。带接受对 $(a slash g_n, b slash g_n)$ 的显式并行检验同样可得；更强的有限次构造将在附录 A 中单独证明。

== 4.1　二元 Rényi 界

定阶的二元界能在 Rényi 阈值之上控制 $Delta_n$。对夹逼 Rényi 散度 @WildeWinterYang2014 @MuellerLennertEtAl2013 ，我们采用如下约定。对 $p > 1$ 与支撑相容的态对，定义
#eqn("(4.10)")[ $
  tilde(D)_p (ρ parallel σ) &= frac(1, p - 1) "log" tilde(Q)_p (ρ parallel σ), \
  tilde(Q)_p (γ parallel σ) &= "Tr" ( σ^frac(1 - p, 2 p) γ σ^frac(1 - p, 2 p) )^p quad (p > 1).
$ ]
对迹任意的正算符 $γ$ 沿用同一个 Rényi 迹表达式 $tilde(Q)_p$，并规定 $tilde(Q)_p (0 parallel σ) = 0$。逆幂只在 $"supp" σ$ 上作用；支撑包含不成立时，散度取 $+∞$。

把式 (2.10) 与式 (2.11) 照搬用于 $bb(D) = tilde(D)_p$：在每一个固定的 $p > 1$ 下，同样的纯化与超可加性论证都成立。在 Choi 支撑包含条件下，夹逼散度的数据处理不等式 @Beigi2013 @FrankLieb2013 与对阶的单调性 @MuellerLennertEtAl2013 共同给出
#eqn("(4.11)")[ $
  0 ≤ D^∞(cal(N) parallel cal(M)) &= "inf"_(α > 1) tilde(D)_α^∞(cal(N) parallel cal(M)) ≤ tilde(D)_p^∞(cal(N) parallel cal(M)), \
  &≤ D_"max" (cal(N) parallel cal(M)) < ∞ quad (p > 1).
$ ]
由对阶的单调性，上式中的下确界可写成 $lim_(p ↓ 1) tilde(D)_p^∞(cal(N) parallel cal(M))$，只是其数值尚未确定。

除另有说明外，从现在起到第 6 节末尾，一律假设 Choi 支撑包含成立。此时并行接受对若满足 $a > 0$，则必有 $b > 0$；$a = b = 0$ 的情形对二元矩的贡献为零。对 $p > 1$，二元数据处理把每个并行检验的矩控制在
#eqn("(4.12)")[ $ a^p b^(1 - p) ≤ "exp" lr([ (p - 1) tilde(D)_p (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ]). $ ]
当 $a > lambda b$ 时得分为正，且满足 $(a - lambda b) lambda^(p - 1) ≤ a^p b^(1 - p)$。对检验取最大，给出
#eqn("(4.13)")[ $ Delta_n (lambda) ≤ lambda^(1 - p) "exp" lr([ (p - 1) tilde(D)_p (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ]). $ ]
因此，只要 $t > "inf"_(p > 1) tilde(D)_p^∞(cal(N) parallel cal(M))$，$Delta_n (e^(n t))$ 就指数衰减。剩下的分析工作，是证明这一阈值恰好就是可达速率 $D^∞(cal(N) parallel cal(M))$。
