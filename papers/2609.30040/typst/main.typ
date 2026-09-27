// 带二次谱相的超宽带光脉冲（一）：时域波形
// arXiv:2609.30040 中文译本
//
// 原文：optica-article 单栏模板，BibTeX（opticajnl.bst，数字引用），10 页；
//   四节正文 + 版权告示，编号公式 (1)(2)(3a)(3b)(4)(5)(6)，图 1–4，参考文献 17 条。
// 图片处理：四幅图全部取自源包 PNG，均为数值曲线与 Wigner-Ville 分布热图（计算结果图，
//   不是示意图），重画只会把可读的原始数据换成一套对不上的坐标，故保留原图、只译图注。
//   记为范围决定：本篇没有适合用 CeTZ 重画的示意图。
// 术语：spectral phase = 谱相位；absolute phase = 绝对相位；chirp = 啁啾；
//   slowly varying envelope approximation = 包络缓变近似；quasi-monochromatic = 准单色；
//   mode-locked = 锁模；Q-switching = 调 Q；chirped-pulse amplification = 啁啾脉冲放大（CPA）；
//   optical rectification = 光整流；photoconductive antenna = 光电导天线；
//   Wigner-Ville distribution = Wigner-Ville 分布（WVD）；Faddeeva function = Faddeeva 函数；
//   Dawson's integral = Dawson 积分；analytic signal = 解析信号；
//   holomorphic Fourier transform = 全纯傅里叶变换；transform-limited = 变换极限；
//   power-law prefactor = 幂律前置因子；high-harmonic generation = 高次谐波产生；
//   quiver motion = 颤动；intrinsic chirp = 内禀啁啾；shear = 剪切。
// 章节编号手写进标题文本，交叉引用在正文里写"第 2.1 节"；图、公式一律走 @label。

#set document(title: "带二次谱相的超宽带光脉冲（一）：时域波形")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set figure(numbering: "1", supplement: [图])
#set math.equation(numbering: none, supplement: [式])

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

#show figure.caption: set text(size: 8.5pt)
#show figure.caption: set par(first-line-indent: 0em)
#show figure: set block(below: 1em)

// ---------------------------------------------------------------- 标题与作者

#align(center)[
  #text(size: 13pt, weight: "bold")[带二次谱相的超宽带光脉冲（一）：时域波形]\
  #v(0.6em)
  #text(size: 10pt)[George A. Hine\*\
  #v(0.2em)
  美国橡树岭国家实验室 研究加速器部\
  #v(0.3em)
  #text(size: 8.5pt)[\* 通讯作者：hinega\@ornl.gov]
  ]
]

#v(0.9em)

#block(
  width: 100%,
  inset: (x: 1.5em, y: 1.1em),
  radius: 2pt,
  stroke: 0.6pt + gray,
  fill: rgb("#fafafa"),
)[
  #par(first-line-indent: 0em)[#text(weight: "bold")[摘要]]
  #par(first-line-indent: 0em)[
    本文给出超宽带光脉冲的一种时域表示，啁啾、展宽与绝对相位都包含在内。做法是对一类含至二阶谱相位的谱作全纯傅里叶变换，结果落在 Faddeeva 函数 $w(zeta)$ 的各阶导数上。在把脉冲实部对应到物理量之后，文中逐项考察了波形。导数阶数 $eta$ 决定相对谱宽；绝对相位决定 $w(zeta)$ 里局域化较强（高斯衰减）与较弱（代数衰减）的两部分按多大比例混合；二阶谱相位对应线性色散，并且被证明会把脉冲的 Wigner-Ville 分布整体剪切，形态与准单色情形下的线性啁啾相仿——它与 $eta$ 一起决定脉冲长度和振荡周期数。$eta$ 很大时可以导出与包络缓变近似之间的对应关系，只是代数衰减依然保留。
  ]
]

#v(0.8em)

// ---------------------------------------------------------------- 1 引言

= 1　引言

