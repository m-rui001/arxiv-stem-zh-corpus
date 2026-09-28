#import "macros.typ": *

= 1　引言

== 1.1　主要结果

本文研究三维聚焦能量临界非线性薛定谔方程

#eqn("（1.1）")[
  $ (upright(i) partial_t + Delta) u = -abs(u)^4 u, quad u(0) = u_0 ∈ dot(H)^1(ℝ^3). $
]

方程之所以是能量临界的，是因为缩放 $u_λ(t,x) = λ^(frac(1,2)) u(λ^2 t, λ x)$ 同时保持方程本身与初值的 $dot(H)^1(ℝ^3)$ 范数不变。Cazenave–Weissler 的临界局部理论@CW 给出了该空间中的局部适定性以及小数据的散射，稳定性理论见 @KM @TaoBook。强解属于 $C_t dot(H)^1_x ∩ L_(t,x,"loc")^(10)$ 并满足 Duhamel 公式；它在最大存在时间上的 $L^(10)_(t,x)$ 范数有限，便蕴含整体存在与散射。因此，大数据问题的关键在于获得长时间的时空控制。

对于散焦方程，任意能量空间的数据都满足整体适定性与散射。Bourgain@Bourgain 与 Tao@TaoRadial 建立了径向理论，Grillakis@Grillakis 证明了光滑径向数据的整体存在性。Colliander、Keel、Staffilani、Takaoka 与 Tao@CKSTT 解决了三维的一般情形，Ryckman–Visan@RV 解决了四维情形，Visan@Visan 处理了高维情形。散焦能量临界波动方程也有类似的整体结果 @GrillakisWave @SS @BS。

对于聚焦方程，静止的基态使得任意数据不可能散射：

#eqnb[
  $ W(x) = (1 + frac(abs(x)^2, 3))^(-frac(1,2)), quad -Delta W = W^5. $
]

该流保持能量守恒，即 #box[$E(v) = frac(1, 2) norm(∇v)_2^2 - frac(1, 6) norm(v)_6^6$。]基态使最优 Sobolev 不等式 @Aubin @Talenti 取到等号；记 #box[$G := norm(∇W)_2^2 = norm(W)_6^6$，]则

#eqn("（1.2）")[
  $ norm(f)_6^6 ≤ G^(-2) norm(∇f)_2^6, quad E(W) = frac(G, 3). $
]

散射猜想断言：能量与梯度均低于 $W$ 相应阈值的解整体存在且散射，相关讨论见 @KM @KVfocus。受我们此前对三维散焦三次 NLS 在 $s > frac(1, 2)$ 的 $H^s$ 空间中双线性相互作用估计@SZ 的启发，我们在三维证明了这一猜想。我们构造一个频率定域化的相互作用量，其主项在基态以下具有强制性；随后把投影源项吸收进所产生的 $L_(t,x)^4$ 积分之中，而无须假设有限质量。

#thm("定理 1.1")[
  设
  #eqn("（1.3）")[
    $ u_0 ∈ dot(H)^1(ℝ^3), quad E(u_0) < E(W), quad norm(∇u_0)_2 < norm(∇W)_2. $
  ]
  则式 （1.1） 的唯一最大强解整体存在，属于
  #eqnb[
    $ C(ℝ; dot(H)^1) ∩ L_(t,x)^(10)(ℝ × ℝ^3), $
  ]
  且在两个时间方向上均散射：#box[$u_± ∈ dot(H)^1(ℝ^3)$，]使得
  #eqnb[
    $ lim_(t → ±∞) norm(u(t) - e^(upright(i) t Delta) u_±)_(dot(H)^1) = 0. $
  ]
]

式 （1.3） 中的两个条件都是尖锐的。满足 $E(u_0) < E(W)$ 与 $norm(∇u_0)_2 > norm(∇W)_2$ 的有限方差数据会有限时间爆破@KM。在能量 $E(W)$ 处，Duyckaerts–Merle@DMerle 构造了径向解 #box[$W^-$：]它的梯度范数低于 $W$ 的梯度范数，却趋于 $W$ 且沿正向时间不散射。

== 1.2　已有结果与低频问题

在式 （1.3） 之下，能量守恒与最优 Sobolev 不等式 （1.2） 给出能量陷获：梯度范数一致地保持在 $norm(∇W)_2$ 以下，且

#eqnb[
  $ norm(∇u(t))_2^2 - norm(u(t))_6^6 ≥ c(u_0) norm(∇u(t))_2^2. $
]

Kenig–Merle@KM 利用这一强制性证明了三维、四维与五维径向数据的整体适定性与散射。他们的集中紧性论证借助 Keraani 的 profile 分解@Keraani，将散射的失败归结为存在一个非零临界元，其在模对称意义下轨道预紧。径向对称性固定了该临界元的空间中心，因而他们可以在不假设有限质量的情况下，用定域化维里论证将其排除。

若要从这一维里论证中去掉径向对称假设，就需要控制移动的中心。对 NLS 而言，伽利略提升把初始时刻的 $∇u$ 替换为 #box[$∇u + 2 pi upright(i) xi u$，]而当 $u ∈ dot(H)^1$ 时它未必属于 $L^2$。因此，借助提升将动量归一化需要额外的低频控制。对波动方程而言，动量 $integral u_t ∇u$ 在 $dot(H)^1 × L^2$ 中本就是有限的。Kenig–Merle@KMWave 利用 Lorentz 不变性与有限传播速度，建立了非径向刚性所需的零动量性质，从而证明了三维到五维的相应结果。

对五维及更高维的 NLS，Killip–Visan@KVfocus 通过额外的衰减与双 Duhamel 论证获得了所缺的低频控制，由此为临界元得到负正则性，进而得到有限质量。这些界排除了频率级联，并允许进行伽利略提升。在孤子情形，负正则性与几乎周期性给出 $L^2$ 紧性，而极小性给出零动量；二者结合便得到中心的次线性运动，从而允许使用截断维里论证。维数限制源自双 Duhamel 论证@KVfocus[第 6 节]：$t + s$ 与 $t - tau$ 处的正向与反向公式，其传播子的时间间隔为 #box[$s + tau$。]在单位频率下，绝对值色散主项导出如下模型

#eqn("（1.4）")[
  $ integral_0^T integral_0^T (1 + s + tau)^(-frac(d, 2)) dif s dif tau ∼ cases(1 & d ≥ 5, log T & d = 4, T^(frac(1, 2)) & d = 3) quad T ≥ 2. $
]

这描述的是色散主项的可求和性，而非临界元的质量。#footnote[对 $integral_(abs(x) ≤ sqrt(T)) abs(W_(d)(x))^2 dif x$ 而言，同样的增长率也会出现，因为 $d$ 维基态在无穷远处满足 $W_(d)(x) ∼ abs(x)^(2-d)$。]在临界维数四维，Dodson@Dodson4 将长时间 Strichartz 估计与定域化双 Duhamel 估计同定域化相互作用 Morawetz 论证相结合，证明了该定理。在三维，式 （1.4） 中的幂次损失使得直接的绝对值估计无法提供所需的低频控制。早期的非径向结果包括：Han@Han 在定域化质量通量符号条件之下的 $H^1$ 理论，以及 Chung–Han@CH 关于频率尺度具有上下界、有限质量的几乎周期解的刚性定理。
