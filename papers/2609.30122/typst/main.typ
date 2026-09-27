// 经黑色素与线宽修正的脉搏血氧标定
// arXiv:2609.30122 中文译本（Typst 0.15.1；原文 wlscirep 模板 + siunitx + glossaries）
//
// 图片处理：四幅图全部是数据图（UpSet 集合图、反射光谱与 M–ITA 散点/分布、SaO₂–RoR 三情形拟合曲线、
//   200 折交叉验证箱线图），没有线条框图，CeTZ 重画只会失真，故一律保留原矢量 PDF、只译图注，记为范围决定。
// 原文结构：摘要 / Introduction / Results / Discussion / Methods / 数据与代码可用性 / 参考文献 /
//   致谢 / 作者贡献 / 附加信息。方法节含三段伪代码（算法 1–3）与 18 条编号公式。
// 术语：glossaries 里的缩写在译文里首次出现时给全称、其后直接用缩写；SaO₂、RoR、M、ITA 等记号走 macros.typ。
// @label 已经自带 supplement 词（式 / 图 / 表 / 算法），正文引用时不再手写这两个字。

#set document(title: "经黑色素与线宽修正的脉搏血氧标定")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set figure(numbering: "1")
#set math.equation(numbering: "(1)")

#import "macros.typ": *

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.2em, below: 0.4em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}
#show heading.where(level: 2): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 0.9em, below: 0.3em)[
    #text(weight: "bold", size: 10pt)[#it.body]
  ]
}
#show heading.where(level: 3): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 0.7em, below: 0.25em)[
    #text(weight: "bold", style: "italic", size: 10pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(first-line-indent: 0em)
#show table: set par(first-line-indent: 0em)
#show figure: set block(below: 1em)



// ---------------------------------------------------------------- 标题与摘要

#align(center)[
  #text(size: 13pt, weight: "bold")[经黑色素与线宽修正的脉搏血氧标定]\
  #v(0.5em)
  #text(size: 10pt)[Giles Blaney¹, Jodee Frias¹, Ravi Durbha², Sergio Fantini¹, Valencia Koomson²]\
  #v(0.3em)
  #text(size: 8.5pt)[¹ 塔夫茨大学生物医学工程系，美国马萨诸塞州梅德福；\
  ² 塔夫茨大学电气与计算机工程系，美国马萨诸塞州梅德福。通讯作者：Giles.Blaney\@tufts.edu]\
  #v(0.3em)
  #text(size: 8.5pt, style: "italic")[关键词：脉搏血氧测定，肤色偏差，黑色素，光谱着色，修正 Beer-Lambert 定律，OpenOximetry]
]

#v(0.8em)

#block(
  width: 100%,
  inset: (x: 1.5em, y: 1.1em),
  radius: 2pt,
  stroke: 0.6pt + gray,
  fill: rgb("#fafafa"),
)[
  #par(first-line-indent: 0em)[#text(weight: "bold")[摘要]]
  #par(first-line-indent: 0em)[
    现行脉搏血氧仪倾向于高估色素较深患者的动脉血氧饱和度，使隐匿性低氧血症的漏检率上升。
    一种被提出的机制是光谱着色：黑色素会改变宽线宽光源实际被探测到的光谱形状，标定背后的波长相关参数随之带上肤色依赖。
    扩散光学理论允许写出一个同时修正黑色素与线宽的标定方程，据我们所知它还从未在活体上检验过。
    本文把经验线性方程、扩散光学理论方程以及它的修正形式分别拟合到公开的 OpenOximetry 数据库，共纳入 98 名同时具备动脉血气采样、原始光电容积脉搏波与皮肤反射光谱的受试者。
    三种做法在精度上几乎无法区分，而饱和度误差对黑色素的依赖却从每单位黑色素体积分数的 +2.8 个百分点，依次降到 +1.2 与 +0.1，方向与光谱着色理论一致。
    这三条依赖在本数据中都尚未被统计分辨出来——那需要大约再大十倍的队列——因此这一修正的依据是理论与它预期的方向。
    三种标定做法各含两个自由度：理论方程可以直接并入现行标定流程，而它的黑色素感知形式需要逐例测量肤色。
    本文展示的是脉搏血氧理论模型如何落地到标定环节。
  ]
]

#v(0.6em)


// ---------------------------------------------------------------- 引言

= 引言

