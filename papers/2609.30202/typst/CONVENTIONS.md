# 2609.30202 译本排版约定（lane-B，前缀 `_b`）

原文：`papers/2609.30202/prx_arXiv.tex`（revtex4-1，`[reprint,prl,aps]`，主文 23 页含补充材料）。
标题：*Incipient superconductivity and tunable Chern insulators in twisted Bernal
bilayer-trilayer graphene*。中文标题定译：**扭曲 Bernal 双层–三层石墨烯中的初发超导与可调 Chern 绝缘体**。

---

## 1. 分片契约（每个子代理必须严格遵守）

1. 只写自己那一个 `frag_N.typ`，放在 `papers/2609.30202/typst/`。不许碰别的文件。
2. 文件第一行必须是 `#import "macros.typ": *`（`#include` 不继承宿主作用域）。
3. 输出**纯 Typst 内容**，不要写 `#set`、不要写文档骨架、不要写 `\begin{document}` 之类的残留。
4. 段落之间空一行。章节标题用 `= 标题` / `== 标题`；原文的行首粗体小标题
   （`\medskip\noindent\textbf{...}`、Methods 里的 `\textbf{Device fabrication.}`）
   一律用 `#runin[标签：]` 接在同一段正文**前面**，不要写成 `==` 标题。
5. 引用文献写 `@key`，key 必须与 `refs.bib` 逐字节一致；`@key` 后面**必须**紧跟标点或空格，
   绝不能直接接汉字（会把汉字吞进标签）。
6. 交叉引用是**字面文本**：写"图 1a""图 S3(c)""表 S1"，不要写 `@fig:1`（本稿编号不走 counter）。
7. 临时试编译文件用 `_bN_` 前缀（例如 `_b3_typ.typ`），不要占用别人的前缀，交付前自己删掉。
8. 数学一律进 `$...$`。本稿**没有编号公式**，原文所有关系式都是行内的；
   如果某条行内式确实长到必须独立成行，用 `#align(center)[ $...$ ]`，不要编号。

## 2. 编号权威（取自本地 `pdflatex` 编译的 `prx_arXiv.aux`）

| tex 标签 | 渲染编号 | 所在页 | 图文件名（`figs/` 下，矢量 PDF 直接嵌） |
| --- | --- | --- | --- |
| fig:1 | 图 1 | 2 | `Fig1_092426.pdf` |
| fig:2 | 图 2 | 3 | `Figure2.pdf` |
| fig:3 | 图 3 | 4 | `Figure3v2.pdf` |
| fig:4 | 图 4 | 5 | `Fig4_092426.pdf` |
| fig:S_gatemaps | 图 S1 | 11 | `EDAllGGmaps_092226.pdf` |
| fig:S_fractional | 图 S2 | 12 | `EDFractionalStates.pdf` |
| fig:S_addfans | 图 S3 | 12 | `S3Additional1p18ChernStates_092326.pdf` |
| fig:S_D2fans | 图 S4 | 13 | `EDDW1p33MRI_092426.pdf` |
| fig:S_D2VTI | 图 S5 | 14 | `ED1p33VTI.pdf` |
| fig:S_1degree | 图 S6 | 15 | `ED1p05degree.pdf` |
| fig:S_HaloLandauFans | 图 S7 | 16 | `EDHaloLFs.pdf` |
| fig:S_SC1DRT | 图 S8 | 16 | `1DRTinSC.pdf` |
| fig:S_D1contactpair2 | 图 S9 | 17 | `EDSecondContactSC_092026.pdf` |
| fig:S_TcFits | 图 S10 | 18 | `TcFitsExamplen1p55.pdf` |
| fig:S_TvsDJun21 | 图 S11 | 18 | `EDTvsDforanalysis.pdf` |
| fig:S_Hysteresis | 图 S12 | 19 | `EDHysteresis.pdf` |
| fig:S_dVdIconstD | 图 S13 | 19 | `EDdVdIconstantD.pdf` |
| fig:S_BparHaloEvolution | 图 S14 | 20 | `S_BparHaloEvolution_092326.pdf` |
| fig:S_TandBdepHalo | 图 S15 | 20 | `ED300mT400mK50mK.pdf` |
| fig:S_SCdVdI | 图 S16 | 21 | `dVdIinSC.pdf` |
| fig:S_anisotropic | 图 S17 | 22 | `EDnematic_091926.pdf` |
| fig:S_anisotropic_BparSensisitivity | 图 S18 | 22 | `FigS17v2_091926.pdf` |
| fig:S_Micrograph | 图 S19 | 23 | `OpticalMicrograph.pdf` |
| tab:chern_numbers | **表 S1** | 11 | —— |

