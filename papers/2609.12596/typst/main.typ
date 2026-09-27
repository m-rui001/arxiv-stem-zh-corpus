// 亚开尔文温区的晶圆低温探针测试 —— arXiv:2609.12596v1 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排。数据图与 SEM 保留原矢量 PDF、图注全译；
// 图 2（探针台剖面）与图 8（测量线路）按 D:\cetz-skill-release\SKILL.md 以 CeTZ 重绘。

#set document(title: "低于 1 K 的晶圆低温探针测试：常金属库仑阻塞温度计的晶圆级表征")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: 2em, spacing: 0.6em)
#set math.equation(numbering: "(1)")
#set heading(numbering: none)

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.2em, below: 0.4em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)
#show figure: set block(below: 1em)

#align(center)[
  #text(size: 15pt, weight: "bold")[低于 1 K 的晶圆低温探针测试：\ 常金属库仑阻塞温度计的晶圆级表征]\
  #v(4pt)
  #text(size: 10pt)[
    Lassi Lehtisyrjä #super[1]（通讯作者，#link("mailto:lassi.lehtisyrja@vtt.fi")[邮箱]），
    Renan P. Loreto #super[1]，
    Juho Luomahaara #super[1]，
    Jarno Järvinen #super[2]，
    Tuure Rantanen #super[1]，
    Juha Vikstedt #super[3]，
    Janne S. Lehtinen #super[1]，
    Matti Remes #super[3]，
    Timo Salminen #super[3]，
    Juuso Helander #super[3]，
    Aki Junes #super[3]，
    Pasi Aaltonen #super[3]，
    Vesa Henttonen #super[3]，
    Mika Prunnila #super[1] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 芬兰埃斯波，VTT 芬兰国家技术研究中心\
      #super[2] 芬兰赫尔辛基，Bluefors Oy\
      #super[3] 芬兰列托，AEM Afore Oy\
      Janne S. Lehtinen、Mika Prunnila：现任职于芬兰埃斯波 SemiQon Oy
    ]
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.12596v1 [cond-mat.mes-hall]，2026 年 9 月 11 日；中文译本编译于 2026-09-26]
]

#v(8pt)
#block(width: 92%, inset: (x: 1.6em), stroke: 0.6pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    近几年库仑阻塞温度计（Coulomb blockade thermometer，CBT）越来越受重视，原因是 1 K 以下的测温需求涨得很快——稀释制冷机在量子技术的研究和应用里已经成了标配。
    CBT 可以直接当一次温度计用，不必预先标定；标定之后也能退化成一只简单的电阻温度计做二次测温。
    量子器件和低温电子学的工艺正在走向规模化，低温晶圆表征手段也得跟着扩上去，才拿得到器件参数的统计数据。
    眼下低温器件的表征通量卡在传统低温恒温器上：换样慢、能同时放的样品又少，测几只器件的一轮流程就要花上好几天。
    本文用 CBT 在晶圆尺度上表征了新开发的 TiW/Al-$"AlO"_x$/TiW 常金属隧穿结工艺。
    在 300 mm 低温晶圆探针台（cryogenic wafer prober，CWP）中测得，整片 150 mm 晶圆上的片内电子温度低于 700 mK，这一结果由一次测温给出。
    可见 1 K 以下的晶圆级测试是条走得通的路：量子器件的高通量筛选、铝基超导电路直接在晶圆上被表征，都有了入口。
  ]
]
#v(6pt)

= 引言

量子技术要走向量子计算机这类实用系统，就得把大量量子元件集成在同一片晶圆上，低温电学测试也就必须跟着规模化。工艺控制和良率都离不开器件参数的统计数据，可低温表征至今仍是通量瓶颈：切片、贴装、引线键合、降温升温一轮走下来，一批样品要耗掉几天，而且传统低温恒温器一次只能塞下几个样品。

低温晶圆探针测试被看作大批量器件表征的机会，这件事 1980 年代就有人指出 @gearyCryogenicWaferProber1983；到 1990 年代，大规模超导电子学对测试的需求已经摆明了 @abelsonManufacturabilitySuperconductorElectronics1999。干式制冷机的进步加上量子计算兴起，推动了面向工业标准晶圆尺寸的商用设备落地 @MicroXactCryogenicProbe2026 @formfactorinc_IQ3000 @blueforsoyCryogenicWaferProber，其中一些已经在大规模量子器件表征中体现出价值 @neyensProbingSingleElectrons2024 @westWaferScaleCharacterizationSuperconductor2022 @pillarisettyHighVolumeElectrical2019 @candidoInvestigation300mmProcess2025 @contaminMethodologyEfficientCharacterization2022。

