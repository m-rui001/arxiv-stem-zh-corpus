#import "macros.typ": *
// frag_7：5.2 极小元的收敛性（tex 1902–2119）。本节公式 (26)–(29)：
//   (26) 广义 Poincaré 不等式（tex 1981）、(27) $v_k$ 强收敛到 $u$（tex 2066）、
//   (28) 插值误差估计（tex 2074）、(29) $v_{k,M}$ 收敛到 $v_k$（tex 2078）。
//   另有定理 5.2（tex 1914）、注记 5.2（tex 1947）与定理 5.2 的证明（tex 1965–2117）。
//   原文 tex 1936–1943、1958–1963、2111–2115 的 theorem/remark/proof 均被 `%` 注释，不译。

== 5.2　极小元的收敛性

本节用 Γ–收敛理论说明：$F _ M$ 的极小元 $u _ M ^ (*)$ 会在 $W ^ (1, p)(Omega)$ 中弱收敛到 $F$ 的极小元 $u ^ (*)$，也就是变分问题 $J$ 的极小元。为便于阅读，Γ–收敛理论的基本结论放在附录 B。给定核 $K: macron(Omega) times macron(Omega) -> ℝ$ 与正整数 $s$，若 $K$ 关于各自变量在 $macron(Omega) times macron(Omega)$ 上直至 $2 s$ 阶连续可导，就记 $K in C ^ (2 s)(macron(Omega) times macron(Omega))$。下面给出 Γ–收敛定理。

#thm("定理 5.2", title: "极小元的收敛性")[
  设区域 $Omega subset RR ^ d$ 有界、连通，边界 $partial Omega$ 为 Lipschitz 边界且满足内锥条件，Sobolev 空间 $W ^ (1, p)(Omega)$ 满足 $p > d$。设 $K: macron(Omega) times macron(Omega) -> ℝ$ 是正定核，且 $K in C ^ (2 s)(macron(Omega) times macron(Omega))$、$s > 1$，它诱导的再生核 Hilbert 空间（RKHS）$cal(U)$ 满足：（1）$cal(U)$ 含有变分问题（式 (5)）的唯一极小元 $u ^ (*)$；（2）$cal(U)$ 连续嵌入 $W ^ (1, p)(Omega)$。再假设当 $M _ Omega, M -> ∞$ 时，两个填充距离
  #eqnb[ $ h _ (M, Omega) ≜ "sup" _ (x in Omega) "min" _ (1 <= i <= M _ Omega) |x - x _ i| -> 0 $ ]
  #eqnb[ $ h _ (M, partial Omega) ≜ "sup" _ (x in partial Omega) "min" _ (M _ Omega + 1 <= i <= M) |x - x _ i| -> 0 $ ]
  都趋于零。于是 $u _ M ^ (*)$ 在 $W ^ (1, p)(Omega)$ 中弱收敛到 $u ^ (*)$。特别地，当 $p = 2$ 时，$u _ M ^ (*)$ 在 $H ^ (1)(Omega)$ 中强收敛到 $u ^ (*)$。
]

#thm("注记 5.2")[
  $cal(U)$ 连续嵌入 $W ^ (1, p)(Omega)$ 这一条件对多数常用核都自动成立。以 Matérn 核 $K _ (alpha)$ 为例：只要光滑参数 $alpha + d / 2$ 取整数，RKHS 范数 $norm(u) _ (K _ (alpha))$ 就会迫使 $u$ 在经典意义下 $alpha$ 阶可导，弱可导的阶数则达到 $alpha + d / 2$ @adams2003sobolev。
]

