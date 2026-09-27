// frag_9：tex 第 913–1058 行
// §V 结论与展望（913）+ 致谢（933）+ 数据可用性（938）+ 附录 A CHaDD 定理的证明（945–1058）
// 附录公式 (A1)–(A9)：其中 (A2)(A3)(A4) 各拆子行 (A2a)(A2b)、(A3a)(A3b)、(A4a)(A4b)(A4c)。
// 注：Typst 的 #include 是独立作用域，被包含文件看不到 main.typ 的 #import，
// 故此处必须自带 import（与 CONVENTIONS §2 的说明不同，重复 import 无副作用；frag_1/2/3 同此）。
#import "macros.typ": *

= V. 结论与展望

综上所述，我们提出了 CBDD 与 CGDD——CHaDD 在 $C > 2$ 时深度非最小的两个特例；在脉冲非鲁棒的实验中，它们在短时间尺度上比 CHaDD 更好地保持了初态。数据支持这样的解释：所观测到的性能差异主要源于累积的相干脉冲误差。我们证明了 CHaDD、CBDD 与 CGDD 的一阶解耦性质、电路深度与脉冲重复率（定理 1、定理 2、定理 3），并厘清了三者控制群之间的关系。一旦相干脉冲误差被压制，它们的鲁棒变体便表现相近，这正与三者共享同一一阶平均哈密顿量相符。

尽管 CBDD 与 CGDD 的电路深度随 $C$ 指数增长而非线性增长，只要更长的序列仍装得下可用的空闲区间，它们更低的 PRR 就使自己在非鲁棒实现中更可取。就本文报告的实验而言，鲁棒变体的整体表现优于对应的非鲁棒版本。而且，在鲁棒设定下 CHaDD、CBDD 与 CGDD 表现相当，此时 PRR 最低的序列因最省资源而更受青睐；以此为准，鲁棒的 CGDD 序列成为其中的最佳者。

鲁棒色序列仍缺一个正式的鲁棒性证明：把每四个脉冲一组中的第二个与第三个 $X$ 脉冲换成 $overline(X)$ 脉冲，是从单量子比特 $"UR"_n$（$n = 4$）序列@Genov2017 借来的一种拟设（ansatz）；至于任意偶数序列长度 $n$ 的误差标度，最近已得到证明@dalessandro2026prooferrorscalinguniversally。图 8 中各鲁棒序列之间的差异，与 RGB 集合近邻量子比特上的 PRR 相关联，这与该拟设并不能补偿对这些近邻量子比特施加脉冲所造成的影响相一致。

在弱耦合区，高阶色序列是存在的：文献 @Kim2026highorder 证明，对任何一个能把系统-热库相互作用平均为零的群 $cal(G)$，至多 $(|cal(G)| - 1) p$ 个取自非均匀间隔的多量子比特脉冲事件，就足以消去所有关于耦合强度线性、且关于总演化时间直至 $p$ 阶的误差项，并把这一结果用到了 CHaDD 上。该上界统计的是脉冲事件，每个事件可以同时给若干种颜色施加脉冲；而 PRR 统计的是每个量子比特在固定时间步 $tau$ 上所承受的脉冲，因此脉冲事件的数目并不能决定 PRR。

自然的下一步包括：把高阶消去与低 PRR、鲁棒脉冲结合起来；考察多轴色序列；由其他构造——例如级联拼接@Khodjasteh:2005xu 或嵌套 Uhrig 序列@Wang:10, @Xia:2011uq——得到高阶色序列；在更大的 $C$ 以及其他 QPU 上开展实验；以及厘清本文所用的符号矩阵条件与文献 @Nguyen2026color 中基于编码的构造之间的联系。我们预期，只要占主导的是相干脉冲误差而非高阶解耦误差，PRR 就仍是恰当的品质因子。

= 致谢

本工作得到（或部分得到）美国陆军研究实验室与美国陆军研究办公室第 W911NF2310255 号合同/资助的支持。本研究得到国家情报总监办公室（ODNI）、情报高级研究计划活动（IARPA）与陆军研究办公室的支持，属于「纠缠逻辑量子比特」（Entangled Logical Qubits）项目，合作协议编号 W911NF-23-2-0216。同时感谢海军研究办公室第 N00014-26-1-2092 号资助。

= 数据可用性

本文的数据以及复现各图所需的 notebook 已在线公开@brown2026cgdddatarepo。

= 附录 A：CHaDD 定理的证明

该证明与文献 @brown2024efficient 给出的证明本质上相同。

