// 在 InP 衬底上以凸型渐变 InAlAs 缓冲层实现超高迁移率 InAs 量子阱 —— arXiv:2609.28795 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排。图 2、图 3 与图 1(b)(c) 为数据图，保留原图（PNG 展平白底、按版面裁剪）；
// 图 1(a) 的层堆叠示意原图是位图，按 D:\cetz-skill-release\SKILL.md 以 CeTZ 重绘。

#set document(title: "在 InP 衬底上实现超高迁移率的 InAs 量子阱")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.2em, below: 0.4em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}
#show heading.where(level: 2): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1em, below: 0.3em)[
    #text(weight: "bold", size: 10.5pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(first-line-indent: 0em)
#show table: set par(first-line-indent: 0em)
#show figure: set block(below: 1em)

// 晶体学方向与倒易空间反射指数的负号上划线
#let barmil = [$[1 overline(1) 0]$]
#let bar110 = [$[11 overline(1) 0]$]
#let bar224 = [$(overline(2) overline(2) 4)$]

#align(center)[
  #text(size: 15pt, weight: "bold")[在 InP 衬底上实现超高迁移率的 InAs 量子阱]\
  #v(4pt)
  #text(size: 10pt)[
    Tyler Lindemann #super[1,2]，
    Rojila Ghimire #super[1]，
    Alejandro Alcaraz Ramirez #super[2]，
    Ahmad Azizimanesh #super[2]，
    Sergei Gronin #super[2]，
    Ray Kallaher #super[2]，
    Michael J. Manfra #super[1,2,3,4,5] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 美国印第安纳州西拉法叶，普渡大学物理与天文系\
      #super[2] 美国印第安纳州西拉法叶，Microsoft Quantum\
      #super[3] 普渡大学材料工程学院　#super[4] 普渡大学伊莫家族电气与计算机工程学院\
      #super[5] 普渡大学量子科学与工程研究所\
      通讯作者：#link("mailto:mmanfra@purdue.edu")[mmanfra\@purdue.edu]；#link("mailto:b-mmanfra@microsoft.com")[b-mmanfra\@microsoft.com]
    ]
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.28795 [cond-mat.mes-hall]，2026 年 9 月 23 日；中文译本编译于 2026-09-27]
]

#v(8pt)
#block(width: 100%, inset: (x: 1.5em, y: 1.1em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    InAs 量子阱里的二维电子气有强自旋–轨道耦合、大的朗德 $g$ 因子和高度透明的界面，是研究混合半导体–超导异质结构中拓扑超导性的理想平台。要把微弱的相互作用效应同背景噪声区分开，先得把半导体里的无序降下来。我们在绝缘 InP 衬底上做出了迁移率极高的 InAs 二维电子气：借助 InAlAs 失配缓冲层中一条凸型的组分渐变曲线，在不使用含 Ga 覆盖层的条件下长出了厚度超过 10 nm 的 InAs 量子阱，并考察了这类异质结构的结构与电学输运性质。失配缓冲层设计的改进，使低温电子迁移率在二维电子气密度不超过 $3.2 times 10^11$ cm⁻² 时突破 $1.7 times 10^6$ cm² V⁻¹ s⁻¹，这是该材料体系迄今报道过的最高值。
  ]
]
#v(6pt)

#figure(
  table(
    columns: 5,
    align: (left, center, center, center, center),
    inset: 5pt,
    table.header([样品], [$d$（nm）], [$mu _"max"$（10⁶ cm² V⁻¹ s⁻¹）], [$n _{2"DEG"}$（10¹¹ cm⁻²，$mu _"max"$ 处）], [$n _{2"DEG"}$（10¹¹ cm⁻²，$V _g = 0$）]),
    [A], [10], [1.56], [3.28], [3.50],
    [B], [12], [1.53], [3.01], [3.30],
    [C], [14], [1.72], [3.24], [3.48],
  ),
  caption: [本工作考察的样品参数：量子阱厚度 $d$、峰值迁移率 $mu _"max"$、峰值迁移率处的二维电子气密度 $n _{2"DEG"}$，以及零栅压（$V _g = 0$）下的二维电子气密度 $n _{2"DEG"}$。数据由沿 #barmil 晶向放置的顶栅霍尔条测得。],
  kind: table,
  numbering: "1",
  supplement: [表],
) <tbl-samples>

