# 2609.30228 中文译本工作约定

论文：*Global well-posedness and scattering for the three-dimensional focusing
energy-critical NLS* —— Qingtang Su（中国科学院数学与系统科学研究院 / 晨兴数学中心）、
Zehua Zhao（北京理工大学），arXiv:2609.30228v1，math.AP。
原文 `amsart` 11pt 单栏 **23 页**，**无图、无表、无补充材料**。中文 Typst 译本目标 20–24 页。

**任何分片作者：先看 §4 的 Typst 坑再动笔，编号一律从 §2 的地图里抄，不许自己数。**

---

## 1. 全局排版

- 主文件 `main.typ`，宏在 `macros.typ`，每个 `frag_N.typ` 第一行必须写
  `#import "macros.typ": *`（`#include` 不继承作用域，漏了会零告警地把 `#eqn` 当普通文本印出来）。
- A4 单栏，页边距 x 2.4 cm / y 2.2 cm，10 pt，`Noto Serif SC` + `New Computer Modern`。
- 每段都首行缩进 2 em（`first-line-indent: (amount: 2em, all: true)`），定理框与证明框内部关掉缩进。
- `#set heading(numbering: none)`：**一切编号都是写进稿子的字面字符串**，节标题也要写死，
  例如 `= 1　引言`、`= 1.1　主要结果`（节号与标题之间一个全角空格）。
- 引用：`@key`。带定位符时**方括号前不能有空格**——`@KVfocus[第 6 节]` 印成 `[18, 第 6 节]`，
  写成 `@KVfocus [第 6 节]` 会印成 `[18] [第 6 节]`。
- 参考文献 28 条，样式 `ieee`，按正文首引顺序编号（与原文 `thebibliography` 的字母序**不同号**，
  这是全语料的统一取舍；正文用 `@key` 所以指向的条目本身完全一致）。
- 编译：在 `papers/2609.30228/typst/` 下
  `typst compile --root E:/arxiv_paper_to_typst main.typ main.pdf`，**0 error / 0 warning 才算过**（无输出即无告警）。
- 渲染自检：`pdftoppm -r 110 -png main.pdf _bq`；要看清单页加 `-f 15 -l 15`；
  怀疑某个符号排错了用 `-r 220` 放大。临时文件一律 `_b` 前缀。

## 2. 编号地图（权威 = 本机 `pdflatex` 编译两遍出的 `src/arXiv.aux`）

- **84 条编号公式**：(1.1)–(1.11)、(2.1)–(2.14)、(3.1)–(3.12)、(4.1)–(4.36)、(5.1)–(5.11)。
- **12 项定理类**，与原文一样按节共用一个计数器：定理 1.1、定义 2.1、命题 2.2、命题 2.3、
  引理 2.4、引理 3.1、命题 3.2、引理 4.1、引理 4.2、引理 4.3、命题 4.4、命题 5.1。
- **未编号显示公式 80 处**（tex 里的 `\[ ... \]`）→ 一律用 `#eqnb[ $ ... $ ]`。
- `tex` 里**没有** `\label` 却编号的空环境，也没有"带 label 的 `equation*`"，
  所以本稿不存在"有 label 但无号"的特例。
- 写法：`#eqn("（4.17）")[ $ ... $ ]`（编号用全角括号，与语料一致）。
  正文交叉引用把号写死：`式 （4.17）`、`引理 4.1`、`第 3 节`。
- 一个 `gather`/`align` 里若有多个 `\label`，它们各占一个号，**必须拆成多个 `#eqn`**，
  号按地图分配；`gather`/`aligned` 只是排版不换号时，合并进一个 `#eqnb` 里用 `$ ... \ $` 续行。

下表逐 label 给出号与原文页码：

