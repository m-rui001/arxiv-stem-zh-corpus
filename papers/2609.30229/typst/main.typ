// AgTaO₃ 的分子束外延 —— arXiv:2609.30229 中文翻译（Typst 版）
// 由 tex 源文件 Thisone.tex 人工翻译重排。图 1（RHEED 衍射花样）、图 2（XRD 谱与倒易空间图）、
// 图 3（HAADF-STEM 像）全部是实验数据图，无法用矢量图忠实重绘，故保留原 PDF。
// 原文三幅图均为 [p] 独立占页的排版，Typst 无浮动体，此处按引用位置就近放置。
// 原文图 2 的说明文字把最后两个分图误写成 "(b)" "(c)"，实际图板上标的是 (e) 与 (f)，译文已改正。
// 原文 \end{document} 之后还残留三段未参与排版的引言段落，译文单独收在文末"译者附注"里。

#set document(title: "AgTaO₃ 的分子束外延")
#set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm), numbering: "1")
#set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
#set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
#set heading(numbering: none)
#set figure(numbering: "1")

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

// 菱面/立方晶向的负号上划线
#let rbar3 = $"R" #h(-0.14em) overline(3) #h(-0.1em) "m"$

#align(center)[
  #text(size: 15pt, weight: "bold")[AgTaO₃ 的分子束外延]\
  #v(4pt)
  #text(size: 10pt)[
    Tobias Schwaigert #super[1,2]，
    Joshua Maile #super[3]，
    Olivia Peek #super[1,4]，
    Eric Biedke #super[3]，
    Paul T. Malinowski #super[4]，
    Kyle M. Shen #super[4,5]，
    Salva Salmani-Rezaie #super[3]，
    Darrell G. Schlom #super[1,2,6,7]，
    Kaveh Ahadi #super[3,8] \
    #v(2pt)
    #text(size: 8.5pt)[
      #super[1] 美国纽约州伊萨卡，康奈尔大学界面材料加速实现、分析与发现平台（PARADIM）\
      #super[2] 康奈尔大学材料科学与工程系\
      #super[3] 美国俄亥俄州哥伦布，俄亥俄州立大学材料科学与工程系\
      #super[4] 康奈尔大学物理系\
      #super[5] 康奈尔大学物理系原子与固体物理实验室（LASP）\
      #super[6] 康奈尔大学纳米科学 Kavli 研究所\
      #super[7] 德国柏林，莱布尼茨晶体生长研究所（IKJ）\
      #super[8] 俄亥俄州立大学电气与计算机工程系\
      通讯作者：#link("mailto:ahadi.4@osu.edu")[ahadi.4\@osu.edu]
    ]
  ]\
  #v(2pt)
  #text(size: 8.5pt, fill: gray.darken(30%))[arXiv:2609.30229 [cond-mat.mtrl-sci]；中文译本编译于 2026-09-27]
]

#v(8pt)
#block(width: 100%, inset: (x: 1.5em, y: 1.1em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #align(center)[#text(size: 10.5pt, weight: "bold")[摘要]]
  #text(size: 9pt)[
    我们报道首次用分子束外延（MBE）长出单晶 AgTaO₃ 薄膜。薄膜在 (001) 与 (111) 取向的 SrTiO₃ 衬底上生长，做法是银原子层与 TaO₂ 层交替逐层沉积，氧化剂为臭氧/氧气混合气（80% O₃ + 20% O₂）。X 射线衍射与倒易空间成像表明，薄膜与 SrTiO₃ 衬底保持共格应变，摇摆峰锐利程度与衬底相当，说明结构完整度很高。高角环形暗场扫描透射电镜（HAADF-STEM）证实 $(001) _"pc"$ 取向薄膜生长共格、缺陷稀少；$(111) _"pc"$ 取向薄膜最初的共格生长只能维持到约 10 nm，此后逐渐过渡为靠近表面的一处富 Ta 区域。能谱（EDX）显示两种取向在衬底界面处都只有一条很窄的阳离子互混区。这项工作给出了一条切实可行的单晶 AgTaO₃ 薄膜合成路线，为在银基钽酸盐中研究应变工程与新出现的界面性质提供了平台。
  ]
]
#v(6pt)

