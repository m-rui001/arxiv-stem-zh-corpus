// 毫米级复杂调制集成 Bragg 光栅的高效仿真：层级局部周期本征模展开
// arXiv:2609.30224 [physics.optics] 中文译本（Typst 0.15.1；源为 opticajnl 模板的 Manuscript.tex）
//
// 图片处理：
//   图 1（HLP-EME 工作原理）是纯矢量示意图，按流水线 §0 用 CeTZ 重画（fig/principle.typ）；
//   原矢量图留存为 fig/principle_orig.pdf 以备核对。
//   图 2–4、6 与附图 S1–S3 为数据图，保留原图仅译图注。
//   图 5、图 7 原图为 JPG 位图，其中器件示意分板与数据分板同在一幅位图内，
//   切分必然损伤数据面板，故整幅保留（记为范围决定）。
// 原文结构：Optics Express letter 正文没有编号小节标题，译文按内容补了节题。
// 补充材料：arXiv 源包里 supplement_1.pdf 以成品 PDF 释出（00README.json 标为 ignore），
//   没有 tex。译文按 PDF 逐节人工翻译。
//   附图 S1–S3 先从该 PDF 裁出区域，但只改 CropBox 的裁法会把整页原文字层一起带进 Typst 输出
//   （Typst 重排 PDF 图片时不认注入的裁剪算子），成品里看不见却能被 pdftotext 抽出来，污染语料；
//   故最终按 400 dpi 位图裁切为 supp_figS*.png。
// 原文一处笔误：正文说 2D-FDTD 结果"见正文图 4"，而图 4 右列画的确实是 HLP-EME/实测/2D-FDTD
//   三条曲线，此处一致，未作改动。

#set document(title: "毫米级复杂调制集成 Bragg 光栅的高效仿真：层级局部周期本征模展开")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set figure(numbering: "1")

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.2em, below: 0.4em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(first-line-indent: 0em)
#show table: set par(first-line-indent: 0em)
#show figure: set block(below: 1em)

#align(center)[
  #text(size: 15pt, weight: "bold")[毫米级复杂调制集成 Bragg 光栅的高效仿真：\
    层级局部周期本征模展开]\
  #v(4pt)
  #text(size: 10pt)[
    Rui Cheng #super[1,✳]，Jia Meng #super[1]，Ping Yu #super[2]，\
    Jihao Wang #super[1]，Zikun Xie #super[1]\
    #v(3pt)
    #text(size: 8.5pt)[
      #super[1] 中国安徽合肥 230009，合肥工业大学仪器科学与光电工程学院\
      #super[2] 中国浙江宁波 315211，宁波工程学院\
      #super[✳] 通讯作者：#link("mailto:rcheng@hfut.edu.cn")[rcheng\@hfut.edu.cn]
    ]
  ]\
  #v(3pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.30224 [physics.optics]；中文译本编译于 2026-09-27]
]

#v(8pt)

#block(width: 100%, inset: (x: 1.5em, y: 1.1em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    我们提出一种结构感知的层级局部周期本征模展开（HLP-EME）框架，用来高效仿真绝缘体上硅（SOI）平台上毫米尺度、带复杂调制的集成 Bragg 光栅（IBG）。HLP-EME 把连续变化的光栅参数曲线离散成分段常数的块，再抓住由此带来的物理结构局部周期性——每个块内只算一次代表周期的 S 矩阵，之后反复复用。这一做法把毫米级 IBG 的整器件仿真时间压到几分钟量级，比常规三维时域有限差分（3D-FDTD）快三个数量级以上。同模光栅、带模式转换的多模光栅、光栅辅助反向耦合器（CDC）等多样构型都能纳入该方法。若干只复杂调制 IBG 的反射谱、以及一只代表器件的反射相位响应，实测结果都验证了模型的预测。框架进一步推广到弯曲波导，捕捉到了毫米长高斯切趾螺旋 IBG 中由弯曲引起的光谱畸变。全矢量建模配上这样的计算效率，使 HLP-EME 成为设计与优化长而复杂 IBG 光子器件的一件实用工具。
  ]
]
#v(6pt)

= 引言

