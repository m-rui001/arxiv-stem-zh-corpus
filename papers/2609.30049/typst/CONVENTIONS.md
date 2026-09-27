# 2609.30049 译文分工与 Typst 约定（子代理必读）

原文：`GP_VAR_0923.tex`（elsarticle，A4，31 页，arXiv:2609.30049
"Optimal Recovery for Solving Variational Problems"）。
任务：把你负责的那几节**人工译成中文并直接写成 Typst 源码**，不是 Markdown、不是 LaTeX。

## 0. 输出位置与文件形态

- 只写你自己的那一个片段文件，路径见每条任务里给的 `frag_x.typ`，放在
  `E:\arxiv_paper_to_typst\papers\2609.30049\typst\`。
- 片段文件**第一行必须是** `#import "macros.typ": *`，然后直接是 `= 一级标题` 正文。
  不要写 preamble、不要写 `#set ...`、不要写 `#bibliography`、不要 `#include` 别的片段。
- 只读 `GP_VAR_0923.tex` 与 `typst/refs.bib`，不要改它们，也不要改 `main.typ`、`macros.typ`。
- 不要跑 `typst compile main.typ`（还没合并）。要验证语法，就自己造一个三行壳：
  `#import "macros.typ": *` + 你的片段内容，编译到 `_b_<你的名字>.pdf`，验证完把壳和 pdf 删掉。

## 1. 编号与交叉引用约定（全稿统一，务必照做）

- 章节号**手写进标题文字**：`= 1　引言`、`== 1.1　变分能量最小化`（全角空格 U+3000 分隔）。
- 正文交叉引用写成中文散文："第 3 节"、"见 5.2 小节"、"式 (12)"、"图 4"、"表 2"、"定理 6.1"。
- **公式编号手写**：每个带 `\label{eq:...}` 的显示公式写成

  ```typst
  #eqn("(12)")[ $ integral_(RR) |nabla u|^2 $ ]
  ```

  无标签的显示公式用 `#eqnb[ $ ... $ ]`（居中、不编号）。
  编号必须与原文 `\label{eq:...}` 的**出现顺序**一致：原文第一个带标签的 equation 是 (1)，依次数下去。
  你负责的那一段开头是第几号，任务里会告诉你；如果不确定，就按原文顺序自己数，并在片段文件顶部注释里
  写明"本节公式 (a)–(b)"，方便合并时核对。
- 图：`#figure(placement: top, figc(image("fig/xxx.pdf", width: NNcm)), caption: [...]) <label>`，
  图号由 Typst 自动排（`supplement: [图]`），caption 里**不要**手写"图 N"。
- 表：`#figure(placement: top, kind: table, ...)` 用 Typst `table(...)` 重排，caption 同上。
- 定理类环境用 `#thm`（见下），编号手写，与原文 `Theorem/Lemma/...` 的计数器一致：
  原文按节重置（`\newtheorem{theorem}{Theorem}[section]`），所以第 6 节第一个定理是"定理 6.1"。
- 引用：`@key`，key 与 `refs.bib` 完全一致。原文 `\cite{a,b,c}` → `@a @b @c`；
  `\citep` 同样用 `@a`。

## 2. Typst 数学语法（本轮已踩实的坑，别再踩）

- **没有 `{a over b}` 这种写法**，只有 `frac(a, b)`。写 `{3 over 4}` 会报 `unknown variable: over`。
- 方括号定界符是 `bracket.l` / `bracket.r`；`brack.l` 不存在。花括号 `brace.l/r`、取整 `floor.l/r`、`ceil.l/r`。
  自适应定界用 `lr(...)`。
- 这些 LaTeX 名字**在 Typst 里不存在**：`sim`（用 `~`）、`ne`（用 `!=`）、`cdot`（用 `dot`）、
  `propto`（用 `prop`）、`ll`/`gg`（用 `<<`/`>>`）、`dot.eq`、`tilde.r`、`prod`（用 `product` 或直接删）、
  `grad`（用 `gradient`）。
  存在且可用：`lt gt approx equiv lt.eq gt.eq tilde.eq plus.minus dots.c arrow.r integral union subset
  subset.eq times dot nabla? 不存在——用 gradient`。
