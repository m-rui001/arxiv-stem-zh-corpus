// 面向晶体管静电学的拓扑绝缘体异相栅堆叠
// arXiv:2609.30016 中文译本（Typst 0.15.1；Springer Nature sn-jnl 模板的 main.tex）
//
// 图片处理：图 1 虽是示意图，但四块立体堆叠里画了球棍原子层与能带小图，右侧还有分层图例，
//   属手工矢量美术而非线条框图，CeTZ 重画会丢信息，故四幅主图与八幅扩展数据图一律保留原矢量 PDF、只译图注。
// 原文结构：正文 Introduction / Results and Discussion / Conclusion / Methods，
//   之后是背材（数据与代码可用性、致谢、基金、作者信息、伦理声明）、扩展数据图表、补充说明 1–7。
// 补充说明编号与原文标签对应：1 屏蔽边界模型、2 SRIM、3 埋入电子边界、4 量子电容、
//   5 发射与隧穿、6 平带屏蔽、7 界面态。正文按“补充说明 N”引用，不跨文件做交叉引用。
// 版面决定：Typst 0.15.1 的图块不可切分，原文 \begin{figure*}[!b] 的浮动在这里无法复现，
//   故按 §8 的办法把"图后面的正文"整段挪到图前面来填页面底部（图 2 前挪两段、图 4 落在结论之后）。
//   扩展数据图 1–8 与两张扩展数据表保持编号顺序、各占一页，页底留白 5–13 cm 是这种整块排版的必然结果，
//   与原文每幅 ED 图独占一页的做法一致，不再为消白而缩小图幅（ED 图是多面板数据图，缩小会读不出坐标）。
//   补充说明 6–7 的 18 条公式按原文 \tag 编号为 (S1)–(S18)；补充说明 1–5 原文无 tag，保持不编号。

#set document(title: "面向晶体管静电学的拓扑绝缘体异相栅堆叠")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set figure(numbering: "1")
#set math.equation(numbering: none)

#import "macros.typ": *

#show heading.where(level: 1): it => {
  set par(first-line-indent: 0em)
  block(width: 100%, inset: 0pt, above: 1.2em, below: 0.4em)[
    #text(weight: "bold", size: 11pt)[#it.body]
  ]
}

#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(first-line-indent: 0em)
#show table: set par(first-line-indent: 0em)
#show figure: set block(below: 1em)

#align(center)[
  #text(size: 15pt, weight: "bold")[面向晶体管静电学的拓扑绝缘体异相栅堆叠]\
  #v(4pt)
  #text(size: 9.5pt)[
    Minuk Song #super[1,†]，Jiwan Kim #super[2,†]，Md Gius Uddin #super[3,4,†]，Wonseok Kim #super[1,†]，\
    Jihun Park #super[1]，Han Uk Lee #super[5]，Dong Won Jeon #super[5]，Dohyung Lee #super[5,6]，\
    Lide Yao #super[7]，Jouko Lahtinen #super[8]，Gyunghyun Jang #super[1]，Soohyun Min #super[1]，\
    Yonas Tsegaye Megra #super[1]，Xiaoqi Cui #super[3]，Seungwoo Choi #super[9]，Yunyun Dai #super[10]，\
    Sang Hoon Chae #super[11]，Keun Su Kim #super[9]，Dong-Ho Kang #super[1]，Hyeon-Jin Shin #super[1]，\
    Wooseok Song #super[6,12]，Seth Ariel Tongay #super[13]，Chul-Ho Lee #super[14]，Manish Chhowalla #super[15]，\
    Sung Beom Cho #super[5,✳]，Zhipei Sun #super[3,✳]，Kibog Park #super[2,✳]，Hoon Hahn Yoon #super[1,✳]
    #v(3pt)
    #text(size: 8pt)[
      #super[1] 韩国光州 61005，光州科学技术院半导体工程系\
      #super[2] 韩国蔚山 44919，蔚山国立科学技术院物理系\
      #super[3] 芬兰埃斯波 02150，阿尔托大学电子与纳米工程系\
      #super[4] 芬兰埃斯波 02150，芬兰 VTT 技术研究中心有限公司\
      #super[5] 韩国水原 16419，成均馆大学先进材料科学与工程系\
      #super[6] 韩国大田 34114，韩国化学研究院薄膜材料研究中心\
      #super[7] 芬兰埃斯波 02150，阿尔托大学 OtaNano—纳米显微中心\
      #super[8] 芬兰埃斯波 02150，阿尔托大学应用物理系\
      #super[9] 韩国首尔 03722，延世大学物理系\
      #super[10] 中国北京 100081，北京理工大学交叉科学学院\
      #super[11] 新加坡 639798，南洋理工大学电气与电子工程学院\
      #super[12] 韩国水原 16419，成均馆大学电子与电气工程系\
      #super[13] 美国坦佩 85287，亚利桑那州立大学材料科学与工程系\
      #super[14] 韩国首尔 08826，首尔大学电气与计算机工程系\
      #super[15] 英国剑桥 CB3 0FA，剑桥大学材料科学与冶金系\
      #super[†] 作者贡献同等\
      #super[✳] 通讯作者
    ]
  ]\
  #v(3pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.30016；中文译本编译于 2026-09-27]
]