不少量子器件的性能对温度极为敏感，超导量子比特的几个关键品质因数就直接取决于热环境 @simbierowiczInherentThermalNoiseProblem2024b。稀释制冷机温区里电子–声子耦合很弱，芯片上的电子温度往往明显高于低温恒温器的读数 @wellstoodHotelectronEffectsMetals1994。要想量化量子器件与低温电路实际所处的热环境、要想读懂它们的行为，准确的片上测温是前提。

CBT 适合做低温片上测温，理由很实在：它能当一次温度计、制备不难、不需要外部标定、对磁场也不敏感 @pekolaCoulombBlockadebasedNanothermometry1998。已报道的 CBT 工作温区从 1 mK 以下一直拉到 60 K 以上 @meschkeAccurateCoulombBlockade2016 @samaniMicrokelvinElectronicsPulsetube2022。不过 CBT 器件的晶圆级低温表征，此前还没人做过。

以往的 CBT 几乎都拿铝隧穿结来做，因为铝的结性质确实好 @clarkeSQUIDHandbook2004。麻烦在于铝低于 $T _ "c" approx 1.2 " K"$ 就会超导 @cochranSuperconductingTransitionAluminum1958，所以铝基 CBT 要在 1 K 以下工作，通常得先压掉超导性——外加磁场、掺磁杂质 @jalkanenSuperconductivitySuppressionFeimplanted2005、或者做近邻效应工程 @koskiLaterallyProximizedAluminum2011a。这些手段既给片上测温添了麻烦，也让 CBT 难以和量子比特、超导量子干涉器件（SQUID）、单磁通量子（SFQ）电路、动生电感器件（KID）这类对磁场敏感的工艺放在一起 @rowerEvolution_1F_2023 @braginskiSuperconductorElectronicsStatus2019。

本文给出晶圆级常金属 CBT 器件，以及在 300 mm 低温晶圆探针台平台上完成的亚开尔文表征。器件本身就工作在正常态，做 CBT 一次测温不必再压制超导。据我们所知，这是在整片 150 mm 晶圆上完成 CBT 低温晶圆级表征的首例。一次测温给出的片上电子温度低于 700 mK，这同时也是低温晶圆探针台上由一次测温直接测到的最低片上温度。

= 背景

== CBT 理论

一个 CBT 是一张二维常金属隧穿结阵列，结之间由金属岛隔开：每行 $N$ 个结串联，共 $M$ 行并联。Pekola 在 1994 年首次说明 @pekolaThermometryArraysTunnel1994，CBT 可以看成弱库仑阻塞区（$E _ "C" << k _ "B" T$）下的两结单电子晶体管（SET），并按 SET 的正统理论建模，也就是 CBT 主方程。

阵列的充电能为
$ E _ "C" = 2 frac(N - 1, N) frac(e^2, 2 C _ Sigma) $ <eq-ec>
其中 $e$ 是电子电荷，$C _ Sigma$ 是岛屿总电容。前置因子 $2 (N - 1) slash N$ 来自 CBT 各岛屿的串联，$e^2 slash (2 C _ Sigma)$ 则是单个岛屿的电容充电能。电导比随直流偏压 $V$ 的变化为
$ G ( V ) slash G _ "T" = 1 - u _ N g ( frac(e V, N k _ "B" T) ) $ <eq-cond>
这里 $G _ "T"$ 是高偏压下的渐近电导，$u _ N = E _ "C" slash (k _ "B" T)$ 是无量纲参数，$k _ "B"$ 为玻尔兹曼常数，$T$ 为电子温度，而 $g ( x ) = ( x sinh ( x ) - 4 sinh^2 ( x / 2 ) ) / ( 8 sinh^4 ( x / 2 ) )$。这样零偏压附近会出现一个钟罩形的电导凹陷，其半高全宽给出一测温关系
$ V _ "1/2" approx 5.439 N k _ "B" T slash e $ <eq-vhalf>
右边只含 $N$、基本常数和温度，因此完全不需要标定。

零偏压处电导凹陷的相对深度 $Delta G slash G _ "T"$ 为
$ Delta G slash G _ "T" = u _ N slash 6 $ <eq-secondary>
一旦 $E _ "C"$ 与 $G _ "T"$ 由一次测量定下来，这条就是二次测温的关系式。

