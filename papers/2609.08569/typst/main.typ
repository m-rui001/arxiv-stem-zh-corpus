#set document(title: "采用 CMP 平坦化工艺制备高质量 Nb/Al-AlOx/Nb 十字型约瑟夫森隧道结")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: 2em, spacing: 0.6em)
#set heading(numbering: none)
#set math.equation(numbering: "(1)")
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
#show figure.caption: set text(size: 8pt)
#show figure: set block(below: 0.7em)

#align(center)[#text(size: 13pt, weight: "bold")[采用 CMP 平坦化工艺制备\ 高质量 Nb/Al-AlOx/Nb 十字型约瑟夫森隧道结]]
#v(0.6em)
#align(center)[#text(size: 9.5pt)[Alexander Stoll#super[1]，Andreas Reifenberger#super[1]，Daniel Hengstler#super[1]，Andreas Fleischmann#super[1]，Christian Enss#super[1]]]
#align(center)[#text(size: 8.5pt)[#super[1] 海德堡大学基尔霍夫物理研究所，德国海德堡]]
#v(0.4em)
#align(center)[#text(size: 8.5pt)[关键词：约瑟夫森隧道结，Nb/Al-AlOx/Nb 三层膜，化学机械抛光，平坦化，微纳加工]]
#v(0.8em)

#block(width: 92%, inset: (x: 1em), above: 0.5em, below: 1em)[
  #text(size: 9.5pt)[
    #text(weight: "bold")[摘　要]　约瑟夫森隧道结（JJ）是当今最先进的超导电子器件的基本构件，量子比特和超导量子干涉器件（SQUID）都建立在它之上。这类器件正走向晶圆级规模化，因此对制备工艺的精确控制提出了硬要求——只有工艺稳定，质量才谈得上均匀、结果才谈得上可复现。目前制作直流 SQUID 多用窗口型约瑟夫森结：可靠、可复现是它的长处，但光刻带来的对准误差和无法避免的寄生电容会限制 SQUID 的能量灵敏度。改用十字型几何就能绕开这两个问题，结区可以做得更小，寄生电容也不存在了。本文讨论基于 Nb/Al-AlOx/Nb 的十字型结的制备：把三层膜埋进溅射沉积的 SiO#sub[2] 里，既让结构表面平坦，又保证底电极侧壁绝缘可靠。去除多余 SiO#sub[2] 时我们没有用掀版（lift-off），而是采用化学机械抛光（CMP）。掀版既费时间，又容易在微结构边缘留下多余的"翅膀"，威胁后续膜层；CMP 不但快得多，得到的表面还平滑均匀，直接提高了结的成品率——晶圆级成品率超过 $90 %$。我们还逐一讨论了工艺细节对结质量和电学性质的影响：结面积最小做到 $1 $ µm × $1 $ µm，散布于整片晶圆；从 $I$–$V$ 曲线和 Fraunhofer 图样中提取了表征结质量的若干特征量。
  ]
]

= 1 引言

约瑟夫森隧道结是一大类超导器件的核心元件。直流 SQUID 是当下最灵敏的磁通传感器 [@Clarke2004]，用它来读出的低温探测系统包括金属磁量热计 [@Fleischmann2009] 和转变沿传感器 [@DeLucia2024]；超导量子比特 [@Krantz2019] 处在量子计算研发的前线，同样离不开约瑟夫森结；此外还有快速单磁通量子电路 [@Bairamkulov2024]、约瑟夫森参量放大器 [@Aumentado2020] 等一批超导电路。这些器件对制备工艺的要求有两层：一层是流程成熟可靠，能稳定做出高质量的结；另一层来自超导电子学日益增长的规模化和集成需求——要在整片晶圆上批量做出质量一致的结。满足第二层要求，就得紧盯并优化制备中的每一步，还要把每一步调到与现有洁净间设备的实际能力相匹配。用常规光学光刻，Nb/Al-AlO#sub[x]/Nb 三层膜已经是直流 SQUID 里做结的成熟选择 [@Gurvitch1983; @Kempf2013]。

