// 1024 像素单光子计数微波动态电感探测器阵列的制备后修调（像素间距 150 µm）—— arXiv:2609.10146v1 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排。6 幅图均为数据/照片图，保留原图仅译图注，无 CeTZ 重画对象（记为范围决定）。
// lane-C。临时渲染文件前缀 _f。

#set document(title: "1024 像素单光子计数微波动态电感探测器阵列的制备后修调")
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
#show heading.where(level: 3): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 0.8em, below: 0.25em)[
    #text(weight: "bold", size: 10pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)
#show figure: set block(below: 1em)

#align(center)[
  #text(size: 15pt, weight: "bold")[1024 像素单光子计数微波动态电感探测器\ 阵列的制备后修调（像素间距 150 µm）]\
  #v(4pt)
  #text(size: 10pt)[
    Wilbert Ras-Vinke #super[1,2,#super[†]]，
    Hessel Schulte #super[2]，
    David J. Thoen #super[1,2]，
    Kevin Kouwenhoven #super[1,2]，
    Steven A.H. de Rooij #super[1,2]，
    Tonny A.H.M. Coppens #super[1]，
    Jochem J.A. Baselmans #super[1,2,3]，
    Pieter J. de Visser #super[1,2] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 荷兰空间研究组织（SRON），荷兰莱顿\
      #super[2] 代尔夫特理工大学微电子系，荷兰代尔夫特\
      #super[3] 科隆大学物理研究所，德国科隆\
      #super[†] 通讯作者：#"w.ras@sron.nl"
    ]
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.10146v1，2026 年 9 月；中文译本编译于 2026-09-27]
]

#v(8pt)
#block(width: 92%, inset: (x: 1.6em), stroke: 0.6pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    微波动态电感探测器（MKID）是一类能够对可见与近红外波段光子进行单光子计数并分辨其能量的超导谐振器。零读出噪声、极低暗计数以及与频分复用的兼容性，使它们非常适合构建大型成像阵列。这类阵列的探测像元良率常常受限于制备引起的频率散布——谐振器频率相互碰撞。我们发现，像素的紧凑排布本身也会带来显著的频率散布。为此我们开发了一种制备后修正方法，适用于像素间距仅 150 µm 的紧凑阵列。我们在一个 1024 像素、单倍频程读出带宽复用的阵列上演示了该方法：频率散布从 $1.1 times 10^(-2)$ 降到 $3.5 times 10^(-4)$，良率从 76% 提升到 94%。
  ]
]
#v(6pt)

= 1 引言

微波动态电感探测器（MKID）是一类超导探测器，能够对可见与近红外波段的单个光子计数并分辨其能量 @mazinARCONS2024Pixel2013。它们具有微秒级时间分辨率、零读出噪声和极低的暗计数率 @walterMKIDExoplanetCamera2020 @swimmerCharacterizingDarkCount2023。MKID 将帮助人类回答关于宇宙生命的根本问题：在未来的空间观测台上对类地系外行星同时成像与光谱分析 @steigerSimulatedPerformanceEnergyresolving2024 @howeScientificImpactNoiseless2024a @bryanKIDDetectorReadout2025；在地面通过斑点抑制改进高对比度成像 @meekerDARKNESSMicrowaveKinetic2018 @walterMKIDExoplanetCamera2020，并借助多波长波前传感 @darcisAddingColourZernike2025a @darcis2026inprep @magniezPolychromaticPyramidWavefront2024b @magniezPolychromaticPyramidWavefront2026a。其他应用包括在单目标光谱仪中充当"级次分辨器"，替代复杂的交叉色散光学系统 @obrienKIDSpecMKIDBasedMediumResolution2020，以及在医学领域作为光子受限的高光谱显微镜 @shawMKIDMicroscopes2023。

探测原理基于可见或近红外光子在嵌入微波谐振器的高感超导薄膜中打断库珀对 @dayBroadbandSuperconductingDetector2003 @mazinARCONS2024Pixel2013。一个光子视其能量可打断数千个库珀对，使谐振器频率发生偏移；偏移量通过微波探测信号的相位与幅度变化测得。由于每个谐振器可分配唯一的谐振频率，MKID 天然支持频分复用（FDM），让大量探测器共享同一条读出线。复用因子——耦合到单条读出线的 MKID 数量——越高，读出电子学的质量、功耗与成本越低，这对天基仪器尤为关键。

