#import "macros.typ": *

// 带说明文字起头的证明（本片段局部定义，不改 macros.typ）
#let proofhead(txt, body) = block(
  width: 100%,
  above: 0.5em,
  below: 0.9em,
  inset: (left: 1.2em),
  [
    #set par(first-line-indent: 0em)
    #text(weight: "bold", style: "italic")[#txt]#body
    #align(right)[□]
  ],
)

== 5.3　用两种逼近速率闭合端点

#proofhead("证明（定理 5.1）。")[
  设 $D_* < R_*$。固定 $D_* < r < R_* < v$，并令 $delta = sqrt(D_* slash r) < 1$。由式 (5.6)–(5.7)，$"lim sup"_k e_k (r) ≤ delta$ 且 $e_k (v) → 0$。公共逼近给出恒等式
  #eqn("(5.13)")[ $ sqrt(N_k) = X_k (r) + (X_k (v) - X_k (r)) + (sqrt(N_k) - X_k (v)). $ ]
  对这三个幅值，可容许的阶常数与范数界为
  #eqn("(5.14)")[
    #table(
      columns: 3,
      align: center,
      [幅值], [满足 $X_i X_i^† ≤ λ_i M_k$ 的 $λ_i$], [$ν_k (X_i)$ 的上界],
      [$X_k (r)$], [$e^(k r)$], [$1 + e_k (r)$],
      [$X_k (v) - X_k (r)$], [$4 e^(k v)$], [$e_k (r) + e_k (v)$],
      [$sqrt(N_k) - X_k (v)$], [$4 e^(k "max" { C , v })$], [$e_k (v)$],
    )
  ]
  范数界来自三角不等式；阶常数界则来自 $(X - Y) (X - Y)^† ≤ 2 X X^† + 2 Y Y^†$ 与 $N_k ≤ e^(k C) M_k$。

  固定 $s > 0$。当 $k > 2 s$ 时，取
  #eqnb[ $ p_k = frac(k, k - 2 s), quad quad frac(k (p_k - 1), 2 p_k) = s, quad quad frac(1, p_k) = 1 - frac(2 s, k). $ ]
  应用引理 5.3 与 $R_* ≤ tilde(D)_(p_k)^∞$，恰好得到
  #eqn("(5.15)")[ $
    e^(s R_*) &≤ e^(s r) (1 + e_k (r))^(1 - 2 s slash k) + 4^(s slash k) e^(s v) (e_k (r) + e_k (v))^(1 - 2 s slash k) \
      &quad + 4^(s slash k) e^(s "max" { C , v }) e_k (v)^(1 - 2 s slash k).
  $ ]
  引理 5.3 中的重复极限已在每个固定的 $k, p_k$ 处取过。现在固定 $r, v, s$，令 $k → ∞$。由于 $0 ≤ e_k (v) ≤ 1$ 且最终有 $1 - 2 s slash k ≥ 1 slash 2$，最后一项消失。对前两项，利用最终成立的 $e_k (r) ≤ delta + ζ$ 与 $e_k (v) ≤ ζ$，先取上极限，再令 $ζ ↓ 0$。这一步无须对 $e_k (r)$ 取极限，并且涵盖 $D_* = 0$ 的情形。结果为
  #eqn("(5.16)")[ $ e^(s R_*) ≤ (1 + delta) e^(s r) + delta e^(s v). $ ]
  这对每个固定的 $v > R_*$ 与 $s > 0$ 都成立。令 $v ↓ R_*$：
  #eqnb[ $ 1 - delta ≤ (1 + delta) e^(- s (R_* - r)). $ ]
  左端严格为正，而右端在 $s → ∞$ 时趋于零。这一矛盾证明了 $R_* = D_*$。对 $p$ 的单调性把 $R_*$ 等同于阶一的极限。全程取极限的次序是 $m → ∞$、$k → ∞$、$v ↓ R_*$、$s → ∞$；既未使用对 $v$ 一致的估计，也没有交换输入优化。
]

两种逼近速率各司其职。速率 $r$ 给出小于 $1$ 的误差；速率 $v$ 把那项不消失的修正推到任意接近 $R_*$ 的代价上。只有趋于零的余项按可能更大的代价 $C$ 计费。因此，指数精度的低成本逼近并非端点证明的前提。

== 5.4　完成信道 Stein 定理