现在直流 SQUID 的量产仍以窗口型结为主 [@Meckbach2013]：隧道势垒的面积由绝缘窗口上的开口定义。我们研究的则是十字型结的制备流程。同样的光刻分辨率下，十字型允许的结面积更小，而且不存在窗口型结构里那种寄生电容，SQUID 的能量灵敏度因此可以更好。我们此前的工作 [@Adam2024] 给出了一套十字型结的制备方法，本文在其基础上把流程改得明显更快，同时避免掀版留下的 SiO#sub[2] 等绝缘材料残留。两处改进都落在同一个关键步骤上：用化学机械抛光（CMP）取代掀版。CMP 还顺带保证了三层膜均匀、平滑地嵌入 SiO#sub[2]，不会伤及后续膜层。下面会看到，这套流程在晶圆尺度上给出的是均匀、高质量的结。

= 2 制备工艺

#include "fig/fabscheme.typ"

图 @fig-fabscheme 给出整套流程的概览。第一步（图 @fig-fabscheme a）是在衬底上原位沉积 Nb/Al-AlO#sub[x]/Nb 三层膜。衬底是 $381 $ µm 厚的 3 英寸硅片，表面已热生长 $250 $ nm 的 SiO#sub[2]。沉积用 PreVAC 磁控溅射系统，它由两个腔室组成：超高真空溅射腔（本底压强 $p _ 0 approx 2 times " 10"^"−8" $ mbar）配 4 英寸铌靶（面相对置几何）和 2 英寸铝靶（共焦几何）；另一个是负载锁腔，用于装卸晶圆、离子枪清洗和三层膜的氧化。三层膜从底电极开始，先溅射 $125 $ nm 厚的 Nb。溅射参数要调到让薄膜带一点压应力 [@Imamura1992; @Imamura1992b]，我们的条件是功率 $P = 700 $ W、Ar 分压 $p _ "Ar" = 5 times " 10"^"−3" $ mbar。图 @fig-stressmap 是一片 $200 $ nm 厚 Nb 膜沉积在硅片上的应力分布图，可以看出这种应力分布是理想的。

底电极之后，溅射 $14 $ nm 厚的 Al，参数为 $P = 450 $ W、$p _ "Ar" = 4 times " 10"^"−3" $ mbar。冷却 $30 $ min 后把晶圆转入负载锁腔，在 $p _ "ox" = 33.3 $ mbar 的氧气氛围中氧化铝层 $t _ "ox" = 65 $ min，得到约 $j _ "c" = 220 $ A/cm² 的临界电流密度。最后溅射 $200 $ nm 厚的顶 Nb 电极（$P = 700 $ W，$p _ "Ar" = 5 times " 10"^"−3" $ mbar），三层膜完成。

接着在晶圆表面旋涂正性光刻胶，用 MLA150 直写光刻系统图形化。做两片晶圆时我们用了两种光刻胶：晶圆 A 用 AZ ECI 3012，晶圆 B 用 AZ MIR 701——原因是 AZ ECI 3012 的胶模存在不均匀性，第 4 节会看到它造成的后果。然后用若干道连续刻蚀把胶模转移到三层膜上（图 @fig-fabscheme b）。顶、底 Nb 电极走干法 ICP-RIE，设备是 Oxford PlasmaPro 100 Cobra，气体为 SF#sub[6] 与 Ar，流量比 2:1。刻蚀参数调到让侧壁竖直：HF 功率 $P _ "HF" = 30 $ W，ICP 功率 $P _ "ICP" = 300 $ W，气压 $20 times " 10"^"−3" $ mbar；SF#sub[6] 与 Ar 的流量分别为 $20 $ sccm 和 $10 $ sccm。终点用光学发射光谱监测，再过刻 $15 $ s，确保整片晶圆刻穿。底电极的一次典型刻蚀结果见图 @fig-semetched。Nb 刻蚀前后各加一道 Ar 刻蚀：前者清表面，后者去掉刻蚀副产物——这一步显著改善了后续溅射 SiO#sub[2] 在衬底上的附着。Al-AlO#sub[x] 隧道势垒用湿法刻蚀，溶液体积比为 $16 : 8 : 1 : 1$ 的 H#sub[3]PO#sub[4] : HNO#sub[3] : CH#sub[3]COOH : H#sub[2]O。

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/4mubar_PressureMap.jpg", width: 100%),
  caption: [3 英寸硅片上 $200 $ nm 厚 Nb 膜的机械应力分布图。测量方法是沿 $60 $ mm 长的直线测高度轮廓，在九个晶圆取向上每隔 20° 测一条（Bruker Dektak XT 轮廓仪），Nb 沉积前后各测一次以算出薄膜应力。图中颜色是这九条线的插值结果。],
) <fig-stressmap>
], [
#figure(
  image("fig/SEM_EtchedNb.pdf", width: 100%),
  caption: [宽 $2 $ µm、高 $200 $ nm 的刻蚀 Nb 结构的 SEM 照片，顶部还留着正性光刻胶 AZ MIR 701，可以看出 Nb 刻蚀侧壁接近竖直。胶侧壁上明暗相间的条纹是激光直写时入射光与反射光干涉留下的。],
) <fig-semetched>
])