脉冲越短，谱就越宽，这两件事天然对立：时域上越局域，频域上就越铺开，反过来也一样。Maiman 用闪光灯泵浦红宝石激光器做实验，本意是证明发射谱能够收窄 @maiman-nature-1960，可这个实验反倒成了短脉冲激光技术的起点——脉宽由闪光灯的放电时长决定，落在毫秒量级——此后对宽带相干光源的追求也由它引出。缩短脉冲的推进很快真正开始：McClung 与 Hellwarth 演示了调 Q @mcclung-hellwarth-joap-1962，把脉宽压到几十纳秒，一支独立的发展线索由此展开，单色性也被抛在了身后。

起初，单色模型足以描述脉冲激光与连续激光的传播。举例来说，要描述调 Q Nd:YAG 激光器那类脉宽几纳秒、波长约 1 微米的脉冲在焦点附近的传播，单色高斯光学就够了。确实需要处理包络时，只要在时域上乘一个缓变因子，它可与载波分离。但这条路线成立的前提，是带宽始终远小于某个中心频率（特征频率）。脉宽不断缩短、最终逼近几个激光周期之后，完全单色的处理就必须按微扰方式扩张，才能容纳不断增大的带宽。这类方法处理谱相位的变化，能够有效地描述脉冲在色散介质中的展宽与啁啾，也能描述色散光学元件带来的横向与角向空间啁啾。

锁模激光振荡器把谱相位和有限带宽都算了进去，输出脉冲比腔往返时间还短，把红外激光从最初的几纳秒量级 @hargrove-pollack-apl-1964 一路推进到今天已能商品化的飞秒激光。这类腔里要放棱镜对一类的元件，用来补偿腔内光程随频率的变化；否则脉冲会被拉长、产生啁啾，锁模机制本身都可能维持不住。在微扰模型里，这一效应由脉冲的二阶谱相位承担。同样，用啁啾脉冲放大（CPA）@strickland-mourou-optcom-1985 @pessot-harter-ol-1989 放大这类脉冲，也要仔细管理谱相位，才能得到强度很高的超短脉冲。到了这一带宽乃至更高，谱相位对脉冲时域形状的描述就越来越关键。

如今，非线性过程能带来更大的相对带宽：谱展宽 @spokoyny-harel-ol-2015；激光尾波场加速中自注入引起的破波辐射 @miao-milchberg-pre-2018；气体与固体里的高次谐波产生 @thorpe-brabec-prr-2025；以及靠光整流、光电导天线或气体中双频混频产生的太赫兹脉冲 @song-li-apr-2026 @pigeon-fraula-natcom-2026。受限于当时的算力，Brabec 与 Krausz 把包络缓变近似推广开去，用来建模逼近单周期的脉冲如何传播，这一推广影响深远 @brabec-krausz-prl-1997。

相对带宽再往上走，微扰式的准单色方法就会超出自身的适用根基，需要一个内禀宽带的理论。面向任意谱的这类建模已在时空耦合的框架下被讨论过 @caron-potvliege-jomo-1999 @porras-josab-1999，并得到实验佐证 @lin-zhang-pra-2010 @hine-doleans-pra-2021。这类时空耦合行为由谱上至二阶的横向相位与振幅变化所支配。本文把这类超宽带理论再推进一步：给定一种具体的谱形式，直接导出显式含至二阶*谱*相位的时域表达式，然后逐项考察它的性质。

// ---------------------------------------------------------------- 2 傅里叶变换对

= 2　构造超宽带脉冲的傅里叶变换对

== 2.1　频域构造

要在大带宽极限下为光脉冲建模，就得先构造超宽带谱，再把它变换到时域，全程不使用载波加包络的近似。谱相位 $phi(omega)$ 用泰勒级数展开到二阶、展开中心取在直流（DC），并为常数项、一阶导数项与二阶导数项分别引入无量纲系数 $phi_0 = phi(0)$、$phi_1 = phi'(0)/tau$、$phi_2 = phi''(0)/tau^2$，于是 $phi(omega) approx phi_0 + phi_1 tau omega + 0.5 phi_2 (tau omega)^2$。为容纳这一项，把时域信号写成某个复信号 $a(t)$ 的实部。既然要求 $a(t)$ 解析，振幅谱 $A(omega)$ 就只能落在正频率上，而谱相位只需乘一个 $e^(-i phi(omega))$ 因子便可加进去。