绝缘体上硅平台上的集成 Bragg 光栅是硅光子学的基础器件 @Chrostowski2015。几十微米长的均匀光栅足以充当简单的反射滤波器，可许多应用要的是长得多、而且性质沿纵向变化的光栅：靠切趾压制旁瓣 @Ma2018 @Hung2024、为光信号处理与微波光子学定制复杂的幅度与相位响应 @Cheng2018 @Kaushal20、做出亚纳米带宽且不受自由光谱范围限制的滤波器 @Hung2016 @Liang2023，相互作用长度都得从几百微米拉到几毫米。用于色散补偿的啁啾光栅 @Wang2018 与基于光栅的慢光波导 @Xu2024 同样要靠毫米级长度才能累积出足够的群时延。

设计这类长而非均匀的 IBG，准确的仿真是关键。问题是 3D-FDTD、标准本征模展开（EME）这类严格的结构感知方法，在毫米尺度器件上算不动；而基于耦合模理论（CMT）加传输矩阵法（TMM）的快速解析模型又抓不住与结构相关的要紧效应 @Cheng21——几何调制对光谱的控制究竟有多有效、几何形状引入的意外折射率偏移、以及工艺容差，这些模型都给不出。碰到模式转换的多模 IBG @Qiu2016、光栅辅助 CDC @Naghdi2017、受弯曲相位畸变影响的螺旋 IBG @Ma2018 这类复杂构型，它们更是无从下手。

本文提出的结构感知建模框架基于层级局部周期本征模展开（HLP-EME），专门解决上述困难，能够快速仿真毫米级复杂调制 IBG。同模光栅、模式转换多模光栅与光栅辅助 CDC 都能直接处理，横向相移调制（LPDM）与侧壁起伏宽度调制两类切趾方案也都适用。框架还推广到了螺旋 IBG，捕捉住了弯曲导致的光谱退化。实测表明，无论若干复杂调制 IBG 的反射谱，还是一只代表器件的相位响应，模型的预测都与之相符。把全矢量建模和高计算效率合到一处，HLP-EME 让各种长而复杂的 IBG 器件的设计与优化真正可及。

= 工作原理与四级层级装配

@fig-principle 示出 HLP-EME 的工作原理。流程的起点是光栅沿纵向的连续参数曲线：耦合强度 $kappa (z)$、光栅相位 $phi _G (z)$，若是螺旋光栅还要加上局部弯曲半径 $R (z)$。这些曲线被同步离散成一串分段常数的块，每块跨 $N_p$ 个光栅周期。参数层面的离散化，落到物理结构上就是分段周期表示——块内局部参数保持不变，于是每个块都由 $N_p$ 个完全相同的光栅周期级联而成。这份局部周期性正是方法计算效率的来处。做 EME 计算时，每个代表周期还要沿传播方向再切成 $N_s$ 片 $z$ 不变的波导切片。整只器件的散射矩阵（S 矩阵）按四级层级装配。

#figure(
  include "fig/principle.typ",
  caption: [HLP-EME 框架的工作原理。"第 $i$ 块的代表周期"指该块内用于反复复用的那一个周期。]
) <fig-principle>

#par(first-line-indent: 0em)[
  *切片层。* 用有限差分本征模（FDE）求解器算出每一片的局部模式基。把相邻切片间的模式重叠（界面）S 矩阵与该片的传播相位合起来，就得到单片 S 矩阵 $S _("i,j")$，它表示第 $i$ 块代表周期里第 $j$ 片的 S 矩阵。
]
#par(first-line-indent: 0em)[
  *周期层。* 把一个光栅周期内的 $N_s$ 个单片 S 矩阵依次级联，得到第 $i$ 块的单周期 S 矩阵 $S _("period,i")$。
]
#par(first-line-indent: 0em)[
  *块层。* 一个块就是 $N_p$ 个相同周期的级联，所以每个块只需算一次局部本征模和一次单周期 S 矩阵 $S _("period,i")$；块的 S 矩阵由 $S _("period,i")$ 自级联得出
]
#set math.equation(numbering: "(1)")
$ S _("blk,i") = underbrace(S _("period,i") star S _("period,i") star dots.c star S _("period,i"), N_p " 次") = S _("period,i")^(star N_p) $ <eq-block>
#par(first-line-indent: 0em)[
  其中 $star$ 为 Redheffer 星积。复用单周期解，计算量因此大幅下降。
]
#par(first-line-indent: 0em)[
  *光栅层。* 最后把各块的 $S _("blk",i)$（$i$ 从 1 到 $N _b$）级联，得到整只 IBG 的全局 S 矩阵，反射与传输响应——幅度、相位、群时延——直接从中提取。
]