= 引言

钽酸盐钙钛矿把强 $5d$ 自旋–轨道耦合、较高的介电常数与较高的载流子迁移率集于一身，已成为在体材料和氧化物界面探索量子现象的一处有前景的平台 @gupta2022ktao3 @schwaigert2026synthesis @al2023enhanced。把它们做成低维异质结构，这些特性有望支撑起二维电子气 @al2021two @zou2015latio3——其中既有稳健的界面超导 @liu2021two @arnault2023anisotropic @al2022superconductivity，也有高效的自旋–电荷互转换 @al2025spin @vicente2021spin。不过这些新性质能否真正兑现，取决于能不能长出化学计量比准确、界面陡直到原子尺度、缺陷密度低的单晶薄膜 @kim2024electronic。近来 KTaO₃ 中的量子相研究热度很高 @al2022oxygen @mccourt2025electrostatic @poage2025violation，对应的 Ag⁺ 化合物却少有人问津。AgTaO₃ 的介电常数较高、损耗角正切小，还有希望用作反铁电储能材料 @zhao2017lead @valant2007review @liu2018antiferroelectrics。

Francombe 与 Lewis 在 1958 年首次合成了 AgTaO₃ @francombe1958structural，但它的室温晶体结构至今仍有争议。最初认为室温相是正交结构 @francombe1958structural；随后 Belyaev 把室温 AgTaO₃ 归为极性菱面结构（$R 3 c$）@belyaev1978orthorhombic。极性转变通常会在介电常数上留下一个反常。Soon 等人没有观察到这样的反常，因而提出室温 AgTaO₃ 应取中心对称的菱面结构（#rbar3）@soon2010dielectric，另一些作者却报告看到了这样的反常 @suchanicz2009uniaxial。较新的衍射结果给出体相 AgTaO₃ 的相变序列 @li2025high：$"R3c" harpoon.rt^"400 °C" "Ibmm" harpoon.rt^"430 °C" "P4/mbm" harpoon.rt^"500 °C" "Pm" #h(-0.14em) overline(3) #h(-0.1em) "m"$。此外，外延应变与衬底夹持这类合成参数本身也会改变外延薄层的结构相图 @PhysRevB_69_212101 @PhysRevLett_80_1988 @schlom2007strain。

常规固相法是用 Ag₂O 与 Ta₂O₅ 粉末反应生成 AgTaO₃。Valant 等人的热重分析显示，Ag₂O 在钙钛矿形成之前就已经分解成金属银，这说明只有当银在高温下与 Ta₂O₅ 和氧气反应时，Ag⁺ 才会被重新"找回来" @valant2007review。逐原子种类供给的薄膜沉积技术有机会绕过这道热力学障碍。尽管体相 AgTaO₃ 早已合成成功，它的薄膜制备却始终进展有限 @tachikawa2017enhancing，用分子束外延生长这一材料体系更是从未有人做过。有了高质量单晶薄膜，几种彼此竞争的结构才有可能分辨清楚 @khan2021structural，外延调节的影响也才有平台可查。况且近来的姊妹体系 KTaO₃ 分子束外延 @schwaigert2023molecular，已经借助外延应变在室温以上稳定出一个稳健的铁电态 @schwaigert2026above。

本工作报道首次以 MBE 合成 AgTaO₃。薄膜生长在 SrTiO₃ (100) 与 SrTiO₃ (111) 单晶衬底上。X 射线衍射显示薄膜共格受应变、质量与 SrTiO₃ 单晶衬底相当；HAADF-STEM 图像显示界面陡，且看不到任何扩展缺陷。

= 实验

