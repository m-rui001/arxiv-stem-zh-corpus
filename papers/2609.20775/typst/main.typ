// 锗中 flopping-mode 自旋量子比特的相干、超低功耗 EDSR —— arXiv:2609.20775 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排。lane-B。

#set document(title: "锗中 flopping-mode 自旋量子比特的相干、超低功耗 EDSR")
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

// ---- 记号（数学值，可用 $#x$ 插入公式）----
#let bB = $bold(B)$
#let epsi = $epsilon _"12"$
#let tstar = $T _2^"*"$
#let thahn = $T _2^"Hahn"$
#let tcpmg = $T _2^( phi,"CPMG32" )$
#let t1 = $T _1$
#let ffm = $f _"FM"$
#let vP1 = $overline(V) _"P1"$
#let vP2 = $overline(V) _"P2"$
#let vP3 = $overline(V) _"P3"$
#let vBL = $overline(V) _"B12"$
#let vBR = $overline(V) _"B23"$
#let bhat1 = $hat(b) _1$
#let bhat2 = $hat(b) _2$
#let bhat3 = $hat(b) _3$
#let adr = $A _("d,P2")$
#let tcz = $t _c$

#align(center)[
  #text(size: 15pt, weight: "bold")[锗中 flopping-mode 自旋量子比特的\ 相干、超低功耗电偶极自旋共振]\
  #v(4pt)
  #text(size: 10pt)[
    Alexei Orekhov #super[∗]，
    Wonjin Jang #super[∗]，
    Pan Zhang #super[1,2]，
    Konstantinos Tsoukalas #super[1,2]，
    Fabian Oppliger #super[1,2]，
    Franco De Palma #super[1,2]，
    Elena Acinapura #super[1,2]，
    Younghun Ryu #super[1,2]，
    Inga Seidler #super[3]，
    Lisa Sommer #super[3]，
    Leonardo Massai #super[3]，
    Felix J. Schupp #super[3]，
    Matthias Mergenthaler #super[3]，
    Stefano Bosco #super[4]，
    Patrick Harvey-Collard #super[3]，
    Pasquale Scarlino #super[1,2,†] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 瑞士洛桑 1015，洛桑联邦理工学院（EPFL）物理研究所混合量子电路实验室\
      #super[2] 瑞士洛桑 1015，洛桑联邦理工学院（EPFL）量子科学与工程中心\
      #super[3] 瑞士吕施利孔 Säumerstrasse 4，IBM 欧洲研究院–苏黎世\
      #super[4] 荷兰代尔夫特，代尔夫特理工大学 QuTech 与 Kavli 纳米科学研究所\
      #super[∗] 共同第一作者　#super[†] 通讯作者，#link("mailto:pasquale.scarlino@epfl.ch")[邮箱]\
      arXiv:2609.20775 [quant-ph]；中文译本编译于 2026-09-27
    ]
  ]
]

#v(8pt)
#block(width: 100%, inset: (x: 1.5em, y: 1.1em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    半导体量子点里的空穴自旋量子比特能实现高保真度的全电学控制，但在低磁场下——那恰恰是相干性与读出表现最好的区间——常规电偶极自旋共振（electric dipole spin resonance，EDSR）往往要付出相当大的射频驱动功率。在平面锗空穴自旋量子比特中，器件端的驱动功率可以到 −27 dBm，散热与串扰给可扩展架构留下隐患。本文我们在锗中演示一只 flopping-mode（FM）量子比特：单个自旋离域在一只双量子点（double quantum dot，DQD）中，把对电荷噪声的一阶免疫与极高的电驱动效率同时拿到手。沿磁场取向测绘相干甜区之后，我们得到 $#tstar = 1.4$ μs、$#thahn = 11.5$ μs、$#tcpmg = 130$ μs、$#t1 = 226$ μs，并在 $t _(X pi) = 88$ ns 的门时长下实现最高 99.76% 的单比特门保真度。重要的是，这些结果是在近乎同平面、强度仅 5 mT 的磁场下取得的，器件端驱动功率只有 −52 dBm。我们进一步发现，该区间内的量子比特弛豫与双光子 Orbach 过程一致，这为后续优化指出了方向。我们的结果表明 FM-EDSR 足以支撑超低功耗、高保真度的单比特操作，这类改进将惠及可扩展的空穴自旋架构与混合自旋–光子接口。
  ]
]
#v(6pt)

= 1 引言

平面应变 Ge/SiGe 异质结构中的空穴自旋量子比特，如今已是量子计算与量子模拟的一条被寄予厚望的平台 @hendrickxFourqubit2021 @scappucciGermanium2021 @zhang_universal_2025 @morozova_observation_2026。空穴的 $g$ 张量高度各向异性、且随栅压可调，靠 $g$ 张量磁共振（$g$-tensor magnetic resonance，$g$-TMR）就能完成全部单比特电学控制，单比特门保真度已做到 99.9% 以上 @lawrie_simultaneous_2023 @hendrickxSweetspot2024 @dijkemaSimultaneous2026 @ademi2026 @wang_operating_2024。近期在相干性优化 @hendrickxSweetspot2024 @yu_optimising_2026、高保真双比特门 @wang_operating_2024、稳健自旋读出 @kelly_identifying_2025 和相干输运 @ademi2026 上的进展，几乎都工作在 100 mT 以下的低同平面磁场中——这个区间里电荷噪声敏感度低、自旋弛豫率也小。可偏偏同一个低磁场区间把 Rabi 驱动效率一起压了下去：要做到实用的门速，器件端驱动功率通常得在 $P _"drive" approx -27$ dBm 上下（相当于约 10 mV 的驱动电压）@ademi2026 @dijkemaSimultaneous2026 @john_robust_2025。在半导体自旋量子比特的各家平台上，大驱动功率已经和芯片发热 @undseth_hotter_2023、读出保真度退化 @kelly_capacitive_2023 @eggli_coupling_2025 以及串扰 @undseth_nonlinear_2023 @john_robust_2025 挂在了一起；量子比特阵列一旦铺开，低功耗控制就越来越是要紧事 @abraham_digitally_2026 @smet_spin_2026 @wang_operating_2024 @john_robust_2025 @tsoukalas2026 @nguyen_degenerate_2026。

