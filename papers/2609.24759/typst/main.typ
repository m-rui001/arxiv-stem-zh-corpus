// 基于交替磁体的超导量子比特 —— arXiv:2609.24759v1 中文翻译（Typst 版）
// 由 tex 源文件人工翻译重排；图 1 使用 Cetz 重绘，图 2-4 保留原矢量图并翻译图注。

#set document(title: "基于交替磁体的超导量子比特")
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

#align(center)[
  #text(size: 15pt, weight: "bold")[基于交替磁体的超导量子比特]\
  #v(4pt)
  #text(size: 10.5pt)[Xue-Feng Pan（潘雪峰）#super[1]，Xin-Lei Hei #super[1]，Franco Nori #super[2]，Peng-Bo Li（李鹏博）#super[1] #link("mailto:lipengbo@mail.xjtu.edu.cn")[✉]]\
  #v(2pt)
  #text(size: 8.5pt)[
    #super[1] 西安交通大学物理学院，物质非平衡合成与调控教育部重点实验室，
    陕西省量子信息与光电子器件重点实验室，西安 710049，中国\
    #super[2] 日本理化学研究所量子计算中心量子信息物理理论研究团队，和光，埼玉 351-0198，日本
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.24759v1 [quant-ph]，2026 年 9 月 21 日；中文译本编译于 2026-09-26]
]

#v(8pt)
#block(width: 92%, inset: (x: 1.6em), stroke: 0.6pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    交替磁体（altermagnet）净磁化强度为零，自旋劈裂却随动量改变，是下一代约瑟夫森器件的理想底座。
    本文利用超导体–交替磁体–超导体结中的约瑟夫森效应说明：只要把器件结构设计好，电流–相位关系就能按需定制。
    有了这种靠交替磁性编程的约瑟夫森势，我们提出一类新的类 transmon 超导量子比特——它借助双库珀对隧穿，
    既保住大非谐性，又更耐退相干。我们证明，工作在 $2phi$ 结区间时，宇称保护会让量子比特天生对电荷噪声免疫。
    磁通可以精确操控量子比特；偏置点选得合适，电荷噪声与磁通噪声还能一并压下去。
    这些结果说明交替磁体是一个通用的约瑟夫森势工程平台，也给出了一条兼顾高相干、大非谐与宽可调的超导量子比特路线。
  ]
]
#v(6pt)

= 引言

超导量子比特是量子计算的主流平台，约瑟夫森结为它提供了不可缺的非线性元件
@2010LaddP4553 @2008ClarkeP10311042 @2021BlaisP2500525005 @2020KjaergaardP369395。
量子比特的能谱和非谐性都由结决定，对噪声有多敏感、能相干多久也跟着定了下来。
因此，想要更相干的超导量子比特，近来不少工作转而设计新的约瑟夫森势。
Fluxonium 量子比特 @2018LinP150503150503 @2019NguyenP4104141041 @2022BaoP1050210502 @2023SomoroffP267001267001
用超电感改造有效势，强非线性保住了，对磁通噪声却更迟钝；
$0$-$pi$ 量子比特 @2013BrooksP5230652306 @2018GroszkowskiP4305343053 @2021GyenisP1033910339 @2026KolesnikowP1030610306
则把有效势做成二维的，让电荷噪声与磁通噪声同时指数级压低。
问题是，能拿到的势形仍然有限——常规 $s$ 波结本征的电流–相位关系（CPR）没有多少可调空间。
要跳出这个框，就得看非常规超导结给出的反常 CPR。
$d$ 波超导量子比特是一例：flowermon @2024BroscoP1700317003 与 $d$-mon @2024PatelP1700217002
都靠 CPR 里显著的高次谐波把非谐性做大。
只是这类方案依托 $d$ 波超导体、一般工作在 $phi$ 结区间，准粒子噪声与电荷噪声依旧躲不开。

