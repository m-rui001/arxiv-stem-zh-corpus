# 2609.30175 译本排版约定（lane-B）

原文：`cgdd7.tex`（revtex4-2 prx，双栏，16 页），Brown & Lidar（南加州大学），
*Trading Circuit Depth for Pulse Sparsity in Chromatic Dynamical Decoupling*。
中文题名：**色动力学解耦中以电路深度换脉冲稀疏度**。

---

## 1. 编号权威来源

`cgdd7.aux`（本地用 TeX Live 2025 `pdflatex` 编译两遍得到）是**唯一**编号依据。
不许照抄 tex 里的 `\label` 顺序自己数，也不许给公式加 Typst counter。
所有式号、定理号、图号、表号一律写成字面字符串。

正文公式**全局连续**编号（不按节重置），附录另起 `A` 前缀。
tex 里 `\bes/\ees` 是 `subequations` 的简写，只包住式 (2)(3)(4) 那三个 align，
所以只有它们有子行字母；其余 align 环境每个只占一个号（多行用 `&` 并排，不另编号）。

### 1.1 章节

| 中文标题 | 编号 | tex 行 |
|---|---|---|
| 引言 | I | 99 |
| 背景 | II | 174 |
| A. 图着色 | II A | 177 |
| B. 噪声模型 | II B | 199 |
| C. 动力学解耦 | II C | 261 |
| D. 脉冲重复率（PRR） | II D | 274 |
| E. 色 Hadamard 动力学解耦（CHaDD） | II E | 299 |
| 结果 | III | 397 |
| A. 色二进制动力学解耦（CBDD） | III A | 439 |
| B. 色 Gray 码动力学解耦（CGDD） | III B | 580 |
| C. 色 Walsh 动力学解耦（CWDD） | III C | 699 |
| 实验 | IV | 769 |
| A. 实验设置 | IV A | 791 |
| B. $C=3$ 的态保持比较 | IV B | 811 |
| C. 由距离-1 三色与距离-3 五色导出的 CHaDD 等价类 | IV C | 891 |
| 结论与展望 | V | 913 |
| 数据可用性 | （无编号） | 938 |
| 附录 A：CHaDD 定理的证明 | A | 945 |

正文里交叉引用小节一律写「第 II E 节」「附录 A」，不写 `\cref`。

### 1.2 公式（26 + 9 个，逐条对照 aux）

| 号 | tex 行 | label | 说明 |
|---|---|---|---|
| (1) | 204 | eq:k-local-hamiltonian | $H=\sum_{k=1}^K H_k$ |
| (2a) | 210 | eq:k-body-hamiltonian-decomposition | |
| (2b) | 212 | eq:k-body-hamiltonian | |
| (3a) | 224 | eq:graph-hamiltonian | |
| (3b) | 227 | eq:1-body-hamiltonian | 一行两式，中间 `\hspace{5mm}` |
| (3c) | 232 | eq:2-body-hamiltonian | 同上 |
| (4a) | 245 | eq:graph-coloring-vertex-partition | |
| (4b) | 248 | eq:graph-coloring-edge-partition | |
| (5) | 254 | — | 无 label，仍占号 |
| (6) | 269 | eq:decoupling-averaged-hamiltonian | |
| (7) | 281 | eq:PRR | |
| (8) | 288 | eq:subset-prr | |
| (9) | 307 | eq:hadamard-matrix | |
| (10) | 318 | eq:xtilde | |
| (11) | 324 | eq:chadd-decoupling-unitary | |
| (12) | 407 | — | 两行并排（`\Phi` 同态），只占一个号 |
| (13) | 414 | — | 同上 |
| (14) | 425 | — | 同上 |
| (15) | 445 | eq:binary-matrix | |
| (16) | 453 | eq:ex-binary-matrix | |
| (17) | 469 | — | |
| (18) | 501 | eq:cbdd-prr | |
| (19) | 508 | eq:cbdd-group | |
| (20) | 592 | eq:gray-matrix | |
| (21) | 601 | eq:ex-gray-matrix | |
| (22) | 634 | eq:cgdd-group | |
| (23) | 705 | — | $P_s=s+(s\bmod 2)$ |
| (24) | 717 | eq:prr-optimal-chadd-pulse-count | |
| (25) | 723 | — | |
| (26) | 732 | eq:prr-optimal-chadd | |
| (A1) | 955 | — | 附录 9 个 align，多行的按 (A2a)(A2b)(A3a)(A3b)(A4a)(A4b)(A4c) 拆子行 |
| (A2) | 964 | — | 两行 → (A2a)(A2b) |
| (A3) | 977 | — | 两行 → (A3a)(A3b) |
| (A4) | 988 | — | 三行 → (A4a)(A4b)(A4c) |
| (A5) | 1004 | — | |
| (A6) | 1019 | — | |
| (A7) | 1026 | — | |
| (A8) | 1035 | — | |
| (A9) | 1047 | — | |

