// 本文件对应 main.tex 第 1045–1410 行：补充材料后半的三个 Supplementary Note。
// 按原文顺序编号为 5（Field-Assisted Leakage…）、6（Flat-Band Extraction…）、7（Effective Interface-Trap…），
// 编号 4（Quantum Capacitance）由另一片段负责；正文交叉引用一律写成纯文本“补充说明 N”。
// 编号公式用原文 \tag 实际值：S1–S18（S1 出现在第 6 节，不是从 S7 起）。
// 非常规处理：Typst 0.15 无 `varepsilon` 变量，`epsilon` 渲染为 ε（即 LaTeX \varepsilon），故全文用 epsilon；
// `\hbar` 写作 planck；`\infty` 写作 infinity；`\propto` 写作 prop；负指数一律 ^(-1)。
// Typst 0.15 的 #include 不继承宿主文件作用域（实测 unknown variable），故本片段自带 macros 导入。
#import "macros.typ": *

= 5. 场致泄漏、能带对齐与有效隧穿势垒

为了考察 TIHGS MIM 电容器中栅堆叠泄漏电流的场强依赖性，我们用电场辅助发射与隧穿几种作图方式来分析电流密度–电压特性，包括 Simmons 修正的 Schottky 发射、Poole–Frenkel 发射和 Fowler–Nordheim 隧穿（@fig-ed6 a–c） @simmons1965richardson @lenzlinger1969fowler @chiu2014conduction。电场按下式计算：

$ E = abs(V)/t _ ("BiF"_3) $

其中 $t _ ("BiF"_3)$ 是绝缘 #BiF 层的物理厚度。用于这一场强换算的介质厚度中，并不包含电学上导通的 #BiSe 区域。这样的处理假定：与高场输运相关的电压降主要落在绝缘的 #BiF 层上。界面处可能存在的额外电压降并未单独分辨出来，因而计入下文提取的有效输运参数。

在中等电场下，@fig-ed6 b 中的数据以 $ln (J/E)$ 对 $E^(1/2)$ 作图时大致呈线性，这与 Simmons 修正的 Schottky 和 Poole–Frenkel 描述一致 @simmons1965richardson @chiu2014conduction。相应的场致势垒降低系数为

$ beta _"S" = [q^3/(4 pi epsilon _0 epsilon _"r"(infinity))]^(1/2) $

上式对应 Schottky 型势垒降低；Poole–Frenkel 发射的系数则为

$ beta _"PF" = [q^3/(pi epsilon _0 epsilon _"r"(infinity))]^(1/2) = 2 beta _"S" $

式中 $q$ 为元电荷，$epsilon _0$ 为真空介电常数，$epsilon _"r"(infinity)$ 为介质的离子冻结高频相对介电常数。

Simmons 修正的 Schottky 与 Poole–Frenkel 两种作图分别给出 $epsilon _"r"(infinity) approx 4.99$ 和 $approx 4.89$，对应折射率 $n = sqrt(epsilon _"r"(infinity))$ 约为 2.23 和 2.21。这些数值与第一性原理算出的非晶 #BiF 的值（$epsilon _"r"(infinity) = 4.056$、$n = 2.014$）比较接近，从而在场相关输运响应与算得的电子极化率之间给出了一致性检验。

在更高电场下，Fowler–Nordheim（F–N）描述开始占主导 @lenzlinger1969fowler @chiu2014conduction。在通常的三角势垒近似下，F–N 电流密度可写成如下形式：

$ J _"FN" prop E^2 exp[-(4 sqrt(2 m _"t"^(*) ) Phi _"B,FN"^(3/2))/(3 q planck E)] $

其中 $m _"t"^(*)$ 是隧穿有效质量，$Phi _"B,FN"$ 是有效的电子注入势垒高度。在该式中，$Phi _"B,FN"$ 以焦耳为单位。对应的线性化形式为

$ ln(J/E^2) = A _"FN" - (4 sqrt(2 m _"t"^(*) ) Phi _"B,FN"^(3/2))/(3 q planck) (1/E) $

其中 $A _"FN"$ 包含与电场无关的前因子。

对于给定的 MIM 电容器，器件面积和 #BiF 层厚度都是固定的，且 $E = abs(V)/t _ ("BiF"_3)$，因此 @fig-ed6 c 中使用的等价电压域表达式为

$ ln(I/V^2) = A _"FN"^' - (4 t _ ("BiF"_3) sqrt(2 m _"t"^(*) ) Phi _"B,FN"^(3/2))/(3 q planck) (1/abs(V)) $