提高单比特门功耗效率的路子有几条。一种观测是：某些空穴占据数下 Rabi 驱动会略有好转 @john_robust_2025。另一条路是利用相邻量子点之间很大的 $g$ 张量差异，用基带脉冲做高保真度的 hopping 门，从而避开介质损耗 @wang_operating_2024 @unseld_baseband_2025；EDSR 与基带门也都可以延伸到输运链路上，让量子比特在输运途中感受到更大的磁场或 $g$ 张量梯度 @bosco2024 @smet_spin_2026 @ademi2026。还有一条路是工作在 flopping-mode 区间：让单个载流子离域横跨一只 DQD @crootFloppingmode2020 @benito2019 @mutter2021。在电荷对称点，被撑大的电偶极可以把自旋–电耦合提高几个数量级。这一增强已经在 Si/SiGe 的电子上 @samkharadzeStrong2018 @miCoherent2018 @dijkema_cavity-mediated_2025、在硅纳米线的空穴上 @yu_strong_2023 @noirot_coherence_2026 实现了强自旋–光子耦合，理论也预言由此可做出又快又省功率、保真度还高的单比特门 @youngBenchmarking2025 @kinikar2026 @teske_flopping-mode_2023 @hu2023。不过增强的偶极同时是一笔交易：让电学控制变强的那套电荷杂化，同样会抬高电荷噪声敏感度并加快弛豫。于是问题就落在——强横向自旋–电耦合，能否与弱纵向易感度、长弛豫时间共存？这仍是高保真操作绕不开的关键一问。

本文我们证明：在平面锗中的一只 flopping-mode 空穴自旋量子比特里，这几个要求可以同时满足。用辅助量子点（quantum dot，QD）中的自旋做 Pauli 自旋阻塞（Pauli spin blockade，PSB）读出，量子比特得以工作在改善相干性的低磁场下。我们研究相干性随磁场取向的各向异性，找出两量子点 Zeeman 能简并的退相位甜区 @hendrickxSweetspot2024 @bassiOptimal2026；在这些甜区上，电荷噪声被压到一阶，而二阶电荷噪声耦合与 Overhauser 场涨落共同限制了量子比特的纵向退相位时间。甜区工作时，我们测得按量子比特频率归一化的 Rabi 驱动效率超过 0.15 Hz/(Hz mV)，比锗中 $g$-TMR 驱动的 Loss-DiVincenzo（LD）定域单量子点自旋量子比特高出两到三个数量级 @dijkemaSimultaneous2026 @john_robust_2025 @tsoukalas_resonant_2025。动力学解耦把相干时间拉到 $#tcpmg = 130$ μs；随机基准测试给出最高 99.76(1)% 的物理平均门保真度，而器件端驱动功率低于 −51 dBm（对应 0.6 mV 驱动电压）。我们还系统测量了自旋弛豫随磁场取向、失谐与隧穿耦合的变化，结果与晶格声子或热光子诱导的二阶 Orbach 过程一致 @tahan_relaxation_2014。最后，把这只 FM 量子比特与同一器件中的 LD 量子比特、以及近期锗平台的自旋量子比特实验放在一起比较，它落在一个相当有利的功率–保真度区间。

= 2 Flopping-mode 量子比特

#figure(
  image("fig/Figure_1_wj_v5.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[a.] 与本文所用器件完全相同的量子点器件的伪彩扫描电镜照片。柱塞栅 $P _i$ 用来调节 QD#sub[$i$] 的化学势，势垒栅 $B _"ij"$ 用来控制 QD#sub[$i$] 与 QD#sub[$j$] 之间的隧穿耦合。$S$、$D$ 是单空穴晶体管（SHT）电荷传感器的源、漏欧姆接触，流过它们的直流电流 $I _"SD"$ 用于对三量子点做电荷传感。
    #text(weight: "bold")[b.] 以虚拟化栅压 $#vP1$、$#vP2$ 为轴测得的 DQD 脉冲电荷稳定图，位于 (1,0,1)–(0,1,1) 电荷转变附近。DQD 能量失谐 $#epsi$ 沿白色箭头方向调节。
    #text(weight: "bold")[c.] 用补充材料「FM 量子比特哈密顿量」一节的哈密顿量算出的本征能量，取自 (1,0,1)–(0,1,1) 电荷转变附近、外加有限 $#bB$ 的情形。黑色与橙色实线分别是自旋向下、自旋向上的电荷基态；黑色与橙色虚线分别是自旋向下、自旋向上的电荷激发态。蓝色（绿色）箭头表示 QD#sub[1(2)] 中空穴的 Zeeman 劈裂。FM 自旋量子比特定义在电荷对称点，即红色虚线处。
    #text(weight: "bold")[d.] #strong[c.] 中黑色与橙色实线两支之间的能量差。上、下两个面板分别假设 QD#sub[1] 与 QD#sub[2] 的 Zeeman 能相差很大与大致相等，并取不同的 Larmor 矢量失配角 $tilde(theta) _12$。上面板中蓝色、绿色虚线分别是 QD#sub[1]、QD#sub[2] 中空穴的 Zeeman 能。
    #text(weight: "bold")[e.] 以 $#vP2$、$#vP3$ 为轴测得的 DQD 脉冲电荷稳定图（见正文），位于 (0,1,1)–(0,0,2) 电荷转变附近。DQD 能量失谐 $epsilon _"23"$ 沿白色箭头方向调节。(0,1,2) 中白色虚线围出的区域即锁存 PSB 读出窗口。
    #text(weight: "bold")[f.] 算出的本征能量随 $epsilon _"23"$ 的变化，取自 (0,1,1)–(0,0,2) 电荷转变附近。S、$T _0$、$T _+$、$T _-$ 分别标记自旋单态与三重态。
    #text(weight: "bold")[g.] 在失谐甜区测得的 FM 自旋量子比特 Rabi 条纹（chevron）图，磁场取向为 $#bhat3$（见「各向异性相干」一节），rf 驱动频率 $f _d$、器件端驱动幅度 550 μV 加在 $#vP2$ 上、驱动时长 $t _"burst"$。此处 $abs( #bB ) = 5$ mT，$#tcz #sym.slash h = 13$ GHz。
  ],
) <fig1>