过去十年间已有多种 MKID 仪器首光 @reyesAMKIDLargeKIDbased2025 @calvoNIKA2InstrumentDualBand2016 @karatsuDESHIMA202004002026，其中最大的是一台近红外单光子计数相机：超过 20 千像素、复用因子 2000、单倍频程读出带宽 @walterMKIDExoplanetCamera2020。更大的仪器正在研制中：38 千像素、复用因子 4000、2 倍频程带宽 @huberCCATCharacterizationFirst2026a。

然而，这些 MKID 器件的复用因子普遍受良率制约。良率——可用像素的比例——常因谐振器之间频率间隔不足（即"碰撞"）而受限，复用因子越高碰撞越频繁。发生碰撞的谐振器无法独立读出，只能屏蔽掉，良率随之下降。增加读出线数量 @calvoNIKA2InstrumentDualBand2016 或读出带宽 @huberCCATCharacterizationFirst2026a 可以提高良率，但更根本的办法是在制备中或制备后解决。谐振器碰撞一般归因于制备引起的谐振器几何与材料性质变化 @shuUnderstandingMinimizingResonance2021 @albertSpatialMappingKilopixel2024 @middletonCCATLEDMapping2024，因此可以通过改进初始制备（比如把接触式光刻升级为电子束光刻 @reyesAMKIDLargeKIDbased2025），或者在制备后修调谐振器来提高良率 @liuSuperconductingMicroresonatorArrays2017 @shuIncreasedMultiplexingSuperconducting2018 @shuUnderstandingMinimizingResonance2021。

本工作研究工作在可见/近红外波段的 MKID 阵列——它们比远红外/(亚)毫米波 MKID 阵列小得多、也紧凑得多。我们发现电子束光刻工艺仍是良率的限制因素；同时，像素的紧凑排布本身显著加大了谐振频率的散布，对制备后修正方法的需求更为迫切。而依靠激光扫描 @liuCryogenicLEDPixeltofrequency2017 或接触式光刻 @shuIncreasedMultiplexingSuperconducting2018 @shuUnderstandingMinimizingResonance2021 的既有方法因缺乏所需空间分辨率而不适用。我们演示了一种基于电子束光刻的高精度制备后修正方法，并成功应用于 1024 像素阵列：谐振频率的整体散布——连同制备起伏与紧凑像素间距的贡献——被压低超过 30 倍。

= 2 方法

== 2.1 良率与频率散布

MKID 阵列的良率定义为能有效执行阵列设计目标探测任务的像素总数占比。它受三方面影响：其一，制备失败造成坏像素；其二，谐振器频率碰撞造成信号混叠；其三，未达到特定性能指标（量子效率、分辨本领或动态范围等）的像素无法有效探测。本工作只讨论制备失败与谐振器碰撞两类因素。下面给出谐振器碰撞与良率的定量描述。

设阵列有 $N$ 个谐振器，设计谐振值为 $F _ "D"[n]$、测量值为 $F _ "M"[n]$，$n = 0, 1, dots, N - 1$。相邻两个谐振 $F _ "M"^i$ 与 $F _ "M"^(i + 1)$ 若其频率间隔 $lambda _ "M"^i = (F _ "M"^(i + 1) - F _ "M"^i) slash F _ "M"^i$ 小于所需间隔 $lambda _ "min"$，即 $lambda _ "M"^i < lambda _ "min"$，则称其发生碰撞。指标 $i = 0, 1, dots, N - 1$ 按 $F _ "M"$ 的频率顺序编号——它可能已相对 $F _ "D"$ 发生交换。$lambda _ "min"$ 由相邻谐振器间可接受的信号混叠水平决定，强烈依赖于应用与探测器性能。阵列良率 $P _ 0$ 由下式给出 @liuSuperconductingMicroresonatorArrays2017：

$ P _ 0 = {product_(n = 1)^(N - 1) [1 - frac("erf"((n lambda _ "D" + lambda _ "min") slash (sqrt(2) sigma)) - "erf"((n lambda _ "D" - lambda _ "min") slash (sqrt(2) sigma)), 2)]}^2 $ <eq-yield>

其中 $"erf"$ 为误差函数

$ "erf"(z) = frac(2, sqrt(pi)) integral_0^z e^(-t^2) d t $