| label | 号 | 类型 | 原文页 |
| --- | --- | --- | --- |
| `eq:nls` | （1.1） | 编号显示公式 | 1 |
| `eq:sharp` | （1.2） | 编号显示公式 | 1 |
| `thm:main` | （1.1） | **定理** | 1 |
| `eq:threshold` | （1.3） | 编号显示公式 | 1 |
| `eq:dim` | （1.4） | 编号显示公式 | 2 |
| `eq:conc` | （1.5） | 编号显示公式 | 3 |
| `eq:intro-closure` | （1.6） | 编号显示公式 | 3 |
| `eq:intro-key` | （1.7） | 编号显示公式 | 3 |
| `eq:intro-identity` | （1.8） | 编号显示公式 | 3 |
| `eq:intro-radius` | （1.9） | 编号显示公式 | 4 |
| `eq:intro-weighted` | （1.10） | 编号显示公式 | 4 |
| `eq:intro-source` | （1.11） | 编号显示公式 | 5 |
| `eq:trapping` | （2.1） | 编号显示公式 | 5 |
| `def:ap` | （2.1） | **定义** | 5 |
| `eq:compact` | （2.2） | 编号显示公式 | 5 |
| `prop:reduction` | （2.2） | **命题** | 6 |
| `eq:no-waste` | （2.3） | 编号显示公式 | 6 |
| `eq:fixed-notation` | （2.4） | 编号显示公式 | 6 |
| `eq:quartic-notation` | （2.5） | 编号显示公式 | 6 |
| `prop:morawetz` | （2.3） | **命题** | 6 |
| `eq:morawetz-target` | （2.6） | 编号显示公式 | 6 |
| `eq:morawetz-global` | （2.7） | 编号显示公式 | 6 |
| `lem:forcing-rigidity` | （2.4） | **引理** | 7 |
| `eq:mass-zero` | （2.8） | 编号显示公式 | 7 |
| `eq:action` | （2.9） | 编号显示公式 | 7 |
| `eq:principal` | （2.10） | 编号显示公式 | 7 |
| `eq:kernel-source-bounds` | （2.11） | 编号显示公式 | 7 |
| `eq:source-identity` | （2.12） | 编号显示公式 | 7 |
| `eq:full-identity` | （2.13） | 编号显示公式 | 7 |
| `eq:three-estimates` | （2.14） | 编号显示公式 | 8 |
| `eq:refined` | （3.1） | 编号显示公式 | 8 |
| `lem:l4` | （3.1） | **引理** | 8 |
| `eq:besov` | （3.2） | 编号显示公式 | 8 |
| `eq:forcing-high` | （3.3） | 编号显示公式 | 8 |
| `eq:recurrence` | （3.4） | 编号显示公式 | 9 |
| `eq:Fstar` | （3.5） | 编号显示公式 | 9 |
| `eq:dsmall` | （3.6） | 编号显示公式 | 9 |
| `eq:a-bounds` | （3.7） | 编号显示公式 | 10 |
| `prop:good-time` | （3.2） | **命题** | 10 |
| `eq:good-time` | （3.8） | 编号显示公式 | 10 |
| `eq:terminal-ratio` | （3.9） | 编号显示公式 | 10 |
| `eq:future-maximal` | （3.10） | 编号显示公式 | 10 |
| `eq:deep-low-H` | （3.11） | 编号显示公式 | 10 |
| `eq:f-absorb` | （3.12） | 编号显示公式 | 10 |
| `eq:base-kernel` | （4.1） | 编号显示公式 | 11 |
| `eq:base-bounds` | （4.2） | 编号显示公式 | 11 |
| `eq:Q` | （4.3） | 编号显示公式 | 11 |
| `eq:density-to-quartic` | （4.4） | 编号显示公式 | 11 |
| `lem:static` | （4.1） | **引理** | 11 |
| `eq:static` | （4.5） | 编号显示公式 | 12 |
| `eq:directionalstress` | （4.6） | 编号显示公式 | 12 |
| `eq:spherical` | （4.7） | 编号显示公式 | 12 |
| `eq:green` | （4.8） | 编号显示公式 | 12 |
| `eq:J` | （4.9） | 编号显示公式 | 13 |
| `eq:K` | （4.10） | 编号显示公式 | 13 |
| `eq:tail` | （4.11） | 编号显示公式 | 13 |
| `eq:transform` | （4.12） | 编号显示公式 | 13 |
| `eq:weightedGN` | （4.13） | 编号显示公式 | 14 |
| `eq:cutoffcancel` | （4.14） | 编号显示公式 | 14 |
| `eq:tailweighted` | （4.15） | 编号显示公式 | 14 |
| `eq:strongL` | （4.16） | 编号显示公式 | 14 |
| `eq:Qcoercive` | （4.17） | 编号显示公式 | 14 |
| `eq:ir1` | （4.18） | 编号显示公式 | 15 |
| `eq:ir2` | （4.19） | 编号显示公式 | 15 |
| `eq:ir3` | （4.20） | 编号显示公式 | 15 |
| `eq:ir4` | （4.21） | 编号显示公式 | 15 |
| `eq:ir5` | （4.22） | 编号显示公式 | 15 |
| `lem:clock-root` | （4.2） | **引理** | 15 |
| `eq:ir6` | （4.23） | 编号显示公式 | 15 |
| `eq:ir7` | （4.24） | 编号显示公式 | 15 |
| `eq:ir8` | （4.25） | 编号显示公式 | 16 |
| `lem:signed-radius` | （4.3） | **引理** | 16 |
| `eq:ir9` | （4.26） | 编号显示公式 | 16 |
| `eq:ir10` | （4.27） | 编号显示公式 | 16 |
| `eq:ir11` | （4.28） | 编号显示公式 | 16 |
| `eq:ir12` | （4.29） | 编号显示公式 | 17 |
| `eq:ir13` | （4.30） | 编号显示公式 | 17 |
| `prop:clock-positive` | （4.4） | **命题** | 17 |
| `eq:ir15` | （4.31） | 编号显示公式 | 17 |
| `eq:ir14` | （4.32） | 编号显示公式 | 17 |
| `eq:ir16` | （4.33） | 编号显示公式 | 17 |
| `eq:ir17` | （4.34） | 编号显示公式 | 18 |
| `eq:ir18` | （4.35） | 编号显示公式 | 18 |
| `eq:ir19` | （4.36） | 编号显示公式 | 18 |
| `prop:full-source` | （5.1） | **命题** | 18 |
| `eq:source-final` | （5.1） | 编号显示公式 | 18 |
| `eq:qbounds` | （5.2） | 编号显示公式 | 18 |
| `eq:mass-cancel` | （5.3） | 编号显示公式 | 19 |
| `eq:Gcancel` | （5.4） | 编号显示公式 | 19 |
| `eq:lts` | （5.5） | 编号显示公式 | 19 |
| `eq:Z` | （5.6） | 编号显示公式 | 19 |
| `eq:bernstein-source` | （5.7） | 编号显示公式 | 19 |
| `eq:endpoint` | （5.8） | 编号显示公式 | 21 |
| `eq:closure` | （5.9） | 编号显示公式 | 21 |
| `eq:tail-mass` | （5.10） | 编号显示公式 | 21 |
| `eq:global-forcing` | （5.11） | 编号显示公式 | 21 |