= 离散化参数的收敛性

HLP-EME 的精度与效率主要由两个离散化参数决定：块长 $L _("blk") = N_p Lambda _G$（$Lambda _G$ 为光栅周期）与 $N_s$。

我们在一只双通道方形滤波器上考察块长的收敛性，该器件由复杂调制 IBG 实现，$Lambda _G = 302$ nm。$N_p = 20$ 时的分段常数 $kappa (z)$ 与 $phi _G (z)$ 曲线见 @fig-np (a)、(b)。所需块长（等价地，所需 $N_p$）取决于光栅曲线沿纵向的变化速率，为此把原始设计曲线按不同长度因子做纵向拉伸来调节这一速率[@fig-np (c)]，$kappa (z)$ 的幅度随之等比缩放——带宽相应改变，谱形保持不变。不同 $N_p$（即不同块长）下分段近似光栅的反射谱，用基于 CMT 的 TMM 计算 @Cheng21。@fig-np (d)、(e) 给出长度因子 1.5 与 0.5 的仿真结果。以 $N_p = 1$ 为参考，光谱均方根误差（RMSE）随 $N_p$ 增大而上升[@fig-np (f)]；同一 $N_p$ 下，长度因子越小、纵向变化越剧烈，误差也越大。即便如此，$N_p = 20$——对应块长约 6 µm——在各条曲线上都稳定给出高保真结果（RMSE $< 0.02$），精度与计算量之间这个折中相当合适。

#figure(
  image("fig/np-2.pdf", width: 86%),
  caption: [(a) $N_p = 20$ 时的分段常数 $kappa (z)$ 与 $phi _G (z)$（块长约 6 µm）。(b) (a) 中放大区域的进一步放大。(c) 不同长度因子下的 $kappa (z)$ 曲线。长度因子为 (d) 1.5 与 (e) 0.5 时的仿真反射谱。(f) 以 $N_p = 1$ 为参考的光谱 RMSE 随 $N_p$ 的变化，各长度因子分别成曲线。]
) <fig-np>

接着考察 $N_s$ 的收敛性。把双通道方形滤波器的目标光栅曲线，映射到一只靠 LPDM 实现 $"TE"_0$ 到 $"TE"_1$ 模式转换的非对称多模 IBG 上 @Cheng21（参数详见补充材料）。固定 $N_p = 20$，用 HLP-EME 在不同 $N_s$ 下计算反射谱。局部模式特性由全矢量本征模求解器（Lumerical MODE）提取，HLP-EME 的公式本身则与平台无关。随着 $N_s$ 增大，HLP-EME 谱向 CMT 解析目标收敛[@fig-ns (a)]；对应的光谱 RMSE 迅速下降，到 $N_s >= 8$ 之后趋于饱和[@fig-ns (b)]，数值收敛由此确认。取块长约 6 µm、$N_s = 8$，计算开销最低而光谱保真度仍高。本文的 $Lambda _G$ 在 292–332 nm 之间（约 300 nm），除非另有说明，后续仿真一律采用 $N_p = 20$、$N_s = 8$。

#figure(
  image("fig/ns.pdf", width: 86%),
  caption: [(a) 不同 $N_s$ 下 HLP-EME 算出的 $"TE"_0$–$"TE"_1$ 反射谱，与理想 CMT 谱对照。(b) HLP-EME 结果与 CMT 解析目标之间的光谱 RMSE 随 $N_s$ 的变化。]
) <fig-ns>

= 复杂调制光栅的实验验证

为检验 HLP-EME 的预测精度，我们设计、流片并测试了多种复杂调制 IBG（器件参数、工艺与测试细节见补充材料）。先看三只实现 $"TE"_0$ 到 $"TE"_1$ 模式转换的非对称多模 IBG，切趾均由 LPDM 完成，分别是高斯切趾旁瓣抑制滤波器、单通道方形滤波器与双通道线性边缘滤波器，各自的光栅曲线画在 @fig-exp1 左列。如右列所示，HLP-EME 的仿真谱与实测符合得很好，说明它在长而高度复杂的 IBG 建模上可靠。相比之下，2D-FDTD 虽然保住了谱的整体轮廓，反射带宽却明显偏宽，这来自模式耦合强度被高估。