@fig1 a 给出与本文所用器件完全相同的器件的伪彩扫描电镜照片。器件做在硅衬底上反向组分渐变（reverse-grading）生长的平面 Ge/SiGe 异质结构上 @massai_impact_2024。空穴积累在表面下方 47 nm 处、厚 20 nm 的应变 Ge 量子阱中，欧姆接触为退火后的 PtGeSi @massai_spin_2026。器件有两层栅：第一层放势垒栅与屏蔽栅，第二层放柱塞栅。$P _"cs"$ 下方那只较大的量子点用作单空穴晶体管，通过监测源（$S$）、漏（$D$）欧姆接触间的直流电流 $I _"SD"$ 做输运测量，从而对三量子点的电荷占据做灵敏探测，精度可到单个空穴（见补充材料「实验装置」一节）。外加磁场（ $#bB$ 场）由三轴矢量磁体提供，坐标系见 @fig1 a。

直流栅压工作点设在 (0,1,1) 电荷区中间；这里 $(n _1, n _2, n _3)$ 记三量子点的电荷组态，$n _i$ 是 $P _i$ 下方 QD#sub[$i$] 中的空穴数。所有栅压都做了虚拟化处理以补偿互容，$overline(V) _i$ 表示第 $i$ 号虚拟栅的脉冲电压（详见补充材料「虚拟栅矩阵」一节）。电荷稳定图的测法是：把虚拟柱塞栅脉冲到目标点，等待稳定后读 $I _"SD"$。$P _1$、$P _2$ 下方构成的 DQD 的脉冲电荷稳定图见 @fig1 b，图中可见 (0,1,1) 与 (1,0,1) 之间的点间转变——这正是 FM 量子比特的工作点。我们定义能量失谐 $#epsi = mu _2 - mu _1$，其中 $mu _i$ 为 QD#sub[$i$] 的化学势；#epsi 对应的栅压空间方向即 @fig1 b 中的白色箭头。

@fig1 c 给出有限 $#bB$ 场下最左侧 DQD 的能谱，横轴为 #epsi。黑色与橙色实线分别是自旋向下（$↓$）与自旋向上（$↑$）的电荷基态，两支之间的劈裂主要由空穴 Zeeman 能 $E _z$ 决定；黑色与橙色虚线则对应电荷激发的 $↓$、$↑$ 态。当 $abs( epsilon _"12" ) >> #tcz$（#tcz 为隧穿耦合）时，本征态回到定域电荷态 $| L ⟩$ 与 $| R ⟩$。在电荷对称点 $#epsi = 0$，电荷本征态变为对称（成键）态 $| + ⟩ = ( | L ⟩ + | R ⟩ ) #sym.slash sqrt(2)$ 与反对称（反成键）态 $| - ⟩ = ( | L ⟩ - | R ⟩ ) #sym.slash sqrt(2)$，两者相隔 $2 t _c$ @hayashi2003b @petersson2010。FM 量子比特编码在被 Zeeman 劈裂的成键态中：$| 0 ⟩ = | + , ↓ ⟩$、$| 1 ⟩ = | + , ↑ ⟩$ @benito2019。在 $#epsi = 0$ 处电荷密度离域到整个 DQD 上，电荷偶极矩随之增大，因此电偶极自旋共振（EDSR）的驱动比 LD 量子比特更快 @crootFloppingmode2020 @benito2019。

要紧的是，由于各量子点 $g$ 张量存在差异 @hendrickxSweetspot2024 @seidler2025，Larmor 矢量、进而 $E _z$ 都可以是位相关的。$#epsi = 0$ 处两条 Zeeman 劈裂电荷基态之间的能隙 $Delta E$ 为 @vanriggelen-doelman2024 @wang_operating_2024：

