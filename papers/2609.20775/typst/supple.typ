// —— 补充材料（原 3_Supplementary.tex + g_tensor_and_derivatives.tex + 1_6_section6.tex）——
// 编号沿用原文：小节 S1…、附图 S1…、附表 S1…、公式 (S1…)。

#set math.equation(numbering: "(S1)")
#set figure(numbering: none)
#let bB = $bold(B)$
#let epsi = $epsilon _"12"$
#let tstar = $T _2^"*"$
#let thahn = $T _2^"Hahn"$
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
#let tcz = $t _c$
#let adr = $A _("d,P2")$

= 补充材料

#align(center)[#text(size: 11.5pt, weight: "bold")[《锗中 flopping-mode 自旋量子比特的相干、超低功耗\ EDSR》补充材料]]

= S1 实验装置

测量在一台 Bluefors LD25 稀释制冷机（底装载式）中完成，基温约 10 mK，配一只三轴超导矢量磁体（American Magnetics），按 @fig1 a 定义的 $(z, x, y)$ 方向最大范围分别为 ±1、±1、±6 T，工作于直流模式。如附图 S1 所示，直流栅压由 24 通道 QDevil QDAC-II 数模转换器（DAC）提供，走磷青铜双绞线；到混合腔板后先过一级 225 MHz 截止的低通滤波（QDevil 滤波盒），再过 PCB 上的 50 kHz 低通滤波。需要指出，本实验用的 PCB 并不遮光（没有样品盖），这为改进 #t1 留出了一条现成的路子。射频脉冲与读出都用 Quantum Machines 的 OPX1000 完成，射频链路上共有 26 dB 衰减，并在 PCB 上与直流电压经偏置三通（时间常数 0.1 s）合路。单空穴晶体管（SHT）的源、漏分别接两只 Basel Precision Instruments SP 983C IV 转换器，增益 $10^6$ V/A、带宽 30 kHz。两路电压信号经 Stanford Research Systems SR560 差分放大器相减并放大，增益 $10^2$、带宽 100 kHz。放大器的 50 Ω 输出接 OPX1000 的一个读出通道做信号积分，600 Ω 输出接 Keysight 34465A 数字万用表（DMM）采集直流电流图。

#figure(
  include "fig/setup.typ",
  caption: [#text(weight: "bold")[附图 S1　]低温测量线路示意。实线为同轴/双绞信号通路，方框虚线为制冷机各温级。DAC 的两路输出分别提供栅压 $V _"g"$ 与 SHT 偏压 $V _"SD"$；射频自 AWG 经 26 dB 总衰减后与 $V _"g"$ 在偏置三通处合路，送入样品上的栅极。源、漏两条读出线各自经 50 kHz 与 225 MHz 低通滤波后进入 IV 转换器，再进差分放大器；放大器输出分两路，50 Ω 口给 OPX1000 数字化仪、600 Ω 口给 DMM。原图中的器件 SEM 照片即主文 @fig1 a，此处以虚线框标注代替。],
)

= S2 初始化与读出

直流栅压工作点设在 (0,1,1) 电荷区约中间处。初始化到 $| ↓ , ↓ ⟩ _( "QD2,QD3" )$ 的过程是：以 3 μs 的斜坡（相对 ST⁻ 反交叉为绝热）扫入 (0,0,2) 电荷区，等待 15 μs 让自旋充分弛豫，再对称地扫回 (0,1,1) 区。随后在虚拟势垒栅 $#vBR$ 上加约 +8 mV 的电压脉冲，确保关掉与辅助自旋之间的交换作用；接着用 5000 ns 的斜坡把 $#vBL$ 上的电压降下约 −15 mV（具体值取决于目标 #tcz）。最后用 500 ns 的斜坡（相对 #tcz 绝热）扫到 (1,0,1) 与 (0,1,1) 之间的电荷对称点，即 FM 量子比特的工作点。除 #t1 测量外，每次执行门操作前先等待默认的 3.5 μs，以保证电压电平稳定；做 #t1 测量时，则在扫到电荷对称点后立即施加一个 $X _( X pi )$ 脉冲。量子比特操作完成后，对称地扫回 (0,1,1)，并把 $#vBL$、$#vBR$ 上的斜坡按相反顺序执行；随后以 3 μs 的绝热斜坡进入 (0,1,1)–(0,0,2) 之间的 PSB 区，再用 16 ns 的斜坡进入 (0,1,2) 区的锁存窗口进行读出。读出采用基于电流的 SHT 读出（见「实验装置」一节），稳定时间 50 μs，积分时间 50 μs。

读出保真度对磁场的大小和取向都很敏感，这可能来自锁存 PSB 读出固有的弛豫与映射误差 @kelly_identifying_2025。除非等待时间与 #t1 相当，我们没有观察到点间失谐方向的可见度明显下降。

= S3 失谐与甜区标定

FM 量子比特的工作点对点间失谐十分敏感，而失谐会随时间漂移、跳变。因此我们用一套改进过的自旋回波序列重新标定失谐设定值：

$ X _( "pi"/2 ) - Delta #vP2 ( tau ) - Y _( pi ) - tau - Z ( phi ) - X _( "pi"/2 ). $

其中射频门操作都在 FM 量子比特工作点（$#epsi = 0$）执行。$Delta #vP2$ 表示相对甜区的失谐量，由一段时长为 tau 的 $#vP2$ 绝热脉冲给出。为了便于拟合，最后的自旋投影之前会加一个虚拟相位更新 $phi = 2 pi f _"virt" tau$。扫描 $Delta #vP2$ 时，只要量子比特偏离了初始失谐位置就会积累相位，表现为概率振荡频率的改变，附图 S2 a 给出一次代表性标定测量。对每个失谐值分别拟合振荡，把相对 $f _"virt"$ 的偏差画在 附图 S2 b。用 (S21) 拟合这些数据，即可找到量子比特频率的极小点，从而把工作点定在甜区上。零失谐点（$#epsi = 0$）与 #tcz 用同一套协议标定，只是失谐范围取宽得多（$abs( #epsi ) >> #tcz$），示例见附图 S9 c。

#figure(
  image("fig/sweetspot_calib.pdf", width: 55%),
  caption: [#text(weight: "bold")[附图 S2　]
    #text(weight: "bold")[a.] 用于标定失谐甜区条件的一次代表性 Hahn 回波测量；$Delta #vP2$ 表示相对上一次甜区标定的偏离量。
    #text(weight: "bold")[b.] 用余弦拟合从 a 的数据中提取的量子比特频率失谐。黑色虚线是对 FM 模型哈密顿量的拟合，取模型导数为零的点作为新的甜区条件（此处与上一次标定几乎重合）。
  ],
)

= S4 磁场零偏标定

磁体存在磁滞，导致亚 mT 量级的零偏场，且零偏随所加磁场近似线性变化 @seidler2025 @hendrickxSweetspot2024。由于本样品的出平面 $g$ 张量倾角较大（1.9° 与 3.7°），必须先把矢量磁体三个轴的零偏都标定清楚。磁场零偏对三个轴 $i in { x, y, z }$ 递归测定：扫第 $i$ 轴的名义场 $B _i$、其余分量保持不变，从谱学测量中提取使量子比特频率最小的场强 $B _( "min",i )^"+"$；再把另外两个正交分量反号、重复测量得到 $B _( "min",i )^"-"$。第 $i$ 轴的零偏估计为 $B _( "offset",i ) = ( B _( "min",i )^"+" + B _( "min",i )^"-" ) #sym.slash 2$。按 $z$、$y$、$x$ 的顺序各做一遍，整套流程重复两次以细化估计。最终得到 $B _( "offset",z) = -297$ μT、$B _( "offset",y) = -473$ μT、$B _( "offset",x) = 402$ μT。此后的修正只用到 $z$ 分量，与其他工作一致。

= S5 FM 量子比特哈密顿量

本节给出描述本实验中 FM 量子比特动力学的完整模型：同时计入 QD#sub[1]、QD#sub[2] 的 $g$ 张量、它们的栅压依赖，以及自旋–轨道相互作用 @terrazos_theory_2021 @hendrickxSweetspot2024 @seidler2025 @massai_engineering_2026。

不含 SOI 自旋翻转隧穿项的 FM 量子比特哈密顿量通常写成 @benito2019：