相应地，若在 $ln (I/V^2)$ 对 $1/abs(V)$ 的图中，$S _"FN"$ 表示高场线性区的斜率，则有效 F–N 势垒高度由下式得到：

$ Phi _"B,FN" = [(3 q planck abs(S _"FN"))/(4 t _ ("BiF"_3) sqrt(2 m _"t"^(*) ) )]^(2/3) $

由该式得到的量是以焦耳为单位的能量，需除以 $q$ 才能以电子伏特报告。

对 @fig-ed6 a–c 所分析的 Au/#BiF/#BiSe/Au/Ti TIHGS MIM 电容器，$t _ ("BiF"_3) approx 43 thin "nm"$。我们取 $m _"t"^(*) = 0.25 m _0$ 作为代表性的隧穿质量，它落在 #hk 介质文献报道的范围之内，其中 $m _0$ 为自由电子质量 @li2004selected。用高场线性区的斜率可得有效 F–N 势垒高度

$ Phi _"B,FN" approx 0.27 thin "eV" $

高场输运分析要与异相边界的平衡态微观电子结构区分开来。@fig-boundary c–e 显示，紧邻的 #aB/#cB 界面是打开带隙的，而一个经过重构、闭合带隙的、源自 #BiSe 的状态位于相邻的 #cB 界面下层五元层（QL）中；算得的偶极矩分布强烈局域在异相边界附近。这一局域偶极造成了界面电荷重新分布，但它本身并不决定重构态能量平移的大小。因此，异相体系的能带对齐一般不能简单写成孤立材料的电子亲和能与功函数的刚性对齐。

@fig-ed6 d 给出了镀 Au 之前以真空为参考的各组分能级对齐。采用算得的 #BiSe 功函数 $phi _ ("Bi"_2 "Se"_3) = 5.15 thin "eV"$ 和非晶 #BiF 的电子亲和能 $chi _ ("BiF"_3) = 4.3 thin "eV"$，可得 #BiSe 费米能级与 #BiF 导带参考之间约 0.85 eV 的标称间隔。这一数值只是真空能级参考下的构造，而不是精确的平衡态导带偏移，因为界面偶极、化学重构以及随之而来的能带弯曲都会改变局域静电势。因此，@fig-boundary d 中识别出的、源自 #BiSe 的重构界面下层特征被单独画出，位于 #EF 以下约 0.146 eV 处。

镀 Au 之后，整个接触体系内的电化学势达到平衡（@fig-ed6 e）。Au 的功函数 $phi _"Au" = 5.1 thin "eV"$ 与算得的 #BiSe 功函数只相差约 0.05 eV，而以真空为参考的 Au/#BiF 间隔约为 0.8 eV。这些量给出了接触态电容器的一个参考性能量次序，但并不意味着能以同样的精度独立确定局域异相偏移或金属/介质偏移。@fig-boundary e 中识别出的界面局域偶极，以及任何残余能带弯曲，都已隐含在接触态的对齐图像之中。

在用于 Fowler–Nordheim 分析的正高场条件下，#BiF 上的电势降使绝缘势垒发生倾斜，电子因此可以从电学上连通的残留 #BiSe 隧穿进入可及的 #BiF 导带态（@fig-ed6 f）。实验提取的 $Phi _"B,FN" approx 0.27 thin "eV"$ 因而指认为高场下 #BiSe 到 #BiF 的有效注入势垒。我们并不把它与简化的真空参考平衡间隔之差解释为对界面偶极或能带弯曲的直接测量；它反映的是一个化学与电子结构均经过重构的异相体系中经电场修饰的隧穿势垒。由于 $Phi _"B,FN" prop (m _"t"^(*) )^(-1/3)$，而 #BiF 特有的隧穿质量并未被独立测量，提取值仍然只是一个依赖模型的有效势垒，而非精确的平衡带偏移。

最后，Fowler–Nordheim 区出现在 #MoS 晶体管测量所用栅压窗口之外很远处，因此它并不代表晶体管正常工作时的主导输运过程。线性化后的 Schottky、Poole–Frenkel 和 Fowler–Nordheim 作图，也不是各种泄漏机制唯一的微观指纹 @chiu2014conduction。我们把这些分析用作场相关输运的自洽描述，并借此估计高场有效注入势垒，而不是把它们当作对平衡界面能带结构的独立测定。

= 6. 平带提取与半导体屏蔽

#set math.equation(numbering: "(S1)")

平带响应与半导体侧的屏蔽参数，是用 Au/Ag/Pt/#WSe/#BiF/#BiSe/Au/Ti 金属–绝缘体–半导体电容器（MISCAP）的频变电容–电压（$C$–$V$）特性分析的。在本节全部分析中，电容一律以单位面积值表示。

