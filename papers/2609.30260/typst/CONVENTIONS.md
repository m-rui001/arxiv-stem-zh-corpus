# 2609.30260《投影非晶拓扑绝缘体》中文译本 · 施工约定

协调方（lane-B）文件。任何片段作者开工前先通读本文件。

## 1. 文件契约

- 原文：`papers/2609.30260/statistical_brane.tex`（468 行，revtex4-2 prl 双栏，已本地编译出
  `statistical_brane.pdf` 与 `.aux`，编号权威即此）。
- 每个作者**只写自己那一个** `papers/2609.30260/typst/frag_N.typ`，不许改 `main.typ`、
  `macros.typ`、`refs.bib`、`CONVENTIONS.md`、别人的 frag，也不许碰 `papers/` 下任何其他论文目录。
- 每个 frag **第一行之后必须自带** `#import "macros.typ": *`（Typst 的 `#include` 是独立作用域，
  片段看不到 `main.typ` 里的 import；漏了会报 `unknown variable: eqn`，无提示）。
- 图片路径相对 `typst/` 目录：`figs/lattice.pdf` 等四幅已就位，直接用 `#image(...)`。

分片与行号：

| frag | tex 行 | 内容 |
| --- | --- | --- |
| frag_1 | 91–114 | 摘要、`Introduction` 两段、图 1 |
| frag_2 | 123–159 | `Key results` 三段（含 145 那段长文）、图 2、图 3 |
| frag_3 | 167–206 | `Projected brane`：式 (1)–(5) 全部推导 |
| frag_4 | 209–232 | `Microscopic model`、图 4、232 那段 |
| frag_5 | 236–289 | `Results`：式 (6)–(8)、表 1、其后四段 |
| frag_6 | 292–301 | `Summary and discussions` 两段、数据可用性、致谢 |

## 2. 编号地图（全部烘焙成字面字符串，不走 counter）

`main.typ` 里 `#set heading(numbering: none)`，Typst 的元素没有 `number` 字段，**所有编号都要写死**。

**章节：原文没有编号章节**，小节是行首斜体标签。本译本用 `macros.typ` 的 `#runin` 宏排成
**粗体行首标签 + 同段正文**，标签与译名固定如下（后面跟中文句号）：

| tex 标签 | 本译本标签 |
| --- | --- |
| `{\it Introduction}` | `#runin[引言。]` |
| `{\it Key results}` | `#runin[关键结果。]` |
| `{\it Projected brane}` | `#runin[投影膜方法。]` |
| `{\it Microscopic model}` | `#runin[微观模型。]` |
| `{\it Results}` | `#runin[结果。]` |
| `{\it Summary and discussions}` | `#runin[小结与讨论。]` |
| `{\it Data availability}` | `#runin[数据可用性。]` |
| `{\it Acknowledgments}` | `#runin[致谢。]` |

摘要不用 runin，用 `#heading(outlined: false)[摘要]`（level-1，已有样式）。

**公式 (1)–(8)**，全局连续，编号一律 `#eqn("(n)")[ ... ]`（不编号的用 `#eqnb[...]`）：

| 号 | tex 位置 | 内容 | 备注 |
| --- | --- | --- | --- |
| (1) | 168–170 | 配分函数 $\mathcal Z=\int\mathcal D\Psi_1\cdots e^{-S}$ | 原文 `eqnarray` 单行 |
| (2) | 172–183 | 作用量 $S$ 的 2×2 矩阵形式 | 含 `\partial_\tau+H_{11}` 等 |
| (3) | 187–192 | $S=\sum_{\omega_n}\cdots$ 两行 `aligned`（`=` 对齐） | 原文在 `widetext` 里，本稿单栏正常排 |
| (4) | 194–199 | $S_{\rm eff}$ | 也在 `widetext` |
| (5) | 203–205 | $H_{\rm eff}=H_{11}-H_{12}H_{22}^{-1}H_{21}$ | **`\label{eq:Heff}`，正文有回引「式 (5)」** |
| (6) | 238–240 | 占据态投影算符 $P=\sum_{E_n<0}\ket n\bra n$ | |
| (7) | 242–244 | Bott 指标 $\mathcal B$ | |
| (8) | 249–251 | 局域陈标记 $\mathcal C(\vec r)$ | |