我们用一个以 DC 为中心的高斯函数来构造这样的正频率谱——这样二阶相位就能与高斯带宽合并处理，剩下的一次相位与常数相位在变换到时域时很容易对付。传播波的谱在 DC 处应当趋于 $0$，因此再乘一个幂律前置因子。给出的谱取平方归一化形式，即 $integral_0^infinity dif omega abs(A)^2 = 1/tau$：

#eqn("(1)")[
  $
    A _eta(omega) = 2 U(tau omega)
    sqrt(frac(eta^(eta + 1/2), 2 Gamma(eta + 1/2)))
    (tau omega)^eta
    e^(-frac(eta, 2) (tau omega)^2)
    e^(-i phi(omega))
  $
]

式中 $omega$ 为角频率；正整数 $eta$ 是幂律的阶数；$1/tau$ 是谱的峰值频率。

这种谱形式有物理依据。它既可以由脉冲产生机制直接给出，也可以是任何一个在 DC 附近表现为整数幂律、又经过某种滤波而在高频段呈高斯型拖尾的有界谱化归所得。本文以太赫兹波段为例说明这类脉冲的来历。太赫兹脉冲可以少到只有一个振荡周期，更重要的是它已能用相干测量方法常规地测出来，连电场的振荡都能分辨。因此它很适合充当研究超宽带现象的模型体系。

谱之所以取式 (1) 的形式，有两条来路。第一条是光整流：红外泵浦脉冲的时间包络若是高斯型，它驱动的准静态极化就有一个以 DC 为中心的高斯谱，于是追随这一瞬态极化的偶极辐射，其振幅正具有式 (1) 的形状，此时 $eta = 2$、$phi = pi / 2$。高斯泵浦包络之所以能给出高斯极化谱，是因为非线性响应相对泵浦脉冲的演化必须近乎瞬时，铌酸锂与有机晶体中的光整流正是如此。若不然，极化的时间演化就要与介质的响应函数卷积，极化谱便部分乃至完全变成响应函数的形状。比如光电导天线产生的太赫兹脉冲，其高频段就是衰减指数型拖尾，超宽带模型常拿它当例子 @caron-potvliege-jomo-1999 @porras-josab-1999。偶极辐射机制与传播机制同源，所以那些模型同样带一个幂律前置因子（在产生端依然是 $eta = 2$）。

再看阻尼 Lorentz 振子模型的低频极限，从中可以看出第二条来路：复折射率 $tilde(n) = n + i kappa$ 的最低两阶，实部是常数 $n = n_0$，虚部正比于 $omega$。于是吸收系数 $alpha = 2 kappa omega / c$ 随 $omega$ 二次增长，构成一个把高频成分不断侵蚀成高斯形状的滤波器（例如见 @wu-kartner-opex-2015）。既然低频端本来就是幂律，这类脉冲最终都会收敛到式 (1) 的谱形。

== 2.2　时域表示

时域表示可由逆傅里叶变换算出，$a(t) = cal(F)^(-1) {A(omega)}(t) = 1 / (2 pi) integral_(-infinity)^infinity dif omega e^(i omega t) A(omega)$。先引出复时间常数 $tilde(tau)_2 = tau sqrt(eta + i phi_2)$，再靠解析延拓把自变量铺到整个复平面，全纯傅里叶变换就给出

#eqn("(2)")[
  $
    a(t) = - sqrt(frac(sqrt(eta), Gamma(eta + 1/2)))
    lr(frac(-i tau, sqrt(2) tilde(tau)_2) )^(eta + 1)
    e^(-i phi_0)
    w^("("eta")") lr(frac(tau, sqrt(2) tilde(tau)_2) (t / tau - phi_1) )
  $
]