= 1 引言

强自旋–轨道耦合、大的朗德 $g$ 因子和高度透明的界面，让 InAs 成为研究拓扑超导的一个好用平台。在浅量子阱异质结构里，InAs 很容易被外延超导层诱导出近邻超导性。InAs 与 GaSb 的晶格失配很小，所以 GaSb 顺理成章地成了承载含 InAs 异质结构的选择：在它的上面可以长出相当厚的 InAs 量子阱而不发生弛豫 @Kroemer2004 @Thomas2018。不过把 InAs 量子阱做进锑化物异质结构有它的难处，尤其卡在 Sb–As 混合界面的优化上——从 Tuttle 等人上世纪 80 年代的工作算起，这条线一直在推进 @Tuttle1989。另一种做法是只靠砷化物做有源区，经渐变缓冲层（graded buffer layer，GBL）集成到半绝缘 InP 上，好处正是完全避开混合阴离子势垒。此外 InP 衬底的绝缘性能比 GaSb 好得多，对高频器件运行是一条实打实的优势。

在 InP 衬底上长 InAs 量子阱，压应变很大，阱宽通常被压在 10 nm 以下。阱一薄，界面粗糙度散射和势垒合金散射就还是无序的主要来源。要压低这两项，一条路是把 InAs 量子阱做厚，让二维电子气的波函数少往势垒里钻、与两个界面的重叠变小。以往工作给 GBL 用的多是线性阶跃渐变曲线，通常还配上一层组分"回退"（step-back）层，再叠加组分过冲，用来消掉缓冲层里攒下的残余应变 @Shabani2014APL @Hatke2017APL @Ayers2015。想把晶格失配降下来、长出更厚的 InAs 阱，就得把组分渐变到更高的 In 含量，让缓冲层的晶格常数靠近 InAs。可是铟含量一高，组分过冲这招就使不得了：它会在主用量子阱附近引出寄生的并联导电通道。我们换了个思路，给 GBL 用凸型指数渐变曲线，于是在 InP 上不用含 Ga 覆盖势垒，也能长出比以往更厚、仍然相干应变的 InAs 量子阱。

为了给结果找个参照，我们把已报道的 InP 上高迁移率 InAs 量子阱列出来比一比。Hatke 等人用 In#sub[0.75]Ga#sub[0.25]As 覆盖层配 In#sub[0.75]Al#sub[0.25]As 势垒，在晶格失配的 InAs/InP 异质结构上拿到了高迁移率，优化后的结构在二维电子气密度 $6.2 times 10^11$ cm⁻² 处峰值迁移率约 $1.1 times 10^6$ cm² V⁻¹ s⁻¹ @Hatke2017APL。Dempsey 等人最近靠降低 InGaAs 覆盖层里的 In 含量来补偿应变，做出 16 nm 宽的 InAs 量子阱，在电子密度 $4.2 times 10^11$ cm⁻² 处报出 $1.16 times 10^6$ cm² V⁻¹ s⁻¹ 的峰值迁移率 @Dempsey2025PRM。我们这一版把基于 Ga 的覆盖层换成坐在凸型 GBL 上的 In#sub[0.875]Al#sub[0.125]As 势垒，量子阱因此能长得更厚。三个样品里，14 nm 阱的那个迁移率最高，$mu = 1.72 times 10^6$ cm² V⁻¹ s⁻¹，对应电子密度 $n = 3.24 times 10^11$ cm⁻²。宽阱之所以迁移率更高，归因于二维电子气被约束得更紧，界面粗糙度散射与合金无序散射随之减弱，同时背景带电杂质散射也更轻 @Dempsey2025PRM @benali2022metamorphic。