三层膜图形化之后，用同一块光刻胶模作掩版、不掀版地溅射 SiO#sub[2]，把底电极与后续引出用的 Nb 层隔开（图 @fig-fabscheme c）。胶模的遮挡效应会让局部的有效沉积速率下降最多 $50 %$，所以我们按名义厚度 $500 $ nm 沉积，确保底电极侧壁完全绝缘。随后送入 GNP POLI-400L 抛光机，用 4 英寸膜片卡盘把三层膜结构平坦化（图 @fig-fabscheme d）。贴晶圆的膜片加压到 $p _ "head"$，膜片外围的挡环加压到 $p _ "ret"$，为的是让晶圆面上的接触应力均匀 [@Zhao2013]。

抛光行为本身放在 2.1 节讨论。卡盘是按 4 英寸晶圆设计的，而我们的晶圆只有 3 英寸，因此自制了一圈边缘轮廓控制（EPC）环，材料是 $400 $ µm 厚的玻璃纤维增强塑料。抛光液用 ACESOL 1280，其中的 SiO#sub[2] 颗粒平均直径 $80 $ nm，承担机械刻除作用。膜片压力 $p _ "head" = 138 $ mbar、挡环压力 $p _ "ret" = 103 $ mbar 时，我们溅射的 SiO#sub[2] 的材料去除速率约 $128 $ nm/min；抛光 $70 $ s，片内均匀性（WIWNU）和片间均匀性（WTWNU）都很好。平坦化后的三层膜见图 @fig-planarized。结构周围 SiO#sub[2] 上那道凹槽来自遮挡效应，可以通过多沉积一些 SiO#sub[2]、或者改用各向同性的沉积方式（ALD、PECVD）来消除。不掀版就沉积 SiO#sub[2] 的好处在于：能保证顶电极与后续引出电极之间是可靠的超导连接，这一点下一节还要展开。这样抛光时只需专心把表面做平，不必迁就结区内外去除速率不一致之类的边界条件。作为替代方案，也可以先掀版再抛光、把残余的 SiO#sub[2] "翅膀"磨掉——这条路我们尚未验证。

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/SEM_PlanarizedTrilayer.pdf", width: 100%),
  caption: [平坦化后宽 $2 $ µm 的 Nb/Al-AlO#sub[x]/Nb 三层膜的 SEM 照片，对应图 @fig-fabscheme d。],
) <fig-planarized>
], [
#figure(
  image("fig/CrossTypeJJ_OpticalMicroscopePic.pdf", width: 100%),
  caption: [按图 @fig-fabscheme 流程做出的 $2 times 2 $ µm² 十字型结的光学显微镜照片。],
) <fig-optical>
])

平坦化完成后溅射 $200 $ nm 厚的引出 Nb 层。引出电极的图形化与三层膜类似：涂正性光刻胶（晶圆 A 用 AZ ECI 3012，晶圆 B 用 AZ MIR 701），激光直写把条带方向做在与三层膜条带垂直的方向上，再用干法 ICP-RIE 把胶模转移到引出层上，同时刻掉三层膜未被覆盖部分的顶 Nb（图 @fig-fabscheme e）。此时 Al-AlO#sub[x] 层露了出来，再做一次湿法刻蚀就完成结区定义——两条垂直条带的交叠面积就是约瑟夫森结的面积（图 @fig-fabscheme f）。成品十字型结见图 @fig-optical。

== 2.1 抛光行为

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/CMP_Test_withoutStructures.pdf", width: 82%),
  caption: [3 英寸硅衬底上溅射 SiO#sub[2] 的高度轮廓，CMP 前（■）后（▲）对比。材料去除速率 MRR（●）标在右轴。],
) <fig-cmpwo>
], [
#figure(
  image("fig/CMP_Test_withStructures.pdf", width: 82%),
  caption: [3 英寸硅衬底上先做 Nb 结构、再溅射 SiO#sub[2] 的高度轮廓，CMP 前（■）后（▲）对比。材料去除速率 MRR（●）标在右轴。],
) <fig-cmpw>
])