#v(8pt)

#block(width: 100%, inset: (x: 1.5em, y: 1.1em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #set par(first-line-indent: 0em)
  #text(size: 9pt)[
    常规的栅堆叠微缩靠减薄介质、提高介电常数来实现，栅侧屏蔽边界的位置和电子特性则基本被当成固定量。
    但随着等效氧化层厚度（EOT）不断压低，界面处的有限响应可能越来越强地约束栅控能力。
    我们表明，这一屏蔽边界本身可以被设计：把拓扑绝缘体 #BiSe 的表面转化为绝缘的 #hk 材料 #BiF。
    位置分辨计算显示，紧邻的非晶 #BiF／晶态 #BiSe 界面能隙打开，而相邻的次界面层中重构出一种无隙的
    #BiSe 衍生电子态，并伴随一个局域界面偶极。独立的电容测量分辨出一个有限的串联响应，它与该埋入边界的
    电子可压缩性相符——它降低而非抬高标称堆叠电容。尽管付出这一电容代价，在 #BiF 厚度高度匹配、
    沟道侧材料界面同为 #BiF／#MoS 的条件下，#MoS 晶体管仍展现出接近热电子发射极限的开关、
    可忽略的迟滞，而漏致势垒降低只有纯 #BiF 对照器件的约七分之一。
    这些结果说明，除了标称介质电容，栅侧屏蔽边界的位置与电子特性同样是晶体管静电学的设计变量。
  ]
]

#v(10pt)

= 引言

晶体管继续微缩，需要控制的不仅是栅极与沟道之间的介质，还有栅电场被屏蔽的那些电子边界。
栅堆叠微缩通常只用介质厚度和介电常数来描述，但外加电位实际分配在体介质、以及导体／介质和介质／半导体
界面上有限的屏蔽响应与界面响应之上。当 EOT 进入亚纳米区间，来自电极屏蔽、界面成键、极化、
化学或结构重构的贡献并不随介质物理厚度一同缩小，因而在总静电响应中所占的份额可能持续上升 @pourfath2026device @cao2023future @lau2023dielectrics @kim2025gate @jung2025advances。
这样看来，栅侧屏蔽边界的位置与电子特性，可能与隔开它的介质同样重要。

二维范德华（vdW）半导体是检验这一区别最苛刻的场景。原子级薄的体厚度排除了半导体自身的静电长度尺度，
化学惰性的表面又让常规三维 #hk 集成变得困难，容易引入界面无序、固定电荷、陷阱态和载流子散射 @shin20252d @yoon2025enabling @jung2026advances。因此，六方氮化硼封装、种子原子层沉积、
本征介质和新兴的 vdW #hk 材料，主要精力都放在改善介质本身及其与半导体的界面 @osada2012two @lee2015highly @li2019uniform @li2020native @xu2023scalable @su2026high。
这些进展留下一个互补的问题：栅侧屏蔽边界本身能否独立于半导体侧界面，被有意地创造、移动并在电子结构上重构。

拓扑绝缘体提供了一条实现这种边界工程的途径。其体电子结构支持局域于边界的态，表面环境改变时，
这些态的空间分布可以被移动或重构 @chen2009experimental @moore2010birth @pesin2012spintronics @yue2024topological。
过去它们主要被当作输运通道来考虑 @sun2021topological @breunig2022opportunities，
作为栅堆叠中具有静电活性的边界则几乎无人触及。#BiSe 的表面可以选择性地转化为宽禁带的 #BiF @barton2019impact，于是表面转化把化学表面与其下方具有电子活性的 #BiSe 衍生边界分离开来。
由此可以设想一种栅极架构：屏蔽发生在哪里，是异相材料自身被设计出来的属性，
而不是把金属电极沉积到介质上所带来的固定后果。



