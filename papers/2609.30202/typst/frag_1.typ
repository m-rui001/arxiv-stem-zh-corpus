#import "macros.typ": *

#block(width: 100%, inset: (left: 1.5em, right: 1.5em, top: 1.1em, bottom: 1.1em), radius: 2pt, stroke: 0.6pt + black)[
  #set par(first-line-indent: 2em)
  #align(center)[#text(weight: "bold")[摘要]]
  扭转 Bernal 堆叠与三方（菱面）堆叠多层石墨烯组装成的莫尔超晶格，承载了一大类由相互作用驱动的磁性态与拓扑态；但除邻近过渡金属硫族化合物（TMD）的体系外，这类系统里始终没有见过超导。本文在六方氮化硼（hBN）封装的扭曲 Bernal 双层–三层石墨烯中，同时实现了初发超导与可调 Chern 绝缘体。扭转角自 $theta = 1.05"°"$ 至 $1.50"°"$，电子掺杂一侧的整数与分数莫尔填充处都会形成 Chern 绝缘体，Chern 数最高达 $|C| = 3$；其大小由扭转角决定，又能随掺杂调节。$theta = 1.18"°"$ 的器件在空穴掺杂一侧出现对称性破缺金属区，能带填充 $nu = -2$ 处是一个平庸绝缘体。仅凭位移场就能把这个绝缘体推入一块初发超导区：转变陡峭，临界电流明确，临界温度在绝缘边界附近取极大值，只是电阻并未真正降到零。面内磁场会撑大这块超导区，使其存续到弱耦合泡利极限的四倍以上，还会稳定出第二块超导区——后者的临界电流呈类弗劳恩霍夫调制，正是相位相干配对的信号。扭曲 Bernal 双层–三层石墨烯由此给出一个栅压可调的单一平台：配对能与 Chern 绝缘体对接，而后者自身的拓扑同样是可调参数。
]

#v(0.6em)

#block(width: 100%)[
  #set par(first-line-indent: 0em)
  #text(weight: "bold")[关键词：]扭曲 Bernal 双层–三层石墨烯 · 初发超导 · Chern 绝缘体 · 莫尔超晶格 · 位移场 · 泡利极限突破
]

范德华（vdW）材料里的平带，把超导、磁性与非平庸拓扑汇聚到同一个栅压可调的平台上@Andrei2020_GrapheneBilayersTwist @Mak2022_SemiconductorMoireMaterials @Nuckolls2024_MoireMaterials @Cao2026_FQAH。在大量由石墨烯与过渡金属硫族化合物构筑的范德华体系中，超导总紧邻某个对称性破缺相出现，磁有序与配对之间究竟有何关联，由此成了悬而未决的问题。平带的量子几何可以直接贡献超流刚度@Peotta2015_TopologicalFlatBands @Tian2023_DiracFlatBandSC，其拓扑又支撑起整数与分数化的量子反常霍尔效应@Sharpe2019_TBGFerromagnetism @Serlin2020_QAH @Cai2023_FQAH @Park2023_FQAH @Lu2024。超导与零场 Chern 绝缘体若同处一张相图，强关联、配对与拓扑三者的相互牵制便可直接考察，在这些态的界面处构造拓扑超导也有了可能。只是目前满足上述条件的范德华体系寥寥可数@Choi2025 @Kumar2025_dual @Stepanov2021_ChernInsulatorsTBG @He2025_HofstadterTBG @Xu2025_UnconventionalSCFQAH。

#fig("1", breakable: false)[
  #text(weight: "bold")[扭转角 $theta = 1.18"°"$ 器件中的整数量子反常霍尔态。]#text(weight: "bold")[a]：底温、零磁场下测得的纵向电阻率 $rho_"xx"$ 随 $nu$ 与 $D$ 变化的分布图。（插图）双栅控扭曲双层–三层石墨烯器件示意图。#text(weight: "bold")[b]：#text(weight: "bold")[a] 中黑色虚线框区域的反对称化霍尔电阻 $rho_"xy"$ 分布图，$B = plus.minus 100$ mT。#text(weight: "bold")[c]：朗道扇图，上为对称化 $rho_"xx"$、下为反对称化 $rho_"xy"$，固定 $V_t = 9.05$ V、沿 #text(weight: "bold")[b] 中黑色虚线扫描 $V_b$ 而得。黑色与白色虚线分别标出 $nu = 1 #sym.slash 2$ 处 $C = 1$ 与 $nu = 1$ 处 $C = 3$ 对应的 Středa 斜率，色标与 #text(weight: "bold")[a]、#text(weight: "bold")[b] 相同。#text(weight: "bold")[d]：分别在 $nu = 1$ 与 $1 #sym.slash 2$ 处来回扫描 $B$ 得到的 $rho_"xy"$ 曲线。#text(weight: "bold")[e]：扭转角各不相同的若干器件中，各 $nu$ 处关联绝缘态的 Chern 数。实心符号表示零场态，空心轮廓表示加场态；星号标出 Chern 数尚不确定的态，其值介于两个整数之间，或介于整数与分数之间。
][
  #image("figs/Fig1_092426.pdf", width: 100%)
]

把石墨烯扭转出莫尔超晶格，为构造拓扑平带提供了一条可行途径。以 Bernal 堆叠或三方（菱面）堆叠多层石墨烯为组分的体系尤受期待，一类类 Chern 数可调的量子反常霍尔态在其中相继现身@Polshyn2020 @Chen2021_TMBG @He2021_TMBG @Waters2024_tMN @Su2025 @Liu2025_HighChernTRG @Dong2025_HighChernFCI @Li2025_HighChernInsulators @Wang2026_QAHTwistedFlatbands @Chen2026_HighChernTRG @Wang2026_HighChernTRG @Dong2026_tRTBGPhaseTransitions。但这些体系至今没有超导报道，唯一的例外是置于 $text("WSe")_2$ 衬底上的扭曲双双层石墨烯@Su2023_TDBGWSe2。这一缺失格外耐人寻味：Bernal 双层与三方多层石墨烯组分本身就具备超导性@Zhou2021_RTGSC @Zhou2022_BBG。扭曲多层体系中配对究竟是内在受抑，还是合适条件尚未找对，仍无定论。

本文表明，扭曲 Bernal 双层–三层石墨烯的初发超导与其 Chern 绝缘体就落在同一张栅压可调的相图里。在扭转角跨越 $0.72"°"$ 至 $1.89"°"$ 的六个器件中，整数与分数莫尔填充处普遍存在关联绝缘体。我们把重点放在 $theta = 1.18"°"$ 的器件上：零磁场下 $nu = 1 #sym.slash 2$、$1$ 与 $3$ 三处的态均已量子化；同一器件的对称性破缺金属区内，$nu = -2$ 处出现一个关联绝缘体。固定填充后抬高位移场，体系便离开这一绝缘态、进入一块初发超导区，最大临界温度 $T_c approx 160$ mK 恰位于绝缘边界近旁。其他石墨烯体系尚未见过这类由能带调节驱动的转变，倒与扭曲 $text("WSe")_2$ 中电致超导–绝缘体转变颇为相似@Xia2025_TwistedBilayerWSe2。