#figure(
  grid(columns: (5fr, 11fr), gutter: 8pt, align: (center, center),
    [
      #include "fig/layerstack.typ"
      #v(2pt)
      #text(size: 8.5pt)[（a）]
    ],
    [
      #image("fig/fig1_b.png", width: 52%)
      #text(size: 8.5pt)[（b）]\
      #v(3pt)
      #image("fig/fig1_c.png", width: 52%)
      #text(size: 8.5pt)[（c）]
    ]
  ),
  caption: [（a）本工作三个样品共用的异质结构层堆叠，量子阱厚度 $d$ 的取值见 @tbl-samples。（b）三个样品在 $n = 2.9 times 10^11$ cm⁻² 下的自洽 Schrödinger–Poisson 计算结果：导带带边与电子电荷分布，$Z$ 为到顶部势垒–介质界面的距离。（c）应变能密度随下方 GBL 晶格常数的变化，按三种量子阱厚度分别计算。竖直虚线标出此前报道的 GBL 末层晶格常数（假设完全弛豫）@Shabani2014APL @Hatke2017APL @Dempsey2025PRM；竖直点线是本工作用的 In#sub[0.875]Al#sub[0.125]As GBL。（a）原图为位图，译文以 CeTZ 重绘。],
) <fig-stack>

= 2 分子束外延生长

三片晶圆在一台 VEECO GEN 930 分子束外延（MBE）系统上生长，量子阱厚度分别为 10、12 和 14 nm，完整的异质结构设计见 @fig-stack（a）。所有样品都长在 (001) 取向、Fe 掺杂的半绝缘 InP 衬底上。为保住 MBE 腔体的真空，衬底先在一间配套的超高真空（UHV）室里加热到 300 °C，把残留的水和挥发性有机物脱附干净。

进 MBE 腔后，表面重构用反射式高能电子衍射（RHEED）实时监测，温度则同时由光学高温计和带边测温法读出。衬底在 As#sub[4] 过压下加热，升到比 InP 热脱除原生氧化物的温度低约 10 °C 处停住；As#sub[4] 过压恒定在束流等效压强 $3 times 10^-5$ Torr。一边盯着 RHEED，一边用源闸把 As#sub[4] 束流掐断几秒，看表面重构从 2×3 图样翻到富金属的 4×2 图样；一见这个转变就立刻恢复 As#sub[4] 过压，表面随即回到 2×4 重构。这样除氧，是为了把表面暴露在富金属相下的时间压到最短，从而减少生长前衬底表面的退化。氧化物去除之后，把样品降温到 470 °C，先生长 100 nm 晶格匹配的 In#sub[0.52]Al#sub[0.48]As 层，再长 In#sub[0.58]Ga#sub[0.42]As/In#sub[0.47]Al#sub[0.53]As 应变层超晶格（strained-layer superlattice，SLSL）。

SLSL 完成后，先把衬底温度进一步降到 250 °C，再长 1250 nm 的 InAlAs 渐变缓冲层。这里没有用文献里常见的线性渐变曲线 @Shabani2014APL @Hatke2017APL @Dempsey2025PRM，而是让 Al 摩尔分数从 48 % 按递减指数降到 12.5 %：GBL 最初的几层里 Al 组分和晶格常数变化很大，越靠近末尾变化越小，于是失配位错以及由此派生的穿透位错被尽量挡在有源区之外。GBL 生长期间的衬底温度由带边测温的自动反馈精确锁定，样品之间的温度差异因此压得很小。前 550 nm 恒定在 250 °C，余下的 700 nm 里从 250 °C 线性升到 350 °C。生长温度高，位错滑移速度就快，能促进位错在 GBL 内湮灭，从而降低有源区里的穿透位错密度（TDD）@Kim2022NRL @George1987；但温度一高，III 族吸附原子迁移率上升，失配渐变缓冲层典型的交叉网格形貌也会被放大 @Rovaris2019。所以说 GBL 的温度曲线可以按具体异质结构的指标来定制，这里头还有继续优化的空间。

GBL 收尾后把衬底温度升到 450 °C 长有源区：25 nm 的 In#sub[0.875]Al#sub[0.125]As 下势垒、一层 InAs 量子阱、120 nm 的 In#sub[0.875]Al#sub[0.125]As 上势垒。三种阱宽的具体取值见 @tbl-samples。