#figure(
  image("fig/Figure1.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[拓扑绝缘体异相栅堆叠（TIHGS）中的屏蔽边界迁移。]
    #text(weight: "bold")[a–d]，以二维（2D）范德华（vdW）半导体为沟道的栅介质结构的示意与等效电容模型，
    其中与偏压相关的半导体体电容未画出。
    #text(weight: "bold")[a]，不含有限界面电容损失的理想化栅堆叠。
    #text(weight: "bold")[b]，常规三维（3D）非 vdW #hk 介质，含栅侧与沟道侧界面电容
    （$C _"d,g,3D"$ 与 $C _"d,ch,3D"$）、vdW 间隙电容（$C _"vdW"$）和绝缘层电容（$C _"ins,3D"$）。
    #text(weight: "bold")[c]，2D vdW #hk 介质，仍保留有限的栅侧与沟道侧界面贡献
    （$C _"d,g,2D"$ 与 $C _"d,ch,2D"$），与 $C _"vdW"$ 和 $C _"ins,2D"$ 串联。
    #text(weight: "bold")[d]，由 #BiSe 表面转化为绝缘 #BiF 形成的 TIHGS，同时保留与栅电极电学耦合的导电 #BiSe。
    微观示意区分了两件事：能隙打开的非晶 #BiF／晶态 #BiSe 化学界面，与相邻的能隙关闭的
    #BiSe 衍生次界面电子边界。这一异相诱导的埋入电子边界对应有效的栅侧屏蔽条件，
    与该边界相关的电子可压缩性响应用 $C_Q$ 表示，与 $C _("BiF"_3)$ 及沟道侧界面贡献串联。
  ]
) <fig-tihgs>

本文用 #BiSe 的选择性表面转化实现了这一概念，构成拓扑绝缘体异相栅堆叠（TIHGS）。
氟化生成绝缘的非晶 #BiF，其下保留导电的晶态 #BiSe。位置分辨的电子结构计算表明，
紧邻的异相界面能隙打开，电子活性、能隙关闭的 #BiSe 衍生态则重构在相邻的次界面层，并伴随局域界面偶极。
独立的电容测量发现与该埋入边界相关的有限电子可压缩响应，它降低了标称堆叠电容。
尽管如此，TIHGS 栅控的 #MoS 晶体管仍呈现接近热电子发射极限的开关、可忽略的迟滞，
以及相对厚度匹配良好的纯 #BiF 对照器件显著压低的漏偏置敏感性。
结构、微观、静电与器件层面的测量共同确立：屏蔽边界的位置与电子特性，
是与常规 #hk 和 EOT 微缩互补的栅堆叠变量。

= 结果与讨论

@fig-tihgs 对比了常规栅堆叠静电学与 TIHGS 中的屏蔽边界迁移。常规 #hk 堆叠中，栅侧界面电容 $C _"d,g"$、
介质电容、沟道侧界面电容 $C _"d,ch"$，以及二维沟道特有的范德华间隙电容 $C _"vdW"$ 串联在一起。
这些项里 $C _"d,g"$ 是本文的核心：它表示栅电极／介质边界的有限静电响应，来自电极屏蔽以及界面特有的
电子、成键、极化和化学或结构效应。体介质电容随物理厚度减薄而增大，这一栅侧边界贡献却不必按比例变化，
因而在小 EOT 下可以占据总静电响应中越来越大的份额 @lau2023dielectrics @cao2023future @jung2025advances @kim2025gate @pourfath2026device。
相比之下，$C _"d,ch"$ 指介质／半导体的局域界面响应，$C _"vdW"$ 指二维半导体界面处 vdW 间距带来的几何贡献。
与偏压相关的半导体体响应不属于此处定义的栅堆叠贡献，为清晰起见@fig-tihgs 中未画出。
于是设计问题变成：$C _"d,g"$ 所代表的栅侧屏蔽边界，是否必须停留在外部的金属／介质界面。