为了摸清 GnP Poli-400L 的抛光行为，我们先测溅射 SiO#sub[2] 的材料去除速率（MRR），样品是 3 英寸硅衬底上无 Nb 结构和有 Nb 结构的两批，SiO#sub[2] 总厚度用 Filmetrics F40 白光干涉膜厚仪测。$p _ "head" = 138 $ mbar、$p _ "ret" = 103 $ mbar 下的结果见图 @fig-cmpwo 和图 @fig-cmpw。注意测得的总厚度里还包含衬底本身名义 $250 $ nm 厚、很均匀的热氧化层。可以看到溅射 SiO#sub[2] 本来相当不均匀，CMP 之后就平坦了。从这两张图还能提取抛光结果的均匀性：排除最靠近边缘的 $5 $ mm 环带后，有结构和无结构的晶圆 WIWNU 都约 $5 %$；WTWNU 在有结构时约 $6 %$，无结构时约 $1 %$。就晶圆级平坦化三层膜而言，这些数字够用。

我们还做了不同几何的测试结构——条带、圆环，宽度和间距、角度各异——用来评估抛光对"已图形化 Nb + 溅射 SiO#sub[2]"这片晶圆的影响，主要看两件事：会不会磨穿到 Al-AlO#sub[x] 层，以及 MRR 是多少。实测发现：横向尺寸大于 $10 $ µm 的 Nb 结构顶部会留下一层几十纳米厚的 SiO#sub[2] 残膜，而结构周围的 SiO#sub[2] 已经被磨到 Nb 高度以下；残膜厚度还随 Nb 结构的横向尺寸系统变化，结构越大残膜越厚。为了不留下这种 SiO#sub[2] 残膜，我们最终选择带着光刻胶模沉积绝缘层、带着胶模抛光。

用这种"胶垫在 SiO#sub[2] 下面"的抛光方案时，成品率取决于三层膜的厚度比。顶电极取 $100 $ nm（即底/中/顶 = $100 $/$14$/$100 $ nm）时，约 $70 %$ 的结能用，其中 $40 %$ 只能算低质量。把顶电极加厚到 $200 $ nm，成品率跳到 $90 %$ 以上（见第 4 节），而且抽检的结里没有低质量的。原因可能有二：CMP 会损伤顶 Nb 电极，甚至磨进氧化势垒；$100 $ nm 顶电极的晶圆在 SiO#sub[2] 过抛时更容易出现引出 Nb 与底 Nb 短路。因此最终把厚度比定为 $125$/$14$/$200 $ nm（自下而上）。

另外，文献 [@Anders2017] 里的支撑结构我们并不需要，抛光后不加刷洗步骤也能做出高质量的十字型结，尺寸从 $4.2 times 4.2 $ µm² 一直做到 $1 times 1 $ µm²（见 4.4 节）。但宽度小于 $1 $ µm 时成品率明显下降。一个合理的解释是抛光液残留：SiO#sub[2] 颗粒平均直径 $80 $ nm，它们聚成小团，留在 Nb 结构的边缘和顶部，图 @fig-innerouter 的 SEM 照片里能看到。这样看来，若要把结做得更小，抛光后需要加一道专门的清洗（例如刷洗）来去除抛光液残留。

#figure(
  image("fig/SEM_InnerAndOuterJJ.pdf", width: 60%),
  caption: [晶圆 A 上名义尺寸 $1 times 1 $ µm² 的结的 SEM 照片。左：晶圆边缘区域；右：晶圆中心区域。两者结构尺寸明显不同，来自光刻胶显影的不均匀。],
) <fig-innerouter>

= 3 测量装置

含 CMP 步骤做出的十字型结，在 $T = 4.2 $ K 下用四线法测 $I$–$V$ 曲线，线路示意见图 @fig-setup。信号发生器输出 $5 $ Hz 三角波电压，送入差分电压放大器；放大器接到室温滤波盒，盒里是 RC 滤波元件，用来压制外部高频噪声。滤波盒再经两对双绞线连到浸在 $4.2 $ K 液氦里的下一级滤波元件。流过结的电流为

$ I _ "JJ" = V _ "diff" slash ( R _ 1 + R _ "filter" + R _ "JJ" ( V _ "JJ" ) ) = 1 slash ( R _ 1 + R _ "filter" ) × [ V _ "diff" − V _ "JJ" ] $ <eq-ijj>

