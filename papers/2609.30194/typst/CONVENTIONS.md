# 2609.30194 译文约定（子代理分工用，必读）

论文：**Stable solutions of the Allen–Cahn equation in dimension three are one-dimensional**
中文标题：**三维 Allen–Cahn 方程的稳定解是一维的**
作者：Hardy Chan（巴塞尔）、Xavier Fernández-Real（EPFL）、Alessio Figalli、Enric Florit-Simon、Joaquim Serra（ETH Zürich）
原文：`src/AllenCahn3D_arXiv.tex`，amsart 单栏 44 页，六节（末节是附录 A），纯数学/椭圆 PDE。

**这是一篇硬核分析论文，不是科普。** 证明里每一行不等式都要照搬，不许"概括"、不许"略"、
不许把 `\begin{proof}` 里的推导链压成一句"由此即得"。原文没跳步的地方你不许跳，原文跳了步
（"as one checks"、"standard"）你可以照原样轻描淡写，但不要替作者补证明。

---

## 1. 你只做分配给你的行段

每个片段是一个独立文件 `typst/frag_N.typ`，只写正文内容，**不要**写 `#import`、`#set`、
`#title`、`#bibliography`。主文件的壳（preamble/标题/参考文献）由协调者维护。

写作范围之外的内容一律不碰。编号见 §4 的总表，**照抄表里的编号，绝对不要自己数**。

## 2. 术语表（统一用词，不许另发明）

| 英文 | 中文 |
| --- | --- |
| Allen–Cahn equation | Allen–Cahn 方程（保留拉丁字母，不音译） |
| bounded stable solution | 有界稳定解 |
| stability (of a solution) | 稳定性；second variation = 二阶变分 |
| De Giorgi's conjecture | De Giorgi 猜想；其 stable version = 稳定版本 |
| one-dimensional (symmetry) | 一维（对称性）；"u 是一维的" = 经旋转/平移后 u 只依赖一个坐标 |
| monotone solution | 单调解（∂_{x_{n+1}}u > 0） |
| minimal surface / hypersurface | 极小曲面 / 极小超曲面 |
| interface / transition layer | 界面 / 转变层 |
| zero level set | 零水平集 |
| heteroclinic solution / 1D profile | 异宿解 / 一维行波剖面 |
| bad set | 坏集（记 $\mathcal X$） |
| clean ball / clean annulus | 干净球 / 干净环域 |
| bounded cluster | 有界簇 |
| normal coordinates | 法坐标 |
| endpoints $b_\pm$ | 端点 |
| second fundamental form | 第二基本形式 $\mathrm{II}$ |
| mean curvature | 平均曲率 $H$ |
| intrinsic distance / area | 内蕴距离 / 内蕴面积 |
| stability inequality | 稳定性不等式 |
| linearized operator | 线性化算子 |
| cutoff function | 截断函数 |
| $\mathcal H^2$ | 二维 Hausdorff 测度 |
| capacity | 容量 |
| sheeting / graph bounds | 分层结构 / 图估计 |
| Sternberg–Zumbrun inequality | Sternberg–Zumbrun 不等式 |
| Michael–Simon inequality | Michael–Simon 不等式 |
| Simons' identity | Simons 恒等式 |
| Γ-convergence | Γ–收敛 |
| stable Bernstein theorem | 稳定 Bernstein 定理 |
| double-well potential $W$ | 双阱势 |
| $\varepsilon$-energy / energy estimate | 能量 / 能量估计 |

人名一律不音译（Wang–Wei 写成"王–魏"是**错**的；写 Wang–Wei 估计）。
数学记号（$\mathcal D$、$\Gamma$、$L_0$）保持原样，不要中文化。

## 3. Typst 写法（`macros.typ` 已提供这些宏）

**每个 `frag_N.typ` 的第一行必须写 `#import "macros.typ": *`**——Typst 的 `#include` 不继承父文件作用域，不带这行会报 `unknown variable: eqn`。除这一行之外片段里不要写别的 `#import`/`#set`。

```typst
#eqn("(4.23)")[ $ ... $ ]        // 带编号的显示公式，编号照抄 §4 总表
#eqnb[ $ ... $ ]                  // 不编号的显示公式
#thm("定理", title: "2.3")[ ... ]        // 定理类；title 是命名参数，正文走 [...] 内容参数
#proof[ ... ]                     // 证明，自动加"证明。"和证毕方块
#note[ ... ]                      // 译注（小字），只在确有必要时用
#figc(image("..."))               // 窄图居中
```

定理类环境统一用 `#thm`，`kind` 参数取值：`定理`、`引理`、`推论`、`命题`、`定义`、`注记`、
`断言`、`猜想`、`问题`。原文的 `\begin{conjecture}[De Giorgi]` 是**不编号**的，写成
`#thm("猜想", title: "（De Giorgi）", body)[...]`。

