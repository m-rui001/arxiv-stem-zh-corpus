// 覆盖 main.tex 第 443–881 行：Extended Data Figures and Tables（扩展数据图 1–8、扩展数据表 1–2）。
// 非常规处理：
// 1. 两张扩展数据表的 LaTeX 表注（原文 parbox 内的 a/b 说明）全部并入 figure 的 caption。
// 2. 表 2 原文由 a、b 两个列数不同的 tabular 组成，这里在同一 figure 的正文里放两张 table，各带小节标题行。
// 3. 表头 multicolumn/multirow 用 colspan:/rowspan: 等价表达；cmidrule 由表格横线近似。
// 4. 图注与表注各自写成一整行：Typst 会把正文里的换行折叠成空格，中文之间因此会出现不该有的空隙。
// 5. 数学符号用 Typst 原生名（tau/Gamma/epsilon/approx/…），不写反斜杠命令 —— Typst 会把 \t、\n 当转义序列。
// 6. 本片段自带 import macros.typ：实测 Typst 的 include 不会继承宿主文件的导入作用域。

#import "macros.typ": *

= 扩展数据图表

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.1.pdf", width: 100%),
  caption: [*自限制表面转化与氟穿透的长度尺度。* *a*，转化层 #BiF 厚度（$t _("BiF"_3)$）随 #SF 等离子体处理时间（$tau _("SF"_6)$）的变化。曲线为经验性的饱和指数拟合，只用于参数化“厚度趋于极限值”这一观测现象，拟合得到的时间常数并不被赋予某一确定的微观动力学含义。*b*–*h*，等离子体暴露 2、5、8、10、20、30 和 45 s 后的截面透射电子显微镜（TEM）图像。比例尺，20 nm。*i*，采用 Stopping and Range of Ions in Matter（SRIM）模拟计算的 #BiSe 中氟深度分布，假设的 $"F"^+$ 入射能量分别为 0.5、1、2.5 和 5 keV。虚线标出实验观测到的约 40–43 nm 饱和尺度。5 keV 工况是刻意设定的高能量上限计算；这些模拟限定的是可实现的弹道穿透长度尺度，并不代表实测的等离子体离子能量分布，也不代表氟化动力学。*j*–*o*，高角环形暗场扫描透射电子显微镜（HAADF-STEM）图像（*j*）及对应的能量色散 X 射线谱（EDS）元素分布图：Bi（*k*）、Se（*l*）、O（*m*）、Ti（*n*）、Au（*o*）。Se 主要富集在残余的 #BiSe 中，而已转化区域仍含 Bi。比例尺，50 nm。]
) <fig-ed1>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.2.pdf", width: 100%),
  caption: [*#BiSe 向 #BiF 的空间选择性转化。* *a*、*b*，原始区与 #SF 处理区上方的原子力显微镜（AFM）形貌（*a*）及相应的轮廓高度曲线（*b*），氟化后表面高度增加约 3.3 nm。转化层厚度（约 13.1 nm）由相同 5 s 处理条件下的截面 TEM 独立测定，它与实测表面高度增量（约 3.3 nm）之间的差别说明转化层无法用外加沉积来解释，而与下方 #BiSe 被消耗并发生体积膨胀相一致。*b* 中插图的比例尺，5 µm。*c*，跨越原始区与处理区的 #BiSe $"E"_g ^2$ 模拉曼映射图；插图为对应的光学显微镜照片。比例尺，7 µm；插图比例尺，10 µm。*d*，拉曼谱，显示 #BiSe 的特征模，以及氟化后在 250 $"cm"^(-1)$ 附近新出现的宽化峰。*e*–*h*，原始与处理后 #BiSe 的 X 射线光电子能谱（XPS）：Bi 5d（*e*）、Se 3d（*f*）、Bi 4f（*g*）、F 1s/Bi 4p（*h*）。氟化压低了源自 #BiSe 的 Bi 与 Se 组分，在 Bi 谱中引入 Bi–F 组分，并在 687.9 eV 附近产生 F 1s 峰，支持形成含氟的含 Bi 表面相。]
) <fig-ed2>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.3.pdf", width: 100%),
  caption: [*#O2 等离子体对照实验与 #BiSe 中埋入导电通道的定量表征。* *a*–*d*，#O2 等离子体处理 10 s 后的 #BiSe：光学显微镜照片（*a*）、$"E"_g ^2$ 模拉曼映射图（*b*）、取自原始区、处理区与界面区的拉曼谱（*c*），以及原始区、处理区与横向原始/处理结构的电流–电压（$I$–$V$）特性（*d*）。比例尺：*a* 为 50 µm，*b* 为 1 µm。*e*–*h*，#O2 等离子体处理 60 s 后的对应测量：光学显微镜照片（*e*）、拉曼映射图（*f*）、拉曼谱（*g*）与 $I$–$V$ 特性（*h*）。与 #SF 氟化后的情况不同，处理区仍保持导电。比例尺：*e* 为 50 µm，*f* 为 1 µm。#O2 等离子体处理条件为 30 sccm、30 mTorr、50 W。*i*–*m*，对局部转化生成的 #BiF 区域下方残余 #BiSe 导电通道开展的传输线法（TLM）分析。*i*，含约 500 nm 宽转化区的 TLM 结构与光学显微镜照片；比例尺，5 µm。*j*，代表性 $I$–$V$ 特性。*k*，总电阻随沟道长度的变化，原始结构与转化结构的线性拟合分别为 $R _"T" = 9.7 L _"X" + 313.1$ 与 $R _"T" = 34.8 L _"X" + 322.7$。*l*、*m*，提取得到的接触电阻与薄层电阻。接触电阻保持在约 157–161 $Omega$，而局部转化后薄层电阻增大约 3.5 倍。]
) <fig-ed3>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.4.pdf", width: 100%),
  caption: [*晶态与非晶态 #BiF 的计算电子能带结构。* *a*，晶态 #BiF 的结构模型。*b*，沿 $Gamma$–X–S–Y–$Gamma$–Z–U–R–T–Z 高对称路径计算的晶态 #BiF 电子能带结构，绝缘带隙为 4.14 eV。*c*，非晶态 #BiF 的结构模型。*d*，沿 $Gamma$–X、$Gamma$–Y 与 $Gamma$–Z 倒空间方向计算的非晶态 #BiF 电子能带结构，绝缘带隙为 3.94 eV。*b* 与 *d* 中的能量均以计算得到的费米能级（$E _"F"$）为参考零点。]
) <fig-ed4>

