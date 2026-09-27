#import "macros.typ": *

= 5　正则化端点与 Stein 逆命题

上述归约只留下一个问题：Rényi 阈值是否恰好等于并行可达速率？下面的恒等式回答这一问题，它正是逆命题所需的分析步骤。

#thm("定理", title: "5.1")[
  正则化 Rényi 端点。对满足 $"supp" J^cal(N) ⊆ "supp" J^cal(M)$ 的有限维 CPTP 映射 $cal(N), cal(M) : A → B$，有
  #eqn("(5.1)")[ $ lim_(p ↓ 1) tilde(D)_p^∞(cal(N) parallel cal(M)) = D^∞(cal(N) parallel cal(M)). $ ]
]

下界来自式 (4.11)；实质内容在于输入优化与正则化之后的连续性。若 Choi 支撑包含不成立，由 Choi 探针可知两端皆为 $+∞$。下面的证明从检验松弛量与二元散度界出发：先构造公共的幅值逼近，再将其张量化，最后比较两种逼近速率。

设 $C := D_"max" (cal(N) parallel cal(M)) < ∞$，并记
#eqnb[ $ D_* := D^∞(cal(N) parallel cal(M)), quad quad R_* := "inf"_(p > 1) tilde(D)_p^∞(cal(N) parallel cal(M)). $ ]
于是 $D_* ≤ R_* ≤ C$。我们要说明严格的间隙不可能出现。公共逼近将直接由定义 $Δ_k$ 的最优解构造。

== 5.1　正的松弛量给出统一的幅值逼近

要在重复的区块中使用松弛量，需要一个能同时控制所有输入探针的逼近。对 Choi 算符取幅值即可提供这种一致控制，并使张量积化为乘积。对 $A^k B^k$ 上的矩阵 $X$，定义幅值范数
#eqn("(5.2)")[ $ ν_k (X) := norm("Tr"_(B^k) X X^†)_(∞)^(1 slash 2) = "sup"_(σ ∈ cal(D)(A^k)) norm((sqrt(σ) ⊗ bb(1)) X)_2. $ ]
第二个表达式是一族 Hilbert–Schmidt 半范数的上确界，故 $ν_k$ 满足三角不等式。由偏迹可得
#eqnb[ $ ν_k (sqrt(N_k)) = 1, quad quad ν_(k+ℓ) (X ⊗ Y) = ν_k (X) ν_ℓ (Y). $ ]
若把 $X$ 的各列取为向量化后的 Kraus 算符，$ν_k (X)$ 恰是相应公共环境延拓的算子范数。因此，这一范数在探针选定之前就控制了所有输入与参考系统。

#thm("引理", title: "5.2")[
  正序提升到幅值。设 $N, B, Z ≥ 0$ 且 $N ≤ B + Z$，则存在矩阵 $X, F$ 使得
  #eqn("(5.3)")[ $ sqrt(N) = X + F, quad quad X X^† ≤ B, quad quad F F^† ≤ Z. $ ]
]

#proof[
  令 $S = B + Z$，并使用其在支撑上的逆：
  #eqn("(5.4)")[ $ X = B S^+ sqrt(N), quad quad F = Z S^+ sqrt(N). $ ]
  由于 $"supp" N ⊆ "supp" S$，两者之和恰为 $sqrt(N)$。这里 $S^+$ 是 Moore–Penrose 逆，并记 $S^(+1 slash 2) := (S^+)^(1 slash 2)$。在 $"supp" S$ 上，只要 $0 ≤ Y ≤ S$，$S^(+1 slash 2) N S^(+1 slash 2)$ 与 $S^(+1 slash 2) Y S^(+1 slash 2)$ 都是正的压缩算符。对后者取平方得 $Y S^+ Y ≤ Y$，对前者得 $S^+ N S^+ ≤ S^+$。于是 $X X^† ≤ B S^+ B ≤ B$，且 $F F^† ≤ Z S^+ Z ≤ Z$。全程未使用任何交换性或可逆性假设。
]

将引理 4.1 与引理 5.2 一起使用，取 $B = e^(k t) M_k$，并取最优的归一化松弛量满足 $"Tr"_(B^k) Z = Δ_k (e^(k t)) bb(1)$。对每个速率 $t$，二者共同给出一个矩阵 $X_k (t)$，满足
#eqn("(5.5)")[ $ X_k (t) X_k (t)^† ≤ e^(k t) M_k, quad quad ν_k (sqrt(N_k) - X_k (t)) ≤ e_k (t), quad quad e_k (t) := sqrt(Δ_k (e^(k t))). $ ]
同一个矩阵对一切探针都适用；$e_k (t)$ 只是一个检验界，并非另行优化的逼近轮廓。

*两个标尺估计。* 二元相对熵的数据处理对每个并行检验给出 $a "log"(1 slash b) - "log" 2 ≤ k D_*$。得分 $a - e^(k r) b$ 为正蕴含 $b < e^(-k r)$，于是当 $r > D_*$ 时
#eqn("(5.6)")[ $ Δ_k (e^(k r)) ≤ frac(k D_* + "log" 2, k r), quad quad "lim sup"_(k) e_k (r) ≤ sqrt(D_* slash r) < 1. $ ]
当 $v > R_*$ 时，取固定的 $q > 1$ 使得 $tilde(D)_q^∞(cal(N) parallel cal(M)) < v$。由式 (4.13) 与超可加性得
#eqn("(5.7)")[ $ Δ_k (e^(k v)) ≤ "exp" lr([ -k (q - 1) (v - tilde(D)_q^∞(cal(N) parallel cal(M))) ]), quad quad e_k (v) → 0. $ ]
这两个估计都不依赖端点恒等式，也不依赖信道强逆命题。