**表与图各自独立计数**，所以"图 S1"和"表 S1"同时存在，不是笔误。
全文 `\begin{equation}` 计数为 0，没有任何编号公式。

## 3. 文献

`refs.bib` 已由 `_b_mkbib.py` 从 tex 内联的 `thebibliography` 生成，41 条，顺序即引用顺序
（revtex 数字风格按首次引用排序）。key 全部安全（不含 `/` 或 `:`），直接用 `@key`。
四条 APS/CPL 六位文章号（011015 / 197701 / 060716 / 011002）已放进 `issue` 而不是 `pages`。

## 4. Typst 0.15.1 已实测的坑（照抄，别再撞）

- `$"PF"_rad$` → unknown variable；多字母下标要写成 `$x_"abc"$`（下标也加引号）。
- `\epsilon` → "unknown variable: psilon"；`\xi`/`\nu` 静默降级成正体。
  **希腊字母一律不加反斜杠**：写 `epsilon`、`xi`、`nu`、`rho`、`sigma`、`Delta`、`Gamma`、`theta`、`phi`、`mu`、`alpha`、`approx`、`infty`。
  需要正体的希腊字母（如单位 mK 之类）用引号包：`$"mK"$`。
- 带下标的组合如 `\Bpar`/`\Bperp`/`\Idc` 是原文宏，本稿展开为 `$B_"par"$`、`$B_"perp"$`、`$I_"dc"$`。
- `#h(2em)[内容]` → unexpected argument；写 `#h(2em)内容`。
- `fig`/`tbl`/`figf` 的正文是**内容块**：`#figf("2")[ 图注 ][ 内容 ]`，不能写成 `]( ... )`。
- 内容模式里的裸 `<` `>` → unclosed label；数值不等式一律进数学：`$|C| > 0$`。
- `$"|" E "|"$` → unclosed delimiter；用内容模式 `|$E$|`。
- 行内数学里的 `/` 会立成上下堆叠分式并撑高行距（`over` 在 0.15.1 里不存在）。要线性写法一律用 `#sym.slash`：
  `$nu = 1 #sym.slash 2$`、`$d V #sym.slash d I$`、`$n (h #sym.slash e)$`。全稿已统一，勿再写裸 `/`。
- `%` 不是 markup 注释（`95%` 原样印出），注释只能用 `//`。
- `limits(int)` 不可用，写 `integral`。
- 相邻引用只能写成 `@a @b`，渲染成"[1] [2]"；这是全语料的既成风格，不改。

## 5. 术语定表（首次出现给英文，之后一律用中文）