#figure(
  image("fig/exp1.pdf", width: 70%),
  caption: [多种复杂调制多模 IBG 的仿真与实测对照。左列为光栅参数曲线，右列为对应的归一化 $"TE"_0$–$"TE"_1$ 反射谱：(a, b) 高斯切趾光栅，(c, d) 单通道方形滤波器，(e, f) 双通道线性边缘滤波器。]
) <fig-exp1>

这三只多模 IBG 的计算成本汇总在 @tab-perf 中。用 3D-FDTD 直接仿真如此长度的器件并不现实，表中 3D-FDTD 基准时间由外推得到；仿真设置、硬件与外推细节见补充材料。相对 3D-FDTD，HLP-EME 把仿真时间从上百小时压到几分钟，加速比超过三个数量级（$> 2160 times$），也比 2D-FDTD 快上约一个数量级。更要紧的是，2D-FDTD 依赖降维近似，HLP-EME 则不做任何维度近似，走的仍是完整三维建模。

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    inset: (x: 6pt, y: 3pt),
    fill: (row, col) => if row == 0 { luma(240) },
    [*器件类型（长度以 mm 计）*], [*HLP-EME*], [*2D-FDTD*], [*3D-FDTD #super[a]*],
    [高斯（0.266）], [28 s], [4.6 min（$10 times$）], [16.8 h（$2160 times$）],
    [方形（0.516）], [1.2 min], [24 min（$20 times$）], [75.8 h（$3790 times$）],
    [边缘（1.072）], [5.9 min], [2.2 h（$22 times$）], [360 h（$3661 times$）],
  ),
  caption: [仿真时间与加速比对照。#super[a]：由于器件过长，3D-FDTD 的时间为外推值（按 $O (L^2)$ 拟合）。]
) <tab-perf>

= 推广到光栅辅助反向耦合器与相位响应

为展示方法的通用性，我们把 HLP-EME 推广到光栅辅助 CDC。仿真沿用同样的纵向切片流程，只是把切片施加在双光栅耦合体系的复合截面上[@fig-cdc (a)]。器件是一只双通道方形滤波器[@fig-cdc (b)]，切趾由 LPDM 完成。如 @fig-cdc (c) 所示，HLP-EME 仿真谱与实测吻合良好。

#figure(
  image("fig/cdc_3.jpg", width: 90%),
  caption: [(a) 切片后的光栅辅助 CDC 结构示意图。为看得清楚，起伏宽度放大五倍。(b) $kappa (z)$ 与 $phi _G (z)$ 曲线。(c) 实测与 HLP-EME 仿真的归一化反射谱对照。]
) <fig-cdc>

除了幅度谱，该方法还能严格仿真复杂 IBG 的相位响应。为此我们建模了一只带定制高斯型相位响应的方形滤波器[@fig-gau (a)]，它做在一只 LPDM 切趾的同模（$"TE"_0$ 到 $"TE"_0$）IBG 上。实测与 HLP-EME 谱的比较见 @fig-gau (b)，为便于目视对照，两条相位曲线已平移到同一基线。功率与相位都表现出很高的一致性。

#figure(
  image("fig/gau_pha-1.pdf", width: 86%),
  caption: [(a) 带高斯相位响应的 IBG 方形滤波器之 $kappa (z)$ 与 $phi _G (z)$ 曲线。(b) 实测与 HLP-EME 仿真的归一化反射功率及相位响应。]
) <fig-gau>

= 螺旋光栅中的弯曲畸变

最后用 HLP-EME 仿真一只毫米长、LPDM 高斯切趾的同模（$"TE"_0$ 到 $"TE"_0$）螺旋 IBG[@fig-spiral (a)、(c)]。连续的局部半径 $R (z)$、弯曲朝向与 $kappa (z)$ 一起离散成分段常数块[@fig-spiral (b)]；由于这些参数的纵向梯度较小，此处取 $N_p = 50$。每一片的模式由柱坐标形式的 FDE 求解器在该片局部弯曲半径下算出。实测反射谱与 HLP-EME 预测几乎重合[@fig-spiral (d)]。两者相对基于 CMT-TMM 算出的理想目标都出现同样的偏离，这源于弯曲对局部光栅参数的扰动。结果说明 HLP-EME 能准确捕捉此类畸变，为表征并预补偿弯曲导致的光谱退化给出了有效框架。