交替磁体是近年才确认的一类新磁有序相
@2019NakaP43054305 @2020SmejkalP88098809 @2022BaiP197202197202 @2022FengP735743 @2022SmejkalP482496 @2022ifmmodeSelseSfimejkalP4050140501 @2022ifmmodeSelseSfimejkalP3104231042 @2025SongP473485 @2025TamangP @2026ChenP4670546705 @2026LiP4670446704 @2026LiuP869873，
对自旋电子学@2021ShaoP70617061 @2022SmejkalP1102811028 @2022BoseP267274 @2022KarubeP137201137201 @2024ZhangP23133322313332 @2024BaiP24093272409327 @2025FuP111111 @2025HuangP266701266701 @2025GuoP25057792505779 @2026SudoP1650316503 @2026JungwirthP10121021 @2026MonkmanP1105711057、
磁子学
@2023ifmmodeSelseSfimejkalP256703256703 @2023JinP9092307 @2025CostaP125125 @2025GarciaGaitanP2040720407 @2025BeidaP9797 @2025SourounisP134448134448 @2025EtoP9444294442 @2025BiniskosP93119311 @2026JinP8670386703 @2026WeissenhoferP2525 @2026YuanP106901106901 @2026WiedmannP2626 @2026RodriguezSuarezP134411134411 @2026YangP2670126701 @2026LiP224403224403 @2025JinP126702126702、
超导物理
@2023PapajP6050860508 @2023SunP5451154511 @2024DasP245424245424 @2023OuassouP7600376003 @2023BeenakkerP7542575425 @2024ChengP1451814518 @2024ZhangP18011801 @2024BanerjeeP2450324503 @2024LuP226002226002 @2025SumitaP144510144510 @2025MazinP1818 @2026LiuP @2026JasiewiczP5151
以及拓扑物理
@2023LiP205410205410 @2024GhorashiP106601106601 @2026HodgeP4545 @2026FuP9660496604 @2026YangP4545 @2024LiP201109201109 @2025LiuP241405241405 @2026HuoP2442024420 @2026GonzalezGarciaP4400444004
都产生了深远影响。
它的磁矩共线且彼此补偿，自旋劈裂却在动量空间里分明可见：
能带结构像铁磁体那样自旋依赖，净磁化强度却为零
@2022ifmmodeSelseSfimejkalP4050140501 @2022ifmmodeSelseSfimejkalP3104231042 @2025SongP473485 @2025TamangP。
这样一来，普通磁体那种会压制超导的有害杂散场
@2026YangP4545 @2004GolubovicP546546 被避开了，操控约瑟夫森结的输运也多出一个自由度。
交替磁体–超导体异质结构里已经看到种种非常规超导现象
@2025ChakrabortyP2600126001 @2025M_FroldiP170273170273 @2025FukayaP6450264502 @2025AlipourzadehP214515214515，
反常约瑟夫森势由此有了可做的空间。
单看交替磁体约瑟夫森结（AMJJ），取向依赖的 Andreev 反射
@2023PapajP6050860508 @2023SunP5451154511、$0$-$pi$ 跃迁 @2023OuassouP7600376003 @2024LuP226002226002
以及多谐波电流–相位关系 @2024LuP226002226002 @2025SunP165406165406 都已有实验报道。
只是这些工作大多停在输运现象本身，拿 AMJJ 去做超导量子比特和量子器件，目前基本还是空白。

本文给出一种基于交替磁体约瑟夫森结（AMJJ）的超导量子比特方案。
第一步是弄清结的微观参数怎样塑造约瑟夫森势：只保留单库珀对与双库珀对隧穿时，
AMJJ 就能被调到 $phi$ 结或 $2phi$ 结区间
@2025MitrovicP6700167001。
第二步用 AMJJ 搭出类 transmon 量子比特，比较它落在不同结区间时的量子性质。
与已有的超导量子比特相比，这类器件有几处好处：
双库珀对隧穿让 $phi$ 与 $2phi$ 区间都保有强非谐性，同时自带电荷噪声保护；
到了 $2phi$ 区间，波函数的宇称会把电荷噪声彻底关掉，
这一点与此前的 $d$ 波超导量子比特 @2024BroscoP1700317003 @2024PatelP1700217002 形成直接对照。
这些保护性质在很宽一段可调参数上都成立，说明 AMJJ 在设计上留有余地。
何况 AMJJ 用的是能隙各向同性的 $s$ 波超导体，准粒子噪声本就小，也接得上成熟的超导电路工艺
@2011CatelaniP7700277002 @SM。