TIHGS 中，选择性表面转化生成绝缘 #BiF，残留的 #BiSe 仍与栅电极保持电学耦合。
这一架构把栅侧静电终止面从常规的外部金属／介质边界，移到了一个由异相诱导的埋入电子边界。
需要强调的是，化学转化前沿与电子屏蔽边界在原子尺度上并不重合：下面的位置分辨计算显示，
能隙打开的 #aB／#cB 界面，以及相邻 #cB 次界面层中重构出的无隙态（@fig-boundary c、d）。
因此本文所称“埋入屏蔽边界”，指的是这一具有电子活性的异相边界区域，
而非理想中原子级锐利的导体／介质平面。在化简后的串联电容模型中，其有限电子响应表示为

#figure(
  image("fig/Figure2.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[拓扑绝缘体异相栅堆叠中的电学隔离与埋入导电。]
    #text(weight: "bold")[a–c]，器件示意（上）与相应的电流–电压（$I$–$V$）特性（下），
    分别为 #text(weight: "bold")[a] 原始 #BiSe、#text(weight: "bold")[b] #SF 转化后的 #BiSe、
    #text(weight: "bold")[c] 横向原始／转化异质结。转化使电导从 mA/μm 量级被压到 pA/μm 量级。
    #text(weight: "bold")[a] 中的比例尺为 10 μm。
    #text(weight: "bold")[d]，厚度大于转化深度的 #BiSe 薄片发生部分表面转化、较薄薄片被完全转化的示意。
    #text(weight: "bold")[e]，厚 #BiSe 沟道在部分表面转化前后的 $I$–$V$ 特性，
    显示残留 #BiSe 维持导电。插图为相应光学显微照片，比例尺 20 μm。
    #text(weight: "bold")[f]，薄 #BiSe 沟道在完全转化前后的 $I$–$V$ 特性，显示氟化后实现电学隔离；
    插图为转化后以 pA 为刻度的电流。
  ]
) <fig-iso>
而非理想中原子级锐利的导体／介质平面。在化简后的串联电容模型中，其有限电子响应表示为

$ 1 / C_"g,TIHGS" = 1 / C_Q + 1 / C _("BiF"_3) + 1 / C _"d,ch" + 1 / C _"vdW", $

其中 $C_Q$ 是与埋入电子边界相关的有效电子可压缩性响应。这里 $C _"g,TIHGS"$ 表示@fig-tihgs 中从栅极到
沟道界面的贡献，包含沟道侧界面项和 vdW 间隙项；下文用于电容分析的 $C _"TIHGS"$ 只表示
#BiF／埋入边界这一元件，即 $C _"TIHGS" ^ -1 = C _("BiF"_3) ^ -1 + C_Q ^ -1$。
因而架构上的根本变化是 $C _"d,g"$ 变成了 $C_Q$：栅侧串联响应的物理来源、空间位置和电子特性，
成为有意生成的异相边界的属性，而不再是外部沉积的金属／介质接触的属性。
这套记号并不暗示 $C_Q$ 大于 $C _"d,g"$，也不意味着栅侧串联响应被消除；
下文的测量恰恰表明有限的 $C_Q$ 降低了 TIHGS 的标称电容。
该边界模型的静电学适用范围与局限见补充说明 1。

转化所定义的几何结构由结构与化学表征独立确立。氟化结构的截面透射电镜（TEM）显示，
非晶转化 #BiF 区位于残留晶态 #BiSe 之上，转化深度接近自限制值约 40–43 nm。
高角环形暗场像扫描透射电镜（HAADF-STEM）结合 X 射线能谱（EDS）进一步分辨出相应的成分分层
（@fig-ed1）。原子力显微镜（AFM）、拉曼光谱和 X 射线光电子能谱（XPS）独立支持
“这是选择性化学转化而非外加沉积”的判断：5 s 处理下，AFM 测得的表面高度增加约 3.3 nm，
远小于 TEM 测得的约 13.1 nm 转化层厚度，与母相 #BiSe 被转化并膨胀相符；XPS 则直接给出 Bi–F 成键
（@fig-ed2）。转化深度的依赖关系及其与氟渗透的联系见补充说明 2。

功能化的 TIHGS 需要两个条件同时成立：转化后的表面相提供介质隔离，其下的残留 #BiSe 仍保持导电。
原始 #BiSe 沟道的电流在 mA/μm 量级，而完全转化的沟道和横向原始／转化结都被压到 pA/μm 量级
（@fig-iso a–c）。转化区因此是电学隔离势垒，而不只是 #BiSe 的电阻率变化。
同等程度的隔离未能在 #O2 等离子体处理下复现：长时间暴露后 #BiSe 仍然导电（@fig-ed3 a–h）。


