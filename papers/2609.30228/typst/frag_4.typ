#import "macros.typ": *

#thmof("命题 2.3", "频率定域化的相互作用 Morawetz 估计")[
  设 $u$ 如命题 2.2 中所取。存在与 $nu$ 无关的常数 $C_u, nu_0 > 0$ 和一列单调递增至无穷的时刻 $T_j → ∞$，使得
  #eqn("（2.6）")[
    $ norm(P_(> nu) u)_(L^4_(t,x)([0,T_j] × ℝ^3))^4 <= C_u nu^(-3) + ε_(u)(nu) norm(P_(> nu) u)_(L^4_(t,x)([0,T_j] × ℝ^3))^4, quad 0 < nu <= nu_0. $
  ]
  其中 $ε_(u)(nu) → 0$（$nu → 0$）。特别地，对每个充分小的固定 $nu$，
  #eqn("（2.7）")[
    $ integral_0^∞ ∫_(ℝ^3) abs(P_(> nu) u(t,x))^4 dif x dif t "≲"_u nu^(-3). $
  ]
]

由轨道的预紧性（见式 （3.7）），当 $nu$ 充分小时有 #box[$K_(a)(I) "≳"_u K_(N)(I)$。]于是式 （2.7） 已经排除了 #box[$K_(N)([0,∞)) = ∞$。]为了把一切频率尺度都覆盖进来，我们还将在命题 3.2 中证明有限区间上的比较 #box[$norm(F(u))_(L^2_(t) L^1_(x)([0,T_j]))^2 "≲"_u K_(a)([0,T_j])$，]它与式 （2.7） 合起来恰好给出下面刚性引理的假设。

#thm("引理 2.4")[
  设 $u$ 是式 （1.1） 的向前整体强解，满足无损耗 Duhamel 公式 （2.3） 以及
  #eqnb[
    $ sup_(t >= 0) norm(∇ u(t))_2 <= B < ∞, quad F(u) ∈ L^2_(t) L^1_(x)([0,∞) × ℝ^3), $
  ]
  则 #box[$u ≡ 0$。]
]

记 #box[$f(t) = norm(F(u(t)))_1$。]关键估计对每个 $n > 0$ 都成立：

#eqn("（2.8）")[
  $ norm(u(t))_2 <= C n^(frac(1, 2)) norm(f)_(L^2(t,∞)) + frac(C B, n). $
]

取 $n = 1$ 即回到有限质量；再由质量守恒以及强迫项尾部的衰减，这一质量只能为零。完整的证明放在第 5 节末尾给出。

== 2.3　相互作用恒等式

为了得到式 （2.6），我们寻找一个时间导数，使它对 $a(t)$ 给出正的控制。取 #box[$k(x) = abs(x)$，]相应的密度项是 #box[$8 pi a(t)$，]但聚焦势是负的。因此我们需要一个核，让它的完整主项仍然控制得住 $a(t)$。

对 $h ∈ H^1$ 与实的偶核 $k$，令

#eqnb[
  $ rho = abs(h)^2, quad p = "Im"(macron(h) ∇ h), quad Q_(k)(h) = -∬ Delta^2 k(x-y) rho(x) rho(y) dif x dif y. $
]

相互作用作用量及其主项为

#eqn("（2.9）")[
  $ M_(k)(h) = 2 ∬ rho(y) ∇ k(x-y) dot p(x) dif x dif y, $
]

#eqn("（2.10）")[
  $
    ℬ_(k)(h) &= Q_(k)(h) + 4 ∬ k_(j k)(x-y) [rho(y) "Re"(partial_j macron(h) partial_k h)(x) - p_(j)(y) p_(k)(x)] dif x dif y \
      &- frac(4, 3) ∬ Delta k(x-y) abs(h(x))^6 rho(y) dif x dif y.
  $
]

源项估计需要如下关于 $t$ 一致的界

#eqn("（2.11）")[
  $ abs(∇ k(t,x)) + abs(x) abs(D^2 k(t,x)) + abs(x)^2 abs(D^3 k(t,x)) <= C_k. $
]

其中空间导数按弱意义理解，界几乎处处成立。再令

#eqnb[
  $ q(x) = ∫ ∇ k(x-y) rho(y) dif y, quad q_(m)(y) = ∫ ∇ k(x-y) dot p(x) dif x. $
]

投影方程与两个强迫括号为

#eqnb[
  $ (upright(i) partial_t + Delta) h = -F(h) - ℰ, quad ℰ = G_1 - g, quad G_1 = F(u) - F(h), quad g = P_(<= nu) F(u), \
    {z,h}_m = "Im"(z macron(h)), quad {z,h}_p = "Re"(z ∇ macron(h) - h ∇ macron(z)). $
]

求导便得

#eqnb[
  $ partial_t rho &= -2 "div" p - 2 {ℰ,h}_m, \
    partial_t p_j &= frac(1, 2) partial_j Delta rho - 2 partial_k "Re"(partial_j macron(h) partial_k h) + frac(2, 3) partial_j abs(h)^6 - {ℰ,h}_(p,j). $
]

把它们代入式 （2.9），除了主项 （2.10） 之外还多出

#eqn("（2.12）")[
  $ "Err"_(k,nu) = -2 ∫ q dot {ℰ,h}_p - 4 ∫ q_m {ℰ,h}_m. $
]

对第 4 节中构造的可微核族 $k_(R,A)$，令 #box[$M_ψ = 2 ∫ p dot (partial_R ∇ k_(R,A) ast rho)$。]完整恒等式为

#eqn("（2.13）")[
  $ frac(dif, dif t) M_(k_(R(t),A))(h(t)) = ℬ_(k_(R(t),A))(h(t)) + "Err"_(k_(R(t),A),nu)(t) + R'(t) M_(ψ)(h(t)). $
]

这些计算先对光滑函数进行，到命题 2.3 的证明中再在能量正则性下把积分后的恒等式补严格。把最后一项记作 #box[$D(t) = R'(t) M_(ψ)(h(t))$，]我们要建立

#eqn("（2.14）")[
  $
    ℬ_(k_(R(t),A))(h(t)) >= c_u a(t), quad D(t) >= -ε_("rad")(nu) a(t), \
    abs(∫_(I_j) "Err"_(k_(R(t),A),nu)(t) dif t) <= ε_("src")(nu) [nu^(-3) + K_(a)(I_j)], quad ε_("rad")(nu) + ε_("src")(nu) → 0.
  $
]

由于 #box[$abs(M_(k)(h)) <= 2 norm(∇ k)_∞ norm(h)_2^3 norm(∇ h)_2 "≲"_u nu^(-3)$，]对式 （2.13） 积分即得式 （2.6）。下面的低频估计将控制住源项；此外，所选的核还要同时给出式 （2.14） 中的前两个不等式。