#proofhead("证明（定理 2.4 的收尾）。")[
  下界与无限速率的情形已在第 4 节开头解决。在支撑情形下，固定 $r > D^∞(cal(N) parallel cal(M))$，并取 $D^∞ < t < r$。由定理 5.1，存在固定的 $q > 1$ 使得 $tilde(D)_q^∞(cal(N) parallel cal(M)) < t$。令 $eta_t = (q - 1) (t - tilde(D)_q^∞(cal(N) parallel cal(M))) > 0$。于是由式 (4.9) 与 (5.7)，对一切满足 $b ≤ e^(- n r)$ 的一般检验器，
  #eqn("(5.17)")[ $ a ≤ e^(- n (r - t)) + g_n e^(- n eta_t). $ ]
  由于 $"log" g_n = o(n)$，存在仅依赖于两个信道与 $r$ 的常数 $c > 0$ 和 $n_0$，使得当 $n ≥ n_0$ 时右端不超过 $e^(- c n)$。这就直接证明了指数强逆命题。于是对固定的 $ε in (0, 1)$，条件 $a ≥ 1 - ε$ 在一切充分大的 $n$ 上都排除了 $b ≤ e^(- n r)$。因此 Stein 上速率不超过 $r$。令 $r ↓ D^∞$，再结合式 (4.1) 与检验器的包含关系即可。
]

单时对偶与 Stein 定理给出 AEP 的下界。至于上界，还需要额外的成分——式 (4.8) 的 IID 控制：端点定理使其松弛量指数地小，于是多项式前置因子能吸收进任何固定预算。

#thm("推论", title: "5.4")[
  修正平滑最大相对熵的渐近等分性。对任意有限维 CPTP 对 $cal(N), cal(M) : A → B$、任意固定的 $delta in (0, 1)$ 与 $• in { "all", "aff", "prod", "iid" }$，
  #eqn("(5.18)")[ $ lim_(n → ∞) frac(1, n) tilde(D)_("max",•)^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) = D^∞(cal(N) parallel cal(M)). $ ]
  等式在取扩展值 $+∞$ 时同样成立。
]

#proof[
  先设 Choi 支撑包含成立。固定 $q in (delta, 1)$。在式 (3.6) 中取候选预算 $delta$，得
  #eqnb[ $
    tilde(D)_("max","all")^δ (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ≥ D_H^(1-q,"par") (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) + "log" (q - delta).
  $ ]
  两边除以 $n$ 并用定理 2.4。再由包含链式 (3.5)，四个平滑集合的下极限界全部得证。

  上界方面，固定 $t > D^∞(cal(N) parallel cal(M))$。由定理 5.1，取 $p > 1$ 使得 $tilde(D)_p^∞(cal(N) parallel cal(M)) < t$，并令 $eta = (p - 1) (t - tilde(D)_p^∞(cal(N) parallel cal(M))) > 0$。式 (4.13) 与 (4.8) 给出
  #eqnb[ $
    N_n ≤ e^(n t) M_n + g_n e^(- n eta) Q_(n, e^(n t)), quad quad Q_(n, e^(n t)) in cal(K)_("iid",n).
  $ ]
  由于 $"log" g_n = o(n)$，最终有 $g_n e^(- n eta) ≤ delta$。把该系数增大到 $delta$ 保持序不等式成立，故对一切充分大的 $n$ 有 $tilde(D)_("max","iid")^δ ≤ n t$。其余三个熵不会更大。令 $t ↓ D^∞$ 即得上极限界。

  若 Choi 支撑包含不成立，改用第 4 节构造的并行检验，取 $b_n = 0$、$a_n = 1 - (1 - q_0)^n → 1$。任何满足 $Q in cal(K)_("all",n)$ 的可行不等式 $N_n ≤ lambda M_n + delta Q$ 都将蕴含
  #eqnb[ $ a_n ≤ delta "Tr" (T_(1,n) Q) ≤ delta, $ ]
  因为并行归一化对任意联合信道的 Choi 算符的压缩等于一。当 $n$ 充分大时 $a_n > delta$，于是没有任何有限的 $lambda$ 可行。这说明四个平滑熵最终都取 $+∞$，与 $D^∞ = +∞$ 相符。
]

#thm("注", title: "5.5")[
  预算与边界核验。同一证明允许预算成一列 $delta_n in (0, 1)$，只要 $"lim sup"_n delta_n < 1$ 且 $"log" (1 slash delta_n) = o(n)$：下界取固定的 $q > "lim sup"_n delta_n$；上界则把指数地小的 IID 松弛量吸收进 $delta_n$。然而零预算时，四个熵都等于 $n D_"max" (cal(N) parallel cal(M))$，因此"正预算"这一限定不可或缺。

  对相同的信道，直接比较迹并取 $Q = N_n$，每个类都给出 $tilde(D)_("max",•)^δ = "log" (1 - delta)$。类似地，$D_H^(1-q, sans(S)) = -"log" q$。这些公式核验了对偶中的归一化与对数修正项的符号。
]