想把主方程的适用范围往中间库仑阻塞区（$E _ "C"$ 与 $k _ "B" T$ 相当，即更低的温度）延伸，得引入高阶修正，相关结果见 @farhangfarOneDimensionalArrays1997。进入这一区间后，随机的背景电荷会明显影响实测电导 @feshchenkoPrimaryThermometryIntermediate2013。

CBT 测的直接就是金属岛里电子的温度。若要做通用测温、关心的是声子浴温度，电子和声子必须热化得足够好。这一假设对本文器件是否成立，附录 B 有讨论。

== 低温晶圆级测试

晶圆级测试（wafer-level testing，WLT）在切片封装之前直接对晶圆上的器件做电学表征，通量高、可自动化，统计上能覆盖整片晶圆。把 WLT 延伸到低温，对量子器件的吸引力越来越大，难点也是实打实的：探针台要压住机械运动、热辐射和电气走线带来的热负载，才能把温度稳在目标值；同时还得抑制电磁干扰，并保证探针接触准确、可重复、能自动定位。

机械上，探针要能在三个空间维度上以微米级精度、亚度级角精度定位。降温时各部件热收缩不一致，对准关系会被破坏，所以必须有主动对准和补偿流程。晶圆上的温度均匀性同样关键：晶圆与卡盘热接触不均会形成温度梯度，环境和探针接触引入的热负载也一样，两者都会给被测器件（device under test，DUT）的温度带来系统误差，因此热环境要仔细设计，温度要主动控制，晶圆上还要布传感器。

= 实验方法

== 器件实现

本文采用 @luomahaaraScalableNonsuperconductingTunnel2026 提出的 CBT 设计与 TiW/Al-$"AlO"_x$/TiW 常金属–绝缘层–常金属（NIN）结工艺，结的标称尺寸为 $0.95 times 0.95 " µm"^2$，阵列规模 $N times M = 61 times 20$。CBT 阵列局部的扫描电子显微照片见 @fig-device。实验只用一片晶圆，上面共有 24 个 $20 times 20 " mm"$ 的曝光场（reticle），每场一只 CBT，焊盘布局按探针卡的要求设计。器件设计与制备细节见附录 A。

结工艺完成后还要追加若干工序，器件才能上探针台测试。先以等离子体增强化学气相沉积（PECVD）生长 $250 " nm"$ 的 $"SiO"_x$ 钝化层，再刻接触孔把 CBT 岛屿露出来；随后在岛屿和接触焊盘上沉积 $20 " nm"$ TiW 与 $300 " nm"$ 铜作种子层，电镀生长 $10 " µm"$ 铜。24 个曝光场中只有 12 个做了电镀。铜在这里有两个用处：体积大、电子–声子耦合常数高，电子热化得好；质地软，探针接触一致、接触电阻低。室温下对全片测试结做探针测量，得到平均比结电阻 $1.988 " kΩ·µm"^2$。

#figure(
  image("fig/SEM.pdf", width: 58%),
  caption: [
    (a) CBT 阵列局部的扫描电子显微照片。每个金属岛的横向标称尺寸为 $20 times 45 " µm"$，岛屿的铜金属化层厚 $10 " µm"$。高亮区域是相邻两岛之间的单个隧穿结。(b) 该 CBT 阵列的电路表示：每行 $N$ 个结串联，共 $M$ 行并联。
  ],
) <fig-device>


== 低温晶圆探针与电导测量

#figure(
  include "fig/cwp.typ",
  caption: [
    低温晶圆探针台（CWP）的剖面示意，画出嵌套辐射屏蔽罩，以及 ³He 制冷级与晶圆卡盘、探针卡之间的热耦合；电气走线与晶圆对准的光学通道也一并标出。（译者注：原图为位图，此图以 CeTZ 重绘。）
  ],
) <fig-prober>

测量在 Bluefors 与 AEM Afore 联合开发的无液氦低温晶圆探针台 @blueforsoyCryogenicWaferProber 上进行，该平台可容纳最大 $300 " mm"$ 晶圆。本文所用系统装配的是尚未商用的辐射屏蔽与热化方案，标定过的电阻温度计读到的标称卡盘温度约 $600 " mK"$；也正是这套屏蔽配置，使得晶圆无法经负载锁自动传输。CWP 的剖面示意及其主要热、机械部件见 @fig-prober。