| 英文 | 定译 |
| --- | --- |
| twisted Bernal bilayer-trilayer graphene | 扭曲 Bernal 双层–三层石墨烯 |
| Bernal / rhombohedral stacking | Bernal 堆叠 / 三方（菱面）堆叠 |
| incipient superconductivity | 初发超导 |
| Chern insulator | Chern 绝缘体 |
| Chern number | Chern 数 |
| quantum anomalous Hall (QAH) | 量子反常霍尔 |
| moiré filling factor | 莫尔填充因子 |
| displacement field | 位移场 |
| halo | 电阻晕（原文用 "halo" 指同位旋极化金属对应的高阻区域） |
| isospin polarization | 同位旋极化 |
| symmetry-broken metal | 对称性破缺金属 |
| correlated insulator | 关联绝缘体 |
| band insulator | 能带绝缘体 |
| Středa slope / trajectory | Středa 斜率 / 轨迹 |
| Landau fan (diagram) | 朗道扇图 |
| gate map | 栅压图 |
| critical temperature / current / field | 临界温度 / 临界电流 / 临界场 |
| Pauli limit | 泡利极限 |
| Fraunhofer-like modulation | 类弗劳恩霍夫调制 |
| weak link | 弱连接 |
| phase-coherent pairing | 相位相干的配对 |
| anomalous metal | 反常金属 |
| superfluid stiffness | 超流刚度 |
| flat band | 平带 |
| transition metal dichalcogenide (TMD) | 过渡金属硫族化合物 |
| hexagonal boron nitride (hBN) | 六方氮化硼 |
| dilution refrigerator | 稀释制冷机 |
| mixing chamber | 混合腔 |
| thermal cycle | 热循环 |
| lock-in | 锁相 |
| reactive ion etching | 反应离子刻蚀 |
| local anodic oxidation nanolithography | 局部阳极氧化纳米光刻 |
| polycarbonate / PDMS | 聚碳酸酯 / 聚二甲基硅氧烷 |
| Brown–Zak oscillations | Brown–Zak 振荡 |
| Luttinger volume | Luttinger 体积 |
| Ginzburg–Landau coherence length | 金兹堡–朗道相干长度 |
| electron ratchet | 电子棘轮 |
| layer screening | 层屏蔽 |
| Fermiology | 费米面分析 |
| charge neutrality | 电荷中性点 |
| two-terminal / four-terminal | 两端 / 四端 |

人名、材料缩写（hBN、PMMA、Cr/Au）、器件标号（D1–D4）、物理量符号（$\rho_"xx"$、$\rho_"xy"$、
$T_c$、$\nu$、$D$、$B_∥$、$B_⊥$）保持原文不译。

**风格硬要求**（用户既往反馈）：译文要摆脱翻译腔，句式灵活变通，别照着英文语序硬翻；
长定语从句拆成短句；"被""使得""为了""这一""值得注意"这类连接词能省则省；
每段都首行缩进（模板已设），图注/表注不缩进（宏里已处理）。

## 6. 分片表

| 片段 | tex 行范围 | 内容 |
| --- | --- | --- |
| frag_1 | 73–96 | 摘要（放进摘要框）+ 关键词行 + 引言 3 段（无标题）+ **图 1 图注**（tex 84–88） |
| frag_2 | 98–121 | `#runin[整数与分数填充下的 Chern 绝缘体]` 节 4 段 + **图 2 图注**（tex 105–108） |
| frag_3 | 123–163 | **图 3 图注**（tex 126–132）+ `#runin[从关联绝缘体到初发超导]` 节 3 段 |
| frag_4 | 145–191 | **图 4 图注**（tex 147–155）+ `#runin[绝缘体边界附近的最大 $T_c$]` 节 3 段 + `#runin[平行场稳定的配对与泡利极限突破]` 节 3 段 + `#runin[讨论]` 节 3 段 + Note added |
| frag_5 | 193–206 | 致谢 / 作者贡献 / 竞争利益 / 附加信息 / 数据可用性（**只这些，不含方法节**） |
| frag_6 | 463–550 | **补充图 S1–S10 图注** |
| frag_7 | 552–680 | **补充图 S11–S19 图注** + **表 S1**（12 列，含脚注标记与灰底单元格） |
| frag_8 | 439–458 | `= 方法`（8 个 `#runin` 块：器件制备 / 输运测量 / 栅压换算与对称化 / 扭转角标定 / 临界温度分析 / 费米面分析 / 1.33° 器件的反常磁滞 / 有限平行场测量） |

图的**图注**由各片段负责，图的**插入位置与外层包裹**由协调者（lane-B）在合并时统一处理；
所以子代理只需把图注正文译好，按下面格式单独成块交回：

```typst
#fig("1", breakable: false)[
  图注正文……
][
  #image("figs/Fig1_092426.pdf", width: 100%)
]
```

## 7. 自查（子代理交付前）

1. `typst compile --root 'E:/arxiv_paper_to_typst' _bN_typ.typ _bN_typ.pdf` 零错误零告警
   （自己建一个只含本片段的试编译壳）。
2. 逐行检查 `$` 与 `"` 配平。
3. 不许出现 `\` 开头的 LaTeX 命令、`$...$` 外的数学、`~`、`\\`。
4. 数字、单位、温度、场值、填充因子逐条与 tex 对一遍（这是最容易翻错的地方）。
