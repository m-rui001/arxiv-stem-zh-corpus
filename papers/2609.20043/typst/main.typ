// 300 mm QSOI 平台上量子比特阵列的首电子位置均匀性 —— arXiv:2609.20043v1 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排。5 张数据图保留原矢量 PDF、图注全译；
// 图 1（器件剖面示意）原图为位图 PNG，按 D:\cetz-skill-release\SKILL.md 以 CeTZ 重绘。

#set document(title: "300 mm 商用 QSOI 平台上量子比特阵列的首电子位置均匀性")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: 2em, spacing: 0.6em)
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
#show figure: set block(below: 1em)

#align(center)[
  #text(size: 15pt, weight: "bold")[300 mm 商用 QSOI#super[®] 平台上\ 量子比特阵列的首电子位置均匀性]\
  #v(4pt)
  #text(size: 10pt)[
    Johan Pelloux-Prayer #super[1]，
    Elise Prin #super[1]，
    Giselle A. Elbaz #super[1]，
    Pierre-Louis Julliard #super[1]，
    Amaryllis Comiti #super[1]，
    Clément Nguyen #super[1]，
    Sylvain Martin #super[1]，
    Patrick Torresani #super[1]，
    Renan Lethiecq #super[1]，
    Carlos Augusto Suarez Segovia #super[2]，
    Franck Arnaud #super[2]，
    Etienne Nowak #super[1]，
    Tristan Meunier #super[1]，
    Bruna Cardoso Paz #super[1,#3] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 法国格勒诺布尔，Quobly\
      #super[2] 法国克罗勒，STMicroelectronics\
      #super[3] 通讯作者，#link("mailto:bruna.cardoso-paz@quobly.io")[邮箱]
    ]
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.20043v1 [quant-ph]，2026 年 9 月 17 日；中文译本编译于 2026-09-26]
]

#v(8pt)
#block(width: 92%, inset: (x: 1.6em), stroke: 0.6pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    我们报告了量子绝缘体上硅（quantum silicon-on-insulator，QSOI#super[®]）技术的最新进展。这套工艺从 28 nm 全耗尽绝缘体上硅（28 nm FD-SOI）平台改造而来，可以直接走 300 mm CMOS 产线，目标是可扩展的量子计算。把标准 28 nm FD-SOI 与 QSOI#super[®] 两种工艺做出的量子器件放在一起比较，单个器件在室温下的静电特性改善明显；QSOI#super[®] 还把器件离散度以及整片晶圆上的参数散布压低了很大一截。晶体管的各项指标都能由 TCAD 仿真复现，说明器件的静电行为与设计预期一致。在 2 K 以下的晶圆级测量中，我们稳定地得到少电子区的量子点：546 张稳定图里有 377 张成功探测到首个电子，良率 69 %，这 377 只量子点的首电子位置散布为 ± 35 mV。这些结果把 QSOI#super[®] 确立为 CMOS 兼容量子器件共集成的一条可行路线。
  ]
]
#v(6pt)

= 1 引言

硅基量子技术这几年势头很好，靠的就是与 CMOS 制造工艺兼容、有大规模集成的潜力 @gonzalez_zalba_scaling_2021 @maurand_cmos_2016 @zwanenburg_silicon_2013。在若干量子计算方案里，硅自旋量子比特是被寄予厚望的一条路线：相干时间长，还能与控制、读出电子学单片集成 @meunier_silicon_2025 @dumoulin_stuyck_cmos_2026 @hamonic_foundry-fabricated_2025。不过要做出可扩展的量子处理器，光有高保真度的比特操作不够，器件性能还得在晶圆之间可重复 @neyens_probing_2024。

单比特和双比特操作已经在好几种硅平台上演示过，包括 28 nm FD-SOI、SiMOS 和 SiGe 异质结构 @bartee_spin_2024 @cardoso_paz_fdsoi_2024 @zajac_resonantly_2018 @scappucci_germanium_2020 @veldhorst_two_qubit_2015，只是这些器件多数仍出自研究级环境，工艺控制和晶圆级的离散度分析都做得有限。对产业界来说，商用 CMOS 平台才具备把可靠产品做到 300 mm 尺度所需的低离散、高良率和工艺均匀性 @neyens_probing_2024。而且阵列规模一旦涨上去，室温和低温下的晶圆级电学表征就越来越要紧：质量控制、工艺优化、划片前的器件性能评估都靠它。

