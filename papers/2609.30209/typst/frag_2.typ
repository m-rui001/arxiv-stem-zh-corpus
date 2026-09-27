// frag_2：本文件由 main.typ 用 #include 引入；Typst 的 include 不继承外层作用域，故此处必须自带 import。
#import "macros.typ": *
= 2　线性鞅系统

本节引入一个抽象的线性结构，用来刻画解逐层传播的过程，为第 3 节研究离散唯一延拓（discrete unique continuation）作准备。这一结构的由来，可参看下文构造 3.8。我们注意到，从某种意义上讲，它与 @LSZ26[附录 A] 中的位点混合鞅（site-mixed martingale）颇为相像。

#thm("定义 2.1")[
  取定整数 $n_"blk" >= 1$，并对指标 $1 <= f <= n_"blk"$ 各取定整数 $r_f, b_f >= 1$。对每个 $1 <= f <= n_"blk"$，令
  #eqnb[ $ cal(J)_f = {(f,j): 1 <= j <= r_f}, $ ]
  称它为第 $f$ 个*源块*（source block）。给每个源块 $cal(J)_f$ 配上一个*目标集*（target set）
  #eqnb[ $ cal(K)_f = {(f,k)_"tag": 1 <= k <= b_f}, $ ]
  其中的每个元素 $(f,k)_"tag"$ 都称为一个*目标*（target）。把成对的这两类对象打包在一起，记作
  #eqnb[ $ cal(M) = {(cal(J)_f, cal(K)_f): 1 <= f <= n_"blk"}. $ ]

  设 $p >= 1$ 是整数，$c_0 > 0$ 与 $C_0 > 0$ 是给定的常数，$K ⊂ ℂ^p$，而 $(Ω, ℙ)$ 是一个概率空间。若 $cal(M)$ 具有下面各条性质，就称它是概率空间 $(Ω, ℙ)$ 上以 $K$ 为*输入体*（input body）的 $(c_0, C_0)$-*线性鞅系统*（linear-martingale system）。

  （1）*位与字。*　对每个 $1 <= f <= n_"blk"$ 和每个 $(f,j) ∈ cal(J)_f$，各配有 $(Ω, ℙ)$ 上一列独立同分布（i.i.d.）随机变量 $omega_(f,j)$，其共同分布为
  #eqnb[ $ ℙ(omega_(f,j) = 0) = ℙ(omega_(f,j) = 1) = 1 / 2, quad quad 1 <= f <= n_"blk", (f,j) ∈ cal(J)_f. $ ]
  等价地，若记
  #eqnb[ $ cal(J) = union_(f=1)^(n_"blk") cal(J)_f, $ ]
  便可把 $Ω$ 看成 $ {0,1}^cal(J) $，把 $ℙ$ 看成布尔立方体 $Ω$ 上的均匀分布。

  称随机变量 $omega_(f,j)$ 为*位*（bit），称 $omega_f = (omega_(f,1), …, omega_(f,r_f))$ 为源块 $cal(J)_f$ 的*位串*（bit sequence）。一个完整配置 $omega ∈ Ω$ 称为一个*字*（word）。记
  #eqnb[ $ omega_("<f") &= (omega_1, omega_2, …, omega_(f-1)), \ omega_("≤f") &= (omega_1, omega_2, …, omega_f), $ ]
  为字 $omega$ 限制在相应指标集上所得到的部分，并由
  #eqnb[ $ script(F)_0 = {∅, Ω}, quad quad script(F)_f = sigma(omega_("≤f")), 1 <= f <= n_"blk", $ ]
  得到一列 σ-代数，它们构成滤子（filtration）。

  （2）*输入、源、汇与扇。*　一个*输入*（input）是向量 $v = (v_1, …, v_p) ∈ K$，它用来决定与系统 $cal(M)$ 相联系的若干复线性泛函的取值。给 $cal(J)$ 的每个元素 $(f,j)$（以及每个目标 $(f,k)_"tag"$）各配上一个关于 $v$ 的复线性泛函：元素 $(f,j)$ 配*源*（source）$S_(f,j)$，目标 $(f,k)$ 配*汇*（sink）$Y_(f,k)$。它们可以写成
  #eqn("(2.1)")[ $ S_(f,j)(omega_("<f"); v) &= sum_(nu=1)^p s_(f,j,nu)(omega_("<f")) v_nu, quad 1 <= j <= r_f, $ ]
  #eqn("(2.2)")[ $ Y_(f,k)(omega_("≤f"); v) &= sum_(nu=1)^p y_(f,k,nu)(omega_("≤f")) v_nu, quad 1 <= k <= b_f. $ ]
  上面两式说明，源 $S_(f,j)$（连同它的系数 $s_(f,j,nu)$）只依赖于 $omega_("<f")$，即是 $script(F)_(f-1)$-可测的。特别地，当 $f = 1$ 时，源 $S_(1,j)(v)$ 只依赖于空字，也就是说它们与 $omega$ 无关，是完全确定的。类似地，汇 $Y_(f,k)$ 连同它的系数 $y_(f,k,nu)$ 只依赖于 $omega_("≤f")$，是 $script(F)_f$-可测的。把汇按次序排成
  #eqnb[ $ (Y_(f,1)(omega_("≤f"); dot), …, Y_(f,b_f)(omega_("≤f"); dot)), $ ]
  称它为源块 $f$ 的*扇*（fan）。图 1 是其示意。

  #fig("1")[
    二维实输入体 $K$ 的示意，图中还标出一个输入 $v$ 以及同一扇中的三个目标形式。彩色直线表示非零实线性汇的核。至于复的情形，只需取实部或虚部，就能由实情形的示意图得到近似的理解。
  ][
    #include "fig/fan_input_body.typ"
  ]

  （3）*带 $c_0$ 的传播条件。*　固定 $(f,j) ∈ cal(J)$ 和一个配置
  #eqnb[ $ hat(omega)_(f,j) = (omega_("<f"), (omega_(f,h))_(h ≠ j)). $ ]
  对 $e ∈ {0,1}$，由于 $Y_(f,k)$ 只依赖于 $omega_("≤f") = (hat(omega)_(f,j), omega_(f,j))$，可记 $Y_(f,k)^"(e)"(hat(omega)_(f,j); dot)$ 为如下所得的目标形式：令 $omega_(f,j) = e$，而保持 $omega_("≤f")$ 中其余各位不动。对每个这样的配置 $hat(omega)_(f,j)$ 和每个目标 $(f,k)_"tag"$，都存在一个与 $v$ 无关的标量 $c_(f,j,k)(hat(omega)_(f,j))$，使得
  #eqn("(2.3)")[ $ Y_(f,k)^"(1)"(hat(omega)_(f,j); v) - Y_(f,k)^"(0)"(hat(omega)_(f,j); v) = c_(f,j,k)(hat(omega)_(f,j)) S_(f,j)(omega_("<f"); v), quad quad abs(c_(f,j,k)(hat(omega)_(f,j))) >= c_0. $ ]
  其中的等式是复线性泛函之间的恒等式：它对每个 $v ∈ K$ 都成立。

  （4）*带 $C_0$ 的一致系数界。*　把 (2.1) 与 (2.2) 中相应的系数行分别记作 $bold(s)_(f,j)$ 与 $bold(y)_(f,k)$（它们确实是 $ℂ^p$ 中的向量），并要求它们的 $ℓ^2$ 范数由 $C_0$ 确定地界住，即
  #eqn("(2.4)")[ $ sup_(omega ∈ Ω) max_(f,j) norm(bold(s)_(f,j)(omega_("<f")))_2 <= C_0, quad quad sup_(omega ∈ Ω) max_(f,k)_"tag" norm(bold(y)_(f,k)(omega_("≤f")))_2 <= C_0. $ ]
]