#figure(
  kind: "edtab",
  supplement: [扩展数据表],
  numbering: "1",
  caption: [*晶态与非晶态 #BiSe、#BiF 和 #BiOt 的计算带隙与介电性质。*静态相对介电常数 [$epsilon _"r"(0)$] 同时包含电子贡献与离子贡献，而高频相对介电常数 [$epsilon _"r"(∞)$] 代表离子冻结条件下的电子贡献。折射率（$n$）由平均后的 $epsilon _"r"(∞)$ 计算得到。化学计量的 #BiOt 只是作为理论参照，用于比对 @fig-ed8 所示 #BiOx/#BiSe 对照栅堆叠中氧化生成的 #BiOx 相。],
  table(
    columns: 6,
    align: center,
    table.header(
      table.cell(rowspan: 2)[*相*],
      table.cell(rowspan: 2)[*材料*],
      table.cell(rowspan: 2)[*带隙（eV）*],
      table.cell(colspan: 2)[*相对介电常数*],
      table.cell(rowspan: 2)[*$n$*],
      [*$epsilon _"r"(0)$*],
      [*$epsilon _"r"(∞)$*],
    ),
    [晶态], [#BiSe], [0.310], [38.057], [37.851], [6.152],
    [非晶态], [#BiSe], [0.777], [42.715], [13.329], [3.651],
    [晶态], [#BiF], [4.140], [29.385], [3.227], [1.796],
    [非晶态], [#BiF], [3.936], [25.311], [4.056], [2.014],
    [晶态], [#BiOt], [2.038], [32.023], [6.110], [2.472],
    [非晶态], [#BiOt], [2.096], [34.938], [6.118], [2.473],
  )
) <tab-ed1>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.5.pdf", width: 100%),
  caption: [*TIHGS 静电学的参考介质响应、厚度依赖关系与介电性质背景。* *a*，Au/Ag/Pt/$"Al"_2 "O"_3$/Au/Ti MIM 参考电容器的电容–电压（$C$–$V$）特性，测试频率 1 MHz、交流激励幅值 0.05 V（$n = 75$）。*b*，提取所得 $"Al"_2 "O"_3$ 相对介电常数的分布，均值为 8.67、中位数为 8.71。该参考响应用于从 @fig-boundary f、g 的多晶电容器结构中扣除 $"Al"_2 "O"_3$ 的串联贡献。*c*–*e*，随频率变化的相对介电常数与损耗角正切（$tan delta$）：30 nm $"Al"_2 "O"_3$（*c*）、30 nm $"Al"_2 "O"_3$/23 nm 仅 #BiF（p20）（*d*）、30 nm $"Al"_2 "O"_3$/TIHGS-43（p50）（*e*）。*f*，TIHGS-43（c$N$）的等效相对介电常数 $epsilon _"eff,TIHGS"$ 随名义起始 #cB 厚度的变化。起始厚度在约 49 至约 179 nm 之间变化时，$epsilon _"eff,TIHGS"$ 保持在约 15.9–17.4，未呈现系统性厚度依赖。*g*，#BiF、TIHGS 与若干代表性栅介质的相对介电常数随带隙（$E _"g"$）的关系 @jung2025advances。就 TIHGS 而言，纵轴是按 #BiF 厚度归一的堆叠响应 $epsilon _"eff,TIHGS"$，横轴是非晶态 #BiF 的带隙；因此该数据点提供的是介电性质背景，而不是本征材料介电常数或等效氧化物厚度（EOT）方面的优势。]
) <fig-ed5>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.6.pdf", width: 100%),
  caption: [*TIHGS MIM 电容器的场辅助漏电与能带对齐。* *a*，Au/#BiF/#BiSe/Au/Ti TIHGS MIM 电容的电流密度–电压（$J$–$V$）特性，图中标出了低功耗工作区间与较高场下的输运区间。*b*，Simmons 修正的 Schottky 与 Poole–Frenkel 表示，得到的等效高频相对介电常数分别约为 4.99 与 4.89。*c*，高场区间的 Fowler–Nordheim 表示；线性区给出与模型相关的等效注入势垒 $Phi _("B,FN")$ 约 0.27 eV。*d*，Au 接触之前以真空为参考的异相对齐，由 $phi _("Bi"_2 "Se"_3) = 5.15$ eV 与 $chi _("BiF"_3) = 4.3$ eV 构造，名义间距为 0.85 eV。重构得到的源自 #BiSe 的特征位于 $E _"F"$ 以下约 0.146 eV 处。这一参考构造无法独立分辨界面偶极、化学重构或能带弯曲。*e*，Au 接触之后达到接触平衡的示意图。取 $phi _"Au" = 5.1$ eV 时，Au/#BiSe 的功函数差约 0.05 eV，以真空为参考的 Au/#BiF 间距约 0.8 eV；这些数值并不被解释为独立测得的平衡能带偏移。*f*，$V = 3.5$ V 时的高场能带剖面。势垒倾斜使电子可以隧穿进入 #BiF 的导带态，Fowler–Nordheim 斜率给出的 #BiSe 到 #BiF 等效注入势垒约 0.27 eV。]
) <fig-ed6>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.7.pdf", width: 100%),
  caption: [*#WSe/TIHGS MISCAP 集成半导体后的静电学行为。* *a*，Au/Ag/Pt/#WSe/#BiF/#BiSe/Au/Ti MISCAP 的电容–电压（$C$–$V$）特性，测量频率从 10 kHz 到 1 MHz，栅极电压范围 $-1 <= V _"G" <= 1$ V，交流激励幅值 0.05 V。*b*，相应的并联电导响应 $G _"p" slash omega$ 随栅极电压在不同测量频率下的变化。在可及的低漏电偏压窗口内，未观察到可用于常规电导法提取的、分辨良好的 $G _"p" slash omega$ 峰值。*c*，10 kHz $C$–$V$ 曲线的二阶导数，用于确定平带电压。与主积累–耗尽拐点对应的、物理上相关的过零点给出 $V _"FB"$ 约 0.58 V。在更高频率下，相应跃迁超出了可及的低漏电栅压范围，因此不用于平带提取。*d*，在独立确定的 $V _"FB"$ 处对 TIHGS 响应做图式一致性分析。实验确定的函数 $f_1$ 与按试探 $epsilon _"eff,TIHGS"$ 计算的 $f_2$ 相比较，两者交点给出 $epsilon _"eff,TIHGS"$ 约 16。*e*，由 10 kHz 与 1 MHz 的 $C$–$V$ 特性、采用高低频电容法得到的有效电活性陷阱密度（$D _"it,eff"$）。定量解释仅限于偏压依赖的耗尽–积累跃迁区间，不包含近乎与栅压无关的耗尽下限与强积累区。所选分析区间内的最小值约为 $7.48 times 10^(11)$ $"cm"^(-2) " " "eV"^(-1)$。]
) <fig-ed7>

#figure(
  kind: "edtab",
  supplement: [扩展数据表],
  numbering: "1",
  caption: [*#BiF 与 TIHGS 结构的静电学响应，以及从 #WSe/TIHGS MISCAP 提取的参数。* *a*，实验提取的 #BiF 与 TIHGS 电容器结构的介电响应。对 TIHGS 结构而言，$epsilon _"eff,TIHGS"$ 指的是完整 #BiF/#BiSe 静电边界系统按 #BiF 厚度归一后的等效相对介电常数，不应解读为 #BiF 的本征介电常数。对完全转化的仅 #BiF（p20）参考结构，$epsilon _("BiF"_3)$ 采用独立测得的转化后 #BiF 厚度（约 23 nm）提取。TIHGS-13 与 TIHGS-43 分别表示含约 13 nm 和约 43 nm 转化 #BiF 层的结构；p20 与 p50 分别表示名义起始多晶 #BiSe 厚度为 20 nm 和 50 nm；c$N$ 表示名义起始厚度为 $N$ 的晶态 #BiSe。*b*，从 Au/Ag/Pt/#WSe/#BiF/#BiSe/Au/Ti MISCAP 提取的静电学参数。平带相关量由 10 kHz 的 $C$–$V$ 特性获得。$C _"g"$ 表示与 $epsilon _"eff,TIHGS"$ 约 16、约 43 nm 转化 #BiF 层相对应的 TIHGS 等效电容。$L _"D,eff"$ 与 $N _"app"$ 分别为等效半导体屏蔽长度与表观多数载流子浓度，计算时取 $epsilon _(bot, "WSe"_2) = 4.2$，该值沿用体相类 #WSe 薄片连续介质静电建模中的通行做法 @yu2017photogenerated。$D _"it,eff" ^("min")$ 表示在所选偏压依赖跃迁区间内，由 10 kHz/1 MHz 高低频分析提取的最小有效电活性陷阱密度。详细提取流程及其局限性见补充说明 6 与补充说明 7。],
  [
    #block(width: 100%)[*a，#BiF 与 TIHGS 结构的介电响应*]
    #v(0.6em)
    #table(
      columns: (27%, 35%, 20%, 12%),
      align: center,
      table.header(
        [*结构*], [*样品构型*], [*静电学量*], [*数值*],
      ),
      table.cell(rowspan: 2)[晶态 #linebreak() TIHGS MIM],
      table.cell(rowspan: 2)[TIHGS-43（c$N$） #linebreak() $N = 49$、65、91、128 或 179 nm],
      [平均 $epsilon _"eff,TIHGS"$], [*16.50*],
      [中位数 $epsilon _"eff,TIHGS"$], [*16.41*],
      [#WSe/TIHGS #linebreak() MISCAP],
      [Au/Ag/Pt/#WSe/#aB/ #linebreak() #cB/Au/Ti（转化 #BiF 层厚约 43 nm）],
      [$epsilon _"eff,TIHGS"$], [*约 16*],
      table.cell(rowspan: 4)[多晶 #linebreak() TIHGS MIM],
      table.cell(rowspan: 2)[TIHGS-13（p20）],
      [平均 $epsilon _"eff,TIHGS"$], [*16.12*],
      [中位数 $epsilon _"eff,TIHGS"$], [*16.10*],
      table.cell(rowspan: 2)[TIHGS-43（p50）],
      [平均 $epsilon _"eff,TIHGS"$], [*14.83*],
      [中位数 $epsilon _"eff,TIHGS"$], [*14.72*],
      table.cell(rowspan: 2)[完全转化的 #linebreak() 仅 #BiF MIM],
      table.cell(rowspan: 2)[仅 #BiF（p20） #linebreak() （$t _("BiF"_3) approx 23$ nm）],
      [平均 $epsilon _("BiF"_3)$], [*28.65*],
      [中位数 $epsilon _("BiF"_3)$], [*30.16*],
    )
    #v(1.2em)
    #block(width: 100%)[*b，从 #WSe/TIHGS MISCAP 提取的静电学参数*]
    #v(0.6em)
    #table(
      columns: (0.9fr, 0.9fr, 1.25fr, 1.25fr, 1.05fr, 1.15fr, 1.45fr),
      align: center,
      inset: (x: 3pt, y: 5pt),
      table.header(
        [*$t _("WSe"_2)$ #linebreak() （nm）*],
        [*$V _"FB"$ #linebreak() （V）*],
        [*$C _"FB"$ #linebreak() （$"10"^(-7) "F cm"^(-2)$）*],
        [*$C _"g"$ #linebreak() （$"10"^(-7) "F cm"^(-2)$）*],
        [*$L _"D,eff"$ #linebreak() （nm）*],
        [*$N _"app"$ #linebreak() （$"10"^(17) "cm"^(-3)$）*],
        [*$D _"it,eff" ^("min")$ #linebreak() （$"10"^(11) "cm"^(-2) "eV"^(-1)$）*],
      ),
      [37.37], [0.58], [2.34], [3.29], [4.60], [2.83], [7.48],
    )
  ]
) <tab-ed2>

#figure(
  kind: "edfig",
  supplement: [扩展数据图],
  numbering: "1",
  image("fig/Extended_Data_Fig.8.pdf", width: 100%),
  caption: [*更完整的晶体管特性、对照器件与器件间比较。* *a*、*b*，TIHGS 栅控 #MoS 场效应晶体管（FET）的输出特性（*a*）与随漏偏压变化的转移特性（*b*）。在整个开关区间内，栅极漏电始终低于漏极电流。*c*、*d*，#BiF 栅控对照 FET 的对应特性。*e*–*g*，空气氧化 #BiOx/#BiSe 栅控 #MoS 对照器件的特性。*e*，$V _"DS" = 0.1$ V 与 1.0 V 下的转移特性，最小亚阈值摆幅（SS）约 73 $"mV dec"^(-1)$，开关电流比约 $10^(4)$，漏致势垒降低（DIBL）约 75.7 $"mV V"^(-1)$。*f*，随漏偏压变化的转移特性及同步测量的栅极漏电。*g*，输出特性。*h*，TIHGS、#BiF 与 #BiOx/#BiSe 栅控器件之间最小 SS 与单位沟道宽度栅极漏电的器件间比较。栅极漏电在 $V _"GS" = 0.5$ V、$V _"DS" = 0.1$ V 下评估；每个数据点代表一只器件（每种栅堆叠构型 $n = 3$）。]
) <fig-ed8>