外延 AgTaO₃ 薄膜在一台改装过的 Vecco Gen 10 分子束外延系统上生长：常规的 SiC 加热器换成了 Epiray 公司的 10 μm CO₂ 激光加热器（THERMALAS 衬底加热器）。TaO₂ 分子束由装有 Ta₂O₅（Alfa Aesar，99.993%）的蒸发池产生 @adkison2020 @yorick2026；银分子束由常规蒸发池产生（Alfa Aesar，99.999%）。薄膜的生长方式是一层银原子层接一层 TaO₂ 原子层交替沉积，衬底温度控制在 500–600 °C，由一台工作在 7.5 μm 波长的光学高温计测量。银束流在生长前用石英晶体微天平标定（$1 – 2 times 10^13$ atoms cm⁻² s⁻¹），TaO₂ 束流则以沉积到 R 面蓝宝石上的方式定标。沉积速率由 X 射线反射率测量确认。氧化剂采用臭氧与氧气的混合气（80% O₃ + 20% O₂），生长时氧化剂背景气压为 $1 times 10^-5$ Torr。(001) 与 (111) SrTiO₃ 衬底均按来料直接使用。

X 射线衍射（XRD）、X 射线反射率（XRR）与倒易空间成像（RSM）在一台 PANalytical Empyrean 衍射仪上完成，光源为 Cu K$alpha _1$。XRR 原始谱用 PANalytical X'Pert Reflectivity 软件包分析：先手动确定临界角以修正折射效应，再由快速傅里叶变换（FFT）提取层厚。原位 X 射线光电子能谱（XPS）在同一腔室中完成，光源为非单色化的 Scienta Omicron DSX400，激发后用 Omicron Sphera II 分析器采集谱线。原位反射式高能电子衍射（RHEED）花样用 KSA-400 软件配合 Staib 电子源记录，电子源工作电压 14 kV、灯丝电流 1.5 A。薄膜表面形貌用 Asylum Cypher ES 环境原子力显微镜（AFM）表征。截面 TEM 样品由聚焦离子束（FIB）制取：先以 30 kV 初减薄，再以 5 kV 精修抛光，以减轻离子束造成的表面损伤。STEM 成像使用 Thermo Fisher Scientific Themis Z，加速电压 200 kV，探针半会聚角 20 mrad；高角环形暗场像（HAADF-STEM）的探测器收集范围为 64–200 mrad。为了在抑制样品漂移影响的同时提高信噪比，取 20 幅快速扫描像（每幅 2048 × 2048 像素、每像素驻留时间 200 ns）对齐后平均。能谱（EDX）谱成像使用 Super-X 探测器，元素分布图由净 X 射线计数生成。

= 结果

室温下体相 AgTaO₃ 的晶格常数为 $a = b = 5.528$ Å、$c = 13.715$ Å，空间群为菱面（$R 3 c$，Glazer 记号 $a^– a^– a^–$）@wolcyrz1986。因此 AgTaO₃ 在 SrTiO₃ 上以"伪立方对立方"的方式外延。在 SrTiO₃ (001) 与 (111) 上，预期 AgTaO₃ 的结晶取向分别是 $(012) _R$ 与 $(001) _R$，对应伪立方记号下的 $(001) _"pc"$ 与 $(111) _"pc"$；下标 $R$ 表示菱面指数，$"pc"$ 表示伪立方指数。$(001) _"pc"$ AgTaO₃（$a _"pc" = 3.9258$ Å）与 (001) SrTiO₃（$a _"STO" = 3.9051$ Å）之间的失配为 $–0.53$%；$(111) _"pc"$ AgTaO₃（$a _"pc" =  5.5281$ Å）与 (111) SrTiO₃（$a _"STO" =  5.5226$ Å）之间的失配为 $–0.1$%。