要操控量子比特还得靠磁通，于是我们进一步给出该架构的磁通可调实现。
外磁通能控制双库珀对隧穿的权重，工作点选得恰当，电荷噪声敏感性可以完全清零。
代价是双库珀对隧穿通常会放大磁通噪声敏感性，不过磁通偏置点同样能把这一项压回去。
总的来说，交替磁体可以当作可编程、通用的约瑟夫森势平台，
强非谐、内建噪声保护与灵活操控这三件事在其中并不冲突。

= 约瑟夫森能量的定制

我们让 AMJJ 充当量子比特的非线性元件，示意见 @fig-one 中 (a)、(b)。
它的用处在于能按需拼出带高次谐波的非正弦约瑟夫森势——这些谐波项对应的正是多库珀对隧穿。
@fig-one 的 (c)–(e) 画出 $phi$ 结、$0$ 结与 $2phi$ 结三种势形。
三幅子图里，蓝、红、黄阴影分别是基态、第一激发态与第二激发态的波函数，
并按各自本征能量在竖直方向平移（基态与第一激发态就取作量子比特态 $⟨0 ⟩$ 与 $⟨1 ⟩$）。
对照这三幅图不难看出：高阶库珀对隧穿能把能级谱的非谐性拉开。

为了看清微观参数如何塑造约瑟夫森势，我们写下 AMJJ 的微观哈密顿量。
AMJJ 是三层夹心结构：两块半无限 $s$ 波超导体电极之间夹一层交替磁体。
这里以 $d _ "xy"$ 波交替磁体（$d _ "xy"$-AM）为例，一般情形见补充材料 @SM。
采用 Nambu 旋量 $hat(c)_bold(k) = [hat(c)_(bold(k), arrow.t), hat(c)_(bold(k), arrow.b), hat(c)^dagger_(-bold(k), arrow.t), hat(c)^dagger_(-bold(k), arrow.b)]$，
交替磁体区的哈密顿量写作
$ hat(H) _ "AM" = 1/2 sum _bold(k) hat(c)^dagger _bold(k) hat(cal(M))_bold(k) hat(c)_bold(k), $
其中 $hat(cal(M))_bold(k) = alpha_1 k_x k_y hat(s)_z hat(tau)_z$，$bold(k) = (k_x, k_y)$，
且 $alpha_1 = 2J sin(2 alpha) / k_F^2$ @2022SmejkalP1102811028 @SM。
这里 $J$ 为交换能，$alpha$ 是交替磁体晶轴与界面法线间的失准角，$k_F$ 为费米波矢，
$hat(s)_z$（$hat(tau)_z$）是作用于自旋空间（Nambu 空间）的泡利矩阵。

我们考虑短结极限（$L << xi_0$，$xi_0$ 为超导相干长度），此时约瑟夫森电流主要由 Andreev 束缚态携带
@2023BeenakkerP7542575425 @1991BeenakkerP38363839 @1999FurusakiP809818。
交替磁性解开了这些态的自旋简并，能支因此按自旋分开
[（@fig-one(a) 画出三条正能支；红、蓝分别对应自旋向上、向下）]：
$ E _ arrow.t ^(±(k_y)) = ± Delta(T) sqrt(1 - T(k_y) sin^2 (phi/2 - alpha_ "AM") ) $ <eq-up>
$ E _ arrow.b ^(±(k_y)) = ± Delta(T) sqrt(1 - T(k_y) sin^2 (phi/2 + alpha_ "AM") ). $ <eq-down>
这里 $alpha_ "AM" = k_y J L$ 是交替磁性带来的相移。
界面势垒参数 $Z = m U_I / (ℏ k_F^2)$ 与化学势失配 $delta mu$ 一起决定动量依赖的透射概率 $T(k_y)$，
其中 $m$ 为电子质量，$U_I$ 为界面势垒高度。
这样一来，每个动量通道都可以看成一个自带相移与透射概率的等效约瑟夫森结，
宏观约瑟夫森势则是所有通道的叠加。
在这幅图像里，$J$ 与 $L$ 管各通道的相移，$Z$ 与 $delta mu$ 管各通道的权重。
区分这几样作用的详细数值结果见补充材料 @SM。