针对这些问题，我们与 STMicroelectronics 合作，把他们 28 nm FD-SOI 的专有基准工艺（process-of-record）改造成量子版本，也就是 QSOI#super[®] 工艺流程，做法是把拖累量子比特性能的步骤单独挑出来微调。本文报告优化后的 QSOI#super[®] 工艺在晶圆尺度上的最新结果，把 300 K 的自动测试（第 4.1 节）与 2 K 以下的测量（第 4.2 节）放在一起看。我们在 2 K 以下探测的二行阵列正是我们的两比特门元胞，其中每只栅极都调到既能工作在多电子区（当电荷传感器）、也能工作在少电子区（当量子点，QD）。结果显示 QSOI#super[®] 器件在晶圆尺度上的良率很高，首电子位置的离散度很低，这是我们这套 CMOS 兼容量子技术平台验证路上的一个关键节点。

= 2 器件与集成细节

本文研究的器件是用 QSOI#super[®] 这套 CMOS 兼容量子平台做出的单行与二行阵列。平台上量子点由架在硅纳米线上方的柱塞栅（G）静电定义，纳米线本身由浅槽隔离（shallow trench isolation，STI）刻出。单行与二行阵列的剖面示意见 @fig-qsoi。


如 @elbaz_integration_2025 所述，我们在柱塞栅之间插入了额外的钨通孔，作为第二层栅极（B），即势垒栅，用来控制相邻量子点之间的耦合。又因为阵列做在 SOI 上，手上还多一个自由度：背栅（BG），它能在静电上改变所用量子点的位置和质量。经过精心设计的实验设计（design of experiment，DOE）和工艺开发——包括对栅堆叠、栅间堆叠和关键尺寸的调整——量子阵列的转移特性明显改善，器件之间的离散度大幅下降。

#figure(
  include "fig/qsoi.typ",
  caption: [
    QSOI#super[®] 量子点阵列的剖面示意。存取栅（AG）用来形成电荷库；柱塞栅（G1、G2、……、Gx）控制各量子点的化学势；势垒栅（B1、B2、……、Bx+1）是复用的钨通孔，控制相邻两个量子点之间的隧穿耦合。此图为工艺示意，不反映器件的真实尺寸。（译者注：原图为位图，此图以 CeTZ 重绘。）
  ],
) <fig-qsoi>

= 3 方法与测量流程

电学表征按一条很直白的筛选逻辑走：让样品依次经过吞吐率从高到低的测量平台。每批晶圆先做完全自动化的 300 K 电学探针测试，采集第 4.1 节那些晶体管级指标；除量子器件之外，还测晶体管、电容这类测试结构来监控工艺。室温这一轮提供的是第一层统计筛选，用来给不同工艺分支（split）排序，并挑出最适合继续做低温研究的晶圆。

挑出的晶圆放进半自动晶圆级低温探针台降温。卡盘工作在约 900 mK，按设备商的估计，晶圆温度更接近 2 K。除了 MOSFET 区的 $I _ "D"$ – $V _ "g"$ 曲线，还测了量子点的直流电荷特性，结果见第 4.2 节。

室温下我们探测了 7098 只器件，低温下 2615 只。低温吞吐率掉得这么厉害，一是降温需要花时间热化到底温（每片 300 mm 晶圆 150 min），二是 2 K 下采的是二维图、300 K 下只采一维曲线，数据量差了一个量级。我们用自研算法提取 MOS 与 QD 的关键指标，用来区分不同工艺分支；又用 TCAD 仿真补充实验表征，确认器件的静电行为符合预期、机制清楚。

= 4 结果与讨论

下面给出晶圆尺度的 MOS 与 QD 电学表征结果。MOSFET 数据取自二行阵列，器件工作在 MOS 区，$V _ "DS" = 50 " mV"$；QD 数据取自表现最好的那档工艺分支，器件工作在量子区，$V _ "DS" = 1 " mV"$。第 4.1 节与第 4.2 节的晶圆级测量分别说明均匀性和少电子区的良率。