#figure(
  image("fig/spiral-7.jpg", width: 86%),
  caption: [(a) 光栅的解析螺旋路径；蓝点为分段常数块的中心。(b) 分段均匀的曲率半径与朝向曲线。(c) 制备出的螺旋 IBG 光学显微照片。(d) 实测与 HLP-EME 仿真的归一化反射谱，并给出基于 CMT-TMM 的理想目标。]
) <fig-spiral>

= 结论

我们提出的结构感知 HLP-EME 框架通用性好，能在不牺牲全矢量精度的前提下，把毫米级复杂调制 IBG 的仿真相对 3D-FDTD 加速三个数量级以上。实验在多种构型上验证了模型的预测：同模光栅、带模式转换的非对称多模光栅、光栅辅助 CDC。框架还可靠复现了毫米长切趾螺旋 IBG 中弯曲导致的光谱畸变。对长而复杂的 IBG 器件，HLP-EME 是一款高效、高保真的设计工具。后续工作将量化光栅曲线梯度与所需离散化分辨率之间的关系，用以指导变块长的自适应非均匀离散化。

#v(4pt)
#block(width: 100%, inset: (x: 1.5em, y: 0.9em), stroke: 0.5pt, radius: 2pt)[
  #set par(first-line-indent: 0em, spacing: 0.3em)
  #text(weight: "bold", size: 9pt)[资助。]#text(size: 9pt)[ 国家自然科学基金（62105089）。]\
  #text(weight: "bold", size: 9pt)[利益冲突。]#text(size: 9pt)[ 作者声明不存在利益冲突。]\
  #text(weight: "bold", size: 9pt)[代码可用性。]#text(size: 9pt)[ 模型源代码公开于 #link("https://github.com/ruicheng-photonics/hlp-eme")[github.com/ruicheng-photonics/hlp-eme]。]\
  #text(weight: "bold", size: 9pt)[数据可用性。]#text(size: 9pt)[ 支撑本文结果的数据可向作者索取。]\
  #text(weight: "bold", size: 9pt)[补充材料。]#text(size: 9pt)[ 见本文"补充材料"一节。]
]

#pagebreak(weak: true)

= 补充材料

#set figure(numbering: none)
#set math.equation(numbering: n => "(S" + str(n - 1) + ")")

#par(first-line-indent: 0em)[
  #text(size: 9pt)[本部分是正文《毫米级复杂调制集成 Bragg 光栅的高效仿真：层级局部周期本征模展开》的补充信息。]
]

== S1. 侧壁起伏宽度调制 IBG 的仿真

除了 LPDM，HLP-EME 同样适用于其他切趾方案，比如侧壁起伏宽度（$Delta W$）调制。我们以一只 $Delta W$ 调制的高斯切趾非对称多模 IBG 为例加以说明（附图 S1(a)、(b)）。峰值 $Delta W$ 只有几十纳米的高斯轮廓已经逼近常规光刻的分辨极限，因此这里改用严格的 3D-FDTD 来核对 HLP-EME 的精度。该 IBG 按 $"TE"_0$–$"TE"_1$ 模式转换设计，平均波导宽度 1 µm、最大 $Delta W$ 40 nm、光栅周期 300 nm。为迁就 3D-FDTD 的计算能力，器件长度限制在 150 µm，比本文评估的其他光栅都短。附图 S1(c) 显示两种方法的结果符合得很好。

#figure(
  image("fig/supp_figS1.png", width: 70%),
  caption: [附图 S1. (a) $Delta W$ 调制、高斯切趾非对称多模 IBG 的切片结构示意图（$Delta W$ 放大五倍以便观察）。(b) $Delta W$ 及其导致的 $kappa$ 沿光栅长度的分布。(c) 3D-FDTD 与 HLP-EME 算出的 $"TE"_0$–$"TE"_1$ 反射谱对照。]
)

== S2. 关于模式数的收敛性

我们考察 HLP-EME 中用于计算 S 矩阵的保留模式数 $N _("modes")$ 的数值收敛性。评估对象与正文图 3 相同，即做在非对称多模 IBG 上的双通道方形滤波器。附图 S2 给出不同 $N _("modes")$ 下 HLP-EME 算出的 $"TE"_0$–$"TE"_1$ 反射谱。保留的模式数不足（$N _("modes") = 3$）时，仿真捕捉不到光栅的模式耦合行为，得到的是一条非物理的、约 $-22$ dB 的近水平线；$N _("modes") >= 4$ 起谱形迅速收敛并准确复现预期形状。本文全部仿真因此取 $N _("modes") = 5$。