平带电压 $V _"FB"$ 由积累–耗尽转变确定，用的是从实测 $C$–$V$ 曲线二阶导数识别出的电容–电压拐点法 @winter2013new。之所以采用 10 kHz 的 $C$–$V$ 曲线，是因为对应的转变仍落在实验可及的低泄漏偏压窗口内。频率更高时，转变会移到超出测量范围的栅压处，而介质泄漏随之增大，平带条件就无法可靠确定。具有物理意义的平带电压取自 10 kHz 曲线上主积累–耗尽拐点的信息，即

$ ("d"^2 C _"m")/("d" V _"G"^2) |_(V_"G" = V_"FB") = 0 $ <eq-s1>

并且 $("d"^2 C _"m")/("d" V _"G"^2)$ 的符号在该点发生改变。这一分析给出

$ V _"FB" approx 0.58 thin "V" $ <eq-s2>

如 @fig-ed7 c 所示。平带条件下测得的 10 kHz 电容为

$ C _"FB" = C _"m"(V _"FB") = 2.34 times 10^(-7) thin "F cm"^(-2) $ <eq-s3>

我们用一套独立的图形一致性分析来确定 TIHGS 的有效电容。在独立确定的 $V _"FB"$ 处，考察两个无量纲函数

$ f _1 = 1/sqrt(((3 k _"B" T)/q) (1/C _"m") (("d" C _"m")/("d" V _"G"))) - 1 $ <eq-s4>

和

$ f _2 = C _"m"/(C _"g" - C _"m") $ <eq-s5>

其中 $k _"B"$ 为玻尔兹曼常数，$T$ 为绝对温度，$q$ 为元电荷，$C _"g"$ 为整个 TIHGS 的有效电容。改变 $C _"g"$ 的试探值，直到在独立确定的 $V _"FB"$ 处满足 $f _1 = f _2$（@fig-ed7 d）。由此得到的栅堆叠响应相当于

$ epsilon _"eff,TIHGS" approx 16 $ <eq-s6>

对 MISCAP 中约 43 nm 厚的转化 #BiF 层，这一有效相对介电常数给出

$ C _"g" = (epsilon _0 epsilon _"eff,TIHGS")/t _ ("BiF"_3) = 3.29 times 10^(-7) thin "F cm"^(-2) $ <eq-s7>

其中 $epsilon _0$ 为真空介电常数。与前面 TIHGS MIM 的分析一样，$epsilon _"eff,TIHGS"$ 是一个按 #BiF 厚度归一化的堆叠层级静电量，不应解读为 #BiF 的本征介电常数。$epsilon _"eff,TIHGS" approx 16$ 与 TIHGS MIM 电容器中独立观察到的有限边界响应相一致，因此不应把它当作电容或等效氧化物厚度（EOT）获得增强的证据。它在这里的作用，只是把从半导体侧响应中剥离数据所需的 TIHGS 有效电容参数化。

实测平带电容由 TIHGS 电容与半导体侧响应串联构成，因此半导体侧的有效平带电容由下式得到

$ 1/C _"FB" = 1/C _"g" + 1/C _("s,FB")^(*) $ <eq-s8>

解得

$ C _("s,FB")^(*) = ((1/C _"FB") - (1/C _"g"))^(-1) = 8.08 times 10^(-7) thin "F cm"^(-2) $ <eq-s9>

相应的有效屏蔽长度按下式估算

$ L _"D,eff" = (epsilon _0 epsilon _ (perp, "WSe"_2))/C _("s,FB")^(*) $ <eq-s10>

其中 $epsilon _ (perp, "WSe"_2)$ 是 #WSe 的面外相对介电常数。取 $T = 300 thin "K"$，并采用体相状 #WSe 薄片连续介质静电建模中常用的代表值 $epsilon _ (perp, "WSe"_2) = 4.2$ @yu2017photogenerated，得到

$ L _"D,eff" approx 4.60 thin "nm" $ <eq-s11>

对应的表观体积多子浓度由下式估算

$ N _"app" = (k _"B" T epsilon _0 epsilon _ (perp, "WSe"_2))/(q^2 L _"D,eff"^2) $ <eq-s12>

结果为

$ N _"app" approx 2.83 times 10^17 thin "cm"^(-3) $ <eq-s13>