其中 $R _ "JJ"(V) = V _ "JJ" slash I _ "JJ"$，$R _ "filter" = 10.3 $ kΩ 是滤波电阻的总串联阻值。电流是间接测的：取串联电阻 $R_1$ 上的压降并放大。结的电压响应 $V _ "JJ"$ 经类似的滤波元件和一级电压放大器读出。为屏蔽外磁场，浸入液氦的部分加了圆柱形 Nb 罩和 Cryoperm 磁屏蔽。结外面套一对亥姆霍兹线圈，用来测 Fraunhofer 图样——即结的最大超导电流 $I _ "s"^"max"$ 随外加磁场的变化 [@Barone1982]。

#figure(
  image("fig/ExperimentalSetup.pdf", width: 78%),
  caption: [四线法测量线路。左侧红框是室温电子学：信号发生器接差分电压转换器，再接滤波盒；电流由 $R_1$ 上的压降测得，差分输出放大器的增益由阻值比 $R _ "F" slash R _ "G"$ 设定，$V _ "s+"$ 与 $V _ "s−"$ 是所用差分放大器 THS4531 的供电端，该放大器由电池供电。右侧蓝框是液氦杜瓦内 $T = 4.2 $ K 的部分：额外的滤波元件，以及被一对亥姆霍兹线圈包围的约瑟夫森结。两温区之间用双绞线连接。结的电压响应 $V _ "JJ"$ 经低温与室温滤波元件和一级电压放大器读出，即蓝、红框下半部分所示。],
) <fig-setup>

用这套线路测得的曲线见图 @fig-1um 和图 @fig-2um，图上同时标出了提取出的质量参数。零电压区给出与结面积相关的开关电流 $I _ "sw"$，即结在 $4.2 $ K 下平均切换到电压态的电流。由于有限温度下结势垒本征电阻的热噪声占主导，$I _ "sw"$ 与真正的临界电流 $I _ "c"$ 有差别 [@Ambegaokar1969; @Fulton1974; @Falco1974]。我们按 $I _ "c" = kappa I _ "gap"$ 反推临界电流 [@Likharev1979]，该关系假定临界电流密度在空间上均匀分布；与晶圆相关的因子 $kappa$ 的求法见 [@Adam2024]，下面的临界电流分析都沿用它。电压态给出能隙电压 $V _ "gap"$、正态电阻 $R _ "N"$ 和亚隙电阻 $R _ "sg"$；测亚隙电阻按惯例取亚隙区内 $2 $ mV 处的电流值。

有了这些量，就能考察结参数随面积的标度关系，以及晶圆级均匀性（见第 4 节）。其中亚隙电阻与正态电阻之比 $R _ "sg" slash R _ "N"$ 是与面积无关的势垒质量指标：亚隙电阻低意味着准粒子泄漏大，势垒有缺陷 [@Du2007; @Tolpygo2012]。特征电压 $V _ "c" = I _ "c" R _ "N"$ 同样应当与面积无关，它反映不同结面积下势垒质量是否一致。CMP 工艺尤其要盯这两个量，因为抛光压力有可能伤到势垒 [@Yamamori2008]。能隙电压则反映 Nb 电极的超导性能好坏，也提示 Al/Nb 界面被邻近效应影响的程度。

= 4 抛光十字型约瑟夫森隧道结的质量分析

本节看 $I _ "c"$、$R _ "N"$ 这类与面积相关的量如何随结面积标度，以此评估晶圆上结参数的质量与均匀性。数据来自两片用不同光刻胶做的晶圆：晶圆 A（AZ ECI 3012）和晶圆 B（AZ MIR 701）。两片上都有设计宽度为 $1$、$2$、$2.4$、$3$、$4.2$ µm 的结。晶圆 A 是原理验证，测得最充分，结果也暴露出这种光刻胶会在晶圆上给出很不均匀的图形尺寸——中心区与边缘区的对比见图 @fig-innerouter。边缘区的结宽实际小了最多 $500 $ nm，于是临界电流偏低、正态电阻偏高，设计尺寸 $1 times 1 $ µm² 的那批成品率也偏低（见 2.1 节）。晶圆 B 因此换了光刻胶，线宽在整片上就均匀了。尽管如此，两片晶圆整体上仍给出 $90 %$ 以上的高质量结成品率。

== 4.1 晶圆 A（AZ ECI 3012）的临界电流与正态电阻标度