#figure(
  image("fig/supp_figS2.png", width: 50%),
  caption: [附图 S2. 不同保留模式数 $N _("modes")$ 下，HLP-EME 仿真的双通道方形滤波器 $"TE"_0$–$"TE"_1$ 反射谱。]
)

== S3. 各设计光栅的结构参数

本文全部 IBG 都做在标准 220 nm SOI 平台上，顶部为氧化层包层，关键结构参数汇总于附表 S1。其中 $Lambda _G$ 为光栅周期，$W$ 为平均波导宽度，$Delta W$ 为侧壁起伏宽度，$L$ 为光栅总长。LPDM 指横向相移调制；AM-IBG 与 FM-IBG 分别指实现 $"TE"_0$–$"TE"_1$ 模式转换的非对称多模 IBG 与基模（$"TE"_0$–$"TE"_0$）IBG。

本文的 IBG 设计沿用 @Cheng21 给出的流程。针对目标光谱响应，先用逐层剥离算法综合出复杂光栅曲线——耦合系数 $kappa (z)$ 与光栅相位 $phi _G (z)$；再把这些曲线映射到物理光栅结构。本文所有光栅的侧壁起伏都是正弦形。采用 LPDM 切趾时，局部横向相移 $Delta phi (z)$ 由归一化耦合系数 $kappa _"nor"$ 决定：对按 $"TE"_0$–$"TE"_1$ 模式转换设计的非对称多模 IBG，

$ Delta phi (z) = 2 arcsin (kappa _"nor") $ <eq-s1>

而对常规同模 IBG（$"TE"_0$–$"TE"_0$），

$ Delta phi (z) = 2 arccos (kappa _"nor") $ <eq-s2>

得到的 $Delta phi (z)$ 与 $phi _G (z)$ 随后用于确定光栅两侧的空间边缘函数。

正文图 5 的 GA-CDC 按 @Cheng2024 的方法设计。其中关键的一步是仔细选取两只光栅的起伏宽度（$Delta W _1$ 与 $Delta W _2$），使二者完全错位（即 $Delta phi (z) = pi$）时 $kappa$ 约为 $0$ mm⁻¹。只有满足这一条件，归一化耦合系数才能通过 $Delta phi (z)$ 在 1 到 0 的整个范围内调制。