$ H _0 = frac( #epsi , 2 ) tau _z + t _0 tau _x + sum_(i=1,2) frac( mu _"B" bold(B) dot g _i( #vP1 , #vP2 ) bold(sigma), 2 ) frac( tau _0 + (-1) ^i tau _z, 2 ), $ <eqfmh0>

其中 $tau _i$ 是电荷基 $| L ⟩ = | ( 1, 0, 1 ) ⟩$、$| R ⟩ = | ( 0, 1, 1 ) ⟩$ 下的 Pauli-$i$ 算符，$bold(sigma) = ( sigma _x, sigma _y, sigma _z )$ 是自旋 Pauli 算符。$g_1$、$g_2$ 是实验室系中 QD#sub[1]、QD#sub[2] 的 $g$ 张量，依赖栅压 $#vP1$、$#vP2$；这里假设 $g$ 张量随栅压线性变化：

$ g _( 1 ( 2 ) ) ( #vP1 , #vP2 ) = g _( 1 ( 2 ) ) ( overline(V) _"P1" ^( 1 ( 2 ), 0 ), overline(V) _"P2" ^( 1 ( 2 ), 0 ) ) + frac( d g _( 1 ( 2 ) ) , d #vP1 ) ( #vP1 - overline(V) _"P1" ^( 1 ( 2 ), 0 ) ) + frac( d g _( 1 ( 2 ) ) , d #vP2 ) ( #vP2 - overline(V) _"P2" ^( 1 ( 2 ), 0 ) ) $

这里 $overline(V) _"P1" ^( 1 ( 2 ), 0 )$、$overline(V) _"P2" ^( 1 ( 2 ), 0 )$ 是通过扫描磁场取向来表征 $g_1$、$g_2$ 时所取的直流电压 @hendrickxSweetspot2024。$g _( 1 ( 2 ) ) ( overline(V) _"P1" ^( 1 ( 2 ), 0 ), overline(V) _"P2" ^( 1 ( 2 ), 0 ) )$、$partial g _( 1 ( 2 ) ) #sym.slash partial #vP1$ 与 $partial g _( 1 ( 2 ) ) #sym.slash partial #vP2$ 的提取过程见「g 张量与 SOI」一节。

SOI 给出一项自旋翻转隧穿 @froning2021 @geyer2024：

$ H _"SOI" = t _0 tan ( theta _"so" ) tau _y bold(n) _"so" dot bold(sigma) $

其中 $bold(n) _"so"$ 是模为 1 的自旋–轨道矢量，$theta _"so"$ 是自旋–轨道角，描述一次隧穿事件绕 $bold(n) _"so"$ 的自旋转角。有效隧穿耦合为 $#tcz = sqrt( t _0^2 + t _0^2 tan^2 ( theta _"so" ) ) = t _0 #sym.slash cos ( theta _"so" )$。FM 量子比特的总哈密顿量为

$ H _"FM" = H _0 + H _"SOI" $

在自旋–轨道坐标系下，$g$ 张量等效地变换为 $g _1^"so" = g _1 R _"so"( theta _"so" )$、$g _2^"so" = g _2 R _"so"( -theta _"so" )$，哈密顿量化简为 @geyer2024：

$ H _"FM" = frac( #epsi , 2 ) tau _z + #tcz tau _x + sum_(i=1,2) frac( mu _"B" bold(B) dot g _i^"so"( #vP1 , #vP2 ) bold(sigma), 2 ) frac( tau _0 + (-1) ^i tau _z, 2 ), $

其中 $R _"so"( theta )$ 表示绕 $bold(n) _"so"$ 转过 $theta$ 角的矩阵。考虑到本文的量子比特频率很低，我们略去了磁隧穿（magnetotunneling）项 @rodriguez-mena_sweet-spot_2026。
// 补充材料 S6–S8

= S6 $g$ 张量表征与 SOI 测量

重–空穴（HH）态的 Zeeman 劈开 $E _"z"$ 由一个各向异性的 $3 times 3$ $g$ 张量 $g$ 决定，劈开大小因此随磁场方向改变：$E _"z" = mu _"B" abs( bold(B) dot g )$。实际器件中这种各向异性逐点位不同，来源可能是材料里的应变梯度，也可能是静电禁闭的各向异性 @terrazos_theory_2021 @scappucciGermanium2021 @valvo2025 @seidler2025 @mauro2025。我们分别表征 QD#sub[1] 与 QD#sub[2] 的 $g$ 张量，才能把 FM 量子比特甜线随磁场方向的完整分布画出来（主文 @fig2）。

表征 QD#sub[1(2)] 的 $g$ 张量时，先把体系制备在 (1,0,1)（(0,1,1)）电荷组态深处的 $| L ( R ), ↓ ⟩$ 态：在 (0,0,2) 完成初始化后，绝热脉冲到电荷稳定图上距对称点 $( Delta #vP1 , Delta #vP2 ) = ( -5 , +5 )$ mV（$( +5 , -5 )$ mV）处。量子比特频率随 $#bB$ 方向的依赖用啁啾射频的绝热快速通道（ARP）谱学 @baum1985 测出，并拟合 $E _"z"( #bB ) = mu _"B" abs( #bB dot g _( 1 ( 2 ) ) )$ 得到 $g _( 1 ( 2 ) )$ @hendrickxSweetspot2024 @crippa_electrical_2018。附图 S3 a(b) 给出 QD#sub[1(2)] 的有效 $g$ 因子 $g^"*" = E _"z" / ( mu _"B" abs( bold(B) ) )$ 随实验室系方位角 $phi _"lab"$ 与极角 $theta _"lab"$ 变化的代表性测量。

$g _( 1 ( 2 ) )$ 对角化后写作 $"diag"( g _( 1 ( 2 ), x ), g _( 1 ( 2 ), y ), g _( 1 ( 2 ), z ) )$，主值大小次序 $g _( 1 ( 2 ), y ) < g _( 1 ( 2 ), x ) < g _( 1 ( 2 ), z )$ 定义了张量主轴系。实验室系的 $g$ 张量由 $z y z$ 欧拉旋转 $R ( phi _( 1 ( 2 ) ) ) R ( theta _( 1 ( 2 ) ) ) R ( zeta _( 1 ( 2 ) ) )$ 作用在对角张量上得到 @hendrickxSweetspot2024。提取到的参数汇总在附图 S3 a(b) 右上面板的表里，对应的拟合曲线是黑色虚线。对比 QD#sub[1]、QD#sub[2] 沿 $phi _"lab"$ 的 $E _"z"$（附图 S3 a、b 左面板）可以直接看出：尽管两只量子点的版图尺寸与形状几乎一样（主文 @fig1 a），$g$ 张量却并不均匀；尤其是 QD#sub[2] 各主轴方向的 $g$ 因子约比 QD#sub[1] 大出两倍。幅值与倾角上的这种不均匀，我们归因于欧姆接触引入的应变（主文 @fig1 a 中 QD#sub[1] 左侧的棕色结构）@mauro2025，以及本工作所用反向渐变异质叠层的晶格失配 @massai_spin_2026。

要把体系哈密顿量写准，还得计入 $g$ 张量随栅压的有限可调性。为此我们考察两个 $g$ 张量各自对柱塞栅 $#vP1$、$#vP2$ 的依赖，重建完整的导数张量 $partial g _( 1 ( 2 ) ) #sym.slash partial #vP1$ 与 $partial g _( 1 ( 2 ) ) #sym.slash partial #vP2$ @hendrickxSweetspot2024。标准 Hahn 回波序列 $X _( pi/2 ) - tau - Y _pi - tau - X _( pi/2 )$ 在两段自由演化期间保持量子比特频率不变；若要测电荷稳定图上任意一点处的 $partial Delta E _"z" #sym.slash partial overline(V) _( "P" i )$，可改成在两段 $tau$ 内都把量子比特相对电荷对称点失谐 $( Delta #vP1 , Delta #vP2 )$，再对第一、二段 $tau$ 的 $#vP1$（或 $#vP2$）幅度做 $± delta V$ 的微调（附图 S4 b），由此读出 $overline(V) _( "P" i )$ 的微小变化带来的相位积累。为提高估计精度，$delta V$ 在 $± 1.75$ mV 范围内扫描，结果按线性模型拟合，斜率即量子比特频率的导数。测 $partial Delta E _"z"^( 1 ( 2 ) ) #sym.slash partial #vP1$ 时脉冲到 $( Delta #vP1 , Delta #vP2 ) = ( + 6 , 0 )$ mV（$( -6 , 0 )$ mV）；测 $partial Delta E _"z"^( 1 ( 2 ) ) #sym.slash partial #vP2$ 时脉冲到 $( 0 , + 6 )$ mV（$( 0 , -6 )$ mV）。

按这套办法测得 $partial Delta E _"z"^( 1 ( 2 ) ) #sym.slash partial #vP1$ 与 $partial Delta E _"z"^( 1 ( 2 ) ) #sym.slash partial #vP2$ 随磁场方向的分布后，用式 (S6) 拟合即可提取 $partial g _( 1 ( 2 ) ) #sym.slash partial #vP1$。附图 S4 中的绿（蓝）点是 $Delta g _( 1 ( 2 ) )^"*" = ( mu _"B" abs( bold(B) ) )^(-1) partial Delta E _"z"^( 1 ( 2 ) ) #sym.slash partial #vP1$，虚线则是用拟合参数算出的 $Delta g _( 1 ( 2 ) )^"*"$，提取到的参数列在附表 S1。

$ partial Delta E _"z"^( 1 ( 2 ) ) #sym.slash partial overline(V) _j ( #bB ) = mu _"B" abs( frac( #bB dot ( g _( 1 ( 2 ) )^"*" - g _( 1 ( 2 ) )^"0" ), delta overline(V) _j ) ), $

$ g _( 1 ( 2 ) )^"*" = g _( 1 ( 2 ) )^"0" + delta overline(V) _j partial g _( 1 ( 2 ) ) #sym.slash partial overline(V) _j $

这里 $overline(V) _j$ 取 $#vP1$ 或 $#vP2$。每个 $g$ 张量导数由 $( g _( 1 ( 2 ), x )^', g _( 1 ( 2 ), y )^', g _( 1 ( 2 ), z )^', phi _( 1 ( 2 ) )^', theta _( 1 ( 2 ) )^', zeta _( 1 ( 2 ) )^' )$ 六个量描述，其中 $q'$ 表示 $q$ 对栅压的导数。有了 $partial g _( 1 ( 2 ) ) #sym.slash partial #vP1$ 与 $partial g _( 1 ( 2 ) ) #sym.slash partial #vP2$，就能按式 (S2) 假设的线性关系把任意 $( #vP1 , #vP2 )$ 处的 $g _( 1 ( 2 ) )$ 重建出来。

$g$ 张量及其栅压依赖量化之后，接着估计体系中的自旋–轨道相互作用（SOI）。有限 SOI 会在两个量子点之间引起自旋翻转隧穿（式 (S3)），同时改变 FM 量子比特的能量（式 (S4)）。我们在电荷对称点（$#epsi = 0$）测 FM 量子比特的 $g$ 因子随 $#bB$ 方向的分布，即附图 S3 c 下三面板中的红点。对称点处的 $g _( 1 ( 2 ) ) ( #vP1 , #vP2 )$ 由测得的导数对 $g$ 张量作线性外推得到。随后把测得的 #ffm 拟合到 FM 量子比特哈密顿量（式 (S4)），自由参数取自旋–轨道矢量 $bold(n) _"so"$ 与自旋–轨道角 $theta _"so"$，其中 $bold(n) _"so"$ 用球坐标 $( phi _( bold(n) ), theta _( bold(n) ) )$ 参数化为 $bold(n) _"so" = ( cos ( phi _( bold(n) ) ) sin ( theta _( bold(n) ) ), sin ( phi _( bold(n) ) ) sin ( theta _( bold(n) ) ), cos ( theta _( bold(n) ) ) )$。下三面板的黑色虚线就是模型拟合，参数列在右上面板的表里；$bold(n) _"so"$ 的方向在附图 S3 中上面板的 SEM 照片上用黄色箭头标出。Rashba 型 SOI 的电场沿出平面方向，$bold(n) _"so"$ 本应落在面内（即 $theta _( bold(n) ) = 90$°），拟合值却向出平面倾了约 12°（$theta _( bold(n) ) ~ 78.3$°），这可能来自面内方向上的一点杂散电场。

#figure(
  {
    set text(size: 8pt)
    table(
      columns: 5,
      inset: (x: 3pt, y: 2pt),
      align: (left, center, center, center, center),
      [], [$partial g _1 #sym.slash partial #vP1$], [$partial g _1 #sym.slash partial #vP2$], [$partial g _2 #sym.slash partial #vP1$], [$partial g _2 #sym.slash partial #vP2$],
      [$g _( i , x )^'$（mV⁻¹）], $(7.11 ± 0.21) times 10^(-4)$, $(-1.05 ± 0.02) times 10^(-3)$, $(-1.56 ± 0.01) times 10^(-3)$, $(9.21 ± 0.03) times 10^(-4)$,
      [$g _( i , y )^'$（mV⁻¹）], $(6.19 ± 0.79) times 10^(-4)$, $(-8.27 ± 0.87) times 10^(-4)$, $(-9.78 ± 0.11) times 10^(-4)$, $(2.28 ± 0.07) times 10^(-4)$,
      [$g _( i , z )^'$（mV⁻¹）], $(6.51 ± 0.07) times 10^(-3)$, $(-4.03 ± 0.07) times 10^(-3)$, $(-1.36 ± 0.03) times 10^(-3)$, $(7.28 ± 0.02) times 10^(-3)$,
      [$phi _i^'$（度/mV）], $(4.01 ± 0.02) times 10^(-1)$, $(-4.06 ± 0.02) times 10^(-1)$, $(-4.83 ± 0.04) times 10^(-2)$, $(-2.24 ± 0.02) times 10^(-2)$,
      [$theta _i^'$（度/mV）], $(5.11 ± 0.08) times 10^(-3)$, $(-9.25 ± 0.09) times 10^(-3)$, $(-3.05 ± 0.04) times 10^(-3)$, $(-4.69 ± 0.02) times 10^(-3)$,
      [$zeta _i^'$（度/mV）], $(1.80 ± 0.04) times 10^(-1)$, $(-2.28 ± 0.05) times 10^(-1)$, $(-6.54 ± 0.66) times 10^(-3)$, $(7.45 ± 0.04) times 10^(-2)$,
    )
  },
  caption: [#text(weight: "bold")[附表 S1　] $g$ 张量导数 $partial g _1 #sym.slash partial #vP1$、$partial g _1 #sym.slash partial #vP2$、$partial g _2 #sym.slash partial #vP1$、$partial g _2 #sym.slash partial #vP2$ 的参数。每个参数（$p _i^' = partial p _i #sym.slash partial overline(V) _j$）都由「Zeeman 劈开随 $overline(V) _j$ 调制的变化」对式 (S6) 拟合得到。],
)

#figure(
  image("fig/Figure_2_wj_v4.pdf", width: 50%),
  caption: [
    #text(weight: "bold")[附图 S3　]
    #text(weight: "bold")[a.（b.）] QD#sub[1]（QD#sub[2]）中空穴的 $g$ 张量表征。下面三幅面板分别是实验室系 $x y$、$x z$、$y z$ 平面内改变磁场取向时测到的有效 $g$ 因子 $g^"*" = E _"z" / ( mu _"B" abs( bold(B) ) )$；每幅面板中的黑色虚线是对 $g$ 张量模型的拟合，拟合得到的参数组 $( g _( 1 ( 2 ), x ), g _( 1 ( 2 ), y ), g _( 1 ( 2 ), z ), phi _( 1 ( 2 ) ), theta _( 1 ( 2 ) ), zeta _( 1 ( 2 ) ) )$ 列在右上面板的表中。
    #text(weight: "bold")[c.] FM 量子比特的有效 $g$ 因子在实验室系 $x y$、$x z$、$y z$ 平面内随磁场取向的分布（下面三幅面板）。黑色虚线是 FM 量子比特模型的拟合（见「FM 量子比特哈密顿量」一节），该模型同时计入了自旋–轨道相互作用。中上面板 SEM 照片上的黄色箭头标出拟合得到的自旋–轨道矢量 $bold(n) _"so"$ 的方向，描述该矢量的拟合参数 $( phi _( bold(n) ), theta _( bold(n) ), theta _"so" )$ 列在右上面板的表中（见正文）。
  ],
)

#figure(
  image("fig/Deriv_measurement.pdf", width: 74%),
  caption: [
    #text(weight: "bold")[附图 S4　]$g$ 张量导数测量。
    #text(weight: "bold")[a.] 测量示意：在电荷稳定图的固定点处，沿箭头所指方向改变栅压，读出每个量子点 Zeeman 能的变化。
    #text(weight: "bold")[b.] 用于 $g$ 张量导数测量的类 Hahn 回波脉冲序列。
    #text(weight: "bold")[c.] 固定 $theta _"avg"$ 取若干值时，改变 $#vP1$ 在不同磁场方向（由 $phi _"avg"$ 标记）下测得的 $Delta g _( 1 ( 2 ) )^"*"$。
  ],
)

= S7 LSES 与 TSES 计算

基于「FM 量子比特哈密顿量」一节的哈密顿量和「$g$ 张量表征与 SOI 测量」一节提取的参数，可以算出给定 $#bB$ 下 DQD 稳定图任意点 $( #vP1 , #vP2 )$ 处的有效 Zeeman 劈开 $E _"z"( #vP1 , #vP2 ; #bB )$。换若干磁场方向重复计算，就得到有效 $g$ 张量 $g ( #vP1 , #vP2 )$，进而合成主文报告的 FM 量子比特 Larmor 矢量 $bold(l)( #vP1 , #vP2 ; #bB )$。

FM 量子比特相对 $#vP1$ 的 LSES 随 $phi _"avg"$、$theta _"avg"$ 的分布画在附图 S5 a。数值上先算出 $g ( Delta #vP1 = + delta #vP1 , Delta #vP2 = 0 )$、$g ( Delta #vP1 = - delta #vP1 , Delta #vP2 = 0 )$ 与 $g _0 = g ( Delta #vP1 = 0 , Delta #vP2 = 0 )$，再由中心差分得到 $g _( 0 , "P1" )' = partial g _0 #sym.slash partial #vP1 = ( g ( + delta #vP1 , 0 ) - g ( - delta #vP1 , 0 ) ) #sym.slash ( 2 delta #vP1 )$。按 LSES 的定义即得任意 $#bB$ 下的 $beta _( ‖ , "P1(2)" )$：

$ beta _( ‖ , "P1(2)" ) = frac( mu _"B" , h abs( #bB dot g _0 ) ) ( #bB dot g _( 0 , "P1(2)" )' ) dot ( #bB dot g _0 ) $ <eqlses>

相对 $#vP2$ 的 LSES $beta _( ‖ , "P2" )$ 画在附图 S5 d。注意 $mu _"B" #bB dot g _( 0 , "P1(2)" )'$ 就是主文 @fig2 a 中画出的 Larmor 矢量导数 $d bold(l) #sym.slash d overline(V) _( "P1(2)" )$，而 $mu _"B" #bB dot g _0$ 是该组态下的 $bold(l)$。

TSES 由式 (S9) 计算，相对 $#vP1$ 的 $beta _( ⟂ , "P1" )$ 与相对 $#vP2$ 的 $beta _( ⟂ , "P2" )$ 分别画在附图 S5 b、e：

$ beta _( ⟂ , "P1(2)" ) = frac( mu _"B" , h abs( #bB dot g _0 ) ) abs( ( #bB dot g _( 0 , "P1(2)" )' ) times ( #bB dot g _0 ) ) $ <eqtses>

除以 FM 量子比特频率后的 TSES $beta _( ⟂ , "P1(2)" ) #sym.slash f _"FM"$ 见附图 S5 c、f。我们还算了同一器件中 QD#sub[1(2)] 里 Loss-DiVincenzo（LD）量子比特相对其虚拟柱塞栅 $#vP1$（$#vP2$）的 LSES、TSES 与归一化 TSES（附图 S5 g–i 与 j–l）。对比很清楚：FM 量子比特的 TSES 比同器件的 LD 量子比特大两个数量级，这正是 FM 量子比特能以超低功耗实现快速 Rabi 振荡的原因。

#figure(
  image("fig/Supplementary_LSES_TSES_v2.pdf", width: 84%),
  caption: [
    #text(weight: "bold")[附图 S5　]
    #text(weight: "bold")[a（d）.] 相对 $#vP1$（$#vP2$）调制的 FM 量子比特 LSES 计算值 $beta _( ‖ , "P1(2)" )^"FM"$ 随磁场角度 $phi _"avg"$、$theta _"avg"$ 的分布。
    #text(weight: "bold")[b（e）.] 相对 $#vP1$（$#vP2$）调制的 FM 量子比特 TSES 计算值 $beta _( ⟂ , "P1(2)" )^"FM"$ 随磁场角度的分布。
    #text(weight: "bold")[c（f）.] 除以 FM 量子比特频率后的 TSES $beta _( ⟂ , "P1(2)" )^"FM" #sym.slash f _"FM"$ 随磁场角度的分布。
    #text(weight: "bold")[g（j）.] QD#sub[1]（QD#sub[2]）中 LD 量子比特相对 $#vP1$（$#vP2$）的 LSES $beta _( ‖ , "P1(2)" )^( "Q1(2)" )$ 随磁场角度的分布。
    #text(weight: "bold")[h（k）.] QD#sub[1]（QD#sub[2]）中 LD 量子比特相对柱塞栅 $"P1"$（$"P2"$）的 TSES $beta _( ⟂ , "P1(2)" )^( "Q1(2)" )$ 随磁场角度的分布。
    #text(weight: "bold")[i（l）.] 除以 LD 量子比特频率后的 TSES $beta _( ⟂ , "P1(2)" )^( "Q1(2)" ) #sym.slash f _( "Q1(2)" )$ 随磁场角度的分布。
    每幅图中的白色虚线是对应 LSES 归零的甜线。
  ],
)

= S8 FM 量子比特相干时间提取

量子比特的退相干时间 #tstar 与 #thahn 由把概率衰减拟合到下面的模型得到：

$ P ( t ) = A exp #sym.bracket.l - ( t #sym.slash T _2 )^beta #sym.bracket.r cos ( 2 pi f t + phi ) + C, $ <eqdecay>

其中 $beta$ 保留为自由参数。甜区处量子比特与噪声之间是二阶耦合，严格说该式还应附加相应修正 @makhlin_dephasing_2004，这超出本文的讨论范围。

大概由于 Rabi 频率存在准静态涨落，Rabi 振荡的品质因数并不能代表门保真度。附图 S6 c 用 #bhat3 方向、与主文 @fig5 b 的 RB 实验完全相同的参数，给出一条 Rabi 衰减示例。把共振驱动的相位在序列中点 $t _"burst" #sym.slash 2$ 处反转 $pi$ 做 rotary echo，可以确认这种衰减的准静态性质：受驱相干时间 $T _( 2 rho )^"rot"$ 被显著拉长（附图 S6 d）。rotary echo 数据按 $beta = 1$ 的指数衰减拟合。附表 S2 汇总了主文 @fig5 所用两种构态下的相干时间与门参数。

#figure(
  {
    set text(size: 8.5pt)
    table(
      columns: 3,
      inset: (x: 4pt, y: 2pt),
      align: (left, center, center),
      [], [#bhat1], [#bhat3],
      [$abs( #bB )$], [5 mT], [5 mT],
      [$#tcz #sym.slash h$], [13 GHz], [13 GHz],
      [#ffm], [58.8 MHz], [33.7 MHz],
      [#adr], [460 μV], [550 μV],
      [$f _"Rabi"$], [5.7 MHz], [3.5 MHz],
      [#tstar], [$1.44 ± 0.01$ μs（$beta = 1.83 ± 0.05$）], [$1.4 ± 0.02$ μs（$beta = 1.64 ± 0.04$）],
      [#thahn], [$11.28 ± 0.07$ μs（$beta = 2.1 ± 0.05$）], [$11.5 ± 0.06$ μs（$beta = 2.42 ± 0.05$）],
      [$T _2^( phi , "CPMG" )$], [$82 ± 6$ μs（24 个解耦脉冲，$beta = 1.1 ± 0.1$）], [$130 ± 3$ μs（32 个解耦脉冲，$beta = 3.2 ± 0.2$）],
      [#t1], [$53 ± 2$ μs], [$226 ± 6$ μs],
      [$T _( 2 rho )^"rot"$], [$11.8 ± 0.2$ μs], [$21.1 ± 0.5$ μs],
      [$ℱ _( "1qb" )$], [99.76(1)%], [99.74(1)%],
    )
  },
  caption: [#text(weight: "bold")[附表 S2　]与主文 @fig5 的 RB 实验相同构态下测得的量子比特相干指标。],
)

#figure(
  image("fig/figure_6.pdf", width: 74%),
  caption: [
    #text(weight: "bold")[附图 S6　]在 $#bB$ 场取向为 #bhat3、$abs( #bB ) = 5$ mT、$#tcz #sym.slash h = 13$ GHz 下的量子比特表征。
    #text(weight: "bold")[a.] 不同 $Y _pi$ 脉冲数下的 CPMG 衰减曲线，$N _pi = 1, 2, 4, 8, 12, 14, 16, 18, 20, 24, 28, 32$。横轴是序列总时长（定义见 b 中的插图，其中 $tau$ 为扫描的脉冲间隔），为便于视觉分离各曲线加了偏移量；虚线是模型拟合（见正文）。
    #text(weight: "bold")[b.] 功率谱密度的频率依赖。右下角是据 a 中 CPMG 曲线提取的 PSD（剔除 $N _pi < 8$ 的点）；右下角的洋红点来自附图 S6 e 所示失谐点处的 CPMG 测量。左上角的蓝点是 $#epsi = 0$ 处用 Ramsey 振荡测得的 FM 量子比特频率时间序列提取的三份 PSD 的平均；黑色虚线是该数据在双对数空间中的线性拟合，蓝色阴影为拟合的 $1 sigma$ 不确定度。左上角的洋红点是 flank 失谐处的同类测量。
    #text(weight: "bold")[c.] $#epsi = 0$、驱动幅度 550 μV 下的 Rabi 振荡。
    #text(weight: "bold")[d.] 与 c 同参数的 rotary echo 测量，按指数衰减模型拟合。
    #text(weight: "bold")[e.] FM 量子比特频率随失谐 $#epsi$ 的变化，由 Ramsey 振荡提取。黑色实线标出甜区工作的停靠位置（$#epsi = 0$），洋红线标出提取 off-detuning PSD 时的 $#epsi$ 取值。
    #text(weight: "bold")[f.] b 中 CPMG PSD 数据的放大图，并额外给出 $N _pi < 8$ 提取的 PSD（叉号）。
    #text(weight: "bold")[g.] 单比特随机基准测试衰减，拟合得到平均 Clifford 门保真度 99.5%、平均物理门保真度 99.7%。
  ],
)

= S9 FM 量子比特噪声谱

我们在失谐甜区、$#bB$ 场沿 #bhat3、固定 $abs( #bB ) = 5$ mT 与 $#tcz #sym.slash h = 13$ GHz 的条件下表征 FM 量子比特的性能，对应的 chevron 图见主文 @fig1 g。为考察影响量子比特能级劈开的噪声，我们做了 CPMG 谱学 @rojas-arias2025：把 $Y _pi$ 脉冲数 $N _pi$ 从 1 变到 32，并扫描脉冲间隔 $tau$（序列定义见附图 S6 b 中的插图）。相干衰减曲线（附图 S6 a）先按衰减模型拟合出 CPMG 退相干时间 $T _( 2 , N _pi )$，再按「CPMG 噪声谱」一节的办法归一化。$T _( 2 , N _pi )$ 随 $N _pi$ 的变化画在附图 S6 b 的右上插图，双对数坐标下的线性拟合给出斜率 $gamma = 0.72$；若假设噪声是有色的，$S ( f ) = S _0 #sym.slash f^alpha$，则得到 $alpha = gamma #sym.slash ( 1 - gamma ) = 2.58$，这与简单的电荷噪声图像并不相符。

为进一步研究这一趋势，我们把从 CPMG 数据提取的噪声功率谱密度（PSD）画出来（方法见「CPMG 噪声谱」一节），即附图 S6 b 右下角的同一套配色数据。我们还在谱线的 flank 上（$#epsi #sym.slash h = - 15$ GHz $~ - #tcz #sym.slash h$，此处 LSES 最陡）提取了 PSD，用附图 S6 b 右下角的洋红点表示；这一失谐条件在附图 S6 e 中用洋红线标出，该面板画的是量子比特频率随 $#epsi$ 的变化（主文 @fig4 的放大图）。附图 S6 b 中的 CPMG 数据只包含 $N _pi >= 8$ 的点；附图 S6 f 是其放大图，另外补上了 $N _pi < 8$ 得到的点（叉号标记），以便在更宽的频率范围内比较两组数据，只是解耦脉冲数越少，重建精度越低 @rojas-arias2025。甜区数据在 PSD 上露出一个局域特征，很可能来自一只两能级 fluctuator（TLS）；QD#sub[2] 中 LD 量子比特的 Ramsey 衰减里观察到过 TLS 引起的拍频（见「LD 量子比特性能」一节）。对所加 $abs( #bB )$ 而言，$#super[73]"Ge"$ 同位素本应在低得多的 7.4 kHz 处给出一个 PSD 峰 @hendrickxSweetspot2024 @stehouwer2025，但我们无法排除超精细相互作用的其他影响 @zeng_high-fidelity_2026 @stehouwer2025。把甜区内外的数据摆在一起看，失谐甜区工作把 100 kHz 以上的噪声有效压了下去，PSD 降了一个数量级以上。最后，我们把 flank 上的 CPMG PSD 在双对数坐标下按线性函数拟合、并固定噪声指数 $alpha = 1$（附图 S6 f 的点划线），据此外推出电荷噪声水平 $S _( 1 #sym.slash f ) ( 1 "Hz" ) = 2.0 times 10^(-12)$ eV²/Hz，与同材料上已报道的数值相当 @hendrickxSweetspot2024；其中 Hz 到 eV 的换算用的是附图 S6 e 中红线的斜率。这个值与下文 Ramsey 测量存在出入，可能说明低频段还有另一种占主导的噪声源，也可能说明它偏离了 $1 #sym.slash f$ 模型。

甜区与 flank 上 PSD 的低频部分用 Ramsey 谱学探测（见「Ramsey 噪声谱」一节）@rojas-arias2025 @bluhm_dephasing_2011：连续多次 Ramsey 测量中跟踪量子比特频率相对虚拟频率的偏离，从而以 $f _s = 0.2$ Hz 的采样率记录频率涨落，再对数据做傅里叶变换得到 PSD。附图 S6 b 左上角的蓝点是把甜区三次测量的 PSD 平均后的结果（原始数据见附图 S7），洋红点则是 flank 上的同类测量。flank 上的 PSD 拟合给出噪声指数 $alpha = 1.097$，向高频外推的结果用虚线表示，误差范围是附图 S6 b 中的粉色阴影区。若从这组数据提取电荷噪声幅度，得到 $S _( 1 #sym.slash f^1.097 ) ( 1 ~"Hz" ) = 1.4 times 10^(-11)$ eV²/Hz，比同材料已报道的电荷噪声水平大约一个数量级 @hendrickxSweetspot2024。因此低频段的 PSD 应由其他机制主导，例如磁噪声——这与该磁场构型下 #tstar 对频率的弱依赖（主文 @fig4 b）是吻合的。

FM 量子比特的另一个噪声来源是 Rabi 频率的涨落。由于 Rabi 频率对失谐 强烈依赖，这类噪声在 FM 量子比特中预期更明显 @benito2019。Rabi 振荡的衰减画在附图 S6 c。为确认噪声是准静态的，我们做了 rotary echo 实验（附图 S6 d），在序列中点把驱动相位反转 $pi$：相干性改善了约五倍，可见 Rabi 衰减主要来自准静态涨落。


= S10 CPMG 噪声谱

CPMG 序列采用的脉冲协议为

$ X _( pi #sym.slash 2 ) - ( tau - Y _pi - tau ) ^ N _pi - X _( pi #sym.slash 2 ). $

$N _pi = 1$ 与 $N _pi = 32$ 的单次测量分别耗时 5 到 16 分钟。每次测量前都先标定失谐脉冲的幅度，以找到失谐甜区位置。读出为单次 测量，4000 次结果取平均。有限失谐（$abs( #epsi ) > 0$）下的 CPMG 数据（附图 S6 b、f 的洋红点）是这样得到的：在每段 $tau$ 中再插入失谐脉冲，

$ X _( pi #sym.slash 2 ) - ( Delta #vP2 ( tau ) - Y _pi - Delta #vP2 ( tau ) ) ^ N _pi - X _( pi #sym.slash 2 ), $

并使用奇数个 $Y _pi$ 脉冲：$N _pi = 1, 3, 5, 9, 17, 33$。PSD 按文献 @rojas-arias2025 的方法从 CPMG 曲线中提取，区别在于这里还计入了 #t1 弛豫的影响 @bylander2011。每条相干衰减曲线用下面的模型拟合：

$ f ( T ) = A exp [ - ( T #sym.slash T _( 2 , N _pi ) )^beta ] exp [ - 1 #sym.slash 2 times T #sym.slash T _1 ] + B, $

其中 $T = 2 N _pi tau$ 是序列总时长，$T _( 2 , N _pi )$ 是相干时间，$beta$ 是刻画噪声颜色的自由参数，#t1 由单独测量提取后固定，$A$、$B$ 为拟合常数。随后把数据点归一化到 0 与 1 之间，并除掉 #t1 的贡献：

$ tilde(f) ( T ) = frac( f ( T ) - B , A exp [ - 1 #sym.slash 2 times T #sym.slash T _1 ] ) . $

只保留衰减曲线陡峭段、即取值在 0.15 到 0.85 之间的数据点。最后按下式得到单位为 $"Hz"^2 #sym.slash "Hz"$ 的 PSD：

$ "PSD" ( N _pi #sym.slash ( 2 T ) ) = - ln tilde(f) ( T ) #sym.slash ( 2 pi^2 T ) . $

= S11 Ramsey 噪声谱

甜区上的低频 PSD 用 Ramsey 谱学探测，序列为

$ X _( pi #sym.slash 2 ) - tau - Z ( 2 pi f _"virt" tau ) - X _( pi #sym.slash 2 ), $

其中 $tau$ 是扫描的等待时间，$Z ( phi )$ 是虚拟门操作，$f _"virt" = 15.625$ MHz 为虚拟频率。flank 上的 Ramsey 谱学用下面的序列：

$ X _( pi #sym.slash 2 ) - Delta #vP2 ( tau ) - Z ( 2 pi f _"virt" tau ) - X _( pi #sym.slash 2 ), $

其中 $Delta #vP2 ( tau )$ 是相对 $#tcz$ 绝热的失谐脉冲，持续时间取 $tau$。采集一条 Ramsey 曲线时，每个 $tau$ 先执行单次测量，凑满 50 次后把结果平均并存入缓冲区，接着立即再做一次 Ramsey 测量。整个采集全部在 OPX1000 上完成，没有软件循环，因而测量之间的等间距由硬件的确定性时序保证。整个实验耗时约 33 分钟。

每条 Ramsey 振荡的衰减都按式 (S10) 拟合，得到量子比特频率失谐的时间序列 $delta f _"FM" ( tau ) = #ffm - f _"virt"$（附图 S7）。实验重复多次，中间穿插甜区位置的重新标定，在附图 S7 中用竖直黑线标出。每份数据单独算 PSD，再平均得到附图 S6 中的 PSD。PSD 由数据的实傅里叶变换（rFFT）按 $"PSD" = 2 abs( "rFFT" )^2 #sym.slash ( N _s f _s )$ 计算。我们把 flank 与甜区两组结果叠在一起，便于比较噪声幅度。两组数据里都能看到一只两能级 fluctuator，它造成约达 Rabi 频率 15% 的频率跳变；背景漂移则只出现在 flank 数据集里，我们把它归因于甜区处隧穿耦合的低频噪声被抑制。

#figure(
  image("fig/ramsey_time_series.pdf", width: 100%),
  caption: [#text(weight: "bold")[附图 S7　]FM 量子比特频率涨落 $delta f _"FM"$ 的时间序列，分别取自附图 S6 e 所示谱线的 flank（洋红）与甜区。竖直黑线表示采集中断、随后重新标定甜区失谐。$delta f _"FM" = 0$ 处的虚线表示相对虚拟频率零偏离。甜区上的三条时间序列连续采集，之后连续采集 flank 上的三条；两组数据按两个失谐设定值叠加画出，便于比较噪声幅度。],
)

= S12 LD 量子比特性能

我们把 FM 量子比特与 QD#sub[2] 中的一只 LD 量子比特作比较。该 LD 量子比特工作在 (0,1,1) 电荷区中央，(1,0,1) 与 (0,1,1) 之间的点间隧穿耦合处于关闭状态。通过测量态谱随出平面场分量 $#bB _z$ 的变化（附图 S8 a），把 $#bB$ 场调到 $g _2$ 参考系内面内角 $phi _( "QD2" ) = 41.4$° 的方向，即位于 $g _2$ 的赤道面附近；在赤道面附近工作预期能改善 $g$-TMR 驱动单比特门的保真度 @hendrickxSweetspot2024 @john_robust_2025。在频率极小点处取 $abs( #bB ) = 15$ mT、驱动幅度 $#adr = 7.5$ mV，得到附图 S8 b 的 chevron 图。测得 Rabi 频率 0.95 MHz、量子比特频率 141.9 MHz，于是 $eta _"d" = 0.13$ MHz/mV、$tilde(eta) _"d" = 0.0009$ "Hz"/(Hz mV)。Ramsey 与 Hahn 回波的衰减曲线见附图 S8 c、d。Ramsey 衰减里能看到拍频，回波衰减里没有，说明存在来自两能级 fluctuator 的准静态随机电报噪声。Ramsey 衰减按模型 $A e^ - ( t #sym.slash T _2^"*" )^alpha cos ( 2 pi f t ) cos ( pi delta f _"TLS" t ) + B$ 拟合，得到 #tstar $= 2.8 ± 0.05$ μs；回波衰减用与主文相同的模型拟合，得到 #thahn $= 23 ± 0.5$ μs。随后对该 LD 量子比特做随机基准测试（附图 S8 e），Clifford 门保真度 $98.5 ± 0.1$%，平均基元门保真度 $99.1 ± 0.1$%——反保真度比 FM 量子比特高约三倍。

#figure(
  image("fig/figure_LD.pdf", width: 86%),
  caption: [
    #text(weight: "bold")[附图 S8　]
    #text(weight: "bold")[a.] ARP 谱学随出平面磁场强度的变化。
    #text(weight: "bold")[b.] 由 $P _2$ 控制的量子比特的 chevron 振荡，驱动幅度 7.5 mV。
    #text(weight: "bold")[c.（d.）] 超精细甜区处的 Ramsey（Hahn 回波）测量，$B _z = 0$、$abs( #bB ) = 15$ mT。
    #text(weight: "bold")[e.] 在超精细甜区对 LD 量子比特做的随机基准测试。
  ],
)

= S13 杠杆臂与 $#tcz$ 提取

我们先用温度依赖的库仑转变展宽来提取虚拟栅 $#vP3$ 的杠杆臂 @sommer_disentangling_2026：在 (0,1,1) 与 (0,1,2) 电荷区之间的库仑转变上，把 $#vP3$ 在 $± 3$ mV 范围内扫描（附图 S9 a）。温度由混合腔板上的加热器设定，并用同一块板上的温度计监测。每个温度下，SHT 电流随 $#vP3$ 的变化都按 Fermi-Dirac 分布拟合：

$ f ( V ) = A #sym.slash ( e ^ ( beta ( V - V _0 ) ) + 1 ) , $

其中 $beta = alpha #sym.slash ( k _"B" T _"mxc" )$，$T _"mxc"$ 用作电子温度的估计，$alpha$ 即杠杆臂。附图 S9 b 画出提取到的 $beta^(-1)$ 随 $T _"mxc"$ 的变化，对最后五个点做截距强制为零的最小二乘线性拟合，由斜率得到 $#vP3$ 的杠杆臂 $alpha _33 = 0.153$ eV/V；这里记号 $alpha _ "ij"$ 表示栅 $#vP1$…中的第 $i$ 个栅对 QD#sub[$j$] 的作用。主文 @fig1 e 中 (0,0,2) 与 (0,1,1) 之间点间转变在虚拟栅空间里的斜率为

$ s _23 = alpha _33 #sym.slash alpha _22 $

从实测电荷稳定图提取到 $s _23 = 1.04$，据此得到 $alpha _22 = 0.147$ eV/V。接着估计 $alpha _11$。由于打开隧穿耦合时需要对 $#vBL$ 施加脉冲，$P _2$ 栅对 QD#sub[1] 的杠杆臂相对退耦合时的值发生了变化，使得 $alpha _21 #sym.slash alpha _11 = 0.4$，而 $alpha _12 = 0$ 仍然成立。于是虚拟栅 $#vP1$ 的杠杆臂为

$ alpha _11 = alpha _22 #sym.slash ( s _12 + alpha _21 #sym.slash alpha _11 ) = 0.10$ eV/V

组合栅 $#vP2 - #vP1$ 给出的失谐杠杆臂 $alpha _ epsilon$ 为

$ alpha _ epsilon = alpha _22 + alpha _11 ( 1 - alpha _21 #sym.slash alpha _11 ) = 0.21$ eV/V

隧穿耦合 $#tcz$ 的提取方式是：用 $#vP2$ 扫过 (0,1,1) 与 (1,0,1) 之间的点间转变，采用「失谐与甜区标定」一节描述的回波序列，再把所得量子比特谱拟合到模型

$ #ffm = frac( mu _"B" B , h ) frac( sqrt( frac( epsilon _"12"^2 + 2 t _c^2 , 2 ) ( g _1^2 + g _2^2 ) + frac( epsilon _"12" , 2 ) sqrt( epsilon _"12"^2 + 4 t _c^2 ) ( g _2^2 - g _1^2 ) + 2 g _1 g _2 t _c^2 cos ( tilde(theta) _12 ) ), sqrt( epsilon _"12"^2 + 4 t _c^2 ) ) $ <eqfmh>

其中 $epsilon _"12"$ 是能量失谐，$tilde(theta) _12$ 是自由参数，用来吸收 $g$ 张量差异导致的量子化轴错位以及 SOI 引起的自旋翻转隧穿 @seidler2025；$g _1$、$g _2$ 是 QD#sub[1]、QD#sub[2] 的 $g$ 因子，同样作为自由参数，并允许它们随 $epsilon _"12"$ 线性变化 @wang_operating_2024。按惯例 $2 t _c$ 是成键与反键态之间的间距。附图 S9 c 给出一次代表性拟合，结果为 $#tcz #sym.slash h = 13$ GHz。

#figure(
  image("fig/lever_arm.pdf", width: 100%),
  caption: [
    #text(weight: "bold")[附图 S9　]
    #text(weight: "bold")[a.] 归一化传感器电流随虚拟柱塞栅 $#vP3$ 的变化，露出 (0,1,2)–(0,1,1) 库仑转变。在不同混合腔温度 $T _"mxc"$ 下重复测量，并用 Fermi-Dirac 分布拟合（黑线）；为视觉分离各曲线加了偏移量。
    #text(weight: "bold")[b.] 提取到的 $beta^(-1) = k _"B" T _"mxc" #sym.slash alpha _33$ 随 $T _"mxc"$ 的变化，虚线是强制过零点的线性拟合。
    #text(weight: "bold")[c.] 用于标定 $#tcz$ 与 $#epsi = 0$ 条件的典型测量。
  ],
)

= S14 虚拟栅矩阵

需要说明的是，下面这个虚拟栅矩阵只在 #vBL 尚未被脉冲之前，才能保证 QD#sub[1] 与 QD#sub[2] 的化学势彼此独立（见「初始化与读出」一节）。对 #vBL 施加脉冲会改变各栅的相对杠杆臂，这一点已在「杠杆臂与 $t _c$ 提取」一节里处理。

#block[
  #set math.equation(numbering: none)
  #set text(size: 7pt)
  $ mat(
    V _"P4"; V _"P3"; V _"P2"; V _"P1"; V _"B45";
    V _"B34"; V _"B23"; V _"B12"; V _"RB"; V _"PS"
  ) = mat(
    1, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 1, -0.1584, -0.0075, 0, -0.948, -0.4812, 0.0522, 0, 0;
    0, -0.2146, 1, -0.1892, 0, 0.2034, -0.8567, -0.4171, 0, 0;
    0, -0.0029, -0.327, 1, 0, 0.0028, 0.1211, -1.5553, 0, 0;
    0, 0, 0, 0, 1, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 1, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 0, 1, 0, 0;
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0;
    -0.0143, -0.0258, -0.0345, -0.02, -0.017, -0.0122, 0.0106, 0.0269, -0.0054, 1
  ) times mat(
    overline(V) _"P4", overline(V) _"P3", overline(V) _"P2", overline(V) _"P1", overline(V) _"B45",
    overline(V) _"B34", overline(V) _"B23", overline(V) _"B12", overline(V) _"RB", overline(V) _"PS"
  ) $
]

= S15 随机基准测试

单比特随机基准测试（RB）用附表 S3 给出的 Clifford 门分解来执行。101 条随机 Clifford 序列中的每一条，其 Clifford 个数都按 $20$ 的步长在集合 ${ 1 , 21 , 41 , 61 , ..., 381 }$ 里取 $20$ 个长度，序列末尾再补一个还原 Clifford。平均流程分三层：内层先用 $500$ 次 shots 对同一长度取平均，然后改变序列长度，最外层再对 $101$ 条随机 Clifford 序列做扫描。每条序列前面都预先加上一个空闲脉冲和一个 $X _pi$ 脉冲，用来归一化概率刻度。实验使用 Quantum Machines 的 OPX1000，它借助一张存好的 Cayley 查找表，可以在飞行途中生成随机序列并确定其逆门。整个实验耗时约 $20$ 分钟。平均衰减曲线用模型 $A p^n + B$ 拟合，其中 $n$ 是 Clifford 个数、$p$ 是衰减率。Clifford 门保真度取 $ℱ _"Cliff" = ( 1 + p ) / 2$，其误差由拟合的协方差算出。平均单比特门保真度则为 $1 - ( 1 - ℱ _"Cliff" ) / r$，其中 $r = 1.875$ 是每个 Clifford 的平均门数。

#figure(
  {
    set text(size: 8.5pt)
    table(
      columns: 4,
      inset: (x: 6pt, y: 1.5pt),
      align: (center, left, center, left),
      [Clifford], [脉冲序列], [Clifford], [脉冲序列],
      [$C _0$], [$I$], [$C _12$], [$X _90$],
      [$C _1$], [$X _180$], [$C _13$], [$X _(-90)$],
      [$C _2$], [$Y _180$], [$C _14$], [$Y _90$],
      [$C _3$], [$Y _180 X _180$], [$C _15$], [$Y _(-90)$],
      [$C _4$], [$X _90 Y _90$], [$C _16$], [$X _(-90) Y _90 X _90$],
      [$C _5$], [$X _90 Y _(-90)$], [$C _17$], [$X _(-90) Y _(-90) X _90$],
      [$C _6$], [$X _(-90) Y _90$], [$C _18$], [$X _180 Y _90$],
      [$C _7$], [$X _(-90) Y _(-90)$], [$C _19$], [$X _180 Y _(-90)$],
      [$C _8$], [$Y _90 X _90$], [$C _20$], [$Y _180 X _90$],
      [$C _9$], [$Y _90 X _(-90)$], [$C _21$], [$Y _180 X _(-90)$],
      [$C _10$], [$Y _(-90) X _90$], [$C _22$], [$X _90 Y _90 X _90$],
      [$C _11$], [$Y _(-90) X _(-90)$], [$C _23$], [$X _(-90) Y _90 X _(-90)$],
    )
  },
  caption: [#text(weight: "bold")[附表 S3　] $24$ 个单比特 Clifford 操作及其对应的脉冲分解。],
)

= S16 $T _1$ 弛豫理论

== Flopping 模式

Flopping 模式的哈密顿量写成
$ H = frac(#epsi , 2 ) tau _z + t _c tau _x + sum_( i = 1 , 2 ) frac( mu _"B" bold(B) dot g _i bold(sigma) , 2 ) frac( tau _0 + ( -1 )^i tau _z , 2 ) , $ <eqbarefm>
这里用的是各量子点的位置基矢，栅压依赖的 $g$ 张量 $g _i ( #vP1 , #vP2 )$ 按式 (S23) 简记为
$ g _i = R _"avg"^T dot R _i dot g _"diag"^i dot R _i^T dot R _"avg" dot R _"so,i" comma g _"diag"^i = op("diag") ( g _1^i , g _2^i , g _3^i ) . $ <eqgdiag>
其中主轴 $g$ 张量 $g _"diag"^i$ 及它在实验室系里的 $z y z$ 旋转 $R _i$ 见主文图 2。再乘一次旋转 $R _"avg"$ 是为了换到平均实验室系；最后的 $R _"so,i"$ 给出由 SOI 带来的反对称部分，把平均实验室系再转到 SO 系。

为书写方便，引入第 $i$ 个量子比特的 Larmor 矢量
$ bold(l) _i = mu _"B" bold(B) dot g _i , $ <eqlarmor>
它的幅度正是第 $i$ 个量子点实测的 Larmor 频率 $E _( z , i ) = abs( bold(l) _i )$。要说明的是，$E _( z , i )$ 与自旋翻转隧穿那一项 $R _"so,i"$ 无关，只取决于 $g _s^i$ 的主轴（$R _i$）与主值（$g _ ( 1 , 2 , 3 )^i$）。所以单独表征 $g$ 张量只能给出 $g _s^i$ 的信息。

== 有效理论

要建立 FM 量子比特的有效模型，先做一个幺正变换，把哈密顿量中 $B = 0$ 的部分对角化：
$ tilde(U) = e^( -i theta tau _y ) comma tan ( 2 theta ) = 2 t _c / #epsi , $ <eqorbiteig>
配合恒等式 $e^( -i theta ( hat(n) dot sigma ) ) = sigma _0 cos ( theta ) - i ( hat(n) dot sigma ) sin ( theta )$，得到
$ tilde(H) = tilde(U)^† H tilde(U) = frac( Omega , 2 ) tau _z + mat( sin ( theta )^2 , sin ( 2 theta ) / 2 ; sin ( 2 theta ) / 2 , cos ( theta )^2 ) frac( bold(l) _1 dot bold(sigma) , 2 ) + mat( cos ( theta )^2 , - sin ( 2 theta ) / 2 ; - sin ( 2 theta ) / 2 , sin ( theta )^2 ) frac( bold(l) _2 dot bold(sigma) , 2 ) , $ <eqhorb>
对应的轨道能量为
$ ℏ Omega = sqrt( 4 t _c^2 + #epsi^2 ) . $ <eqorbenergy>

FM 量子比特编码在 $tilde(H)$ 的基态投影里，并略去成键态的能量偏移 $ℏ Omega / 2$：
$ H _"FM" = frac( bold(l) dot bold(sigma) , 2 ) , $ <eqfmh2>
这里定义了 FM 的 Zeeman 频率矢量 $bold(l)$，它按失谐依赖的杂化参数 $eta in [ 0 , 1 ]$ 在左右两个量子点的 Larmor 矢量 $bold(l) _ ( 1 , 2 ) = mu _"B" bold(B) dot g _ ( 1 , 2 )$ 之间插值：
$ bold(l) = mu _"B" bold(B) dot [ cos ( theta )^2 g _1 + sin ( theta )^2 g _2 ] = mu _"B" bold(B) dot [ ( 1 - eta ) g _1 + eta g _2 ] = ( 1 - eta ) bold(l) _1 + eta bold(l) _2 , $ <eqlinterp>
$ eta = sin ( theta )^2 = 1 / 2 - #epsi / ( 2 sqrt( 4 t _c^2 + #epsi^2 ) ) . $ <eqeta>
波函数完全定域在 QD#sub[1] 时（$#epsi >> t _c$）有 $eta = 0$；完全定域在 QD#sub[2] 时（$#epsi << - t _c$）有 $eta = 1$；在 FM 工作点 $#epsi = 0$ 处则 $eta = 1 / 2$。要强调的是，本实验里隧穿 $t _c$ 远大于所有 Zeeman 能，所以 $H _"FM"$ 的高阶修正——正是它们会让 FM 量子比特长出甜区——在这里完全可以忽略；最低阶的修正我们在下面估算。

值得注意的是，即便 $bold(l)$ 只是 $bold(l) _1$ 与 $bold(l) _2$ 的线性插值，只要这两个 Larmor 矢量方向不一致，FM 量子比特的实测 Zeeman 能（也就是 $abs( bold(l) )$）随 $#epsi$ 就可能出现非单调行为。把关系显式写出来最容易看清这一点：
$ Delta E = abs( bold(l) ) = sqrt( [ ( 1 - eta ) E _( z , 1 ) + eta E _( z , 2 ) ]^2 - 2 eta ( 1 - eta ) ( E _( z , 1 ) E _( z , 2 ) - bold(l) _1 dot bold(l) _2 ) ) , $ <eqdeltaE>
其中 $E _( z , i ) = abs( bold(l) _i )$ 是第 $i$ 个量子点的 Zeeman 能。决定 $Delta E$ 的有两项。第一项 $( 1 - eta ) E _( z , 1 ) + eta E _( z , 2 )$ 是两个量子点 Zeeman 能随失谐的插值，是 $#epsi$ 的单调函数。第二项 $2 eta ( 1 - eta ) ( E _( z , 1 ) E _( z , 2 ) - bold(l) _1 dot bold(l) _2 )$ 只在杂化非零（$eta != 0$ 且 $eta != 1$）时才出现，刻画的是两个 Larmor 矢量之间的倾角，当 $bold(l) _1 parallel bold(l) _2$ 时它为零。引入两个 Larmor 矢量的夹角
$ cos ( theta _12 ) = frac( bold(l) _1 dot bold(l) _2 , E _( z , 1 ) E _( z , 2 ) ) , $ <eqcostheta12>
$ sin ( theta _12 ) = frac( abs( bold(l) _1 times bold(l) _2 ) , E _( z , 1 ) E _( z , 2 ) ) , $ <eqsintheta12>
则在 FM 工作点 $#epsi = 0$（即 $eta = 1 / 2$）处
$ Delta E _"FM" = sqrt( ( ( E _( z , 1 ) + E _( z , 2 ) ) / 2 )^2 - E _( z , 1 ) E _( z , 2 ) sin^2 ( theta _12 / 2 ) ) . $ <eqdEFM>

这里的角 $theta _12$ 既依赖对称部分的实测 $g$ 张量（$g _s^i$），也依赖量子点 1 与 2 之间累积下来的自旋翻转隧穿旋转 $R _"so,i"$：
$ cos ( theta _12 ) = frac( mu _"B"^2 , ℏ^2 E _( z , 1 ) E _( z , 2 ) ) ( bold(B) g _1 g _2^T bold(B) ) = frac( mu _"B"^2 , ℏ^2 E _( z , 1 ) E _( z , 2 ) ) ( bold(B) g _s^1 R _"so" g _s^2 bold(B) ) , $ <eqcos12exp>
其中 $R _"so" = R _"so,1" R _"so,2"^T$。

把式 (S28) 里的 $H _"FM"$ 完全对角化的变换显式为
$ u = e^( -i psi sigma _z ) e^( -i phi sigma _y ) comma cos ( 2 psi ) = l _y / l _x comma tan ( 2 phi ) = l _z / Delta E . $ <equtrafo>

#figure(
  image("fig/Figure_S6ab.png", width: 78%),
  caption: [
    #text(weight: "bold")[附图 S10　]#text(weight: "bold")[a.] FM 量子比特频率随失谐 $#epsi$ 的变化。数值取自实验拟合的隧穿耦合 $t _c = 52$ μeV、$g _1$ 与 $g _2$，以及主文图 2 里的 ZYZ 旋转角。数值线是把式 (S22) 的 $4 times 4$ 哈密顿量直接对角化得到的，解析线则代入式 (S28) 得到。
    #text(weight: "bold")[b.] FM 量子比特频率随磁场面内角 $phi _"avg"$ 与出平面角 $theta _"avg"$ 的变化。
  ],
)

== 对 FM 哈密顿量的修正

下面分析成键与反键轨道态之间的耦合给式 (S28) 的 $H _"FM"$ 带来的修正，并说明这些修正至少按 $B^3 / Omega^2$ 标度，因此在量子比特工作的低场极限下可以安全忽略。定义
$ bar( bold(l) ) = eta bold(l) _1 + ( 1 - eta ) bold(l) _2 = bold(l) | _ theta -> theta + pi/2 , $ <eqlbar>
$ Delta bold(l) = ( bold(l) _1 - bold(l) _2 ) / 2 = mu _"B" bold(B) dot [ g _1 - g _2 ] / 2 , $ <eqldelta>
双量子点哈密顿量就化成
$ tilde(H) = 1 / 2 mat( Omega sigma _0 + bar( bold(l) ) dot bold(sigma) , sin ( 2 theta ) Delta bold(l) dot bold(sigma) ; sin ( 2 theta ) Delta bold(l) dot bold(sigma) , - Omega sigma _0 + bold(l) dot bold(sigma) ) . $ <eqhtilde>
记号 $bold(l) | _ theta -> theta + pi/2$ 的意思是：$bar( bold(l) )$ 与 FM 的 Larmor 矢量 $bold(l)$ 只差把 $theta$ 换成 $theta + pi / 2$，等价地也就是把失谐变号 $#epsi -> - #epsi$，于是 $eta -> ( 1 - eta )$、$( 1 - eta ) -> eta$。

$H _"FM"$ 的修正可以用 Schrieffer–Wolff（SW）变换导出。低磁场下取到二阶，SW 变换的生成元 $S$ 为
$ S = frac( sin ( 2 theta ) , 2 Omega ) mat( 0 , Delta bold(l) dot bold(sigma) ; - Delta bold(l) dot bold(sigma) , 0 ) , $ <eqSgen>
由此得到有效哈密顿量
$ H _"eff" approx op("diag") ( frac( bar( bold(l) ) dot bold(sigma) , 2 ) + frac( Omega , 2 ) ( 1 + frac( sin ( 2 theta )^2 abs( Delta bold(l) )^2 , 2 Omega^2 ) ) sigma _0 , frac( bold(l) dot bold(sigma) , 2 ) - frac( Omega , 2 ) ( 1 + frac( sin ( 2 theta )^2 abs( Delta bold(l) )^2 , 2 Omega^2 ) ) sigma _0 ) , $ <eqheff44>
其中的成键块给出有效的 FM 子空间
$ H _"eff" = frac( bold(l) dot bold(sigma) , 2 ) - frac( Omega , 2 ) ( 1 + frac( sin ( 2 theta )^2 abs( Delta bold(l) )^2 , 2 Omega^2 ) ) sigma _0 $ <eqheff>
$ abs( Delta bold(l) )^2 = Delta l _x^2 + Delta l _y^2 + Delta l _z^2 = frac( ( E _( z , 1 ) - E _( z , 2 ) )^2 , 4 ) + E _( z , 1 ) E _( z , 2 ) sin^2 ( theta _12 / 2 ) prop B^2 . $ <eqldelta2>
这个结果说明，FM 哈密顿量 (S28) 的最低阶修正与自旋无关；与自旋有关的项要到更高阶才出现，因而至少按 $prop B^3 / Omega^2$ 标度。

再配上一个额外的旋转 (S36) ，有效哈密顿量可以被完全对角化：
$ U _ bold(l) = op("diag") ( bar(u) , u ) , $ <equl>
其中反键态那一块的变换定义为 $bar(u) = e^( -i bar(psi) sigma _z ) e^( -i bar(phi) sigma _y )$，$tan ( 2 bar(psi) ) = bar(l) _y / bar(l) _x$，$cos ( 2 bar(phi) ) = bar(l) _z / abs( bar( bold(l) ) )$。

把幺正变换 (S44) 作用在已分块对角化的有效哈密顿量 (S41) 上，得到
$ tilde(H) _"eff" = U _ bold(l)^† H _"eff" U _ bold(l) = op("diag") ( frac( abs( bar( bold(l) ) ) sigma _z , 2 ) + frac( Omega , 2 ) ( 1 + frac( sin ( 2 theta )^2 abs( Delta bold(l) )^2 , 2 Omega^2 ) ) sigma _0 , frac( abs( bold(l) ) sigma _z , 2 ) - frac( Omega , 2 ) ( 1 + frac( sin ( 2 theta )^2 abs( Delta bold(l) )^2 , 2 Omega^2 ) ) sigma _0 ) . $ <eqheff44diag>

= S17 退相干

为了刻画 FM 量子比特的退相干，我们考察隧穿、失谐与 $g$ 张量各自的涨落 $delta _t$、$delta _epsilon$、$delta g _i$ 对 FM 量子比特的影响，它们由下面的哈密顿量描述：
$ H _N = frac( delta _epsilon , 2 ) tau _z + delta _t tau _x + sum_( i = 1 , 2 ) frac( bold(delta) _l^i dot bold(sigma) , 2 ) frac( tau _0 + ( -1 )^i tau _z , 2 ) , $ <eqHN>
其中 $bold(delta) _l^i = mu _"B" bold(B) dot delta g _i$。换到轨道本征态（见式 (S25) ）之后，
$ tilde(H) _N = tilde(U)^† H _N tilde(U) = frac( delta _epsilon cos ( 2 theta ) + 2 delta _t sin ( 2 theta ) , 2 ) tau _z - frac( delta _epsilon sin ( 2 theta ) - 2 delta _t cos ( 2 theta ) , 2 ) tau _x \ + 1 / 2 mat( bar( bold(delta) _l ) dot bold(sigma) , sin ( 2 theta ) Delta bold(delta) _l dot bold(sigma) ; sin ( 2 theta ) Delta bold(delta) _l dot bold(sigma) , bold(delta) _l dot bold(sigma) ) , $ <eqHtN>
与上文类似地，这里引入
$ bold(delta) _l = ( 1 - eta ) bold(delta) _l^1 + eta bold(delta) _l^2 , $ <eqdgta>
$ bar( bold(delta) ) _l = eta bold(delta) _l^1 + ( 1 - eta ) bold(delta) _l^2 , $ <eqdgtb>
$ Delta bold(delta) _l = ( bold(delta) _l^1 - bold(delta) _l^2 ) / 2 , $ <eqdgtdelta>
并且显式地
$ sin ( 2 theta ) = 2 t _c / ( ℏ Omega ) = 2 sqrt( eta ( 1 - eta ) ) comma cos ( 2 theta ) = #epsi / ( ℏ Omega ) = 1 - 2 eta . $ <eqsin2theta>

把反键态与成键态之间的杂化用二阶 SW 生成元 (S40) 微扰地纳入，并只保留 $B$ 的线性项，得到
$ H _"eff,N" = frac( delta _epsilon , 2 ) cos ( 2 theta ) tau _z - frac( delta _epsilon , 2 ) sin ( 2 theta ) tau _x + frac( delta _epsilon , 2 ) sin ( 2 theta ) frac( Delta bold(l) dot bold(sigma) , Omega ) mat( - sin ( 2 theta ) , - cos ( 2 theta ) ; - cos ( 2 theta ) , sin ( 2 theta ) ) \ + delta _t sin ( 2 theta ) tau _z + delta _t cos ( 2 theta ) tau _x + delta _t sin ( 2 theta ) frac( Delta bold(l) dot bold(sigma) , Omega ) mat( cos ( 2 theta ) , - sin ( 2 theta ) ; - sin ( 2 theta ) , - cos ( 2 theta ) ) \ + 1 / 2 mat( bar( bold(delta) _l ) dot bold(sigma) , sin ( 2 theta ) Delta bold(delta) _l dot bold(sigma) ; sin ( 2 theta ) Delta bold(delta) _l dot bold(sigma) , bold(delta) _l dot bold(sigma) ) + cal(O) ( B^2 ) . $ <eqHnoise>

== 一阶退相干过程

从噪声哈密顿量 (S52) 可以直接提取导致 FM 量子比特退相位与弛豫的矩阵元。用量子比特的变换 (S36) 把量子化能量对角化——它把实验室系里定义的矢量旋进量子比特坐标系，
$ Delta bold(l) -> tilde(Delta) bold(l) = R _y ( - 2 phi ) R _z ( - 2 psi ) Delta bold(l) comma bold(delta) _l -> tilde( bold(delta) ) _l = R _y ( - 2 phi ) R _z ( - 2 psi ) bold(delta) _l , $ <eqrotqubit>
于是
$ H _"FM,N" = frac( tilde( bold(delta) ) _N dot bold(sigma) , 2 ) comma tilde( bold(delta) ) _N = tilde( bold(delta) ) _l + frac( tilde(Delta) bold(l) , Omega ) [ sin ( 2 theta )^2 delta epsilon - 2 cos ( 2 theta ) sin ( 2 theta ) delta t ] , $ <eqHFMN>
它同时包含了直接耦合到自旋的 $g$ 张量涨落，以及经由自旋–轨道相互作用耦合到自旋的失谐涨落。退相位由 $tilde( bold(delta) ) _N$ 的纵向分量 $( tilde( bold(delta) ) _N ) _z$ 刻画：
$ ( tilde( bold(delta) ) _N ) _z = bold(delta) _N dot frac( bold(l) , abs( bold(l) ) ) = frac( ( 1 - eta )^2 bold(delta) _l^1 dot bold(l) _1 + eta^2 bold(delta) _l^2 dot bold(l) _2 + eta ( 1 - eta ) ( bold(delta) _l^1 dot bold(l) _2 + bold(delta) _l^2 dot bold(l) _1 ) , Delta E ) \ + 2 sqrt( ( 1 - eta ) eta ) frac( [ ( 1 - eta ) E _( z , 1 ) + eta E _( z , 2 ) ] ( E _( z , 1 ) - E _( z , 2 ) ) + 2 E _( z , 1 ) E _( z , 2 ) ( 1 - 2 eta ) sin^2 ( theta _12 / 2 ) , Omega Delta E ) [ sqrt( eta ( 1 - eta ) ) delta epsilon + ( 1 - 2 eta ) delta t ] , $ <eqdNz>
弛豫则由横向分量 $( tilde( bold(delta) ) _N ) _ perp$ 刻画，它可以写成
$ ( tilde( bold(delta) ) _N ) _ perp^2 = abs( bold(delta) _N times frac( bold(l) , abs( bold(l) ) ) )^2 = ( tilde( bold(delta) ) _N ) _x^2 + ( tilde( bold(delta) ) _N ) _y^2 = abs( tilde( bold(delta) ) _N )^2 - ( tilde( bold(delta) ) _N ) _z^2 , $ <eqdNperp>
#set text(size: 8pt)
$ abs( tilde( bold(delta) ) _N )^2 approx sum_( n = ( x , y , z ) ) ( bold(delta) _l ) _ n^2 + frac( 4 ( 1 - eta ) eta , Omega^2 ) [ ( E _( z , 1 ) - E _( z , 2 ) )^2 + 4 E _( z , 1 ) E _( z , 2 ) sin^2 ( theta _12 / 2 ) ] [ eta ( 1 - eta ) delta epsilon^2 + ( 1 - 2 eta )^2 delta t^2 ] . $ <eqdNabs2>
#set text(size: 10pt)
这里忽略了不同参数涨落之间的交叉项。在零失谐处 $eta = 1 / 2$、$Omega = 2 t _c / h$，FM 量子比特的退相干由下面两式决定：
$ ( tilde( bold(delta) ) _N ) _z = frac( ( bold(delta) _l^1 + bold(delta) _l^2 ) dot ( bold(l) _1 + bold(l) _2 ) , 4 Delta E _"FM" ) + frac( E _( z , 1 )^2 - E _( z , 2 )^2 , 8 t _c Delta E _"FM" ) delta epsilon , $ <eqT2sweet1>
$ ( tilde( bold(delta) ) _N ) _ perp = frac( abs( ( bold(delta) _l^1 + bold(delta) _l^2 ) times ( bold(l) _1 + bold(l) _2 ) ) , 4 Delta E _"FM" ) + frac( E _( z , 1 ) E _( z , 2 ) sin ( theta _12 ) , 4 t _c Delta E _"FM" ) delta epsilon . $ <eqT1sweet1>

== 二阶弛豫过程

二阶过程涉及分块矩阵的非对角元。在量子比特坐标系里，这些跃迁矩阵元的模为（其中 $tilde(M) _ epsilon = U _ bold(l)^† M _ epsilon U _ bold(l)$、$tilde(M) _ t = U _ bold(l)^† M _ t U _ bold(l)$ 以及 $tilde(M) _ bold(delta)$）：
$ abs( tilde(M) _ ( t , 14 ) ) = abs( abs( #epsi ) / Omega sin ( gamma / 2 ) - 4 t _c^2 / Omega^3 ( abs( Delta bold(l) _ perp ) cos ( gamma / 2 ) - Delta bold(l) _ parallel sin ( gamma / 2 ) ) ) , $ <eqMt14>
$ abs( tilde(M) _ ( t , 23 ) ) = abs( abs( #epsi ) / Omega sin ( gamma / 2 ) + 4 t _c^2 / Omega^3 ( abs( Delta bold(l) _ perp ) cos ( gamma / 2 ) - Delta bold(l) _ parallel sin ( gamma / 2 ) ) ) , $ <eqMt23>
$ abs( tilde(M) _ ( t , 13 ) ) = abs( ( abs( #epsi ) / Omega + 4 t _c^2 Delta bold(l) _ parallel / Omega^3 ) cos ( gamma / 2 ) + 4 t _c^2 abs( Delta l _ perp ) / Omega^3 sin ( gamma / 2 ) ) , $ <eqMt13>
$ abs( tilde(M) _ ( t , 24 ) ) = abs( ( abs( #epsi ) / Omega - 4 t _c^2 Delta bold(l) _ parallel / Omega^3 ) cos ( gamma / 2 ) - 4 t _c^2 abs( Delta l _ perp ) / Omega^3 sin ( gamma / 2 ) ) . $ <eqMt24>

$ abs( tilde(M) _ ( epsilon , 14 ) ) = abs( t _c / Omega sin ( gamma / 2 ) + t _c abs( #epsi ) / Omega^3 ( abs( Delta bold(l) _ perp ) cos ( gamma / 2 ) - Delta bold(l) _ parallel sin ( gamma / 2 ) ) ) , $ <eqMe14>
$ abs( tilde(M) _ ( epsilon , 23 ) ) = abs( t _c / Omega sin ( gamma / 2 ) - t _c abs( #epsi ) / Omega^3 ( abs( Delta bold(l) _ perp ) cos ( gamma / 2 ) - Delta bold(l) _ parallel sin ( gamma / 2 ) ) ) , $ <eqMe23>
$ abs( tilde(M) _ ( epsilon , 13 ) ) = abs( ( t _c / Omega - t _c abs( #epsi ) Delta bold(l) _ parallel / Omega^3 ) cos ( gamma / 2 ) - t _c abs( #epsi ) abs( Delta bold(l) _ perp ) / Omega^3 sin ( gamma / 2 ) ) , $ <eqMe13>
$ abs( tilde(M) _ ( epsilon , 24 ) ) = abs( ( t _c / Omega + t _c abs( #epsi ) Delta bold(l) _ parallel / Omega^3 ) cos ( gamma / 2 ) + t _c abs( #epsi ) abs( Delta bold(l) _ perp ) / Omega^3 sin ( gamma / 2 ) ) . $ <eqMe24>
这里定义了横向磁场梯度 $Delta l _ perp = abs( Delta bold(l) times hat(l) ) = E _( z , 1 ) E _( z , 2 ) sin ( theta _12 ) / ( 2 Delta E )$、纵向磁场梯度 $Delta l _ parallel = ( E _( z , 1 )^2 - E _( z , 2 )^2 ) / ( 4 Delta E ) + ( #epsi / Omega ) abs( Delta bold(l) )^2 / Delta E$，以及成键与反键态里两个 FM Zeeman 矢量之间的夹角 $gamma$，$cos ( gamma ) = hat( bold(l) ) dot hat( bar( bold(l) ) )$。

在零失谐处（$hat( bold(l) ) = hat( bar( bold(l) ) )$、$gamma = 0$）可以看到，二阶通道只存在于隧穿通道里：一支由自旋守恒的轨道间隧穿中介，
$ abs( tilde(M) _ ( t , 13 ) ) = abs( tilde(M) _ ( t , 24 ) ) = abs( ( E _( z , 1 )^2 - E _( z , 2 )^2 ) / ( 8 t _c Delta E _"FM" ) ) , $ <eqMt13zero>
另一支由自旋翻转的轨道间隧穿中介，
$ abs( tilde(M) _ ( t , 14 ) ) = abs( tilde(M) _ ( t , 23 ) ) approx abs( Delta l _ perp ) / ( 2 t _c ) = ( 1 / ( 4 t _c ) ) E _( z , 1 ) E _( z , 2 ) sin ( theta _12 ) / Delta E _"FM" . $ <eqMt2nd>

= S18 弛豫

== 一般模型

把环境也算进来，FM 量子比特的完整哈密顿量为
$ tilde(H) = tilde(H) _"eff" + tilde(H) _"eff,N" + H _"bath" , $
其中 $tilde(H) _"eff"$ 与 $H _"eff,N"$ 分别由式 (S45) 与式 (S52) 给出，并且额外作用一个换到量子比特坐标系的旋转 $tilde(H) _"eff,N" = tilde(U) _ bold(l)^† H _"eff,N" tilde(U) _ bold(l)$；$H _"bath"$ 代表一般化的环境哈密顿量。相互作用绘景下的热浴–系统哈密顿量写成
$ tilde(H) _"eff,N" = sum_( nu in { epsilon , t } ) tilde(M) _ nu delta _ nu comma tilde(M) _ nu = sum_( n , m ) tilde(M) _ ( nu , n m ) e^( i omega _ ( n m ) t ) | n ⟩ ⟨ m | , $ <eqMdelta>
这里 $tilde(M) _ nu$ 是第 $nu$ 个通道的热浴–系统耦合矩阵，$delta _ nu$ 是该通道由热浴引起的、以能量为单位的涨落。具体的矩阵元见式 (S60)–(S67)。

考虑一般的能级系统，在量子朗之万方程框架下量子比特系统算符 $C$ 的运动方程为
$ dot ( C ) = - i / ℏ [ C , tilde(H) ] - sum_ nu sum_( n m ) { Gamma _ nu^+ ( omega _ ( n m ) ) [ C , tilde(M) _ ( nu , n m ) ] tilde(M) _ ( nu , n m )^† - Gamma _ nu^- ( omega _ ( n m ) ) tilde(M) _ ( nu , n m )^† [ C , tilde(M) _ ( nu , n m ) ] } , $ <eqqle>
非对称噪声谱密度定义为
$ Gamma _ nu^+ ( omega _ ( n m ) ) = 1 / ℏ^2 integral_ 0^ infinity d tau e^( i omega _ ( n m ) tau ) ⟨ delta _ nu ( tau ) delta _ nu ( 0 ) ⟩ , $ <eqgammaP>
$ Gamma _ nu^- ( omega _ ( n m ) ) = 1 / ℏ^2 integral_ 0^ infinity d tau e^( i omega _ ( n m ) tau ) ⟨ delta _ nu ( 0 ) delta _ nu ( tau ) ⟩ . $ <eqgammaM>

我们体系里的弛豫不仅来自成键轨道基态内的直接自旋翻转，也来自涉及成键与反键态之间快速轨道跃迁的高阶过程。为了描述这一效应，考察每个 flopping-mode 本征态 $mu$ 的占据数 $P _ mu = | mu ⟩ ⟨ mu |$ 的速率方程。由于 $P _ mu$ 是投影算符，式 (S72) 化为
$ dot ( P _ mu ) = sum_ nu sum_( n , m ) { Gamma _ nu^+ ( omega _ ( n , m ) ) [ P _ mu , tilde(M) _ ( nu , n m ) ] tilde(M) _ ( nu , n m )^† - Gamma _ nu^- ( omega _ ( n , m ) ) tilde(M) _ ( nu , n m )^† [ P _ mu , tilde(M) _ ( nu , n m ) ] } \ = sum_ nu sum_ n abs( tilde(M) _ ( nu , mu n ) )^2 { [ Gamma _ nu^+ ( omega _ ( n , mu ) ) + Gamma _ nu^- ( omega _ ( mu , n ) ) ] P _ n \ - [ Gamma _ nu^+ ( omega _ ( mu , n ) ) + Gamma _ nu^- ( omega _ ( n , mu ) ) ] P _ mu } , $ <eqrateP>
其中第二行用到了 $tilde(M) _ ( nu , n m )^† [ P _ mu , tilde(M) _ ( nu , n m ) ] = [ tilde(M) _ ( nu , n m ) , P _ mu ]$ 以及 $tilde(M) _ ( nu , n m )^† = abs( tilde(M) _ ( nu , n m ) )^2 ( delta _ ( mu n ) P _ m - delta _ ( mu m ) P _ mu )$。于是每个能级占据数 $P _ i$ 的速率方程组可以写成
$ dot ( P _ mu ) = sum_ j ( W _ ( mu j ) P _ j - W _ ( j mu ) P _ mu ) = - W _ mu P _ mu + sum_( j != mu ) W _ ( mu j ) P _ j , $ <eqfinalme>
其中 $W _ ( mu j ) = W_ ( j -> mu )$ 是从能量为 $E _ j$ 的态 $j$ 跃迁到能量为 $E _ mu$ 的态 $mu$ 的速率，总速率记作 $W _ mu = sum_( j != mu ) W _ ( j mu )$。能级跃迁速率为
$ W _ ( n m ) = W_ ( m -> n ) = sum_ nu abs( tilde(M) _ ( nu , n m ) )^2 [ Gamma _ nu^+ ( omega _ ( m n ) ) + Gamma _ nu^- ( omega _ ( n m ) ) ] = sum_ nu abs( tilde(M) _ ( nu , n m ) )^2 S_ nu ( omega _ ( n m ) ) / ℏ^2 , $ <eqrelrates>
它通过对称功率谱密度相联系：
$ S_ nu ( omega _ ( n m ) ) = integral_ -infinity^ infinity d tau e^( - i omega _ ( n m ) tau ) ⟨ delta _ nu ( tau ) delta _ nu ( 0 ) ⟩ . $ <eqpsd>

要估算编码在成键态自旋里的 FM 量子比特的弛豫率，就把反键态中的自旋能级绝热消去。这一步假定激发轨道态（反键）向成键态的衰减很快、其占据数变化始终为零，因此令 $dot ( P_ 3 ) = dot ( P_ 4 ) = 0$。另外，反键态之间的直接自旋跃迁远慢于轨道跃迁，所以为简洁起见把 $W_ ( 3 4 )$ 与 $W_ ( 4 3 )$ 的贡献略去。解出 $P _3$、$P _4$ 并代回式 (S76)，得到
$ dot ( P _1 ) = - P _1 ( W _1 - W_ ( 1 3 ) W_ ( 3 1 ) / W _3 - W_ ( 1 4 ) W_ ( 4 1 ) / W _4 ) + P _2 ( W_ ( 1 2 ) + W_ ( 1 3 ) W_ ( 3 2 ) / W _3 + W_ ( 1 4 ) W_ ( 4 2 ) / W _4 ) , $ <eqP1dot>
$ dot ( P _2 ) = P _1 ( W_ ( 2 1 ) + W_ ( 2 3 ) W_ ( 3 1 ) / W _3 + W_ ( 2 4 ) W_ ( 4 1 ) / W _4 ) - P _2 ( W _2 - W_ ( 2 3 ) W_ ( 3 2 ) / W _3 - W_ ( 2 4 ) W_ ( 4 2 ) / W _4 ) . $ <eqP2dot>
由这组方程，弛豫率 $1 / T _1$ 就是非对角元之和：
$ 1 / T _1 = 1 / T _1^ ( 1 ) + 1 / T _1^ ( 2 ) , $ <eqT1sum>
其中一阶与二阶过程分别为
$ 1 / T _1^ ( 1 ) = W_ ( 1 2 ) + W_ ( 2 1 ) comma 1 / T _1^ ( 2 ) = ( W_ ( 1 3 ) W_ ( 3 2 ) + W_ ( 2 3 ) W_ ( 3 1 ) ) / W _3 + ( W_ ( 1 4 ) W_ ( 4 2 ) + W_ ( 2 4 ) W_ ( 4 1 ) ) / W _4 . $ <eqT112>
下面分别讨论各种可能的弛豫来源。

== 玻色热浴引起的弛豫

环境取作由 $n$ 个正交模式构成的玻色热浴，波矢为 $bold(q)$、频率为 $omega_ ( n , bold(q))$，即 $H _"bath" = sum_( n , bold(q)) ℏ omega_ ( n , bold(q)) a_ ( bold(q) , n )^† a_ ( bold(q) , n )$；它通过隧穿、失谐与 $g$ 张量与系统耦合：
$ delta _ epsilon = sum_( n , bold(q)) delta epsilon_ ( n , bold(q))^* a_ ( n , bold(q)) + delta epsilon_ ( n , bold(q)) a_ ( n , bold(q))^† comma delta _ t = sum_( n , bold(q)) delta t_ ( n , bold(q))^* a_ ( n , bold(q)) + delta t_ ( n , bold(q)) a_ ( n , bold(q))^† comma bold(delta) _l = sum_( n , bold(q)) delta bold(l)_ ( n , bold(q))^* a_ ( n , bold(q)) + delta bold(l)_ ( n , bold(q)) a_ ( n , bold(q))^† . $ <eqboscoupling>
耦合系数 $delta epsilon_ ( n , bold(q))$、$delta t_ ( n , bold(q))$、$delta bold(l)_ ( n , bold(q))$ 的具体形式留到下一节给出，这里先给出对任意玻色热浴都成立的一般结果。

为简便起见，把式 (S52) 的 $H _"eff,N"$ 中所有 $a_ ( n , bold(q))$ 的系数按式 (S71) 归并。系统–环境耦合哈密顿量为
$ tilde(H) _"eff,N" = tilde(M) _ epsilon delta _ epsilon + tilde(M) _ t delta _ t , $ <eqHNsimple>
其中 $tilde(M) _ epsilon = U _ bold(l)^† M _ epsilon U _ bold(l)$、$tilde(M) _ t = U _ bold(l)^† M _ t U _ bold(l)$，而
$ M _ epsilon = 1 / 2 cos ( 2 theta ) tau _z - 1 / 2 sin ( 2 theta ) tau _x + ( Delta bold(l) dot sigma ) / ( 2 Omega ) sin ( 2 theta ) mat( - sin ( 2 theta ) , - cos ( 2 theta ) ; - cos ( 2 theta ) , sin ( 2 theta ) ) $ <eqMeana>
$ M _ t = sin ( 2 theta ) tau _z + cos ( 2 theta ) tau _x + ( Delta bold(l) dot sigma ) / Omega sin ( 2 theta ) mat( cos ( 2 theta ) , - sin ( 2 theta ) ; - sin ( 2 theta ) , - cos ( 2 theta ) ) $ <eqMtana>
此外，$g$ 张量还可以被栅压调制，各通道参数见附表 S1。于是玻色热浴引起的栅压涨落与局域 $g$ 张量涨落的联系为
$ bold(delta) _l^i = mu _"B" bold(B) dot ( partial bold(g) _i / partial #vP2 times ( alpha _ 21 + alpha _ 11 ) / ( alpha _ 11 alpha _ 22 ) - partial bold(g) _i / partial #vP1 times 1 / alpha _ 11 ) delta _ epsilon , $ <eqgtmod>
它给失谐通道额外贡献一个跃迁分量 $tilde(M) _ bold(delta_l) = U _ bold(l)^† M _ bold(delta_l) U _ bold(l)$：
$ M _ bold(delta_l) = 1 / 2 mat( bar( bold(delta) _l ) dot bold(sigma) , sin ( 2 theta ) Delta bold(delta) _l dot bold(sigma) ; sin ( 2 theta ) Delta bold(delta) _l dot bold(sigma) , bold(delta) _l dot bold(sigma) ) . $ <eqMdeltaL>

下面会看到，在 FM 与小失谐区间里，栅压调制的 $g$ 张量噪声相比失谐与隧穿通道只是很小的贡献。到了大失谐区间——也就是回到 LD 量子比特极限——弛豫则由耦合到 Johnson–Nyquist 噪声源的栅压调制 $g$ 张量噪声通道主导。

设热浴处于占据数为 $N_ ( n , bold(q)) = ( e^( ℏ omega_ ( n , bold(q)) / k _"B" T ) - 1 )^(-1)$ 的热态，式 (S77) 的弛豫率就化成费米黄金规则（利用 $delta ( ℏ omega _i ) -> 1 / ℏ delta ( omega _i )$）：
$ W_ ( i j ) = W_ ( j -> i ) = ( 2 pi / ℏ ) sum_( nu , n , bold(q)) abs( delta_ ( n , bold(q)) )^2 abs( tilde(M)_ ( nu , i j ) )^2 [ N_ ( n , bold(q)) delta ( E _i - E _j - ℏ omega_ ( n , bold(q)) ) + ( 1 + N_ ( n , bold(q)) ) delta ( E _i - E _j + ℏ omega_ ( n , bold(q)) ) ] \ = 1 / ℏ^2 sum_ nu S_ nu ( omega_ ( i j ) ) abs( tilde(M)_ ( nu , i j ) )^2 \ comma W_ ( j i ) = W_ ( i -> j ) = W_ ( j -> i ) e^( ( E _i - E _j ) / k _"B" T ) , $ <eqratebosons>
在旋转波近似下（略去所有 $delta ( 2 omega_ ( i j ) +- omega_ ( n , bold(q)) )$ 项），式 (S78) 的功率谱密度为
$ S_ delta ( omega_ ( i j ) ) = 2 pi sum_( n , bold(q)) abs( delta_ ( n , bold(q)) )^2 [ N_ ( n , bold(q)) delta ( omega_ ( i j ) - omega_ ( n , bold(q)) ) + ( N_ ( n , bold(q)) + 1 ) delta ( omega_ ( i j ) + omega_ ( n , bold(q)) ) ] $ <eqSdelta>
于是
$ Gamma _1^ ( 1 ) = 1 / T _1^ ( 1 ) = ( 2 pi / ℏ ) coth ( Delta E / ( 2 k _"B" T ) ) sum_( nu , n , bold(q)) abs( delta_ ( n , bold(q)) )^2 abs( M_ ( nu , i j ) )^2 delta ( Delta E - ℏ omega_ ( n , bold(q)) ) , $ <eqG1one>
$ Gamma _1^ ( 2 ) = 1 / T _1^ ( 2 ) approx 2 e^( - Omega / ( k _"B" T ) ) ( 1 / ( W_ ( 1 3 )^(-1) + W_ ( 2 3 )^(-1) ) + 1 / ( W_ ( 1 4 )^(-1) + W_ ( 2 4 )^(-1) ) ) . $ <eqG1two>
最后这个近似用到的事实是：本实验中热能量 $k _"B" T$ 高于 Zeeman 劈开，但并不大于轨道能量 $Omega$。上式说明，二阶衰减率随轨道能量按指数被压低。

== 声子

现在显式估算声子引起的耦合 $delta epsilon_ ( n , bold(q))$ 与 $delta t_ ( n , bold(q))$。声子热浴通过电荷自由度与系统耦合：
$ H _"ph-charge" = i sum_( n , bold(q)) C_ ( n , bold(q)) ( Phi_n ( bold(q) ) e^( i bold(q) dot bold(r) ) a_ ( n , bold(q)) - Phi_n^* ( bold(q) ) e^( - i bold(q) dot bold(r) ) a_ ( n , bold(q))^† ) , $ <eqHphcharge>
其中，对一个沿 $z$ 受限、纯重空穴（HH）态耦合的、波矢为 $bold(q)$、偏振为 $bold(c)_n$ 的三维声子，其势为 @PhysRevLett_95_076805
$ Phi_n ( bold(q) ) = ( a + b / 2 ) bold(q) dot bold(c)_n - 3 / 2 b q _z ( bold(c)_n ) _z , $ <eqPhin>
归一化系数为
$ C_ ( n , bold(q)) = sqrt( ℏ / ( 2 rho V omega_ ( n , bold(q)) ) ) . $ <eqCnq>
这里 $V$ 是样品体积，$rho$ 是质量密度，$a$、$b$ 是形变势；我们忽略形变势的各向异性。

体材料声子共有三支：一支纵波，速度 $v _l = sqrt( ( lambda + 2 mu ) / rho )$、偏振 $bold(c) _l = bold(q) / q = ( sin Theta sin Phi , sin Theta cos Phi , cos Theta )$；两支横波，速度 $v _t = sqrt( mu / rho )$、偏振 $bold(c) _ ( t 1) perp bold(q)$（例如 $(- cos Phi , sin Phi , 0 )$）以及 $bold(c) _ ( t 2) = bold(c) _ ( t 1) times bold(q) = ( cos Theta sin Phi , cos Theta cos Phi , - sin Theta )$ @PhysRevB_84_195314。对 $bold(q)$ 采用球坐标后
$ Phi_l ( bold(q) ) = q [ ( a + b / 2 ) - 3 / 2 b cos ( Theta )^2 ] comma Phi_ ( t 1) ( bold(q) ) = 0 comma Phi_ ( t 2) ( bold(q) ) = Phi_t ( bold(q) ) = 3 b / 4 q sin ( 2 Theta ) , $ <eqPhil>
因此只有两支声子模式参与耦合。

在双量子点里，对失谐与隧穿的耦合为
$ H _"ph-DQD" = 1 / 2 tau _z sum_( n , bold(q)) ( delta epsilon_ ( n , bold(q)) a_ ( bold(q) , n ) + delta epsilon_ ( n , bold(q))^* a_ ( bold(q) , n )^† ) + tau _x sum_( n , bold(q)) ( delta t_ ( n , bold(q)) a_ ( bold(q) , n ) + delta t_ ( n , bold(q))^* a_ ( bold(q) , n )^† ) $ <eqHphDQD>
其中
$ delta epsilon_ ( n , bold(q)) = Phi_n ( bold(q) ) C_ ( n , bold(q)) [ ⟨ psi _L | e^( i bold(q) dot bold(r) ) | psi _L ⟩ - ⟨ psi _R | e^( i bold(q) dot bold(r) ) | psi _R ⟩ ] , $ <eqdepsilonph>
$ delta t_ ( n , bold(q)) = Phi_n ( bold(q) ) / 2 C_ ( n , bold(q)) [ ⟨ psi _L | e^( i bold(q) dot bold(r) ) | psi _R ⟩ + ⟨ psi _R | e^( i bold(q) dot bold(r) ) | psi _L ⟩ ] . $ <eqdtph>
这里忽略了声子经由 $g$ 张量的电可调性对自旋自由度的直接耦合。

为简单起见，假设两个量子点是全同的各向同性高斯波包，宽度为 $l$、彼此平移 $+- d / 2$，重叠积分 $s = e^( - d^2 / ( 4 l^2 ) ) << 1$，于是
$ delta epsilon_ ( n , bold(q)) approx 2 C_ ( n , bold(q)) Phi_n ( bold(q) ) e^( - q^2 l^2 / 4 ) sin ( q d / 2 sin Theta sin Phi ) , $ <eqdephapp>
$ delta t_ ( n , bold(q)) approx C_ ( n , bold(q)) Phi_n ( bold(q) ) s e^( - q^2 l^2 / 4 ) . $ <eqdtphapp>
把式 (S100)、(S101) 与式 (S89) 合起来，跃迁率可以写成
$ W_ ( i j ) = abs( tilde(M)_ ( epsilon , i j ) )^2 sum_n ( gamma _ epsilon )_ ( i j )^n + abs( tilde(M)_ ( t , i j ) )^2 sum_n ( gamma _ t )_ ( i j )^n , $ <eqWij>
其中
$ ( gamma _ epsilon )_ ( i j )^n = ( 2 pi / ℏ ) sum_ bold(q) abs( delta epsilon_ ( n , bold(q)) )^2 [ N_ ( n , bold(q)) delta ( E _i - E _j - ℏ omega_ ( n , bold(q)) ) + ( 1 + N_ ( n , bold(q)) ) delta ( E _i - E _j + ℏ omega_ ( n , bold(q)) ) ] $ <eqgeps>
$ ( gamma _ t )_ ( i j )^n = ( 2 pi / ℏ ) sum_ bold(q) abs( delta t_ ( n , bold(q)) )^2 [ N_ ( n , bold(q)) delta ( E _i - E _j - ℏ omega_ ( n , bold(q)) ) + ( 1 + N_ ( n , bold(q)) ) delta ( E _i - E _j + ℏ omega_ ( n , bold(q)) ) ] . $ <eqgt>
利用 $sum_q -> V / ( 2 pi )^3 integral q^2 sin ( theta _q ) d q d theta _q d phi _q$、$omega_ ( n , bold(q)) = v _n q$、$N ( omega_ ( n , bold(q)) ) = N_ ( n , bold(q))$、$ℏ omega_ ( i j ) = E _i - E _j$ 以及 $q_ ( i j )^n = omega_ ( i j ) / v _n$，得到
$ ( gamma _ epsilon )_ ( i j )^n = ( q_ ( i j )^n )^2 e^( - ( q_ ( i j )^n )^2 l^2 / 2 ) / ( 2 rho pi^2 ℏ omega_ ( i j ) v _n ) [ N ( omega_ ( i j ) ) Theta ( omega_ ( i j ) ) + ( 1 + N ( omega_ ( j i ) ) ) Theta ( omega_ ( j i ) ) ] \ integral d theta _q d phi _q abs( Phi_n ( q_ ( i j )^n , theta _q ) )^2 sin theta _q sin^2 ( q_ ( i j )^n d / 2 sin theta _q sin phi _q ) \ approx ( q_ ( i j )^n )^2 e^( - ( q_ ( i j )^n )^2 l^2 / 2 ) / ( 2 rho pi^2 ℏ omega_ ( i j ) v _n ) [ N ( omega_ ( i j ) ) Theta ( omega_ ( i j ) ) + ( 1 + N ( omega_ ( j i ) ) ) Theta ( omega_ ( j i ) ) ] I _ epsilon^n , n in { l , t 2 } $ <eqgammae>
$ ( gamma _ t )_ ( i j )^n = s^2 ( q_ ( i j )^n )^2 e^( - ( q_ ( i j )^n )^2 l^2 / 2 ) / ( 8 rho pi^2 ℏ omega_ ( i j ) v _n ) [ N ( omega_ ( i j ) ) Theta ( omega_ ( i j ) ) + ( 1 + N ( omega_ ( j i ) ) ) Theta ( omega_ ( j i ) ) ] \ integral d theta _q d phi _q abs( Phi_n ( q_ ( i j )^n , theta _q ) )^2 sin theta _q \ approx s^2 ( q_ ( i j )^n )^2 e^( - ( q_ ( i j )^n )^2 l^2 / 2 ) / ( 8 rho pi^2 ℏ omega_ ( i j ) v _n ) [ N ( omega_ ( i j ) ) Theta ( omega_ ( i j ) ) + ( 1 + N ( omega_ ( j i ) ) ) Theta ( omega_ ( j i ) ) ] I _ t^n , n in { l , t 2 } , $ <eqgammat>
其中阶跃函数 $Theta ( omega )$ 定义为
$ Theta ( x ) = cases( 1 quad "if " x > 0, 0 quad "if " x < 0 ) . $ <eqthetafn>
每个积分都有解析表达式：
$ I _ epsilon^l = ( pi x _l^2 / d^2 ) [ a^2 ( 2 - 2 J _0 ( x _l ) ) + a b ( 6 J _1 ( x _l ) / x _l - 2 J _0 ( x _l ) ) + b^2 ( - J _0 ( x _l ) / 2 + 3 J _1 ( x _l ) / x _l - 27 J _2 ( x _l ) / ( 2 x _l^2 ) + 2 / 5 ) ] \ comma I _ epsilon^ ( t 2) = ( pi x _t^2 / d^2 ) b^2 ( 3 / 5 - 9 J _1 ( x _t ) / ( 2 x _t ) + 27 J _2 ( x _t ) / ( 2 x _t^2 ) ) , $ <eqphondi>
以及
$ I _ t^l = 4 pi ( 5 a^2 + b^2 ) x _l^2 / ( 5 d^2 ) comma I _ t^ ( t 2) = 6 pi b^2 x _t^2 / ( 5 d^2 ) , $ <eqphontr>
这里 $x _l = d omega_ ( i j ) / v _l$、$x _t = d omega_ ( i j ) / v _t$，$J _n$ 是 $n$ 阶贝塞尔函数。

#figure(
  image("fig/Figure_S_phonon_rate.pdf", width: 88%),
  caption: [
    #text(weight: "bold")[附图 S11　]声子浴下各能级的激发率与弛豫率：#text(weight: "bold")[a.] 是失谐通道，按式 (S105) 计算；#text(weight: "bold")[b.] 是隧穿通道，按式 (S106) 计算。
  ],
)

用来估算声子诱导能级跃迁率（式 (S105)、(S106)）的参数如下。空穴–声子耦合由价带绝对形变势与剪切形变势决定，分别取 $a _v = 2.1$ eV @PhysRevB_85_205308 与 $b = -2.32$ eV @guilloy2016germanium。由锗的弹性常数经 Voigt–Reuss–Hill 近似 @voigt1928lehrbuch @reuss1929berechnung @hill1952elastic 估计的拉梅常数为（$c_ ( 1 1 ) = 126$ GPa、$c_ ( 1 2 ) = 44$ GPa、$c_ ( 4 4 ) = 67.7$ GPa）$lambda = 34.4$ GPa、$mu = 55.4$ GPa。再取锗的密度 $rho = 5330$ kg/m³ @madelung2004semiconductors，得到纵、横声速 $c _l = sqrt( ( lambda + 2 mu ) / rho ) = 5220$ m/s、$c _t = sqrt( mu / rho ) = 3230$ m/s。双量子点几何取点间距离 $d = 100$ nm、特征点宽 $l_ "dot" = 55$ nm。声子热浴的有效温度取 $T_ "ph" = 20$ mK。此外，自旋–轨道旋转与有效磁场取向由角度 $theta_ "so" approx 14.7$°、$theta _n approx 78.3$°、$phi _n approx - 33.7$° 给出。

声子诱导的能级跃迁率画在附图 S11。在 FM 量子比特频率附近（$omega_ ( i j ) < 1$ GHz），两个通道的激发与弛豫速率都彼此相当，说明系统浸在一个被热占据的声子浴里。频率更高时，弛豫比激发大好几个数量级，这正是自发辐射与细致平衡的结果。

== Johnson 噪声

下面考虑热光子诱导的弛豫。式 (S102) 里的跃迁矩阵 $tilde(M)$ 与声子情形完全相同，只是能级跃迁率换成
$ ( gamma _ nu )_ ( i j ) = S_ nu ( omega_ ( i j ) ) / ℏ^2 = abs( alpha _ nu )^2 / ℏ^2 times 2 pi [ abs( delta ( omega_ ( i j ) ) )^2 N ( omega_ ( i j ) ) Theta ( omega_ ( i j ) ) + abs( delta ( omega_ ( j i ) ) )^2 ( N ( omega_ ( j i ) ) + 1 ) Theta ( omega_ ( j i ) ) ] . $ <eqjohnsonrate>
这里考虑的是通过顶栅涨落与系统耦合的一般玻色热浴，各通道 $nu in { t , epsilon }$ 的电压涨落幅度 $delta$ 相同，描述的正是栅压起伏对失谐与隧穿的平移作用 (S83)。杠杆臂 $alpha _ nu$ 由实验提取。

Johnson–Nyquist 噪声的非对称功率谱密度为
$ S_ ( j n , nu ) ( omega_ ( i j ) ) = 2 abs( alpha _ nu )^2 R _J [ ℏ omega_ ( i j ) N ( omega_ ( i j ) ) Theta ( omega_ ( i j ) ) + ℏ omega_ ( j i ) ( N ( omega_ ( j i ) ) + 1 ) Theta ( omega_ ( j i ) ) ] , $ <eqjnsymmetric>
当 $omega_ ( i j ) = - omega_ ( j i ) > 0$ 时它就等价于标准的对称 Johnson–Nyquist 谱：
$ S_ ( V V ) ( omega_ ( i j ) ) = S_ nu ( omega_ ( i j ) ) + S_ nu ( omega_ ( j i ) ) = 2 abs( alpha _ nu )^2 R _J [ ℏ omega_ ( i j ) N ( omega_ ( i j ) ) + ℏ omega_ ( i j ) ( N ( omega_ ( i j ) ) + 1 ) ] \ = 2 abs( alpha _ nu )^2 R ℏ omega_ ( i j ) coth ( ℏ omega_ ( i j ) / ( 2 k _"B" T ) ) . $ <eqjnsym>
高温极限下这就是白噪声，
$ S_ ( V V ) ( omega_ ( i j ) ) = 4 alpha _ nu^2 R _J k _"B" T . $ <eqjnhighT>
Johnson–Nyquist 噪声的等效电阻由实验测得的热光子 PSD 换算而来，在 $T = 300$ mK 下给出 $R _J approx 250$ Ω。

#figure(
  image("fig/Figure_S_photon_rate.pdf", width: 88%),
  caption: [
    #text(weight: "bold")[附图 S12　]光子浴下各能级的激发率与弛豫率：#text(weight: "bold")[a.] 是失谐通道、#text(weight: "bold")[b.] 是隧穿通道，均按式 (S110) 计算。这里假设失谐与隧穿通道的杠杆臂相同（$alpha _t = alpha _ epsilon$）。
  ],
)

== 1/f 噪声

$1 / f$ 电荷噪声的功率谱密度为
$ S_ ( 1 / f ) ( omega_ ( n m ) ) = S_ ( 1 / f ) ( - omega_ ( n m ) ) = integral_ -infinity^ infinity d tau e^( - i omega_ ( n m ) tau ) ⟨ delta ( tau ) delta ( 0 ) ⟩ = A / abs( omega_ ( n m ) / ( 2 pi ) )^alpha , $ <eqonefpsd>
其中 $delta$ 取作经典涨落，$A$ 是 $1$ Hz 处的栅压涨落幅度，单位为 V²。

跃迁率公式 (S77) 对任意系统–环境耦合都成立，因此 $1 / f$ 电荷噪声对应的跃迁率为
$ W_ ( n m ) = abs( M_ ( epsilon , n m ) )^2 gamma _ epsilon ( omega_ ( n m ) ) + abs( M_ ( t , n m ) )^2 gamma _ t ( omega_ ( n m ) ) comma gamma _ nu ( omega_ ( n m ) ) = cases( abs( alpha _ epsilon )^2 S_ ( 1 / f ) ( omega_ ( n m ) ) / ℏ^2 quad nu = epsilon, abs( alpha _ t )^2 S_ ( 1 / f ) ( omega_ ( n m ) ) / ℏ^2 quad nu = t ) . $ <eqonefrate>
零失谐处拟合出的指数为 $alpha = 1$，换算到能量之后实验给出的 PSD 为 $alpha _ epsilon^2 S_ ( 1 / f^1.3 ) = 2 times 10^(-12)$ eV²/Hz。与隧穿相关的 $1 / f$ 噪声通道实验没有测到，故略去。需要强调，本套实验装置无法测量高频段的 PSD，因而只能借助式 (S115) 把 PSD 外推到量子比特频率；这样的外推可能高估 PSD，从而也高估 $1 / f$ 电荷噪声诱导的弛豫率。

== 不同弛豫机制的比较

#figure(
  image("fig/Figure_S8.pdf", width: 80%),
  caption: [
    #text(weight: "bold")[附图 S13　]一阶弛豫率 #text(weight: "bold")[a.] 与二阶弛豫 #text(weight: "bold")[b.] 随 $abs( #bB )$ 的变化，包含 $Gamma _ ( 1 / f )^ ( 1 )$、$Gamma _ ( j n )^ ( 1 )$ 与 $Gamma _ ( p h )^ ( 1 )$ 三个主要弛豫源。计算用式 (S91)、(S92)，各能级跃迁率分别取自式 (S115)、(S110) 与 (S105)。
  ],
)

#figure(
  image("fig/Figure_S9.pdf", width: 88%),
  caption: [
    #text(weight: "bold")[附图 S14　]一阶弛豫率 #text(weight: "bold")[a.] 与二阶弛豫 #text(weight: "bold")[b.] 随 $t _c$ 的变化，包含 $Gamma _ ( 1 / f )$、$Gamma _ ( j n )$ 与 $Gamma _ ( p h )$ 三个主要弛豫源。计算用式 (S91)、(S92)，各能级跃迁率分别取自式 (S115)、(S110) 与式 (S105)、(S106)。
  ],
)

我们在低量子比特频率下讨论 FM 工作点 $#epsi = 0$ 处各类噪声源的一阶与二阶弛豫过程的磁场依赖，结果汇总在附图 S13。

首先，对所有噪声源，二阶弛豫过程都正比于 $B^2$。原因是二阶过程只涉及成键与反键态之间的自旋翻转。按式 (S89) 的费米黄金规则，跃迁频率可很好地近似为 $ℏ omega_ ( i j ) = 2 t _c +- Delta E _"FM" approx 2 t _c$。磁场依赖来自两个量子点之间随 $B$ 变化的 Larmor 矢量梯度，它中介了自旋翻转，从而在式 (S64)–(S67) 与式 (S60)–(S63) 中给出非零矩阵元。还要注意：在零失谐点，失谐弛豫通道 $tilde(M) _ epsilon$（式 (S64)–(S67)）只允许一阶过程，而隧穿弛豫通道 $tilde(M) _ t$（式 (S60)–(S63)）只允许二阶弛豫过程。

一阶弛豫过程里，不同噪声源的磁场依赖各不相同。先考虑两个弛豫通道，每个通道含两支声子模式。把式 (S105)、(S106)、(S108) 与 (S109) 合起来，失谐声子通道 $gamma _ epsilon$ 给出 $Gamma _ ( p h , epsilon )^ ( 1 ) prop B^6$ 的依赖，隧穿声子通道 $gamma _t$ 给出 $Gamma _ ( p h , t )^ ( 1 ) prop B^4$，其中 $B^2$ 的因子来自两个通道各自的矩阵元 $abs( tilde(M) )^2$：
$ ( gamma _ epsilon )_ ( i j )^l approx d^2 k _"B" T_ "ph" ( 35 a^2 + 14 a b + 5 b^2 ) omega_ ( i j )^4 / ( 210 pi rho ℏ^2 v _l^7 ) \ comma ( gamma _ epsilon )_ ( i j )^t approx 3 b^2 d^2 k _"B" T_ "ph" omega_ ( i j )^4 / ( 70 pi rho ℏ^2 v _t^7 ) \ comma ( gamma _ t )_ ( i j )^l approx s^2 k _"B" T_ "ph" ( 5 a^2 + b^2 ) omega_ ( i j )^2 / ( 10 pi rho ℏ^2 v _l^5 ) \ comma ( gamma _ t )_ ( i j )^t approx 3 b^2 s^2 k _"B" T_ "ph" omega_ ( i j )^2 / ( 20 pi rho ℏ^2 v _t^5 ) $ <eqgammaphonon>
Johnson–Nyquist 噪声在高温极限（$E _z << k _"B" T$）下是白噪声，失谐与隧穿通道在高温下的跃迁率式 (S110) 为
$ gamma _ epsilon = 2 alpha _ epsilon^2 k _"B" R T / ℏ^2 comma gamma _ t = 2 alpha _ t^2 k _"B" R T / ℏ^2 , $ <eqgammajohnson>
说明量子比特子空间里的能级跃迁率与频率无关。对轨道能量而言，Johnson–Nyquist 噪声不再是白噪声（$Omega >> k _"B" T$），但同样不依赖磁场。计入矩阵元贡献的 $B^2$ 后，Johnson–Nyquist 噪声诱导的一阶与二阶弛豫都呈 $Gamma _ ( j n )^ ( 1 ) prop B^2$ 依赖。

式 (S114) 与 (S115) 里的 $1 / f$ 电荷噪声谱给出 $S_ ( 1 / f ) prop 1 / B^alpha$，其中 $alpha$ 拟合为 $1$，因此一阶弛豫过程呈 $Gamma _ ( 1 / f )^ ( 1 ) prop B$ 依赖。

实验中看到的是清晰的 $Gamma _1 = Gamma _1^ ( 1 ) + Gamma _1^ ( 2 ) prop B^2$ 关系（主文 @fig5 d）。仅凭这一磁场依赖，可以判断占主导的噪声源要么是二阶声子过程，要么是一阶与二阶 Johnson–Nyquist 噪声的组合。但附图 S13 显示，在低温（$T_ "ph" = 20$ mK）与低场（$B = 5$ mT）下，无论一阶还是二阶过程，声子贡献都比 Johnson–Nyquist 噪声低好几个数量级。因此更可能主导弛豫的是 Johnson–Nyquist 噪声而非声子。

#figure(
  image("fig/Figure_S16.pdf", width: 88%),
  caption: [
    #text(weight: "bold")[附图 S15　]#text(weight: "bold")[a.] 失谐通道、#text(weight: "bold")[b.] 隧穿通道与 #text(weight: "bold")[c.] $g$ 张量调制通道的跃迁矩阵元。#text(weight: "bold")[a.]、#text(weight: "bold")[b.] 中把式 (S60)–(S67) 的解析表达式与数值结果 $tilde(M) _t = U _q^† M _t U _q$、$tilde(M) _ epsilon = U _q^† M _ epsilon U _q$ 作了对比。#text(weight: "bold")[c.] 只给出数值结果：其解析式很长，而且在 FM 区间里 $g$ 张量调制通道相对另外两个通道的贡献可以忽略。
  ],
)

#figure(
  image("fig/Figure_S17.pdf", width: 88%),
  caption: [
    #text(weight: "bold")[附图 S16　]#text(weight: "bold")[a.] 一阶过程、#text(weight: "bold")[b.] 二阶过程与 #text(weight: "bold")[c.] 总过程的弛豫率。
  ],
)

要判断究竟是一阶还是二阶弛豫过程占主导，还可以从主文 @fig5 e 再取一条证据：随着隧穿耦合增大，磁场依赖变成 $Gamma _1 prop B$，说明在大 $t _c$ 处 $T _1$ 受 $1 / f$ 电荷噪声限制。

道理如下。我们按隧穿耦合 $t _c$ 逐一考察不同噪声源的弛豫率。对所有的一阶过程，PSD 与 $t _c$ 无关，而矩阵元按式 (S86)、(S85) 与式 (S59) 正比于 $t _c^(-1)$，因此全部一阶弛豫过程都给出 $Gamma^ ( 1 ) prop t _c^(-2)$。对玻色热浴，玻色 PSD 与 $t _c$ 之间是多项式关系，形式与它对磁场的依赖类似；但由于细致平衡，二阶弛豫过程会被到高能轨道的能隙指数压低，$Gamma _1 prop e^( - 2 t _c / k _"B" T )$，见式 (S91)、(S92)。$1 / f$ 电荷噪声在 $t _c / h = 11$ GHz 处大概可以忽略；不过若仍按一个在高频段不可忽略的 $1 / f^alpha$ 谱来贸然外推，就会得到 $Gamma _1 prop t _c^ ( - 2 - alpha )$ 的关系。

因此，如果低 $t _c$ 下系统的 $T _1$ 只受一阶 Johnson–Nyquist 噪声限制，就不该看到磁场依赖从 $prop B^2$ 随 $t _c$ 增大而过渡到 $prop B$——因为 $1 / f$ 电荷噪声与 Johnson–Nyquist 噪声都按 $t _c^2$ 被压低。能同时解释主文 @fig5 d 与 @fig5 e 两个趋势的合理说法，是存在一个不可忽略的二阶弛豫过程。

支持二阶弛豫的进一步证据是：$T _1$ 随失谐呈现峰–谷结构，见附图 S17 b、主文 @fig5 f 与附图 S15。在 $#epsi < 2 t _c$ 范围内，由式 (S60)–(S63) 与 (S64)–(S67) 可得量子比特子空间的两个跃迁矩阵元
$ abs( tilde(M)_ ( epsilon , 1 2 ) ) = 2 t _c^2 abs( Delta bold(l)_ perp ) / Omega^3 comma abs( tilde(M)_ ( t , 1 2 ) ) = 2 t _c abs( #epsi ) abs( Delta bold(l)_ perp ) / Omega^3 $ <eqM12>
由于 $1 / Omega^3$ 的压低，它们在这一区间内的变化不到一个数量级。所以，如果零失谐点由一阶过程主导，我们就不该看到 $Gamma _1^ ( 1 ) prop ( 2 t _c^2 + t _c #epsi ) abs( Delta bold(l)_ perp ) / Omega^3$ 在稍微失谐处掉一个数量级。再看二阶矩阵元，
$ abs( tilde(M)_ ( epsilon , 1 4 ) ) = t _c abs( #epsi ) / ( 2 Omega^2 ) times E _( z , 1 ) E _( z , 2 ) sin theta _12 / ( Delta E Delta bar(E) ) comma abs( tilde(M)_ ( t , 1 4 ) ) = #epsi^2 / ( 2 Omega^2 ) times E _( z , 1 ) E _( z , 2 ) sin theta _12 / ( Delta E Delta bar(E) ) + 4 t _c^2 abs( Delta bold(l)_ perp ) / Omega^3 . $ <eqM14second>
先回顾一点：只有在 $#epsi = 0$ 处允许二阶弛豫的是隧穿通道。还要看到，二阶矩阵元的分母只按 $prop 1 / Omega^2$ 压低，这意味着轻微的失谐就会把二阶弛豫通道打开，从而产生附图 S16、主文 @fig5 与附图 S17 b 中观察到的双谷。

#figure(
  image("fig/Figure_S7_T1_sweetline.png", width: 88%),
  caption: [
    #text(weight: "bold")[附图 S17　]#text(weight: "bold")[a.] $#epsi = 0$ 处 FM 量子比特的弛豫时间 $T _1$ 随 $phi _"avg"$ 与 $theta _"avg"$ 的分布。$T _1$ 甜线（黑色虚线）由一阶过程式 (S59) 与二阶过程式 (S69) 共同决定，做法是对每个给定的 $phi _"avg"$ 求 $sin ( theta _12 )$ 取极小的方向。$T _2^*$ 甜线（白色虚线）由式 (S58) 算出。
    #text(weight: "bold")[b.] 沿 #bhat3 方向磁场（附图对应主文 @fig3 a 中的绿点）下 $T _1$ 随 $#epsi$ 的变化，按式 (S82) 计算；虚线是用式 (S115)（$1 / f$ 噪声）估计的能级跃迁率，实线是分别用式 (S105)、(S106) 与 (S110)（玻色热浴）估计的能级跃迁率。
  ],
)

附图 S17 a 给出同时计入一阶与二阶弛豫过程后算得的 $T _1$。$T _1$ 与 $T _2^*$ 甜线分别是图上的黑色与白色虚线。$T _1$ 甜线对应这样的磁场方向：两个量子点里 LD 量子比特的 Larmor 矢量 $bold(l) _i$ 之间的倾角 $theta _12$ 最小。要强调的是，这是同时对一阶与二阶弛豫都成立的全球甜线。相比之下，$T _2^*$ 甜线是那些让两个 Larmor 矢量的长度（即 Zeeman 能）相等的磁场方向的集合。就本文研究的体系而言，不存在能让 $T _1$ 与 $T _2^*$ 甜线重合的磁场方向。不过在低磁场工作区间，我们发现在 $T _2^*$ 甜线上工作时，$T _1$ 并不是 $T _2^*$ 与 $T _2^"Hahn"$ 的主要限制因素。

此外，附图 S17 b 给出沿 #bhat3 方向磁场（见主文 @fig3 a）下算得的 $T _1$ 随 $#epsi$ 的变化，实线（虚线）对应计入玻色热浴噪声（$1 / f$ 电荷噪声）的结果。这里用的电荷噪声幅度取自「CPMG 噪声谱」一节的 PSD 测量。虽然计算表明 $#epsi = 0$ 处的弛豫由 $1 / f$ 电荷噪声主导，但主文 @fig5 d 中观察到的 $T _1 prop 1 / B^2$ 标度说明弛豫实际上由二阶过程决定，而非 $1 / f$ 电荷噪声。我们把这一分歧归因于「CPMG 噪声谱」一节提取电荷噪声幅度时的不确定性，有待进一步细致研究。