### 3.1 Typst 数学的硬坑（上一轮踩过，别再踩）

- **没有 `over`**，分数只有 `frac(a, b)`。
- **没有** `sim ne cdot propto grad prod dot.eq tilde.r roman group ldots harpoon.r factorial diff`
  这些名字。对应写法：`~`、`!=`、`dot`、`prop`、`gradient`、`product`、`≈`、`~`、`upright`、`dots.h`。
- 定界符：`lr(...)` 可用，但 **`left`/`right` 不存在**。大方括号用 `bracket.l`/`bracket.r` 或 `[ ]` 配 `big`/`Big`。
- **连续字母会被读成一个标识符**：`$v_i(x)$` 会把 `(x)` 吞进下标 → 写 `$v _ i (x)$`；
  `$\mathbb R^3$` → `ℝ^3` 没问题，但 `W^{1,2}` 要写 `W ^ (1,2)`；
  多字母函数名一律加引号：`"div"`、`"tr"`、`"sup"`、`"dist"`、`"span"`、`"loc"`、`"Hac"`。
- **`∥u∥` 这种裸双竖线加上下标会被解析成竖线中间的堆叠**，范数一律写 `norm(u)_cal(H)^2`。
- 上划线：`bar(Omega)` 渲染成 `|Ω|`，要的是闭包就用 `overline(Omega)` 或 `macron(Omega)`。
- `mat(...)` **没有 `columns:` 参数**，多列写 `mat(a, b; c, d)`；分块用 `;` 分行。
- `cases(...)` 里**不能**放 `;`。
- 无 `sim`；`\lesssim` 一类原文若出现，用 `<~` 或直接文字"不超过（差一常数）"。
- `\mathbb{R}` → `ℝ`；`\mathcal{D}` → `cal(D)`；`\mathfrak` → `frak(...)`；`\widetilde\xi` → `tilde(xi)`；
  `\widehat` → `hat`；`\overline` → `overline`；`\boldsymbol`/`\bm` → `bold(...)`。
- `\operatorname{dist}` → `"dist"`；`\nu` → `nu`；`\Omega` → `Omega`；`\varphi` → `phi`（或 `varphi` 若字形需要）。
- `\tfrac`/`\dfrac` → `frac`。`\bigl(`/`\bigr)` → 直接 `(` 或用 `lr()`。
- `\text{...}` → `"..."`；`\mbox{...}` 同。
- `\begin{aligned}` 在 Typst 里用 `mat` 或 `align` 环境（`$ ... \ & ... $\`），
  多行对齐公式最稳的写法是 `#eqnb[ $ mat(delim: #none, row1; row2) $ ]`。
- 有序列表用 `+` 配 `#set enum(numbering: "1.")`。

### 3.2 中文文风

- 每个自然段**首行缩进两字**（preamble 已全局设置，你不用管，但**不要**在片段里写 `#set par(first-line-indent: 0em)` 去破坏它）。
- 标题里的编号手写：`= 1　引言`、`== 1.1　De Giorgi 猜想及其稳定版本`（一个 `=` 是节、两个是小节）。
- 交叉引用写成文字："式 (4.23)"、"定理 1.1"、"第 3 节"、"定义 3.4"。不要用 `@label` 自动编号。
- **去翻译腔**：长定语拆短；"我们证明/我们得到"这类主语按中文习惯可省；
  `It follows that` 不要写成"它跟随于"，写"于是""因此""由此可得"，且同一页里换着用；
  `In this paper we...` 不要每段都用"在本文中，我们……"开头。
- 破折号用 `–`（en dash）连人名，如 `Wang–Wei`、`Sternberg–Zumbrun`。
- 数学式子后的中文标点：式子末尾该有逗号/句号就在式子里带上 `,` / `.`，与原文一致。

## 4. 编号总表（照抄，不要自己数）

原文 `\numberwithin{equation}{section}`，所以式号是 **(节.序号)**；
Theorem/Lemma/Corollary/Proposition/Claim/Conjecture/Problem/Definition/Notation/Remark
**共用同一个按节计数的计数器**。`\appendix` 之后那一节的式号是 **(A.1)–(A.5)**。

### 4.1 公式编号（共 72 个）