#thm("注记 2.2")[
  所有源块、源块的先后次序、各个目标以及系数映射，都是在字（也就是随机性）被揭示之前就已固定好的。在第 3 节中，我们将在目标与 $ℤ^d$ 的一些格点之间建立一一对应，这些对应同样在字被揭示之前就固定下来。
]

== 2.1　被条带截去的凸集体积估计

若集合 $K ⊂ ℂ^p$ 满足 $e^(i theta) K = K$ 对每个 $θ ∈ ℝ$ 都成立，就称它是*平衡的*（circled）。用 $"vol"_(2p)$ 表示 $ℂ^p ≃ ℝ^(2p)$ 上的 Lebesgue 体积，并用
#eqnb[ $ B_rho = {w ∈ ℂ^p: norm(w)_2 <= rho} $ ]
记 $ℂ^p$ 中的闭欧氏球。若 $K$ 紧且 $L: ℂ^p → ℂ$ 复线性，则定义 $K$ 在 $L$ 下的*宽度*为
#eqn("(2.5)")[ $ w_K(L) = max_(v ∈ K) abs(L(v)). $ ]

下面这条引理估计线性鞅系统的输入体 $K$ 被一条条带截去一部分时体积的变化。这样的截割会出现在下述情形：$K$ 在某个源之下具有较大的宽度，而实际的输入却让该源取值很小，于是我们既能从 $K$ 中切去相当大的一块，又能把真正的输入保留在余下的部分里。引理所要估计的，正是这一过程中的体积损失；图 2 是其示意。