== 4.1 晶圆级 MOS 表征

为了给出每批晶圆电学性质的统计，我们在分布于心区、中区与边缘半径的 28 个 die 上测二行阵列。@fig-roomtemp (a) 是把 2 × 3 二行阵列当普通 MOSFET 测（所有柱塞栅一起扫）得到的室温曲线，QSOI#super[®] 相对 28 nm FD-SOI 的改善非常醒目：28 nm FD-SOI 做的阵列阈值电压 $V _ "TH"$ 很负，散布大到 $sigma _ { V _ "TH" } = 385 " mV"$；同样结构的 QSOI#super[®] 阵列，28 个 die 的曲线挤在一起，$sigma _ { V _ "TH" } = 41.1 " mV"$。

28 nm FD-SOI 做标准晶体管时，性能与业界最高水平相当 @mazurier_variability_2014；这里看到的退化来自量子器件的特殊设计——它偏离了标准晶体管，必须重新优化才能把本该有的性能拿回来。@fig-roomtemp (b) 与 (c) 分别画出背栅和势垒通孔如何调节结构内部的导通。我们从这两组数据提取一个调谐系数，量化加在背栅或通孔上的电压能把阈值电压位置挪动多少：QSOI#super[®] 的背栅调谐系数平均 $- 347 " mV/V"$，势垒通孔平均 $- 64.6 " mV/V"$。通孔的系数比背栅小，原因是柱塞栅的屏蔽削弱了通孔与沟道之间的容性耦合。作为对照，标准 28 nm FD-SOI 上我们这批器件的两个系数分别是 $- 1013 " mV/V"$（背栅）与 $- 491 " mV/V"$（势垒通孔）。数值偏大同样有解释：在该设计里，28 nm FD-SOI 的柱塞栅对硅沟道的静电控制不够强，于是背栅与势垒通孔的影响被放大。这些静电分量之间的相互制约很重要，直接决定我们怎么在低温下把量子点调到合适的位置。实践下来，300 K 下的每一项功能，都能提前预示它在 2 K 及以下好不好用。

#figure(
  image("fig/RoomTemperature.pdf", width: 94%),
  caption: [
    a、b、c、d 四个面板中，蓝色代表 28 nm FD-SOI，粉色代表 QSOI#super[®]。
    (a) 分布于心区、中区与边缘半径的 28 个 die（晶粒）上的晶圆级 $I _ "D"$ – $V _ "g"$ 曲线。
    (b)、(c) 分别为阈值电压对背栅电压（b）与对势垒通孔电压（c）的箱线图，28 nm FD-SOI 与 QSOI#super[®] 画在一起。箱线图为四分位距与中位数；须线为不含离群点的最大值与最小值，离群点定义为距中位数超过 1.5 倍四分位距的数据点。
    (d) 从 $I _ "D"$ – $V _ "g"$ 曲线提取的亚阈值摆幅（StS）箱线图，背栅偏压取 0 V、1 V、2 V 三档。背栅取 2 V 时，28 nm FD-SOI 的数据整体向负方向移出我们的测量范围，无法提取亚阈值摆幅。
    (e) 群点图，画出 QSOI#super[®] 2 × 3 量子阵列中每只柱塞栅各自的阈值电压分布。此面板只有 QSOI#super[®] 的数据。
  ],
) <fig-roomtemp>

@fig-roomtemp (d) 是亚阈值摆幅的对比，均值与离散度双双改善：从 28 nm FD-SOI 的 193 ± 155 mV/dec 降到 QSOI#super[®] 的 104 ± 10 mV/dec。

@fig-roomtemp (e) 画出 QSOI#super[®] 2 × 3 二行阵列中每只柱塞栅的阈值电压分布。内部的柱塞栅（上排记作 GxT、下排记作 GxB）彼此符合得不错，中位数之间最大相差约 68.5 mV。这个数可以和 @neyens_probing_2024 的报道对照：配对差值 $Delta V _ "TH" slash sqrt( 2 )$ 分布的标准差，文献中为 59 mV，本工作两片晶圆上为 101 mV。我们认为离散度还能继续压，办法是再优化若干具体的工艺模块，比如最近那批复用钨通孔——它们被引入来控制点间隧穿耦合 @elbaz_integration_2025。