接下来我们检验迁移后的栅侧边界能否在标称堆叠电容更低的情况下改善功能栅控。
器件为 #MoS 晶体管，栅堆叠分别是 TIHGS 与完全转化的纯 #BiF。两类器件共有 #BiF／#MoS 沟道侧材料界面、
物理 #BiF 厚度都约 43 nm、沟道长度相当，主要差别只在栅侧边界条件（@fig-fet a、c）。
代表性 TIHGS 栅控晶体管的开关比超过 $10^6$，室温最小亚阈值摆幅（$SS$）约 65 mV/dec 且迟滞可忽略；
#BiF 栅控对照分别约为 $10^5$、83 mV/dec 且迟滞更大（@fig-fet b–e）。
由于沟道侧材料界面与绝缘层厚度高度匹配，而 TIHGS 的标称电容反而更低，
这些差别不能简单归因于更薄或电容更大的介质。


#figure(
  image("fig/Figure3.pdf", width: 80%),
  caption: [
    #text(weight: "bold")[埋入 TIHGS 边界的电子重构与静电响应。]
    #text(weight: "bold")[a]，用于模拟原始表面的六层五元层（QL）晶态 #BiSe（#cB）(0001) 平板，
    外侧 QL 无隙、内部为能隙打开的类体区。
    #text(weight: "bold")[b]，#text(weight: "bold")[a] 的表面加权电子能带结构；灰色为体投影态，
    蓝色为表面权重态，计算体禁隙 0.31 eV，Dirac 点位于费米能级（$E _"F"$）以下约 0.043 eV。
    #text(weight: "bold")[c]，非晶 #BiF（#aB）与四层 QL #cB 相接的结构模型，
    标出紧邻异相界面、相邻次界面 QL、类体区和对侧表面。
    #text(weight: "bold")[d]，#text(weight: "bold")[c] 的位置分辨电子结构。紧邻界面能隙打开约 0.72 eV，
    相邻次界面 QL 则出现重构的无隙 #BiSe 衍生类 Dirac 特征，中心位于 $E _"F"$ 以下约 0.146 eV，
    并保留近 $E _"F"$ 的有限谱权重。对侧表面仍与原始状态相当。
    #text(weight: "bold")[e]，计算得到的出平面偶极矩分布，响应局域在异相界面附近。
    #text(weight: "bold")[f]，纯 #BiF（p20）、TIHGS-13（p20）、TIHGS-43（p50）和 TIHGS-43（c$N$）
    MIM 电容的电容–电压（$C$–$V$）特性（$n$ 分别为 25、33、24、5）。
    TIHGS-13 与 TIHGS-43 各含约 13 nm 和 43 nm 转化 #BiF；p20、p50 为标称起始多晶 #BiSe 厚度，
    c$N$ 为标称起始厚度 $N$ 的晶态 #BiSe。
    #text(weight: "bold")[g]，$ε _("BiF"_3)$ 与按 #BiF 厚度归一化的 $ε_"eff,TIHGS"$ 分布。
    插图为 $C _("BiF"_3)$ 与有效界面量子电容 $C_Q$ 的串联表示。
    方框表示四分位距，中线为中位数，各符号对应单个电容器。
  ]
) <fig-boundary>

埋入导电这一互补要求由转化深度依赖的输运实验确立。厚度大于自限制转化深度的 #BiSe 薄片
在部分氟化后仍然导电，较薄的薄片在完全转化后被电学隔离（@fig-iso d–f）。
跨局部转化区的传输线定量测量进一步显示接触电阻几乎不变（约 157 Ω 对 161 Ω），
方块电阻却升高约 3.5 倍，说明绝缘转化区之下存在电学连续的 #BiSe 通路（@fig-ed3 i–m）。
这些测量确立了埋入栅侧屏蔽边界所需的“绝缘 #BiF／导电 #BiSe”纵向分层结构。