#fig("2")[
  引理 2.3 中估计的示意。
][
  #include "fig/complex_central_strip.typ"
]

#thm("引理 2.3")[
  设 $p >= 1$，$K ⊂ ℂ^p$ 是有非空内部的紧凸平衡集，$L$ 是非零复线性泛函。则对每个 $τ > 0$，
  #eqn("(2.6)")[ $ frac("vol"_(2p) (K ∩ {abs(L) <= tau}), "vol"_(2p) (K)) <= p (2p - 1) (frac(tau, w_K(L)))^2. $ ]
]

#proof[
  记 $r = w_K(L) > 0$。当 $p = 1$ 时，$K$ 是以原点为圆心的圆盘，可写成
  #eqnb[ $ K = {abs(z) <= r_K}, $ ]
  其中 $r_K$ 是某个正数；而 $L$ 可写成
  #eqnb[ $ L(v) = z_0 v, quad forall v ∈ ℂ, $ ]
  其中的 $z_0$ 是某个非零复数。于是 $r = abs(z_0) r_K$，且 (2.6) 的左端等于
  #eqnb[ $ frac(min (r_K^2, tau^2 / abs(z_0)^2), r_K^2) = min (1, tau^2 / r^2). $ ]
  故 $p = 1$ 时 (2.6) 成立。下设 $p >= 2$，并令 $m = 2p - 2$。取复线性坐标 $(z, y) ∈ ℂ × ℂ^(p-1)$，使 $z = L(v)$，再定义
  #eqnb[ $ K_z = {y: (z, y) ∈ K}, quad f(z) = "vol"_m (K_z). $ ]
  在这一坐标变换下，恒定的 Jacobi 行列式在体积比——也就是 (2.6) 的左端——中相互抵消。$K$ 的凸性与平衡性经此变换仍然保持，并给出 $L(K) = {abs(z) <= r}$。此外，平衡性给出
  #eqn("(2.7)")[ $ f(e^(i theta) z) = "vol"_m (K_(e^(i theta) z)) = "vol"_m (e^(i theta) K_z) = f(z), $ ]
  凸性则给出
  #eqn("(2.8)")[ $ frac(1, 2) (K_z + K_(-z)) ⊆ K_0. $ ]
  在 $ℝ^m$ 中对 (2.8) 使用 Brunn–Minkowski 不等式，便得到
  #eqn("(2.9)")[
    $ f(0) &= "vol"_m (K_0) >= "vol"_m (frac(1, 2) (K_z + K_(-z))) \
      &>= [ frac("vol"_m (K_z)^(1/m) + "vol"_m (K_(-z))^(1/m), 2) ]^m = f(z). $
  ]
  上式最后一个等号用的是 (2.7) 取 $θ = π$，由此 $f(-z) = f(z)$。

  对每个 $θ ∈ 𝕋$，取 $(r e^(i theta), y_θ) ∈ K$。由 $K$ 的凸性以及 $(1 - s #s r) dot 0 + (s #s r) dot r e^(i theta) = s e^(i theta)$ 可知，对 $0 <= s <= r$ 有
  #eqnb[ $ (1 - s/r) K_0 + (s/r) y_θ ⊆ K_(s e^(i theta)). $ ]
  由于把集合平移 $(s #s r) y_θ$ 不改变它的体积，于是对 $0 <= s <= r$，
  #eqnb[ $ f(s e^(i theta)) >= (1 - s/r)^m f(0). $ ]
  结合这一估计与 (2.9)，先对 $y ∈ ℂ^(p-1)$ 积分，再改用极坐标对 $z ∈ ℂ$ 积分，可得
  #eqnb[
    $ "vol"_(2p) (K) &>= 2 pi f(0) integral_0^r s (1 - s/r)^m dif s = frac(2 pi f(0) r^2, (m + 1)(m + 2)), \
      "vol"_(2p) (K ∩ {abs(L) <= tau}) &<= pi tau^2 f(0). $
  ]
  上面两个不等式相除恰好就是 (2.6)，因为 $(m + 1)(m + 2) #s 2 = p (2p - 1)$。
]