另外，存取栅的 $V _ "TH"$ 明显低于柱塞栅。阵列最外侧的栅阈值偏低是常见现象 @neyens_probing_2024，解释是它离掺杂的源、漏太近：掺杂可以扩散到足够靠近最外层栅的位置，从而显著影响它的阈值电压。

@fig-simulation 显示，仿真与实验在 300 K 的 $I _ "D"$ – $V _ "g"$ 曲线上、以及在室温和低温的 $V _ "TH"$ 上都对得很好。仿真用栅长在微米量级的标准晶体管的电学表征结果标定，能准确复现室温下不同背栅电压造成的阈值电压差异；低温下体偏置效应的非线性也复现得不错。


以上结果说明，QSOI#super[®] 产品线做出来的二行阵列在室温下能够正常充当 MOSFET，通过了走向 mK 温区可用量子器件的第一道筛选。

== 4.2 晶圆级量子点表征

要测量子点的均匀性，二行器件的 6 只柱塞栅每只都要既当电荷探测器、又当量子点来测（见 @fig-setqd ）。做法是：让沟道一侧的柱塞栅工作在多电子区（单电子晶体管，SET），让正对着它、沟道另一侧的那只工作在少电子区（量子点）。@fig-setqd 左画的是中间那一对栅的两种 SET–QD 配置之一。处在多电子区的 SET 与某个量子点（也就是比特）容性耦合之后，就能用来读出该量子点的信息：跨 SET 测到的漏电流上会出现库仑峰，量子点每进入一个电子，峰位就挪动一次。

#figure(
  image("fig/simulation.pdf", width: 95%),
  caption: [
    3 只串联柱塞栅的单行阵列的仿真与实验数据。左：室温转移特性，背栅偏压 $V _ "BG" = 0$、1、2 V，$V _ "DS" = 50 " mV"$。右：室温和低温下提取的阈值电压随背栅电压的变化。
  ],
) <fig-simulation>

#figure(
  image("fig/SDcomposite.pdf", width: 100%),
  caption: [
    左：二行器件上电荷探测配置的示意，用一只单电子晶体管来感知隧穿进量子点的电子。右：稳定图，画出在柱塞栅下方形成的被测量子点的少电子区。图中标号表示被测量子点的电子占据数。规则竖直跳变序列的中断，说明该量子点已被清空。为清楚起见，图中未画出存取栅。
  ],
) <fig-setqd>

SET 能够清楚探测到对面量子点进电子的那段电压窗口，因器件而异，甚至因栅而异。要扫整片晶圆，就得把每只柱塞栅对应的 SET 电压窗口围绕第一个可探测库仑峰 $V _ "first-peak"$ 调好，使 $V _ "first-peak" + 75 " mV" < V _ "SET" < V _ "first-peak" + 150 " mV"$；量子点一侧则用居中于 0 V 的 500 mV 栅压窗口（$- 250 " mV" < V _ "QD" < 250 " mV"$）。@fig-wafermap 左是按这套电压范围在 91 个 die 上采到的稳定图晶圆图。由于每片晶圆上 6 只柱塞栅都要各测一遍，一片晶圆共得到 546 张稳定图。由此可以定义器件层面的整体栅极良率，也就是少电子区是否达成——结果是 69 %，即 546 张图中有 377 张探测到了首个电子。

这个结果说明我们正在为 QSOI#super[®] 做的工艺修改方向是对的，量子阵列的良率可以做到很高。器件与测量两侧当然都还有余地。举例来说，改一版设计、把纳米线上 SET 探测器一侧与量子点一侧的间距缩小，可以增强两者容性耦合，从而抬高电荷探测信号；现有测量流程并没有去优化探测器灵敏度，把这一步加上良率还能再涨；继续优化工艺、压低离散度，全功能器件的良率同样有提升空间。