- **连续字母会被当成一个标识符**：`_ij` 报 `unknown variable: ij`，必须 `_"ij"`；
  `SO(2)` 必须写 `"SO"(2)`；`RKHS`、`FEM`、`PDE`、`Matern` 这类缩写在数学模式里一律加引号：
  `"RKHS"`、`"FEM"`、`"p-Laplace"`。下标同理：`J _"XY"`、`theta _0`。
- `angle.l` / `angle.r` 存在但紧跟 `_` 会报 `unknown symbol modifier`；键求和的 ⟨ij⟩ 直接写 Unicode `⟨` `⟩`。
- 分段函数用 `cases(1 & x > 0, 0 & "其他")`；`cases(...)` 里**不能**用分号（是具名参数分隔符）。
- 希腊字母直接写名字：`alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu omega
  pi rho sigma tau phi chi psi Gamma Delta Theta Lambda Sigma Omega`。
  大写 `Θ` 若需要独立字符可直接打 Unicode `Θ`。
- 粗体向量 `bold(S)`、`bold(u)`；单位矢量 `hat(n)`；花体 `cal(H)` `cal(K)` `cal(E)`；
  空心/黑板体用 `RR` `NN`（Typst 里是 `RR`、`NN`、`CC`、`bold(R)`? 不确定就用 Unicode `ℝ`、`ℕ`）。
- 上标/下标里的引号片段**不能带空格**：`w^("("eta" - 1")")` 会静默排错（零告警），去掉空格。
- 左下标（如 `${}_1F_1$`）写 `#h(0em)_1 F _1 (...)`。
- `--` 在数学里不是 en dash；正文里 en dash 直接打 `–`（U+2013），如 `Γ–收敛`。

## 3. 排版与文风（用户明确要求过，违反要返工）

- 每个自然段都首行缩进 2em（模板里 `first-line-indent: (amount: 2em, all: true)` 已全局设好，
  你**不要**再写 `#set par` 或 `#par(first-line-indent: 0em)`，除非是标题/图注那种例外）。
- **去翻译腔**：句式灵活，别把英文从句直译成中文长定语。主动语态、短句、口语化的科技中文都行。
  例：`It is well known that ...` → `众所周知……` 或干脆 `……是常识`；
  `In this work, we propose ...` → `本文提出……`。
  避免"……被……所……"、"使得……得以……"、"值得注意的是，……"连用三次这类套话。
- 术语全稿统一，见 `main.typ` 顶部注释里的术语表（下面第 5 条），不要自创译名。
- 不要留任何英文残留句子。图注、表头、定理名都要译。人名、机构名、期刊名、`arXiv`、
  `Matérn`、`Kriging` 等专有名词保留原文。
- 数学符号后面的中文标点：用全角 `，。；：、（）「」`。行内公式两侧不加空格也能排，
  但 `$...$` 与中文之间**加一个半角空格**更稳（模板的 `#h` 不需要）。

## 4. 交付前自检（每个片段自己先跑一遍）

- 编译零 error。零 warning 最好；`spacing`/`overlap` 类警告自己调。
- 全文 grep 一遍确认没有 LaTeX 残留：`\frac`、`\begin`、`\cite`、`\ref`、`$\\`、`{ }` 包着的英文句。
- 数学模式 `$` 个数为偶数（每个片段自己数）。
- 数字/公式编号连续，无跳号、无重号。

## 5. 术语表（全稿统一）

- optimal recovery = 最优恢复；variational problem = 变分问题；energy functional = 能量泛函；
  minimizer = 极小元/最小元（定理语境用"极小元"）；Euler–Lagrange equation = 欧拉–拉格朗日方程
- reproducing kernel Hilbert space (RKHS) = 再生核 Hilbert 空间（RKHS）；kernel = 核；
  Matérn kernel = Matérn 核；smoothness parameter = 光滑参数；nugget = 金块项（nugget）
- representer theorem = 表示定理；screening effect = 屏蔽效应；sparse Cholesky decomposition = 稀疏 Cholesky 分解
- fill-in = 填充元；sparsity pattern = 稀疏模式；Hessian matrix = Hessian 矩阵；Gram matrix = Gram 矩阵
- prior knowledge = 先验信息；noisy observation = 含噪观测；mesh-free = 无网格；collocation = 配点
- strong form = 强形式；weak form = 弱形式；constraint = 约束；data-fitting term = 数据拟合项
- Γ–convergence = Γ–收敛；Γ–limit = Γ–极限；liminf/limsup inequality = 下极限/上极限不等式
- existence of minimizers = 极小元的存在性；coercivity = 强制性；lower semicontinuity = 下半连续性
- compact embedding = 紧嵌入；bounded linear functional = 有界线性泛函；Riesz representation = Riesz 表示
- linear elasticity = 线性弹性；equation of state (EOS) = 状态方程（EOS）；Stokes problem = Stokes 问题
- p-Laplace = p-Laplace（保留）；semilinear elliptic = 半线性椭圆；incompressible = 不可压缩
- trial space/test space = 试探空间/检验空间；degrees of freedom = 自由度；convergence rate = 收敛速率
- error bound = 误差估计；well-posed = 适定的；ill-conditioned = 病态的