其取值取决于 $lambda _ "min"$ 的选择、设计频率间隔 $lambda _ "D"$ 与频率散布 $sigma$。频率散布假设测得谐振 $F _ "M"[n]$ 围绕设计值 $F _ "D"[n]$ 呈正态分布，标准差为 $sigma times F _ "D"[n]$。实测频率偏差 $epsilon _ "M"[n] = (F _ "M"[n] - F _ "D"[n]) slash F _ "D"[n]$ 往往带有随频率变化的趋势，并非正态分布，其均值 $mu _ "M" != 0$ 且 $sigma _ "M" != sigma$。频率趋势对碰撞次数影响不大——相邻谐振器获得的整体偏移大致相同——因此可以拟合减去趋势后得到有效的 $sigma$。

#figure(
  image("fig/multiplexing.pdf", width: 66%),
  caption: [
    良率 $P _ 0$ 随频率散布 $sigma$ 的变化：$N$ 个探测器复用在单倍频程读出带宽上，间隔 $lambda _ "D"$。最小所需间隔为 $lambda _ "min" = 4 d F = 8.0 times 10^(-5)$。与 $N$ 取值同色的竖直虚线标出使 $P_0 = 95%$（黑色虚线）所需的 $sigma$。
  ],
) <fig-multiplexing>

为了理解频率散布对良率的影响，@fig-multiplexing 画出了用公式 (1) 计算的 $P _ 0$ 随 $sigma$ 的变化。作为例子，取 $lambda _ "min" = 4 d F = 8.0 times 10^(-5)$，其中 $d F = F _ "D" slash Q _ l$ 为谐振线宽，由有载品质因数 $Q _ l = 5 times 10^4$ 定义。要使 $P _ 0 >= 95%$（黑色虚线）：$N = 1000$（蓝）需要 $sigma < 3.5 times 10^(-4)$，$N = 2000$（橙）需要 $sigma < 1.4 times 10^(-4)$，$N = 4000$（紫）需要 $sigma < 0.5 times 10^(-4)$。文献中典型的频率散布为 $sigma = 10^(-3)$ @reyesAMKIDLargeKIDbased2025 至 $10^(-2)$ @shuUnderstandingMinimizingResonance2021 @middletonCCATLEDMapping2024 @albertSpatialMappingKilopixel2024。不做制备后修正时报道的最低值为 $sigma = 4.7 times 10^(-4)$ @karatsuDESHIMA202004002026——其成因不明，但该探测器设计似乎比我们同样使用电子束工艺的阵列更能抵御制备起伏。只有对谐振器做制备后修调，才能把 $sigma$ 压到足够低：$3.5 times 10^(-4)$ @liuSuperconductingMicroresonatorArrays2017 @shuUnderstandingMinimizingResonance2021 与 $1.8 times 10^(-4)$ @shuIncreasedMultiplexingSuperconducting2018。

#figure(
  image("fig/device_and_setup.jpg", width: 100%),
  caption: [
    (a, b) 正文中所述器件 A 的照片。标号为：1. 电感；2. 叉指电容器（IDC）；3. 耦合棒；4. 共面波导中心线；5. 接地面；6. 接地与耦合桥。设计与制备细节见正文。(c) 像素–频率映射装置及部件：1. 智能手机；2. 直角反射镜；3. 300 mm 成像透镜；4. 50:50 分束器；5. 转向镜；6. 制冷恒温器；7. 单色相机。黄色箭头为从手机到器件的光路，橙色箭头为从器件到相机的光路。
  ],
) <fig-device>

== 2.2 探测器与阵列设计

本工作给出三只器件（A、B、C）的结果。探测器与阵列的总体设计基于 @kouwenhovenResolvingPowerVisibleToNearInfrared2023 的设计。器件 A 是执行修调的主器件，B 与 C 是研究像素间距影响的测试器件。下面详细描述器件 A，再简要说明 B、C 与它的差异。

=== 2.2.1 器件 A

器件 A 的照片见 @fig-device a、b。MKID 采用混合设计：β-Ta 蛇形电感与 NbTiN 叉指电容器（IDC）并联。电感是光敏部分，吸收的光子在此打断库珀对。通常会在探测阵列上方胶合微透镜阵列，把光聚焦到电感上 @kouwenhovenResolvingPowerVisibleToNearInfrared2023。各 MKID 的蛇形电感几乎相同：平均线宽 4 µm、缝隙 1 µm，但按各自谐振频率做了不同的渐变锥形——锥形使电感上的电流分布更均匀、单光子响应更一致 @mazinSuperconductingFocalPlane2012。