#proof[
  只需证明 $F _ M$ 在 $W ^ (1, p)(Omega)$ 中 Γ–收敛到 $F$，并且序列 $brace.l F _ M brace.r$ 等强制（见附录 B）。

  *等强制性。* 按定义，要证对每个 $alpha in ℝ$，集合
  #eqnb[ $ cal(B) ^ (alpha) = union.big _ (M in NN _ +) cal(B) _ (M) ^ (alpha) ≜ union.big _ (M in NN _ +) brace.l u in W ^ (1, p)(Omega): F _ (M)(u) <= alpha brace.r $ ]
  在 $W ^ (1, p)(Omega)$ 中有界，即 $"sup" _ (u in cal(B) ^ (alpha)) norm(u) _ (W ^ (1, p)(Omega)) < ∞$。由式 (23) 的定义，对每个 $M in NN _ +$ 都有
  #eqnb[ $ cal(B) _ (M) ^ (alpha) ≜ brace.l u in W ^ (1, p)(Omega): F _ (M)(u) <= alpha brace.r = brace.l u in cal(U) _ (M): J(u) <= alpha, u(x _ i) = 0, forall i = M _ Omega + 1, …, M brace.r. $ ]
  先用广义 Poincaré 不等式给出一个上界
  #eqn("(26)")[ $ norm(u) _ (W ^ (1, p)(Omega)) <= C (norm(gradient u) _ (L ^ (p)(Omega)) + norm(u) _ (L ^ (p)(partial Omega))), quad forall u in W ^ (1, p)(Omega), $ ]
  其中常数 $C > 0$ 与 $M$ 无关。任取 $u in cal(B) _ (M) ^ (alpha)$，由 $J(u) <= alpha$ 和条件 C.3 可知存在常数 $C _ 1 > 0$，使得
  #eqnb[ $ norm(gradient u) _ (L ^ (p)(Omega)) <= C _ 1, quad forall u in cal(B) _ (M) ^ (alpha). $ ]
  下面估计任意 $u in cal(B) _ (M) ^ (alpha)$ 的边界范数 $norm(u) _ (L ^ (p)(partial Omega))$。因为 $p > d$，由 Sobolev 嵌入定理 @adams2003sobolev，$W ^ (1, p)(Omega)$ 连续嵌入 $C ^ (0, gamma)(macron(Omega))$，其中 $gamma = 1 - d / p > 0$。对每个 $x in partial Omega$，记 $x _ i$ 为离 $x$ 最近的配点，利用嵌入 $W ^ (1, p)(Omega) arrow.r.hook C ^ (0, gamma)(macron(Omega))$ 可以推得
  #eqnb[ $ |u(x)| = |u(x) - u(x _ i)| <= C _ 2 norm(u) _ (W ^ (1, p)(Omega)) |x - x _ i| ^ (gamma) <= C _ 2 norm(u) _ (W ^ (1, p)(Omega)) h _ (M, partial Omega) ^ (gamma), quad forall u in cal(B) _ (M) ^ (alpha), $ ]
  这里 $C _ 2 > 0$ 是嵌入常数。把上式两边在 $partial Omega$ 上积分，得
  #eqnb[ $ norm(u) _ (L ^ (p)(partial Omega)) <= C _ 2 abs(partial Omega) ^ (1 / p) norm(u) _ (W ^ (1, p)(Omega)) h _ (M, partial Omega) ^ (gamma), quad forall u in cal(B) _ (M) ^ (alpha). $ ]
  填充距离 $h _ (M, partial Omega)$ 随 $M -> ∞$ 趋于 $0$，故存在 $M _ 0$，使得当 $M >= M _ 0$ 时
  #eqnb[ $ norm(u) _ (L ^ (p)(partial Omega)) <= frac(1, 2 C) norm(u) _ (W ^ (1, p)(Omega)), quad forall u in cal(B) _ (M) ^ (alpha). $ ]
  将此估计代回式 (26) 并整理，得到
  #eqnb[ $ norm(u) _ (W ^ (1, p)(Omega)) <= 2 C C _ 1, quad forall u in cal(B) _ (M) ^ (alpha) quad "，其中" M >= M _ 0. $ ]
  因此
  #eqnb[ $ "sup" _ (u in cal(B) ^ (alpha)) norm(u) _ (W ^ (1, p)(Omega)) <= "max" brace.l 2 C C _ 1, "max" _ (u in union.big _ (M < M _ 0) cal(B) _ (M) ^ (alpha)) norm(u) _ (W ^ (1, p)(Omega)) brace.r < ∞, $ ]
  等强制性得证。

  *下极限不等式。* 设序列 $brace.l u _ M brace.r$ 满足 $u _ M ⇀ u$（在 $W ^ (1, p)(Omega)$ 中），要证 $"lim" "inf" _ (M) F _ (M)(u _ M) >= F(u)$。由连续嵌入 $W ^ (1, p)(Omega) arrow.r.hook C ^ (0, gamma)(macron(Omega)) arrow.r.hook C ^ (0)(macron(Omega))$，点求值泛函 $delta _ (x): W ^ (1, p)(Omega) -> ℝ$ 线性且有界，因而属于对偶空间 $(W ^ (1, p)(Omega)) ^ (*)$。按 $W ^ (1, p)(Omega)$ 中弱收敛的定义，对一切 $x in macron(Omega)$ 都有逐点收敛 $u _ (M)(x) -> u(x)$。下面分两种情形证明下极限不等式。

  第一种情形：$u in W ^ (1, p)(Omega) ∖ W _ (0) ^ (1, p)(Omega)$，此时
  #eqnb[ $ F(u) = ∞ quad "，且" integral _ (partial Omega) |u(s)| ^ (p) upright(d) s > 0. $ ]
  用反证法。若 $"lim" "inf" _ (M) F _ (M)(u _ M) < ∞$，则可取到子列 $brace.l u _ (M ^ (k)) brace.r _ (k)$ 和常数 $alpha$，使 $F _ (M ^ (k))(u _ (M ^ (k))) <= alpha$ 对所有 $k in NN _ +$ 成立。于是每个 $k in NN _ +$ 都满足 $u _ (M ^ (k)) in cal(U) _ (M ^ (k))$、$J(u _ (M ^ (k))) <= alpha$，并且 $u _ (M ^ (k))$ 在边界配点 $x _ (M ^ (k), Omega)$ 至 $x _ (M ^ (k))$ 上取值为 $0$。把等强制性那一段的论证照搬到序列 $brace.l u _ (M ^ (k)) brace.r _ (k)$，可得
  #eqnb[ $ "lim" _ (k -> ∞) integral _ (partial Omega) |u _ (M ^ (k))(s)| ^ (p) upright(d) s = 0. $ ]
  再对序列 $brace.l |u _ (M ^ (k))| ^ (p) brace.r _ (k)$ 使用 Fatou 引理，就有
  #eqnb[ $ "lim" "inf" _ (k) integral _ (partial Omega) |u _ (M ^ (k))(s)| ^ (p) upright(d) s >= integral _ (partial Omega) "lim" "inf" _ (k) |u _ (M ^ (k))(s)| ^ (p) upright(d) s = integral _ (partial Omega) |u(s)| ^ (p) upright(d) s > 0, $ ]
  这与 $"lim" _ (k) integral _ (partial Omega) |u _ (M ^ (k))(s)| ^ (p) upright(d) s = 0$ 矛盾。因此 $"lim" "inf" _ (M) F _ (M)(u _ M) = F(u) = ∞$。

  第二种情形：弱极限 $u in W _ (0) ^ (1, p)(Omega)$，此时 $F(u) = J(u)$。由弱下半连续性得 $"lim" "inf" _ (M) J(u _ M) >= J(u)$；又因为 $F _ (M)(u _ M) >= J(u _ M)$，下极限不等式立刻成立。

  *恢复序列。* 任取 $u in W ^ (1, p)(Omega)$，要构造满足 $u _ M ⇀ u$（在 $W ^ (1, p)(Omega)$ 中）的序列 $brace.l u _ M brace.r$，使 $"lim" _ (M) F _ (M)(u _ M) = F(u)$。与下极限部分一样，仍分两种情形。

  先看 $u in W _ (0) ^ (1, p)(Omega)$，按定义此时 $F(u) = J(u)$。注意 $u$ 未必落在 $cal(U)$ 里，所以核插值的经典收敛估计不能直接用——这类估计一般要用到 RKHS 范数 $norm(u) _ (cal(U))$（例如 @wendland2004scattered 第 11 章）。为此采用标准的对角线抽取论证。由于 $C _ (c) ^ (∞)(Omega)$ 在 $W _ (0) ^ (1, p)(Omega)$ 中稠密，存在序列 $brace.l v _ (k) brace.r subset C _ (c) ^ (∞)(Omega)$ 使得
  #eqnb[ $ "lim" _ (k -> ∞) norm(v _ (k) - u) _ (W ^ (1, p)(Omega)) = 0, $ ]
  再由强连续性条件 C.4 得
  #eqn("(27)")[ $ "lim" _ (k -> ∞) F(v _ (k)) = "lim" _ (k -> ∞) J(v _ (k)) = J(u) = F(u). $ ]
  接下来，对每个 $v _ (k) in C _ (c) ^ (∞)(Omega) subset cal(U) subset W ^ (1, p)(Omega)$，取 $v _ (k)$ 的一列插值元 $brace.l v _ (k, M) brace.r _ (M)$，其中 $v _ (k, M) in cal(U) _ (M)$ 且对所有 $m = M _ (Omega) + 1, …, M$ 满足 $v _ (k, M)(x _ (m)) = 0$。由经典估计（例如 @wendland2004scattered 定理 11.13），
  #eqn("(28)")[ $ norm(v _ (k, M) - v _ (k)) _ (W ^ (1, p)(Omega)) <= C h _ (M, Omega) ^ (s - 1) norm(v _ (k)) _ (cal(U)), quad forall M in NN _ +. $ ]
  再次利用条件 C.4，对每个固定的下标 $k in NN$ 有
  #eqn("(29)")[ $ "lim" _ (M -> ∞) F _ (M)(v _ (k, M)) = "lim" _ (M -> ∞) J(v _ (k, M)) = J(v _ (k)) = F(v _ (k)). $ ]
  现在用对角线论证抽出序列 $brace.l u _ M brace.r$。具体地说，对每个下标 $k in NN _ +$，估计式 (28) 允许我们取足够大的 $M(k) in NN _ +$，使得
  #eqnb[ $ norm(v _ (k, M) - v _ (k)) _ (W ^ (1, p)(Omega)) < frac(1, k). $ ]
  对每个 $k$ 定义 $u _ (M(k)) ≜ v _ (k, M)$，由于
  #eqnb[ $ "lim" _ (k -> ∞) norm(u _ (M(k)) - u) _ (W ^ (1, p)(Omega)) <= "lim" _ (k -> ∞) norm(v _ (k, M) - v _ (k)) _ (W ^ (1, p)(Omega)) + "lim" _ (k -> ∞) norm(v _ (k) - u) _ (W ^ (1, p)(Omega)) = 0, $ ]
  $u _ (M(k))$ 在 $W ^ (1, p)(Omega)$ 中强收敛到 $u$。最后把式 (27) 与式 (29) 合并，得到
  #eqnb[ $ "lim" _ (M(k) -> ∞) F _ (M(k))(u _ (M(k))) = F(u). $ ]

  再看 $u in W ^ (1, p)(Omega) ∖ W _ (0) ^ (1, p)(Omega)$，此时 $F(u) = ∞$。恢复序列可简单取为 $brace.l u _ M brace.r$，令 $u _ M = u$ 对一切 $M$ 成立。这样显然有 $u _ M ⇀ u$，且
  #eqnb[ $ "lim" "sup" _ (M -> ∞) F _ (M)(u _ M) <= + ∞ = F(u). $ ]
  由下极限不等式还有
  #eqnb[ $ "lim" "inf" _ (M -> ∞) F _ (M)(u _ M) >= F(u), $ ]
  于是定理得证。
]