电学分层的 #BiF／#BiSe 结构引出一个核心微观问题：表面转化之后，具有电子活性的边界究竟位于何处？
原始 #cB 在计算得到的 0.31 eV 体禁隙中呈现类 Dirac 表面态色散，Dirac 点能 $E _"D"$ 位于费米能级
$E _"F"$ 以下约 0.043 eV，且谱权重一直延伸到 $E _"F"$（@fig-boundary a、b）。
#aB／#cB 异相的形成带来空间分辨的重构：紧邻异相界面能隙打开，界面投影能隙约 0.72 eV；
相邻的 #cB 次界面 QL 却发育出重构的无隙 #BiSe 衍生类 Dirac 特征，中心位于 $E _"F"$ 以下约 0.146 eV，
并保留近 $E _"F"$ 的有限谱权重（@fig-boundary c、d）。对侧表面仍保持原始状态。
直接的微观结论因此是：能隙打开的化学界面与具有电子活性的无隙次界面边界在空间上分离，
而不是原始 #BiSe 表面态的简单存活。

计算得到的偶极矩分布强烈局域在 #aB／#cB 异相界面附近（@fig-boundary e），
说明异相形成伴随局域界面电荷重新分布。我们并不把重构类 Dirac 特征的能量移动唯一归因于该偶极，
因为化学重构、局域成键与能带弯曲没有被独立分解。位置分辨的能带重构与局域偶极共同提供微观证据：
表面转化重新组织并在空间上迁移了 #BiSe 衍生的电子边界。这一边界是否具有有限的电子可压缩性，
由下文的电容测量独立检验。因此我们把计算保守地解释为“重构的 #BiSe 衍生埋入电子边界”的证据，
而不为化学重构界面指定一个独立确定的拓扑不变量（补充说明 3）。
补充计算确认非晶 #BiF 保持绝缘，计算带隙 3.94 eV；晶态与非晶 #BiF 的电子结构和计算介电性质
汇总于@fig-ed4 与@tab-ed1。

电容测量为埋入电子边界提供独立的静电学检验。含约 43 nm 转化 #BiF 层的晶态 TIHGS-43（c$N$）
MIM 电容器电容几乎不随偏压变化，按 #BiF 厚度归一化的有效相对介电常数均值
$ε_"eff,TIHGS" = 16.50$（@fig-boundary f、g）。多晶 TIHGS-13（p20）与 TIHGS-43（p50）
给出 $ε_"eff,TIHGS" approx 15$–16，而完全转化的纯 #BiF 参考平均给出 $ε _("BiF"_3) = 28.65$。
TIHGS 较低的电容可表示为

$ 1 / C_"TIHGS" = 1 / C _("BiF"_3) + 1 / C_Q, $

其中独立测得的 #BiF 参考给出 TIHGS-13（p20）与 TIHGS-43（p50）的有效 $C_Q$ 分别约为
2.52 与 0.631 $"μF" "cm"^(-2)$（补充说明 4）。其几何依赖表明 $C_Q$ 是有效界面响应，而非普适材料常数。
最关键的是，有限的 $C_Q$ 是一个串联响应，它降低了实测堆叠电容。再与独立计算得到的近 $E _"F"$
次界面谱权重结合，这一有限电子响应为“可电子压缩的埋入边界”提供了微观与静电相互一致的证据。
$ε_"eff,TIHGS"$ 对残留 #BiSe 厚度的弱依赖进一步排除了体贡献主导的可能（@fig-ed5 f）；
更宽的介电性质背景见@fig-ed5 g。

对这一边界架构而言，要真正作为栅堆叠工作，转化后的 #BiF 相还必须保持足够的电学隔离。
在所演示晶体管涉及的约 $| V | <= 0.5$ V 栅压窗口内，TIHGS MIM 电流密度保持在
$10^(-2)$ $"A" "cm"^(-2)$ 以下，实测栅泄漏电流也远低于漏极电流。更高电场下，
泄漏特性由场辅助发射向 Fowler–Nordheim 隧穿过渡。@fig-boundary e 的局域偶极提供了
界面电荷重新分布的微观证据，@fig-ed6 则区分了实测的几种泄漏区间，
以及以真空能级为基准、接触平衡后和高场下的能带对齐构型。完整的输运分析及其局限见补充说明 5。
变频电容测量进一步显示 1 kHz 至 1 MHz 内色散有限、损耗较低（@fig-ed5 c–e），
#WSe／TIHGS MISCAP 在半导体集成后复现出堆叠层面的 $ε_"eff,TIHGS" approx 16$
（@fig-ed7、@tab-ed2，以及补充说明 6 和 7）。


