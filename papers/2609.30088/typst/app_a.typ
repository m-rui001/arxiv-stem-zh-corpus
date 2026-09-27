// 附录 A（对应 Main.tex 第 505–641 行）：AT-SKM-Net 算法流程 + 有效集预测加速采样的完整证明
// 编号公式沿用主文序列，硬编码为 (13)–(20)，全部走 #eqn 助手。
// 说明：校具全局开着 math.equation 自动编号，块级公式会被额外打上一个自动编号，
// 故在本文件作用域内关掉自动编号，编号只由 #eqn 的字符串给出。
// 另：Typst 的 #include 不继承父文件的作用域，宏需在本文件内自行 import（重复 import 无副作用）。
// 多行对齐公式在 #eqn 体内用行尾单个反斜杠换行；写成双反斜杠会被当成字面反斜杠并把公式挤成一行。
#import "macros.typ": *

#set math.equation(numbering: none)

= 附录 A　AT-SKM-Net 算法流程与理论证明

== A.1　AT-SKM-Net 算法流程

@alg-a-flow 汇总了 AT-SKM-Net 的完整求解流程：先由预测器给出热启动点并做等式投影，随后在 $C$ 的零空间内按混合采样推进不等式迭代。

#figure(
  kind: "algorithm",
  supplement: [算法],
  {
    set text(size: 8.5pt)
    set par(first-line-indent: 0em, spacing: 0.25em)
    block(width: 100%, inset: (x: 0.8em, y: 0.6em), stroke: 0.6pt + black)[
      #text(weight: "bold")[输入：] 约束数据 $(A, b, C, d)$、预测器 $phi$、采样批规模 $beta$、混合比例 $rho$、最大迭代数 $K$\
      #text(weight: "bold")[输出：] 可行解 $x _K$\
      1: $(x _0, s) ← phi(A, b, C, d)$\
      2: $p _i ← frac(sigma(s _i), sum _(j=1)^m sigma(s _j))$，$i = 1, …, m$\
      3: *等式投影阶段。*\
      4: $L ← "CholeskyUpdate"(C)$，使得 $L L^top = C C^top$\
      5: 求解 $L L^top y = C x _0 - d$，并置 $x _"eq" = x _0 - C^top y$\
      6: $N ← "NullSpaceUpdate"(C, L)$，$C N = 0$\
      7: $tilde(A) ← A N$，$tilde(b) ← b - A x _"eq"$，$omega _0 ← 0$\
      8: *不等式迭代阶段。*\
      9: *for* $k = 0, 1, …, K - 1$ *do*\
      10: 　　$beta _"act" ← floor(rho beta)$，$beta _"unif" ← beta - beta _"act"$\
      11: 　　按分布 $p$ 从 ${1, …, m}$ 中取 $beta _"act"$ 个下标，得到 $tau _"act"$\
      12: 　　从 ${1, …, m}$ 中均匀取 $beta _"unif"$ 个下标，得到 $tau _"unif"$\
      13: 　　$tau _k ← tau _"act" ∪ tau _"unif"$\
      14: 　　$i _k ← op("arg max") _[i ∈ tau _k] [tilde(a) _i^top omega _k - tilde(b) _i] _+$\
      15: 　　*if* $tilde(a) _(i_k)^top omega _k > tilde(b) _(i_k)$ *then*\
      16: 　　　　$omega _(k+1) = omega _k - alpha frac(tilde(a) _(i_k)^top omega _k - tilde(b) _(i_k), norm(tilde(a) _(i_k)) _2^2) tilde(a) _(i_k)$，$alpha ∈ (0, 2)$\
      17: 　　*else*\
      18: 　　　　$omega _(k+1) ← omega _k$\
      19: 　　*end if*\
      20: *end for*\
      21: $x _K ← x _"eq" + N omega _K$\
      22: *return* $x _K$
    ]
  },
  caption: [所提 AT-SKM-Net 框架的伪代码。],
) <alg-a-flow>

== A.2　基于有效集预测的加速采样

以下补全正文第 4.2 节两条定理的完整证明。

#thm("定理 1")[（全局收敛性与稳健性）　只要混合比例满足 $rho < 1$，所提算法就保持向可行集 $calP$ 的期望全局线性收敛。]

