#import "macros.typ": *

== C. 色 Walsh 动力学解耦（CWDD）

在 Hadamard 列次序保持不变的前提下，线性深度 CHaDD 序列的 PRR 取决于把哪些 Hadamard 行分配给哪种颜色。Walsh 矩阵是 Hadamard 矩阵的一个行置换，各行按序列度（sequency）$s$ 排列；所谓序列度，指相邻列之间的符号变化次数，首尾回环处的那一次不计在内。Walsh 矩阵第 $s$ 行的序列度恰为 $s$，且一律以 $+1$ 开头，因此末位符号与首位符号不同，当且仅当 $s$ 为奇数。把回环处的符号变化也算作一次翻转，该行在一个周期内的脉冲数便是
#eqn("(23)")[ $ P_s = s + (s "(mod)" 2) $ ]
由此可见，在这一固定列次序下的全部行分配中，欲使总脉冲数最少，只需取序列度最低的 $C$ 个非恒定 Walsh 行，即 $s = 1, dots.c, C$。相应的 Hadamard 行指标为 $g^*(c) = R_nu [gamma_nu (c)]$，$c = 1, dots.c, C$，其中 $gamma_nu$ 是 $nu$ 位 Gray 映射，$R_nu$ 是 $nu$ 位上的比特反转。我们把这一行分配经过优化的调度称为色 Walsh 动力学解耦（CWDD）。Walsh 调制此前已被用于构造并分析单量子比特 DD 与误差抑制控制序列@Hayes:2011aa, @Ball:2015aa, @Qi:2017aa。当 $C = 2^nu - 1$ 时（例如 $C = 3$），任何双射都会用尽全部 $N - 1$ 个非恒定行，因此总脉冲数——进而是 PRR——与行分配无关，差别只落在各色的脉冲数上。

CWDD 的总脉冲数为
#eqn("(24)")[ $ P = sum_(c=1)^C [ c + (c "(mod)" 2) ] = C(C+1)/2 + ceil(C/2) $ ]
从而
#eqn("(25)")[ $ C/2 + 1 <= P/C = (C+1)/2 + 1/C ceil(C/2) <= C/2 + 7/6 $ ]
其中用到 $C >= 2$ 时的 $1/2 <= C^(-1) ceil(C/2) <= 2/3$；至于 $C = 1$，相应的 PRR 为 $1$，直接满足下文各式的界。再借助 $C < N <= 2C$，CWDD 的 PRR 满足
#eqn("(26)")[ $ 1/4 + 1/(2C) <= #PRR < 1/2 + 7/(6C) $ ]
且左端取等当且仅当 $C >= 2$ 是 $2$ 的幂（此时 $N = 2C$，且 $ceil(C/2) = C/2$）。这正是定理 1 中给出的 PRR 界。这些界仅针对上述固定列次序优化了行分配；若允许任意置换各列，则属于另一个调度问题。

CWDD、CBDD 与 CGDD 的脉冲数 $P$、电路深度 $N$ 和 PRR 汇总于表 I，并在图 5 中画出。

#fig("6", [
  嵌入的 $C = 3$ 色 DD 序列的时间轴示意，脉冲宽度 $delta = 60 space("ns")$，时间间隔 $tau = 2 delta = 120 space("ns")$。$tau$ 的整数倍处标有灰色竖直虚线，线的上方注明它标记的是哪个时间步 $j = 0, 1, dots.c, N - 1$ 的结束。左列自上而下：XX——RGB 量子比特上的纯 $X$ DD 序列，灰色量子比特保持空闲；CHaDD、CBDD 与 CGDD。右列自上而下：UR4、CHaDD-R、CBDD-R、CGDD-R，即左列诸序列对应的鲁棒版本——在每四个 $X$ 脉冲组成的一块之中，把第二个和第三个换成 $overline(X)$ 脉冲，也就是相位相反的 $pi$ 脉冲；由此得到的四脉冲块 $X overline(X) overline(X) X$ 正是通用鲁棒序列 UR4@Genov2017。当某种颜色每轮只有两个脉冲时（CHaDD 与 CGDD 中的红色和绿色，以及 CBDD 中的红色），需要把序列重复一轮，才能使每种颜色的脉冲数都成为 $4$ 的倍数；此时鲁棒色序列的深度即为非鲁棒版本的两倍。
], block(breakable: false, grid(
  columns: 2,
  column-gutter: 6pt,
  row-gutter: 4pt,
  align: center,
  image("figs/bivalent-3coloring_XX_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_UR4_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_single-axis-chadd_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_robust-single-axis-chadd_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_chromatic-binary_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_robust-chromatic-binary_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_chromatic-gray_pulse_train.pdf", width: 75%),
  image("figs/bivalent-3coloring_robust-chromatic-gray_pulse_train.pdf", width: 75%),
)))
