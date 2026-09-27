// InP 上 Nb 超导谐振器的埋底界面制备效应 —— arXiv:2609.13673 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排。数据图保留原矢量 PDF、图注全译。
// lane-B。临时渲染文件前缀 _b。

#set document(title: "InP 上 Nb 超导谐振器的埋底界面制备效应")
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

#align(center)[
  #text(size: 15pt, weight: "bold")[InP 上 Nb 超导谐振器的埋底界面制备效应]\
  #v(4pt)
  #text(size: 10pt)[
    Logan S. Kusher #super[1]，Ding Peng #super[2]，Zihua Zhu #super[2]，
    Arunav Bordoloi #super[1]，Axel Leblanc #super[1]，Lukas J. Baker #super[1]，
    Nichae Adnan #super[1]，Jacob Issokson #super[1]，Alvin Wang #super[1]，
    Frederik Knudsen #super[1]，Krishna Dindial #super[1]，Melissa Mikalsen #super[1]，
    Taha Kaleem #super[1]，Andrei Vrajitoarea #super[1]，Yingge Du #super[2]，
    Patrick J. Strohbeen #super[1,#3]，Javad Shabani #super[1,#4] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 美国纽约大学量子信息物理中心\
      #super[2] 美国太平洋西北国家实验室\
      #super[3] P. J. S. 现于麻省理工学院电子学研究实验室\
      #super[4] 通讯作者：jshabani\@nyu.edu
    ]
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.13673 [quant-ph]；中文译本编译于 2026-09-26]
]

#v(8pt)
#block(width: 100%, inset: (x: 1.5em, y: 1.1em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    衬底表面处理是电子器件制造中的关键一步。在 GaAs、InP 一类的 III–V 半导体平台（HEMT 与激光器都用它）上，去除衬底原生氧化物尤其要紧，除得不干净会直接拖累后道器件性能。但在与量子信息应用相关的混合超导–半导体（S–Sm）体系中，衬底处理的影响还远没有弄清楚。本工作比较了在 InP 上溅射沉积 Nb 薄膜前的三种表面处理：（i）不刻意去氧的对照样品；（ii）原位 Ar⁺ 离子刻蚀；（iii）硫钝化。原位 Ar⁺ 刻蚀确实降低了金属–衬底（MS）界面的氧浓度，但同时把 InP 表面刻粗糙，使 Nb–InP 界面的等效厚度增加，还借助 Nb 薄膜中的扩展缺陷促进了氧的掺入。硫钝化在抑制界面氧方面更有效，同时保住一个更锐利、更平滑的埋底界面；用它做出的 Nb 薄膜超导转变温度更高，结构损伤也比 Ar⁺ 刻蚀样品更轻。尽管材料指标有这些改善，三种处理样品的微波响应不相上下。在单光子功率下，内品质因子 $Q _ upright("i")$ 的最高值分别约为：对照样品 $1.30 times 10^5$，硫钝化样品 $9.7 times 10^4$，Ar⁺ 刻蚀样品 $8.4 times 10^4$。这些结果说明，这批器件并非主要受限于埋底 Nb–InP 界面的介质损耗。相反，激进的除氧工艺会引入额外损伤、反而拉低性能；主导的微波损耗更可能来自衬底、准粒子或封装等其他通道。
  ]
]
#v(6pt)

= 1 引言

有损界面区是超导谐振器与量子比特中微波耗散的一个主要来源 @gao2008experimental @wang2015surface @woods2019determining @mcrae2020materials。在毫开温度、单光子功率下，寄生的两能级系统（TLS）引起的共振吸收是对这类损耗最突出的解释。TLS 的微观起源仍在活跃研究中，已有工作把它同非晶材料与原生氧化物、吸附污染物、光刻残留以及工艺改变过的界面层联系起来 @martinis2005decoherence @gao2008experimental @muller2019tls @bal2024encapsulation @verjauw2021oxide @quintana2014microfab @murthy2022tofsims @pearton1990ion。在平面超导电路中，感兴趣的微波模集中在金属边缘附近，与纳米尺度的有损层强烈重叠，于是金属–空气（MA）、衬底–空气（SA）、金属–衬底（MS）三个界面各自的损耗贡献可以超过体内材料 @wenner2011surface @wang2015surface @woods2019determining @calusine2018analysis。

以往关于界面微波损耗的工作大多集中在暴露的 MA 与 SA 界面上。开槽（trenching）能降低 SA 界面在高场区的参与率 @bruno2015reducing @calusine2018analysis；表面钝化与封装能抑制暴露 MA 界面原生氧化物的再生 @bal2024encapsulation @chang2025noble @gupta2026nbpassivation；更换超导金属——最典型的是改用 Ta——也能通过表面化学的改变提升相干性 @place2021tantalum @chang2025noble。相比之下，埋底的 MS 界面要研究和控制起来难得多：界面一旦形成，就没法再像暴露的 MA/SA 界面那样清洗、盖帽或做化学改造，其性质在沉积发生之前就已经由衬底表面状态、沉积前处理和超导薄膜的初始形核决定了。

这个埋底界面对混合超导–半导体量子器件尤其相关。在平面 Al–InAs 异质结构中，超导近邻效应在二维电子气内形成一个门压可调的约瑟夫森结 @shabani2016prb。基于这种电压控制结的量子比特（常称 gatemon）在平面 InAs 2DEG 器件上报告的能量弛豫时间从几百纳秒到约 $2 " μs"$ 不等 @casparis2018gatemon @strickland2024losses。作为对照，Al–InAs 纳米线 gatemon 达到 $T _ upright(1) = 5.3 " μs"$ @casparis2016gatemon，Sn–InAs 纳米线 transmon 达到 $T _ upright(1) = 26.9 +- 0.7 " μs"$ @purkayastha2025sn。

Al–InAs 与 Sn–InAs 纳米线器件之间的这一差距，与 Al–InAs 界面处（或其附近）存在可观耗散的图像相吻合 @casparis2016gatemon @purkayastha2025sn。而从 Al–InAs 纳米线器件到平面器件 $T _ upright(1)$ 的进一步下降，则指向外延异质结构带来的附加损耗，包括结构缺陷与失配位错 @casparis2018gatemon @strickland2024losses @liu2026strongly；半导体弱链内部的耗散可能是又一项贡献 @sun2026junction。

InP 衬底还给平台引入一条额外的损耗通道：它是压电材料。微波电场可以耦合到声学模上，把能量辐射进衬底 @scigliuzzo2020phononic @yang2023piezoelectric。在高阻 Si 和蓝宝石这类常用低损耗衬底上，这条通道要弱得多甚至不存在 @scigliuzzo2020phononic @yang2023piezoelectric；在 GaAs 中也观察到类似的压电辐射损耗，它能把超导谐振器的品质因子压住 @scigliuzzo2020phononic。因此压电耦合可能给 InP 上器件设置一个衬底层面的天花板，估计值对应约 10 μs @scigliuzzo2020phononic。但平面 gatemon 实际远短于该值的 $T _ upright(1)$ 提示，现在的器件更可能受限于埋底界面、异质结构、栅极或半导体弱链带来的额外损耗。

gatemon 的整个叠层里可能的耗散源太多，直接从量子比特测量中分离主导机制很困难。所以我们研究一个简化的超导–InP 体系，把埋底的超导–衬底界面从栅极与半导体弱链等额外复杂性中隔离出来。此前在 InAs/InP 异质结构上对 Al 基谐振器的测量给出低功耗内品质因子最高约 $4 times 10^4$ @strickland2024losses。我们选 Nb 而不是 Al：Nb 的超导能隙更大，对未来 InAs/InP 混合器件更有前景，而且它在超导微波电路中本来就使用广泛 @bal2024encapsulation。

#figure(
  include "fig/losschannels.typ",
  caption: [溅射 Nb/InP 制备的 CPW 谐振器中的微波损耗通道示意。上排为 CPW 芯片的三维渲染，下排为（a）–（c）三种实验薄膜结构的剖面示意，标出的可能损耗通道包括 Nb 晶界、非晶 MS 界面、原生氧化物以及 InP 衬底中的压电损耗。（a）直接溅射在 InP 上的 Nb：InP 表面原生氧化物留在埋底 MS 界面处，构成非晶界面区。（b）Ar⁺ 刻蚀后溅射的 Nb/InP：离子刻蚀去掉了原生氧化物，但把原本已是非晶的 MS 界面刻得更粗糙。（c）硫钝化 Nb/InP：化学处理并以硫层钝化去掉了原生氧化物、抑制再氧化，同时保住比 Ar⁺ 刻蚀更平滑的埋底界面。],
) <fig-fig1>