图 @fig-1um 和图 @fig-2um 是晶圆 A 上两个结的 $I$–$V$ 曲线：$1 times 1$ µm² 的十字型结确实做出来了，而且曲线带磁滞，说明这批结质量不错。由于前面提到的晶圆上结构尺寸不均匀，我们把有效面积按 $A _ "JJ,eff" = ( w _ "N" + Delta w )^2$ 修正，$w _ "N"$ 是结的名义宽度，$Delta w$ 是补偿量，用来吸收过刻、胶模过显影之类的偏差。整片、中心区、边缘区各拟合一个独立的补偿量 $Delta w _ "tot"$、$Delta w _ "in"$、$Delta w _ "out"$：中心区取以晶圆中心为圆心、直径 $1$ 英寸的圆，其余算边缘区。设计为 $1 times 1$ µm² 的结大多实际偏小，又受抛光后清洗问题影响（见 2.1 节），本节分析把它们排除在外，只看设计宽度 $2$、$2.4$、$3$、$4.2$ µm 的结。

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/CrossJJ4w13v31_1A13_1umJJ.pdf", width: 100%),
  caption: [晶圆 A 中心区某芯片上一个 $1 times 1 $ µm² 结的 $I$–$V$ 曲线。越过开关电流后曲线有轻微负斜率，因为电阻跳变量级与滤波元件相当；正是这个斜率使得该结的 $R _ "sg"$ 无法给出。],
) <fig-1um>
], [
#figure(
  image("fig/CrossJJ4w13v31_1A13_2umJJ.pdf", width: 100%),
  caption: [晶圆 A 中心区某芯片上一个 $2 times 2 $ µm² 结的 $I$–$V$ 曲线。],
) <fig-2um>
])

先看临界电流（图 @fig-icarea）。对全部数据作线性拟合，得到 $Delta w _ "tot" = −628 plus.minus 118 $ nm，临界电流与修正后面积 $A _ "JJ,corr"$ 成正比，斜率给出临界电流密度 $j _ "c" = 220 plus.minus 5 $ A/cm²。不过临界电流的离散程度与结在晶圆上的位置有关，分区域拟合更合理。

中心区和边缘区的宽度修正分别为 $Delta w _ "in" = −407 plus.minus 61 $ nm 和 $Delta w _ "out" = −815 plus.minus 94 $ nm，如前所述，这来自制备偏差让有效隧穿面积变小。两区修正相差 $408 $ nm，与图 @fig-innerouter 中 SEM 照片观察到的差值大致吻合。这种不均匀的显影结果在同一款光刻胶上是可以复现的。分区拟合的临界电流密度为 $j _ "c,in" = 214 plus.minus 2 $ A/cm²（中心）和 $j _ "c,out" = 227 plus.minus 4 $ A/cm²（边缘），两者也很接近。这种一致性说明膜片式 CMP 卡盘在抛光时施加的压力足够均匀——若压力不均，势垒受力差异会体现在拟合结果上。

正态电阻 $R _ "N"$ 同样随面积良好标度，与结在晶圆上的位置无关（图 @fig-rnarea）。整片拟合给出正态电阻率 $rho _ "N" = 743 plus.minus 26 $ Ω·µm²，对应宽度修正 $Delta w _ "tot" = 489 plus.minus 185 $ nm#footnote[原文此处单位印作 µm，且符号与其余 $Delta w$ 相反；按上下文应为 nm，此处径改。]。分区拟合为 $rho _ "N,in" = 731 plus.minus 17 $ Ω·µm²、$rho _ "N,out" = 843 plus.minus 15 $ Ω·µm²。如预期，边缘区线宽更窄，电阻率偏高。中心与边缘的差别也反映在宽度修正上：$Delta w _ "in" = −279 plus.minus 148 $ nm、$Delta w _ "out" = −499 plus.minus 97 $ nm；与临界电流拟合得到的修正值比较，考虑到标准误差，两者吻合得不错。

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/IcVsArea_combined_v31.pdf", width: 100%),
  caption: [结的临界电流 $I _ "c"$ 对修正后结面积 $A _ "JJ,corr"$ 作图，修正后的宽度为 $w _ "N" + Delta w _ "tot"$。修正量的确定以线性拟合过原点为准则。],
) <fig-icarea>
], [
#figure(
  image("fig/NormalStateResistance_AChips_combined_v31.pdf", width: 100%),
  caption: [结的正态电阻 $R _ "N"$ 对修正后面积倒数 $1 slash A _ "JJ,corr"$ 作图，修正后的宽度为 $w _ "N" + Delta w _ "tot"$。面积修正体现为横轴平移，同样以线性拟合过原点为准则。],
) <fig-rnarea>
])

