// 附录 D（D.1–D.4）：N-1 安全约束直流最优潮流的实验设置与附加结果
// 来源 Main.tex 889–1017 行。编号公式 (33)–(38)；表 <tab-d11>；四联图 <fig-d1-sens>。
// 注意：Typst 0.15 的 #include 在被包含文件自身的作用域里求值，外层 #import 的宏不会透进来，
//   故本片段需自行导入 macros（重复导入无副作用，外层校具的 set/show 仍然生效）。

#import "macros.typ": *

// 编号一律由 #eqn 助手硬编码给出，关掉 Typst 的公式自动编号，否则会出现 "(4) ((33))" 双编号。
#set math.equation(numbering: none)

= 附录 D　N-1 安全约束直流最优潮流的实验设置与附加结果

== D.1　N-1 安全约束直流最优潮流的数学建模

N-1 安全约束直流最优潮流问题要确定最优的机组出力分配，使总运行成本最小，同时保证系统在正常运行方式和任一单条线路断开后都保持可行。记 $cal(K)$ 为所考虑的全部场景集合，其中 $k = 0$ 表示基础运行方式，其余每个 $k ∈ cal(K)$ 各对应一条具体的线路断开故障场景。在给定场景 $k$ 下网络拓扑随之改变：用 $cal(L)^((k))$ 表示该拓扑下仍在运行的线路集合，用 $cal(N)^((k))(i)$ 表示该拓扑下节点 $i$ 的相邻节点集合。优化问题表述如下：

#eqn("(33)")[
  #set text(size: 9pt)
  $
    min _(bold(P) _cal(G), bold(delta)) & sum _(i ∈ cal(G)) (1/2 c_i P _"G,i"^2 + b_i P _"G,i") \
    "s.t." & P _"G,i" - P _"D,i" = sum _(j ∈ cal(N) ^((k))(i)) B _"ij" (delta _i ^((k)) - delta _j ^((k))), quad forall i ∈ cal(B), forall k ∈ {0 } ∪ cal(K) \
    & P _"G,i"^"min" <= P _"G,i" <= P _"G,i"^"max", quad forall i ∈ cal(G) \
    & -P _"ij"^"max" <= B _"ij" (delta _i ^((k)) - delta _j ^((k))) <= P _"ij"^"max", quad forall (i, j) ∈ cal(L) ^((k)), forall k ∈ {0 } ∪ cal(K) \
  $
]

其中集合 $cal(B)$、$cal(G) ⊆ cal(B)$ 与 $cal(L)$ 依次表示节点、机组与输电线路。决策变量由各机组的有功出力 $bold(P) _cal(G) = {P _"G,i"} _(i ∈ cal(G))$ 和每个场景下的电压相角 $bold(delta) ^((k)) = {delta _i ^((k))} _(i ∈ cal(B))$ 组成。需要强调的是：出力分配 $P_G$ 是预防性的、在所有场景之间共用，而系统状态 $delta ^((k))$ 则随各自拓扑分别调整。目标函数里，$c_i$ 与 $b_i$ 分别是机组 $i$ 的二次与线性成本系数；$P _"D,i"$ 表示节点 $i$ 的有功负荷；$B _"ij"$ 为线路电纳，取正值 $1 / X _"ij"$。对非机组节点 $i ∈ cal(B) ∖ cal(G)$，令 $P _"G,i" = 0$。$P _"G,i"^"min/max"$ 与 $P _"ij"^"max"$ 分别给出机组容量限值与线路热稳定限值。

== D.2　N-1 故障场景数据集的生成

为检验所提方法的有效性，我们以 IEEE 57、118 与 300 节点系统作为实验基准。构建 N-1 故障场景数据集时，先对所有可能的单线断开场景做筛选，只保留物理上可行的场景：这里可行是指故障后拓扑保持连通、没有形成孤岛，且 OPF 求解器能收敛到可行解。@tab-d11 汇总了各测试系统的统计信息，包括节点数、支路总数，以及筛选后连同基础场景一并计入的有效 N-1 场景数。

对每个选定的拓扑场景，我们通过对节点负荷施加随机扰动，生成 100 个相互独立的运行实例。具体做法是把基准负荷向量整体随机缩放：

#eqn("(34)")[
  $ P_D ^((i)) = alpha_i dot P_D ^"base", quad alpha_i ∼ cal(U)(0.8, 1.2), $
]

其中 $P_D^"base"$ 为基准负荷值，$alpha_i$ 是取自区间 $[0.8, 1.2]$ 上均匀分布的随机缩放系数。这一生成流程使数据集覆盖了足够宽的负荷波动范围。

关于数据集划分：为考察模型对未见故障场景的泛化能力，我们把全部有效 N-1 场景随机分成两个子集，70% 作为训练阶段的已见场景，其余 30% 作为未见场景。训练集只包含由已见场景生成的样本，测试集则同时覆盖已见与未见拓扑上的实例。

#figure(
  supplement: [表],
  {
    set text(size: 9pt)
    table(
      columns: (3.2cm, 2.0cm, 2.0cm, 2.2cm, 2.0cm, 1.8cm, 1.8cm),
      align: (left, center, center, center, center, center, center),
      inset: (x: 4pt, y: 4pt),
      table.header[测试系统][节点数][支路数][可移除支路][场景数][$beta$][$rho$],
      [IEEE 57 节点], [57], [80], [79], [80], [10], [0.8],
      [IEEE 118 节点], [118], [186], [177], [178], [50], [0.8],
      [IEEE 300 节点], [300], [411], [322], [323], [60], [0.8],
    )
  },
  caption: [N-1 故障场景数据集与 SKM 采样的超参数设置。],
) <tab-d11>