器件的 CBT 响应由四端、电压偏置的标准锁相方式测得，即测微分电导随源漏直流偏压的变化。CWP、仪器、实验搭建与探针流程的详细描述见附录 B。

= 结果与讨论

对 12 只镀铜 CBT，在 $V _ "SD" = ± 350 " mV"$ 范围内、以 $1 $ mV 峰峰值的交流激励测量微分电导。测量在 $0.60$、$1.05$、$1.25$、$1.45$、$1.65$、$1.95 $ K 这六个标称卡盘温度下进行。存在明显过量噪声的数据不进入相应分析，因此各温度点上保留的器件数目并不相同。全部原始数据（含被剔除者）都放在支持数据集 @lehtisyrjaeCryogenicWaferProbingZenodo2026 中。@fig-Gcomp 给出曝光场 (1,3) 的器件在 $1.95 $ K 下的典型响应，钟罩形的库仑阻塞凹陷清晰可见。但数据同时显示出一条随偏压变化的背景电导，偏压越高、温度越高它越显眼。这条背景会扭曲 CBT 凹陷的形状，主方程拟合和参数提取都不可靠，所以做测温分析之前必须先把它处理掉。

#figure(
  image("fig/fig1_background_compensation.pdf", width: 100%),
  caption: [
    $T _ "chuck" = 1.95 " K"$ 下，曝光场 (1,3) 处 CBT 的微分电导随源漏偏压的变化。@eq-simmons 的复合模型对整条扫描曲线拟合；虚线是拟合出的随电压变化的背景，把数据除以这一背景因子即得补偿后的电导，补偿数据上再叠出拟合的 CBT 主方程分量。插图是把扫描范围扩到 $V _ "SD" = ± 2.25 " V"$ 的结果，可以看出小幅度扫描里并不明显的电导非线性。
  ],
) <fig-Gcomp>

== 背景电导补偿、主方程拟合与晶圆图

背景电导来自隧穿势垒高度有限等非金属性效应，别的 CBT 工作里也见过 @meschkeAccurateCoulombBlockade2016 @koppinenCompleteStabilizationImprovement2007 @hirviOneDimensionalArrays1997。有限势垒通常用 Simmons 框架描述 @simmonsGeneralizedThermalJV1964。标准 Simmons 模型并不足以描述实测背景，于是我们改用一个经验性的复合模型：把 CBT 响应乘上一个关于偏压对称的背景因子
$ G ( V ) = G _ "CBT" ( V ) lr(1 + alpha | V - V _ o |^ n) $ <eq-simmons>
其中 $G _ "CBT" ( V )$ 是主方程 @eq-cond 给出的电导，$alpha$ 是比例因子，$V _ o$ 是实测数据中确实存在的偏移电压，指数 $n$ 限制在 $0.5 <= n <= 2$。这个范围有物理依据：随偏压变化的背景电导由几种叠加的机制共同造成——金属–绝缘层界面的杂质散射给出平方根依赖（$n = 0.5$）@altshulerZeroBiasAnomaly1979，非弹性隧穿给出线性背景（$n = 1$）@kirtleyLinearConductanceBackgrounds1992，弹性隧穿的标准 Simmons 模型给出二次依赖（$n = 2$）@simmonsGeneralizedThermalJV1964。真实器件的电极材料不完美、氧化物介电层无序，$n$ 落在中间值就说明这几种机制同时存在：除直接弹性隧穿外，势垒内以及电极–势垒界面上的陷阱态和杂质所辅助的跳跃隧穿也在贡献电导 @bermonConductancePeaksProduced1978 @glazrnanInelasticTunnelingThin1988 @xuDirectedInelasticHopping1995 @moranTransportPropertiesUltrathin2003。

@eq-simmons 的复合模型对每条实测曲线分三步拟合。第一步，在阈值电压 $V _ "th" = ± 2 times V _ "1/2"$ 之外取数据点，估出背景参数 $alpha$ 与 $n$（连同 $G _ "T"$）——那里主方程 @eq-cond 描述的库仑阻塞项已衰减到可忽略的水平。第二步，冻结背景参数，拟合 CBT 参数（$T$、$C _ Sigma$ 和 $V _ o$）。第三步，以前两步的结果作初值，用 @eq-simmons 对全部实测电导做整体拟合，得到最终参数值及其不确定度。@fig-Gcomp 画了一次典型的拟合结果：背景贡献（@eq-simmons 中的因子 $1 + alpha | V - V _ o |^ n$）以虚线表示；把测量数据除以这条背景拟合就得到补偿后的电导，再叠上主方程拟合 $G _ "CBT"$。

