#import "macros.typ": *

= 3　低频界

式 （2.12） 中的源项既含有被移走的低频部分 $l$，也含有低频输出 $P_(≤ nu) F(u)$。为了把它们同四次积分作比较，我们先证明 $u ∈ L^∞_t L^4_x$，这就使 $f (t) = ‖F(u (t))‖_1$ 有界。随后，无损耗 Duhamel 公式给出低频导数界，其右端由 $f$ 在未来的平均表示。通过选取合适的终止时刻，我们便能在建立任何整体时间可积性之前，把这些平均与 $K_a$ 加以比较。

== 3.1　源项的空间可积性

为了估计式 （2.3） 的环状部分，我们使用精化 Sobolev 不等式 @GMO[定理 2]，取 $p = 2$、$q = 4$、$s = alpha = 1$：

#eqn("（3.1）")[ $ ‖f‖_4^4 ≲ ("sup"_L L^(-1) ‖P_L f‖_∞)^2 ‖∇ f‖_2^2. $ ]

下面的递推式将在不假定有限质量的前提下，证明右端 Besov 半范数的有限性。

#thm("引理 3.1")[ 设 $u$ 是式 （1.1） 的前向整体几乎周期解，且
  #eqnb[ $ N(t) ≥ 1, quad "sup"_t ‖∇ u (t)‖_2 ≤ B < ∞. $ ]
  则
  #eqn("（3.2）")[ $ A_* := "sup"_L L^(-1) ‖P_L u‖_(L^∞_(t,x)) < ∞, quad U := "sup"_t ‖u (t)‖_4 < ∞, quad "sup"_t ‖F(u (t))‖_1 < ∞. $ ]
]

#proof[
  Bernstein 不等式给出下面 $a_L$ 的初始界。给定充分小的 $eta > 0$，由低频紧性可取到 $L_0 > 0$，使得
  #eqnb[ $ a_L := L^(-1) ‖P_L u‖_(L^∞_(t,x)) ≲ B L^(-1/2), quad v = P_(≤ L_0) u, quad ‖∇ v‖_(L^∞ L^2) ≤ eta. $ ]
  由于 $‖u - v‖_(L^∞ L^2) ≲ L_0^(-1) B$ 且 $‖u - v‖_(L^∞ L^6) ≲ B$，插值与 Hölder 不等式给出
  #eqn("（3.3）")[ $ ‖u - v‖_(L^∞ L^3) ≤ C_(L_0, B), quad ‖F(u) - F(v)‖_(L^∞ L^1) ≲ ‖u - v‖_(L^∞ L^3) (‖u‖_(L^∞ L^6) + ‖v‖_(L^∞ L^6))^4 ≤ C_(L_0, B). $ ]
  在固定的输出频率上，令 $r = P_(≤ frac(L,100)) v$，$z = v - r$。$r$ 与 $F(r)$ 的 Fourier 支撑分别落在 $B(0, frac(L,50))$ 与 $B(0, frac(L,10))$ 中，故 $P_L F(r) = 0$。此外 $hat(z)$ 在 $B(0, frac(L,100))$ 上为零，而前面的界给出
  #eqnb[ $ ‖z‖_2 ≲ L^(-1) eta, quad ‖z‖_6 + ‖r‖_6 ≲ eta, quad "sup"_(M ≥ c L) a_M ≲ B L^(-1/2) < ∞. $ ]
  由环状截断核在 $L^1$ 中的一致有界性，$z$ 的 Besov 半范数至多为 $C "sup"_(M ≥ c L) a_M$。于是式 （3.1） 给出
  #eqnb[ $ ‖F(z)‖_1 ≤ ‖z‖_4^2 ‖z‖_6^3 ≲ eta^4 "sup"_(M ≥ c L) a_M. $ ]
  把 $F(v) = (r + z)^3 (macron(r) + macron(z))^2$ 展开后，投影剩下的只有 $F(z)$ 与交叉项。对 $1 ≤ k ≤ 4$，Hölder 不等式给出
  #eqnb[ $ ‖|z|^k |r|^(5 - k)‖_1 ≤ ‖r‖_∞ ‖z‖_2 ‖z‖_6^(k - 1) ‖r‖_6^(4 - k) ≲ eta^4 ∑_(M ≤ C L) frac(M, L) a_M. $ ]
  由初始的 Bernstein 界可知此和有限，因为 $∑_(M ≤ C L) frac(M, L) a_M ≲ B L^(-1/2)$。环状传播子满足
  #eqnb[ $ ∫_0^∞ ‖e^(-upright(i) s Δ) P_L‖_(L^1 → L^∞) dif s ≲ ∫_0^∞ "min"(L^3, s^(-3/2)) dif s ≲ L. $ ]
  对每个固定的 $L$，所有保留下来的源项都属于 $L^∞_t L^1_x$。插入一个稍加放大的环状乘子后，上面的核界便使它们的 Duhamel 积分在 $L^∞_x$ 中绝对收敛。它们的分布极限与式 （2.3） 中的弱 $dot(H)^1$ 极限一致。于是得到
  #eqn("（3.4）")[ $ a_L ≤ C_(L_0, B) + C eta^4 [ "sup"_(M ≥ c L) a_M + ∑_(M ≤ C L) frac(M, L) a_M ]. $ ]
  我们尚未证明 $"sup"_L a_L$ 有限。为闭合式 （3.4），取定 $frac(1,2) < alpha < 1$，并引入
  #eqnb[ $ w_epsilon (L) = min {1, (L / epsilon)^alpha}, quad A_epsilon = "sup"_L w_epsilon (L) a_L ≲ B epsilon^(-1/2) < ∞. $ ]
  初始 Bernstein 界与权重之比给出
  #eqnb[ $ "sup"_(M ≥ c L) frac(w_epsilon (L), w_epsilon (M)) "≲"_c 1, quad ∑_(M ≤ C L) frac(M, L) frac(w_epsilon (L), w_epsilon (M)) "≲"_C ∑_(j ≥ 0) 2^(-j (1 - alpha)) < ∞, $ ]
  从而
  #eqnb[ $ A_epsilon ≤ C_(L_0, B) + C_alpha eta^4 A_epsilon. $ ]
  选取 $eta$ 使 $C_alpha eta^4 ≤ frac(1,2)$，然后固定 $L_0$，便对一切 $epsilon$ 一致地有 $A_epsilon ≤ 2 C_(L_0, B)$。在每个固定的 $L$ 处令 $epsilon → 0$，再取上确界，即证得 $A_* < ∞$。式 （3.1） 便给出
  #eqn("（3.5）")[ $ U^4 ≲ A_*^2 B^2 < ∞, quad "sup"_t ‖F(u (t))‖_1 ≤ U^2 "sup"_t ‖u (t)‖_6^3 ≤ C U^2 B^3 =: F_*. $ ]
]