## 3. 术语表（全稿统一，第一次出现给英文，之后只用中文）

| 英文 | 中文 | 记号 |
| --- | --- | --- |
| focusing / defocusing | 聚焦 / 散焦 | |
| energy-critical | 能量临界 | |
| ground state | 基态 | $W$ |
| threshold conjecture | 阈值猜想 | |
| global well-posedness and scattering | 整体适定性与散射 | |
| strong solution / maximal lifespan | 强解 / 最大存在时间 | |
| conserved energy | 守恒能量 | $E(v)$ |
| sharp Sobolev inequality | 最优 Sobolev 不等式 | |
| energy trapping | 能量陷获 | |
| coercivity / directional coercivity | 强制性 / 方向强制性 | |
| concentration-compactness | 集中紧性 | |
| profile decomposition | profile 分解 | |
| critical element | 临界元 | |
| almost periodic (modulo symmetries) | （模对称意义下）几乎周期 | |
| frequency scale / spatial center | 频率尺度 / 空间中心 | $N(t)$ / $x(t)$ |
| compactness of the orbit | 轨道预紧 | $\mathcal K$ |
| interaction Morawetz estimate | 相互作用 Morawetz 估计 | |
| interaction action / kernel / weight | 相互作用作用量 / 核 / 权重 | $M_k$ / $k$ |
| interaction radius | 相互作用半径 | $R(t)$ |
| virial / bilinear virial | 维里 / 双线性维里 | |
| principal term | 主项 | $\mathcal B$ |
| projected source | 投影源项 | $\mathcal E$ |
| radius contribution | 半径贡献 | $D$ |
| low-frequency control / bounds | 低频控制 / 低频界 | |
| Galilean boost | 伽利略提升 | |
| finite mass / negative regularity | 有限质量 / 负正则性 | |
| no-waste Duhamel formula | 无损耗 Duhamel 公式 | |
| frequency cascade | 频率级联 | |
| Littlewood–Paley projection | Littlewood–Paley 投影 | $P_{\le L}$ |
| Strichartz / long-time Strichartz | Strichartz 估计 / 长时间 Strichartz 估计 | |
| refined Sobolev inequality | 精化 Sobolev 不等式 | |
| Besov | Besov 空间 | |
| Bernstein | Bernstein 不等式 | |
| Hardy inequality | Hardy 不等式 | |
| Green kernel / Green equation | Green 核 / Green 方程 | |
| projected density | 投影密度 | $\rho=\lvert h\rvert^2$ |
| dispersive bound / majorant | 色散估计 / 色散主项 | |
| rigidity | 刚性 | |
| quartic spacetime term | 四次时空项 | |
| nonlinear cancellations | 非线性相消 | |
| momentum bracket / mass bracket | 动量括号 / 质量括号 | |
| localized / truncated virial | 定域化 / 截断维里 | |