背景模型与拟合是否自洽，可以从提取出的隧穿电阻 $R _ "T,array"$ 稳不稳来看：在 $0.6 $ K 到 $1.95 $ K 整个温区内，每只器件的变化都不到 ±0.1 %（@fig-parameters(c)）。温度越高，补偿越不精确——凹陷被展宽，落在凹陷之外的数据点又有限，背景参数与 CBT 参数之间的相关性随之上升，指数 $n$ 的不确定度尤其明显。

我们又拿曝光场 (1,3) 的器件、把扫描范围扩到 $V _ "SD" = ± 2.25 " V"$（每结约 $37 " mV"$）来检验模型。这时模型给出 $n approx 1.4$ 的良好拟合，结果见 @fig-Gcomp 的插图。

#figure(
  image("fig/fig2_dips_wafermaps_0p6K.pdf", width: 100%),
  caption: [
    (a) $T _ "chuck" = 600 " mK"$ 下各被测 CBT 经电压背景补偿后的归一化微分电导，实线是用于一次测温的三阶 CBT 拟合，为清楚起见各曲线在竖直方向作了平移。(b)、(c)、(d) 分别为拟合得到的电子温度 $T _ "CBT"$、充电能 $E _ "C"$ 与阵列总电阻 $R _ "T,array"$ 的晶圆图。
  ],
) <fig-dips>

我们的 CBT 主方程模型以 @yurttagulIndiumHighCoolingPowerNuclear2019 的 Python 实现为基础，针对本文数据集做了改动。本文测量里器件始终稳稳落在普适区（$k _ "B" T slash E _ "C" > 1$），用主方程提取 CBT 参数因此是站得住的。

@fig-dips (a) 是标称卡盘温度 $600 " mK"$ 下补偿后的电导数据与对应的主方程拟合，所有器件都拟合得很好。提取出的片上电子温度 $T _ "CBT"$、充电能 $E _ "C"$ 与总隧穿电阻 $R _ "T,array"$ 以晶圆图画在 @fig-dips (b)–(d)，可以看出这三个量在整片 $150 $ mm 晶圆上如何分布。$T _ "CBT"$ 的分布与之前在 CWP 上测到的局部温度起伏一致：探针台在器件间移动时辐射热负载会略有变化，而这些差异也在 CBT 测温的典型不确定度之内 @hahtelaInvestigationUncertaintyComponents2013。$R _ "T,array"$ 与 $E _ "C"$ 的空间变化，则与 SWAPS 隧穿结工艺中器件之间结尺寸和势垒性质的差异相符。

== 提取参数的温度依赖

完整的参数提取在六个卡盘温度点上都做了，结果汇总在附录 C 的 @fig-fulldata；参数的温度依赖归纳在 @fig-parameters 中。

#figure(
  image("fig/fig3_params_vs_T.pdf", width: 100%),
  caption: [
    提取参数的温度依赖。(a) CBT 充电能 $E _ "C"$；(b) CBT 与卡盘温度的相对差 $( T _ "CBT" - T _ "chuck" ) slash T _ "chuck"$；(c) 隧穿电阻相对 $600 $ mK 值的变化 $Delta R _ "T,array" slash R _ "T,array"$，三者均随卡盘温度 $T _ "chuck"$ 画出，覆盖全部被测 CBT。箱线图展示器件数足够的各温度点上的参数分布：中线为中位数，箱体为 25 至 75 百分位；圆点与虚线画出单只 CBT 及其随温度的变化。
  ],
) <fig-parameters>

充电能 $E _ "C"$（@fig-parameters(a)）随温度有些起伏，但现有数据还不足以断定所有器件存在统一的趋势。非晶 $"AlO"_x$ 介电层的介电常数随温度改变，是这一温区公认会影响结电容的机制之一 @sedehFinitebiasCoulombBlockade2025 @fritzCorrelatingNanostructureAloxide2018。

拟合出的片上温度 $T _ "CBT"$（@fig-parameters(b)）始终高于卡盘设定值 $T _ "chuck"$，相对差值却大致恒定。可能的来源包括残余辐射加热、晶圆与卡盘热接触不完美、复合模型拟合本身的不确定度，以及卡盘电阻温度计的标定偏差或位置偏差。