IDC 用于设定探测器的谐振频率 @igrejaAnalyticalEvaluationInterdigital2004。IDC 有 10 对指叉，长 98 µm、宽 3 µm、缝隙 1 µm。指叉被一根根剪短，以获得定义 1024 个谐振频率所需的物理长度；剪短时从两侧对称进行，以增强对光刻对准偏差的鲁棒性。指叉之间保留至少 1 µm 的重叠以减少频率跳变。我们用 $l _ "C"$ 参数化 IDC 指叉的总重叠长度，范围 10–970 µm。

IDC 还有一根独立的耦合指，与耦合棒容性耦合；耦合棒通过一条由 600 nm 厚聚酰亚胺垫悬空的 β-Ta 桥与共面波导（CPW）读出线的中心导体电连接。耦合棒长度经过变化，使所有探测器都处于过耦合状态，$Q _ l approx Q _ c = 5 times 10^4$。耦合棒长度与 IDC 指叉长度由 Sonnet 中的详细仿真确定 @SonnetSoftware：以 1 µm 步长扫描 $l _ "C"$ 范围并求解谐振频率与品质因数，在每个 $l _ "C"$ 值上再对一系列耦合棒长度仿真；设计频率与品质因数由插值得到。我们采用三端口法缩短仿真时间 @wisbeyNewMethodDetermining2014。

NbTiN 厚 125 nm，临界温度 $T _ c$ 为 11 K，方阻 $R _ s$ 为 35 Ω；β-Ta 厚 41 nm，$T _ c = 0.95 " K"$，$R _ s = 48 Omega$，对应方动电感 $L _ k = 71 " pH/□"$。

阵列含 $32 times 32$ 像素，像素间距 150 µm。CPW 在阵列中蛇形穿行，连接两侧的探测器（一侧相对另一侧翻转）。每隔 150 µm 设置一条接地面桥。我们在阵列周围的接地面上开了孔，以复现阵列内部的接地面。目标频率范围为 4.15–7.85 GHz，在 6 GHz 附近留出 300 MHz 的间隙给本振（LO）。间隙两侧各分配 512 个探测器：LO 间隙以下 $lambda _ "D" = 34 slash Q _ l = 6.7 times 10^(-4)$，以上 $lambda _ "D" = 24 slash Q _ l = 4.8 times 10^(-4)$。初始制备时，我们把谐振频率设计得比目标范围低 3%，以便在制备后修调到目标范围。

频率相近的谐振器应在空间上尽量远离，以降低电磁交叉耦合 @noroozianCrosstalkReductionSuperconducting2012。频率最低的探测器 $n = 0$ 放在左下角；同一行内各探测器的频率间距尽可能大，使谐振交换几乎不可能发生，即探测器 $n = 0, 32, dots, 991$——这也是出于加快像素–频率映射的实际考虑：只需逐行扫描、无需逐列。其上每一行跳过 4 个频率位置，并横向滚动 10 个频率位置，以拉大频率最近的像素之间的物理距离：第二行为 $n = 4, 36, dots, 996$，第三行 $n = 8, 40, dots, 1000$，依此类推到第八行 $n = 28, 60, dots, 1020$；从第九行起重复该模式，从 $n = 1, 33, dots, 993$ 开始。这种频率分配使空间最近的邻居相距超过 2.7 mm，频率最近的邻居至少相距 88 MHz。

=== 2.2.2 器件 B 与 C

器件 B 与 C 除像素间距外完全相同；两者制备也相同（在同一晶圆上偏离中心的相似位置）。器件 B 是 $32 times 32$ 阵列，像素间距 150 µm，与器件 A 相同；器件 C 是 B 的复刻，但只保留每三行中的行、每行中三分之一的探测器，像素间距因此放大到 450 µm。

B、C 的探测器与阵列设计相对 A 略有差异：β-Ta 层厚 47 nm，$L _ k = 56 " pH/□"$；蛇形电感不做锥形，线宽 4 µm、缝隙 2 µm，拐角为直角而非圆角；电容指宽 4 µm，只从单侧剪短；B、C 阵列周围的接地面上没有开孔。频率范围、间隔与分配大致相同。器件 B、C 的照片及其测量结果见 @fig-sparse。

== 2.3 制备