正文图 7 的螺旋 IBG 基于阿基米德螺线，中心是一段半径 5 µm 的 S 形波导；螺旋半径从最小 10 µm 变到最大约 29 µm，相邻路径的中心间距约 1.6 µm。

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto),
    align: (left, left, center, right, right, right, right, left),
    inset: (x: 5pt, y: 3pt),
    fill: (row, col) => if row == 0 { luma(240) },
    [*目标响应*], [*光栅类型*], [*切趾方式*], [*周期 $Lambda _G$ (nm)*], [*宽度 $W$ (µm)*], [*起伏 $Delta W$ (nm)*], [*总长 $L$ (mm)*], [*数据来源*],
    [双通道方形], [AM-IBG], [LPDM], [302], [1], [48], [0.915], [图 3、附图 S2],
    [旁瓣抑制], [AM-IBG], [LPDM], [332], [0.72], [20], [0.266], [图 4(a)、(b)],
    [单通道方形], [AM-IBG], [LPDM], [302], [1], [55], [0.516], [图 4(c)、(d)],
    [双通道线性边缘], [AM-IBG], [LPDM], [302], [1], [30], [1.072], [图 4(e)、(f)],
    [双通道方形], [GA-CDC #super[a]], [LPDM], [325], [0.6/0.4 #super[b]], [20/30 #super[c]], [0.916], [图 5],
    [方形滤波（高斯相位）], [FM-IBG], [LPDM], [317], [0.5], [13], [0.929], [图 6],
    [旁瓣抑制], [螺旋 FM-IBG], [LPDM], [292], [0.75], [10], [1.46], [图 7],
    [旁瓣抑制], [AM-IBG], [$Delta W$ 调制], [300], [1], [40 #super[d]], [0.15], [附图 S1],
  ),
  caption: [附表 S1. 本文设计的光栅结构参数。#super[a]：GA-CDC 两只波导之间的间隙为 112 nm。#super[b]：数值为两只波导光栅的平均宽度。#super[c]：数值为两只波导光栅的起伏宽度。#super[d]：数值为光栅的峰值起伏宽度。]
)

== S4. 仿真设置与计算成本估算

HLP-EME 仿真通过 Python–Lumerical API 对框架的自动化实现来跑，数值本征模展开引擎为 Lumerical MODE。所提公式与求解器无关，换成其他全矢量本征模求解器同样可以直接扩展。2D- 与 3D-FDTD 仿真都用 Lumerical FDTD 完成，全局网格精度取 3。2D-FDTD（结果见正文图 4）采用有效折射率法，硅波导芯层的有效折射率设为 2.84。

为准确解析光栅几何，EME 与 FDTD 模型都加了两个矩形网格加密区，各覆盖一侧起伏的侧壁。网格只沿波导宽度方向加密，步长为 $Delta W / 10$（取整到最近的纳米）。器件边界外的仿真区域设为 0.56 µm，约为有效波长的一半。FDTD 仿真中，监视器的波长跨度设为 60 nm、共 600 个频点；另在光栅的中面放一只二维离散傅里叶变换（DFT）面监视器，在该带宽内等间隔取 10 个波长记录空间场分布。

边界条件方面，3D-FDTD 与 EME 都在 $z _"min"$ 面施加对称边界，以利用结构的镜面对称性，从而缩小计算域、提高效率。对所考虑的波导几何，这一边界条件同时选定了 TE-like 对称类并抑制 TM-like 基模。FDTD 仿真中其余边界一律用标准匹配层（PML）吸收；EME 仿真中 $z _"max"$ 面用金属边界条件，其余边界用 PML。

仿真运行在一台双路 AMD EPYC 7542、256 GB 内存（十六根 16 GB）的工作站上。FDTD 与 EME 的 MPI 进程数都设为 56，每进程单线程。

由于 3D-FDTD 仿真正文图 4 中全长光栅的代价过高，我们改仿若干只较短的光栅，把计算时间对光栅长度拟合后外推。具体地，仿真宽度 1 µm 的非对称多模 IBG，长度分别为 60.4、120.8 与 181.2 µm，对应仿真时间约 0.34、2.19 与 6.52 小时。这些预仿真的 PML 边界设为 standard，层数增到 16，以保证短尺度下的收敛。随后用二次回归把仿真时间拟合为光栅长度的函数——这与该几何下 FDTD 的 $O (L^2)$ 时间复杂度一致。拟合结果见附图 S3：长度 266、516 与 1072 µm 的完整仿真分别约需 16.8、75.8 与 360 小时。这些数是下界估计；实际耗时可能明显更长，因为更长的光栅通常需要更厚的 PML 区域来防止数值发散，计算量还会进一步上升。

#figure(
  image("fig/supp_figS3.png", width: 56%),
  caption: [附图 S3. 3D-FDTD 仿真时间随光栅长度的二次外推。蓝圈为短光栅（60.4、120.8、181.2 µm）的实测计算时间；虚线为 $O (L^2)$ 多项式拟合；红方框给出目标毫米级光栅的下界仿真时间预测。]
)

== S5. 器件制备与实验表征

器件由 Applied Nanotools, Inc.（加拿大埃德蒙顿）在商用 SOI 平台（法国 SOITEC）上制备，硅层厚 220 nm，埋氧层（BOX）厚 2 µm，硅衬底厚 725 µm。图形用 100 keV 电子束光刻（EBL）在电子束抗蚀剂中定义，随后以各向异性感应耦合等离子体反应离子刻蚀（ICP-RIE）穿透整个硅器件层。最后用等离子体增强化学气相沉积（PECVD）镀 2.2 µm 厚的氧化层上包层。

光进出芯片靠代工厂工艺设计套件（PDK）提供的垂直光栅耦合器。光谱响应由可调谐激光器（Keysight 81960A）与光功率计（Keysight N7745A）记录。正文图 6(b) 的幅度与相位响应由光学矢量分析仪（Luna OVA 5000）测得，传播延迟造成的相位线性部分已在数值上扣除。该图短波长一端的响应被 OVA 的测量带宽（1525–1610 nm）截断。为测量非对称多模 IBG 的 $"TE"_0$–$"TE"_1$ 反射响应，IBG 之前集成了一只基于绝热非对称定向耦合器的 $"TE"_0$ 与 $"TE"_1$ 模式分合束器。基模 IBG 的测量则在光栅前放一只 3 dB 定向耦合器来提取反射信号。

#v(6pt)
#set text(lang: "en", size: 9pt)
#set par(leading: 0.55em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