#figure(
  include "fig1.typ",
  caption: [
    (a) AMJJ 示意图：厚度为 $L$ 的交替磁体层夹在两块 $s$ 波超导体之间。
    (b) 基于 AMJJ 的类 transmon 超导量子比特电路示意图。
    (c)–(e) 分别示意 AMJJ 可实现的 $phi$ 结、$0$ 结与 $2phi$ 结的约瑟夫森能。
    蓝、红、黄色阴影区域表示三个最低能量本征态的波函数分布，其竖直位置对应各自的本征能量。
    （译者注：原图为矢量 PDF，此图以 CeTZ 重绘。）
  ],
) <fig-one>

Andreev 束缚态给出了量子干涉的微观图像，总约瑟夫森电流 $I(phi)$ 则用 Furusaki–Tsukada 公式
@2021AsanoP @2000KashiwayaP16411641 @1991FurusakiP299302 数值算出。
电流写作 $I(phi) = I_c cal(I)(phi)$，其中 $I_c$ 为临界电流，$cal(I)(phi)$ 为归一化 CPR。
相应的宏观约瑟夫森势为 $cal(V) = E_J cal(U)(phi)$，
其中约瑟夫森能 $E_J = Phi_0 I_c / (2 pi)$、无量纲约瑟夫森势
$cal(U)(phi) = integral_(-∞)^phi  cal(I)(phi^') d phi^'$，$Phi_0$ 为磁通量子。
@fig-two(a) 显示，单是改变交替磁体层厚度 $L$，主要引发 $0$–$pi$ 跃迁，
$phi$ 结与 $2phi$ 结只缩在很窄的 $L$ 区间里。
对 CPR 作傅里叶分析 [@fig-two(b)] 也印证了这一点：$L$ 取大部分值时一次谐波占主导，
高次谐波只在 $0$–$pi$ 跃迁边界附近才抬起头。
一旦引入有限的 $delta mu$，局面就不同了 [@fig-two(c)、(d)]：
支持 $phi$ 结与 $2phi$ 结的参数区被拓宽，高次谐波的振幅也明显增大。
至于交换强度 $J$ 与势垒参数 $Z$，它们的作用分别类似 $L$ 与 $delta mu$，
详见补充材料 @SM。

#figure(
  image("Fig2.pdf", width: 62%),
  caption: [
    (a)、(c) 分别为交替磁体厚度 $L$ 与化学势失配 $delta mu$ 对 AMJJ 约瑟夫森能的调制。
    (b)、(d) 分别为 (a)、(c) 情形下约瑟夫森电流的对应谐波分量。
    (a)、(b) 中固定参数为 $J = 0.4 mu$、$delta mu = 0$、$Z = 0$；
    (c)、(d) 中固定参数为 $J = 0.4 mu$、$k_F L = 20$、$Z = 0$。
  ],
) <fig-two>

= 交替磁体超导量子比特