| 式号 | tex 行 | 内容提示 |
| --- | --- | --- |
| (1.1) | 95 | Allen–Cahn 方程 $-\Delta u + W'(u) = 0$ |
| (1.2) | 125 | 稳定性二次型 $Q_u(\xi)$ |
| (2.1) | 276 | 一致正则性与衰减界 |
| (2.2) | 302 | Wang–Wei 近似假设 |
| (2.3) | 318 | 图估计（split 两行，**一个号**） |
| (2.4) | 328 | 叶间距 |
| (2.5) | 334 | 剖面输入（split） |
| (2.6) | 345 | 增强曲率 |
| (2.7) | 354 | 平移剖面输入 |
| (3.1) | 396 | 坏集 $\mathcal X$ |
| (3.2) | 403 | 干净球上的梯度下界 |
| (3.3) | 415 | 干净环域 |
| (3.4) | 424 | 环域容量 |
| (3.5) | 431 | $\int_{B_t(a)}\mathcal A^2|\nabla u|^2\le Ct$ |
| (3.6) | 491 | 簇的径向界（aligned） |
| (3.7) | 500 | 簇的覆盖与质量 |
| (3.8) | 507 | 完整距离 |
| (3.9) | 512 | 第二基本形式界 |
| (4.1) | 536 | 端点 $b_\pm$ 定义 |
| (4.2) | 545 | 法向区间 |
| (4.3) | 549 | 法参数流形 $\mathcal N$ |
| (4.4) | 568 | 法向范围 |
| (4.5) | 573 | 截断距离 |
| (4.6) | 577 | 端点界 |
| (4.7) | 583 | 核心剖面 |
| (4.8) | 588 | 端点夹角 |
| (4.9) | 621 | 正分离 |
| (4.10) | 657 | 沿 $\partial_t$ 求导后的方程（aligned） |
| (4.11)(4.12)(4.13) | 691 | 同一个 align 的三行 |
| (4.14) | 704 | 法向双剖面 |
| (4.15) | 720 | 法向端点夹角 |
| (4.16) | 726 | 邻点导数（aligned） |
| (4.17) | 734 | 法向距离的 Hessian |
| (4.18) | 752 | 平均曲率输入 |
| (4.19) | 757 | 平均曲率插值 |
| (4.20) | 814 | 法向梯度比较 |
| (4.21) | 819 | 法向端点正性 |
| (4.22) | 831 | 内部法向导数 |
| (4.23) | 850 | 干净局部面积 |
| (4.24) | 855 | 簇的三次面积 |
| (4.25) | 877 | 坏球稳定性可求和（aligned） |
| (4.26) | 916 | 法向拼接能量 |
| (4.27) | 922 | 截断 $\chi_0$ 的性质 |
| (4.28) | 928 | 逐点 S–Z 不等式（aligned） |
| (4.29) | 937 | 加权恒等式 |
| (4.30) | 944 | 线性化方程（array + cases） |
| (4.31) | 953 | 正解 $h$ |
| (4.32) | 958 | 环境平方恒等式（aligned） |
| (4.33) | 965 | 平方恒等式 0（aligned） |
| (4.34) | 974 | 平方恒等式（aligned） |
| (4.35) | 982 | 加权拼接（aligned） |
| (4.36)(4.37)(4.38) | 1007 | 同一个 align 的三行 |
| (4.39) | 1037 | 加权叶（aligned） |
| (4.40) | 1047 | multline，**一个号** |
| (4.41) | 1058 | multline，**一个号** |
| (4.42) | 1109 | 误差处理后（aligned） |
| (4.43) | 1133 | 法向导数平方积分 |
| (4.44) | 1163 | 分块分类稳定性 |
| (5.1) | 1191 | 簇的光滑邻域 |
| (5.2) | 1229 | 积分曲率 |
| (5.3) | 1250 | 分块分类面积 |
| (5.4) | 1256 | 截断支撑 |
| (5.5) | 1274 | 对数截断 |
| (A.1) | 1301 | 曲率–距离区域 |
| (A.2) | 1308 | 曲率下界 |
| (A.3) | 1312 | 射线（split） |
| (A.4) | 1323 | 比较 |
| (A.5) | 1331 | 切片（split） |

### 4.2 定理类（共用计数器，共 21 个）

| 编号 | tex 行 | 原文环境 | 标题/提示 |
| --- | --- | --- | --- |
| 定理 1.1 | 154 | thm | conditional classification（主定理） |
| 推论 1.2 | 171 | cor | 四维 De Giorgi 猜想 |
| 引理 2.1 | 264 | lem | Sternberg–Zumbrun 不等式 |
| 引理 2.2 | 273 | lem | 一致正则性与衰减 |
| 定理 2.3 | 297 | thm | Wang–Wei 分层与剖面估计 |
| 引理 2.4 | 366 | lem | 小曲率 ⇒ 异宿 |
| 定义 3.1 | 394 | defn | 坏集、干净球 |
| 注记 3.2 | 408 | remark | 坏集非空 |
| 引理 3.3 | 413 | lem | 干净环域的存在 |
| 定义 3.4 | 474 | defn | 有界簇及其邻域 |
| 定义 4.1 | 525 | defn | 法坐标与端点 |
| 引理 4.2 | 562 | lem | 辅助估计 |
| 引理 4.3 | 654 | lem | 沿 $\partial_t$ 求导的方程 |
| 引理 4.4 | 689 | lem | 切向导数与衰减估计 |
| 引理 4.5 | 811 | lem | 与正法向导数的比较 |
| 引理 4.6 | 848 | lem | 局部与三次面积界 |
| 命题 4.7 | 870 | prop | 稳定性的一种几何形式 |
| 命题 4.8 | 1156 | prop | 几何稳定性（去掉误差项） |
| 引理 5.1 | 1187 | lem | 坏集的大光滑邻域 |
| 定义 5.2 | 1208 | defn | 内蕴距离与内蕴面积 |
| 引理 5.3 | 1227 | lem | 面积与曲率的关系 |

