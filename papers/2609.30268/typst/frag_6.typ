#import "macros.typ": *

== 5.2　对任意纠缠探针的一次张量估计

现在把幅值分解转化为 Rényi 界。每一项通过两个量发挥作用：它对 $M_k$ 的控制代价，以及它的幅值范数。即使探针在所有重复区块之间纠缠，这一估计依然成立。

记 Schatten $q$-范数 $norm(X)_q := ("Tr" abs(X)^q)^frac(1, q)$，其中 $abs(X) := (X^† X)^frac(1, 2)$。对态 $β$ 与 $0 ≤ γ ≤ λ β$，
#eqn("(5.8)")[ $ tilde(Q)_p (γ parallel β) ≤ λ^(p - 1) "Tr" γ quad (p > 1). $ ]
对非零的 $γ$，把不等式 $tilde(D)_p ≤ D_"max"$ 用于 $γ slash "Tr" γ$，并用齐次性 $tilde(Q)_p (c γ parallel β) = c^p tilde(Q)_p (γ parallel β)$。$γ = 0$ 的情形显然成立；控制关系保证了 $"supp" γ ⊆ "supp" β$。

#thm("引理", title: "5.3")[
  张量幅值矩界。设 $sqrt(N_k) = sum_i X_i$ 是一个有限分解，且对每个 $i$ 有 $λ_i > 0$ 使得 $X_i X_i^† ≤ λ_i M_k$。则
  #eqn("(5.9)")[ $ "exp" lr([ frac(k (p - 1), 2 p) tilde(D)_p^∞(cal(N) parallel cal(M)) ]) ≤ sum_i λ_i^frac(p - 1, 2 p) ν_k (X_i)^frac(1, p), quad p > 1. $ ]
]

#proof[
  固定 $k, p$，把上述分解重复 $m$ 次。作用在全部 $k m$ 次使用上的任意探针，在相差一个参考等距的意义下由密度算符 $σ$ 表示；记 $L_σ := sqrt(σ) ⊗ bb(1)$，$β := L_σ M_(k m) L_σ$。由 $"Tr"_(B^(k m)) M_(k m) = bb(1)$ 与 $"Tr" σ = 1$，$β$ 是一个态。对满足 $X X^† ≤ λ M_(k m)$ 的幅值 $X$，令 $γ := L_σ X X^† L_σ$，则
  #eqn("(5.10)")[ $ γ ≤ λ β, quad quad "ran"(L_σ X) = "supp" γ ⊆ "supp" β. $ ]
  于是下文的负幂在 $"supp" β$ 上良定义，即使 $σ$ 与 $J^cal(M)$ 奇异也成立。由式 (5.8) 得
  #eqn("(5.11)")[ $ norm( β^(-frac(p - 1, 2 p)) L_σ X )_(2 p) &≤ λ^frac(p - 1, 2 p) ( "Tr" L_σ X X^† L_σ )^frac(1, 2 p) \
    &≤ λ^frac(p - 1, 2 p) ν_(k m) (X)^frac(1, p). $ ]
  对张量词 $X_(bold(i)) := X_(i_1) ⊗ dots.h ⊗ X_(i_m)$，其阶常数与幅值范数都因子化，故 Schatten 范数的三角不等式给出
  #eqn("(5.12)")[ $
    norm( β^(-frac(p - 1, 2 p)) L_σ sqrt(N_(k m)) )_(2 p) &≤ sum_(i_1,…,i_m) ∏_(j = 1)^m λ_(i_j)^frac(p - 1, 2 p) ν_k (X_(i_j))^frac(1, p) \
    &= lr(( sum_i λ_i^frac(p - 1, 2 p) ν_k (X_i)^frac(1, p) ))^m.
  $ ]
  左端的 $2p$ 次方正是零输出的夹逼矩。该界与 $σ$ 无关：全程未作乘积探针假设。对 $σ$ 优化、取对数、除以 $k m$，再在固定 $k, p$ 下令 $m → ∞$；沿 $k$ 的整数倍正则化即得式 (5.9)。
]