我们用 RHEED 监测两种取向下表面结构与重构随生长的演变。@fig1(a) 与 (b) 是在 (001) 和 (111) SrTiO₃ 上各长满一个化学式单位厚度后取得的 RHEED 花样，分别对应 $(001) _"pc"$ 与 $(111) _"pc"$ 取向。沿高对称方向可以看到衍射条纹和菊池线；$(001) _"pc"$ 取向上还有一批细小的附加亮点。@fig1(c) 与 (d) 是长到 20 个化学式单位厚度后的花样，$(001) _"pc"$ 上那些附加的点状特征已经消失，AgTaO₃ 的衍射花样变得清晰。@fig1(e) 与 (f) 则是 28 nm 厚的 $(001) _"pc"$ 薄膜与 17 nm 厚的 $(111) _"pc"$ 薄膜一停沉积就立刻拍下的花样——此时银和 TaO₂ 的挡板都已关闭，衬底仍处于生长温度并浸泡在臭氧中。$(001) _"pc"$ 的花样依旧干净，$(111) _"pc"$ 的花样却发浑。

原位 XPS 用来考察 AgTaO₃ 薄膜的氧化态（附图 S1）。Ag $3d$ 谱呈现自旋–轨道双峰，$3 d _{5/2}$ 与 $3 d _{3/2}$ 分别位于 368.10 eV（半高宽 1.58 eV）和 374.12 eV（半高宽 1.55 eV），自旋–轨道分裂 6.01 eV，强度比约 1.46:1，接近统计权重 3:2。文献中各氧化态银的结合能彼此重叠严重，因此很难把这个结合能指认给某一种确定的价态 @kaspar2010spectroscopic。Ta $4f$ 双峰位于 $4 f _{7/2} = 26.25$ eV、$4 f _{5/2} = 28.12$ eV，与 Ta⁵⁺ 一致 @schwaigert2026synthesis @KHANUJA200941。

AFM 用于表征薄膜的离线表面形貌（附图 S2、S3）。以 1 μm² 面积为参考区，$(001) _"pc"$ 与 $(111) _"pc"$ 取向 AgTaO₃ 薄膜的均方根粗糙度分别为 0.94 nm 与 0.82 nm。

@fig2 给出同一批 28 nm $(001) _"pc"$ 与 17 nm $(111) _"pc"$ 薄膜的 X 射线衍射结果。@fig2(a) 是 001 AgTaO₃ 反射附近的 $theta – 2 theta$ 扫描，主峰两侧对称排着劳埃条纹 @friedrich1913；完整谱线见补充材料附图 S4、S5。围绕 103 衬底反射的倒易空间成像证实 $(001) _"pc"$ AgTaO₃ 薄膜与衬底完全共格。@fig2(c) 把 002 AgTaO₃ 与 002 SrTiO₃ 的摇摆曲线叠在一起，二者半高宽（薄膜约 20 角秒、衬底约 18 角秒）相当，说明薄膜结晶质量高。@fig2(d) 是生长在 SrTiO₃ (111) 衬底上的 17 nm AgTaO₃ 薄膜的 222 峰；围绕 201 衬底峰的倒易空间成像同样证实薄膜与衬底共格，且薄膜（约 64 角秒）与衬底（约 76 角秒）的半高宽相当。

对 SrTiO₃ (001) 上的薄膜，用完整 $theta – 2 theta$ 扫描并按 Nelson–Riley 外推 @nelson1945，解出面外伪立方晶格常数 $a _"pc" = 3.9429$ Å。我们的面外晶格常数比脉冲激光沉积在 SrTiO₃ (001) 上长出的同厚度 AgTaO₃ 薄膜（3.935 Å）要大 @tachikawa2017enhancing。类似的偏差在 SrTiO₃ 上生长的 KTaO₃ 薄膜中也有报道，那里把晶格膨胀归因于铁电态的出现 @schwaigert2026above。要确切判定空间群对称性、以及面外晶格常数为何膨胀，还需要补充其他表征手段。对 $(111) _"pc"$ AgTaO₃，提取出的晶面间距 $a _"ATO",(111)$ 为 2.283 Å，与未受扰菱面结构预期的 2.285 Å 吻合；如此接近，多半是因为它与 (111) SrTiO₃ 的失配只有 $–0.1$%。