本文考察埋底 Nb–InP 界面对所得 Nb 薄膜微结构、超导输运行为和微波损耗的影响。为此比较三种衬底处理（如 @fig-fig1 所示）：直接取用（as-received，对照）、Ar 离子刻蚀、硫钝化 @lee2019facile。衬底处理后，用直流磁控溅射（AJA International Inc.）在室温沉积 Nb 薄膜。刻蚀样品的刻蚀与沉积在同一高真空溅射腔内完成（本底压强约 $5 times 10^-9 " Torr"$），以保持 MS 界面洁净；此处报告的离子刻蚀在 3 mTorr 动态 Ar 压强、25 W 等离子体功率下进行。硫钝化样品的湿法处理在与溅射腔同楼的洁净室酸柜中完成：衬底先在稀缓冲氧化物刻蚀液（10 mL Transene BOE 6:1 原液配 70 mL 去离子水）中刻 30 s，随后迅速转入 10 % 的 $( "NH"_4 )_2 "S"$ 水溶液（Thermo Fisher Scientific）做硫钝化，再进行 Nb 沉积。用飞行时间二次离子质谱（ToF-SIMS）测量 Nb 薄膜、埋底界面及下方衬底的化学成分；用非原位原子力显微镜（AFM）评估晶粒结构随衬底处理的变化；用截面扫描透射电子显微镜（STEM）、STEM 能谱（EDS）与基于聚类的 4D-STEM 晶粒成像考察埋底界面、薄膜结构、晶粒与非晶区以及富氧区。最后，把这些材料制成共面波导（CPW）谐振器，评估衬底处理方法引起的微波损耗差异。

= 2 结果与讨论

== 2.1 ToF-SIMS 深度剖析

为了评估表面处理如何改变污染物进入 Nb 薄膜的情况，采用飞行时间二次离子质谱（ToF-SIMS）——它很适合识别 Nb 薄膜中的 O 与 C 物种 @murthy2022tofsims @bose2020nbtofsims。测量在美国太平洋西北国家实验室的环境分子科学实验室（EMSL）完成，采集方法见附录 S1.1。

三种深度剖析中，未盖帽的 Nb–空气表面都在位置（I）显示很强的 C 峰与 O 峰。这并不意外：顶部 Nb 表面是自由表面、没有盖帽，因此这些表面峰本身区分不了三种制备。Nb 薄膜的 ToF-SIMS 研究中也报道过类似的含 O、含 C 信号，通常归因于表面氧化物、烃类沾污和与工艺相关的杂质掺入 @murthy2022tofsims @bose2020nbtofsims。样品之间的主要差异出现在 Nb 薄膜内部和埋底 Nb–InP 界面附近。直接取用样品的 O 信号贯穿整个 Nb 薄膜，其积分 $space.med(18)$O:In、C:In、S:In 比定义 @fig-sims（d）中的归一化参考值 1.00。Ar 刻蚀把归一化积分 $space.med(18)$O:In 与 C:In 分别降到 $0.54 +- 0.01$ 与 $0.62 +- 0.10$；C 信号还在界面区形成一个展宽特征（记号 II），并在薄膜内被涂抹开来（记号 V）。硫钝化样品对 O 与 C 掺入的抑制最强，归一化 $space.med(18)$O:In 与 C:In 分别为 $0.03 +- 0.00$ 与 $0.03 +- 0.01$；这与 O 强度在整个薄膜内跌回本底、埋底界面处不再出现 O 峰（记号 VI）相一致。Ar 刻蚀与硫钝化样品的归一化 S:In 接近，分别为 $0.51 +- 0.15$ 与 $0.52 +- 0.11$，所以这个深度积分 S 指标只当作 Nb 加界面区内含硫信号的相对量来读，不能直接当作局域界面硫层来计量。

#figure(
  image("fig/results_TOF-SIMS.pdf", width: 82%),
  caption: [Nb/InP(001) 样品的 ToF-SIMS 深度剖析与归一化杂质掺入指标。（a）–（c）分别为直接取用、Ar 刻蚀、硫钝化样品的平均深度剖析。每个处理条件在四个位置采集数据后取平均，±1 倍标准差以阴影带标在各离子曲线旁。每个剖析面板中两条竖直虚线标出埋底 Nb–InP 界面过渡区的上下边界，其取法见 @fig-s-sims-method 所示的分段线性构造。界面 Nb 侧与衬底侧边界分别以记号 III、IV 标出，其间距用作溅射时间意义上界面表观展宽的度量。（d）汇总三种表面处理的归一化积分 $space.med(18)$O:In、C:In 与 S:In 比，均归一化到直接取用样品。（d）中的不确定度按如下方式计算：先对每条重复测量曲线单独求物种:In 积分比，再对这些比值归一化到直接取用条件后取标准差。],
) <fig-sims>

@fig-sims（a）–（c）给出直接取用、Ar 刻蚀与硫钝化三种样品的 ToF-SIMS 深度剖析。各面板中记号 III 定义埋底 Nb–InP 界面区的 Nb 侧边界，记号 IV 定义 In 信号到达 InP 衬底平台的衬底侧边界。@fig-sims（d）中的归一化积分杂质指标就是用这对虚线划定的区域算的。对每种物种 $X = {space.med(18) "O", "C", "S"}$，分子取 $integral_(t_0)^(t_( upright("IV"))) space space I _ X ( t ) space d t$，其中 $t_0$ 为剖析起点、$t _ { upright("IV") }$ 为 Nb–InP 界面区的下边界，该窗口覆盖 Nb 表面、Nb 薄膜与 III–IV 界面区；In 归一化项取界面正下方 InP 衬底的 In 信号，$integral_(t_( upright("IV")))^(t_( upright("IV"))+200 " s") space space I _ upright("In") ( t ) space d t$。物种对 In 之比定义为

$ R _ X = frac( integral_(t_0)^(t_( upright("IV"))) I _ X ( t ) space d t, integral_(t_( upright("IV")))^(t_( upright("IV"))+200 " s") I _ upright("In") ( t ) space d t ) $

再以直接取用样品的对应值归一化，$tilde(R)_X = R_X / R_(X,"as-received")$，这样直接取用样品对每种物种都定义参考值 1。对重复曲线，不确定度为各条曲线单独积分所得比值的标准差。


界面边界用 In 与 P 两条深度剖析按同一流程独立提取（方法见附录 S1.2）。每种指示剂导出的同一对边界同时用于污染物比率和表观界面宽度的计算。正文采用 In 导出的结果，因为 In 比 P 更难挥发、给出的界面过渡更清晰；按 P 归一化的比率见 @tbl-s2，两种指示剂下的比率在定性上完全一致。@tbl-sims-in 汇总的界面宽度显示，Ar 刻蚀样品 $space.med(18)$O 掺入的下降伴随着埋底 Nb–InP 界面的显著展宽：用 In 导出的虚线位置，以 IV 处溅射时间减去 III 处，直接取用样品的 III–IV 间距约 32 s，按 AFM 实测 130 nm 的 Nb 厚度校准约对应 19 nm 的界面宽度；Ar 刻蚀后该区展宽到约 85 s、约合 46 nm——溅射时间上约为直接取用样品的 2.7 倍，换算成长度后约 2.4 倍。@fig-tem（h）中刻蚀衬底的 TEM 像显示名义 InP 表面伸出约 25 nm 的金字塔状特征；把这个粗糙度尺度与直接取用样品由 ToF-SIMS 估计的约 19 nm 界面宽度叠加，得到的约 44 nm 与 ToF-SIMS 估计的 46 nm 符合得不错。这一解释与先前的报道一致：Ar⁺ 离子刻蚀与溅射会通过近表面损伤和溅射致粗糙化演化改变 InP 表面 @pearton1990ion @frost2000inp。与之对照，硫钝化样品的 III–IV 间距约 31 s、约合 18 nm，与直接取用情况接近、远窄于 Ar 刻蚀样品，对应一个更锐利、展宽更小的埋底界面。硫钝化样品中 $space.med(18)$O 信号的降低也与此前关于硫化铵处理的结果一致：该处理能去除或抑制 InP 原生氧化物、改善钝化表面的化学与电学质量 @tian2014inp @lee2019facile。

#figure(
  table(
  columns: 4,
  align: (left, center, center, center),
  table.header([], [直接取用], [Ar 刻蚀], [硫钝化]),
  [界面宽度（s）], [32], [85], [31],
  [界面宽度（nm）], [19], [46], [18],
) ,
  caption: [用 In 衍生边界从 ToF-SIMS 深度剖析提取的近似界面宽度。界面宽度取上、下界面边界（III）与（IV）的间距。纳米值按 AFM 实测 130 nm 的 Nb 厚度对溅射时间轴线性校准，取界面区中点为 Nb 薄膜底部。],
  kind: table,
  numbering: "1",
  supplement: [表],
) <tbl-sims-in>

== 2.2 AFM 晶粒尺寸与表面粗糙度

#figure(
  image("fig/afm_2x3.pdf", width: 78%),
  caption: [不同表面处理后的 InP(001) 上 Nb 薄膜的原子力显微镜结果。（a）–（c）为直接取用、Ar 刻蚀、硫钝化样品的表面相位像，用于晶粒分析；（d）–（f）为对应的形貌像，标注了 RMS 粗糙度值。],
) <fig-afm>