固定记号（不译、不改写）：$W$、$G$、$E(u)$、$u_\lambda$、$N(t)$、$x(t)$、$B$、$R_0$、
$h=P_{>\nu}u$、$l=P_{\le\nu}u$、$F(u)=|u|^4u$、$M_\nu$、$d_\nu$、$a(t)$、$K_a(I)$、
$k_R$、$R(t)$、$Q_R$、$\mathcal B$、$\mathrm{Err}$、$D$、$C(R,\rho)$、$\kappa$、$\rho$、
$\psi$、$T_R$、$M_\psi$、$g$、$G_1$、$\mathcal E$、$v(y)$、$\omega$、$\nu$、$\varepsilon_{\rm rad}$、
$\varepsilon_{\rm src}$、$\mathcal K$。

## 4. LaTeX → Typst 转换规则（**本稿全部在本机 Typst 0.15.1 实测过**）

**必须遵守，否则要么编译报错，要么零告警印出垃圾。**

1. **微分写 `dif x`**：`\,\mathrm d x` → `dif x`（Typst 自动加薄空距并排成正体 d）。
2. **`\iint` 不存在**：写 Unicode `∬`（或 `integral.double`）；`\iiint` 同理 `integral.triple`。
3. **`\nabla` → Unicode `∇`**：Typst 没有 `grad` 这个标识符（`unknown variable: grad`）。
   `\Div` → `"div"`（引号里才是正体算子名）；`\Imn` → `"Im"`、`\Ren` → `"Re"`（见第 29 条）。
4. **虚数单位 `\ii` → `upright(i)`**：Typst 里没有 `roman`，也没有 `ii`。
5. **`\widehat f` → `hat(f)`；`\bar u` → `macron(u)`（**不能写 `bar(u)`**，见第 32 条）；`\mathbb R` → `ℝ`；`\mathcal B` → `ℬ`**
   （脚本字母直接用 Unicode：`𝒲 𝒱 𝓀 ℱ 𝔇 𝔅`）。
6. **多字母下标必须加引号**：`ε_rad` 报 `unknown variable: rad`，写 `ε_("rad")`；
   `$"PF"_rad$` 同理。单词上标也要：`C_("recon")`。
7. **数学里的 ASCII `/` 会自动升级成堆叠分式**，而 `|S|/2` 这种"竖线 + 斜杠"会把收尾的
   绝对值竖线**吞进分子**、印成坏掉的分数且**零告警**。行内比值写宏里的 `#s`
   （即 `sym.slash`），真正要分式的写 `frac(a, b)`。例：`$γ := (d - 1) #s d$`、`$frac(|S|, 2)$`。
8. **`\frac` 在 display 里一律 `frac(a, b)`**（本稿 277 处），行内散文里能改成 `#s` 的就改。
9. **分段函数用 `cases(式 & 条件, 式 & 条件)`**：行之间用 `,`，对齐列用 `&`。
   不要写 `mat(delim: #"{")`，它会额外吐出一个 `}`。
10. **`$…$` 内部单个 `\` + 空白是 Typst 的换行**：`Q \ D` 会把公式劈成两行并丢掉集合差，
    写 `Q ∖ D`。合法的换行是 `\` 后紧跟 `&`（在 `align` 里）或 `\$` 之外的显式续行。
11. **反引号是 raw 内容**：整段被反引号包住会**零告警**排成等宽源码。本稿不用反引号。
12. **行内数学是原子**：`$…$。` 或 `…$、` 会把中文标点甩到下一行行首，破坏中文排版。
    用 `#box[$…$。]`、把标点挪进公式，或调语序让公式后面跟一个可断行的中文词。