#figure(
  image("fig/RHEEDfigure.pdf", width: 52%),
  caption: [在 (a) (001) SrTiO₃ 与 (b) (111) SrTiO₃ 衬底上各长满一个化学式单位厚度的 AgTaO₃ 后的 RHEED 花样。(c)、(d)：分别长到 20 个化学式单位厚度后的花样。(e)、(f)：28 nm AgTaO₃/(001) SrTiO₃ 与 17 nm AgTaO₃/(111) SrTiO₃ 薄膜刚结束生长时的花样。],
) <fig1>

#figure(
  image("fig/XRDFigure.pdf", width: 92%),
  caption: [(a) $theta – 2 theta$ 扫描，显示 SrTiO₃ (001) 衬底上 AgTaO₃ 的 001 反射。对称的劳埃条纹说明薄膜厚度均一，进而说明膜–底界面陡（星号 * 标出衬底反射）。(b) 围绕 103 衬底与薄膜反射的倒易空间图，表明薄膜与衬底完全共格。(c) 002 SrTiO₃ 与 002 AgTaO₃ 摇摆曲线叠加，半高宽相当，说明面外马赛克度低。(d) $theta – 2 theta$ 扫描，显示 SrTiO₃ (111) 衬底上 AgTaO₃ 的 222 反射（星号 * 标出衬底反射）。(e) 围绕 201 衬底反射的倒易空间图，表明薄膜与衬底共格。(f) 222 SrTiO₃ 与 222 AgTaO₃ 摇摆曲线叠加，半高宽相当，同样说明面外马赛克度低。],
) <fig2>

高角环形暗场 STEM 成像用于进一步考察薄膜。$(001) _"pc"$ AgTaO₃ 样品在像中几乎没有什么特征，说明结晶质量很高（@fig3）；我们既没看到任何扩展缺陷，界面也显得完全共格。我们还用 EDX 元素分布对生长的薄膜做了表征（附图 S6）。元素分布图与相应的强度线剖面上都出现了那条熟悉的窄过渡区：银与钽的信号下降的同时锶与钛的信号升起，说明 AgTaO₃/SrTiO₃ 界面处发生了阳离子互混。界面处的静电间断固然可以由二维电子气来容纳 @ahadi2017novel @mori2019controlling，原子互混也可能起类似的作用 @schwaigert2023molecular。

$(111) _"pc"$ AgTaO₃ 薄膜从衬底界面算起的前 10 nm 结晶质量很高，此后无序度逐渐增大，靠近表面变成一层富钽氧化物。EDX 线剖面显示的膜–底界面互混与 $(001) _"pc"$ 样品类似。富钽无序表面层的形成，可能与高极性的 (111) 表面需要被补偿有关，其间或许还伴随生长过程中的阳离子再分布或银流失。EDX 线剖面同样证实银的浓度沿膜厚向表面逐渐降低，而钽和氧的信号一直保留（附图 S7），这与富钽表面层的形成相吻合。由于未重构的 AgTaO₃ $(111) _"pc"$ 表面本身就是极性的，表面重构与阳离子再分布都可能促成这一区域的形成。最后，其他与生长相关的机制——包括银的优先损失——同样可能贡献于所观察到的富钽表面区。

#figure(
  image("fig/ATOTEM.pdf", width: 66%),
  caption: [同一批 28 nm (001) 与 17 nm (111) AgTaO₃ 薄膜的截面 HAADF-STEM 像。(a) 低倍下 $(001) _"pc"$ 薄膜表面可见台阶，其余区域均匀一致。(b) 提高放大倍数后，膜内原子柱清晰可辨，薄膜与下方 (001) SrTiO₃ 衬底的界面陡直。(c) 低倍下的 (111) AgTaO₃：约 10 nm 厚度内排列规整，其上结构过渡为一层富钽氧化物。(d) 高倍下可见陡直的膜–底界面。],
) <fig3>