= 3 结果

== 3.1 Schrödinger–Poisson 与应变计算

为了弄清把量子阱加宽到底改变了什么，我们用 NextNano#super[3] @Nextnano 的自洽 Schrödinger–Poisson 求解器对样品 A 到 C 做了建模，@fig-stack（b）画出三种结构的导带带边与电子密度分布。约束程度也在 $n = 2.9 times 10^11$ cm⁻² 下算了一遍——这个密度离三个样品出现峰值迁移率的位置很近。结果与预期一致：阱越宽，电子被约束得越好。此外还针对三种阱宽，把面内应变能密度作为 GBL 晶格常数的函数算了出来，见 @fig-stack（c）。

== 3.2 结构表征

GBL 的应变状态与合金组分用一台 Malvern Panalytical Empyrean X 射线衍射仪表征，围绕对称的 (004) 反射和非对称的 #bar224 反射采集了高分辨倒易空间图（RSM），结果见 @fig-rsm（a）与（b）。对称 (004) 峰能给出法向晶格常数和外延层的宏观倾角；非对称 #bar224 峰在给出法向晶格常数的同时还能给出面内晶格常数，只是这份信息里混着宏观倾角。Chauveau 等人演示过怎么用最基础的几何修正，把宏观倾角造成的峰位偏移从应变造成的偏移里剥离出来 @Chauveau2003JAP。做完这套修正，GBL 的残余拉应变为 $epsilon _"‖" = 0.16 %$。理想情况下大家都希望 GBL 一点残余应变都没有，但 III–V 体系里用应变补偿层来拉长量子阱有效临界厚度的做法已被反复验证 @Tansu2001 @Choi1999 @Dempsey2025PRM。我们的数据反而说明，GBL 上这点残余应变对长出更厚的相干应变量子阱是有利的。

除了 X 射线，三片样品都采了原子力显微镜（AFM）形貌。@fig-rsm（c）是样品 A 的像。样品确实带着组分渐变缓冲层那种标志性的交叉网格形貌，但在有源区里没看到明显的塑性弛豫迹象——Lei 等人故意把 InAs 量子阱推到临界厚度之外时才出现那种特征 @Lei2026。样品 A 的面均方根粗糙度 $R _q^"2D" = 1.97$ nm，而且交叉网格在 #bar110 与 #barmil 两个主晶向上明显各向异性。把线性均方根粗糙度沿这两个方向分别取出来，就能把各向异性量化：样品 A 沿 #barmil 为 $R _q = 1.9$ nm，沿 #bar110 只有 $R _q = 0.6$ nm。再用沿两方向做快速傅里叶变换（FFT）得到的交叉网格波长 $lambda$ 来刻画同一种各向异性：样品 A 沿 #barmil 为 $lambda = 3.3$ μm，沿 #bar110 为 $2.2$ μm。

#figure(
  image("fig/fig2.png", width: 100%),
  caption: [（a）（b）样品 A 的倒易空间图，分别取自非对称 #bar224 反射与对称 (004) 反射。（a）中的斜虚线是完全弛豫线，（b）中的竖直虚线标出 $q _x = 0$。虽然 #bar224 反射的强度极大值看起来是沿弛豫线走的，但必须先按 (004) 反射偏离 $q _x = 0$ 的程度修正宏观倾角。修正之后可以看出，本工作样品的 GBL 带有一点点残余拉应变。（c）样品 A 的 20×20 μm² AFM 像，组分渐变缓冲层典型的交叉网格形貌清晰可见。],
) <fig-rsm>

== 3.3 器件制备与测量

为了在不同二维电子气密度下做电学输运测量，三种样品上都制备了标称宽度 120 μm 的顶栅霍尔条，并且沿 #bar110 与 #barmil 两个晶向各放一组。霍尔条的隔离台（mesa）用常规湿法刻蚀定义；刻蚀之后先做 Ar 离子铣削去掉原生氧化物，再用电子束蒸发 Ti/Al 做欧姆接触。顶栅介质是 11 nm 的氧化铪，走标准热 ALD 工艺生长。最后电子束蒸发 Ti/Au，用剥离工艺图形化，覆盖在霍尔条上方形成顶栅。