脉搏血氧测定是一种非侵入式光学技术，用穿透组织的红光与红外光来推断患者的动脉血氧饱和度 #SaO2。仪器报出的指标通常叫脉搏血氧饱和度 #SpO2（顺带说明，#SpO2 里的 p 既可以指“外周”也可以指“脉搏”）；本文统一使用 #SaO2，因为它才是真正要测的那个量。脉搏血氧仪真正测量的是红光与红外光上由心脏搏动引起的相对幅值之比，即双比值 #RoR @Aoyagi_JAnesth03_PulseOximetry @Charlton_Proc_IEEE22_WearablePhotoplethysmography。把测得的 #RoR 换算成 #SaO2，靠的是在一支规模不大的队列上做一次经验标定，人数往往只有 10 名患者量级 @FDACDRH_13_PulseOximeters。然而近年情况已经清楚：现行脉搏血氧设备存在与肤色相关的系统偏差，黑人患者的 #SaO2 读数比白人患者更容易虚高 @SjodingMichaelW__NEJM20_RacialBias @Shi_BMCMed_22_AccuracyPulse @Bickler_Ane_22_PulseOximeter @Cabanas_Sensors22_SkinPigmentation @Al-Halawani_Physiol_Meas_23_ReviewEffect @Martin_BJA24_EffectSkin。这一偏差的直接后果，是色素较深的患者中隐匿性低氧血症的比例更高 @Chesley_RC22_RacialDisparities @Gudelunas_AA24_LowPerfusion @Hendrickson_CHESTCriticalCare26_EquiOxProspective（所谓隐匿性低氧血症，是指真实 #SaO2 已经低到需要干预，但因为血氧仪错误地显示为高值而没有人去干预）。美国食品药品监督管理局（FDA）2013 年的标定规程要求，标定队列里至少要有两名深肤色受试者，或者占队列的 15%，两者取大者 @FDACDRH_13_PulseOximeters。该规程本身正在被重新审议：2024 年一个 FDA 顾问小组复审了 2013 年的临床研究设计，并权衡用哪些色素度量表（包括本文用到的个体类型角 ITA）来评价设备性能 @FDAARTDP_24_FDAExecutive。这种不对称的队列要求也许能解释肤色偏差，但也留下一个问题：标定凭什么会依赖肤色，又该怎么改才能把肤色算进去。

光谱着色是肤色偏差的一种机制解释，它源于光源的有限线宽 @Rea_BJA23_LightSource @Bierman_BJA24_MelaninBias @Benner_JBO26_CauseEffect @Benner_BritishJournalofAnaesthesia25_LightSource @Blaney_JBO26_BroadlinewidthSources。论点是：一旦使用宽线宽光源（例如发光二极管 LED）而不是单色光源（例如激光二极管 LD），被探测到的光谱形状及其标称波长就取决于组织的光学属性，其中对表皮黑色素体积分数 #Mel 的依赖特别强。落到操作上就是，所有与波长相关的物理常数（例如血红蛋白的摩尔消光系数）都要按肤色重新取值，标定方程因此必须显式含 #Mel。这一机制最近得到了直接实验支持：把一台常规血氧仪的 LED 换成窄线宽 LD 之后，无论在台架测试还是 18 名受试者的临床研究中，与色素相关的偏差都消失了，而被测的两台 LED 设备都表现出偏差 @Pologe_PLOSONE25_LaserbasedPulse。也有人提出别的机制，例如真皮探测深度随肤色改变 @Blaney_JBO24_DualratioApproach，或者心动周期中背景光学属性的变化与 #Mel 之间存在非线性耦合 @Al-Halawani_JBO24_MonteCarlo。究竟哪一种机制主导了肤色偏差尚无定论，完全可能是几种机制共同作用的结果。