附录子行编号是从原文 PDF 里读出来的（`(A1) (A2a) (A2b) (A3a) (A3b) (A4a) (A4b) (A4c) (A5)…(A9)`），
正文子行同理：`(2a)(2b)(3a)(3b)(3c)(4a)(4b)`。

### 1.3 定理（共 3 个，全文连续编号，均带可选标题）

| 号 | 标题（tex 行） | label |
|---|---|---|
| 定理 1 | Single-axis Chromatic-Hadamard DD (CHaDD)（340） | thm:chadd |
| 定理 2 | Single-axis Chromatic-Binary DD (CBDD)（481 前后） | thm:cbdd |
| 定理 3 | Single-axis Chromatic-Gray DD (CGDD)（614） | thm:cgdd |

标题译法见 §4 术语表；框内写成「**定理 1　单轴色 Hadamard 动力学解耦（CHaDD）。** 正文……」，
小标题与正文**必须同段**（`macros.typ` 的 `thm` 已按此实现，别在中间加空行）。

### 1.4 图（9 幅）与表（1 张）

| 号 | label | tex 行 | 素材 |
|---|---|---|---|
| 图 1 | fig:heavy-hex-embedded-3coloring | 109–137 | 5 个矢量 PDF 面板 (a)–(e)，直接嵌 |
| 图 2 | fig:C=3 | 355–388 | **原文 TikZ** → 用 `sigmatrix` 重画 |
| 图 3 | fig:C=3-CBDD | 524–558 | **原文 TikZ** → 用 `sigmatrix` 重画 |
| 图 4 | fig:C=3-CGDD | 648–682 | **原文 TikZ** → 用 `sigmatrix` 重画 |
| 图 5 | fig:PRR-comparison | 688–697 | `figs/PRR_14pt_PBG.pdf` |
| 图 6 | fig:bivalent-3coloring-timeline-diagrams | 743–767 | 8 个 PDF，左列 XX/CHaDD/CBDD/CGDD、右列 UR4 系列 |
| 图 7 | fig:robustness-eliminates-prr-advantage | 772–789 | 2 个 PDF (a)(b) |
| 图 8 | fig:chadd-equivalence-classes | 846–873 | 5 个 PDF (a)–(e)，左窄右宽两栏 |
| 图 9 | fig:color-subsets | 875–888 | 3 个 PDF (a)(b)(c)，整页图 |
| 表 I | tab:prr-table | 564–578 | 4 列 3 行，重排为 Typst table |

素材已全部复制到 `typst/figs/`，文件名与 tex 里 `cgdd_figs/` 同名。

图 2/3/4 的重画数据（照抄 tex，别自己编）：

* 图 2（Hadamard $W_2$，色到行映射 $g^*$）：
  `gray ++++ → IIII`，`red +-+- → XXXX`，`green ++-- → IXIX`，`blue +--+ → XIXI`。
  注意原文矩阵行的次序是 `IIII/XXXX/IXIX/XIXI`，圆点次序是 灰、蓝、红、绿。
* 图 3（$B_3$，恒等映射）：`gray ++++++++ → IIIIIIII`，`red ++++---- → IIIXIIIX`，
  `green ++--++-- → IXIXIXIX`，`blue +-+-+-+- → XXXXXXXX`；圆点次序 灰、红、绿、蓝。
* 图 4（$G_3$，恒等映射）：`gray ++++++++ → IIIIIIII`，`red ++++---- → IIIXIIIX`，
  `green ++----++ → IXIIIXII`，`blue +--++--+ → XIXIXIXI`；圆点次序 灰、红、绿、蓝。

---

## 2. 片段划分（并行翻译的分片边界）

