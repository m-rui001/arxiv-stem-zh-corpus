// 本片段译自 main.tex 第 350–716 行：方法节（含算法 1–3 与式 (1)–(18)）+ 背材 + 参考文献。
// 由主文件在讨论之后 include；Typst 的 #include 不继承宿主作用域，故此处自带 macros 导入。
// 公式编号：原文用 equation 环境自动编号，共 18 条，全部保留编号并在正文用 @label 引用。
// siunitx 的单位已直接写成普通文本（nm、mm、°、%），\gls 缩写首次给全称、其后用缩写。
#import "macros.typ": *

#set math.equation(numbering: "(1)")


// 伪代码块：编号行 + 两端细线，对应原文的 algorithm 浮动体。
#let pseudo(rows) = {
  let cells = ()
  for (i, r) in rows.enumerate() {
    cells.push(text(size: 0.9em, fill: gray.darken(40%), str(i + 1) + "."))
    cells.push(r)
  }
  table(
    columns: (24pt, 1fr),
    align: (right, left),
    stroke: none,
    inset: (left: 0pt, right: 6pt, top: 1.5pt, bottom: 1.5pt),
    ..cells,
  )
}

= 方法

本文的分析可以用随文公开的 GitHub 仓库中的代码 @Blaney_26_MelaninLinewidthcorrected 复现，数据则是 PhysioNet 上公开的 OpenOximetry 数据库 v1.1.1 @Fong_24_OpenOximetryRepository。这些数据是在加州大学旧金山分校低氧实验室的受控降氧方案下采集的，该方案与 ISO 80601-2-61 一致：健康成年受试者呼吸按比例调节的氮气、氧气与二氧化碳混合气，把动脉血氧饱和度维持在约 70 %–100 % 之间的一串稳定平台。每个平台上从桡动脉置管采一次动脉血，用血气分析仪（Radiometer ABL90 Flex Plus）做血氧测定，得到金标准的 #SaO2，同时由一台报出原始 PPG 的定制脉搏血氧仪（Analog Devices MAX86171）同步记录。皮肤色素用一台面向颜色测量的反射分光光度计（Konica Minolta CM-700d）量化。除 OpenOximetry 数据库之外，本文没有采集或使用任何人体数据。

本工作使用的 OpenOximetry 研究已获得加州大学旧金山分校机构审查委员会批准，批件号 21-35637 与 23-40212，本文作者与该研究没有隶属或参与关系。原始研究负责人取得了全部受试者的知情同意，其中包含匿名数据共享的同意；数据库中所有数据的采集都遵循《赫尔辛基宣言》的伦理原则 @Fong_24_OpenOximetryRepository。本文在校对与文字修改上使用了大语言模型，没有用它们生成或解读结果，内容责任由作者完全承担。

== ABG 数据的索引

分析的第一阶段对 OpenOximetry @Fong_24_OpenOximetryRepository 建索引，从 ABG 测量中提取 #SaO2 数据。从血气表里取出患者编号、就诊编号、样本序号与 #SaO2 测量值，缺其中任何一项的行予以排除。若某行满足 $"SaO"_2 > 100 %$，或者其就诊编号与患者编号没有在就诊登记表中作为配对出现，同样排除。同一份样本若重复采了几次 ABG，取其中位数。血气表共有 32877 行、涉及 224 名患者，处理后得到 17756 个 #SaO2 样本、来自 218 名患者（@fig-cohort 蓝集）。这一步对应 GitHub 仓库 @Blaney_26_MelaninLinewidthcorrected 中的 `A_loadSaO2_openox.m` 脚本。

== 从原始 PPG 提取双比值

每次就诊的原始 PPG 由 PhysioNet 波形数据库（WFDB）工具箱 @Silva_JORS14_OpensourceToolbox 读入。记录为 86 Hz 采样、红光与红外双波长（660 nm 与 910 nm）。缺失样点用线性插值补齐，端点取最近值。随后检测尖峰与阶跃伪迹并记下它们的下标（@alg-artifact）。红光与红外两路伪迹标志按逻辑并集合成一张掩模，只保留长度不小于 3 s 的连续有效片段。