输运测量在 $T = 300$ mK 下进行，磁场垂直于样品面、最大到 5 T，用 100 nA 的低频交流激励测样品两端的纵向电压 $V _"xx"$ 与横向电压 $V _"xy"$；测量回路如 @fig-transport（a）插图所示。

== 3.4 迁移率随阱宽与二维电子气密度的变化

要先摸清二维电子气密度跟栅压的关系，所以每根霍尔条都先在 $B = 0.1$ T 下把 $R _"xy"$ 作为栅压的函数提取出来。有了这条换算，才能在可比的密度下讨论迁移率的密度依赖，也才能把不同量子阱的输运放到同一把尺子上量。

接着看峰值迁移率的阱宽依赖。这里只讨论沿 #barmil 方向的输运——交叉网格形貌带来的各向异性使这个方向上的峰值迁移率略高一点。阱宽 14 nm 的样品 C 给出 $mu = 1.72 times 10^6$ cm² V⁻¹ s⁻¹，对应 $n = 3.24 times 10^11$ cm⁻²，是本工作测到的最高值。@tbl-samples 显示三个样品的迁移率都不低于 $1.5 times 10^6$ cm² V⁻¹ s⁻¹，阱宽退到 12 nm 和 10 nm 时峰值只是略微下降。可见 10 nm 与 12 nm 阱之间的界面粗糙度散射差别还不够大，撑不起明显的迁移率落差；阱宽低于 10 nm 之后，预计下降会剧烈得多。

想知道这一代器件里到底是什么在限制迁移率，就把三种阱宽的 $mu$ 对 $n$ 画在一起，见 @fig-transport（a）。迁移率随密度上升，从 $0.5 times 10^11$ cm⁻² 一路涨到约 $3.0 times 10^11$ cm⁻²；到这一点之后继续加密度，迁移率反而回落。这个转折对应量子阱里第二电子子带开始被占据。10 nm 和 12 nm 阱的走势与 14 nm 阱基本一样，只是峰值低一些。

@fig-transport（a）里还画了 $mu ∝ n^0.5$ 这条参考线。指数落在 0.5 附近，说明主导散射机制是均匀分布的背景带电杂质 @DasSarma2013PRB。密度低于 $1.0 times 10^11$ cm⁻² 时，迁移率掉得比 $n^0.5$ 快，意味着输运进入了一个局域化更强的区间。Hatke 等人在 InP 上用 In#sub[0.75]Ga#sub[0.25]As 覆盖势垒的 InAs 量子阱 @Hatke2017APL，以及 Dempsey 等人把覆盖势垒 In 含量降到 0.72 的那批样品 @Dempsey2025PRM，提取出的指数也差不多是这个值。这一代异质结构峰值迁移率的提升，可以归到两处：背景带电杂质密度降下来了，更宽的 InAs 阱又把界面粗糙度散射的影响压了下去。

拿前人的结果跟我们的工作直接比，合适的品质因子是 $mu / n^0.5$。Hatke 等人最好的样品上这个比值是 0.44，而本工作的样品 C 是 0.96。也就是说，散射强度至少比此前的最好水平低了一半。

#figure(
  image("fig/fig3.png", width: 92%),
  caption: [（a）沿 #barmil 晶向测得的样品 A、B、C 迁移率–载流子密度关系。点线是幂律 $mu ∝ n^alpha$，取 $alpha = 0.5$。峰值迁移率 $1.72 times 10^6$ cm² V⁻¹ s⁻¹ 出现在样品 C（14 nm 阱）的 $n = 3.24 times 10^11$ cm⁻² 处。插图为制得的霍尔条之一的光学显微像，上面叠了测量电路示意。（b）14 nm 阱在 $n = 2.27 times 10^11$ cm⁻²、$T = 300$ mK 下的磁输运，标出了整数填充因子。（c）14 nm 阱在 $n = 3.15 times 10^11$ cm⁻²、$T = 300$ mK 下的低场 $R _"xx"$ 与 $R _"xy"$，Shubnikov–de Haas 振荡在约 ± 0.2 T 处起振。（d）$n = 3.15 times 10^11$ cm⁻² 下扣除平滑多项式背景后的纵向电阻率振荡分量随 $1 / B$ 的变化。插图为纵向电阻率的 FFT：主峰 $f$ 对应单一导电通道的密度，$2f$ 处的二次谐波标志着自旋劈裂开始。],
) <fig-transport>