另有**不编号**的两个猜想（tex L116、L131）：`猜想（De Giorgi）`、`猜想（稳定 De Giorgi）`。

### 4.3 图（共 1 幅）

| 编号 | tex | 内容 |
| --- | --- | --- |
| 图 1 | L777–807 的 tikzpicture | "Schematic periodic one-dimensional transition"（周期性一维转变的示意）。**由协调者用 CeTZ 重画**，子代理不要碰，只在正文引用处写 `@fig-periodic`。 |

## 5. 引用键

原文用 `\cite{SZ98}` 这类键，`typst/refs.bib` 已备好（47 条，重音已转字面 UTF-8）。
译文里写成 `@SZ98` 形式**不要**用；一律写成方括号编号会与正文顺序冲突。
**统一写法**：引用一律放在句子里，用 `@key` 让 Typst 渲染成 [n]，例如
`由 Wang–Wei 的剖面估计 @WW2021 可得……`。键名照原文抄，不要改。

## 6. 交付前自查（每个子代理自己跑一遍）

```bash
cd /e/arxiv_paper_to_typst/papers/2609.30194/typst
python - <<'PY'      # 注意：heredoc 里的反斜杠会被吞，改成写脚本文件
PY
```
实际做法：写一个 `_b_selfchk.py`（**必须用 `_b` 前缀**），检查
① 片段里 `$` 个数为偶数；② 不含任何 `\begin{`、`\frac`、`\mathbb` 之类 LaTeX 残留；
③ 不含 `s.t.`、`i.e.`、`e.g.`、`we have`、`it holds` 等英文残留；
④ 出现的 `#eqn("(...)")` 编号与 §4.1 总表逐一对应，不多不少。

**不要**编译 `main.typ`（其他片段还不存在）。因为每个片段第一行自带 `#import "macros.typ": *`，
可以直接自查自己的文件：
```bash
cd /e/arxiv_paper_to_typst/papers/2609.30194/typst
typst compile --root /e/arxiv_paper_to_typst frag_N.typ _b_fragN.pdf
```
必须零报错零告警（`@fig-periodic` 未定义会报 reference warning，那是协调者的图，出现即可，报告出来）。
验完删掉 `_b_*.pdf` 和自查脚本，只留 `frag_N.typ`。

## 7. 分片表（协调者填，子代理只看自己那一行）

| 片段 | tex 行段 | 内容 | 负责编号 |
| --- | --- | --- | --- |
| frag_1 | 89–145 | 摘要、§1 引言开头、1.1 De Giorgi 猜想及其稳定版本、1.2 与极小曲面的联系 | 式 (1.1)(1.2)；两个不编号猜想 |
| frag_2 | 146–229 | 1.3 主要结果、1.4 相关工作、1.5 本工作历史与 AI 的使用、1.6 一篇独立工作、1.7 文章结构、致谢 | 定理 1.1、推论 1.2 |
| frag_3 | 230–383 | §2 预备知识（2.1 记号、2.2 已知工具、2.3 Wang–Wei 估计） | 引理 2.1、2.2，定理 2.3，引理 2.4；式 (2.1)–(2.7) |
| frag_4 | 384–520 | §3 坏集与有界簇 | 定义 3.1、注记 3.2、引理 3.3、定义 3.4；式 (3.1)–(3.9) |
| frag_5 | 521–646 | §4 开头（到 4.1 小节之前） | 定义 4.1、引理 4.2；式 (4.1)–(4.9) |
| frag_6 | 647–844 | 4.1 切向与法向估计 | 引理 4.3、4.4、4.5；式 (4.10)–(4.22)；图 1 的引用 |
| frag_7 | 845–1005 | 4.2 稳定性不等式（前半） | 引理 4.6、命题 4.7；式 (4.23)–(4.35) |
| frag_8 | 1006–1181 | 4.2 稳定性不等式（后半） | 命题 4.8；式 (4.36)–(4.44) |
| frag_9 | 1182–1292 | §5 定理 1.1 的证明 | 引理 5.1、定义 5.2、引理 5.3；式 (5.1)–(5.5) |
| frag_10 | 1293–1362 | 附录 A：引理 5.3 的证明 | 式 (A.1)–(A.5) |