#algobox(
  [尖峰与阶跃伪迹检测],
  block(width: 100%, inset: (x: 0.8em), above: 0.4em, below: 0.4em)[
    #pseudo((
      [输入：整次就诊的 #PPG 轨迹 $I$；采样率 $f _"s"$；尖峰窗 $w _"sp" = 2 " s"$；尖峰阈值 $k _"sp" = 5$；阶跃半窗 $w _"st" = 0.25 " s"$；阶跃阈值 $k _"st" = 6$；阶跃下限 $m _"st" = 0.0015$；最短有效段 $Δ t _"min" = 3 " s"$],
      [输出：无伪迹的有效片段集合 $"{" s "}"$],
      [滑动基线 $B$ 取 $I$ 在 $\ "max"(3, "round"(w _"sp" f _"s"))$ 个样点窗上的滑动中位数],
      [相对变化 $X  <-  (I - B) / B$],
      [伪标准差 $σ _X  <-  "median"(abs(X - "median"(X))) / "norminv"(0.75)$],
      [尖峰掩模 $A _"sp"  <-  abs(X) >= k _"sp" σ _X$],
      [后侧基线 $B^ -$ 取该点之前 $\ "max"(2, "round"(w _"st" f _"s"))$ 个样点上的滑动中位数],
      [前侧基线 $B^ +$ 取该点之后同样长度的滑动中位数],
      [相对边缘变化 $Y  <-  abs(B^ - - B^ +) / B$],
      [伪边缘标准差 $σ _Y  <-  "median"(abs(Y - "median"(Y))) / "norminv"(0.75)$],
      [阶跃掩模 $A _"st"  <-  Y >= "max"(m _"st", k _"st" σ _Y)$],
      [伪迹轨迹 $A  <-  A _"sp" union A _"st"$],
      [$A$ 中相邻伪迹之间长度超过 $Δ t _"min"$ 的片段即为有效集合 $"{" s "}"$],
      [返回 $"{" s "}"$],
    ))
  ],
) <alg-artifact>

#RoR 在两类定长分析窗上提取：一是窗长 20 s、步进 10 s 的滑动窗，用来构成与 ABG 同步的 #RoR 轨迹；二是以每次 ABG 采血时刻为中心的 30 s 窗，为每个 #SaO2 测量给出一个 #RoR。在每个分析窗内，心率 #fHR 取红外通道 PPG 在 0.8–3.5 Hz 范围内傅里叶幅值的主峰。逐搏 #RoR 基于原始 PPG 的峰峰值幅值估计（@alg-beats）。一个窗的 #RoR 是其逐搏值的中位数，计算前先剔除偏离中位数超过 3 倍伪标准差（即 $3 times "median"(abs(X - "median"(X))) / "norminv"(0.75)$）的搏动。窗被接受的条件是：保留搏动不少于 20 次、伪标准差与中位数之比不超过 0.08、伪迹样点数小于窗长的 0.3 倍。这些判据刻意#emph[不]用于同步轨迹的滑动窗（@alg-sync）。