**图**（`#fig("n")[图注][内容]`，多面板传 `breakable: false`）：

| 号 | 文件 | 版式提示 |
| --- | --- | --- |
| 图 1 | `figs/lattice.pdf` | 宽高比 1.82，`width: 88%` |
| 图 2 | `figs/amorphous_phase_diagram_and_scaling.pdf` | 宽高比 2.76（很扁），`width: 100%` |
| 图 3 | `figs/bulk-boundary.png` | 12 面板大图，宽高比 1.14，`width: 100%`，**必须 `breakable: false`**，并建议包在 `#place(auto, float: true, clearance: 1.2em, ...)` 里，否则上一页底部会挖出大块空洞 |
| 图 4 | `figs/scaling_m_pm_1.pdf` | 2×2 面板，宽高比 1.375，`width: 96%`，`breakable: false` |

**表**：原文 `TABLE I` → 本稿作 **表 1**，用 `#tbl("1")[表注]( 内容 )`，三列 `$m_0/t_0$ & $x_c$ & $\nu$`，
五行数据见 tex 262–272 行（第四行含括号并列的 `+1.00` 数据，照排）。

**图注/表注里的交叉引用**：`图 1(a)`、`图 2(b)`、`式 (5)`、`表 1` 都写字面字符串。

## 3. 术语表（全稿统一，不许另造译名）

| 英文 | 定译 |
| --- | --- |
| projected amorphous topological insulator (PATI) | 投影非晶拓扑绝缘体（PATI） |
| strong / fragile PATI | 强 PATI / 脆弱 PATI |
| projected amorphous brane (PAB) | 投影非晶膜（PAB） |
| projected amorphous normal insulator (PANI) | 投影非晶普通绝缘体（PANI） |
| projected topological branes | 投影拓扑膜 |
| Bott index (BI) | Bott 指标（BI） |
| local Chern marker (LCM) | 局域陈标记（LCM） |
| translationally inert / active | 平移惰性 / 平移活跃 |
| normal insulator (NI) | 普通绝缘体（NI） |
| topological invariant | 拓扑不变量 |
| first Chern number | 第一陈数 |
| band inversion / band gap closing | 能带反转 / 能带隙闭合 |
| bulk-boundary correspondence | 体–边对应 |
| time-reversal symmetry breaking insulator | 破时间反演对称绝缘体 |
| Qi-Wu-Zhang model | Qi–Wu–Zhang 模型（连接号用 –） |
| parent crystal / parent lattice | 母晶体 / 母晶格 |
| amorphous lattice | 非晶晶格 |
| hopping amplitude | 跃迁振幅 |
| on-site (term) | 在位（项） |
| integrate out / project out | 积分掉 / 投影掉 |
| effective Hamiltonian | 有效哈密顿量 |
| in-gap (edge-)modes | 能隙内（边缘）模式 |
| open / periodic boundary conditions (OBC/PBC) | 开放 / 周期性边界条件（OBC/PBC） |
| joint local density of states (LDOS) | 联合局域态密度（LDOS） |
| critical concentration of sites $x_c$ | 临界位点占比 $x_c$ |
| fraction of sites $x$ | 位点占比 $x$ |
| average inter-site distance $\xi$ | 平均位点间距 $\xi$ |
| half-spectral gap $\Delta$ | 半谱隙 $\Delta$ |
| correlation length exponent $\nu$ | 关联长度指数 $\nu$ |
| quantum phase transition (QPT) | 量子相变（QPT） |
| single parameter scaling / data collapse | 单参数标度 / 数据坍缩 |
| configuration-averaged | 位形平均 |
| basin of attraction | 吸引域 |
| structural quantum Hall plateau transition | 结构型量子霍尔平台转变 |
| bootstrap method | 自助法（bootstrap） |
| Grassmann variables | Grassmann 变量 |
| Matsubara frequencies | Matsubara 频率 |
| partition function | 配分函数 |
| imaginary time | 虚时间 |
| inverse temperature $\beta$ | 逆温度 $\beta$ |
| lattice spacing $a$ / linear dimension $L$ | 晶格常数 $a$ / 线度 $L$ |
| point-like charge impurities | 点状电荷杂质 |
| bandwidth | 能带宽度 |
| designer quantum materials | 定制量子材料 |
| metamaterials | 超材料 |
| topolectrical circuits | 拓扑电路（topolectrical） |
| photonic / phononic lattices | 光子 / 声子晶格 |
| non-Hermitian topology | 非厄米拓扑 |
| Altland-Zirnbauer symmetry classes | Altland–Zirnbauer 对称性类 |
| higher-order / weak / crystalline topological insulators | 高阶 / 弱 / 晶体拓扑绝缘体 |
| quasicrystals / emergent crystals / fractal lattices | 准晶 / 涌现晶体 / 分形晶格 |
| site-localized atomic orbitals | 位点局域的原子轨道 |