== 3.2　投影与源项比较

现在验证式 （2.4） 中所取定投影的一致性质。对空间强制性估计，$h$ 的归一化 profile 必须同时低于两个阈值；对源项估计，我们需要更强的质量界 $nu M_nu = o(1)$。两者都来自同一条一致的低频尾界。令

#eqnb[ $ omega(c) = 4 pi^2 "sup"_t ∫_(|ξ| ≤ 2 c) |ξ|^2 |hat(u) (t, ξ)|^2 dif ξ. $ ]

则当 $c → 0$ 时 $omega(c) → 0$。对 $0 < nu < c$，乘子界推出

#eqnb[ $ eta_nu^2 ≤ omega(nu), quad d_nu^2 ≤ omega(c) + nu^2 c^(-2) B^2. $ ]

先令 $nu → 0$，再令 $c → 0$，得

#eqn("（3.6）")[ $ eta_nu → 0, quad d_nu → 0. $ ]

其中波浪号表示式 （2.2） 中的归一化，则有

#eqnb[ $ ‖tilde(h) (t) - tilde(u) (t)‖_(dot(H)^1) = ‖h (t) - u (t)‖_(dot(H)^1) ≤ eta_nu, \ ‖∇ h‖_2^2 ≤ (1 - gamma) G, quad |E(h) - E(u)| ≲ (B + B^5) eta_nu → 0. $ ]

因此对充分小的 $nu$，两个阈值间隙都一致地保持。由预紧性以及定义 2.1 中的下界，存在 $R_0, b_0 > 0$ 使得

#eqnb[ $ "inf"_(v ∈ 𝒦) ‖v‖_(L^4 (B(0, R_0))) ≥ b_0 > 0, quad ‖tilde(h) - tilde(u)‖_(L^4 (B(0, R_0))) ≲ R_0^(1/4) eta_nu ≤ frac(b_0, 2). $ ]

重新标度与 $L^4$ 乘子界给出

#eqn("（3.7）")[ $ c_(𝒦) N(t)^(-1) ≤ a(t) ≤ C U^4 =: A_0, quad K_a (I) "≲"_u K_N (I). $ ]

为了把源项与 $K_a$ 比较，我们使用单边 Hardy–Littlewood 极大算子

#eqnb[ $ (ℋ_+ f) (t) = "sup"_(s > 0) frac(1, s) ∫_t^(t+s) f(tau) dif tau, quad E_f (T) = ∫_0^T f (t)^2 dif t. $ ]