## 6. 图与表清单（保留原图，只译图注；本稿不做 CeTZ 重画）

`fig/` 下已有：`grid.pdf`、`Poisson_rates.pdf`、`sparse_Poisson_rho.pdf`、`semilinear_rates.pdf`、
`p_Laplace.pdf`、`p_Laplace_solution_M12.pdf`、`p_Laplace_solution_M52.pdf`、`eos_rates.pdf`、
`nonlinear_elasticity.pdf`、`nonlinear_elasticity_rho.pdf`、`sparsity_M32_03.png`、`hessian_sparsity_M32_03.png`。
全部是数据曲线、热图与稀疏模式图，重画只会把可读矢量换成对不上的坐标，一律 `image(...)` 嵌入。
版心宽 16.2 cm：单幅通栏用 `width: 16.2cm`，半幅用 `width: 11cm` 左右。

## 7. 全稿公式编号总表（已按原文出现顺序数好，直接照抄，不要自己重数）

原文共 33 个带标签的编号公式，`equation*` 一律不编号。分布：

| 式号 | tex 标签 | tex 行 | 归属片段 |
|---|---|---|---|
| (1) | eqn:var-problem-general | 272 | frag_1 |
| (2) | eqn:representer-Banach-space | 493 | frag_2 |
| (3) | eqn:linear-PDE | 515 | frag_2 |
| (4) | eqn:optimal-recovery-PDE | 531 | frag_2 |
| (5) | eqn:var-problem-Sobolev | 702 | frag_3 |
| (6) | eqn:optimal-recovery | 732 | frag_3 |
| (7) | eqn:uz | 742 | frag_3 |
| (8) | eqn:non-local-phi | 760 | frag_3 |
| (9) | eqn:finite-dim-var | 780 | frag_3 |
| (10) | eqn:u-star | 793 | frag_3 |
| (11) | eqn:grad-and-hessian | 801 | frag_3 |
| (12) | eqn:gradz_u | 817 | frag_3 |
| (13) | eqn:regularized-Var | 970 | frag_4 |
| (14) | eqn:link-U-cov | 1106 | frag_5 |
| (15) | eqn:maximum-ordering | 1125 | frag_5 |
| (16) | eqn:lengths | 1132 | frag_5 |
| (17) | eqn:KL | 1175 | frag_5 |
| (18) | eqn:u-phi | 1262 | frag_5 |
| (19) | eqn:u-grad-phi | 1275 | frag_5 |
| (20) | eqn:u_approx | 1291 | frag_5 |
| (21) | eqn:GN-Hessian | 1450 | frag_5 |
| (22) | eqn:optimal-recovery-basis | 1595 | frag_6 |
| (23) | eqn:F-M | 1617 | frag_6 |
| (24) | eqn:F-inf | 1625 | frag_6 |
| (25) | eqn:var_JM | 1712 | frag_6 |
| (26) | eqn:generalized-Poincare | 1981 | frag_7 |
| (27) | eqn:vk-strong-u | 2066 | frag_7 |
| (28) | eqn:vk-estimates | 2074 | frag_7 |
| (29) | eqn:vkM-strong-to-vk | 2078 | frag_7 |
| (30) | eqn:Poisson-solution | 2135 | frag_8 |
| (31) | eqn:p-Laplace-nonsmooth | 2288 | frag_8 |
| (32) | eqn:manufactured-solution-EOS | 2402 | frag_9 |
| (33) | eqn:stokes-var | 2486 | frag_9 |