$ Delta E ( epsilon _"12" = 0 ) = frac(1, 2) sqrt( ( E _ "z,1" + E _ "z,2" )^2 - 4 E _ "z,1" E _ "z,2" sin^2 ( tilde(theta) _12 #sym.slash 2 ) ) $

其中 $E _"z,i" << 2 t _c$ 是 QD#sub[$i$] 中的 Zeeman 能，$tilde(theta) _12$ 是一个转动角，它同时计入了各点位 Larmor 矢量方向的差异和自旋–轨道相互作用（spin-orbit interaction，SOI）诱导的自旋翻转隧穿（见补充材料「FM 量子比特哈密顿量」一节）@seidler2025 @massai_engineering_2026。@fig1 d 上面板画的是两量子点 $E _z$ 相差很大时的 $Delta E ( epsilon _"12" )$：当 $epsilon _"12" >> 0$ 时 $Delta E$ 趋于 $E _"z,1"$，当 $epsilon _"12" << 0$ 时趋于 $E _"z,2"$，即图中蓝色（绿色）虚线。下面板则给出两量子点 Larmor 矢量幅值相当（$E _"z,1" approx E _"z,2"$）而 $tilde(theta) _12$ 有限的情形：此时 $Delta E ( epsilon _"12" )$ 在 $epsilon _"12" = 0$ 处出现一个局域极小，对应一个相干甜区——自旋对失谐电荷噪声做到一阶不敏感（即 $partial Delta E #sym.slash partial epsilon _"12" = 0$）。需要强调的是，$Delta E$ 这个极小相对 $E _"z,1(2)"$ 的深浅与 #tcz 无关，这一点不同于强自旋–光子耦合常讨论的 $E _z approx 2 t _c$ 区间 @miCoherent2018 @samkharadzeStrong2018。因此这里的工作点同时是失谐甜区和隧穿耦合甜区。既然锗量子点的 $g$ 张量本身就各向异性、栅压可调、且逐点不同 @terrazos_theory_2021 @scappucciGermanium2021 @valvo2025 @seidler2025 @mauro2025 @massai_engineering_2026，只要选好磁场取向，$E _"z,1" approx E _"z,2"$ 加上有限 $tilde(theta) _12$ 这两个条件就能系统地实现——这一点后文展开。

FM 量子比特的读出用 QD#sub[3] 中的自旋作为辅助比特（ancilla），采用锁存 PSB @kelly_identifying_2025 @harvey-collard_high-fidelity_2018。$P _2$、$P _3$ 构成的 DQD 在 (0,0,2)–(0,1,1) 电荷转变附近的脉冲电荷稳定图见 @fig1 e，锁存 PSB 窗口由脉冲栅测量揭示（见补充材料「初始化与读出」一节）；相关能谱作为 $epsilon _"23" = mu _2 - mu _3$ 的函数画在 @fig1 f。初始化 FM 量子比特时，先栅压扫入 (0,0,2) 电荷区并等待自旋弛豫，制备出 (0,0,2) 单态，随后绝热映射到 $(0, ↓, ↓ )$ @kelly_identifying_2025；接着在势垒栅 $#vBR$ 上加正脉冲关掉 QD#sub[2]–QD#sub[3] 之间的交换作用，再用 $#vBL$ 上的负脉冲抬高 #tcz，最后扫到 (1,0,1) 与 (0,1,1) 之间的电荷对称点 $#epsi = 0$，也就是量子比特的工作点（细节见补充材料「初始化与读出」一节）。

@fig1 g 给出一个 FM 量子比特在一阶失谐甜区上的 Rabi 条纹图：用射频（rf）驱动虚拟电压 $#vP2$，驱动频率 $f _d$、驱动时长 $t _"burst"$、驱动幅度 $#adr = 550$ μV。由此提取出 Rabi 频率 $f _"Rabi" = 3.5$ MHz、量子比特频率 $#ffm = 33.7$ MHz。该测量的具体配置下面接着说。

= 3 各向异性相干

#figure(
  image("fig/figure_3_final.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[a.] 上面板：在偏离电荷对称点两个（无穷小）电压失谐 $Delta V = Delta overline(V) _"Pi"$ 处取值，据此定义纵向与横向自旋–电易感度（LSES 与 TSES），其中 FM 量子比特的 Larmor 矢量记作 $bold(l)$。下面板：$abs( beta_("‖,P2") )$ 随 $#vP2$ 的变化。蓝、粉、绿三色圆点标出实验中测得零失谐甜区所对应的三个磁场方向 $#bhat1$、$#bhat2$、$#bhat3$。
    #text(weight: "bold")[b.] 上面板：$#bB$ 场取向为 $#bhat1$ 时的一个 Ramsey 衰减例子，得到 $#tstar = 1.4$ μs。下面板：#tstar 随 $#bB$ 场球角的分布，球角定义在平均 $g$ 张量坐标系中。
    #text(weight: "bold")[c.] 上面板：$#bB$ 场取向为 $#bhat1$ 时的一个 Hahn 回波例子，得到 $#thahn = 11.2$ μs。下面板：#thahn 随 $#bB$ 场球角的分布。
    #text(weight: "bold")[d, e.] Rabi 驱动效率 $eta _d$ 与归一化 Rabi 驱动效率 $tilde(eta) _d$ 随 $#bB$ 场取向的分布。
    #text(weight: "bold")[f.] 计算得到的 $abs( sin ( Delta tilde(theta) _12 ) )$，其中 $Delta tilde(theta) _12$ 是 $Delta V = Delta overline(V) _"P2" = 250$ μV 时 FM 量子比特有效 Larmor 矢量的转角。所有测量都在 $epsilon _"12" = 0$ 处进行，固定 $abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz。
  ],
) <fig2>

要把禁闭在 DQD 中的单个自旋的动力学写准，模型哈密顿量得同时包含 QD#sub[1]、QD#sub[2] 中自旋的 $g$ 张量 $g _1$、$g _2$ 及其栅压依赖，还要包含 SOI 带来的自旋翻转隧穿。为此，我们让 $#bB$ 场取向扫遍各个方向，分别测两个量子点中自旋的 Zeeman 劈裂，从而刻画出 $g _1$ 与 $g _2$（见补充材料「$g$ 张量表征与 SOI 测量」一节）@crippa_electrical_2018 @hendrickxSweetspot2024。我们再用一套改进过的 Hahn 回波序列 @hendrickxSweetspot2024 刻画每个 $g$ 张量随栅压的变化：在 $epsilon _"12" = 0$ 处测量能级劈裂随 $#bB$ 场取向的关系，由此估出自旋翻转隧穿角 $theta _"SO" = 14.7 ± 0.6$°，与从交换作用中提取到的数值同量级（见补充材料「$g$ 张量表征与 SOI 测量」一节）@massai_engineering_2026 @seidler2025。基于这套模型，并假设 $g$ 张量随栅压线性变化 @wang_operating_2024，我们算出 $#epsi = 0$ 附近 FM 量子比特的有效 Larmor 矢量 $bold(l)( overline(V) _1, overline(V) _2 )$，再据此给出 $epsilon _"12" = 0$ 处 FM 量子比特对 $overline(V) _"Pi"$ 的纵向自旋–电易感度（LSES）@hendrickxSweetspot2024 @bassiOptimal2026：

$ beta_("‖,Pi") = frac( (d bold(l) #sym.slash d overline(V) _"Pi") dot bold(l), h abs( bold(l) ) ) $

其定义见 @fig2 a 上面板。LSES 衡量的是量子比特频率对栅压的敏感程度，$abs( beta_("‖,Pi") )$ 越小，电荷噪声诱导的退相位就被压得越低。

@fig2 a 下面板画出算得的 $abs( beta_("‖,P2") )$ 随 $#bB$ 场取向的分布（$beta_("‖,P1")$ 见补充材料「LSES 与 TSES 计算」一节）。这里的 $phi_"avg"$、$theta_"avg"$ 是球坐标，用来在 $g _1$ 与 $g _2$ 的平均 $g$ 张量坐标系中标记 $#bB$ 场取向；$theta_"avg" = 90$° 对应平均坐标系的 $x y$（样品）平面（见补充材料附图 S3）。值得注意的是，@fig2 a 中白色虚线标出的是 $beta_("‖,P2") = 0$ 的等高线，即 LSES 甜线 @bassiOptimal2026：在 $epsilon _"12" = 0$ 处两量子点的 Zeeman 能简并，于是形成一阶失谐甜区。FM 量子比特甜线的几何形状与 QD#sub[1]、QD#sub[2] 中 LD 量子比特相似，甜区一般出现在 $#bB$ 场略微偏离样品平面的位置（见补充材料「LSES 与 TSES 计算」一节）。

为确认甜线确实压住了噪声，我们在固定 $abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz 下，于 $epsilon _"12" = 0$ 处测量了 @fig2 a 红框区域内的纵向相干时间 #tstar 与 #thahn 随 $phi_"avg"$、$theta_"avg"$ 的分布（见补充材料「杠杆臂与 $#tcz$ 提取」一节）。每个磁场方向上的控制脉冲与 $#epsi = 0$ 都按补充材料「失谐与甜区标定」一节所述重新标定。@fig2 b、c 上面板给出 $#bB$ 场沿 $#bhat1$（@fig2 a 甜线上的蓝点）时的相干衰减例子：用广义指数衰减模型拟合（见补充材料式 (S11)），得到 $#tstar = 1.4$ μs、$#thahn = 11.2$ μs。@fig2 b、c 的完整图谱显示，相干极大值随磁场取向的变化与算出的 LSES 甜线吻合，直接证明电荷噪声敏感度被压到一阶。沿甜线，#tstar 最高到 1.5 μs，#thahn 约 15 μs。离开甜线后 #tstar 迅速下降，而 Hahn 回波相干更抗压，出平面角度较大时尤其如此。

关键在于，压低纵向易感度并没有牺牲电学控制。我们定义 Rabi 驱动效率 $eta _d = f _"Rabi" #sym.slash A _d$，以及归一化 Rabi 驱动效率 $tilde(eta) _d = f _"Rabi" #sym.slash ( A _d f _"FM" )$。从与相干图谱同一批条纹图中（@fig2 b、c）提取出：沿甜线 $eta _d > 5$ MHz/mV、$tilde(eta) _d > 0.15$ Hz/(Hz mV)（@fig2 d、e）。$tilde(eta) _d$ 比 $g$-TMR 驱动的 LD 量子比特已报道的值高出两到三个数量级 @dijkemaSimultaneous2026 @john_robust_2025 @tsoukalas_resonant_2025。注意到量子比特驱动信号的功率大致按 $V _"drive"^2$ 标度 @wang_operating_2024 @undseth_hotter_2023，FM 量子比特显著增强的 $eta _d$ 与 $tilde(eta) _d$ 有利于做低耗散的单比特操作——这一点在后文与 LD 自旋量子比特的对比（@fig5）中会更清楚。

横向自旋–电易感度（TSES）定义为 $beta_("perp,Pi") = abs( ( d bold(l) #sym.slash d overline(V) _"Pi" ) times bold(l) ) #sym.slash ( h abs( bold(l) ) )$，它的来源要看两个点位 Larmor 矢量的相对取向。在甜线上，两者幅值几乎相等、方向却仍然错开；于是共振栅压调制主要改变有效 Larmor 矢量的方向，而对其幅值相对不敏感——这与等 Zeeman 电自旋共振（iso-Zeeman EDSR）是一回事 @crippa_electrical_2018 @carballido_compromise-free_2025 @geyer_-situ_2025。在这个区间里，$beta_("perp,Pi")$ 大致按 $#ffm abs( sin ( Delta tilde(theta) _12 ) )$ 标度，其中 $Delta tilde(theta) _12$ 是栅压改变 $Delta overline(V) _"P2"$ 时有效 Larmor 矢量的转角（见 @fig2 a 上面板）。@fig2 f 中算出的 $abs( sin ( Delta tilde(theta) _12 ) )$ 分布，与 @fig2 e 中测得的 $tilde(eta) _d$ 角度依赖几乎重合。也就是说，正是那点提供强横向电学控制的点间 Larmor 矢量错位，可以与纵向噪声保护共存。FM 工作点的关键特征正在于此：纵向与横向自旋–电易感度可以被分开设计——让两点位 Larmor 矢量幅值匹配以压低退相位，同时保留有限的相对夹角以维持强电学驱动。

后文我们固定取甜线上三个代表性的 $#bB$ 场方向（见 @fig2 a），分别记作单位矢量 $#bhat1$（蓝）、$#bhat2$（粉）、$#bhat3$（绿）。在 @fig2 b–f 所示的角度范围内，#bhat1 对应 $( phi_"avg", theta_"avg" ) = ( 32.36 ° , 93.16 ° )$，此处 $f _"Rabi"$ 最大；#bhat2 对应 $( 91.80 ° , 90.83 ° )$，此处 $f _"Rabi" #sym.slash f _"FM"$ 最大；#bhat3 对应 $( 120.6 ° , 92.25 ° )$，此处 Rabi 频率最低。除特别说明外，此后一律取 $abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz。

= 4 相干时间的标度关系

接下来看甜区上限制相干性的机制。为了把甜区上的电荷失谐噪声保护明确展示出来，我们在 $#bhat3$ 方向上用带交错失谐脉冲的 Ramsey 序列，同时提取 $#ffm$ 与 #tstar 随 #epsi 的关系，结果见 @fig3 a。如预期，#ffm 在 $#epsi = 0$ 处取极小（即 $partial f _"FM" #sym.slash partial epsilon = 0$）；相应地，#tstar 在 $abs( partial f _"FM" #sym.slash partial epsilon )$ 最大的两侧出现局域极小，并在 $#epsi = 0$ 处取极大，清楚显示失谐噪声被挡住了。还要指出：$#epsi = 0$ 处的 #tstar 与深度失谐单量子点区间里 LD 量子比特的 #tstar 相当，这说明在该 $#bB$ 场下，无论 FM 还是 LD 工作模式，#tstar 都主要由超精细噪声限制 @hendrickxSweetspot2024 @stehouwer2025 @zeng_high-fidelity_2026。

补充材料「FM 量子比特噪声谱」一节用 CPMG 与 Ramsey 测量在 $#bhat3$ 方向上提取了 FM 量子比特的噪声功率谱密度（PSD）@rojas-arias2025 @bluhm_dephasing_2011。与两侧（flank）工作点相比，甜区工作在 100 kHz 以上把噪声压低了约一个数量级。我们还观察到，用 32 个重聚焦脉冲可把纵向相干时间延长到 $T _2^( phi,"CPMG" ) = 130 ± 3$ μs。

#figure(
  image("fig/figure_5.pdf", width: 66%),
  caption: [
    #text(weight: "bold")[a.] 由同一次 Ramsey 测量同时提取的 FM 量子比特频率 $#ffm$（黑）与 $#tstar$（绿），横轴为 $#epsi$；$abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz。
    #text(weight: "bold")[b.（c.）] 在 $#tcz #sym.slash h = 13$ GHz 下，#tstar（#thahn）随 $#ffm$ 的变化，磁场取向分别为 $#bhat1$（蓝）、#bhat2（粉）、#bhat3（绿）。各虚线均正比于 $1 #sym.slash f _"FM"$，其前置系数由提取到的量子比特谱二阶导数决定（见正文）。QD#sub[1]（QD#sub[2]）中 LD 量子比特的相干时间在 (1,0,1)、(0,1,1) 电荷区中心测得，分别用朝左（朝右）的三角形表示。
  ],
) <fig3>

相干时间随 $abs( #bB )$ 的标度还能进一步提示退相干机制的来源 @hendrickxSweetspot2024。我们沿 #bhat1、#bhat2、#bhat3 三个取向把 $abs( #bB )$ 从 5 mT 扫到 25 mT，测得的 #tstar 与 #thahn 随 #ffm 的变化见 @fig3 b、c。量子比特频率较低时（#bhat1、#bhat2、#bhat3 分别对应 #ffm 低于 100、40、200 MHz），相干时间随 #ffm 降低而趋于平台甚至下降——我们把这一行为归因于超精细谱线本身有一定宽度，而 #ffm 已接近 ⁷³Ge 同位素的 Larmor 频率 @hendrickxSweetspot2024 @bluhm_dephasing_2011。同时要说明，本实验中 #t1 并不是相干时间的限制因素，#t1 的数值留到 @fig4 d 再讨论。

频率更高时，#bhat1 方向的 #tstar 与 #thahn 看起来服从 $T _2 prop 1 #sym.slash f _"FM"$，这与平面锗 LD 量子比特中电荷噪声限制相干时间的趋势一致 @hendrickxSweetspot2024 @wang_operating_2024。在 FM 甜区上，相干时间预期满足 $T _2 = 1 #sym.slash ( sigma _epsilon^2 chi f _"FM" )$，其中 $chi = abs( partial^2 f _"FM" #sym.slash partial epsilon^2 ) #sym.slash f _"FM"$ 假定为与频率无关，$sigma _epsilon$ 为有效失谐噪声幅度 @noirot_coherence_2026 @benito2019。我们从特定 $abs( #bB )$ 下测得的量子比特谱中提取 $chi$，于是可以在不同 $#bB$ 场取向之间比较电荷噪声限制的相干时间。假设各取向共用同一个 $sigma _epsilon^"*"$ 与 $sigma _epsilon^"Hahn"$（目视拟合），我们把算出的 $1 #sym.slash ( ( sigma _epsilon^"*" )^2 chi f _"FM" )$ 与 $1 #sym.slash ( ( sigma _epsilon^"Hahn" )^2 chi f _"FM" )$ 画在 @fig3 b、c 中作虚线。可以看到，#bhat1 与 #bhat2 的相干时间在高频端逐渐逼近电荷噪声限制线；而 #bhat3 方向上模型预言电荷噪声限制的衰减要到测量范围之外才开始显现，说明这一区间里的相干时间其实由超精细相互作用限制——与 @fig3 a 的观察一致。

#figure(
  image("fig/figure_4_final.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[a.] $#bB$ 场沿 $hat( bold(b) ) _3$、$abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz 时的自旋弛豫，分别以自旋向上和自旋向下为初态测量。
    #text(weight: "bold")[b.] 以自旋向下为初态时，#t1 随 $#bB$ 场取向的分布。虚线为算出的 #t1 甜区（见补充材料「二阶弛豫过程」一节）。
    #text(weight: "bold")[c.] $#adr = 600$ μV 时 Rabi 频率随 $#bB$ 场取向的分布。
    #text(weight: "bold")[d.] 零失谐下 #t1 随量子比特频率的变化，沿 $hat( bold(b) ) _"1,2,3"$ 三个方向测量。虚线取 $T _1 = tilde(eta) _d^(-2) k f _"FM"^(-2)$，其中 $k$ 对三个方向取同一常数。
    #text(weight: "bold")[e.] $#bhat1$ 方向上 #t1 随隧穿耦合 #tcz 的标度，磁场强度分别取 $abs( #bB ) = 5$ mT 与 15.1 mT。在 $#tcz #sym.slash h = 13$ GHz 处，#t1 随 $#bB$ 场的标度是 $1 #sym.slash abs( #bB )^2$，与 #strong[d.] 一致；#tcz 更大时则接近 $1 #sym.slash abs( #bB )$。
    #text(weight: "bold")[f.] 弛豫时间随能量失谐 $#epsi$ 的标度。绿色曲线是假设噪声为特征阻抗 250 Ω、温度 300 mK 的 Johnson-Nyquist 噪声时算出的 #t1。
  ],
) <fig4>

我们另外评估了 QD#sub[1]、QD#sub[2] 中 LD 量子比特的相干性：在 (1,0,1) 与 (0,1,1) 电荷区的标称中心分别测 #tstar 与 #thahn，取 #bhat1、#bhat2、#bhat3 三个取向、$abs( #bB ) = 20$ mT，结果以三角形画在 @fig3 b、c 中。在 FM 量子比特预期受电荷噪声限制的两个方向（#bhat1、#bhat2）上，LD 量子比特的相干时间明显更长；而 #bhat3 方向上两者几乎相同，这进一步支持了「该区间 FM 量子比特受超精细相互作用限制」的判断。

= 5 自旋弛豫

为弄清限制自旋寿命的物理过程，我们测量了弛豫时间 #t1 随 $#bB$ 场、#epsi 与 #tcz 的变化。@fig4 a 是 $#epsi = 0$、$hat( bold(b) ) _3$、$abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz 下测得的 #t1 衰减。我们分别制备 $| ↑ ⟩$ 与 $| ↓ ⟩$ 初态，再测其占据数随时间的衰减，即图中橙色（初态 $| ↑ ⟩$）与蓝色（初态 $| ↓ ⟩$）数据点。两者都以相近的 $T _1 approx 226$ μs 衰减到最大混合态。

补充材料「$T _1$ 弛豫理论」一节对 FM 量子比特的 #t1 弛豫做了完整处理，同时计入热光子（例如来自栅线和屏蔽不足的封装）、晶格声子与电荷噪声。FM 量子比特可以在吸收一个接近电荷转变频率 $2 t _c #sym.slash h$ 的光子或声子后，从电荷基态流形 $| + ⟩$ 激发到电荷激发态流形 $| - ⟩$；随后这个激发电荷态又通过发射声子或光子弛豫回 FM 量子比特子空间（即电荷基态）——这套机制就是 Orbach 过程 @tahan_relaxation_2014。由于吸收与发射各自都可能因有效横向磁场梯度而带上一次自旋翻转，这一二阶过程正好导致观察到的向混合态衰减。我们注意到，一阶过程——直接在量子比特频率上发射或吸收声子——在本工作的 $#ffm ~ 10 - 100$ MHz 区间可以忽略，因为环境在该频率的态密度被压低。在我们的装置中，二阶过程里占主导的更可能是热光子而非晶格声子：晶格声子应当已经很好地热化到制冷机基温 $T _"base" ~ 10$ mK，对应 $k _B T _"base" #sym.slash h ~ 200$ MHz $<< 2 t _c #sym.slash h$。

@fig4 b 给出 #t1 随 $#bB$ 场取向的分布，此时初态为 $| ↓ ⟩$，$abs( #bB )$ 固定为 5 mT。白色虚线是算出的 #t1 取极大的等高线——那里有效横向磁场梯度被压低（见补充材料「$T _1$ 弛豫理论」一节），它与实测 #t1 的极大值几乎重合。@fig4 c 给出对应各场向的 Rabi 频率，可以看到它与实测 #t1 呈反变关系 @benito2019。这就确认了：驱动量子比特激发的那条有效横向磁场梯度，同时也是弛豫的通道。

@fig4 d 沿 #bhat1、#bhat2、#bhat3（见 @fig2 a）三个方向测 #t1，并用磁场强度改变 #ffm。虚线是对 $T _1 = tilde(eta) _d^(-2) k f _"FM"^(-2)$ 的拟合，其中 $k$ 为固定常数，$tilde(eta) _d$ 是每个方向单独提取的归一化 Rabi 驱动效率。我们观察到 #t1 按平方反比衰减，这与「二阶光子（或声子）过程」或「一阶光子耦合」都相容，而可以排除 $1 #sym.slash f$ 电荷噪声（见补充材料「$T _1$ 弛豫理论」一节）@noirot_coherence_2026。

Orbach 过程要求激发电荷态有有限的热占据，因此 #tcz 增大时它应当被指数压低。我们在 #bhat1 方向、$#epsi = 0$ 处，对 $abs( #bB ) = 5$ mT 与 15.1 mT 两种磁场分别测 #t1 随 $t _c #sym.slash h$ 的变化，结果见 @fig4 e。确实，两种磁场下 #t1 都随 #tcz 增大而变长。在 $t _c #sym.slash h$ ≲ 15 GHz 区间，$abs( #bB ) = 5$ mT 的 #t1 约为 15.1 mT 时的九倍，与 @fig4 d 的 $1 #sym.slash f _"FM"^2$ 趋势一致；而在 $t _c #sym.slash h$ ≳ 15 GHz，前者只比后者大约三倍，更像是 $1 #sym.slash f _"FM"$ 标度。这一走向说明 Orbach 过程在大 #tcz 下被压了下去，弛豫转由电荷噪声主导，从而给出 $T _1 ~ 1 #sym.slash f _"FM"$。接着我们在 #bhat3、$abs( #bB ) = 5$ mT 下测出 #t1 随 #epsi 的变化（@fig4 f）：零失谐处 #t1 被抬高，这正是二阶过程的标志（见补充材料「$T _1$ 弛豫理论」一节）。叠加在数据上的理论曲线（绿色）定性复现了这一趋势——这里假设噪声由五路 50 Ω rf 栅线产生的 Johnson-Nyquist 噪声等效成一个 250 Ω 噪声源，并把光子库温度拟合为 300 mK。数据的不对称可能来自某个两能级涨落者在测量期间移动了点间失谐（见补充材料「LD 量子比特性能」一节的讨论）。还要指出，模型预言 #t1 恰在 $#epsi = 0$ 处出现尖锐峰，那里二阶过程可以忽略；我们把这一偏差归因于模型没有考虑低频电荷噪声——它等效地在调制 #epsi。既然二阶弛豫离开 $#epsi = 0$ 后迅速增大，很小的失谐调制就足以把实测 #t1 明显压低。这意味着压低低频电荷噪声不仅能改善量子比特的纵向相干时间，还能间接把 #t1 抬上来。

= 6 高保真、超低功耗 EDSR

我们用 Clifford 随机基准测试 @magesan_scalable_2011 表征门保真度，取 #bB 场沿 #bhat1 与 #bhat3、$abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz。恢复 Clifford 之后平均存活概率的衰减曲线见 @fig5 a、b。两处驱动幅度分别固定为 460 μV 与 550 μV，对应 $f _"Rabi"$ 为 5.7 MHz 与 3.5 MHz，量子比特频率分别为 $#ffm = 58.8$ MHz 与 33.7 MHz。选这两个驱动幅度，是为了在满足旋转波近似有效性的同时把门速顶到最高。按补充材料「随机基准测试」一节的办法评估，平均物理门保真度为 $ℱ_("1qb") = 99.76(1)$% 与 99.74(1)%；相应的量子比特相干指标汇总在补充材料附表 S2 中。我们的结果说明 flopping-mode EDSR 与高保真操作完全兼容，同时在相近的量子比特频率下，控制功率比 $g$-TMR 低了几个数量级 @ademi2026 @john_robust_2025 @tsoukalas_resonant_2025 @dijkemaSimultaneous2026。

#figure(
  image("fig/figure_RB_final.pdf", width: 66%),
  caption: [
    #text(weight: "bold")[a.]（#strong[b.]）#bB 场沿 #bhat1（#bhat3）、$abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz 下的单比特 Clifford 随机基准测试。器件端 rf 驱动幅度为 $#adr = 460$ μV（550 μV）。由指数拟合（黑线）算出的平均物理门保真度标在插图内。对应的纵向与横向相干指标汇总在补充材料附表 S2 中。
    #text(weight: "bold")[c.] 汇总自文献 @ademi2026 @john_robust_2025 @dijkemaSimultaneous2026 @tsoukalas_resonant_2025 的数据：器件端驱动幅度的平方 $V _"drive"^2$ 对物理单比特门反保真度。星号是 #strong[a.]、#strong[b.] 两种实测构型；三角形是同一器件中在超精细甜区测得的 LD 量子比特（见补充材料「LD 量子比特性能」一节）。各点按量子比特频率着色。
  ],
) <fig5>

我们再把本文结果与文献明确放在一起比较，以凸显这一优势。@fig5 c 画的是 $V _"drive"^2$ 对门反保真度 $1 - ℱ_("1qb")$ 的关系，$V _"drive"$ 指器件端的 rf 驱动幅度。图中汇总了近期在 100 mT 以下、磁场大致平行样品平面的条件下工作的锗空穴自旋量子比特结果 @ademi2026 @john_robust_2025 @tsoukalas_resonant_2025 @dijkemaSimultaneous2026，每个点按各工作报告的量子比特频率着色。红色箭头所指的星号是 @fig5 a、b 两种构型下的本文 FM 量子比特。可以看到，与典型 LD 量子比特相比，FM 量子比特的驱动功率降低了约两个数量级，而门性能相当。图中还画了同一器件 QD#sub[2] 中的一只 LD 量子比特（三角形标记），它与 FM 量子比特用同一只栅（#vP2）驱动，磁场 $abs( #bB ) = 15$ mT、沿同平面超精细甜区取向（见补充材料「LD 量子比特性能」一节）。值得注意的是，FM 量子比特的反保真度改善了约三倍，驱动功率还同时低了两个数量级。假设 $f _"Rabi"$ 与 $f _"qubit"$、驱动幅度都成线性关系，那么在同样的 $f _"Rabi"$ 与 $f _"qubit"$ 下，FM 量子比特相对 LD 量子比特的驱动功率可降低四个数量级。

= 7 结论

我们在锗 DQD 中做出了一只 flopping-mode 空穴自旋量子比特，并证明它能在低磁场下支撑高保真的单自旋 EDSR 控制，所需驱动功率比锗中单量子点空穴自旋量子比特的最高水平低两个数量级。我们系统地测绘出磁场甜线——那里两量子点的 Zeeman 能简并，量子比特对失谐涨落做到一阶不敏感。甜线上的相干测量显示出一个交叉：低场端与超精细限制的退相位一致，高场端则由二阶电荷噪声耦合主导。这些工作点的关键特征，是纵向与横向自旋–电易感度可以被分开设计：让两点位的 Larmor 矢量幅值匹配，退相位显著下降；保留有限的相对夹角，横向自旋–电易感度仍然很大。于是在低磁场——量子比特相干性最优的那个区间——我们既能用亚毫伏量级的器件端驱动幅度做 MHz 量级的 Rabi 控制，又能把相干性保持在高位。随机基准测试给出最高 99.76(1)% 的物理门保真度，与锗器件 LD 量子比特报道的中位值相当，而门时长仍短至 $t _(X pi) = 88$ ns @dijkemaSimultaneous2026 @john_robust_2025。

弛豫测量揭示了另一面交易：让控制变高效的横向 Larmor 矢量梯度，同时也打开了一条弛豫通道。我们的建模指出，在当前装置中热光子是主导的弛豫机制。加强控制线滤波、做屏蔽更严实的封装、增大隧穿耦合，都可以通过减少热激发把 #t1 提上来；降低电荷噪声则能减少工作点（$#epsi = 0$）附近的涨落，让量子比特更充分地用上该点处 #t1 的急剧增强。

这些结果给出了一条在更大自旋量子比特阵列上可操作的策略：需要共振控制时切到 FM 区间，用超低功耗驱动；空闲和双比特操作则回到 LD 区间，那里相干时间和自旋寿命更长。由于功耗是按每只被驱动的量子比特节省的，同时操作的量子比特越多，绝对收益越大——这正好对上大规模半导体量子比特阵列的射频总功率预算。相邻量子点的 $g$ 因子幅值越均匀，就越容易在整片阵列上做出 FM 甜区；而 $g$ 张量随栅压可调这一性质，又为设计点间 Larmor 矢量的有限倾角——EDSR 与甜区工作都需要它——多留了一个自由度 @tosato2026 @john_robust_2025 @nguyen_degenerate_2026。若改用同位素纯化的异质结构 @zeng_high-fidelity_2026，FM 量子比特或许能工作在出平面磁场下：那里预期 Larmor 矢量更均匀，且 SOI 矢量始终垂直于量子化轴，自旋翻转隧穿可进一步增强驱动。

除了可扩展控制，FM 量子比特的大电偶极对更高量子比特频率下的相干自旋–光子接口同样有吸引力；而极高的驱动效率让人得以进入旋转波近似失效的自旋动力学区间 @zwanenburg_single-qubit_2025 @teske_flopping-mode_2023。

= 致谢

感谢 Binnig 与 Rohrer 纳米技术中心（BRNC）的工程师们对样品制备的贡献，感谢 Alberto Bordin 对手稿提出的意见。P.S. 感谢瑞士教育、研究与创新国务秘书处（SERI）在合同编号 MB22.00081 下的支持。本研究部分由 NCCR SPIN 资助——它是瑞士国家科学基金会资助的国家卓越研究中心（grant 51NF40-180604、51NF40-225153），并得到瑞士国家科学基金会 grant 200021-188752 的支持。

= 作者贡献

AO 与 WJ 构思实验；AO 在 WJ 与 KT 协助下完成测量；AO 与 WJ 分析数据；PZ 与 SB 建立弛豫理论模型；FO、FDP、EA、YR、WJ 与 AO 搭建实验系统；MM 与 FJS 制备器件；IS、LM、LS、KT 与 AO 参与器件测试与开发；KT 设计器件；AO 与 WJ 撰写手稿，全体作者参与修改；PHC 与 PS 指导项目。

#v(10pt)
#{
  set text(lang: "en", size: 9pt)
  set par(leading: 0.55em, first-line-indent: 0em)
  bibliography("refs.bib", style: "ieee", title: [参考文献])
}

#include "supple.typ"