13. **`sqrt ( x )` 带空格会退化成英文单词 "sqrt"**：函数调用的括号前不写空格。
14. **`#set par(...)` 不要夹在标题与正文之间**（宏里已经处理，别在片段里另起）。
15. **`par` 没有 `keep-with-next`**（写了是 `error: unexpected argument`）；要把两段绑在一起用
    `#block(breakable: false)[ … ]`。
16. **顶格 `float` 在 Typst 0.15 是数值转型，不是浮动体**。本稿无图，用不上。
17. **`%` 在 0.15 不是 markup 注释**（会原样印出），注释用 `//`；`.bib` 里反过来，注释只能用 `%`。
18. `#include` 而非 `#import` 才输出顶层 content；片段第一行的 `#import "macros.typ": *` 不可省。
19. `#thm("引理 4.1")[ 陈述 ]`（方括号，内容块）；带小标题用
    `#thmof("命题 2.3", "频率定域化的相互作用 Morawetz 估计")[ ... ]`。
    证明用 `#proof[ ... ]`，`\begin{proof}[Proof of X]` 用 `#proofof("命题 2.3")[ ... ]`。
20. **`@key` 紧跟汉字会把汉字吞进标签**，后面必须留标点或空格。含 `/` 的 key 不能用 `@`（本稿无）。
21. `align`/`gather` 里的 `&` 对齐：Typst 写 `$ mat(...)$` 或直接用
    `$ alpha &= beta, \ gamma &= delta $`（行末 `\` 续行）。
    `\notag`/无号的多行式子放进 `#eqnb`。
22. 上下标里的花括号组要变成 Typst 的分组：`x^{2}_{k}` → `x_k^(2)`；
    `e^{-2\pi\ii x\cdot\xi}` → `e^(-2 pi upright(i) x dot xi)`。
23. **不要留任何 LaTeX 残留**：`\left`/`\right`/`\,`/`\;`/`\quad`（用 `quad`）/`\text{}`（用 `"…"`）
    /`\begin{...}`。交付前 `tools/math_parity.py`、`tools/typst_math_scan.py`、
    `tools/math_slash_scan.py` 三个扫描器必须全绿。
24. **齐次 Sobolev 空间写 `dot(H)^1`**：`$dot(H)^1(ℝ^3)$` → Ḣ¹(ℝ³)，实测圆点落在 H 正上方。
    不要写 `dot H^1`（印成前置乘点 `·H¹`），不要贴 Unicode `Ḣ`，也不要写 `H^·1`（1 会掉出上标）。
    带下标可写 `$C_t dot(H)^1_x$`。
25. **`\|` 只印单竖线**：范数必须用 `norm(u)` 或直接 Unicode `‖u‖`；绝对值才用 `abs(u)`/`|u|`。
    `norm` 不能写成 `\norm`（报 `unknown variable: orm`）。
26. **关系符号带下标会甩到符号正下方**：`$≲_u$` 排版错，写 `$"≲"_u$` 或 `$attach(≲, br: u)$`。
    `≳_u`、`≪_u` 同理；`∼_u` 正常无需改。`attach` 的方位参数只有 `tl/tr/bl/br`，没有 `bottom:`。
27. **函数记号的括号会被吞进下标且零告警**：`$K_a(I)$` 印成 `K_{a(I)}`。写 `$K_(a)(I)$`
    （或 `K_(a) (I)`）。同类：`ε_(u)(ν)`、`L^r_(x)(I)`、`N_(t)(T)`。
28. **两个大写字母相连会被当成内置标识符**：`$X ≤ CY$` 报 `unknown variable: CY`，
    常数与变量之间要留空格：`$X ≤ C Y$`。
29. **算子名要加引号才是正体**：`"sup"`、`"div"`、`"Err"`、`"rad"`；`Im`/`Re` 是内置的（印 ℑ/ℜ）。
    原文 `\operatorname{Im}`/`\operatorname{Re}` 是**正体 Im/Re**，必须写 `"Im"`/`"Re"`，
    带参数就写 `"Im"(macron(u) ∇u)`；裸 `Im` 会换成哥特体，与原文不一致（零告警）。
30. **连续引用就写相邻的 `@a @b`**：ieee 下渲染成 `[1], [2]`，与 IEEEtran 的 LaTeX 输出一致，
    不必也不应合并成 `[1, 2]`（`#cite(label("@a"), label("@b"))` 报 `unexpected argument`）。