图/表出现顺序（Typst 自动编号，别手写"图 N"）：图 1 `grid.pdf`(1218)、图 2
`sparsity_M32_03.png`(1250)、图 3 `hessian_sparsity_M32_03.png`(1477) → frag_5；图 4
`Poisson_rates.pdf`(2196)、图 5 `sparse_Poisson_rho.pdf`(2211)、图 6 `semilinear_rates.pdf`(2241)、
图 7 `p_Laplace.pdf`(2277)、图 8 是 (2316–2335) 的两 panel `p_Laplace_solution_M12/M52.pdf`
合成一幅 → frag_8；图 9 `eos_rates.pdf`(2428)、图 10 `nonlinear_elasticity.pdf`(2439)、
图 11 `nonlinear_elasticity_rho.pdf`(2469) → frag_9。表按出现顺序：表 1 (2139) → frag_8，
表 2 (2583)、表 3 (2670) → frag_9。片段顺序错了图号就会错位，合并前不要调整 `main.typ` 的 include 次序。

## 8. 语法自验（每个片段独立做）

在 `typst/` 下写一个临时壳 `_b_fragN.typ`，内容只有 `#import "macros.typ": *` 加上你的片段正文
（或直接 `#include "frag_N.typ"` 加 import 行），跑 `typst compile _b_fragN.typ _b_fragN.pdf --root ../..`
确认零 error，然后删掉这两个临时文件。不要编译 `main.typ`（其余片段还没合并，必然报错）。

## 9. 定理类环境编号总表（LaTeX 每类各有计数器、每节归零）

原文 `\newtheorem` 把 theorem / lemma / definition / example / remark / proposition 各自设为
`[section]` 重置，所以**每一类在每个小节里都从 1 重新数**。已数好的结果：

- 第 3 节：注记 3.1 (873)、注记 3.2 (884)、例 3.1 (902)
- 第 4 节：例 4.1 (1137)、定理 4.1 (1351，带证明 1365)
- 第 5 节：注记 5.1 (1584)、引理 5.1 (1644，带证明 1653)、定理 5.1 (1703，带证明 1720)、
  定理 5.2 (1914)、注记 5.2 (1947，其后 1965 是定理 5.2 的证明)
- 附录 A：定义 A.1 (2782)
- 附录 B：定义 B.1 弱收敛 (2880)、定义 B.2 Γ–收敛 (2908)、定义 B.3 强制性 (2930)、
  定义 B.4 等强制性 (2937)、定理 B.1 Γ–收敛基本定理 (2947)

写法：`#thm("定理 5.1", "极小元的存在性"){ ... }`，证明用 `#proof{ ... }`（宏会自动加"证明。"和 □）。
原文被 `%` 注释掉的 theorem/proof 一律不译。

伪代码：原文有 3 个 `algorithm` 环境，全局编号（不按节重置）——算法 1 (845–871) 在 frag_3，
算法 2 (1315–1332) 与算法 3 (1486–1502) 都在 frag_5。用带边框的 `#block` 排，顶部一行
`#text(weight: "bold")[算法 1　标题]`，步骤用 `#set par(first-line-indent: 0em)` + 有序列表，
`Require/Ensure` 译作"输入/输出"。

## 10. 片段分工

| 片段 | tex 行 | 内容 |
|---|---|---|
| frag_1 | 246–431 | 第 1 节 引言（1.1–1.4），式 (1) |
| frag_2 | 432–686 | 第 2 节（2.1–2.2），式 (2)–(4) |
| frag_3 | 687–942 | 第 3 节 + 3.1，式 (5)–(12)，注记 3.1/3.2、例 3.1、算法 1 |
| frag_4 | 943–1090 | 3.2 核误设 + 第 4 节引子 + 4.1 Matérn 核与屏蔽效应，式 (13) |
| frag_5 | 1091–1537 | 4.2 稀疏 Cholesky + 4.3 Hessian 稀疏分解，式 (14)–(21)，图 1–3，例 4.1、定理 4.1、算法 2/3 |
| frag_6 | 1538–1901 | 第 5 节引子 + 5.1 极小元存在性，式 (22)–(25)，注记 5.1、引理 5.1、定理 5.1 |
| frag_7 | 1902–2119 | 5.2 极小元的收敛性，式 (26)–(29)，定理 5.2、注记 5.2 |
| frag_8 | 2120–2342 | 第 6 节引子 + 6.1–6.3，式 (30)–(31)，图 4–8，表 1 |
| frag_9 | 2343–2738 | 6.4–6.5，式 (32)–(33)，图 9–11，表 2–3 |
| frag_10 | 2739–2984 | 第 7 节 结论、附录 A、附录 B、致谢 |