@fig-wafermap 右是那 69 % 器件的首电子栅压位置 $V _ "first-electron"$，直方图把所有二行阵列每只柱塞栅的结果合并统计。全部栅位与全部图形合起来，首电子位置为 21 mV ± 35 mV。据我们所知，这是晶圆尺度上报道过的最低的首电子位置离散度 @neyens_probing_2024。标准差这么小，意味着往后 $V _ "QD"$ 的扫描范围（这里取 500 mV）可以明显收窄，稳定图的数据点随之减少，测量吞吐率相应提高。更要紧的是，它说明整片晶圆上的静电环境离散小、可重复——这既有利于开发栅压标定流程 @zwolak_data_2024，也有利于做出量子比特特性可重复的大规模阵列。

#figure(
  image("fig/wafermapandhistogram.pdf", width: 100%),
  caption: [
    左：晶圆尺度上的电荷探测晶圆图，取的是一对相向柱塞栅之间的测量。只有 4 个 die 没有测到，因为按我们寻找首个库仑峰的协议它们被剔除了。每个 die 显示的都是柱塞栅 G3T 与 G3B 之间的结果。
    右：整片晶圆上首电子位置的直方图，统计器件所有可用的探测栅。
  ],
) <fig-wafermap>

每只柱塞栅的首电子位置拿到之后，我们又往前一步，对双量子点（DQD）的电荷探测采集二维图。做法是把 SET 的工作点调到电导最大处（电流对 SET 栅压的导数最大），然后围绕 0 V 扫 DQD 的两只栅。@fig-dqd 给出其中一张图：两个量子点做在相邻两只柱塞栅（G1B 与 G2B）下方，SET 做在正对 QD2 的 G2T 下方。势垒栅上加的是 0 V，所以两点耦合很弱。同类 QSOI#super[®] 器件的隧穿耦合可调范围已用专门实验量化过，结果见 @farnaud_iedm_2026。下一步是开发自动化流程，把电荷探测测量的灵敏度也一并调优。

#figure(
  image("fig/Doublequantumdotscomposite.pdf", width: 88%),
  caption: [
    (a)、(b) 分别为沿 QD1、QD2 方向的漏电流导数。沿 QD1（QD2）栅的电压扫描更快，以突出该栅上的电荷探测信号。
    (c) 所研究二行阵列的示意，含一只 SET 与两只量子点。
    (d) 电荷探测结果，画出位于柱塞栅 G1B 与 G2B 下方两只量子点各自的首电子位置。图中标号表示被测双量子点的电子占据数。
  ],
) <fig-dqd>

= 5 结论

本文在专为实现 28 nm FD-SOI 量子点而开发的工艺线上拿到 MOS 与 QD 的晶圆级结果，把 QSOI#super[®] 确立为量子比特器件集成的可靠技术基线。这一轮工艺改进带来更好的静电控制和更均匀的阈值电压，而这两点正是可重复地形成少电子量子点所必需的。首电子加载的统计结果显示器件之间的离散很小，说明量子点形成的均匀性高、晶圆上的无序程度低。这些结果确认，优化后的工艺能给出可扩展量子器件所要求的均匀静电环境。

除工艺开发本身，QSOI#super[®] 基线也为更深入的量子比特演示提供了可靠平台：硅自旋量子比特已经在这套工艺上做出，结果见 @farnaud_iedm_2026。这里展示的工艺成熟度与可重复性，是 28 nm FD-SOI 路线走向可扩展量子计算的重要一步。

= 致谢

本工作由 BPI iDémo 项目 Q100T（资助号 DOS0254912、DOS0254913）与 France 2030 计划下的 Proqcima 专项资助，并得到 EIC Transition 项目 MCSquare（101136414）和 JU CHIPS 项目 ARCTIC（101139908）的支持。感谢 Franck Barzic 与 Sylvain Sausse 操作探针台，感谢 Victor Doebele 与 Thomas Latella 在低温方面的支持，感谢 Matthieu Dartiailh 提供软件支持与开发，感谢 Jean-Charles Barbé 对本工作所做的学术审阅。

#set text(lang: "en")
#bibliography("refs.bib", style: "ieee", title: [参考文献])