把 $I _ "c"$ 对 $R _ "N"$ 作图、按 $V _ "c" slash R _ "N"$ 拟合，得到与面积无关的特征电压 $V _ "c" = 1.39 plus.minus 0.02 $ mV。这说明势垒质量一致，CMP 没有破坏晶圆上的均匀性。两区之间虽有差别，但只要光刻胶模足够均匀，这套工艺就能保证这两个量随结面积标度——晶圆 B 的结果（4.4 节）是另一个例子。

== 4.2 晶圆 A（AZ ECI 3012）的电阻比与能隙电压分布

电阻比画成直方图并与高斯拟合比较（图 @fig-rra），得到 $38.3 plus.minus 1.5$，说明整片晶圆上结的质量高且均匀。与不含 CMP 的工艺流程的平均值 $44.3$ [@Adam2024] 相比，这个数略低，可能是抛光给 AlO#sub[x] 势垒引入了应变。但两者分布宽度非常接近，也就是说加入 CMP 这一步没有影响均匀性。

能隙电压的分布见图 @fig-gva，平均值 $2.84 plus.minus 0.03$ mV，与体 Nb（转变温度 $T _ "c" = 9.25 $ K）的 BCS 理论值符合得很好，也与测得的体铌数值一致 [@Novotny1975]，说明邻近效应可以忽略。
#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/ResistanceRatio_combined_v31.pdf", width: 100%),
  caption: [晶圆 A 各结电阻比 $R _ "sg" slash R _ "N"$ 的分布及高斯拟合。],
) <fig-rra>
], [
#figure(
  image("fig/GapVoltage_AChips_combined_v31.pdf", width: 100%),
  caption: [晶圆 A 各结能隙电压 $V _ "gap"$ 的分布及高斯拟合。],
) <fig-gva>
])

== 4.3 晶圆 A 结的 Fraunhofer 图样

为考察临界电流在结内部的空间分布，我们在不同磁场下测临界电流，再分析得到的 Fraunhofer 图样。磁场由亥姆霍兹线圈对提供，$3 times 3$ µm² 结的结果见图 @fig-fraunhofer。拿图 @fig-fraunhofer b 的电流分布去拟合，实测图样就能很好地重现。电流密度分布的模型是：对宽度 $3 $ µm 的矩形函数两端施加升余弦滤波，边缘过渡厚度取 $800 $ nm。让边缘平滑，是因为顶、底电极干法刻蚀时三层膜边缘通常会有一定损伤。不含 CMP 的结也做过类似分析 [@Adam2024]，得到的临界电流分布与此相近，再次说明多加的抛光步骤没有明显改变临界电流密度分布。由第一个极小值所在磁场 $B _ "min"$ 可定出磁厚度 $t _ "B" = Phi _ 0 slash ( B _ "min" L )$，其中 $L$ 是结宽。结合 Al-AlO#sub[x] 层厚度 $d _ "Al"$，按 $t _ "B" = 2 lambda _ "Nb" + d _ "Al"$ 反推出 Nb 的有效穿透深度 $lambda _ "Nb" approx 84 $ nm。这里用的 Nb 膜厚在 $125$–$200 $ nm 范围，该值与文献 [@Gubin2005] 报道的膜厚依赖穿透深度符合得很好。

#figure(
  image("fig/FraunhoferPattern.pdf", width: 76%),
  caption: [a）一个 $3 times 3$ µm² 结的归一化超导电流随外磁场的变化，呈 Fraunhofer 型图样；实线是用 b）的电流分布算出的拟合，这个分布意在刻画真实结的行为，由升余弦滤波器描述（细节见正文）。注意轮廓边缘的过渡宽度约为我们测得的 Nb 膜有效穿透深度的十倍。],
) <fig-fraunhofer>

== 4.4 晶圆 B（AZ MIR 701）的质量分析