其中 $zeta$ 为复变量，$w^("("eta")")(zeta)$ 是 Faddeeva 函数 $w(zeta) = e^(-zeta^2) + i 2 / sqrt(pi) dot "daw"(zeta)$ 的 $eta$ 阶导数；这里的 Dawson 积分 $"daw"(zeta) = e^(-zeta^2) integral_0^zeta e^(s^2) dif s$ 正是高斯函数的调和共轭。$w(t)$ 的实部与虚部画在 @fig-abs-phase 的 (a) 中。

#figure(
  placement: top,
  image("fig/Absolute_Phase_Figure.png", width: 7.2cm),
  caption: [绝对相位对 $w(zeta)$ 各阶导数的影响。（a）实变量 $x$ 下 $w(x)$ 的实部与虚部：实部是高度局域的高斯函数（黑色实线），虚部是局域性较差的 Dawson 积分（红色虚线）。（b）$eta = 2$ 时 $a_2(t)$ 的实部在五个绝对相位取值下的形状，$phi_0 = -pi/2, -pi/4, 0, pi/4, pi/2$，由色标区分。$phi_0$ 同时决定电场峰与零点的位置——脉冲在类正弦与类余弦两种形状之间移动——也决定 $a_eta(t)$ 中高斯型部分与 Dawson 型部分的混合程度。],
) <fig-abs-phase>

$w(zeta)$ 与复互补误差函数相干，$w(zeta) = "erfcx"(-i zeta) = e^(-zeta^2) "erfc"(-i zeta)$，因而也与合流超几何函数相干，$w(zeta) = e^(-zeta^2) (1 + #h(0em)_1 F _1 (1/2; 3/2; zeta^2))$。它的各阶导数可由递推关系算出 @Hand-Math-Func-1964：

#eqn("(3a)")[ $ w'(zeta) = -2 zeta w(zeta) + 2i / sqrt(2) $ ]
#eqn("(3b)")[ $ w^("("eta")")(zeta) = - lr( 2 zeta w^("("eta"−"1")") + 2 (eta + 1) w^("("eta"−"2")") ) $ ]

#note[式 (3a) 的常数项原文写作 $2i / sqrt(2)$；按 $w(zeta)$ 的定义直接求导，此处应为 $2i / sqrt(pi)$。式 (3b) 的系数原文写作 $2 (eta + 1)$；对式 (3a) 逐次求导所得的递推，此处应为 $2 (eta - 1)$。译文按原样排印，特此说明。]

与式 (1) 一样，式 (2) 也是无量纲且平方归一的：$integral_(-infinity)^infinity dif t abs(a)^2 = tau$。它与（实值）物理量的对应关系是取两遍实部，例如电场 $E(t) = E_0 (a(t) + a^*(t))$，其中 $E_0$ 是场幅的标度。

$w(t)$ 在 $|t|$ 很大时——也就是脉冲中心之前与之后的远翼——趋于零的速度很慢，近似于 $1 / t$ 的反比关系。原因在于谱中 $U(tau omega) e^(-eta/2 (tau omega)^2)$ 这一项在 DC 处不连续。$eta$ 阶的幂律前置因子消去了这一不连续，却把它留在谱的 $(eta + 1)$ 阶导数上，所以远翼仍是代数衰减，按 $|t|^(-(eta+1))$ 趋于零。这一行为完全包含在 Dawson 积分的各阶导数（$a(t)$ 的"Dawson 型"部分）里；高斯函数的各阶导数（"高斯型"部分）则高度局域。对实值波形而言，一个直接后果是：绝对相位因子会显著改变脉冲远翼的量级。取解析信号的实部得到物理波形时，绝对相位最终决定高斯函数与 Dawson 积分按什么比例混合，也就决定代数衰减处在什么量级。下一节把若干脉冲算出来，逐项考察谱相位对这些性质以及其他性质的影响。

// ---------------------------------------------------------------- 3 考察

= 3　逐项考察

下面考察谱相位各项与阶数 $eta$ 对 $a(t)$ 实部的影响，并与准单色情形对照，指出相同与不同之处。

先看阶数 $eta$。它决定脉冲谱的相对宽度，$eta$ 越大谱越窄。由于改变 $eta$ 不改变 $A_eta(omega)$ 的峰值频率，$a_eta(t)$ 内部振荡的尺度也就固定下来。因此变换极限脉宽 $Delta T$ 随脉冲内振荡周期数增长，并与阶数近似满足 $Delta T / tau approx N_"total" approx sqrt(eta)$。@fig-order 给出从单周期（$N_"total" = 1$）到多周期（$N_"total" = 10$）的演化，由式 (2) 算出，插图是对应的谱形。不同阶数的脉冲各自对应不同的物理量或场景：$eta = 2$ 就是第 2 节所述最简单的光整流所产生的太赫兹脉冲的电场；同一太赫兹脉冲的矢势（亦即带电粒子在其中所做的颤动）对应 $eta = 1$；阶数再大就更像常规超短激光脉冲（$eta = 100$），或者是经频率下变换、或经其他谱展宽与压缩得到的脉冲（$eta = 9$）。

#figure(
  placement: top,
  image("fig/Order_Figure.png", width: 7.2cm),
  caption: [不同阶数下的脉冲与谱（(a)、(b)、(c)、(d) 依次对应 $eta = 1, 2, 9, 100$），按式 (1) 与式 (2) 计算。(b) 可以表示红外脉冲经光整流产生的太赫兹脉冲的电场，该红外脉冲包络为高斯型；(a) 则描述同一脉冲的矢势。(c) 与 (d) 是更大的阶数，对应商品化 Ti:Sapphire 振荡器里的准单色超短脉冲，或者非线性谱展宽、频率下变换所得的脉冲。插图给出式 (1) 的正频率谱在区间 $omega = [0, pi omega_0]$ 上的形状，各谱共有同一峰值频率 $omega_0 = 1 / tau$。$a_eta$ 的实部与虚部分别用黑色实线与红色虚线表示；(d) 的虚部为清晰起见略去，另以灰色圆点叠出准单色极限（式 (6)）的对应曲线。],
) <fig-order>