由于平带响应是在 10 kHz 下评估的，在该频率上仍有电学响应的陷阱可以贡献到 $C _("s,FB")^(*)$ 之中。因此，$L _"D,eff"$ 和 $N _"app"$ 应理解为有效的低频屏蔽参数，而不是本征体相半导体量。不过，实测 #WSe 厚度 $t _ ("WSe"_2) = 37.37 thin "nm"$ 明显大于 $2 L _"D,eff" approx 9.20 thin "nm"$，这说明来自 #WSe 两个相对表面的静电扰动在整个半导体厚度上并未强烈重叠。

= 7. 有效界面态密度的提取及其局限

有效电学活性陷阱密度 $D _"it,eff"$ 由频变电容–电压特性提取，用的是高低频 Castagné–Vapaille 方法 @castagne1971interface @engelherbert2010interface。该方法利用电学活性的界面陷阱与近界面陷阱在频率响应上的差别，已被广泛用于从金属–绝缘体–半导体电容测量中估算陷阱密度；不过提取值可能依赖于所假定的半导体响应、测量频率窗口以及栅堆叠静电 @engelherbert2010interface。本节把 10 kHz 与 1 MHz 下测得的电容分别记作 $C _"LF"$ 和 $C _"HF"$，因此在这一频率区间内响应不同的陷阱都会进入实测的电容色散。

在本节全部分析中，电容一律以单位面积值表示。实测 MISCAP 电容由 TIHGS 静电元件与半导体侧响应串联而成。我们取 $C _"TIHGS" = 3.29 times 10^(-7) thin "F cm"^(-2)$，该值来自补充说明 6 中 10 kHz 的平带一致性分析。由于缺少独立分辨出的、随频率变化的 $C _"TIHGS"$，10 kHz 与 1 MHz 的剥离计算都沿用这一数值；因此残余的 TIHGS 色散都计入有效量 $D _"it,eff"$ 之内。半导体侧的有效电容按下式计算：

$ C _("s,LF")^(*) = ((1/C _"LF") - (1/C _"g"))^(-1) $ <eq-s14>

以及

$ C _("s,HF")^(*) = ((1/C _"HF") - (1/C _"g"))^(-1) $ <eq-s15>

其中 $C _"LF"$ 和 $C _"HF"$ 分别为 10 kHz 与 1 MHz 下测得的电容。

在常规的高低频近似中，低频半导体侧响应既包含半导体电荷调制，也包含在较低频率上仍能响应的陷阱贡献；而在较高频率下，相应的陷阱响应则减弱。因此定义随频率变化的过剩电容为

$ C _"it,eff" = C _("s,LF")^(*) - C _("s,HF")^(*) $ <eq-s16>

相应的有效电学活性陷阱密度为

$ D _"it,eff" = C _"it,eff"/q = (1/q) [((1/C _"LF") - (1/C _"g"))^(-1) - ((1/C _"HF") - (1/C _"g"))^(-1)] $ <eq-s17>

定量解释集中在随偏压变化的耗尽–积累转变上。几乎不随栅压变化的耗尽平台不在考虑之列，因为半导体电荷响应受 #WSe 有限厚度的限制。强积累区的数值同样不予采用，因为那里 $C _"LF"$ 逼近 $C _"g"$，半导体侧电容对很小的实验不确定度都变得十分敏感。在这一区间内（@fig-ed7 e），提取值的最小值为

$ D _"it,eff"^"min" approx 7.48 times 10^11 thin "cm"^(-2) thin "eV"^(-1) $ <eq-s18>

我们也在相同的栅压与频率范围内考察了并联电导响应 $G _"p"/omega$（@fig-ed7 b）。在可及的栅偏压范围内，没有观察到分辨良好、可用于常规电导法提取陷阱密度或特征时间常数的 $G _"p"/omega$ 峰值；更高的正栅压则因介质泄漏不断增大而无法施加（@fig-ed6 a）。因此我们不给出电导法的 $D _"it"$ 或陷阱时间常数。

高低频法把低频与高频电容之差归因于所选频率窗口内电学活性的陷阱相关色散。在 #WSe/TIHGS MISCAP 中，这一响应可能来自 #WSe/#BiF 界面、近界面陷阱或边界陷阱、残余的 TIHGS 色散、#WSe 的分布电阻、接触电阻、介质泄漏以及测量寄生参数。而且，10 kHz 并不是真正的准静态极限，弛豫明显更慢的陷阱根本未被采样。因此，提取到的 $D _"it,eff"$ 应当理解为实验频率窗口内的有效电学活性陷阱响应，而不是专属于 #WSe/#BiF 界面的唯一微观态密度；这与高低频界面陷阱提取方法已知的模型依赖性和频率依赖性相一致 @engelherbert2010interface。