#proof[
  以下证明定理 1。设 $G = (V, E)$ 是表示待解耦的 2-定域哈密顿量 $H_(G)$ 的图，$f$ 为 $G$ 的一个正常 $C$-着色；这里的 $E$ 包含式 (3c) 中的每一处耦合，无论有意与否，因而该着色对所有这些耦合都是正常的。第 II B 节按颜色分拆的写法中略去不写的热库算符，与只作用于系统的控制幺正对易，因而在下面的一阶平均过程中原样保留。

  在自由演化区间等长、且 $X$ 脉冲为瞬时脉冲的条件下，第 $j$ 个翻转框架区间传播子为
  #eqn("(A1)")[ $ cal(F)_j equiv U_j^dagger f_tau U_j = exp(-i tau U_j^dagger H_(G) U_j) $ ]
  其中 $U_j$ 由式 (11) 定义。

  一体项 $sigma_v^alpha$ 在 $f(v) = c$ 且 $alpha != x$ 时与 $tilde(X)_c$ 反对易，于是它被 $U_j$ 共轭为
  #eqn("(A2a)")[ $ tilde(X)_c^dagger sigma_v^alpha tilde(X)_c = (-1)^(delta_(c, f(v)) (1 - delta_(alpha x))) sigma_v^alpha $ ]
  #eqn("(A2b)")[ $ U_j^dagger sigma_v^alpha U_j = (-1)^((g (f(v)) dot j) (1 - delta_(alpha x))) sigma_v^alpha $ ]
  从而一体哈密顿量 $H_1$（式 (3b)）被 $U_j$ 共轭为
  #eqn("(A3a)")[ $ U_j^dagger H_1 U_j = sum_alpha sum_(c=1)^C (-1)^((g(c) dot j) (1 - delta_(alpha x))) sum_(v in V_c) sigma_v^alpha $ ]
  #eqn("(A3b)")[ $ = H_1^x + sum_(alpha != x) sum_(c=1)^C (-1)^(g(c) dot j) sum_(v in V_c) sigma_v^alpha $ ]
  对时间步 $j = 0, dots.h, N - 1$ 作平均，即得解耦平均后的一体哈密顿量
  #eqn("(A4a)")[ $ overline(H)_1 = 1/N sum_(j=0)^(N-1) U_j^dagger H_1 U_j $ ]
  #eqn("(A4b)")[ $ = H_1^x + sum_(alpha != x) sum_(c=1)^C 1/N sum_(j=0)^(N-1) (-1)^(g(c) dot j) sum_(v in V_c) sigma_v^alpha $ ]
  #eqn("(A4c)")[ $ = H_1^x $ ]
  经一阶平均后仍能存留的一体项只有 $H_1^x$。其余满足 $f(v) = c$、$alpha != x$ 的 $sigma_v^alpha$ 项都受 $(-1)^(g(c) dot j)$ 调制；由于 $g(c) != 0$，这一因子对 $j$ 求和为零。

  二体项 $sigma_u^alpha sigma_v^beta$（其中 $f(u) = c_1 != c_2 = f(v)$）被 $U_j$ 共轭为
  #eqn("(A5)")[ $ U_j^dagger sigma_u^alpha sigma_v^beta U_j = (-1)^((g(c_1) dot j) (1 - delta_(alpha x))) (-1)^((g(c_2) dot j) (1 - delta_(beta x))) sigma_u^alpha sigma_v^beta $ ]
  于是 $sigma_u^x sigma_v^x$ 与每一个 $U_j$ 对易；当 $alpha != x$ 时，$sigma_u^alpha sigma_v^x$ 受 $(-1)^(g(c_1) dot j)$ 调制；当 $beta != x$ 时，$sigma_u^x sigma_v^beta$ 受 $(-1)^(g(c_2) dot j)$ 调制；而当 $alpha, beta != x$ 时，$sigma_u^alpha sigma_v^beta$ 受 $(-1)^(g(c_1) dot j) (-1)^(g(c_2) dot j)$ 调制。由于 $g$ 是单射，$c_1 != c_2$ 必有 $g(c_1) != g(c_2)$，相应的 Hadamard 行因而互不相同且彼此正交：
  #eqn("(A6)")[ $ 1/N sum_(j=0)^(N-1) (-1)^(g(c_1) dot j) (-1)^(g(c_2) dot j) = 0 $ ]
  由此可见，除 $sigma_u^x sigma_v^x$ 之外的二体项全被平均掉，故解耦平均后的二体哈密顿量为 $overline(H)_2 = H_2^(x x)$，且
  #eqn("(A7)")[ $ overline(H)_G = overline(H)_1 + overline(H)_2 = H_1^x + H_2^(x x) $ ]

  令 $T = N tau$。Baker-Campbell-Hausdorff 展开把这一平均哈密顿量与实际的周期传播子联系起来：
  #eqn("(A8)")[ $ cal(F)_(N-1) dots.c cal(F)_0 &= exp(-i T overline(H)_G) + O(T^2 |H_G|^2) \ &= exp(-i T (H_1^x + H_2^(x x))) + O(T^2 |H_G|^2) $ ]
  至此便得到关于 $tau$ 一阶的抵消结论。须注意，这是一个固定 $N$ 的估计：余项界 $O(T^2 |H_G|^2)$ 只有在周期时间 $T = N tau$ 满足 $T |H_G| << 1$ 时才足够小，而对 CBDD 与 CGDD 来说，$N$ 随 $C$ 指数增长，这一条件也将随之愈发严苛。此外，
  #eqn("(A9)")[ $ C < N = 2^nu = 2^(floor(log_2 C) + 1) <= 2C $ ]
  电路深度的上界由此得证。

  最后验证 PRR 的界。由式 (24)，第 III C 节的行指派 $g^*$ 使每轮重复的总脉冲数 $P = C (C + 1) / 2 + ceil(C / 2)$ 取到最小；再结合 $C < N <= 2C$，即得式 (26)。
]