衬底为 ∅100 mm、350 µm 厚的 C 面蓝宝石晶圆。NbTiN 用反应磁控溅射沉积（LLS801，靶作往复摆动模式），该模式以层性质高度均匀著称 @thoenSuperconductingNbTinThin2017。随后用紫外（UV）接触式光刻与反应离子刻蚀（RIE，SF₆ 与 O₂）图形化并刻蚀后续各层的对准标记。继续图形化 CPW、耦合棒与 NbTiN 电容器之前，先用 RIE 氧等离子体清洁表面，再进行电子束（EB）光刻。主场尺寸设为 300 µm × 300 µm——两倍像素间距——并确保场边界总是落在接地面内以避免拼接误差 @scholtenhuisEnhancedElectronbeamLithography2026。旋涂正性胶 CSAR ARP6200-13（1300 RPM），150 °C 烘烤 3 分钟；为减少胶的充电再旋涂一层 Electra E92（2000 RPM，90 °C 烘烤 2 分钟）。电子束步长 10 nm，剂量 1100 µC/cm²，并施加邻近效应修正以优化局域剂量、补偿电子背散射。用 RIE（SF₆ 与 O₂）刻蚀暴露的 NbTiN。接地面与耦合桥的聚酰亚胺层在接触式光刻后旋涂、显影并固化。随后氧等离子体清洁，并用 HF 做表面氢钝化。

电感与桥的 β-Ta 用溅射沉积，图形化采用 @thoenCombinedUltravioletElectronbeam2022a 开发的 UV+EB 联合光刻：UV 用于阵列外的大面积接地面，EB 用于电感与桥。旋涂负胶 ma-N1405（1500 RPM），100 °C 烘烤 3 分钟，然后以 10 nm 步长、1100 µC/cm² 剂量曝光。

电容指的修调用与初始电容图形化、刻蚀相同的工艺完成。修调长度如何确定见第 2.5 节。

#figure(
  image("fig/trimming_finalised.pdf", width: 100%),
  caption: [
    制备后修调方法总览。(a) 根据映射得到的谐振 $F _ "M"$（橙）确定一组新的设计频率 $F _ "D"^"trim"$（紫），保持恒定频率间隔；$F _ "M"$ 的频率顺序保持不变，以最小化 $F _ "D"^"trim" - F _ "M"$。(b) $F _ "D"^"trim" - F _ "M"$ 的直方图。(c) 不用仿真数据（实线），而是对 $l _ "C"(F _ "M")$ 做六次多项式拟合（粗虚线），在 $F _ "D"^"trim"$ 处插值得到对应指叉长度 $l _ "C"^"trim"$；水平虚线标出指叉对之间的过渡点。(d) $l _ "C"^"trim" - l _ "C"$ 的直方图。(e) 修调过程中单个像素在胶（绿色膜）曝光完成后的照片：虚线圆内较亮的矩形为曝光区域。
  ],
) <fig-trimming>

== 2.4 测量装置

低温装置为 @kouwenhovenResolvingPowerVisibleToNearInfrared2023 所述的稀释制冷机。阵列外有两层磁屏蔽：一层超导铌，一层 Cryophy。屏蔽体的长筒专门用于阻挡直流磁场；仿真显示对时变磁场的屏蔽系数为 $10^6$，对静磁场为 70 @RooijQuasiparticleDynamicsDisordered2026。所有屏蔽体都装有透明窗口，可从恒温器外部照亮样品。器件典型的浴温为 25–100 mK。

测量内容为复数 $S _ 21$ 传输（矢量网络分析仪），谐振频率取 $S _ 21$ 的极小值。关键是把谐振映射到像素在阵列中的空间位置。我们的阵列过于紧凑，无法像文献 @liuCryogenicLEDPixeltofrequency2017 @martsenDevelopmentMKIDFrequencytopixel2025b @albertSpatialMappingKilopixel2024 @middletonCCATLEDMapping2024 那样使用低温 LED 映射器；替代方案是在恒温器外搭建光学装置，逐行、逐列照亮探测器，同时记录 KID 谐振响应出现在读出线的哪个位置（@fig-device c）。该装置的灵感来自 @walterMKIDExoplanetCamera2020 @bottomSmartphoneSceneGenerator2018：亮线由一部智能手机产生，经单透镜（焦距 300 mm）成像，由转向镜投影进恒温器。装置放大率为 −1，物与像距透镜均为 600 mm。所用手机（OnePlus 11T）为 amoled 屏、像素间距 50 µm，可以以 50 µm 分辨率把亮线扫过阵列。亮线由用 Python 的 Pygame 模块编写的自研 Android 应用显示；测量通过 Android 调试桥（ADB）由计算机控制手机实现自动化。我们还加装了一个 50:50 分束器和第二块透镜，把一半光束引到相机（BLKFLY-U3-50H5M）用于投线的目视对准。