同时计入单库珀对与双库珀对隧穿后，CPR 写作
$ cal(I)(phi) = cal(I)_1 sin(phi) + cal(I)_2 sin(2 phi), $ <eq-cpr>
式中所需的微观参数由逆向设计流程确定 @SM。
如 @fig-one(b) 所示，我们给 AMJJ 并联一个大电容，构成类 transmon 超导量子比特，其哈密顿量为
$ hat(H) _ "Tr" = 4 E_C (hat(N) - N_g)^2 - E_J cal(I)_1 cos(hat(phi)) - E_J cal(I)_2 / 2 cos(2 hat(phi)). $ <eq-htr>
这里 $E_C$ 为充电能，$N_g$ 为偏置电荷（下文为简单起见取 $N_g = 0$），
$hat(N) = -i partial_phi$ 为库珀对数算符。

高次谐波的作用有多强，用一个无量纲比值 $eta = cal(I)_2 / cal(I)_1$ 来度量。
如 @fig-one(c)–(e) 所示，$eta < 0$、$eta = 0$、$eta > 0$ 分别对应 $phi$ 结、$0$ 结与 $2phi$ 结区间；
$|eta|$ 越大，双库珀对隧穿的相对贡献越强。
@fig-three(a) 给出能谱随 $eta$ 的变化。
$eta < 0$ 时，$eta$ 越小，基态与第一激发态越接近简并；
$eta > 0$ 时反过来，第一与第二激发态在临界值 $eta_c$ 处简并
[红星标出，见 @fig-three(a)、(c)]。
跨过 $eta_c$，第一激发态的宇称随之改变，@fig-one(c)–(e) 与此对应，补充材料 @SM 有进一步讨论。
@fig-three(b) 给出量子比特相对非谐性
$alpha_f = | f_ 12 - f_ 01 | / f_ 01 × 100 %$ 随 $eta$ 的变化，
其中 $f_ 01$、$f_ 12$ 为相应跃迁频率。
普通的 $0$ 结量子比特要躲开电荷噪声，一般得深入 transmon 区间（$E_J / E_C >> 1$）
@2007KochP4231942319 @2021RasmussenP4020440204；
可这样一来非谐性就被牺牲掉了——
@fig-three(b) 中灰色虚线与各曲线的交点正是这个取舍。
本系统不必如此：同样工作在 transmon 区间，调 $eta$ 就能把非谐性做大。

#figure(
  image("Fig3.pdf", width: 66%),
  caption: [
    (a) $E_J / E_C = 50$ 时超导量子比特本征能量谱随 $eta$ 的变化。红星标出第一、第二激发态简并处的临界值 $eta_c$。
    (b) 非谐性 $alpha_f$ 与 (c) 横向电荷噪声耦合强度 $cal(N)_ "DC"^Q$ 在不同 $E_J / E_C$ 下随 $eta$ 的变化；
    (c) 中的星标出不同 $E_J / E_C$ 对应的临界值 $eta_c$。
    (d) $E_J / E_C = 50$ 时基态与第一激发态在库珀对数（$hat(N)$）基下的波函数；
    蓝、绿虚线分别对应 $eta = 0$ 与 $eta = eta_c$。
  ],
) <fig-three>

再看环境噪声对相干性的影响，模型里主要考虑电荷噪声。
高频电荷噪声引起能量弛豫，按费米黄金规则，弛豫率可写作
@SM @2019KrantzP2131821318 @2021RasmussenP4020440204 @2001MakhlinP357400
$ Gamma _ "DC"^Q = 1/ℏ^2 dot 64 E_C^2 cal(N)_ "DC"^Q S_Q(omega_q), $ <eq-gamma-dc>
其中 $cal(N)_ "DC"^Q = | ⟨psi_0 |hat(N)| psi_1 ⟩ |^2$ 为横向电荷噪声耦合强度，
$S_Q(omega_q)$ 是电荷噪声谱密度在量子比特跃迁频率 $omega_q = 2 pi f_ 01$ 处的取值。
量子比特对高频电荷噪声有多敏感，基本就看 $cal(N)_ "DC"^Q$。
@fig-three(c) 显示：$eta < 0$ 时，横向耦合随 $eta$ 减小单调下降，能量弛豫随之被抑制；
$eta > 0$ 时，耦合起初随 $eta$ 增大而增强，电荷噪声敏感性上升；
可一到临界点 $eta_c$，横向耦合骤然跌到远低于 $eta < 0$ 区间的水平，
电荷噪声敏感性随即被急剧压下去。

