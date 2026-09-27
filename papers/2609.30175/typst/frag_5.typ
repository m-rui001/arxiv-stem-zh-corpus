// frag_5：图 3 + 表 I + §III B 色 Gray 码动力学解耦（CGDD）开头（tex L524–599，含式 (20)）

#import "macros.typ": *

#fig(
  "3",
  [$C=3$ 时的色指定、二进制矩阵 $B_3$ 与 CBDD 脉冲序列示意，色到行映射取恒等映射 $i=g(c)=c$。],
  sigmatrix((
    (col-gray, "++++++++", "IIIIIIII"),
    (col-red, "++++----", "IIIXIIIX"),
    (col-green, "++--++--", "IXIXIXIX"),
    (col-blue, "+-+-+-+-", "XXXXXXXX"),
  )),
)

为了把式 (16) 中 $C=3$ 的示例符号矩阵化成图 1 所示活性嵌入式 3-着色对应的脉冲序列，我们取
$i=g(c)=c$，并把不计入 $C$ 种颜色的旁观灰色量子比特指派到常数行 $i=0$。最上一行全为 $+$，
故灰色量子比特在整个序列期间不受任何脉冲，在 $N=2^C=8$ 个时间步内保持空闲，其日程为
#seq("IIIIIIII")。行 $i=1$ 仅在时间步 $j=3,7$ 处使第 $j$ 列与第 $(j+1) "(mod)" N$ 列之间的符号
翻转，因此红色量子比特（$c=1$）按 #seq("IIIXIIIX") 执行。行 $i=2$ 在时间步 $j=1,3,5,7$ 处变号，
故绿色量子比特（$c=2$）按 #seq("IXIXIXIX") 执行；而行 $i=3$ 在每个时间步都变号，故蓝色量子比特
（$c=3$）按 #seq("XXXXXXXX") 执行。

#block(width: 100%, above: 1.1em, below: 0.5em)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold")[表 I　]CWDD（在固定 Hadamard 列序下对脉冲数作行优化的线性深度 CHaDD，
  见第 III C 节）、CBDD 与 CGDD 每轮脉冲数 $P$、电路深度 $N$ 与脉冲重复率（PRR）$P / (N C)$ 汇总。
]

#block(width: 100%)[
  #set par(first-line-indent: 0em)
  #set text(size: 9pt)
  #table(
    columns: (auto, auto, 1fr, auto),
    align: center + horizon,
    inset: (x: 6pt, y: 4pt),
    [DD 序列], [$P$], [$N$], [PRR（$P / (N C)$）],
    [CWDD],
    [$frac(C (C + 1), 2) + ceil(frac(C, 2))$],
    [$N = 2^{floor(log_2 C) + 1} in O(C)$，$C < N <= 2C$],
    [$frac(1, 4) + frac(1, 2 C) <= #PRR < frac(1, 2) + frac(7, 6 C)$],
    [CBDD],
    [$2^{C+1} - 2$],
    [$N = 2^C$],
    [$frac(2^{C+1} - 2, C 2^C) < frac(2, C)$],
    [CGDD],
    [$2^C$],
    [$N = 2^C$],
    [$1/C$],
  )
]

== B. 色 Gray 码动力学解耦（CGDD）

当 $C>=2$ 时，我们可以重排二进制矩阵的列，使相邻列之间的符号翻转次数最少，从而在与 CBDD
相同的电路深度下得到相同的一阶平均，却用更少的脉冲。反射二进制码（Gray 码）置换恰好做到了
这一点。事实上，$2^C$ 个互不相同的列不论按哪种循环次序排列，每对相邻列之间都至少出现一次
符号翻转，故任何此类重排均有 $P >= 2^C$；而相邻 Gray 码字恰好在一位上不同，Gray 次序正好达到
这一下界。因此，在一个周期内恰好遍历整个控制群一次的序列之中，CGDD 的脉冲数最少。在同样的
深度下，遍历元素可重复的更小控制群的序列还能进一步压低脉冲数（例如，取 $W_4$ 中序列度最低的
四条非常数行，在 $C=4$ 时有 $P=12<16$）；图 8(a) 中膨胀后的 $C=3$ 序列便属于这种重复元素型。
整数 $j$ 对应的 $C$ 位 Gray 码为 $γ_C(j) = j ⊕ floor(j/2)$，其中 $floor(j/2)$ 即删去
$j$ 的最低有效位。

$(C+1) × 2^C$ 的 Gray 矩阵 $G_C$ 由二进制矩阵 $B_C$［式 (15)］按列置换
$j -> γ_C(j)$ 构造而来：

#eqn("(20)")[
  $ G_C ≡ ∑_{i=0}^{C} ∑_{j=0}^{2^C - 1} (-1)^(γ_C(j) ⋅ 2^(C-i)) |i⟩⟨j| $
]

与二进制矩阵［式 (15)］一样，第 $j$ 列在左侧补单个零，从而（如同 Hadamard 矩阵［式 (9)］）
最上一行与最左一列全为 $+$；例如，$C=3$ 时的 Gray 矩阵为