== 3.5 磁输运测量

@fig-transport（b）给出样品 C 在载流子密度 $2.27 times 10^11$ cm⁻²、$T = 300$ mK、磁场到 5 T 下的磁输运，图上标出了若干整数量子霍尔态的填充因子 $nu$。（c）把窗口收窄到低场区，密度为 $n = 3.15 times 10^11$ cm⁻²：Shubnikov–de Haas 振荡在 $B approx 0.2$ T 起振。在极小的磁场下（弱局域区间），自旋–轨道耦合可以忽略，时间反演对称让一对沿相反方向绕行的闭合电子轨迹发生相长干涉，相干背散射的概率因此被抬高，零场处的纵向电阻 $R _"xx"$ 随之增大。一旦加上垂直磁场，两条时间反演路径之间会多积累一段磁相位，相长干涉被破坏，背散射概率下降 @farzaneh2024observing。于是 $R _"xx"$ 随磁场升高而减小，呈现出弱局域特有的负磁阻 @golub2005weak——@fig-transport（c）里看得很清楚。（d）是样品 C 扣除缓变背景后、纵向电阻率的振荡分量随 $1 / B$ 的变化，插图为对应的 FFT。基频处 6.77 T 的强峰说明只有一个导电子带参与输运，$2f$ 处较弱的信号则是自旋劈裂的开端。按 Onsager 关系 $n = abs(e) f / h$ @onsager1952interpretation，由基频算出的载流子密度为 $3.22 times 10^11$ cm⁻²，与霍尔电阻斜率给出的 $3.15 times 10^11$ cm⁻² 一致，说明不存在并联导电。

= 4 结论

靠优化渐变缓冲层，我们在 InP 半绝缘衬底上做出了厚度到 14 nm 的 InAs 量子阱。凸型渐变曲线让 GBL 能走到比线性 GBL 加组分回退更大的晶格常数和更低的 Al 合金组分，又不会引出并联导电通道。X 射线分析还给出一个意外收获：GBL 里存在少量拉性残余应变，它通过应变补偿效应撑起了更厚的量子阱，而不必像以往那样靠提高 Ga 含量的覆盖势垒来绕——那条路会额外招进合金散射。低温电学输运相比此前报道的 InP 上 InAs 量子阱有实质进步，14 nm 样品在二维电子气密度不超过 $3.3 times 10^11$ cm⁻² 时给出不低于 $1.7 times 10^6$ cm² V⁻¹ s⁻¹ 的峰值迁移率。

#v(1em)
#set par(first-line-indent: 0em)

#text(weight: "bold")[致谢]

本工作由 Microsoft Quantum 资助。

#text(weight: "bold")[作者声明]

#text(size: 9.5pt)[
  #strong[利益冲突：　]作者们没有需要披露的利益冲突。\
  #strong[作者贡献：　]Tyler Lindemann：概念提出、实验、方法学、形式分析、图示、初稿撰写、审阅与修订；Rojila Ghimire：实验、形式分析、图示、初稿撰写、审阅与修订；Alejandro Alcaraz Ramirez：实验、形式分析、审阅与修订；Ahmad Azizimanesh：实验、审阅与修订；Sergei Gronin：方法学、审阅与修订；Ray Kallaher：实验、审阅与修订；Michael J. Manfra：概念提出、项目指导、项目管理、经费获取、初稿撰写、审阅与修订。\
  #strong[数据可用性：　]支持本研究发现的数据，向通讯作者合理索取即可获得。
]

#v(1em)
#set text(lang: "en", size: 9pt)
#set par(leading: 0.55em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