阵列总电阻 $R _ "T,array"$（@fig-parameters(c)）在测量温区内每只器件变化不到 ±0.1 %，这正是 NIN 隧穿结远低于热激活输运能标时应有的表现，也印证了所用主方程模型的适用性。$R _ "T"$ 不随温度变，还是 CBT 能当二次温度计用的前提——这样零偏压电阻才会只因库仑阻塞而变化。

== 热化过程中的二次测温

每只 CBT 从探针接触到开始完整微分电导扫描之间，零偏压电导一直被记录着，于是可以用二次 CBT 测温盯着热化过程。凡是移动过卡盘，都等 5 min 再测，因为卡盘运动会带来瞬时升温，在最低的几个设定温度上最明显。@fig-thermalization 画出卡盘设定 $600 " mK"$ 时四只 CBT 的热化曲线：零偏压电导按二次关系 @eq-secondary 换算成温度，所用参数取自 @fig-dips 的主方程拟合。

#figure(
  image("fig/fig4_cooldown_600mK.pdf", width: 92%),
  caption: [
    卡盘温度设定为 $600 " mK"$ 时，曝光场 (4,1)、(5,2)、(4,3)、(1,3) 四只 CBT 的片上温度随探针接触后时间的变化。圆点是片上 CBT 温度；虚线是电阻温度计记录的卡盘温度；每种颜色对应一次探针落针。
  ],
) <fig-thermalization>

结果说明测温前留 $5 " min"$ 热化时间是够的。片上 CBT 温度跟着卡盘温度走、时间常数相近，可见晶圆与卡盘的热接触良好。热化结束后，二次温度与一次测温结果也吻合得很好，尽管一次温度扫描期间卡盘仍在缓慢降温。

== 意义与影响

我们借助库仑阻塞温度计，在晶圆尺度上表征了 TiW/Al-$"AlO"_x$/TiW 常金属隧穿结。器件良率高、在低温晶圆探针台上亚开尔文工作可靠，片上电子温度低于 700 mK——据我们所知，这是低温晶圆探针台上有报道的最低值。铝的超导临界温度约 1.2 K，700 mK 远低于它，这就为铝基超导电路和约瑟夫森结器件的晶圆级直接表征打通了路，连铌基量子比特也有可能直接测 @anferovSuperconductingQubits202024。更一般地，这项工作说明亚开尔文的自动化晶圆级量子器件表征是可行的；量子制造要上规模，统计工艺控制和良率指标都得靠这类工具。

除了测温，晶圆上结充电能 $E _ "C"$ 与隧穿电阻 $R _ "T"$ 的分布本身就是结尺寸和势垒性质的晶圆级统计信息，过去只能靠破坏性截面分析或单器件研究才拿得到。再在 Simmons 框架里多做一步，还能提取有效势垒参数 @simmonsGeneralizedThermalJV1964。像本文这样偏离标准 Simmons 预测的结果，本身就在提示材料里的非金属性缺陷。这些信息只靠简单的直流测量就能得到，所以基于 CBT 的表征有希望成为结工艺监控与开发的常规工具。

= 致谢

感谢 Nikolai Yurttagül 就 CBT 建模与物理进行的有益讨论，并感谢我们分析软件所基于的 Python 库；感谢 Alberto Ronzani 就实验方法进行的讨论。本工作受欧盟 Horizon RIA 与 EIC 计划资助（课题号 824109，European Microkelvin Platform；101113086，SoCool；101113983，Qu-Pilot），并获芬兰研究委员会资助（课题 350667，Femto；336817，QTF 卓越中心；374172，QMAT 卓越中心）。此外还得到 Business Finland（CryoTherm 项目与课题 128291，Quantum Technologies Industrial，QuTI）、芬兰技术产业百年基金会以及 Chips 联合执行体（课题 101139908，ARCTIC）的支持。

= 数据可用性

支持本文结论的数据已在 Zenodo 公开，见 @lehtisyrjaeCryogenicWaferProbingZenodo2026。

= 附录 A：器件设计与制备