#algobox(
  [峰峰值 #RoR 估计器],
  block(width: 100%, inset: (x: 0.8em), above: 0.4em, below: 0.4em)[
    #pseudo((
      [输入：窗内红光与红外 #PPG 轨迹 $I _r , I _i$；有效片段集合 $"{" s "}"$；心率 $f _"HR"$；采样率 $f _"s"$；基线跨度 $w _b = 3$ 个周期；波谷最小间隔 $w _t = 0.5$ 个周期；波谷最小凸度 $p = 0.2$],
      [输出：逐搏 #RoR],
      [基线窗长 $W  <-  "max"(3, "round"(w _b f _"s" / f _"HR"))$ 个样点],
      [去趋势均值 $I^ prime  <-  [(I _r - "movmedian"(I _r , W)) + (I _i - "movmedian"(I _i , W))] / 2$],
      [对每个片段 $s$：],
      [　在 $s$ 上取 $I^ prime$ 的极小点为波谷集合 $T$，要求间隔不小于 $w _t$ 个周期、凸度不小于 $p times (Q _"0.95" - Q _"0.05")$],
      [　对 $T$ 中相邻波谷之间的每个周期：],
      [　　$"AC" _y  <-  "max"(I _y) - "min"(I _y)$，$y in "{" r, i "}"$],
      [　　$"DC" _y  <-  ("max"(I _y) + "min"(I _y)) / 2$，$y in "{" r, i "}"$],
      [　　若 $"AC" _r$、$"AC" _i$、$"DC" _r$、$"DC" _i$ 全为正，则把 $("AC" _r / "DC" _r) / ("AC" _i / "DC" _i)$ 计入 #RoR],
      [返回 #RoR],
    ))
  ],
) <alg-beats>

之所以需要同步，是因为原始 PPG 与记录了 ABG 采血时刻的监护仪文件不在同一条时间轴上，时间偏置只能由波形形状推出，做法见 @alg-sync。具体是求 #RoR 同步轨迹与商用血氧仪报出的 #SpO2 取负之后互相关最大处对应的时间延迟。同步质量用两路信号在该延迟下的皮尔逊相关系数衡量，系数低于 0.9 的就诊被排除。

#algobox(
  [PPG 的 #RoR 与 ABG 采血时刻的同步],
  block(width: 100%, inset: (x: 0.8em), above: 0.4em, below: 0.4em)[
    #pseudo((
      [输入：整次就诊的红光与红外 #PPG 轨迹 $I _r , I _i$；参考 #SpO2 轨迹 $S$（按 ABG 时间轴）；ABG 采血时刻集合 $"{" D "}"$；同步窗 $w _s = 20 " s"$；同步步进 $Δ t _s = 10 " s"$；重采样栅格 $δ = 1 " s"$；质量阈值 $r _"min" = 0.9$；采血半窗 $h = 15 " s"$],
      [输出：每次 ABG 采血对应的 #RoR],
      [慢变 #RoR 轨迹：用 @alg-beats 的峰峰值估计器在 $w _s$ 窗、$Δ t _s$ 步进上取中位数，要求窗内至少有两个搏动],
      [监护仪起点 $t _0$ 取 $S$ 时间轴上的最早时刻],
      [对慢变 #RoR 轨迹与 $-S$ 各取 z 分数，并各按 $δ$ 间隔重采样到自己的时间轴上],
      [延迟 $Δ  <- $ 两条 z 分数序列互相关最大处的延迟],
      [把 $S$ 的 z 分数平移 $Δ$ 后与 #RoR 的 z 分数求皮尔逊相关系数，记为同步质量 $r$],
      [若 $r < r _"min"$，则排除该次就诊],
      [同步偏置 $τ  <-  t _0 - Δ$，它把监护仪时间映射到 PPG 记录时间],
      [对每个采血时刻 $D$：在 $D - τ$ 处取 $± h$ 窗，用 @alg-beats 计算 #RoR],
      [返回 #RoR],
    ))
  ],
) <alg-sync>

这一阶段处理了带有原始 PPG 记录的就诊所对应的 139 名患者（@fig-cohort 绿集）。候选采血共 7723 个样本，其中 3376 个样本的 #RoR 通过了质量阈值，最终为 106 名患者恢复出这些 #RoR 样本（@fig-cohort 橙柱）。本节对应的分析步骤在 GitHub 仓库 @Blaney_26_MelaninLinewidthcorrected 的 `B_extractRoR_openox.m` 脚本中。

== 肤色与黑色素的拟合

=== 皮肤光学模型

本文的分析聚焦于 #Mel，因为在诸种光学吸收体中，黑色素是唯一能直接刻画不同肤色的那一种 @Vasudevan_Comm_Med_24_MelanometryObjective @Kollias_ClinicsinDermatology95_PhysicalBasis。#Mel 用实测的 400–700 nm 反射光谱拟合。模型把表皮看作一片有效光学厚度 0.2 mm 的透射滤片，覆在一个代表真皮的半无限介质之上，这一处理与既往工作一致 @Blaney_JBO26_BroadlinewidthSources @Yudovsky_J_Biophotonics11_RetrievingSkin。表皮的吸收系数 #mua 只由 #Mel 的吸收决定，取文献报道的形式 @Jacques_PMB13_OpticalProperties：

$ "μ"_(a,"epi") (λ) = M times 51.9 " mm"^(-1) times (λ / (500 " nm"))^(-3.5) $ <eq-muaEpi>

其中 $51.9 " mm"^(-1)$ 是 $M = 1$、波长 500 nm 时的 #mua，幂次 $-3.5$ 表示波长依赖。真皮的 #mua 由 #HbT 浓度、#StO2 与水体积分数 #W 决定 @Blaney_JBO24_DualratioApproach：

$ "μ"_(a,"der") (λ) = "StO"_2 [ "HbT" ] times epsilon_ ("HbO"_2) (λ) + (1 - "StO"_2) [ "HbT" ] times epsilon_ ("Hb") (λ) + W times "μ"_(a,"water") (λ) $ <eq-muaDer>

式中的 $epsilon$ 是按下角标取 #HbO2 或 Hb 的摩尔消光系数。真皮的约化散射系数 #musp 用瑞利散射与米氏散射的组合建模 @Jacques_PMB13_OpticalProperties @Blaney_JBO24_DualratioApproach：

$ "μ"_(s,"der")^"′" (λ) = "μ"_(s,"der")^"′" (500 " nm") times ( f _"Ray" times (λ / (500 " nm"))^(-4) + (1 - f _"Ray") times (λ / (500 " nm"))^(-b_"Mie") ) $ <eq-muspDer>

其中 $f _"Ray"$ 是瑞利散射份额，$b _"Mie"$ 是米氏散射幂次。

光谱用 Konica Minolta CM-700d 的小口径档采集——每个部位重复测量三次——照明与视场设置为 D65 / 2° 观察者 @UCSFHypoxiaLab_25_ProtocolSkin。该配置下仪器漫照明一个直径 6 mm 的端口，并在与法线成 8° 的方向上观测直径 3 mm 的测量区 @KonicaMinolta_18_SpectrophotometerCM700d。照明端口与收集区是两个半径#emph[不同]的同轴圆盘，$r _"ill" = 3 " mm"$ 与 $r _"col" = 1.5 " mm"$，因此对测量有贡献的源探间距 #rho 按两圆盘的重叠面积 $Λ(ρ)$ 分布，两盘心距即为 #rho：

$ Λ(ρ) = cases(
  π r _"col"^2, "if" ρ <= r _"ill" - r _"col",
  r _"col"^2 cos^(-1) ((ρ^2 + r _"col"^2 - r _"ill"^2) / (2 ρ r _"col")) + r _"ill"^2 cos^(-1) ((ρ^2 + r _"ill"^2 - r _"col"^2) / (2 ρ r _"ill")) - 1/2 sqrt((( r _"ill" + r _"col")^2 - ρ^2) (ρ^2 - (r _"ill" - r _"col")^2)), "if" r _"ill" - r _"col" < ρ < r _"ill" + r _"col",
  0, "if" ρ >= r _"ill" + r _"col",
) $ <eq-overlap>

把半无限介质在间距 #rho 上连续波漫反射的真皮格林函数 $G _"der" (ρ, λ)$ @Blaney_JIOHS24_SpatialSensitivity，与无散射薄层的表皮透射 $T _"epi" (λ)$ @Blaney_JBO26_BroadlinewidthSources 结合起来，测量孔径上出射的总漫反射率 $R _"skin" (λ)$ 为（注意这一表述里 $R _"skin" (λ)$ 无量纲，它已用进入边界的源功率谱密度归一）：

$ R _"skin" (λ) = T _"epi" (λ) integral_0^(r _"ill" + r _"col") G _"der" (ρ, λ) (Λ(ρ)) / (Λ(0)) times 2 π ρ dif ρ $ <eq-rskin>

其中 $G _"der" (ρ, λ)$ 取决于真皮吸收（@eq-muaDer）与散射（@eq-muspDer），而 $T _"epi" (λ)$ 取决于表皮吸收（@eq-muaEpi）与表皮有效光学厚度 $L _"epi"$：

$ T _"epi" (λ) = e^(-2 L_"epi" "μ"_(a,"epi") (λ)) $ <eq-tepi>

（$L _"epi"$ 乘 2 是为了计入往返路程。）最后，实测总漫反射率 $R _"meas" (λ)$ 还要加上前表面的 Saunderson 镜面反射项 $K _"spec"$——即入射光中有比例 $K _"spec"$ 在空气–皮肤界面被直接反射 @Garcia-Valenzuela_J_Phys_Conf_Ser_11_AssessmentSaunderson @Berns_19_BillmeyerSaltzmans：

$ R _"meas" (λ) = K _"spec" + (1 - K _"spec") R _"skin" (λ) $ <eq-specRef>

（同样，$R _"meas" (λ)$ 以源发射的功率谱密度归一，故无量纲。）该界面上的内部再反射已经由 $G _"der" (ρ, λ)$ 中的折射率失配考虑进去了。拟合过程最小化模型与实测 $R _"meas" (λ)$ 之差的平方。

=== 光谱预处理与拟合

拟合只使用在手背（上面）、手掌（下面）、额头与上臂内侧四个部位采集的光谱 @UCSFHypoxiaLab_25_ProtocolSkin。每条光谱在 400–700 nm 间每 10 nm 取一个样点，共 31 个波长。若一条光谱的 31 个反射率值中出现非正值，或其峰值反射率落在 $[0.01, 0.90)$ 之外，该谱被剔除。四个部位的 9517 条单独光谱中，288 条不完整、1 条含非正值，余下 9228 条。把存活光谱按患者与部位分组，只有包含至少 3 次重复的组被保留：有 2 组只含 2 次重复而被排除，去掉 4 条，剩 9224 条、分属 810 组（即患者–部位组合）。若某次重复的水平偏离组中位数同时超过 5 倍伪标准差与 $"log"_10$ 单位下的 0.25，该次重复被丢弃；组本身保留，并用存下的重复合并——这里的伪标准差又是该组各水平上的 $"median"(abs(X - "median"(X))) / "norminv"(0.75)$。这一步丢掉了来自 5 组的 7 次重复，余下 9217 条光谱按波长逐点平均成每条“患者–部位”组合谱，得到 810 条平均光谱。

水体积分数（0.65）、干组织折射率（1.514）、约化散射幅值（$μ _s^"′" (500 " nm") = 4.36 " mm"^(-1)$）与米氏散射幂次（$b = 0.562$）固定为真皮文献值 @Blaney_JBO24_DualratioApproach @Jacques_PMB13_OpticalProperties。其余每个光学属性参数都参与拟合，要么逐条光谱取独立值，要么在全部光谱间共享一个值。共享的参数有四个：真皮的 #HbT、#StO2（@eq-muaDer）与瑞利散射份额（@eq-muspDer），以及前表面镜面反射因子（@eq-specRef）。目标参数 #Mel（@eq-muaEpi）则对每条平均光谱取独立值。任何一条平均光谱，若其以自身均值参照的决定系数低于 0.50 就被剔除并重新拟合，直到剩下的光谱全部满足该阈值；810 条平均光谱中有 19 条被这一阈值剔除。

=== 颜色量化

皮肤色素也用颜色来量化，即 ITA。ITA 由 CIE $L^"∗" a^"∗" b^"∗"$ 坐标（$L^"∗"$ 为明度、$a^"∗"$ 为红/绿、$b^"∗"$ 为黄/蓝）算出，而这些坐标由实测反射光谱在 D65 照明下对 CIE 1931 2° 颜色匹配函数积分得到 @Berns_19_BillmeyerSaltzmans：

$ "ITA" = tan^(-1) ((L^"∗" - 50) / b^"∗") $ <eq-ita>

ITA 以度为单位，值越大表示皮肤越浅。这个比色学描述量并不直接代表黑色素，之所以保留，是因为它简单，并且能与数据库自带的比色结果直接对比。

=== 肤色汇总

这一阶段总共处理了来自 221 名患者的 810 条光谱（@fig-cohort 紫集），每条对应一个唯一的患者–部位组合，部位取自四个拟合位置之一。其中 791 条满足拟合优度要求，并为 196 名患者恢复出了指部 #Mel（@fig-cohort 棕集）。整个步骤见 GitHub 仓库 @Blaney_26_MelaninLinewidthcorrected 的 `C_extractM_openox.m` 脚本。

== #SaO2 对 #RoR 的标定

一次采血的数据点（一个 #SaO2 与 #RoR 配对）要通过所有质量阈值、并配有 #Mel 估计值才用于标定。满足这一判据的是 98 名患者的 2991 次采血（@fig-cohort 红色交集）。标定考虑三个 #SaO2 对 #RoR 的模型。第一种用常规的经验线性标定：

$ "SaO"_2 ("RoR") = a times "RoR" + b $ <eq-linCal>

其中 $a$ 与 $b$ 是经验的斜率与截距自由参数。第二种考虑 mBLL 推导式 @Blaney_JBO24_CriticalAnalysis @Blaney_JBO26_BroadlinewidthSources，并加一个经验偏移 $o$ 以改善拟合质量、凑齐与线性情形相同的自由度数：

$ "SaO"_2 ("RoR") = (-epsilon_ ("Hb",r) + epsilon_ ("Hb",i) times Γ times "RoR") / ((epsilon_ (("HbO"_2),r) - epsilon_ ("Hb",r)) + (epsilon_ ("Hb",i) - epsilon_ (("HbO"_2),i)) times Γ times "RoR") + o $ <eq-mbll>

式中 $epsilon$ 是按下角标取 #HbO2 或 Hb、并按下角标 $r$ 与 $i$ 取红光或红外波长的摩尔消光系数；$Γ$ 是平均光程之比

$ Γ = (⟨ell⟩)_i / (⟨ell⟩)_r $ <eq-gamma>

即红外与红光波长上的平均值之比。第三种仍按 @eq-mbll 的方式使用 mBLL，但把光源当作多色的，而 @eq-mbll 假设的是单色光源。对半高全宽（FWHM）为 $w$ 的多色光源，用按被探测光谱加权的消光系数（$overline(epsilon)$）与加权光程比（$overline(Γ)$）来表述 @Blaney_JBO26_BroadlinewidthSources：

$ "SaO"_2 ("RoR", M, w) = (-overline(epsilon) _("Hb",r) + overline(epsilon) _("Hb",i) times overline(Γ) times "RoR") / ((overline(epsilon) _(("HbO"_2),r) - overline(epsilon) _("Hb",r)) + (overline(epsilon) _("Hb",i) - overline(epsilon) _(("HbO"_2),i)) times overline(Γ) times "RoR") + o $ <eq-wmbll>

为紧凑起见，上式右端各加权量 $overline(epsilon)$ 与 $overline(Γ)$ 都略去了共同的自变量 $(M, w)$；左端已写明，它们一律由 #Mel 与线宽 $w$ 决定。加权消光系数定义为

$ overline(epsilon) (M, w) = (integral I(λ, M, w) epsilon(λ) dif λ) / (integral I(λ, M, w) dif λ) $ <eq-weps>

其中 $I(λ, M, w)$ 是被探测光的功率谱密度；光源为多色时，它因光谱着色而依赖于 #Mel @Blaney_JBO26_BroadlinewidthSources。加权光程比定义为

$ overline(Γ) (M, w) = Γ times γ(M, w) $ <eq-wgamma>

其中

$ γ(M, w) = ((overline(⟨ell⟩)_i (M, w)) / (overline(⟨ell⟩)_r (M, w))) / Γ_"mono" $ <eq-gammafrac>

而加权平均光程为

$ overline(⟨ell⟩) (M, w) = (integral I(λ, M, w) ⟨ell⟩(λ) dif λ) / (integral I(λ, M, w) dif λ) $ <eq-well>

这里的 $Γ_"mono"$ 与 $⟨ell⟩$ 都取自 @Blaney_JBO26_BroadlinewidthSources 给出的整块组织平板模型，$Γ_"mono"$ 是该模型在名义单色波长下的值。引入 $γ$ 是为了用一个解析模型把 $Γ$ 随 #Mel 的光谱着色依赖抓住，而 $Γ$ 本身（@eq-wgamma）在情形三中仍作为拟合参数直接求解。这样一来，$overline(Γ)$ 对 #Mel 的依赖是模型决定的，拟合参数 $Γ$ 的幅度则不是。情形三（@eq-wmbll）的要点在于：被探测光谱取决于表皮黑色素体积分数 #Mel，于是 #Mel 成了标定中的一个自变量。三种情形都含两个自由参数：@eq-linCal 用 $a$ 与 $b$；@eq-mbll 与 @eq-wmbll 用 $Γ$ 与 $o$。重要的是，$Γ$ 有明确的物理含义 @Blaney_JBO24_CriticalAnalysis，而经验参数 $a$、$b$、$o$ 的解释就没那么清楚了。

@eq-mbll 中名义消光系数取红光与红外波长的 660 nm 与 910 nm 处的值 @Blaney_JBO24_CriticalAnalysis。@eq-wmbll、@eq-weps 与 @eq-well 中的被探测功率谱密度 $I$ 建模为三者的乘积：光源发射功率谱密度 $P$、表皮透射 $T _"epi"$、以及整块组织的透射格林函数 $G _"bulk"$ @Blaney_JBO26_BroadlinewidthSources：

$ I(λ, M, w) = P(λ, w) times T _"epi" (λ, M) times G _"bulk" (λ) times Λ _"det" $ <eq-idet>

其中 $Λ _"det"$ 是探测器面积；$G _"bulk"$ 按 15 mm 厚的平板建模，与 @Blaney_JBO26_BroadlinewidthSources 相同——@eq-well 里的 $⟨ell⟩$ 也正是从这一模型算出（计算时取单位探测器面积）。本文把 $P$ 建模为高斯型宽线宽光源：

$ P(λ, w) = P _0 times e^(-4 ln(2) times (λ - λ _0)^2 / w^2) $ <eq-pgauss>

其中 $w$ 是 FWHM、$λ _0$ 是名义波长，且表达式按 $P(λ _0) = P _0$ 归一，$P _0$ 为峰值功率谱密度（计算时取单位峰值）。本文结果假定红外光源 $w _i$ 为 50 nm（即 $λ _("0",i) = 910 " nm"$），红光源的 FWHM 取其一半（即 $w _r$ 为 25 nm、$λ _("0",r) = 660 " nm"$） @Bierman_BJA24_MelaninBias @Blaney_JBO26_BroadlinewidthSources。当 FWHM 为零（即单色情形）时，加权消光系数退化为名义值（与 @eq-mbll 相同）且 $γ = 1$，所以 $w _r = w _i = 0 " nm"$ 时情形三严格退化为情形二。

具体标定时，情形一（@eq-linCal）用普通最小二乘拟合。情形二与三（@eq-mbll 与 @eq-wmbll）用有界非线性最小二乘拟合——$Γ$ 限定在 0.1–10，$o$ 限定在 $-100 %$ 到 $100 %$。一次采血的残差定义为该点用标定模型恢复出的 #SaO2 减去其实测 #SaO2，标定精度用残差的均方根 #Arms 概括。为检验标定对肤色的依赖，另做一次线性回归：把患者均值残差对其色素量（#Mel 或 ITA）回归，每名患者按其均值残差标准误差的平方倒数加权。从这次拟合中取用的是斜率，单位为每单位色素量对应的 #SaO2 百分点（#Mel 用每单位体积分数，ITA 用每度）。

标定流程先在对整个数据集做一次全局拟合，再在 200 个交叉验证折上重复。交叉验证的每一折抽一个满足 FDA 2013 年脉搏血氧仪上市前通知指南 @FDACDRH_13_PulseOximeters 的训练集。按该指南，训练集含 10 名两种登记性别的患者，其中 2 名为深肤色——由于指南没有定义“深肤色”，这里按其自报种族（“非裔美国人”或“其他/多族裔非裔美国人”）判定——并且合计贡献不少于 200 次落在 #SaO2 的 70 %–100 % 区间内的采血。患者随机抽取，不满足条件就重抽。其余 88 名患者构成留出集（标定共考虑 98 名患者），用来算留出 #Arms 与留出斜率（#SaO2 残差对色素量的斜率），分别检验精度与肤色依赖（注意留出集包含 #SaO2 低于 70 % 的采血，训练集不包含）。这一步见 GitHub 仓库 @Blaney_26_MelaninLinewidthcorrected 的 `D_calibrate_openox.m` 脚本。

= 数据可用性

源数据集是 PhysioNet 上的 OpenOximetry 数据库 v1.1.1 @Fong_24_OpenOximetryRepository，使用受该数据库数据使用条款约束。本文不随文再分发任何 OpenOximetry 数据。

= 代码可用性

支撑本文的分析代码公开托管在 GitHub 仓库 @Blaney_26_MelaninLinewidthcorrected。

#v(0.6em)
#set text(lang: "en", size: 9pt)
#set par(leading: 0.5em, first-line-indent: 0em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])

#set text(lang: "zh", size: 10pt)
#set par(leading: 0.6em, first-line-indent: 0em)

= 致谢

G. B. 受美国国立卫生研究院 K99-HL181290 课题资助。文中内容责任完全由作者承担，不一定代表资助机构的官方观点。

= 作者贡献声明

G. B. 与 V. K. 提出研究构想。G. B.、J. F. 与 S. F. 建立理论。G. B. 与 R. D. 整理数据集。G. B. 编写分析代码、执行分析、撰写初稿并获得资助。S. F. 与 V. K. 指导研究。全体作者审阅了稿件。

= 附加信息

作者声明不存在竞争利益。