== 2.5 电容器修调

电容器修调即修正 IDC 指叉长度，以改善谐振器的频率间隔。我们只能缩短指叉、升高谐振频率。修调分三步（见 @fig-trimming）。

第一步，确定一组新的设计谐振 $F _ "D"^"trim"$（@fig-trimming a、b）。我们希望尽量少修：保持 $F _ "M"$ 可能已交换的频率顺序不变；同时要求 $F _ "D"^"trim"$ 具有恒定的分数频率间隔 $lambda _ "D"^"trim"$；最后，要求所有谐振器都被修调，以消去工艺偏置的影响。例外的是三个谐振明显偏高（高于阵列其余部分）的像素：它们不修调，允许更大的频率间隔。修调后的频率散布以 $F _ "D"^"trim"$ 为基准定义。

第二步，确定新的指叉长度 $l _ "C"^"trim"$（@fig-trimming c、d）。我们完全沿用初始制备中的剪短方式（见第 2.2.1 节）——这样就不需要单独的修调指，减小了器件占版面积，更重要的是无需任何新仿真。对测得的 $l _ "C"$–$F _ "M"$ 依赖关系做拟合，在 $F _ "D"^"trim"$ 处插值得到 $l _ "C"^"trim"$。拟合用六次多项式。(d) 面板出现两个分布，源于 LO 间隙上下两侧 $lambda _ "D"^"trim"$ 的细微差别。像素–频率映射中未能识别的谐振器全部做最大修调，把它们移到 9 GHz 附近，使其无法造成频率碰撞。

第三步也是最后一步是制作 $l _ "C"^"trim"$：与初始电容制备完全相同（见第 2.2.1 节），只是电子束步长缩小到 1 nm。@fig-trimming e 是单个像素在电子束曝光后的照片：绿色薄膜是光刻胶，虚线圆中较亮的矩形为图形化区域。曝光块宽 4 µm、最短 5 µm；若所需修调长度更短，则延伸到衬底上——以保证最短的修调长度也能充分显影和刻蚀。蓝宝石对过刻蚀不敏感，指叉之间不会形成明显的沟槽。

= 3 结果

== 3.1 制备后修调

@fig-yield 比较了器件 A 修调前后的良率，这是本工作的主要结果。像素–频率映射在修调前识别出 1024 个谐振器中的 1012 个，修调后为 1008 个。(a) 面板的传输数据中可以清楚看到修调后谐振间隔的大幅改善。(c)、(d) 分别画出修调前后谐振的分数频率间隔 $lambda _ "M"$ 分布；修调后的分布分为两组——LO 间隙上方的探测器比下方排得更密。设定最小所需间隔 $lambda _ "min"$（红色竖线）即得良率：良率等于与两个频率邻居的间隔都大于 $lambda _ "min"$ 的探测器占比。由于良率取决于 $lambda _ "min"$ 的选择，(e) 画出了 $P _ 0$ 随 $lambda _ "min"$ 的变化：在 $lambda _ "min" = 4 d F = 0.8 times 10^(-4)$ 处，良率从 76% 提升到 95%。

#figure(
  image("fig/yield_finalised.pdf", width: 60%),
  caption: [
    制备后修调前后的良率。蓝色为修调前，紫色为修调后。(a) 修调前后阵列的 VNA 传输扫描及所示区间的放大视图；6 GHz 附近的间隙为设计预留的本振窗口。(c) 修调前谐振器的频率间隔——同时以谐振线宽（$d F = F _ "D" slash Q _ l$，$Q _ l = 5 times 10^4$）与无量纲形式给出。(d) 修调后谐振器的频率间隔，LO 间隙上、下频段各有分布；对下频段分布做核密度估计（KDE，虚线）得到修调方法自身的标准差 $sigma _ "lim"^"trim"$。(e) 良率随最小所需频率间隔的变化：修调前（蓝）与修调后（紫）。(c)–(e) 中的红色竖线标出示例值 $lambda _ "min" = 4 d F = 0.8 times 10^(-4)$。
  ],
) <fig-yield>