#figure(
  image("fig/Grain_analysis.pdf", width: 68%),
  caption: [基于 AFM 相位像的 Nb/InP(001) 薄膜晶粒分割汇总。左列：背景平坦化处理后的相位像（硫钝化样品额外施加尘点掩蔽滤除）；中列：用分水岭分割提取的晶界叠加在相位衬度上；右列：由分割晶粒面积换算的等效圆直径直方图。],
) <fig-s-grains>

@fig-afm 给出三种衬底处理所得 Nb 薄膜的 AFM 相位衬度与形貌。相位像清楚地反映三种条件下 Nb 晶形貌的差别：直接取用薄膜测得的平均晶粒最小，等效直径均值 $17.4 +- 8.2$ nm，扫描窗内晶粒数最多（439 个）；Ar 刻蚀薄膜的特征晶粒最大、晶粒数最少，等效直径均值 $60.9 +- 18.1$ nm、共 57 个，相对直接取用增大约 250 %；硫钝化薄膜形貌居中，等效直径均值 $31.6 +- 9.0$ nm、共 113 个，增幅约 82 %。这里选用相位通道做分析，因为相对于形貌通道，它对晶界的衬度更强 @pang2000phase。晶粒尺寸与计数用 Python 3.11 的 `scikit-image`（v0.22.0）从相位像提取，结果汇总于 @tbl-afm；提取细节见附录 S2。

#figure(
  table(
  columns: 5,
  align: (left, center, center, center, center),
  table.header([样品], [$D _ "eq"$ 均值（nm）], [中位数（nm）], [晶粒计数], [RMS（nm）]),
  [直接取用], [$17.3 +- 8.2$], [16.7], [440], [2.1],
  [Ar 刻蚀], [$61 +- 18.1$], [59], [57], [3.5],
  [硫钝化], [$31.6 +- 9.0$], [31.4], [113], [0.6],
) ,
  caption: [不同 InP 衬底处理上 Nb 薄膜的 AFM 晶粒分割与表面粗糙度汇总。],
  kind: table,
  numbering: "1",
  supplement: [表],
) <tbl-afm>

形貌数据表明，晶粒粗化的同时表面粗糙度也变化：Ar 刻蚀样品的 RMS 最大，比直接取用样品高约 67 %，与 Ar 刻蚀引起的晶粒粗化和表面织构化图像一致。此前工作显示，Ar⁺ 溅射 InP 会诱发纳米尺度粗糙度演化与图形化，Nb 薄膜研究也表明高能沉积条件强烈影响晶粒尺寸、形貌与表面粗糙度 @frost2000inp @kittiwatanakul2018nb @gao2022nb。硫钝化样品的 RMS 最小，比直接取用样品低约 71 %，表面明显更细、更平滑。硫化铵处理 InP 的已有研究支持这一读法：硫钝化去除或抑制原生氧化物，为后续 Nb 生长提供了一个更可控的界面 @tian2014inp @lee2019facile。两组 AFM 结果合起来看：Ar 刻蚀促成晶粒长大与薄膜粗糙化，硫钝化则限制粗化、保住更平滑的表面形貌。

== 2.3 截面 STEM 与 EDS

#figure(
  image("fig/Unmilled_Milled_Sulfur_rightcrop_4x3.pdf", width: 74%),
  caption: [埋底 Nb/InP(001) 界面的截面 HAADF-STEM 与 EDS 对比：上三行（a）–（d）直接取用，中三行（e）–（h）Ar 刻蚀，下三行（i）–（l）硫钝化。（a）、（e）、（i）为三种样品的截面 HAADF-STEM 像；Nb 信号见（b）、（f）、（j），O 信号见（c）、（g）、（k），In/P 合并信号见（d）、（h）、（l）。全部图像沿 [110] 截面方向拍摄。刻蚀样品的界面显示 InP 表面明显粗糙化，在埋底界面形成金字塔状刻面；这一粗糙形貌一直传递到沉积的 Nb 薄膜中，造成非平整界面、表面粗糙度上升，晶界贯穿整个薄膜厚度清晰可见。竖直虚线标出 InP 金字塔的位置；O 信号优先局域在这些虚线之间，说明相邻金字塔之间形成的边界处存在增强的氧掺入与偏析。与刻蚀样品相反，硫钝化界面保持锐利平整，无金字塔状 InP 刻面痕迹；Nb 薄膜连续得多，在所取景域内看不到明显的富氧边界特征。可见硫钝化保住了界面平整度，抑制了 Ar 刻蚀诱发的微结构退化。],
) <fig-tem>

@fig-tem 给出三种衬底处理的截面 HAADF-STEM 像与 STEM-EDS 元素图。FIB 提拉制样方法见附录 S3.1。3×4 面板按样品排布：直接取用、Ar⁺ 刻蚀、硫钝化样品分别见 @fig-tem（a–d）、（e–h）、（i–l），每一列依次为 HAADF-STEM 像、Nb、O 与衬底元素图。STEM-EDS 与 4D-STEM 在 Thermo Fisher Scientific Spectra Ultra（300 kV）上完成；EDS 采集相机长度 87 mm、半会聚角 30 mrad、束斑 3 号、扫描步长 1.8 nm，数据用 Velox 采集与处理。EDS 处理选用的线系：直接取用与 Ar⁺ 刻蚀样品为 C K、O K、P K、In L、Nb L；硫钝化样品另加 S K 与 Ti K。

EDS 图的图像分析流程见 @fig-s-tem-analysis，简述如下：先从 Nb 元素图中提取 Nb 薄膜区并以此定义所有分析区域；近表面区取薄膜顶部 25 nm，埋底界面区取紧邻 Nb–InP 界面的底部 15 nm；富氧像素按 O 强度相对 InP 衬底本底的统计判定；高无序区由 Nb EDS 强度与 STEM 强度同时下降定义。由于 ADF/HAADF-STEM 衬度取决于投影质厚与原子序数 @nellist2000ADF @macarthur2016ADF，而 STEM-EDS 给出的局部 Nb 元素强度对厚度与衍射信道效应敏感 @spurgeon2017STEMEDS，这套联合掩膜识别的是 Nb 连续性下降的区域。这里称其为高无序区，依据是局部 Nb 密度/连续性下降与延伸的结构衬度 @phillips2012LAADF @oveisi2019ADF。这一叫法避免把它们直接等同于晶界，只是说明这类区域与多晶薄膜中含缺陷的晶间区域相符 @quirk2024GB @lee2026OGB。同样的掩膜、阈值与区域定义对全部样品一致施加，以便直接比较。

对直接取用参照样品，@fig-tem（a–d）给出基线界面形貌与氧分布：HAADF-STEM 像中 Nb 薄膜横向连续，但薄膜底部存在很强的氧信号，说明有界面氧化层。截面分析结果（@fig-s-tem-analysis，汇总于 @tbl-o-int、@tbl-area）显示 Nb 总面积中 7.8 % 被划为富氧区，所分析的体内 Nb 区没有探到高无序特征。表面与埋底界面区的归一化 O 强度取 1.0，因为该样品就是比较用的参照。

对 Ar⁺ 刻蚀样品，区域平均 O 强度在表面区与埋底界面区分别为 0.9 与 0.8（各自归一化到直接取用样品的对应区），只下降了一点；但面积指标（@tbl-area）显示薄膜质量明显退化：Nb 总面积的 24.9 % 被划为富氧，体内 Nb 面积的 9.8 % 被划为高无序，而高无序面积中的 91.7 % 同时被划为富氧。这种强烈的空间重叠说明刻蚀薄膜中的高无序区与氧积累密切相关。@fig-tem（h）的 In/P 元素图显示，沿 [110] 方向观察时，埋底界面上的 InP(001) 表面出现与 {111} 面一致的金字塔状刻面。这类刻面与粗糙化与此前关于 Ar⁺ 刻蚀/溅射在 InP 中诱发近表面损伤、粗糙化和图形化的报道相符 @pearton1990ion @frost2000inp。金字塔形貌与观察到的微结构空间相关：以竖直虚线标出的高无序特征落在相邻金字塔的谷部，并贯穿 Nb 薄膜的整个厚度。


#figure(
  table(
  columns: 4,
  align: (left, center, center, center),
  table.header([区域], [直接取用], [Ar 刻蚀], [硫钝化]),
  [表面区], [1.0], [0.9], [0.9],
  [埋底界面区], [1.0], [0.8], [0.2],
) ,
  caption: [STEM-EDS 图像分析得到的区域平均氧强度，归一化到直接取用样品的对应区均值。数值无量纲；它们是相对图像衬度指标，不是跨样品的定量氧浓度。],
  kind: table,
  numbering: "1",
  supplement: [表],
) <tbl-o-int>