综上，我们演示了 MBE 生长高质量 AgTaO₃，两种取向 $(001) _"pc"$ 与 $(111) _"pc"$ 都已实现。XRD 结果表明薄膜结晶完整度高，倒易空间成像证实薄膜与衬底共格受应变。截面 HAADF-STEM 确认了样品的高结晶质量，且未见任何扩展缺陷。EDX 结果则表明，两种取向下衬底与薄膜之间的过渡区都不是原子级突变的。

#v(4pt)
#block(width: 100%, inset: (x: 1.5em, y: 0.9em), stroke: 0.6pt, radius: 2pt)[
  #set par(first-line-indent: 0em)
  #text(size: 9.5pt, weight: "bold")[作者声明]\
  #text(size: 9pt)[
    #text(weight: "bold")[利益冲突]　作者们声明不存在需要披露的利益冲突。\
    #v(3pt)
    #text(weight: "bold")[数据可用性]　支持本研究结论的数据可在文中获取；膜生长以及 XRD、STEM 结构表征的补充数据见 #link("https://doi.org/10.34863/xxxx")[https://doi.org/10.34863/xxxx]（原文此处即为占位符 DOI）。
  ]
]

#v(6pt)
#block(width: 100%, inset: (x: 1.5em, y: 0.9em), stroke: 0.6pt, radius: 2pt, fill: luma(246))[
  #set par(first-line-indent: 0em)
  #text(size: 9.5pt, weight: "bold")[致谢]\
  #text(size: 9pt)[本工作受美国国家科学基金会"界面材料加速实现、分析与发现平台"（PARADIM，合作协议号 DMR-2039380）资助。E.B. 受美国国家科学基金会 DMR-2408890 课题资助。]
]

#v(10pt)
#bibliography("refs.bib", style: "ieee", title: [参考文献])

= 译者附注：原文未排入正文的遗留段落

以下三段位于原始 tex 源 `\end{document}` 之后，LaTeX 不会把它们排进任何一版正文，作者显然也没有删掉。为了不丢失语料，此处照译并单列于文末；它们不属于本文的排版内容，引用编号也按原文键值列出。

用 Nb 取代 Ta 又多出一个可调自由度：Ag(Ta,Nb)O₃ 固溶体会移动这几组相互竞争的（反）极性相之间的边界，从而可以用成分而不是端元化学来调节铁电性与反铁电性状态，把它们调到室温附近 @Pawelczyk1987。这种成分依赖的竞争在科学上很有味道，却也正因此，AgTaO₃ 自身那个唯一的、无歧义的基态一直难以确定，更谈不上拿去做器件。

采用 (001) 与 (111) 两种结晶取向，就能分别长出中等应变的与几乎无应变的四角 AgTaO₃。本文报道的正是 AgTaO₃ 的首次分子束外延。

KTaO₃ 与 AgTaO₃ 之间存在细微的化学与结构差别，不过很可能有一类相通的机制在此起作用——无论是应变或界面感生的极性畸变，还是阳离子化学计量比偏离。此外，KTaO₃ 薄膜是在吸附控制（adsorption-controlled）的生长条件下长出来的，这种条件下相纯本身并不保证靶材成分按化学计量比转移到膜里。要把这几种可能区分开，还需要进一步的表征、第一性原理计算和电学测量，相关工作进行中。

还有一句关于补充材料的说明：原文正文引用了附图 S1（XPS）、S2 与 S3（AFM）、S4 与 S5（完整 XRD 谱）、S6 与 S7（EDX 元素分布与线剖面），但这些图并没有随 arXiv 的 tex 源包一起释出，所以本译文只收录主文的三幅图。