脉搏血氧标定自身的经验性质同样受到质疑：这种标定既说不清什么因素会干扰它，也说不清拟合出的系数对应什么物理量 @Stuban_PPEE08_NoninvasiveCalibration @Chan_RespiratoryMedicine13_PulseOximetry。我们近期从修正 Beer-Lambert 定律（mBLL）出发推导出了线性的脉搏血氧标定方程，使线性系数可以被解释成具体的物理量 @Blaney_JBO24_CriticalAnalysis。那一工作还给出了基于血红蛋白摩尔消光系数与光学路径长度的 #SaO2–#RoR 非线性理论表达式。我们进一步完全在仿真中检验了光谱着色这一肤色偏差机制，并初步提出了针对标定的光谱着色修正 @Blaney_JBO26_BroadlinewidthSources。这一修正如今已经可以放到活体血氧标定数据上检验。这样的检验要求在一支肤色多样的群体中把原始红光与红外光电容积脉搏波（PPG）波形和动脉血气（ABG）测得的 #SaO2 配对，公开的 OpenOximetry 数据库正好提供这些 @Fong_24_OpenOximetryRepository。所提修正还有一个不可少的要素：一个与 #Mel 直接挂钩、可定量的肤色度量，而它同样能从数据库的原始皮肤反射光谱中导出。

本文的核心是比较三种标定情形：一是标准的线性经验标定；二是带一个附加项的 mBLL 推导式；三是在同一 mBLL 表达式上按 #Mel 计入光谱着色修正。我们只比较自由度同为两个的标定方法，这样三者才可比——也正因此，本文不纳入有时会被使用的二次经验标定，它需要三个自由度。据我们所知，这是第一次把 mBLL 推导出的脉搏血氧标定方程 @Blaney_JBO24_CriticalAnalysis 及其随肤色变化的光谱着色修正 @Blaney_JBO26_BroadlinewidthSources，放到一支 #Mel 还可以被定量确定的受控降氧实验数据（即 OpenOximetry 数据库 @Fong_24_OpenOximetryRepository）上加以检验。


// ---------------------------------------------------------------- 结果

= 结果

== 可分析的 OpenOximetry 队列

#figure(
  image("fig/PUB_cohortUpSet_5.pdf", width: 92%),
  caption: [用 UpSet 图划分的 OpenOximetry 队列中与本工作相关的各子集。所有数值均指患者人数，各交集柱之和即数据集总人数（233 名患者）。（蓝）218 名患者有来自 ABG 的 #SaO2 值。（绿）139 名患者有原始 PPG 记录。（橙）106 名患者恢复出了 #RoR 值。（紫）221 名患者有反射光谱。（棕）196 名患者恢复出了指部 #Mel 值。（红）98 名患者同时满足标定所需的三个集合（ABG #SaO2、恢复出的 #RoR、恢复出的 #Mel）。],
) <fig-cohort>

标定需要两个血氧参数：#SaO2 与 #RoR。数据集总共 233 名患者，其中 106 名满足这一要求（@fig-cohort 橙柱），但有 8 名没有恢复出 #Mel，于是本文标定集剩下 98 名患者（@fig-cohort 红色交集）。ABG #SaO2 这一条限制最宽松，数据集里几乎每名患者都有这项数据，贡献者为 218 名（@fig-cohort 蓝集）。被排除在标定之外的 135 名患者中，多数是因为没有 PPG 记录——OpenOximetry 只对它其中的 139 名患者采集了这类数据（@fig-cohort 绿集）。换言之，本文的信号处理方法在恢复 #RoR 时剔除了 $33 / 139$，即 24 % 的 PPG 记录。

标定集的 #SaO2 与 #RoR 分布汇总于 @tab-calstats。标定集的 #SaO2 跨度比全部被接受值的 58.1–100.0 % 要窄（需要说明，完整数据集中存在大于 100 % 的值，这类值不予接受），原因是极低的 #SaO2 往往对应没有恢复出 #RoR 的情形。即便如此，标定集的范围仍然向下越过了 FDA 规定的标定下限 70 % @FDACDRH_13_PulseOximeters。