#figure(
  table(
  columns: 4,
  align: (left, center, center, center),
  table.header([], [直接取用], [Ar 刻蚀], [硫钝化]),
  [Nb 总面积中富氧占比], [7.8 %], [24.9 %], [6.5 %],
  [体内 Nb 面积中高无序占比], [0.0 %], [9.8 %], [0.0 %],
  [高无序面积中富氧占比], [—], [91.7 %], [—],
) ,
  caption: [截面 TEM 图像分割得到的面积占比：指定分析区内满足各项条件的面积百分数。],
  kind: table,
  numbering: "1",
  supplement: [表],
) <tbl-area>

@fig-tem（i）显示，硫钝化后的 Nb 薄膜形貌相对 Ar⁺ 刻蚀明显改善，与硫基处理抑制原生氧化物、提升 InP 表面与界面化学/电学质量的既有报道一致 @Tao1992 @tian2014inp @lee2019facile @alian2011asv @xu2013inpinterface。Nb 元素图（@fig-tem（j））显示薄膜连续，看不到低信号空隙或显著高无序特征——分析所取薄膜内部区域没有像素越过选定的高无序阈值。O 元素图（@fig-tem（k））显示氧掺入相对刻蚀样品被强烈抑制：Nb 总面积仅 6.5 % 划为富氧，对比刻蚀样品的 24.9 %，在所用判据下约降了四倍。@tbl-o-int 的区域平均 O 强度进一步显示表面区归一化值 0.9、埋底界面区仅 0.2。@fig-tem（l）中，Nb–InP 界面保持锐利平整，没有金字塔刻面和刻蚀致粗糙。HAADF-STEM 与 EDS 合起来说明：硫钝化保住界面平整，同时抑制刻蚀薄膜中与氧掺入相伴的结构缺陷通道 @lee2026OGB；氧掺入的降低也与 @fig-sims（c）的深度剖析一致。

4D-STEM 的晶粒分辨分析（@fig-grains）给出更多结构信息。直接取用薄膜的虚拟 ADF 像（@fig-grains（a））与按附录 S4 流程聚类生成的晶粒图（@fig-grains（b），聚类平均衍射花样见 @fig-s-ar）显示高度碎裂的多晶微结构：薄膜由许多细小、横向不均的晶粒区组成，而不是少数延伸的柱状晶粒，说明其取向沿厚度变化显著；这一细晶结构与 @fig-afm 中 AFM 观察到的表面形貌一致。第二个标志特征是埋底界面处横向延展的非晶层（@fig-grains（b）中区 V）：非晶带把 InP 衬底与上覆多晶 Nb 隔开，说明直接取用样品的薄膜形核于一个结构无序的界面之上。可见直接取用样品的图像是细晶多晶薄膜上叠一层清晰的非晶界面带，而处理过的样品（@fig-grains（d）、（f））表现出更大、纵向更连续的晶区。

== 2.4 4D-STEM 晶粒成像

刻蚀样品中，@fig-tem（h）里的金字塔状 InP 表面结构在 4D-STEM 分割图（@fig-grains（d）（III））中重现。相邻金字塔之间（@fig-grains（d）（I））是小的 Nb 晶粒区，部分投影面积仅约 $30 " nm"^2$，被橙色非晶区与大晶粒隔开。非晶材料只是部分地把 Nb 薄膜与衬底分离：在 @fig-grains（d）（II）一类位置它形成连续界面层，而在金字塔顶（@fig-grains（d）（III）），结晶 Nb 与 InP 衬底直接靠近，在 4D-STEM 空间分辨率下看不出非晶界面层。峰谷间隙（@fig-grains（d）（IV））中，狭窄的竖直非晶通道隔开较大的晶区，贯穿 Nb 薄膜形成无序路径。这些通道的空间分布与 @fig-tem（f）中 Nb 局部低值区、@fig-tem（g）中富氧区完全同构，把 4D-STEM 看到的延伸结构无序与 EDS 看到的氧优先局域联系了起来。

#figure(
  image("fig/Results_4DSTEM_Grains.pdf", width: 58%),
  caption: [由 4D-STEM 数据集重构的虚拟 ADF 像与基于聚类的晶粒图，展示 Nb 投影晶粒结构：（a）、（b）直接取用，（c）、（d）Ar 刻蚀，（e）、（f）硫钝化。（a）、（c）、（e）为按环形探测器范围积分衍射花样重构的虚拟 ADF 像；（b）、（d）、（f）为分割后的结构图。灰色区对应不同的 Nb 晶粒区（其衍射花样见 @fig-s-ar–@fig-s-sulfur，解释见附录 S4）。蓝色为 InP 衬底，橙色为非晶区。刻蚀样品中，非晶区形成通道状路径（IV）与界面局部分离区（II）；直接取用与硫钝化样品中，非晶区表现为 Nb 薄膜与衬底之间一层薄而连续的埋底界面层（V）。],
) <fig-grains>

硫钝化样品的分割（@fig-grains（f））结构明显不同：非晶材料被约束在一层薄而横向连续的层里，均匀地把结晶 Nb 薄膜与 InP 衬底隔开；其上的 Nb 薄膜包含更大、连续的晶区，没有 Ar⁺ 刻蚀后那种竖直非晶通道与高无序间断。这一结构与硫钝化样品平整的界面（@fig-tem（i）–（k）的 Nb、O 元素图中没有优先的体内氧偏析）一致。4D-STEM 与 EDS 合并起来：硫钝化把非晶组分限制在埋底界面处，阻止了 Ar⁺ 刻蚀产生的纵向贯穿、富氧的结构无序。

== 2.5 超导转变与微波内品质因子

@fig-qi（a）给出 Nb 薄膜电阻的温度依赖，每条曲线各自除以 10–12 K 间测得的正常态电阻归一化。硫钝化薄膜的超导转变温度最高，$T _ upright("c") approx 9.0 " K"$，比刻蚀与直接取用薄膜高约 1 K；后两者在约 0.2 K 的测量分辨率内共享约 $8.1 " K"$ 的转变。硫钝化薄膜的室温归一化电阻比也最高：296 K 处 $R/R _ N approx 4$，刻蚀薄膜约 2.9，直接取用薄膜约 2.5。相对直接取用，Ar 刻蚀只带来有限改善，硫钝化的 $R/R _ N$ 则高得多。更高的室温电阻比对应薄膜内杂质与缺陷散射更少，说明结晶质量改善、晶界与掺入氧这类散射中心减少。

#figure(
  image("fig/combined_DC_RF_REFIT_figure.pdf", width: 78%),
  caption: [不同 InP(001) 表面处理下 Nb 薄膜的超导 $T _ upright("c")$ 与微波内品质因子 $Q _ upright("i")$。（a）硫钝化、刻蚀、直接取用样品的归一化电阻随温度变化 $R/R_( upright(10K) )$；（b）$Q _ upright("i")$ 随平均谐振器光子占据数 $bar(n)$ 的变化，功率由片上标定微波功率换算。标记形状 A–C 标识每个处理条件下的三只谐振器。谐振拟合采用附录 S8.1 的复直径修正 notch 法，唯刻蚀样品的非对称 B 号谐振器改用附录 S8.2 的极–零点法。],
) <fig-qi>

CPW 谐振器按附录 S6 的流程制备，微波测量在 Bluefors SD 稀释制冷机中于 20 mK 下进行（附录 S7）；谐振参数用附录 S8 的两种拟合方法提取（@fig-qi（b）），光子数由拟合的谐振参数与估算的片上微波功率计算。

@fig-qi（b）给出三种表面处理的 $Q _ upright("i")$–光子数关系。最低功率下，直接取用谐振器给出最大的 $Q _ upright("i")$，三只不同频率的谐振器都在 $1.1$–$1.3 times 10^5$；硫钝化谐振器稍低，两只在 $9 times 10^4$–$1.0 times 10^5$ 附近、另一只约 $5.6 times 10^4$；刻蚀样品的散布类似，两只约 $8.3 times 10^4$，非对称的 $5.04 " GHz"$ 谐振器约 $4.0 times 10^4$。

因此，这批数据没有显示微波损耗随表面处理带来的结构/化学改善而单调改善。恰恰相反，在所测光子数范围内，直接取用样品的表现至少不差于硫钝化与刻蚀样品，总体上还更好。这提示在本谐振器/封装体系里，这些制备手段改变的金属–衬底界面并非主导损耗通道；微波损耗更可能受制于其他贡献——衬底体内损耗、封装或辐射损耗、准粒子损耗等。$Q _ upright("i")$ 对功率的依赖较弱，也说明器件在所测范围内没有强受限于可饱和的 TLS 介质损耗。总之，激进的表面处理确实可能显著拖坏个别谐振器（刻蚀样品尤甚），但现有数据不支持仅靠硫钝化或刻蚀就能确定性地降低微波损耗。

= 3 结论

