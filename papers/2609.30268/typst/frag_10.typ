#import "macros.typ": *

= A　精确的多项式并行化

主证明只用到式 (4.9) 这一个标量推论。为完整起见，这里保留更强的精确接受对转化。

#thm("命题", title: "A.1")[
  多项式并行化。对每个具有接受对 $(a, b)$ 的 $n$ 槽一般检验器，都存在一个 $n$ 槽并行检验器，其接受对为 $(a slash g_n, b slash g_n)$。于是
  #eqn("(A.1)")[ $ beta_ε^"gen"(cal(N)^(⊗ n), cal(M)^(⊗ n)) ≥ g_n beta_(1 - (1 - ε) slash g_n)^"par" (cal(N)^(⊗ n), cal(M)^(⊗ n)). $ ]
]

#proof[
  对检验器作联合置换平均，接受对 $(a, b)$ 保持不变，并记 $W = T_1 + T_2$。由于 $X ⊗ bb(1) ≥ W ≥ 0$ 本身就蕴含 $X ≥ 0$，SDP 对偶给出
  #eqn("(A.2)")[ $ gamma(W) = "min"_(X = X^dagger, " " X ⊗ bb(1) ≥ W) "Tr" X = "max"_(Q ≥ 0, " " "Tr"_(B^n) Q = bb(1)_(A^n)) "Tr"[W Q]. $ ]
  取充分大的标量 $X$ 就有严格的原始可行；由迹的紧性，最小值可以取到，而信道 Choi 集合是紧的，对偶最大值同样可以取到。对偶最优解 $Q$ 经联合置换平均后即可套用式 (4.7)，一般归一化随即给出
  #eqnb[ $ gamma(W) ≤ g_n integral "Tr"[W (J^cal(C))^(⊗ n)] dif mu(cal(C)) = g_n. $ ]
  此外 $gamma(W) ≥ "Tr"(W P_0) = 1$，其中 $P_0$ 是完全去极化信道的乘积 Choi 算符，因此下面的归一化不会除以零。对最优的 $X$，令 $sigma = X slash "Tr" X$，则 $W ≤ g_n sigma ⊗ bb(1)$，于是 $T_1 slash g_n$ 与 $sigma ⊗ bb(1) - T_1 slash g_n$ 就构成所求的并行检验器，其接受对恰为 $(a slash g_n, b slash g_n)$。
]