#figure(
  table(
    columns: (1fr, auto),
    align: (left, right),
    stroke: (x, y) => if y == 0 or y == 6 {(top: 1pt + black)} else if y == 3 {(top: 0.4pt + gray)} else {none},
    inset: (x: 0pt, y: 2pt),
    [#SaO2 范围], [65.2–99.4 %],
    [#SaO2 四分位距], [76.4–93.1 %],
    [#SaO2 中位数], [85.0 %],
    [#RoR 范围], [0.376–1.740],
    [#RoR 四分位距], [0.740–1.211],
    [#RoR 中位数], [0.986],
  ),
  kind: "tab",
  supplement: [表],
  placement: top,
  caption: [标定集血氧参数汇总（98 名患者、2991 个样本）],
) <tab-calstats>

== 肤色参数


#figure(
  image("fig/PUB_Spectra_ITA_M_2.pdf", width: 92%),
  caption: [由反射光谱导出的肤色与肤色观感参数。(a) 791 条代表唯一“患者–部位”组合的光谱，线色表示恢复出的 #Mel，越深表示越大。(b) 每条光谱的恢复 #Mel 与比色学 ITA 的关系，点色与 (a) 中的线色一致。(c) 四个拟合部位各自的 #Mel 分布。(d) 指部合并后的 #Mel 值，供后续分析使用，196 名可恢复出 #Mel 的患者各一个值。],
) <fig-spectra>

肤色用 #Mel 表征，肤色观感（颜色）用 ITA 表征，两者都取自可见光波段的反射光谱（@fig-spectra (a)）。这两个量不能混用：#Mel 是通过真皮光学模型反演出的光谱学浓度，而 ITA 只是对同一光谱的一个感知层面的概括。之所以两个都报，是因为 ITA 在文献中足够流行；但只有 #Mel 被当作物理量处理。#Mel 对 ITA 的散点见 @fig-spectra (b)，两者明显是非线性关系。造成这种关系的主要原因是 ITA 间接度量感知亮度，而 #Mel 是色素浓度：在 $ITA = -90 °$（即完全不反光、纯黑）的极限下，#Mel 会发散到无穷（即完全不透光、全吸收）。

谱拟合对全部 791 条代表唯一“患者–部位”组合的光谱执行（这里也包含非指部部位）。这一次最小二乘拟合同时估计了 795 个自由参数：每条光谱各有一个 #Mel，另有在全部光谱之间共享的真皮血氧饱和度 #StO2、总血红蛋白浓度 #HbT、瑞利散射份额和镜面反射因子各一个。共享参数的结果为 #HbT 34 μmol/L、#StO2 0.76、瑞利散射份额 0.52、镜面反射因子 0.087，整体拟合的决定系数为 0.97。全部光谱的 #Mel 落在 0.0068–0.34 之间（@fig-spectra (c)）。但只有手背与手掌两个指部部位的值被带入后续的血氧分析，因为脉搏血氧仪的指夹测量只对应这两个部位（@fig-spectra (d) 与 @tab-pigment）。

2013 年的 FDA 指南对标定队列设了深肤色配额，却没有说明该按什么标准判定深肤色 @FDACDRH_13_PulseOximeters。因此我们假定实践中这一判据通常来自自报种族。用于标定的 98 名患者中，自报类别为亚裔 27 名、白人 25 名、非裔美国人 24 名、西班牙裔 7 名，另有 12 名分散在多族裔组合中、3 名未报告；其中 26 名落在本文视作深肤色的两类（即“非裔美国人”与“其他/多族裔非裔美国人”）。种族是皮肤色素一个粗糙而不称职的替代量，这里用它只是为了复现 FDA 指南实际会怎么做。

#figure(
  table(
    columns: (1fr, auto, auto),
    align: (left, right, right),
    stroke: (x, y) => if y == 0 or y == 7 {(top: 1pt + black)} else if y == 1 {(top: 0.4pt + black)} else if y == 4 {(top: 0.4pt + gray)} else {none},
    inset: (x: 0pt, y: 2pt),
    [], [纳入标定], [排除于标定],
    [#Mel 范围], [0.022–0.193], [0.027–0.220],
    [#Mel 四分位距], [0.042–0.083], [0.038–0.074],
    [#Mel 中位数], [0.053], [0.055],
    [ITA 范围], [−27.9–47.3 °], [−34.9–43.6 °],
    [ITA 四分位距], [6.6–29.4 °], [11.5–32.8 °],
    [ITA 中位数], [21.7 °], [23.7 °],
  ),
  kind: "tab",
  supplement: [表],
  placement: top,
  caption: [196 名可恢复出 #Mel 的患者中，纳入标定的 98 名与被排除的 98 名，其指部肤色与颜色参数的汇总],
) <tab-pigment>
== 标定精度及其肤色依赖

#figure(
  image("fig/PUB_SaO2vsRoR_cal_3_edited.pdf", width: 92%),
  caption: [三种标定情形的定性比较。图中为 98 名患者、2991 次采血的 ABG #SaO2 对实测 #RoR。曲线用整份数据拟合。(a) 经验线性标定（@eq-linCal），恢复出 $a = -32.53 "%"$ 与 $b = 116.73 "%"$，均以 #SaO2 为单位。(b) 带偏移的 mBLL 推导标定（@eq-mbll），恢复出光程比 $Γ = 0.987$ 与偏移 $o = 10.21 "%"$（#SaO2 单位）。(c) 按被探测光谱加权、计入 #Mel 造成的光谱着色的 mBLL 标定（@eq-wmbll），恢复出 $Γ = 0.957$ 与 $o = 9.85 "%"$（#SaO2 单位）；这一情形给出的曲线依赖于 #Mel。(d) (a)–(c) 中粉色方框的放大，显示三条曲线之间的细微差别，以及情形 (c) 随 #Mel 不同的那一族曲线。],
) <fig-cases>

=== 三种标定情形

本文考虑的第一种标定情形是常规的经验线性式（@eq-linCal）；第二种采用基于 mBLL、假设光源为单色的标定模型 @Blaney_JBO24_CriticalAnalysis（@eq-mbll）；第三种则是同一拟合，但改用按被探测光谱加权的系数，从而计入多色光源的光谱着色 @Blaney_JBO26_BroadlinewidthSources（@eq-wmbll）。第一、二种情形对黑色素是“盲”的——都不以 #Mel 作为输入。只有第三种感知黑色素，因为它的被探测光谱——进而它的加权消光系数与加权光程比——取决于 #Mel。第三种情形还需要知道或假定光源线宽；本文取红线宽 25 nm、红外线宽为其两倍即 50 nm。三种情形的自由度都是二，彼此只在函数形式上不同。

在 98 名患者的完整标定集上拟合，情形一给出 $a = -32.53 "%"$、$b = 116.73 "%"$（均以 #SaO2 为单位，@eq-linCal）；情形二给出光程比 $Γ = 0.987$、偏移 $o = 10.21 "%"$（#SaO2 单位，@eq-mbll）；情形三给出 $Γ = 0.957$、$o = 9.85 "%"$（#SaO2 单位，@eq-wmbll；@fig-cases）。就整体拟合而言，三种情形的精度几乎一致，#Arms 分别为 2.420 %、2.416 %、2.418 %（#SaO2 单位）。用符合 FDA 投诉训练集的 200 折交叉验证也得到了相近的平均精度 @FDACDRH_13_PulseOximeters：三种情形留出集的 #Arms 中位数依次为 2.494 %、2.482 %、2.484 %（#SaO2，@fig-cv (a)）。200 折交叉验证中，每一种情形的每一个留出折都低于 FDA 指南设定的 3.0 % 阈值 @FDACDRH_13_PulseOximeters。因此可以合理地认为，就整体精度而言这三种标定情形的表现实际上没有差别。

=== 肤色依赖

肤色或颜色依赖用如下线性斜率来度量：把 #SaO2 残差（模型恢复值与 ABG 金标准值之差）对 #Mel 或 ITA 作线性回归。结果见 @fig-cv (b)，对应 200 个交叉验证折。以 #Mel 为肤色变量时，留出折斜率的中位数在情形一为每单位体积分数 +2.76 个百分点 #SaO2，情形二为 +1.24，情形三为 +0.10。换成 ITA 后同样的次序以相反符号出现——因为 ITA 随 #Mel 增大而变负（@fig-spectra (b)）——三者中位数依次为每度 ITA $-0.0040$、$-0.0017$、$+0.0007$ 个百分点 #SaO2。上述次序标示的是光谱着色修正把残差推动的方向。但不能据此宣称在本数据中测到了黑色素相关的偏差，因为每一个斜率的折间范围都包含零。总体上，我们报告的是一个已被施加、且有物理动机的修正，并不主张它在本数据中消除了某个被实测到的肤色偏差。


#figure(
  image("fig/PUB_crossVal_4.pdf", width: 92%),
  caption: [用 98 名患者的 200 折交叉验证对三种标定情形做定量比较。每折的训练集由 10 名满足 2013 年 FDA 指南 @FDACDRH_13_PulseOximeters 的患者组成，其余 88 名患者构成测试集。图中给出的是测试集指标。(a) 以 #SaO2 计的均方根精度，绿色虚线为 FDA 接受限。(b) 标定的肤色/颜色依赖，表现为恢复值与 ABG #SaO2 之间残差对 #Mel（橙）或 ITA（粉）的斜率。斜率为 0（黑色点线）表示与 #Mel 或 ITA 无关。],
) <fig-cv>


// ---------------------------------------------------------------- 讨论

= 讨论

本文把三种脉搏血氧标定情形拟合到同一批数据：98 名患者的 2991 次采血。三者的区别只在 #SaO2 与 #RoR 之间的函数关系；重要的是，每种都含两个自由度。它们的精度无法区分，均方根误差之差小于 0.02 %（#SaO2 单位）。三者真正的差别在于各自能表达什么，以及残差随肤色变化的程度。

第一种情形（@eq-linCal 与 @fig-cases (a)）完全是经验式的。它的斜率与截距并非由物理原理导出；不过若把 mBLL 推导出的第二种情形线性化，这两个参数就能用物理量表达出来 @Blaney_JBO24_CriticalAnalysis。mBLL 推导式把 #SaO2 写成含 #RoR 的两个线性表达式之商（即分式线性：$y = (a x + b) / (c x + d)$）。而这一分式线性形式里只有一个未知自由度，也就是光程比 $Γ$，其余系数都是摩尔消光系数的组合，只要光学波长已知它们就是定值 @Blaney_JBO24_CriticalAnalysis @Blaney_JBO26_BroadlinewidthSources。第二、三种情形（@eq-mbll 与 @eq-wmbll，@fig-cases (b)(c)）取的是理论 mBLL 表达式加一个经验常数（即偏移 $o$）的组合。引入这个偏移有两点理由：一是凑齐与情形一相同的自由度；二是它能显著改善拟合质量——单自由度的拟合不足以刻画实验数据中 #SaO2 与 #RoR 的关系。mBLL 的分式线性形式会产生一条弯曲的线，无论加不加偏移都是如此，而同样自由度的简单线性方程复现不了这条弯线。第三种情形（@eq-wmbll 与 @fig-cases (c)）没有增加自由度，但计入了含 #Mel 的组织对宽谱光源的光谱着色 @Blaney_JBO26_BroadlinewidthSources。这一步把 #Mel 变成了自变量，一条曲线因此展开成一族随肤色变化的曲线。所以情形三要在实际中使用，必须既有 #Mel 的测量值，又知道光源线宽。三种情形自由度相同，但只有第二、第三种是物理导出、可作解释的。

第二、三种情形的曲率很小，但在本文考虑的 #SaO2 范围内并不可以忽略。在标定集的 #RoR 范围 0.376–1.740 上，情形二的曲线偏离其最佳直线不超过 1.36 %（#SaO2），情形三不超过 1.39 %（#SaO2）。正是这一曲率使拟合出的曲线即使自由度与线性情形相同也仍与直线错开（@fig-cases (d)），并且可能影响落在标定范围之外的读数——那里没有任何数据参与拟合，外推只能依赖模型形式。尽管三种情形拟合出的曲线互不相同，#Arms 却几乎不受影响（@fig-cv (a)），原因是曲线差异最大的地方恰好是实验数据最稀疏的地方：只有 5.8 % 的采血其 #RoR 大于 1.4，只有 5.2 % 小于 0.6，三条曲线主要在支配 #Arms 的那段密集区之外才分开。既然三种情形的精度看不出差别，我们就不能以精度为理由推荐其中任何一种；但我们预期，在测量延伸到标定 #SaO2 范围以下、外推曲线形状开始起作用的情形下，三者会有差别 @Wu_JBO23_SelfcalibratedPulse @Feiner_AA07_DarkSkin。那种情形下情形二与三应该表现更好，不过本数据里没有证据，因为实验并未达到极低的 #SaO2。

基于 mBLL 的两种情形拟合出的光程比（两个 $Γ$）都高于 0.850 这个单色建模值——那是按整块组织总光程算出的 $Γ_"mono"$ @Blaney_JBO26_BroadlinewidthSources。对不上本是预期之中的，因为我们知道把 $Γ$ 那样理解严格说来并不正确，只能给出真值的粗略估计 @Blaney_JBO24_CriticalAnalysis。@eq-mbll 与 @eq-wmbll 所依据的 mBLL 表达式里，比值是 搏动动脉容积内的#emph[部分]平均光程之比——也就是小动脉扩张所及的那部分组织——而不是穿过整块组织的总光程之比。一项针对这些部分光程的初步蒙特卡洛研究支持这一读法：起作用的量是围绕血管的环形区域内的光程而非总光程，而且这一比值本身就随 #SaO2 变化 @Blaney_ProcSPIE25_PreliminaryInvestigation。情形二的 0.987 与情形三的 0.957 比整体建模值更接近 1，这与“两个波长上的搏动性部分光程几乎相等”相符。

对附加偏移 $o$ 的解释要困难一些，因为它不是 mBLL 推导的产物。情形二与三分别恢复出 10.21 % 与 9.85 %。这么大一个偏移不太可能来自取整或噪声——它意味着 mBLL 表达式在整个队列上把 #SaO2 系统性低估了约 10 %——而且它在各交叉验证折之间保持稳定，说明是系统性的。可能的解释包括静脉血、组织或水分对搏动信号的污染 @Walton_JCMC10_MeasuringVenous @Kainerstorfer_JBO16_OpticalOximetry，或者 ABG 数值本身存在偏移（数据集中确有高于 100 % 的 ABG #SaO2），不过考虑到偏移的量级，后者可能性不大。要解释这一偏移，需要仔细判断 @Blaney_JBO24_CriticalAnalysis 的哪些假设在真实测量中被破坏了。分辨这些解释已超出本文范围，因此在这里我们把 $o$ 当作一个未经解释的经验参数看待，与线性情形中的 $b$ 同类。

再看三种情形的肤色依赖，可以讨论 @fig-cv (b) 的含义。三种情形的排序显示出各自能表达什么：经验线性情形留下最多的未修正肤色依赖；名义上的 mBLL 推导拟合只考虑单色波长、因而不含光源线宽，其依赖较小；而按 #Mel 计入有限线宽光谱着色的情形三，其肤色与颜色依赖已接近于零。必须强调一个前提：这些斜率在本数据中没有一个被分辨出来（每种情形的 95 % 折间分布区间都包含“零依赖”）。所以我们报告的，是对同一批数据换三种拟合方式时观察到的依赖变化，而不是在情形一中测到了一个肤色偏差、也不是统计上证明了肤色偏差被消除。作为对照，要分辨残差中的肤色依赖大概需要多大的队列是一个有用的参照。本标定集有 98 名患者，而关于脉搏血氧仪误差随肤色变化的临床报道用的是大得多的队列——一篇 1565 名，另一篇 8392 名，两篇同出 @SjodingMichaelW__NEJM20_RacialBias。因此，若目标是让 #SaO2 残差对 #Mel 的斜率达到显著，预计需要比本文多约十倍的患者。本数据中没有分辨出依赖，并不否定我们在三种情形之间观察到的变化，只是指明需要更大规模的队列研究。规模够大的公开队列正在出现——例如“血气与血氧联动数据集”（BOLD）把三家重症监护数据库中的 49099 组配对测量合到了一起 @Matos_SciData24_BOLDBloodgas——不过这类资源记录的是商用血氧仪读数与 ABG 值的配对，而不是本文所检验的修正需要的原始 PPG 波形（或 #RoR）与皮肤反射光谱。尽管如此，我们对结果的理解仍然显示情形二与三有前景，尤其是可能修正脉搏血氧肤色偏差中光谱着色那一部分的情形三。

结语。本文提出并在数据上检验了两种 mBLL 推导的脉搏血氧标定方法，即情形二与情形三。情形三的修正在 @Blaney_JBO26_BroadlinewidthSources 中已被建议，但本文第一次给到足以实现它的细节（见方法节）并把它放到实验数据上检验。情形三表现最好，同时也是实现最麻烦的一个，因为每名患者都要额外测一次 #Mel。这就使情形二成为对现有血氧仪技术最可行的一种；不过必须指出，情形二对黑色素是盲的，只有情形三感知黑色素。另外，我们提出的是标定方法，黑色素与线宽修正无法直接搬到现役脉搏血氧仪上。后续工作可以用本文的理论与模型去推导这样一个仪器层面的修正。这样的修正也许是必要的，因为要达到足以显示肤色偏差及其统计显著的消除的统计功效，需要的队列规模只在商用血氧仪的临床读数数据里存在，受控降氧研究里没有。至于容易着手的部分，我们建议在未来的降氧式脉搏血氧标定研究中考虑基于 mBLL 的标定模型，特别是情形二：它不需要另测皮肤色素，自由度与线性标定相同，因此可以很方便地把线性标定替换掉。

#include "methods.typ"