首次出现的缩写：中文全称后带半角括号缩写，如「投影非晶拓扑绝缘体（PATI）」，此后直接用缩写。

## 4. Typst 0.15.1 写法要点（这些错**很多不报错**，只有看图才发现）

1. **每个 frag 自带 `#import "macros.typ": *`。**
2. 数学里没有 LaTeX 的 `\bb`、`\mu`、`angle.r`。双线体写 `bb(Z)`，希腊字母直接写 `mu`；
   Dirac 括号用**字面 Unicode**：`$|n⟩⟨n|$`（本仓库约定），不要写 `angle.r`。
3. 花体 `\\mathcal` → `cal(Z)`、`cal(B)`、`cal(C)`、`cal(D)`（`cal(...)` 是 Typst 内置）。
4. 向量 `\\vec{k}` → `bold(k)`；粗体矩阵/矢量同理 `bold(tau)`。
5. 多字母正体名用引号或 `op`：`$op("tr")$`、`$op("sgn")$`、`$op("Im")$`、`$op("Re")$`；
   宏里也给了 `#Tr`、`#Sgn`、`#ImOp` 可用。
6. 求和限：`$sum_(omega_n)$`；`\\sum_{\\omega_n}` 写成 `$sum omega_n$` 会跑错位置，用
   `$sum_ (omega_n)$` 或 `$limits sum_(omega_n)$` 前先自查。带上下限的大号求和要在 display 模式里
   `$ sum^inf_(n=-inf) $`。
7. 定界符缩放用 `lr(( ))`、`lr([ ])`、`big( )`；`\big(` → `big( )`。**不要写 `limits` 关键字在 `sum` 后面。**
8. `@key` 后**必须跟空格或中文标点**，否则紧跟的汉字被吸进引用键变成未知引用。
   原文 `\cite{a,b,c}` 一律写成并列 `@a @b @c`（ieee 样式下 `[@a, @b]` 会印成 `[[1], [2]]`）。
9. 引用键名与 tex 完全一致（注意键名与内容不符的坑：**`Fang2019` 的 bibitem 其实是 T. Zhang 等人的
   Catalogue 论文**，键名照用 `@Fang2019`，不要改成 `@Zhang2019`；`Fu2006` 条目正文年份是 2007）。
10. **相邻单字母变量之间要加空格**：`$m _0$`、`$t _0$` 里下标用 `_`，但 `$m_0/t_0$` 这种连着写的
    乘积 `t t_0` 会被并成一个符号组。$t=t_0=1$ 请写 `$t = t_0 = 1$`。
11. 区间、范围号用 en dash 或波浪：`$\nu \in (1.00, 1.46)$` 直接写 `$nu in (1.00, 1.46)$`。
12. 原文里的空格排版记号 `~`、`\`（换行）、`.it` 等丢掉即可；`\ld`（省略号）用 `……`。
13. 图/表/公式**编号写死**，别指望 counter。
14. 不要写 `#fig("3")[注](体)`（把 content 当函数调会报错）；用 `#fig("3")[注][体]` 或
    `#fig("3", [注], 体)`。