我们系统研究了埋底 Nb–InP 界面的制备方式对溅射 Nb 薄膜与谐振器的化学、结构、超导输运与微波损耗的影响。比较三种处理——直接取用对照、原位 Ar⁺ 刻蚀、硫钝化——的结果是：去除或改造界面原生氧化物可以得到更洁净、更锐利的金属–半导体界面，在硫钝化情形还改善了超导输运；但这些材料改善没有转化为微波性能的提升。三种样品中都能探测到硫，因此硫钝化器件性能不占优不能简单归因于硫引入了比氧损耗更强的界面 TLS；同样，现有结构与形貌表征也不支持 Nb 严重损伤或大规模粗糙化的解释。我们的结果表明，Nb–InP 器件的微波损耗并非仅由界面非晶氧化物决定，去除这层氧化物反而可能暴露或增强与金属–半导体界面或 InP 衬底相关的额外损耗通道。一种可能的机制是 III–V 衬底中的机电/压电损耗，原生氧化物在其中充当部分界面缓冲层——这一解释仍属推测，有待进一步研究。这对混合超导–半导体量子器件是一个提醒：埋底界面工程必须用微波损耗直接评估，而不能只看化学锐度、除氧效果或超导输运指标。

#heading(numbering: none)[致谢]

#set par(first-line-indent: 0em)
本工作受美国国防高级研究计划局（DARPA）合成量子纳米结构（SynQuaNon）计划资助（协议号 HR00112420343），并受国家科学基金会 Clemson 项目（2137776）资助。STEM/EDX 与 ToF-SIMS 测量分析受美国能源部科学局国家量子信息科学研究计划量子优势协同设计中心（C2QA，合同号 DE-SC0012704，PNNL FWP 76274）资助。部分研究在环境分子科学实验室（EMSL）完成——它是能源部科学局用户设施，由生物与环境研究计划资助（合同号 DE-AC05-76RL01830），项目批准号 10.46936/staf.proj.2026.62105/60015729。作者感谢 Bethany Matthews 在 STEM 样品制备上的帮助。

#heading(numbering: none)[数据可用性]

支持本研究结果的全部数据可向通讯作者索取。

#v(1em)
#align(center)[#text(size: 13pt, weight: "bold")[附录]]
#set figure(numbering: n => [S-#(n - 7)], supplement: [附图])

= S1 ToF-SIMS 方法

== S1.1 数据采集

使用 TOF.SIMS 5 仪器（IONTOF GmbH，德国 Münster），双束交错深度剖析模式。2.0 keV Cs⁺ 束溅射，25 keV Bi⁺ 束作分析束收集二次离子信号。Cs⁺ 束在 $300 times 300 " µm"^2$ 区域扫描；Bi⁺ 分析束聚焦至约 5 μm 直径斑，束流约 1.4 pA、重复频率 20 kHz，在 Cs⁺ 溅射坑中心 $100 times 100 " µm"^2$ 区域扫描。用厂商提供的 SurfaceLab 7.2 提取离子图像与深度剖析。

== S1.2 界面判定与分析

有效 Nb–InP 界面按同一拟合流程、对 In 与 P 两种深度剖析分别平行应用，以检验结论是否依赖衬底组分指示剂的选择（见 @fig-s-sims-method）。在线性拟合的强度–时间对数空间中，对 Nb 侧基线、一段或多段界面过渡、InP 衬底侧基线分别做直线拟合；Nb 侧拟合排除剖析起始 60 s，以免氧化的 Nb–空气表面对构造加权。In 导出的独立拟合边界 $t _ { upright("III") }$ 与 $t _ { upright("IV") }$ 既用于归一化 $space.med(18)$O:In、C:In、S:In 比率的积分窗口，也用于 @tbl-sims-in 的表观界面宽度。整套分析用独立拟合的 P 衍生边界重复一遍：$space.med(18)$O:P 与 C:P 积分及 P 衍生界面宽度见 @fig-s-sims-method 与 @tbl-s2。正文用 In 基结果，因为本条件下 In 信号给出更稳定、更锐利的界面标记，而 P 的过渡更易被优先溅射和/或含 P 挥发组分损失展宽。P 基分析因此作为稳健性检验：两种指示剂重现同样的处理相关趋势，但其归一化比率与表观宽度不要求数值上相同。

单斜率过渡的剖析，膜侧边界 $t _ { upright("III") }$ 取 Nb 侧基线拟合与过渡拟合的交点，衬底侧边界 $t _ { upright("IV") }$ 取过渡拟合与衬底侧基线拟合的交点，表观界面宽度为

$ Delta t _ upright("int") = t _ { upright("IV") } - t _ { upright("III") } $

刻蚀样品的 P 剖面需要两段过渡拟合：缓坡拟合给膜侧边界，陡坡拟合给衬底侧边界。换算成近似纳米宽度时，把 III–IV 区间的中点视作 130 nm Nb 薄膜的底部位置。

P 衍生边界随后用于 @tbl-s2 的 P 归一化杂质指标。对 $X = {space.med(18) "O", "C"}$，分子从剖析起点积分到 P 衍生衬底侧边界，分母取其后 200 s 的 InP 衬底 P 信号：

$ R_(X:P) = frac( integral_(t_0)^(t_( upright("IV") )^( ( upright("P") ) ) ) space space I _ X ( t ) space d t, integral_(t_( upright("IV") )^( ( upright("P") ) ))^(t_( upright("IV") )^( ( upright("P") ) )+200 " s") space space I _ upright("P") ( t ) space d t ) $

所得 $space.med(18)$O:P 与 C:P 各自除以直接取用样品的对应值。

@tbl-s2 的 P 基结果是对正文 In 基分析的一致性检验：趋势相同——Ar 刻蚀给出最宽的表观界面，硫钝化给出最低的归一化氧、碳掺入。P 导出的绝对宽度偏大、对拟合窗口更敏感，原因可能是在离子轰击下更易挥发的 P 组分优先溅射或脱附把 P 过渡展宽 @petit2009inp。因此 @fig-sims（d）与 @tbl-sims-in 以 In 作主衬底指示剂。

#figure(
  table(
    columns: 7,
    align: (left, center, center, center, center, center, center),
    inset: 5pt,
    table.header([], [直接取用 In], [直接取用 P], [Ar 刻蚀 In], [Ar 刻蚀 P], [硫钝化 In], [硫钝化 P]),
    [归一化 $space.med(18)$O:$X$], [1.00], [1.00], [0.54], [0.55], [0.03], [0.03],
    [归一化 C:$X$], [1.00], [1.00], [0.62], [0.62], [0.03], [0.03],
    [归一化 S:$X$], [1.00], [1.00], [0.51], [0.51], [0.52], [0.41],
    [表观界面宽度（s）], [32], [41], [85], [99], [31], [33],
    [近似界面宽度（nm）], [19], [25], [46], [54], [18], [20],
  ),
  caption: [由 ToF-SIMS 深度剖析得到的归一化积分杂质–衬底指示剂比率与表观 Nb–InP 界面宽度。$X$ 为各子列所列的 In 或 P 指示剂；同一指示剂导出的界面边界一致地用于杂质比率与界面宽度。每个杂质:$X$ 比归一化到其直接取用值。],
  kind: table,
  numbering: n => [S-#(n - 4)],
  supplement: [附表],
) <tbl-s2>

#figure(
  image("fig/sims_6panel_indium_phosphorous_middle_interface_region_method.pdf", width: 78%),
  caption: [用 In 与 P 的 ToF-SIMS 深度剖析定义有效 Nb–InP 界面区的分段线性构造。（a）–（c）分别为直接取用、Ar 刻蚀、硫钝化样品的 In 基构造；（d）–（f）为对应的 P 基构造。提取的上、下边界定义表观界面宽度。],
) <fig-s-sims-method>

= S2 AFM 相位晶粒尺寸分析

为对三种衬底处理条件的表面形貌做定量比较，对 @fig-s-grains 所示 AFM 相位像做晶粒分析。相位像比对应的形貌通道给出更强的晶界衬度，分析就在它上面做。

每张相位像先减去自身的高斯模糊像完成背景平坦化，以去除长波扫描伪影、增强晶粒尺度的局部衬度。对硫钝化样品再施加一层离群值抑制掩膜，去掉被指认为非物理表面伪影的孤立高对比尘点（尘点位置见 @fig-s-premask）。尘点修正使晶粒尺寸增加 1.4 nm，即 4 %。

晶粒区用阈值法二值掩膜分割：相位幅值较高的"亮"区判为晶粒；随后用距离变换分水岭算法分离共享连续边界的相邻晶粒（Python 3.11 的 `scikit-image` v0.22.0 `watershed` 实现）。晶界由标注好的分割图提取并叠加到处理后的相位像上目检。每个分割晶粒的等效圆直径按所围像素面积 $A$ 计算：

$ d _ upright("eq") = 2 sqrt( A / pi ) $

所得直方图汇总各表面处理条件下等效晶粒直径的分布。

#figure(
  image("fig/Raw_phase_images.pdf", width: 72%),
  caption: [尘点掩蔽前的原始相位像。硫钝化相位图中圈出的区域显示了晶粒分析中被掩蔽的尘点。],
) <fig-s-premask>