高质量的结工艺，要求通过精确定义结尺寸与沉积隧穿势垒来控制结电阻和结电容，这是取得高良率、可重复性能与低测温不确定度的关键 @pekolaInfluenceDeviceNonuniformities2022。我们的结制备基于侧壁钝化工艺（sidewall passivated process，SWAPS）@gronbergSidewallSpacerPassivated2017，并把它改造成可在晶圆尺度上做 NIN 隧穿结的版本：三层结以钛钨（TiW）为电极、原位氧化的铝（$"AlO"_x$）为隧穿势垒。我们最近已证明这类结无需外加磁场即可本征保持在正常态，一直做到 $20 " mK"$ @luomahaaraScalableNonsuperconductingTunnel2026。SWAPS 工艺此前在众多超导隧穿结器件上已经证明过性能、均匀性与可扩性 @kivirantaTwoStageSQUIDAmplifier2021 @hatinenEfficientElectronicCooling2024 @perelshteinBroadbandContinuousVariableEntanglement2022。

目标工作温区决定所需的 CBT 充电能，也就决定了结电容与结尺寸。给定 CBT 的温度上限由电导测量的分辨率决定，具体说是可分辨的最小凹陷幅度；而在普适区工作的温度下限，出现在 $k _ "B" T$ 接近 $E _ "C"$ 的时候。再往下进入中间库仑阻塞区，有限充电效应开始显著，随机背景电荷也会明显影响实测电导 @giazottoOpportunitiesMesoscopicsThermometry2006 @feshchenkoPrimaryThermometryIntermediate2013。因此单只 CBT 的实际动态范围大约是 $10^2$ 到 $10^3$ 倍。

实用 CBT 器件通常采用二维隧穿结阵列，每行 $N$ 结串联、共 $M$ 行并联。串联的结按 @eq-vhalf 把电导凹陷展宽，同时提高对电压噪声、电磁干扰、静电放电以及偏移电压（例如热电动势造成的）的抵抗力。并联行数决定阵列总阻抗，电压偏置测量一般取 $100 "kΩ"$ 左右，并降低对结电阻局部起伏与随机偏移电荷分布的敏感度 @yurttagulCoulombBlockadeThermometry2021。

= 附录 B：实验搭建与流程

Bluefors 与 AEM Afore 开发的低温晶圆探针台用 $50 " K"$ 与 $4 $ K 两级脉管，末级由 ³He 制冷级实现亚开尔文降温。软铜编织带把 ³He 级与晶圆卡盘、探针卡支架在热路上连起来，以减小晶圆与探针之间的温度梯度（@fig-prober）。卡盘与探针卡的温度由电阻温度计监测，读数交给 Bluefors 温度控制器 @EnhancedUserExperience。

晶圆对准的视觉通道由显微镜加上贯穿外真空容器与屏蔽罩的观察窗提供。室温观察窗配有气动快门，测量期间保持关闭，以压低辐射热负载并避免环境光造成干扰。

与晶圆上 DUT 的电接触靠一张探针卡完成：共 16 支钨悬臂梁式探针，排成两列交错阵列，间距 $500 " µm"$。

制冷机内到探针卡的走线用 Bluefors 标准磷青铜双绞多芯线束 @blueforsoyTwistedPairWiring2021，共 24 芯、线规 $36 " AWG"$，每一级都做了热锚定。导线经气密 Fischer 连接器穿出外真空容器，连接器外侧用屏蔽双绞多芯电缆接出一只 BNC 转接盒。$1 $ K 法兰上串装一只截止频率 $100 " kHz"$ 的低温 π 型低通滤波器，该法兰同时容纳全部探针卡接口。

测量线路是标准的锁相微分电导四端接法：CBT 上的电压信号由独立于偏置的线路读出。测 $d I slash d V$ 时，在扫描的直流偏压上叠加一个小交流激励，逐点测量 CBT 上的交流电流与电压响应。

交、直流偏压合由 Lake Shore 155 I/V 源产生。交流电流响应经 Basel Precision Instruments SP983c 电流–电压转换器放大，输出送入 Zurich Instruments MFLI 锁相放大器读取；CBT 上的交流电压由第二台 MFLI 测量。所有测量都用 $1 " mV"$ 峰峰值交流激励：它在任何温度下都不超过 $V _ "1/2"$ 的 1 % 左右，不会把 CBT 凹陷抹平（@eq-vhalf），同时又给锁相提供了足够的信噪比。交流激励频率统一取 $63 " Hz"$，这是总测量噪声最低的频点——离 $1 slash f$ 噪声拐点够远，也避开 $50 " Hz"$ 工频及其谐波。测量线路示意见 @fig-meas。

#figure(
  include "fig/meas.typ",
  caption: [
    低温晶圆探针台上微分电导测量线路的示意。（译者注：原图为矢量 PDF，此图以 CeTZ 重绘。）
  ],
) <fig-meas>