## 5. 文献编号的已记录取舍

原文 `thebibliography` 是手写编号，号 = **bibitem 定义顺序**；正文第 1 段引 `[1–7]` 后接
`[20–25]`，第 2 段才引 `[8–19]`，所以**定义顺序 ≠ 首引顺序**。Typst 的 `ieee` 样式按
**正文首次出现顺序**编号，于是本译本印出的文献号与原文 PDF 的号整体错位。这是**已知且接受**的
归一化（本语料所有稿件统一按首引顺序编号），核对时只看「键 ↔ 位置」是否一一对应，不看号。
作者只需把 `\cite{...}` 换成 `@键名`，不要手写任何文献号。

## 6. 译文文风（硬性要求）

- **去翻译腔**：句式按中文习惯重组，不必逐句对译；长英文句该断就断，主语该省就省。
  反面例子：「我们展示了……的事实」「这被证明为……」；正面例子：把被动改成主动、把
  "which" 从句拆成短句。
- 不遗漏、不注水：原文一句不删（包括脚注式补充、单位、数值、`t = t_0 = 1` 这类设定），
  也不自行加解释性内容。若要说明译法，用 `#note[...]`？—— 本稿**没有** `note` 宏，
  译注一律用行内 `（译注：……）`，且只在原文确有笔误或歧义时加。
- 术语严格按 §3，同一片段内同一个概念只允许一个译名。
- 数字、符号、单位照原文（`\%` → `%`，`15\%` → `15%`；`800 independent realizations` → `800 个独立位形`）。
- 正文段落之间空一行即可；段首缩进由全局设置负责，**不要**在 frag 里写 `#set par(first-line-indent:)`
  （会切断段落）。图注、表注里已经由宏关掉缩进。
- 人名、期刊名、模型名保留英文（Qi–Wu–Zhang、Bott、Chern、Grassmann、Matsubara、
  Altland–Zirnbauer 等）。

## 7. 交付给协调方之前自查

1. `cd papers/2609.30260/typst`（工作目录）后 `typst compile --root 'E:/arxiv_paper_to_typst' main.typ main.pdf`
   —— **注意：单编整个 main.typ 会因别人的 frag 还不存在而失败**，所以请自己造一个临时壳文件
   `_bN_typ.typ`（**N 是你被分配的编号**，你的所有临时件一律用 `_bN_` 前缀，免得互相覆盖），内容：
   ```
   #import "macros.typ": *
   #set page(paper: "a4", margin: (x: 2.4cm, y: 2.2cm))
   #set text(font: ("Noto Serif SC", "New Computer Modern"), size: 10pt, lang: "zh")
   #set par(justify: true, first-line-indent: (amount: 2em, all: true), spacing: 0.6em)
   #set heading(numbering: none)
   #set math.equation(numbering: none)
   #include "frag_N.typ"
   ```
   用 `typst compile --root 'E:/arxiv_paper_to_typst' _b1_typ.typ _b1_typ.pdf` 编译，**必须 0 error 0 warning**。
2. `pdftotext -layout _b_t_typ.pdf _b_t_typ.txt` 自查：公式编号 (1)…(8) 中该出现的出现且只出现一次；
   没有残留 `\command`、`$...$`、`{...}`、`&`；没有 `unknown`/`Error` 字样。
3. 数一遍中文字符量，与英文词数比应在 1.05–1.35 之间（太少＝漏译，太多＝注水）。
4. 临时文件（`.typ`/`.pdf`/`.txt`/`.png`）一律用分配给你的 `_bN_` 前缀，六个分片互不相同，
   免得互相覆盖；也不要写进 `papers/` 下别的目录。完工后把临时件留在 `papers/2609.30260/typst/`
   里即可，协调方会清理。