@fig-beforeafter 比较修调前后的频率散布。(a)、(b) 画出修调前的测量频率偏差 $epsilon _ "M"$（蓝），减去二次拟合（虚线）后得到接近高斯分布的频率偏差 $epsilon$（橙）。$epsilon$ 并非完全高斯——它依赖于像素位置 $(x, y)$，见 (c) 的空间分布图。这些空间效应是本阵列的固有属性，由像素设计与 150 µm 像素间距共同造成，将在第 3.2 节进一步研究。(a)、(b) 中还画出了修调后的频率偏差 $epsilon^"trim"$（紫），(d)、(e) 为放大视图。频率散布改善超过 30 倍：从修调前的 $sigma = 1.1 times 10^(-2)$ 降到修调后的 $sigma^"trim" = 3.5 times 10^(-4)$；修调后未减去任何拟合，即 $sigma^"trim" = sigma _ "M"^"trim"$。(f) 的 $epsilon^"trim"$ 空间分布图显示，$epsilon$ 中的空间图样已被修正。(f) 中可见条纹图样，来自 (d) 中 $epsilon^"trim"$ 的跳变——这些跳变发生在电容指的剪短从一个指叉对过渡到下一个的时候（竖直点线）；仿真数据中也能看到指叉对之间这类离散台阶的迹象（@fig-trimming c 的插图）。用于确定 $F _ "D"^"trim"$ 的 $F _ "M"$ 拟合实际上把这些跳变抹平了，导致过渡点处偏差偏大。未来的修调工作应联合使用仿真与实测数据来修正这些过渡点。本修调方法的频率散布下限可以从 @fig-yield (d) 分布的宽度估计：用核密度估计（KDE）得到宽度后，下限为 $sigma _ "lim"^"trim" approx "std"(lambda _ "M"^"trim") slash sqrt(2) = 4.9 times 10^(-5)$。若 $lambda _ "min" = 8.0 times 10^(-5)$，该值可支撑每倍频程近 4000 的复用因子（见 @fig-multiplexing）。器件 A 的关键结果汇总于 @tbl-summary。

#figure(
  image("fig/scatter_before_after.pdf", width: 100%),
  caption: [
    制备后修调前后的频率散布。(a) 修调前的频率偏差 $epsilon$（橙）由测得频率偏差 $epsilon _ "M"$（蓝）减去二次拟合（虚线）得到，与修调后的 $epsilon^"trim"$（紫）并列；图中标注了频率散布取值，修调后未减去任何拟合。(b) $epsilon$、$epsilon _ "M"$ 与 $epsilon^"trim"$ 的直方图；为便于观察 $epsilon^"trim"$ 的直方图做了截断，实际向右延续到约一千个计数。(c) $epsilon$ 的二维色图；未识别的像素以叉号标记。(d、e) (a)、(b) 中 $epsilon^"trim"$ 的放大视图；(d) 中的竖直虚线标记过渡到剪短新电容指对的位置。(f) $epsilon^"trim"$ 的二维色图。
  ],
) <fig-beforeafter>

修调后的有载品质因数为 $Q _ l = (4.4 plus.minus 1.8) times 10^4$，与修调前的 $Q _ l = (4.4 plus.minus 1.6) times 10^4$ 无显著差异。品质因数由探测器谐振曲线的洛伦兹拟合得到 @khalilAnalysisMethodAsymmetric2012 @probstEfficientRobustAnalysis2015。我们还比较了修调前后两组各 10 个随机探测器的平均噪声功率谱密度（每组覆盖整个频率范围），未发现显著差异。噪声取探测器的时域相位响应，采样率 1 MHz @kouwenhovenResolvingPowerVisibleToNearInfrared2023。

#figure(
  table(
    columns: 5,
    align: (left, center, center, center, center),
    [], [制备出#super[1]], [完成映射#super[1]], [频率散布], [良率#super[1,2]],
    [修调前], [1023], [1012], [$1.1 times 10^(-2)$], [782],
    [修调后], [1020], [1008], [$3.5 times 10^(-4)$], [962],
  ),
  caption: [
    器件 A 制备后修调前后关键结果汇总。#super[1] 总像素数为 1024；#super[2] 取 $lambda _ "min" = 8.0 times 10^(-5)$。
  ],
) <tbl-summary>

== 3.2 像素间距

@fig-sparse 研究像素间距对频率散布的影响：a–d 面板为器件 B（像素间距 150 µm），e–h 面板为器件 C（450 µm）。两器件除像素间距外完全相同（见第 2.2.2 节），照片见 (a)、(e)；共同的插图高亮了两阵列中一只相同的探测器。频率偏差 $epsilon$（橙）同样由测得频率偏差 $epsilon _ "M"$（蓝）减去二次拟合（虚线）得到，见 (b)、(f)。(c)、(g) 为 $epsilon$ 与 $epsilon _ "M"$ 的分布及标准差；(d)、(h) 为两者的 $epsilon$ 空间分布图，未识别像素以叉号标记。器件 B 的制备良率为 98%，器件 C 为 100%。