#proof[
  AT-SKM 在零空间系数 $omega$ 上迭代。记零空间表示下的可行集为 $Omega = { omega in bb(R)^r | tilde(A) omega <= tilde(b) }$，其中 $tilde(A) = A N$、$tilde(b) = b - A x _"eq"$。设 $omega^*$ 为当前迭代点 $omega _k$ 在 $Omega$ 上的投影，并定义误差向量 $e _k = omega _k - omega^*$。

  考察第 $k$ 次迭代。令
  $ g _j(omega _k) = frac([tilde(a) _j^top omega _k - tilde(b) _j] _+^2, norm(tilde(a) _j)^2) = [tilde(a) _j^top omega _k - tilde(b) _j] _+^2 $
  为行归一化后第 $j$ 条约束的平方归一化违背量。算法按贪心准则从采样批 $calS _k$ 中选出有效约束下标 $i _k$：

  #eqn("(13)")[
    $ i _k = op("arg max") _[j ∈ calS _k] g _j(omega _k). $
  ]

  步长 $alpha ∈ (0, 2)$ 的标准 Kaczmarz 更新给出如下的误差收缩递推 @de2017sampling：

  #eqn("(14)")[
    $ norm(e _(k+1))^2 <= norm(e _k)^2 - alpha (2 - alpha) g _(i_k)(omega _k). $
  ]

  混合采样保证批 $calS _k$ 中含一个规模为 $beta _"unif" >= 1$ 的子集 $tau _"unif"$，它是在全部 $m$ 条约束上均匀采得的，而 $rho < 1$ 正是这一规模的保证。整批中的最大违背量不小于均匀子集内的最大违背量，后者又不小于该子集上的平均违背量：

  #eqn("(15)")[
    $ g _(i_k)(omega _k) = op("max") _[j ∈ calS _k] g _j(omega _k) >= op("max") _[j ∈ tau _"unif"] g _j(omega _k) >= frac(1, beta _"unif") sum _[j ∈ tau _"unif"] g _j(omega _k). $
  ]

  再对批的随机采样取期望。$tau _"unif"$ 是在 ${1, …, m}$ 上均匀采出的，故任一给定约束 $l$ 落入其中的概率为 $beta _"unif" / m$，由期望的线性性：

  #eqn("(16)")[
    $ bb(E)[g _(i_k)(omega _k)] &>= bb(E)[ frac(1, beta _"unif") sum _[j ∈ tau _"unif"] g _j(omega _k) ] \
      &= frac(1, beta _"unif") sum _(l=1)^m frac(beta _"unif", m) g _l(omega _k) \
      &= frac(1, m) sum _(l=1)^m g _l(omega _k). $
  ]

  上式右端的求和项正是残差向量的平方范数 $norm([tilde(A) omega _k - tilde(b)] _+)^2$。由全局 Hoffman 误差界定理，存在常数 $calH(tilde(A))$ 使得

  #eqn("(17)")[
    $ sum _(l=1)^m g _l(omega _k) = norm([tilde(A) omega _k - tilde(b)] _+)^2 >= frac(1, calH^2(tilde(A))) norm(e _k)^2. $
  ]

  把它代回误差递推的期望：

  #eqn("(18)")[
    $ bb(E)[norm(e _(k+1))^2] <= (1 - frac(alpha (2 - alpha), m calH^2(tilde(A)))) norm(e _k)^2 = (1 - frac(1, m calH^2(tilde(A)))) norm(e _k)^2. $
  ]

  取 $alpha = 1 ∈ (0, 2)$，并注意到 $calH(tilde(A)) < oo$，算法便在期望意义下线性收敛。
]

#thm("定理 2")[
  （降维带来的效率增益）考虑假设 1 所述局部线性区间内的迭代点，并设各行已归一化。把在 ${1, …, m}$ 上的均匀采样与在预测集 $hat(calA)$ 上的均匀采样相对照，在假设 2 之下，单步期望误差收缩速率分别为：

  #par(first-line-indent: 0em)[*标准 SKM（在 $m$ 上均匀采样）：*]

  $ bb(E)[norm(e _(k+1))^2] <= (1 - frac(1, m calH^2(A))) norm(e _k)^2 $

  #par(first-line-indent: 0em)[*加速 SKM（在 $hat(calA)$ 上均匀采样）：*]

  $ bb(E)[norm(e _(k+1))^2] <= (1 - frac(sigma _"min"^2(A _[calA^*]), | hat(calA) |)) norm(e _k)^2 $

  其中 $calH(A)$ 为全局 Hoffman 常数，$sigma _"min"(A _[calA^*])$ 表示真实有效子矩阵的最小非零奇异值。
]

#proof[
  记 $e _k = x _k - x^*$。在行归一化条件下，带铰链损失的 Kaczmarz 更新给出 $norm(e _(k+1))^2 = norm(e _k)^2 - [a _i^top x _k - b _i] _+^2$。对采到的下标 $i$ 取期望：

  #eqn("(19)")[
    $ bb(E)[norm(e _(k+1))^2] = norm(e _k)^2 - sum _[i ∈ calS] p _i [a _i^top x _k - b _i] _+^2. $
  ]

  对*标准 SKM*，$calS = {1, …, m}$ 且 $p _i = 1 / m$。把全局 Hoffman 界用在残差向量 $[A x _k - b] _+$ 上，便有 $frac(1, m) norm([A x _k - b] _+)^2 >= frac(1, m calH^2(A)) norm(e _k)^2$ @levenStandardSKM。

  对*加速 SKM*，$calS = hat(calA)$ 且 $p _i = 1 / | hat(calA) |$。关键在于：在假设 1 之下，任一非有效约束 $i ∉ calA^*$ 都满足 $a _i^top x _k < b _i$，从而 $[a _i^top x _k - b _i] _+ = 0$。于是求和里非有效约束的贡献全部消失，只留下真实有效集 $calA^*$ 的部分；而对 $i ∈ calA^*$，由 $a _i^top x^* = b _i$，该项化为 $[a _i^top x _k - b _i] _+^2 = norm(a _i^top e _k)^2$：

  #eqn("(20)")[
    $ sum _[i ∈ hat(calA)] frac(1, | hat(calA) |) [a _i^top x _k - b _i] _+^2 &= frac(1, | hat(calA) |) sum _[i ∈ calA^*] norm(a _i^top e _k)^2 \
      &= frac(1, | hat(calA) |) norm(A _[calA^*] e _k)^2. $
  ]

  最后套用谱界 $norm(A _[calA^*] e _k)^2 >= sigma _"min"^2(A _[calA^*]) norm(e _k)^2$，即得加速后的收敛速率。
]