其次看谱相位的常数项与一次项，它们在脉冲的时域表示里的作用方式与单色处理完全相同。一次项只是把脉冲形状整体平移 $t -> t - phi_1 tau$，常数项留在前置因子里，构成绝对相位。@fig-abs-phase 的 (b) 画出 $a_2(t)$ 实部的呈现方式随 $phi_0$ 的变化。与包络近似里的图像相仿，调节绝对相位会让脉冲的内部结构（峰、谷与零点）在偶形（类余弦）与奇形（类正弦）之间推进，具体取决于 $a_2(t)$ 中高斯型与 Dawson 型两部分的相对贡献。区别在于，这里约束内部振荡的是 $abs(a_eta(t))$ 本身，而不是另行设定的一个包络函数。
Dawson 型与高斯型两部分的衰减性质差别太大，因此绝对相位对脉冲边缘的量级影响很显著——代数衰减在什么水平上"开启"，正由它决定。代数衰减的阶数由 $eta$ 决定：$eta$ 越大，Dawson 型部分衰减得越快。$eta$ 固然可以任意大，但只要它有限，这一效应就不会消失。于是，尽管可以把相位调到压低 Dawson 型贡献，在某个有限距离之外它终究会盖过高斯型部分。唯一的例外是精确情形 $phi_0 = m pi$（$m$ 为整数）。在这一带附近，若绝对相位偏离一个很小的 $delta phi$，Dawson 型部分开始占优的窗口由下式给出：

#eqn("(4)")[
  $
    plus.minus t _"c"eta = sqrt(
      W _(-1) lr(
        - frac(2, 1 + 2 eta) frac(eta !, sqrt(pi) 2^eta)
        lr( "arctan"(2 pi delta phi) )^(frac(2, 1 + 2 eta))
      )
    )
  $
]