31. **`#emph[]` 对中文无效果**（CJK 没有斜体字形，视觉与正文相同）。原文 `\emph{}` 强调的中文
    一律改 `#text(weight: "bold")` 或靠语序承担强调，别留一个不做事的宏。
32. **复共轭 `\bar u` 一律写 `macron(u)`**：Typst 0.15 里 `bar` 是**竖线符号**，`bar(u)` 零告警印成
    `|u|`（三个片段同时踩到，实测见 `src/_bprobe/bar.typ`）。集合闭包 `\overline{𝒦}` 写 `overline(𝒦)`
    （横线铺满整个字母），单个字母的共轭用 `macron`（ū，最接近 LaTeX 的 `\bar`）。
33. **导数撇号不能紧跟裸下标**：`k_L'(s)` 把撇吞进下标、印成 `k_{L′}(s)`，写 `k'_L (s)`；
    二阶导 `k''_L (s)`。
34. **`\nabla`/`\Delta` 与字母相邻要留空格**：`Δk`、`∇bar`、`sω`、`difω`、`ηδ` 一律
    `unknown variable`（Typst 把相邻字母读成一个标识符）。写 `Δ k(x - y)`、`s ω`、`dif ω`。
35. **`int`/`big`/`eps` 都不是 Typst 标识符**：积分只用 Unicode `∫ ∬ ∭` 或 `integral.double`；
    `\bigl/\bigr/\Big` 直接丢掉；`\eps` → `epsilon`。`norm(x, 2)` 报 unexpected argument，
    范数下标写 `norm(x)_2`；没有 `conv` 算子，卷积用 `ast`（印成 ∗）。
36. **带下标的齐次空间照样加括号**：`\dot W^{1,2}` → `dot(W)^(1,2)`；
    `‖v‖_(dot(H)^1)`（下标整体也要 `_(…)`）。
37. **多行公式的换行是单个 `\`，不是 LaTeX 的 `\\`**：`\\` 在 Typst 数学里是转义反斜杠，
    整行不但不折行、还会**印出一个多余的 `\`**（零告警）。220 dpi 实测：`"a" &= 1 \` 三行
    能按 `&` 对齐成列，`&=` 全在同一竖线上；写成 `\\` 的那组则糊成一行溢出页宽。
    探针见 `src/_bprobe/align.typ`、`align3.typ`。

## 5. 片段分工与接缝

| 片段 | tex 行号 | 内容 | 编号 |
| --- | --- | --- | --- |
| frag_1 | 65–205 | §1 引言开头：§1.1 主要结果（含定理 1.1）、§1.2 已有结果与低频问题 | 式 (1.1)–(1.4)、定理 1.1 |
| frag_2 | 206–416 | §1.3 证明概要 | 式 (1.5)–(1.11) |
| frag_3 | 417–538 | §1.4 组织、记号与约定；§2 开头、定义 2.1、命题 2.2 及其证明 | 式 (2.1)–(2.5)、定义 2.1、命题 2.2 |
| frag_4 | 539–684 | §2.2 四次时空估计与刚性、§2.3 相互作用恒等式 | 式 (2.6)–(2.14)、命题 2.3、引理 2.4 |
| frag_5 | 685–927 | §3 低频界（全节两小节） | 式 (3.1)–(3.12)、引理 3.1、命题 3.2 |
| frag_6 | 928–1243 | §4.1 加权强制性 | 式 (4.1)–(4.17)、引理 4.1 |
| frag_7 | 1244–1538 | §4.2 相互作用半径 | 式 (4.18)–(4.36)、引理 4.2、引理 4.3、命题 4.4 |
| frag_8 | 1539–1842 | §5 频率定域化的相互作用 Morawetz 估计（全节）+ 致谢与三则声明 | 式 (5.1)–(5.11)、命题 5.1 |

- 节标题由**片段自己写**，一级标题格式 `= 1　引言`，二级 `== 1.1　主要结果`（全角空格分隔号与题）。
- 每个片段**只输出正文 content**，不要写 `#set`、不要重复 `#import` 之外的全局设置。
- 跨片段的引用（如 frag_2 提到"命题 2.3"）按地图写**字面号**，别用 `@`。
- 原文 1 个脚注（`eq:dim` 之后那句关于 $W_d$ 的），Typst 里用 `#footnote[...]` 留在原位置。
- 致谢与"数据可用性 / 竞争利益 / AI 使用声明"三则 `\paragraph`：排成无编号的粗体小标题段
  （`#paragraph[...]` 或粗体行首），不要进节号。