CBT 阻抗较高，走线上的电容性噪声拾取需要专门处理。制冷机所在的是工厂生产环境，电机及其驱动等设备会通过电源和空间传导、辐射电磁干扰（EMI）。我们采用屏蔽良好的室温多芯双绞电缆与 BNC 转接，并全程校核屏蔽连续性。接地方案经过仔细优化，星形接地噪声最低：制冷机用大截面电缆单独接地，每台仪器各自接地，所有接地都汇到 BNC 转接盒机壳，机壳再经 Lake Shore 155 前面板的一个连接器接保护地。探针卡 16 针中只有 4 针用于四端测量，其余悬空；为抑制这些线路拾取噪声，转接盒上对应的每个接头都盖上 BNC 端帽。

进入制冷机的所有测量线都经 $1 $ K 法兰上的低温 π 型低通滤波器，截止频率 $100 " kHz"$。该频率远高于交流激励频率，测量信号不受影响，而沿走线从室温电子学导入或从环境拾取的高频 EMI 则被衰减。滤波器引入的串联电阻很小，在四端接法下无关紧要。

晶圆探针流程如下。晶圆手工装到卡盘上，粗略对位后用三枚边缘压块固定；随后装配辐射屏蔽罩并封闭外真空容器。晶圆的旋转对准由卡盘的旋转台完成，接着示教曝光场内 DUT 的坐标，并用专用边缘传感探针确定初始接触高度（该探针检测与晶圆表面的接触）。后续测量期间关闭边缘传感器，因为它的电路会向测量引入噪声。晶圆图、曝光场布局与 DUT 坐标都在 Afore 探针台控制软件 Hermes 中定义。仍在室温下，先验证自动步进到每个 DUT，并用 Keysight 34465A 数字万用表做两线电阻测量，确认探针与样品之间欧姆接触。然后抽真空、开脉管，为降温做准备；启动 ³He 循环把系统拉到底温。到温后复核晶圆导航与接触高度，补偿热收缩不一致造成的漂移。

探针接触质量在不同 DUT 与不同温度点上有波动，部分测量因接触差而存在过量噪声，被排除在分析之外。低温下拿到可靠的探针接触本就是公认难题：室温已知接触电阻很低的探针–焊盘界面，不能假定在低温下依然低。这一行为的机理本文没有表征，文献中也未见报道。相邻领域给出的一个可能解释是接触焊盘材料在低温下硬化 @iwabuchiDevelopmentVickerstypeHardness1996，这会恶化探针–焊盘界面的接触电阻 @naglerImprovedModelElectrical2019。

卡盘温度在探针台底温（约 $600 " mK"$）与 $1.95 " K"$ 之间变化，后者是 ³He 循环不过载所能达到的上限。每个设定温度点都由 Bluefors 温度控制器的 PID 控温稳住。

一次与二次 CBT 测温能用作热化的实时监视，前提是 CBT 岛屿里的电子温度紧跟局部声子浴温度。本文所达温区内，电子–声子热流足够强，电子系统相对声子浴的热化远快于测量时间尺度。电子–声子耦合弱导致的电子温度饱和现象，只在几乎同样的器件 @luomahaaraScalableNonsuperconductingTunnel2026 和同类 CBT @meschkeElectronThermalizationMetallic2004 上约 $20 " mK"$ 以下被观察到，远低于本文温区。交流与直流激励的焦耳加热带来的热负载，在这一温区估计并不显著。因此当前测量条件下电子过热可以不予考虑，CBT 电子温度应能准确反映各测量点晶圆上的局部声子浴温度。

= 附录 C：完整数据集

剔除噪声测量后剩余的补偿电导数据，以及各卡盘温度点上复合模型拟合提取的参数，全部画在 @fig-fulldata。$600 " mK"$ 的数据不再重复，见 @fig-dips。

#figure(
  image("fig/fig5_full_dataset.pdf", width: 100%),
  caption: [
    卡盘温度 (a) $1.05 $ K、(b) $1.25 $ K、(c) $1.45 $ K、(d) $1.65 $ K、(e) $1.95 $ K 下的补偿电导数据与提取的 CBT 参数晶圆图。
  ],
) <fig-fulldata>

#v(1em)
#set text(lang: "en")
#bibliography("refs.bib", style: "american-physics-society", title: [参考文献])