其中 $W _(-1)$ 是 Lambert W 函数的下分支。高斯部分衰减得太快，把 $delta phi$ 缩小若干个数量级，$t _"c"eta$ 也不过增大 $tau$ 的几倍。又因为高斯型与 Dawson 型部分宇称相反，$t _"c"eta$ 同时标出了脉冲边缘上一个零点的位置。正是这个零点在两类脉冲之间做了过渡：纯高斯型脉冲有 $eta$ 个零点，纯 Dawson 型脉冲有 $eta + 1$ 个；当相位把脉冲推过高斯型构型时，一个零点被推向负（正）无穷，另一个同时从正（负）无穷返回。@fig-localization 画出在 $phi = 0$ 附近两部分的相对贡献，以及 $t _"c"eta$ 的位置。

#figure(
  placement: top,
  image("fig/Localization_Figure.png", width: 7.2cm),
  caption: [局域化程度的混合。对数坐标下 $eta = 2$ 的 $abs("Re"(a_eta(t)))$（黑色实线）显示，$a_eta$ 中 Dawson 型部分（红色虚线）对脉冲的贡献终究会盖过高斯型部分（黑色点划线），即使绝对相位只偏离 $0$ 一点点。这就是说，形状上近乎高斯型的脉冲，其外围仍因 Dawson 型部分而呈现代数衰减。灰色竖线标出代数衰减压过高斯衰减的窗口边界，可见即使相位偏离极小，窗口也只有 $tau$ 的几倍宽。由于 Dawson 型部分与高斯型部分宇称相反，窗口的一侧必然伴着一个零点。],
) <fig-localization>

最后是二阶谱相位，它同时带来几种效应。它不再拆成包络展宽与频率啁啾两项，而是与脉冲阶数一起合并进修正后的复时间常数 $tilde(tau)_2$，于是既产生啁啾（$phi_2 > 0$ 为正啁啾，$phi_2 < 0$ 为负啁啾），又拉长脉冲。又因为谱相位是相对 DC（而非准单色情形里的 $omega_0$）定义的，$phi_2$ 还额外引入一个量级约为 $t_2 tilde.eq phi_2 tau$ 的延迟。@fig-chirp 给出不同二阶相位量值下的这些效应。

#figure(
  placement: top,
  image("fig/Chirp_Figure.png", width: 7.2cm),
  caption: [二阶谱相位对 $eta = 2$ 时 $a_eta$ 的影响。$a_eta(t)$ 的实部与虚部分别用黑色实线与红色虚线表示，下方是 WVD，显示脉冲内部的局域频率成分。变换极限脉冲（a）带有内禀的对称啁啾，高频成分更集中在脉冲中心。加上 $phi_2 = pi$ 的二阶谱相位（b）之后，脉冲中心被延迟，WVD 开始显出不对称。到 $phi_2 = 4 pi$（c），可以看到明显的展宽与啁啾。（d）把二阶相位的符号反转（$phi_2 = -4 pi$），啁啾方向与延迟方向同时反转。二阶相位虽在 WVD 上造成线性剪切，却不能说啁啾是线性的，因为脉冲的低频区域仍保有相当大的相对带宽。],
) <fig-chirp>

准单色情形里，二阶相位对应线性啁啾（载波频率随时间线性变化）。超宽带情形下这件事复杂化了，因为脉冲本身带有内禀啁啾——脉冲内部的频率分布天然就不均匀。这一现象已被实验观测到 @lin-zhang-pra-2010，在时空耦合情形下也更普遍地被观测到 @hine-doleans-pra-2021。这就是说，当一个变换极限脉冲被啁啾化时，脉冲不同部位的频率成分仍然彼此重叠。为处理这一点，我们把"线性啁啾"的概念推广为 Wigner-Ville 分布（WVD）上的一次线性剪切；@fig-chirp 就在相应脉冲下方画出了 WVD。
$eta$ 很大的极限下，可以与准单色模型对照：取谱形式的极限，它趋于一个以 $omega_0 = 1 / tau$ 为中心、带宽为 $Delta omega = sqrt(2) / (tau sqrt(eta))$ 的高斯。对这一极限施加包络缓变近似，得到