晶圆 A 上中心区与边缘区的差别究竟是不是抛光造成的？换一种光刻胶、换一组氧化参数，工艺还能不能复现？带着这两个问题我们测了晶圆 B——它用 AZ MIR 701 代替 AZ ECI 3012。铝层氧化条件为 $p _ "ox" = 33.3 $ mbar、$t _ "ox" = 15 $ min，对应临界电流密度约 $549 $ A/cm²。$I _ "c"$ 随结面积线性标度见图 @fig-icareab，$R _ "N"$ 随面积倒数同样线性（图 @fig-rnareab）。AZ MIR 701 让线宽均匀性明显改善，因此不必像晶圆 A 那样区分区域。面积修正取 $Delta w _ "c" approx 265 plus.minus 43 $ nm（临界电流图），正态电阻图得到的 $Delta w _ "N" = 297 plus.minus 28 $ nm 与之一致——用两种独立方法定出的宽度修正吻合，说明临界电流的求法可靠。这个修正值比晶圆 A 略小，表明 AZ MIR 701 胶模的图形尺寸更接近设计值；而宽度修正和结参数上的标准误差都更小，说明结面积在整片上更均匀。

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/IcVsArea_combined_v35.pdf", width: 100%),
  caption: [晶圆 B 各结的临界电流 $I _ "c"$ 对修正后结面积 $A _ "JJ,corr"$ 作图。],
) <fig-icareab>
], [
#figure(
  image("fig/NormalStateResistance_AChips_combined_v35.pdf", width: 100%),
  caption: [晶圆 B 各结的正态电阻 $R _ "N"$ 对修正后面积倒数 $1 slash A _ "JJ,corr"$ 作图。],
) <fig-rnareab>
])

不过晶圆 B 的电阻比（$R _ "sg" slash R _ "N" = 31.2 plus.minus 0.8$）和能隙电压（$V _ "gap" = 2.79 plus.minus 0.01 $ mV）都比晶圆 A 略低，直方图见图 @fig-rrb 和图 @fig-gvb。势垒质量下降的原因我们认为是两条叠加。一是时间：做晶圆 B 时距上次优化 Nb 溅射参数已经很久，期间铌靶用掉了很多；通常不重新调参继续溅射 Nb，膜质会退化，进而影响在底铌上长铝的形貌，最后落到势垒质量上。二是氧化时间短，势垒比晶圆 A 的薄，CMP 平坦化施加的压力对它的影响可能更大。即便如此，这两个数值仍然高到足以把这批结归入高质量。与晶圆 A 的分析同理，拟合得到与面积无关的特征电压 $V _ "c" = 1.47 plus.minus 0.02 $ mV，说明结面积一直小到 $1 $ µm²，势垒质量仍然稳定。

#grid(columns: (1fr, 1fr), gutter: 10pt, [
#figure(
  image("fig/ResistanceRatio_combined_v35.pdf", width: 100%),
  caption: [晶圆 B 各结电阻比 $R _ "sg" slash R _ "N"$ 的分布及高斯拟合。],
) <fig-rrb>
], [
#figure(
  image("fig/GapVoltage_AChips_combined_v35.pdf", width: 100%),
  caption: [晶圆 B 各结能隙电压 $V _ "gap"$ 的分布及高斯拟合。],
) <fig-gvb>
])

= 5 结论

本文给出一套 3 英寸晶圆级的十字型结制备方案：用 CMP 取代 SiO#sub[2] 的掀版工序，结尺寸可靠地做到 $1 times 1$ µm²，质量高。与已有的 CMP 工艺相比，不需要额外的支撑结构，也不需要抛光后的刷洗步骤 [@Hidaka2021]。抛光时保留光刻胶，基本解决了 Nb 结构顶部残留 SiO#sub[2] 的难题；把顶电极加厚，晶圆级成品率随之上升。小于 $1$ µm² 的结仍受抛光液残留拖累，成品率下降，这应当可以靠抛光后增加清洗工序解决。有了这套流程，约瑟夫森结的多层集成在质量和成品率上都有了保障，SQUID 以及更一般的基于结的超导量子器件正需要这样的工艺。

#v(0.8em)
#text(size: 9pt)[*致谢*　感谢 T. Wolf 在器件制备过程中的支持。]
#text(size: 9pt)[*资助*　本工作部分受 Baden-Württemberg Stiftung gGmbH（QT-2-QuMaS 项目）和 BMBF 项目 SuperLSI（合同号 13N16255）资助。]
#text(size: 9pt)[*数据可用性*　本工作的数据可凭合理请求向作者索取。]

#set text(lang: "en", size: 9pt)
#set par(leading: 0.55em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