| 片段 | tex 行 | 内容 |
|---|---|---|
| frag_1 | 86–173 | 摘要 + §I 引言（含图 1） |
| frag_2 | 174–260 | §II A 图着色 + §II B 噪声模型（式 1–5） |
| frag_3 | 261–396 | §II C/D/E（式 6–11、定理 1、图 2） |
| frag_4 | 397–523 | §III 引语 + §III A CBDD（式 12–17、定理 2、式 18–19） |
| frag_5 | 524–599 | 图 3 + 表 I + §III B CGDD 开头（式 20） |
| frag_6 | 600–698 | 式 21–22、定理 3、图 4、图 5 |
| frag_7 | 699–768 | §III C CWDD（式 23–26、图 6） |
| frag_8 | 769–912 | §IV 实验全部（图 7、8、9） |
| frag_9 | 913–1058 | §V 结论 + 数据可用性 + 附录 A（式 A1–A9、证明） |

片段文件只写正文内容。**每个片段必须在文件头自带 `#import "macros.typ": *`**：
Typst 0.15.1 的 `#include` 在独立作用域里求值，看不到包含者的 `#import` 与 `#let`，
不写这一行就会 `unknown variable: eqn`。`main.typ` 里重复 import 无副作用。
每个片段开头不要写 `= 标题` 之外的全局 `#set`。

---

## 3. macros.typ 可用接口

```typst
#eqn("(3a)")[ $ ... $ ]        // 带号显示公式；号写字面串
#eqnb[ $ ... $ ]               // 不带号
#thm("定理", title: "1　单轴色 Hadamard 动力学解耦（CHaDD）")[ ... ]
#proof[ ... ]                  // 结尾自动加 □
#fig("2")[图注]( 内容 )         // 图号写字面串
#panel("(a)")[ ... ]           // 子图标签
#sigmatrix(((col-gray, "++++", "IIII"), ...))   // 图 2/3/4
#seq("IXIX")                   // 等宽脉冲序列
#PRR                           // 正体 PRR，数学模式里必须写 #PRR
col-red col-green col-blue col-gray
```

图片：`image("figs/xxx.pdf", width: 100%)`（相对 `typst/` 目录）。

---

## 4. 术语表（全片统一，不许另造）

| 英文 | 中文 | 备注 |
|---|---|---|
| dynamical decoupling (DD) | 动力学解耦（DD） | 首次给全称+缩写，其后用 DD |
| Chromatic-Hadamard DD (CHaDD) | 色 Hadamard 动力学解耦（CHaDD） | 缩写一律保留英文大写 |
| Chromatic-Binary DD (CBDD) | 色二进制动力学解耦（CBDD） | |
| Chromatic-Gray DD (CGDD) | 色 Gray 码动力学解耦（CGDD） | |
| Chromatic-Walsh DD (CWDD) | 色 Walsh 动力学解耦（CWDD） | |
| pulse repetition rate (PRR) | 脉冲重复率（PRR） | 数学里写 `#PRR` |
| circuit depth | 电路深度 | 记号 $N$ |
| proper $C$-coloring | 正常 $C$-着色 | 图论术语，不译"适当着色" |
| chromatic number | 色数 | $\chi$ |
| distance-$d$ coloring | 距离-$d$ 着色 | |
| color class | 色类 | |
| heavy-hex lattice | 重六边形晶格 | IBM 硬件图 |
| kagome lattice | 柯格米晶格（kagome） | 首次带英文 |
| edge qubit / vertex qubit | 边量子比特 / 顶点量子比特 | |
| bivalent / trivalent | 二价的 / 三价的 | |
| spectator qubits | 旁观量子比特 | 灰色 |
| crosstalk | 串扰 | |
| dephasing | 退相位 | |
| idle / idling | 空闲 | |
| toggling frame | 翻转框架 | |
| first-order average (Hamiltonian) | 一阶平均（哈密顿量） | |
| bang-bang limit |  bang-bang 极限 | 保留英文 |
| pulse imperfection | 脉冲不完美性 | |
| robust / non-robust | 鲁棒 / 非鲁棒 | 不译"稳健" |
| universally robust UR4 | 通用鲁棒 UR4（UR4） | |
| $\overline{X}$ pulse | $\overline{X}$ 脉冲 | 相位相反的 $\pi$ 脉冲 |
| state preservation | 态保持 | |
| average fidelity | 平均保真度 | |
| shots | 采样次数 | 「每条电路跑 5000 次」 |
| standard error of the mean | 标准误 | |
| sign matrix | 符号矩阵 | |
| sequency | 序列度（sequency） | 首次带英文 |
| Walsh matrix | Walsh 矩阵 | 保留 Walsh |
| reflected binary code / Gray code | 反射二进制码 / Gray 码 | |
| bit reversal | 比特反转 | |
| control group | 控制群 | |
| group homomorphism | 群同态 | |
| kernel / image | 核 / 像 | |
| hyperedge | 超边 | |
| always-on coupling | 常开耦合 | |
| tunable coupler | 可调耦合器 | |
| dilated sequence | 膨胀序列 | |
| equivalence class | 等价类 | |
| QPU | 量子处理单元（QPU） | |
| `ibm_strasbourg` | 原样保留，等宽 | |