#eqn("(5)")[
  $
    A _eta(omega) tilde.eq sqrt(2 tau)
    lr( frac(eta, 2 pi) )^(1/4)
    e^(-frac((tau omega - 1)^2, 1/eta))
    e^(-i (psi_0 + psi_1 (tau omega - 1) + 1/2 psi_2 (tau omega - 1)^2))
  $
]
#eqn("(6)")[
  $
    a _eta(t) tilde.eq frac(2, pi sqrt(tau))
    sqrt(frac(sqrt(eta), eta + i psi_2 / 2))
    e^(-i (psi_0 - psi_1))
    e^(i (1 + frac(1, 2) frac(psi_2, 4 eta^2 + i psi_2^2) (t / tau - psi_1)) (t / tau - psi_1))
    e^(-eta frac((t / tau - psi_1)^2, 4 eta^2 + i psi_2^2))
  $
]

这里谱相位改以频移量 $(omega tau - 1)$ 为参考重新定义，于是 $psi_0 = phi_0 + phi_1 + phi_2 / 2$、$psi_1 = phi_1 + phi_2$、$psi_2 = phi_2$。

// ---------------------------------------------------------------- 4 结论

= 4　结论

本文给出一族光脉冲 $a_eta(t)$ 的一种新的时域形式，它容纳的是超出包络近似适用范围的超宽带谱。这一形式来自全纯傅里叶变换：谱由一个幂律因子与一个高斯函数相乘，再带上二次谱相位，全程不作载波与包络的分离近似。文中说明了这类谱在太赫兹脉冲光整流产生中的来历，也对应介质 Lorentz 振子模型的低频行为；随着脉冲周期数持续减少的趋势延续下去，它对脉冲激光的未来应有用武之地。

周期数较多、带宽有限的脉冲与超宽带极限之间的连续性，由谱幂律项的阶数 $eta$ 承担：没有二阶谱相位项时，$eta$ 直接决定脉冲的周期数。变换到时域，$eta$ 就是 Faddeeva 函数 $w(zeta)$ 的导数阶数。

在脉冲中心附近，$a_eta(t)$ 的实部对绝对相位的依赖与窄带情形一致——它移动包络 $abs(a_eta)(t)$ 内部波峰、波谷与零点的位置。在脉冲远翼，绝对相位决定 $w(zeta)$ 中强局域（高斯衰减）与弱局域（代数衰减）两部分的混合，这一点是内禀窄带模型给不出的。代数衰减的阶数随 $eta$ 增大到 $eta + 1$，但只要 $eta$ 有限代数拖尾就存在，也就注定终会盖过高斯拖尾。

二阶谱相位项与阶数、峰值频率显式地合并进复时间常数 $tilde(tau)_2$，脉冲的展宽与啁啾都由它负责。由于超宽带脉冲带内禀啁啾，无法指认出一个"线性啁啾"项；改看脉冲的 Wigner-Ville 分布，能在 $f$–$t$ 面上看到一个*线性剪切*。

把二次谱相位显式引入超宽带脉冲形式，让我们能在时域里分析线性色散对这类脉冲的影响，相位速度、能量流这些局域行为都可据此研究。这类脉冲在真空与介质中的传播，将在第二部分详细给出。

= 5　版权告示

本手稿由 UT-Battelle, LLC 在美国能源部（DOE）DE-AC05-00OR22725 合同下完成。美国政府保留、且出版方在接收本文时确认美国政府保留一项非独占、免付费、不可撤销、全球范围的许可，用于美国政府目的出版或复制本手稿的出版形式，或授权他人如此做。DOE 将按《能源部公共获取计划》（https://www.energy.gov/doe-public-access-plan）公开提供这些联邦资助研究成果的获取途径。

// ---------------------------------------------------------------- 参考文献

#v(1em)
#bibliography("refs.bib", style: "ieee", title: [参考文献])