它的平均区间可以越过终止时刻。我们在固定 $nu$ 之前选取端点，以此控制来自更晚时刻的贡献，而不假定整体的时间可积性。

#thm("命题 3.2")[ 令 $f (t) = ‖F(u (t))‖_1$，$F_+ = ℋ_+ f$。存在不依赖于 $nu$ 的递增序列 $T_j → ∞$，使得
  #eqn("（3.8）")[ $ ‖f‖_(L^2 (0, T_j))^2 + ‖F_+‖_(L^2 (0, T_j))^2 ≤ C_u K_a ([0, T_j]), quad 0 < nu ≤ nu_0 (u). $ ]
]

#proof[
  由式 （3.5），$0 < f ≤ F_*$。我们依次选取 $R_j$ 与 $T_j$，使得
  #eqnb[ $ R_j ≥ max {j, T_(j - 1) + 1}, quad T_j ≥ R_j, quad frac(E_f (T_j), T_j) ≥ frac(1, 2) "sup"_(s ≥ R_j) frac(E_f (s), s) > 0. $ ]
  该上确界是有限的。对 $T = T_j$，极大算子定理给出
  #eqnb[ $ ∫_0^T "sup"_(0 < s ≤ T) ((frac(1, s) ∫_t^(t+s) f))^2 dif t ≤ ‖ℋ_+ (f 1_[0, 2T])‖_(L^2 (ℝ))^2 ≲ E_f (2T) ≤ 4 E_f (T), \ (frac(1, s) ∫_t^(t+s) f)^2 ≤ frac(E_f (t + s), s) ≤ frac(2 (t + s), s) frac(E_f (T), T) ≤ 4 frac(E_f (T), T) quad (0 ≤ t ≤ T < s). $ ]
  于是
  #eqn("（3.9）")[ $ frac(E_f (s), s) ≤ 2 frac(E_f (T_j), T_j) quad (s ≥ T_j), quad ‖F_+‖_(L^2 (0, T_j))^2 ≤ C_"max" E_f (T_j). $ ]
  令
  #eqnb[ $ k_L (s) = L^(-1) min {L^3, s^(-3/2)}, quad F_t (s) = ∫_0^s f (t + tau) dif tau. $ ]
  则 $F_t (s) ≤ s F_+ (t)$，且 $k_L$ 单调不增、在 $[0, ∞)$ 上的积分为 $3$。绝对收敛的频率定域化 Duhamel 公式即式 （2.3） 给出
  #eqnb[ $ L^(-1) ‖P_L u (t)‖_∞ ≤ C ∫_0^∞ k_L (s) f (t + s) dif s = -C ∫_0^∞ k'_L (s) F_t (s) dif s ≤ 3 C F_+ (t). $ ]
  这里 $k_L (s) F_t (s)$ 在两个端点处都趋于 $0$。因此
  #eqn("（3.10）")[ $ "sup"_L L^(-1) ‖P_L u (t)‖_∞ ≲ F_+ (t), $ ]
  二进求和便给出
  #eqn("（3.11）")[ $ ‖l (t)‖_∞ ≲ nu F_+ (t), quad ‖∇ l (t)‖_∞ ≲ nu^2 F_+ (t). $ ]
  由插值、式 （3.1） 与式 （3.10） 得
  #eqnb[ $ ‖h‖_5^5 ≤ ‖h‖_4^2 ‖h‖_6^3 "≲"_B a^(1/2), quad ‖l‖_4^2 ≲ eta_nu F_+ (t), quad ‖l‖_6^3 ≲ eta_nu^3, $ ]
  #eqn("（3.12）")[ $ f (t) ≤ C_B a (t)^(1/2) + C eta_nu^4 F_+ (t). $ ]
  在所选的时刻上，
  #eqnb[ $ E_f (T_j) ≤ 2 C_B^2 K_a ([0, T_j]) + C eta_nu^8 C_"max" E_f (T_j), quad E_f (T_j) ≤ T_j F_*^2 < ∞. $ ]
  取 $nu_0$ 使得 $"sup"_(0 < nu ≤ nu_0) C eta_nu^8 C_"max" ≤ frac(1, 2)$，便可吸收最后一项。再由式 （3.9） 即得式 （3.8）。
]

特别地，当我们把低频因子与作用量配对时，式 （3.11） 提供了系数 $M_nu nu = d_nu$ 与 $M_nu^2 nu^2 = d_nu^2$。式 （5.3）–（5.4） 中的相消恰好把这些因子放进源项估计之中。随后命题 3.2 把剩下的乘积 $f F_+$ 化为 $K_a (I_j)$。