这一现象要从本征态的宇称来看。算符 $hat(N) = -i partial_phi$ 是奇宇称算符。
当 $eta < eta_c$ 时，基态与第一激发态宇称相反 [见 @fig-one(c) 及补充材料 @SM]，
$cal(N)_ "DC"^Q$ 由两态之间电荷算符的矩阵元决定，大小取决于波函数的空间重叠。
$eta < 0$ 时重叠很小 [@fig-three(d)]，故 $cal(N)_ "DC"^Q$ 很小；
$0 < eta < eta_c$ 时重叠增大，$cal(N)_ "DC"^Q$ 也跟着增大。
到了 $eta > eta_c$ 区间，基态与第一激发态宇称相同 [见 @fig-one(e)]，
而库珀对数算符 $hat(N)$ 是奇宇称，宇称选择定则于是强制
$| ⟨psi_0 |hat(N)| psi_1 ⟩ |^2 = 0$，
电荷噪声诱导的衰减被完全关掉。
随 $E_J / E_C$ 增大，临界值 $eta_c$ 会往更大的方向挪
[见 @fig-three(c) 与补充材料 @SM]。
也就是说，只要有双库珀对隧穿在，量子比特不必深入 transmon 区间，
就能既留下可观的非谐性，又把电荷噪声敏感性彻底清零。

低频电荷噪声引起纯退相位，其率为 @SM @2019KrantzP2131821318 @2021RasmussenP4020440204 @2001MakhlinP357400
$ Gamma _ "DP"^Q = 1/ℏ^2 dot 64 E_C^2 cal(N)_ "DP"^Q S_Q(0), $ <eq-gamma-dp>
这里 $S_Q(0)$ 为零频电荷噪声谱密度，纵向电荷噪声耦合强度定义为
$cal(N)_ "DP"^Q = | ⟨psi_0 |hat(N)| psi_0 ⟩ - ⟨psi_1 |hat(N)| psi_1 ⟩ |^2$。
同样由宇称可以断定 $⟨psi_i |hat(N)| psi_i ⟩ = 0$ 恒成立，
所以低频电荷噪声的一阶纯退相位也被宇称保护完全挡掉。

= 磁通可调的交替磁体超导量子比特

要让量子比特能用磁通调，可以把两颗全同的 AMJJ 接成对称 SQUID。
对应哈密顿量为
$ hat(H) _ "FTr" = 4 E_C (hat(N) - N_g)^2 + cal(U)_ "JJ"^"eff", $ <eq-hftr>
其中有效约瑟夫森势由 @SM 给出：
$ cal(U)_ "JJ"^"eff" = E_J [ -2 cal(I)_1 cal(U)(phi_ "ext" / 2) cos(phi) - cal(I)_2 cal(U)(phi_ "ext") cos(2 phi) ] $ <eq-ueff>
这里 $cal(U)(x) = | cos(x) |$。
$cal(U)_ "JJ"^"eff"$ 本身就说明了问题：改外磁通 $phi_ "ext"$，势形就能在余弦型与非余弦型之间切换。
换成只含一次谐波 $cal(I)_1$ 的常规约瑟夫森结，磁通怎么加都改不了势形。
势能可调，量子比特的频率与非谐性便都可控，如 @fig-four(a)、(b) 所示。

#figure(
  image("Fig4.pdf", width: 66%),
  caption: [
    (a) 量子比特跃迁频率、(b) 非谐性、(c) 横向电荷噪声耦合强度 $cal(N)_ "DC"^Q$、
    (d) 纵向磁通噪声耦合强度 $cal(N)_ "DP"^"Flux"$ 随外磁通 $phi_ "ext"$ 与比值 $eta$ 的变化。
    固定参数为 $E_J / E_C = 50$、$N_g = 0$。
  ],
) <fig-four>