= S3 TEM 与 EDS

== S3.1 FIB 提拉制样

三个截面 TEM 样品取自生长于 InP(001) 上的 130 nm Nb 薄膜（三种表面处理各一），均用聚焦离子束（FIB）提拉制备，提拉位置避开此前 ToF-SIMS 测量留下的溅射坑。截面薄片在 Thermo Fisher Scientific Helios Hydra UX 双束 FIB–SEM 上制备。离子减薄前，先在样品表面沉积约 100–500 nm 的电子束碳保护层，再沉积约 1 μm 厚的等离子束含 Pt 保护层。随后提取薄片并逐级降低离子束流减薄至电子透明，最终抛光在 5 kV、30 pA 下进行，以减轻 FIB 造成的表面损伤与非晶化。

== S3.2 EDS 处理与分区阈值方法

@fig-s-tem-analysis 所示的全部图像区域分析在 Python 中用 `numpy`、`matplotlib`、`scipy`、`scikit-image` 完成；高斯滤波、二值滤波、连通域分析与掩膜生成均用 `scikit-image`，目的是在 Nb 薄膜内划定空间区域用于定量氧强度分析。

每个截面数据集的空间标定由 TEM 像上的比例尺确定：直接量取 50 nm 对应的像素长度，所有区域厚度与面积按各自 nm/pixel 系数换算成物理尺寸；三种样品分别独立标定，以反映放大倍率差异。

完整的 Nb 薄膜区域从处理后的 Nb 元素强度图上提取。对 Nb 强度图做高斯平滑与百分数归一化，用固定相对阈值切出薄膜掩膜；掩膜再经连通域过滤、小对象剔除与填孔，保留连续的 Nb 薄膜区域。薄膜上、下边界作为横向位置的函数由掩膜提取（@fig-s-tem-analysis（b）、（g）、（l））。近表面区取 Nb 薄膜顶部

$ t _ upright("surface") = 25 " nm" $

埋底界面区取紧邻 Nb–InP 界面的薄膜底部

$ t _ upright("interface") = 15 " nm" $

其余内部体积划为体内 Nb 区。三个区域如 @fig-s-tem-analysis（a）、（f）、（k）。

氧强度用界面下方 InP 衬底区逐图扣除本底：先对氧分布图高斯平滑并百分数归一化；对每个横向位置，把 Nb 掩膜下埋底界面边界以下的全部像素定义为本底区，算出衬底平均氧信号 $mu _ upright("sub")$ 并从氧分布图扣除，

$ I_( upright("O,corr")) = max( I _ upright("O") - mu _ upright("sub"), 0 ) $

负值截为零。富氧像素在扣本底后的氧图上统计判定：

$ I_( upright("O,corr")) > 3 sigma _ upright("sub") $

其中 $sigma _ upright("sub")$ 为 InP 衬底本底区的氧强度标准差。表面、体内、埋底界面与高无序各区的区域平均氧强度由 $I_( upright("O,corr"))$ 计算；列表比较时按直接取用样品对应区域的均值归一化。由于各 EDS 分布图独立重新标定，区域平均 O 值作为相对图像衬度指标报告，不作跨样品的定量氧浓度解释。

为识别薄膜连续性下降与晶界相关无序的候选区，先从处理后的 Nb 与 STEM 图构造中间低强度掩膜。在 Nb 薄膜内（排除近表面区），候选低 Nb 像素满足

$ I _ upright("Nb") < 0.60 dot I_( 95 , upright("Nb") ) $

其中 $I_( 95 , upright("Nb") )$ 为薄膜掩膜内 Nb 强度的 95 百分位。类似地，候选低 STEM 像素满足

$ I _ upright("STEM") < 0.60 dot I_( 95 , upright("STEM") ) $

这些低强度掩膜只作识别高无序区的中间判据，不作为单独报告的材料区域。

复合 Nb/STEM 一致性分数由处理后的 Nb 与 STEM 强度图计算：

$ S _ upright("comp") = ( 1 - I _ upright("Nb") ) ( 1 - I _ upright("STEM") ) $

Nb 信号与 STEM 强度同时偏低的像素给出高 $S _ upright("comp")$。该分数在体内 Nb 区（排除近表面与埋底界面带）上评估（@fig-s-tem-analysis（d）、（i）、（n））。最终高无序掩膜由 $S _ upright("comp")$ 阈值化并要求 Nb 或 STEM 任一通道的宽松低强度门限一致来生成，再做二值滤波去孤立像素、填小空洞。

高无序掩膜见 @fig-s-tem-analysis（e）、（j）、（o）。这些区域解释为 Nb 可能不连续、局部 Nb 密度下降和/或结晶性下降之处，用于定量氧的优先偏析。投影厚度局部变化与衍射/信道效应同样会影响 Nb-EDS 与 HAADF-STEM 强度，因此富氧与高无序面积占比是相对的、阈值依赖的投影面积指标，不是绝对相分数或缺陷体积分率；0 % 表示所取景域内没有像素越过所选阈值。阈值虽为经验选取，但全部阈值定义、百分数归一化、本底扣除与区域厚度对三种样品一致施加，以保证直接、自洽的比较。

= S4 4D-STEM 采集与基于聚类的晶粒分析

4D-STEM 数据集使用 EMPAD 探测器在 550 mm 相机长度下采集。显微镜以微探针模式运行、束斑 9 号，探针半会聚角约 2 mrad；全部采集的扫描步长 1.5 nm。选择这组微探针条件是为了兼顾小会聚角的衍射花样与适合晶粒成图的纳米级空间采样。虚拟 ADF 像通过在 20–40 mrad 环形范围内积分每个扫描位置的衍射强度重构。

衍射花样数据集依次做主成分分析（PCA）去噪、非负矩阵分解（NMF）与聚类。在该流程中，每个簇代表一类衍射花样相似的扫描位置。PCA 去噪对所有数据集统一保留 30 个成分。

刻蚀与硫钝化样品晶粒较大，而直接取用样品晶粒明显更细、局部衍射花样更复杂，因此按样品采用不同的 NMF 与聚类参数：刻蚀与硫钝化样品用 12 个 NMF 成分、12 个簇；直接取用样品用 30 个 NMF 成分、15 个簇。由于参数不同，4D-STEM 图上表观晶粒尺寸的差异只作定性解读；表面晶粒尺寸的定量测量由独立的 AFM 分析提供。

聚类完成后，把每个簇图内的空间连通分量算作一个晶粒区；同一簇标签但不相连的区域分别算作独立晶粒区。随后计算代表性平均衍射花样，检查各标注区域对应的衍射特征。刻蚀与硫钝化样品晶粒区较少，衍射花样按簇平均；直接取用样品晶粒区较多，按各晶粒区分别平均。后处理中，小于 $25 " nm"^2$ 的晶粒区依据衍射花样相似性并入相邻区域。

三种样品中，绝大多数平均衍射花样由一组反射主导，可把对应的连通图区指认为晶粒。额外反射可能来自电子束方向上晶粒重叠或二次衍射；少数花样没有占主导的反射组，其对应区域描述为混合衍射特征。因此这些图表示投影晶粒结构，而非薄片全厚内的单个晶粒。

#figure(
  image("fig/stacked_regional_analysis_panels.pdf", width: 56%),
  caption: [不同 InP 衬底上 Nb 薄膜截面 STEM 与 EDS 数据的图像区域分析汇总。左列（a–e）直接取用，中列（f–j）Ar 刻蚀，右列（k–o）硫钝化；每一行对三种样品施加同一分析步骤，行标签列在最左。（a）、（f）、（k）：分割出的近表面与埋底界面分析区，表面区青色、埋底界面区品红。（b）、（g）、（l）：处理的 Nb 信号叠加提取的 Nb 薄膜掩膜（绿线），定义厚度与面积测量的完整分析区。（c）、（h）、（m）：扣本底的氧强度假彩色图，白色为 Nb 掩膜轮廓。（d）、（i）、（n）：Nb/STEM 一致性分数图，用于识别高无序与低密度候选区——Nb 信号与 STEM 强度同时下降之处；白线标出表面区底部与埋底界面区顶部。（e）、（j）、（o）：高无序掩膜叠加 STEM 像（黄色），标出 Nb 可能不连续和/或结晶性下降的区域，用于氧优先偏析分析；表面区青色、埋底界面区品红。],
) <fig-s-tem-analysis>

#figure(
  image("fig/supplementary_4D-Grain_unmilled.pdf", width: 62%),
  caption: [直接取用 Nb/InP 样品的 4D-STEM 聚类晶粒图与按晶粒区平均的代表性衍射花样。各衍射花样旁的彩色边框与图中晶粒区颜色对应。所示花样在各分割晶粒区内平均、取对数强度标度。对数标度增强弱反射，便于区分结晶、非晶与混合衍射特征。直接取用样品的花样普遍比处理样品复杂：多数由一组反射主导，少数呈混合衍射特征；较弱附加反射可能来自投影晶粒重叠或二次衍射。橙色区对应埋底界面附近的非晶组分，蓝色区对应结晶 InP(001) 衬底。],
) <fig-s-ar>