#figure(
  image("fig/scatter_sparse_compact_finalised.pdf", width: 100%),
  caption: [
    修调前受像素间距影响的频率散布。a–d 为器件 B（像素间距 150 µm）的结果，e–h 为器件 C（450 µm）的结果；两器件除像素间距外完全相同（见第 2.2.2 节）。(a、e) 两器件的照片及其中一只相同像素的放大视图。(b、f) 频率偏差 $epsilon$（橙）——由测得频率偏差 $epsilon _ "M"$（蓝）减去二次拟合（虚线）得到。(c、g) $epsilon _ "M"$ 与 $epsilon$ 的直方图及标注的标准差。(d、h) $epsilon$ 的二维色图，未识别像素以叉号标记。
  ],
) <fig-sparse>

两器件的 $sigma$ 相差 4 倍：B 为 $4.4 times 10^(-3)$，C 为 $1.1 times 10^(-3)$。这一差别只能来自像素间距——因为两器件的像素设计、制备、测量与分析完全一致。$epsilon$ 的空间分布图揭示了 B（(d)）比 C（(h)）散布更大的原因：器件 B 的 $epsilon$ 呈现清晰的空间图样，而 C 没有。这些空间图样推高 $sigma$、加大频率碰撞概率，因为频率相邻的探测器在空间上相距很远。也就是说，$sigma = 1.1 times 10^(-3)$ 已是这一像素设计与制备方法所能达到的最低值——制备后修正方法的必要性由此可见。

我们在 (d) 中辨认出两类不同的空间图样：(1) $epsilon$ 从阵列中心向边缘的径向对称增大；(2) 上、下、右边缘处 $epsilon$ 的离散偏移。两类图样的成因必然不同——它们相互抵消，且空间关联长度不同。内部像素的径向图样可能与探测器电磁（EM）环境在阵列中的渐变有关；这并非像素间的电磁交叉耦合，因为在像素–频率映射的响应中并未观察到。边缘偏移则可能源于像素在不超过一个像素间距的范围内所感受磁环境的突变：电感总在像素右侧而左边缘不受影响；上、下边缘因对称而偏移相等，且小于右边缘。用 Sonnet 仿真最多 $3 times 2$ 像素也无法复现这些空间效应。这不太可能是阵列外 NbTiN 接地面中的磁通俘获 @baiFluxTrappingNbTiN2026——器件 A 阵列周围接地面开孔导致了同样但符号相反的偏移（@fig-device a 与 @fig-beforeafter c）；也不是 β-Ta 电感中的磁通俘获，因为其左右边缘在这方面完全相同。

$epsilon _ "M"$ 对 $F _ "D"$ 的依赖在两器件中都存在，且不受像素间距差别的影响——因此它是谐振器设计而非阵列设计的固有属性，并且必然由电容器造成（唯一随 $F _ "D"$ 变化的部件），也许是电容指整体线宽的变化或衬底的过刻蚀。

= 4 结论

本工作演示了 1024 像素 MKID 阵列（像素间距 150 µm）的制备后修调：良率从修调前的 76% 提升到修调后的 94%，源于频率散布压低超过 30 倍。这里开发的修调方法易于扩展到更大的阵列，且对谐振器的噪声与品质因数没有影响。我们还讨论了该方法进一步改进的方向。

此外我们证明，修调之前，150 µm 像素间距使频率散布比 450 µm 间距的阵列增大 4 倍；散布增大源于阵列上观察到的空间图样，目前正在进一步研究中。尽管如此，像素间距对频率散布的影响是静态的，可以在修调中予以修正。

原始数据与代码已上传 Zenodo 以复现本文全部结果：#link("https://doi.org/10.5281/zenodo.22675240")[https://doi.org/10.5281/zenodo.22675240]。

= 致谢

本工作由荷兰科学研究组织 NWO 资助（Vidi 213.149）。感谢 Nick de Keijzer 为本实验调整测量装置，感谢 SRON 机加工车间制作这些部件。感谢 Nathan Bhoedjang、Gabriël Lomans 与 Maxim Herman 在测量装置与分析方面（其研究项目）的贡献。

#set text(lang: "en", size: 8.5pt)
#set par(leading: 0.5em)
#bibliography("refs.bib", style: "ieee", title: text(size: 10.5pt, weight: "bold")[参考文献])