== D.3　实验超参数与损失函数配置

模型结构与训练配置方面，采用的异构图神经网络（HGNN）含两层消息传递层，隐藏维度统一设为 128。训练用 Adam 优化器，初始学习率为 5e-4，并施加 StepLR 调度器实现阶梯衰减：

#eqn("(35)")[
  $ eta _t = eta _0 dot gamma ^(floor(t / S)), $
]

其中 $eta _0$ 为初始学习率，$S = 25$ 为步长，$gamma = 0.8$ 为衰减系数。训练阶段的批大小为 64；测试阶段的批大小为 1，以模拟对单个样本做实时推断的真实场景。

复合损失函数由回归损失与分类损失两部分构成。沿用 T-SKM 的做法 @t-skm ，回归损失取均方误差（MSE），并按投影前与投影后两项加权求和：

#eqn("(36)")[
  $ L_"reg" = 0.9 dot op("MSE")(hat(bold(y)) _"pre", bold(y)) + 0.1 dot op("MSE")(hat(bold(y)) _"proj", bold(y)), $
]

这里 $hat(bold(y)) _"pre"$ 是模型的原始输出，$hat(bold(y)) _"proj"$ 是约束投影之后的输出。二者组合让模型先学到主要的特征映射，同时促使输出满足物理约束。

有效集预测任务用 Binary Focal Loss 来处理正负样本不均衡的问题 @lin2017focal ：

#eqn("(37)")[
  $ L_"focal"(p_t) = -alpha_t (1 - p_t)^gamma log(p_t), $
]

其中 $p_t$ 是模型对真实类别的估计概率。聚焦参数 $gamma = 2.0$ 下调容易分类样本的权重，平衡参数 $alpha = 0.5$ 则调节正负样本的相对重要性。总损失函数为：

#eqn("(38)")[
  $ L_"total" = L_"reg" + lambda(t) dot L_"cls". $
]

其中 $lambda(t)$ 采用线性 warmup 调度，在前 40 个训练轮次内由 0 线性增大到 1。这样，模型在训练初期专注于回归任务，分类目标随后才逐步纳入优化。

有效集标签按相对松弛量判据生成。对双边不等式 $l_i <= g_i(x) <= u_i$，若某约束到任一边界的松弛量小于可行区间 $u_i - l_i$ 的 1%，就把该约束标记为有效。该阈值只用于训练有效集预测器。每次迭代采样的约束数目约为约束总数的 10%。各测试系统下采样批规模 $beta$ 与混合采样比例 $rho$ 的具体配置见 @tab-d11。

== D.4　混合采样策略的超参数敏感性

为考察所提有效集预测方法对批规模参数的敏感性，我们用真值数据做了一组受控实验。这一设置假定预测器是完美的：直接取最优解对应的真实有效集来引导采样过程。我们在 IEEE 118 节点系统上比较了均匀采样与真值引导的混合采样在不同采样比例下的收敛表现。

#figure(
  {
    set par(first-line-indent: 0em, spacing: 0.2em)
    grid(
      columns: 1,
      gutter: 0.8em,
      align: center,
      block[
        #image("fig/tskm_active_sampling_mean_bus118.pdf", width: 14cm)\
        #text(size: 8.5pt)[（a）IEEE 118 节点：平均迭代次数]
      ],
      block[
        #image("fig/tskm_active_sampling_max_bus118.pdf", width: 14cm)\
        #text(size: 8.5pt)[（b）IEEE 118 节点：最大迭代次数]
      ],
    )
  },
  caption: [在具备完美预测器的条件下，IEEE 118 节点系统上采样策略的敏感性分析：均匀采样与真值引导的混合采样在不同采样比例下的对照。],
) <fig-d1-sens-118>

#figure(
  {
    set par(first-line-indent: 0em, spacing: 0.2em)
    grid(
      columns: 1,
      gutter: 0.8em,
      align: center,
      block[
        #image("fig/tskm_active_sampling_mean_bus300.pdf", width: 14cm)\
        #text(size: 8.5pt)[（a）IEEE 300 节点：平均迭代次数]
      ],
      block[
        #image("fig/tskm_active_sampling_max_bus300.pdf", width: 14cm)\
        #text(size: 8.5pt)[（b）IEEE 300 节点：最大迭代次数]
      ],
    )
  },
  caption: [IEEE 300 节点系统上的同一组对照实验，条件与 @fig-d1-sens-118 相同。],
) <fig-d1-sens-300>

两幅图给出敏感性分析的结果，其中 SKM 迭代过程以 HGNN 预测出的解作为初值。

@fig-d1-sens-118 显示，IEEE 118 节点系统上只要有效集识别准确，混合采样就十分稳定：无论额外随机采样占多大比例，平均与最大迭代次数都压在很低的水平。真实有效约束一旦被覆盖，算法便基本不受海量非有效约束的干扰。

在规模更大的 IEEE 300 节点系统（@fig-d1-sens-300）上，混合策略相对均匀采样的收敛加速要陡峭得多。只需掺入极少量的随机采样，迭代次数就能迅速降到最优水平。其中最大迭代次数那一幅（子图 b）尤其说明问题：混合策略有效压住了最坏情形，达到同等表现所需的采样量只有均匀采样方案的约十分之一，而后者需要扫描整个约束集。