#figure(
  image("fig/supplementary_4D-Grain_milled.pdf", width: 62%),
  caption: [刻蚀 Nb/InP 样品的 4D-STEM 晶粒区图与按簇平均的衍射花样。显示标度参见 @fig-s-ar，平均方法与花样解释参见附录 S4。橙色区对应埋底界面、Nb 帽界面以及连接二者的通道中的非晶组分，蓝色区对应结晶 InP(001) 衬底。],
) <fig-s-milled>

#figure(
  image("fig/supplementary_4D-Grain_S-passivated.pdf", width: 62%),
  caption: [硫钝化 Nb/InP 样品的 4D-STEM 晶粒区图与按簇平均的衍射花样。显示标度参见 @fig-s-ar，平均方法与花样解释参见附录 S4。],
) <fig-s-sulfur>

= S5 电磁仿真与谐振器设计

电磁仿真在 Cadence AWR AXIEM 中完成，用于设计本工作的电感耦合 CPW 谐振器，确定达到目标谐振频率与外耦合品质因子所需的几何参数。组装成最终谐振器版图之前，先对单个谐振器仿真。

每个谐振器把生成的 GDS 版图作为平面电磁结构导入 AXIEM。仿真前去掉焊接盘，让电磁求解只包含直 CPW 馈线段与电感耦合谐振器几何。最终设计采用中心线宽 42 μm、槽宽 25 μm 的馈线 CPW 几何，谐振器 CPW 几何为中心线宽 35 μm、槽宽 20 μm。衬底按相对介电常数 $epsilon _ r = 12.4$ 的 InP 建模，Nb 金属层按理想导体处理。

== S5.1 端口配置

单谐振器电磁仿真实现为三端口差分面结构 @smitham2025modeling。两个端口置于馈线左、右横截面，对应馈线输入与输出；第三个差分面端口置于谐振器远离开路端的最外端，直接探测谐振器的导纳响应。

每个差分面端口定义在 Nb 层上：正极接 CPW 中心导体，负极接相邻地平面槽边。谐振器靠近传输线的一端短路，最外端开路。

电磁结构嵌入 AWR 原理图环境做参数提取。左、右馈线端口各经一只 $50 " Omega"$ 电阻端接到原理图端口 $"P1"$、$"P2"$；谐振器端口直接接原理图端口 $"P3"$。全部导纳与传输测量都在原理图环境提取。

== S5.2 基于导纳的谐振与耦合提取

导纳取值：谐振器自导纳为 $Y_(33)$，谐振器与两个馈线端口之间的转移导纳为 $Y_(13)$ 与 $Y_(23)$。馈线传输用仿真 $S_(21)$ 响应监控。

谐振频率取谐振器自导纳虚部的零点，

$ upright("IM")[ Y_(33) ] = 0 $

零点位置用交越两侧两个频率点线性插值。有效谐振电容由虚导纳响应在谐振处的斜率确定，

$ C _ upright("eff") = ( d upright("IM")[ Y_(33) ] / d omega ) |_( omega = omega _ r ) $

有效外电导按转移导纳计算，

$ R _ upright("eff") = Z _ 0 ( | Y_(13) |^2 + | Y_(23) |^2 ) $

$ Z _ 0 = 50 " Omega" $

外耦合率与 MHz 值、外品质因子分别为

$ kappa = R _ upright("eff") / C _ upright("eff") $

$ kappa_ upright("MHz") = R _ upright("eff") / ( C _ upright("eff") dot 2 pi times 10^6 ) $

$ Q _ upright("ext") = f _ r / kappa $

调谐振器长度、耦合间隙与耦合段长度，达到目标谐振频率与约 $Q _ upright("ext") approx 10^5$ 的目标外品质因子。三只谐振器设计目标频率约 4.7、5.2、5.8 GHz，沿馈线上下交替布置，减小空间拥挤与不想要的谐振器间耦合。

#figure(
  table(
    columns: 7,
    align: (left, center, center, center, center, center, center),
    inset: 5pt,
    table.header([谐振器], [仿真 $f _ r$（GHz）], [$Q _ upright("ext")$], [间隙（μm）], [耦合长度（μm）], [$kappa$（MHz）], [$C _ upright("eff")$（fF）]),
    [A], [4.5216], [101,902], [77.05], [230.00], [0.04437], [961.3],
    [B], [5.4608], [97,479], [100.00], [200.50], [0.05602], [891.6],
    [C], [5.7383], [102,920], [100.00], [164.92], [0.05576], [860.8],
  ),
  caption: [仿真 InP 35/20 谐振器设计参数汇总。谐振器沿馈线自左向右排列；仿真外品质因子瞄准约 $10^5$。],
  kind: table,
  numbering: n => [S-#(n - 4)],
  supplement: [附表],
) <tbl-sim>

= S6 谐振器制备
== S6.1 衬底准备与 Nb 沉积

加工流程如 @fig-s-flow。半绝缘 Fe 掺杂 InP 衬底（Acrotec，(001)，$rho = 2.3 times 10^7 " Omega" times "cm"$）切成 7 × 7 mm 芯片后溶剂清洗：50 °C 丙酮浸泡 10 min，异丙醇（IPA）漂洗。剥离图形化用 AZ-5214 光刻胶旋涂，110 °C 软烘 1 min，i 线接触光刻曝光，设计关键尺寸（CD）20 μm。显影用四甲基氢氧化铵（TMAH）基开发者，做出适合沉积至多 200 nm 金属膜的剥离轮廓。

为与标准约瑟夫森结的材料与工艺流程最大程度兼容，所有溅射在室温进行。标称 130 nm 的 Nb 薄膜在本底压强 $5 times 10^-9 " Torr"$ 的高真空直流溅射腔中沉积：直流功率 80 W、Ar 流量 5 sccm；沉积前先预溅射 10 min 稳定等离子体并清洗 Nb 靶，随后沉积 60 min。

#figure(
  include "fig/processflow.typ",
  caption: [CPW 谐振器加工流程。],
) <fig-s-flow>


== S6.2 硫钝化流程

此前研究表明硫钝化可改善 InP 上金属–氧化物–半导体电容器的电学特性 @lee2019facile。为此在 Nb 沉积前做硫钝化，以抑制原生氧化物再生、改善埋底界面质量。除原生氧化物用 1 % 缓冲氧化物刻蚀液（BOE）：70 mL 去离子水稀释 10 mL 6:1 BOE 原液（Transene）。相邻另一只烧杯中用 20 % 硫化铵水溶液（Thermo Fisher Scientific）配 60 mL 10 % $( "NH"_4 )_2 "S"$ 溶液。处理前另备两大盆去离子水漂洗槽与第三套级联漂洗槽。按器件类型，芯片带图形或无图形装入 PTFE 浸渍篮，在 1 % HF 除氧槽中浸 30 s，随即转入硫化铵槽浸泡 10 min。该处理把表面羟基与原生氧化物物种替换为硫，形成化学键合的硫终止层。高分辨光发射研究表明，该处理在 InP 表面形成约一个单层的硫覆盖，硫原子只与表面铟原子形成桥键 @Tao1992：每个硫原子沿表面与两个相邻铟原子成键，占据与表层磷位相当的位置、略微偏离平面。检测不到 P–S 键，说明钝化表层不保留磷，终止由 In–S 键主导。这种键组态有效饱和表面铟的悬挂键，阻止表面二聚体形成，稳定 (1×1) 表面重构。钝化表面因此具有大大降低的表面态密度和更强的抗原生氧化物再生能力。若存在残余酸，硫离子可能按

$ upright("S")^"2-" + 2 upright("H")^+ -> "H" _ 2 "S" ( upright("g") ) $

反应生成少量硫化氢气体，故全部操作在通风柜最大排风量下进行，确保通风安全。

10 min 硫化物浸泡后，样品依次通过两个短时稀释漂洗槽，再做长时间级联漂洗，直至排水达到稳定 pH 终点——既除净残余酸性物种，又保住硫终止层。湿法处理结束后 10 min 内把样品装入溅射腔进样锁，尽量减少沾污与表面再氧化。芯片按前述方法用铜胶带固定装片。

== S6.3 硫钝化剥离流程

$Q _ upright("i")$ 测量所用的硫钝化谐振器与未钝化对照器件用完全相同的单层 AZ5214 剥离光刻流程制备。硫钝化步骤在旋胶之前、直接在清洗好的裸衬底上进行，因此光刻胶不会经历硫化铵处理的大幅 pH 冲击。衬底初始准备不变：50 °C 丙酮浸泡 10 min、IPA 漂洗、氮气吹干；清洗序列完成后在裸衬底上施加硫钝化流程。随后 110 °C 脱水烘烤 2 min，确保钝化漂洗残留液体完全蒸发。钝化后的衬底以 4000 RPM 旋涂 AZ5214，曝光剂量与显影条件与其他单层 AZ5214 剥离片完全相同。