固定译法（定理标题）：
定理 1「单轴色 Hadamard 动力学解耦（CHaDD）」、
定理 2「单轴色二进制动力学解耦（CBDD）」、
定理 3「单轴色 Gray 码动力学解耦（CGDD）」。

---

## 5. 记号约定

* $\PRR$ → `#PRR`；$N$ 深度、$P$ 每轮脉冲数、$C$ 颜色数、$\chi$ 色数、
  $\tau$ 时间步长、$\delta$ 脉冲宽度、$\nu$ Hadamard 维数指数、$j$ 时间步指标。
* $\sigma_v^\alpha$ 泡利算符；$\ox$ → `\ox`；$\ketb{i}{j}$ → $\ket{i} \bra{j}$。
* $W_\nu$ Hadamard 矩阵、$B_C$ 二进制矩阵、$G_C$ Gray 矩阵、$\widetilde X_c$ → `$tilde(X)_c$`。
* $g$、$g^*$ 色到行映射；$\gamma_C$ Gray 映射；$R_\nu$ 比特反转。
* `\texttt{IXIX}` 一律用 `#seq("IXIX")`，正文里读作「序列 IXIX」。
* 模运算写 `$s "(mod)" 2$` 或 `$j oplus k$`（`oplus` Typst 原生支持）。

---

## 6. 已知陷阱（本轮务必避开）

1. **`#set par(...)` 写在内容块里会把段落切断**：小标题必须与正文同一行段落，
   `macros.typ` 已按此写法，片段里不要自己重排定理框。
2. **`pages` 里的前导零会丢**：Typst 把纯数字 pages 当整数，`041001` 会印成 `41001`。
   refs.bib 里 APS 文章号一律用 `issue = {041001}`（渲染成 "vol. 88, no. 041001"）。
   已生成好的 `refs.bib` 已按此处理，别再改回 `pages`。
3. `@misc` 的 `note`/`howpublished` 在 ieee 样式下**不印**；预印本用 `@report` +
   `institution`/`number`，数据集同理。refs.bib 已按此写好。
4. 数学里裸写 `PRR`、`span`、`ker`、`dim`、`Im` 会报未知变量或排成斜体：
   用 `#PRR`、`operatorname` 风格的 `math.op`，或直接 `$operatorname{ker}$`。
5. `$ ... $` 里出现 `*`、`_`、`#`、`"` 要转义；正文里的 `\texttt{}` 用 `#seq` 或 `#raw`。
6. 编译：`typst compile --root 'E:/arxiv_paper_to_typst' main.typ main.pdf`（正斜杠 + 引号）。
7. 渲染临时文件一律用 `_b` 前缀，别污染别人的 `_a`/`_c`。
8. **`@key` 后面紧跟中文会被吸进引用键里**（`@Viola:98表明` 解析成键 `Viola:98表明`）。
   键后必须留一个空格或直接用全角标点（「使用 `@Viola:98` 提出的方法」「见式 (7)@x」不成，写作 `@x`，）。
9. Typst 数学里没有 `\otimes` 宏名：写 Unicode `⊗` 或 `tensor`；显示模式下不要写 `limits`；
   `\iff` 写 `<=>`；相邻单字母变量要加空格（`uv` 会排成连写的乘积，写作 `u v`）。
10. `#fig("3")[注](体)` 这种「括号再调用」会报错（把 content 当函数调）。
    可用写法只有两种：`#fig("3", [注], 体)` 显式传参，或 `#fig("3")[注][体]` 连续 content 实参。
11. 每个片段**顶部自己写** `#import "macros.typ": *`（见 §2）。自检用的 harness 也照此写即可直接 include 片段。