差别在漏偏置响应上最为突出：TIHGS 栅控器件的 DIBL 约 12 mV/V，#BiF 栅控对照约 87 mV/V
（@fig-fet f）。空气氧化的 #BiOx／#BiSe 对照器件可以达到约 73 mV/dec 的 $SS$，
但 DIBL 仍高达约 75.7 mV/V，说明仅形成自衍生的绝缘表面相并不能复现 TIHGS 同时具备的开关与
漏偏置响应（@fig-ed8）。每种栅堆叠构型的三台实测器件中，TIHGS 栅控器件集中在
低 $SS$／低泄漏区域；与文献基准的比较把代表性器件放在低 $SS$／低迟滞区域，
但不构成器件之间的直接排序（@fig-fet g 与@fig-ed8 h） @hu2026ultrahigh @xu2022few @chang2021ald @fu2025low @wen2016effects @zou2019improved @shen2025mos2。
这些匹配对照把改善的功能栅控与栅侧边界条件的改变联系起来。
我们并不把有限的 $C_Q$ 指认为其因果机制；它提供的是一个独立的静电学特征，
与一个电子可压缩、位置被迁移的边界相符，而重构态、界面偶极、固定电荷与结构无序各自的贡献在此未被分解。

= 结论

TIHGS 表明，栅侧屏蔽边界的空间位置与电子特性可以独立于半导体侧界面来设计。
#BiSe 的选择性转化生成绝缘 #BiF，其下保留导电 #BiSe。在这一异相边界处，紧邻化学界面能隙打开，
相邻次界面层则出现重构的无隙 #BiSe 衍生态，并伴随局域界面电荷重新分布。
近 $E _"F"$ 的有限谱权重与独立测得的串联量子电容响应共同支持一个电子可压缩的埋入边界，
而后者降低而非抬高标称堆叠电容。即便如此，匹配的 #MoS 晶体管仍呈现接近热电子发射极限的开关、
可忽略的迟滞，以及相对纯 #BiF 对照显著压低的漏偏置敏感性。
化学界面、电子屏蔽边界与标称介质电容三者之间的这种分离，把栅堆叠设计延伸到了常规 #hk 与 EOT
优化之外，让边界位置与电子结构成为晶体管静电学的独立变量。

#figure(
  image("fig/Figure4.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[TIHGS 栅控 #MoS 晶体管中增强的静电控制。]
    #text(weight: "bold")[a,c]，TIHGS 栅控 #MoS 场效应晶体管（FET）（#text(weight: "bold")[a]）
    与 #BiF 栅控对照 FET（#text(weight: "bold")[c]）的示意及其栅侧静电边界条件。
    TIHGS 栅控器件中，残留 #BiSe 与栅电极保持电学耦合，#BiSe 次界面区域内异相诱导的埋入电子边界
    定义了有效的栅侧屏蔽条件。两类器件的物理 #BiF 厚度都控制在约 43 nm。
    #text(weight: "bold")[b,d]，代表性 TIHGS 栅控（#text(weight: "bold")[b]）与 #BiF 栅控
    （#text(weight: "bold")[d]）器件的正、反扫转移特性。TIHGS 栅控器件的最小亚阈值摆幅（$SS$）
    约 65 mV/dec 且迟滞可忽略，#BiF 栅控对照分别约为 83 mV/dec 和更大迟滞。虚线为栅泄漏电流。
    #text(weight: "bold")[e]，$SS$ 随漏极电流的变化。虚线标出室温热电子发射极限 60 mV/dec。
    #text(weight: "bold")[f]，用于提取漏致势垒降低（DIBL）的阈值电压移动，
    TIHGS 与 #BiF 栅控器件分别约为 12 和 87 mV/V。
    #text(weight: "bold")[g]，本工作的 TIHGS 与 #BiF 栅控器件，与采用不同栅介质的代表性
    #MoS FET 的 $SS$ 和迟滞窗口比较 @hu2026ultrahigh @xu2022few @chang2021ald @fu2025low @wen2016effects @zou2019improved @shen2025mos2。
    文献数值来自几何结构各异的器件，栅压范围、扫描条件与提取方法也不相同，
    因此只用于背景性基准比较，不构成器件之间的直接排序。
  ]
) <fig-fet>


#include "methods.typ"


#include "edfigs.typ"

#include "supp_a.typ"

#include "supp_b.typ"


#set text(lang: "en", size: 9pt)
#set par(leading: 0.5em, first-line-indent: 0em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