这样，硫钝化与未钝化谐振器之间，光刻线宽、侧壁轮廓与剥离几何保持一致。$Q _ upright("i")$ 的任何差异都可以归因于硫处理过的表面，而非光刻流程的变化。

= S7 谐振器测量

== S7.1 硬件配置

三种表面处理的 CPW 谐振器在配 RF 测量系统的 Bluefors SD 稀释制冷机中测量。谐振器芯片装在 Qdevil Qcage.24 中——一种 RF 腔样品座，能把内部谐振压制到 18 GHz 以上，远高于输出线的工作带宽（4–8 GHz）。

测量系统（@fig-s-wiring）由衰减输入线与放大输出线构成，做 $|S_(21)|$ 读出。输入线从 Keysight ENA E5063A 矢量网络分析仪（VNA）端口 1 出发：最高功率测量时 VNA 输出功率从 +10 扫到 +5 dBm、Lab Brick 数字衰减器置 0 dB；较低功率时 VNA 固定 +5 dBm、衰减器从 0 扫到 50 dB，以让 VNA 保持最大输出功率、获得尽可能高的信噪比。有效源功率在 +10 到 −34 dBm 范围内 VNA 中频带宽取 5 Hz；−35 到 −45 dBm（Lab Brick 40–50 dB）取 1 Hz。

衰减器之后，输入线经一只 INMET 直流隔直进入制冷机低温柱；从 50 K 级到混合腔，线上共加入 −76 dB 衰减。进 Qcage 之前，信号经一只 10 GHz 截止的 Eccosorb 滤波器与一只 12 GHz 截止的 K/L 波段带通滤波器滤波。其余输入线元件的插入损耗按器件手册在中位谐振频率约 5 GHz 处取合计 −23 dB。

输出信号离开 Qcage 后先过一只 Eccosorb 滤波器与 Mini-Circuits 带通滤波器（3.4–13 GHz），再经一只 Quinstar 隔离器抑制来自更高温输出链的反射，然后沿制冷机级上行，由 LNF 4 K 高电子迁移率晶体管（HEMT）放大器（+44 dB）放大。室温端，INMET 直流隔直接制冷机顶法兰；再串 MITEQ LNA-30 HEMT（+30 dB）与 MITEQ LNA-40（+40 dB）两台 4–12 GHz 放大器，把信号抬到 VNA 噪底之上。两台室温 MITEQ 低噪放前各插一只 VXHF-392+ 无反射高通滤波器，防饱和并消除带外反射。输出直接接 VNA 端口 2。

频率从 4 扫到 10 GHz 测传输系数 $S_(21)$，谐振器在其各自谐振频率处表现为传输下陷。确定各谐振点后，在谐振频率附近做 3 MHz 跨度的细扫。

#figure(
  include "fig/wiring.typ",
  caption: [Bluefors SD 系统中谐振器 RF 测量的接线图。],
) <fig-s-wiring>

#figure(
  image("fig/unmilled_lowest_milled_m10_fit_windows_abcdef.pdf", width: 66%),
  caption: [直接取用与刻蚀器件的代表性谐振拟合。（a–c）：直接取用样品 $f _ r approx 5.70 " GHz"$ 谐振器最低功率下的拟合，用附录 S8.1 的复 notch 谐振器圆拟合法；（a）测量幅度响应叠拟合模型，（b）IQ 面归一化复响应，（c）相位响应。（d–f）：刻蚀样品非对称谐振器（$f _ r approx 5.04 " GHz"$）高功率下的拟合窗，用附录 S8.2 的最近极–零点法；（d）幅度响应，（e）归一化复响应，（f）相位响应。各图中蓝点为测量数据，红曲线为拟合模型。],
) <fig-s-milled-fit>

= S8 拟合

== S8.1 对称谐振器拟合

实测谐振响应在复传输系数 $S_(21)$ 上表现为一个 notch。虽然幅度响应通常近似洛伦兹形，本工作全部拟合都使用完整复 $S_(21)$ 数据，采用 Baity 等人描述的复 notch 谐振器拟合流程 @Baity2024。拟合响应为

$ S_(21) ( f ) = a e^( i alpha - 2 pi i f tau ) [ 1 - ( Q _ l / | Q _ c | ) dot ( e^( i phi ) / ( 1 + 2 i Q _ l ( f / f _ r - 1 ) ) ) ] $

其中 $f _ r$ 为谐振频率，$Q _ l$ 为负载品质因子，$| Q _ c |$ 为耦合品质因子的幅值，$phi$ 为不对称角，$tau$ 为电延迟，$a e^( i alpha )$ 为整体复前置因子。

按 Baity 等人 @Baity2024，直径修正后的耦合品质因子为

$ Q _ c ^ upright("dia") = | Q _ c | / cos( phi ) $

对应内品质因子

$ 1 / Q _ i ^ upright("dia") = 1 / Q _ l - 1 / Q _ c ^ upright("dia") $

同时记录未修正值

$ 1 / Q _ i ^ "no corr" = 1 / Q _ l - 1 / | Q _ c | $

片上光子占据数按 Baity 等人的表达式计算 @Baity2024：

$ bar(n) = P _ "chip" / ( 2 pi h f _ r^2 ) dot ( 2 Q _ l^2 cos( phi ) / | Q _ c | ) $

其中 $P _ "chip"$ 为器件处的微波功率（瓦）。本实验中它由 VNA 输出功率、Lab Brick 数字衰减与固定的制冷机及元件衰减算出：

$ P _ "chip" ["dBm"] = P _ upright("VNA") ["dBm"] - A _ upright("dig") ["dB"] - 99 " dB" $

不确定度用 Baity 等人的基于残差的协方差程序估计 @Baity2024；$Q _ l$、$| Q _ c |$、$f _ r$、$phi$ 的报告不确定度传播到 $Q _ i ^ upright("dia")$ 与 $Q _ i ^ "no corr"$。

== S8.2 非对称谐振器拟合

多数谐振用上述直径修正圆拟合法处理。但刻蚀样品约 $5.04 " GHz"$ 的谐振器线形强不对称，与器件或微波测量链中阻抗失配引起的寄生反射一致 @Deng2013，因此该谐振单独处理：Baity 圆拟合对这条谐振给出反常巨大的耦合品质因子（$| Q _ c | > 10^7$），由此换算的光子占据数比同一功率标定下相邻谐振器低了几个数量级，故本谐振不使用 Baity 法的 $Q _ c$、$Q _ i$ 与光子数。

取而代之，刻蚀样品这条约 $5.04 " GHz"$ 谐振用 Deng、Otto、Lupascu 的最近极–零点方法（CPZM）@Deng2013 独立拟合：局部复传输建模为带光滑复背景的有理极–零点响应，

$ S_(21) ( f ) = B ( f ) dot ( x - z ) / ( x - p ) , space q " " x = ( f - f _ upright("ref") ) / Delta f $

$B(f)$ 为复线性背景，$p = p _ r + i p _ i$ 为拟合极点，$z = z _ r + i z _ i$ 为拟合零点。该模型用极–零点几何（而非 Baity 的直径修正角 $phi$）刻画不对称线形。

谐振频率与负载品质因子由极点提取：

$ f _ r = f _ upright("ref") + p _ r Delta f , space q " " gamma = | p _ i | Delta f , space q " " Q _ l = f _ r / ( 2 gamma ) $

耦合由极–零点间距提取：

$ d _ upright("pz") = ( p - z ) / ( i p _ i ) , space q " " | Q _ c | _ upright("pz") = Q _ l / | d _ upright("pz") | $

内品质因子

$ 1 / Q _ i ^ upright("pz") = 1 / Q _ l - 1 / | Q _ c | _ upright("pz") $

本方法不用 Baity 不对称角，因此该谐振的导出值按 $phi = 0$ 报告，并取

$ Q _ c ^ upright("dia") = | Q _ c | _ upright("pz") , space q " " Q _ i ^ upright("dia") = Q _ i ^ "no corr" = Q _ i ^ upright("pz") $

片上功率标定与其他谐振相同：

$ P _ "chip" ["dBm"] = P _ upright("VNA") ["dBm"] - A _ upright("dig") ["dB"] - 99 " dB" $

该谐振的光子占据数用极–零点耦合品质因子计算：

$ bar(n)_ upright("pz") = P _ "chip" / ( 2 pi h f _ r^2 ) dot ( 2 Q _ l^2 / | Q _ c | _ upright("pz") ) $

即功率标定不变，只是把功率换算成光子数所用的耦合品质因子取自 CPZM 极–零点拟合，而不是取自失效的 Baity 圆拟合。

#set text(lang: "en", size: 9pt)
#set par(leading: 0.55em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