接着看磁通控制下的相干性。仍只考虑高频电荷噪声引起的能量弛豫，
弛豫率由 @eq-gamma-dc 给出。
@fig-four(c) 显示，$|eta|$ 越大电荷噪声越受抑制，与前面的讨论一致；
而完全抑制所需的临界值 $eta_c$ 本身也能由 $phi_ "ext"$ 来调。
若把量子比特偏置在半磁通点 $Phi_ "ext" / Phi_0 = ± 1/2$，
$eta_c$ 会被推到接近 $0$——换言之，只要 $|eta| != 0$，电荷噪声就一律受抑制。
道理在于该工作点上 SQUID 干涉把一次谐波完全抵消，
有效约瑟夫森势改由二次谐波主导：$cal(U)_ "JJ"^"eff" prop cos(2 phi)$。

磁通可调性的另一面，是 SQUID 结构把量子比特暴露给磁通噪声——它引起跃迁频率涨落，造成纯退相位。
磁通噪声诱导的纯退相位率可写作 @SM @2019KrantzP2131821318 @2021RasmussenP4020440204 @2001MakhlinP357400
$ Gamma _ "DP"^"Flux" = 1/ℏ^2 dot E_J^2 cal(N)_ "DP"^"Flux" S_ "Flux"(0), $ <eq-flux>
其中 $cal(N)_ "DP"^"Flux"$ 为对磁通噪声的纵向耦合强度 @ScrNDPFlux，$S_ "Flux"(0)$ 为零频磁通噪声谱密度。
@fig-four(d) 显示，高次谐波确实会把磁通可调量子比特的磁通噪声敏感性抬高一些；
但把偏置点选在 $phi_ "ext" = 0, ± pi, ± 2 pi$ 附近就能缓解，
而在 $phi_ "ext" = ± 2 pi$ 处，$cal(N)_ "DP"^"Flux"$ 已低到可以忽略。

= 结论

本文先弄清 AMJJ 的微观结构参数怎样决定约瑟夫森势，再借助逆向设计，从指定的 CPR 反推出器件参数。
在此基础上，我们考察以单、双库珀对隧穿为主的 AMJJ，提出一类类 transmon 量子比特，并证明：
双库珀对隧穿的贡献越大，电荷噪声诱导的衰减越弱；
到了 $2phi$ 结，靠本征态的宇称就能把电荷噪声完全关掉。
加上 SQUID 结构后，量子比特便可由磁通控制。
高阶过程确实抬高了磁通噪声敏感性，但把偏置点选在特定位置即可缓解。
AMJJ 建立在 $s$ 波超导体之上，准粒子噪声天然较小，也与现有制备工艺接得上。
这些结果说明 AMJJ 足以充当可编程的约瑟夫森势平台：
大非谐、长相干与强可调，可以一并去求。

#align(left)[#text(style: "italic")[附注：] 本工作完成之际，我们注意到相关的独立研究 @2026BratlandTjernshaugenP @2026GuoP。]

#v(1em)
#block(width: 100%, fill: none)[
  #set par(first-line-indent: 0em)
  #text(size: 9pt)[#text(style: "italic")[致谢]
  X. F. Pan 受国家自然科学基金（批准号 12604548、124B2091）、中央高校基本科研业务费（xzy012026058）
  以及中国博士后科学基金（2026M793735）资助。
  P. B. Li 受国家自然科学基金（W2411002、12375018）资助。
  X. L. Hei 受国家自然科学基金（12505029）、教育部中央高校基本科研业务费（xzy012025077）
  及中国博士后科学基金（2025M773347）资助。
  F. Nori 部分受日本科学技术振兴机构（JST）资助（CREST 量子前沿项目 JPMJCR24I2、
  量子飞跃旗舰计划（Q-LEAP）、月舟研发计划 JPMJMS256E 及 ASPIRE 计划 JPMJAP2513）。]
]

#pagebreak()
#bibliography("refs.bib", style: "american-physics-society", title: [参考文献])
