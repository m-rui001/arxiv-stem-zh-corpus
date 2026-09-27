#import "macros.typ": *

= 6　有限次界与精确强逆指数

上一节的证明已经给出速率高于 Stein 速率时的指数衰减。本节保留检验界中最优的标量常数，把这一衰减定量刻画。由此得到的有限次不等式与已知的并行可达性相合，就确定了三类检验器共同的精确指数。

== 6.1　完整的定阶逆命题

式 (4.13) 的右端可以乘上更锐的常数 $c_p = (p - 1)^(p - 1) slash p^p$。事实上，在 $x = lambda b slash a in (0, 1)$ 处最大化 $(1 - x) x^(p - 1)$ 给出
#eqnb[ $ a - lambda b ≤ c_p lambda^(1 - p) a^p b^(1 - p). $ ]
把这条加强后的 $Delta_n$ 界代入式 (4.9)，再对 $lambda > 0$ 取下确界。初等恒等式
#eqnb[ $ "inf"_(lambda > 0) { lambda b + c_p K lambda^(1 - p) } = K^(1 slash p) b^((p - 1) slash p) $ ]
给出
#eqn("(6.1)")[ $
  frac(a^p b^(1 - p), g_n) ≤ "exp" lr([ (p - 1) tilde(D)_p (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ]) ≤ e^(n (p - 1) tilde(D)_p^∞ (cal(N) parallel cal(M))).
$ ]
在 $(a, b) = (0, 0)$ 处规定二元矩为零。此处 $b = 0$ 由有限的 Choi 控制蕴含 $a = 0$；其余情形上述下确界可直接计算。特别地，$a ≥ 1 - ε$ 给出
#eqn("(6.2)")[ $
  D_H^(ε, "gen") (cal(N)^(⊗ n) parallel cal(M)^(⊗ n)) ≤ n tilde(D)_p^∞ (cal(N) parallel cal(M)) + frac("log" g_n + p "log" frac(1, 1 - ε), p - 1).
$ ]
当 $b ≤ e^(- n r)$ 时，式 (6.1) 还给出
#eqn("(6.3)")[ $
  a ≤ g_n^(frac(1, p)) "exp" lr([ -n frac(p - 1, p) lr([ r - tilde(D)_p^∞ (cal(N) parallel cal(M)) ]) ]).
$ ]
这些界比式 (5.17) 更锐，并将据此确定精确指数。它们的证明只用到标量不等式 (4.9)，不需要显式构造的并行检验器。

== 6.2　精确的强逆指数

前面的证明没有引用任何外部的精确指数公式就建立了 Stein 定理。要确定整条衰减指数，现在使用 @FawziFawzi2021 定理 5.5 中的并行可达性部分。对检验器类 $S$ 与 $r > 0$，定义
#eqn("(6.4)")[ $
  E_"sc"^S (r) = "inf"_( (T_(1,n), T_(2,n)) ∈ S ∀ n, quad "lim inf"_n - frac(1, n) "log" b_n ≥ r) "lim sup"_(n → ∞) - frac(1, n) "log" a_n.
$ ]
这里约定 $-"log" 0 = +∞$。@FawziFawzi2021 第 5.2.1 节的错误量是 $alpha_n = 1 - a_n$ 与 $beta_n = b_n$，该文条件 $"lim sup"_n frac(1, n) "log" beta_n ≤ -r$ 与上式所列的条件完全相同。该文用以 $2$ 为底的约定，化为自然对数只需把 $r$ 替换成 $r slash "log" 2$，并把一切散度与指数都乘以 $"log" 2$。所引定理的陈述对象是有限维 CPTP 映射，并且明确指出用非自适应、从而也是并行的策略即可达到该指数。下面的推论只假设 Choi 支撑包含，两个信道都不要求 Choi 算符满秩。

#thm("推论", title: "6.1")[
  精确指数及其阈值。对满足 $"supp" J^cal(N) ⊆ "supp" J^cal(M)$ 的有限维 CPTP 映射 $cal(N), cal(M) : A → B$、任意 $r > 0$ 与任意 $S in { "par", "ada", "gen" }$，
  #eqn("(6.5)")[ $
    E_"sc"^S (r) = "sup"_(p > 1) frac(p - 1, p) lr([ r - tilde(D)_p^∞ (cal(N) parallel cal(M)) ]).
  $ ]
  这一公共指数严格为正，当且仅当 $r > D^∞(cal(N) parallel cal(M))$。
]

#proof[
  对定义中的每个序列与每个固定的 $p > 1$，式 (6.1) 给出
  #eqnb[ $
    "lim sup"_(n → ∞) - frac(1, n) "log" a_n ≥ frac(p - 1, p) lr([ r - tilde(D)_p^∞ (cal(N) parallel cal(M)) ]).
  $ ]
  事实上，先在 $b_n$ 的最终界里把 $r$ 换成 $r - eta$，再令 $eta ↓ 0$；其间 $frac(1, n) "log" g_n → 0$。对 $p$ 取上确界，就得到一般策略的指数 $E_"sc"^"gen"$ 的下界。@FawziFawzi2021 定理 5.5 的并行可达性用同一个表达式从上方界住并行指数。检验器的包含关系给出 $E_"sc"^"gen" ≤ E_"sc"^"ada" ≤ E_"sc"^"par"$，于是三个数值彼此相同。这一相等没有用到端点；端点用来判定它何时为正。由定理 5.1，当 $r > D^∞$ 时该上确界为正。当 $r ≤ D^∞$ 时，其中的各项都非正，并在 $p ↓ 1$ 时趋于零，因为 $tilde(D)_p^∞ ≤ D_"max" < ∞$。
]
