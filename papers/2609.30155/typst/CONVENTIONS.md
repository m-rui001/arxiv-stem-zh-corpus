# 2609.30155 译本排版约定

原文：*Singularities of the cold plasma theory: Modeling challenges for ICRF
operation in low-density edge plasma*，W. Tierens、C. Klepper、R. Diab、
G. Urbanczyk，arXiv:2609.30155，AIP `revtex4-1`（`aip, amsmath, amssymb,
reprint`）模板，`aipsamp.tex` 共 315 行，编译产物 5 页双栏 letter。

## 1. 文档结构要点

- **全篇没有 `\section`**：正文是一整条连续论述（letter 体裁）。译本同样不设标题，
  从摘要直接接入正文，靠首行缩进分段。
- 作者块里只有 Tierens 带 `\email`，且 Tierens 与 Klepper 共用 ORNL 单位
  （revtex 让无 `\affiliation` 的作者继承前一个单位）。译本按 1/2/3 三个上标处理。
- 摘要末尾嵌了一个很长的 DOE 合同 `\footnote`。译本把它作为 `#footnote[…]`
  放在摘要框内最后一句之后，页脚处出版。
- 原文有 `\nocite{*}`，但 `aipsamp.bib` 里 27 条全部被正文引用过，所以
  `\nocite` 实际没有增加任何条目 —— 译本不需要为此做任何事。
- `\begin{table}` 在 tex 里**出现了两次**（第 286 与 299 行，同一个
  `\label{tab:power}`），LaTeX 只会按 `aux` 打印一次。译本只保留一份。

## 2. 编号权威

取自本地 `pdflatex + bibtex + pdflatex×2` 生成的 `aipsamp.aux` 里的 `\newlabel`，
以及 `aipsamp.bbl` 的实际打印顺序。**`#set heading(numbering: none)`，所以
所有编号都是写进源码的字面字符串**，改一处必须全篇核对。

### 公式（13 个编号，9 个 `\label`）

| 译本 | tex label | 正文引用次数（tex） |
| --- | --- | --- |
| (1)(2) | 无（`align` 两行，各自编号） | 0 |
| (3) | 无 | 0 |
| (4) | `estn0` | 1 |
| (5) | `WLH` | 3 |
| (6) | `eqImS` | 1（两行 `align`，首行 `\nonumber`，编号落在第二行） |
| (7) | `slowWavePDE` | 1 |
| (8) | `RCcircSol` | 0 |
| (9) | 无 | 0 |
| (10) | `potentialAlongLine` | 1 |
| (11) | `asymInf` | 1（图 5 图注） |
| (12) | `asym1` | 2（正文 1 + 图 5 图注 1） |
| (13) | `asympIntersect` | 8 |

### 图（10 幅）与表（1 张）

| 译本 | tex label | 源文件 |
| --- | --- | --- |
| 图 1 | `fig:collisions` | `nuei_Coulomb.pdf` + `nuen.pdf`（双面板） |
| 图 2 | `fig:ionfrac` | `n0.pdf` |
| 图 3 | `fig:imS` | `ims_tiny.pdf` |
| 图 4 | `fig:imsRC` | `ims_rc.pdf` |
| 图 5 | `fig:resonanceConeAsymp` | `nearfar.pdf` |
| 图 6 | `fig:antDiag` | `antenna_2D_diagram.pdf` → **CeTZ 重画** `fig/antenna_domain.typ` |
| 图 7 | `fig:nete` | `ne.pdf` + `Te.pdf`（双面板） |
| 图 8 | `fig:expmesh` | `expmesh_all/corner/LH.png`（三面板） |
| 图 9 | `fig:normE` | `RC_and_LH.png` |
| 图 10 | `fig:analyticCompare` | `E_LH.pdf` + `E_rc_compare.pdf`（双面板） |
| 表 I | `tab:power` | revtex 的 aip 风格用罗马数字编号表 |

图交叉引用逐条与 tex 对齐：3/1/3/1/1/1/1/1/1/1。

### 文献

27 条，`refs.bib` 保留 tex 的 citation key。`aipsamp.bbl` 的 [1]–[27] 已经是
"按首次引用排序"（revtex/aip 数值风格），所以 Typst 的 `ieee` 风格复现了同一编号。
正文 `@key` 共 30 次、27 个不同键，与 tex 的 `\cite` 完全一致。

## 3. 本篇特有的 Typst 结论

- **`refs.bib` 里的注释必须用 `%`，不能用 `//`。** 用 `//` 会报
  `error: failed to parse BibLaTeX (expected opening brace)`，且报错位置指向注释行，
  容易误判成条目写坏了。
- **Hayagriva 的 `ieee` 风格会丢弃 `@unpublished` 与 `@misc` 的 `note` 字段**（实测：
  三种类型并排编译，只有 `journal` 会打印出来）。原文 `Diab2026NF` 的
  "submitted to *Nuclear Fusion*" 因此只能改写成 `@article` + `journal`，否则整段消失。
- **数学串里少写一个收尾 `"` 不会报错，但会吞掉后面的正文。**
  `$L_"‖$ 与 $T_e$ …` 里 `"‖` 没闭合，解析器一路吃到下一个 `"`（在几百字之外），
  中间所有中文被当成 math 字符串**原样打印成 LaTeX 源码**，编译却
  0 error / 0 warning。已加 `tools/typst_math_scan.py` 做静态扫描，全库 178 个
  `.typ` 复扫后只有本篇这一处。
- **`#include` 而非 `#import`**：CeTZ 图单独成文件时，`#import "fig/x.typ": *`
  只引入绑定、不输出顶层 content，产物是一片空白；要渲染必须 `#include`。
- **CeTZ `draw.bezier` 的位置参数顺序是 `(start, end, ctrl1, ctrl2)`**，
  终点在第二位。按 LaTeX/PSTricks 直觉写成 `(start, c1, c2, end)` 会静默画出
  一条错曲线，零警告。见 `C:/Users/hp/AppData/Local/typst/packages/preview/cetz/0.4.2/src/draw/shapes.typ:1498`。
- **`rotate` 的原点参数**：`origin: "center"` 与 `origin: align.center` 都报错，
  Typst 0.15 里要写裸的全局标识符 `origin: center`。
- **`table` 的 booktabs 顶线**：`rules: (x: (y, rest y) => …)` 是语法错误；
  写 `stroke: (x, y) => if y == 0 { 0.8pt + black } else { none }`。
- **图仍一律非浮动**（承 2609.30202 的结论）。本篇 10 幅图按源码顺序排，
  多面板图传 `breakable: false`，单面板图允许跨页。

## 4. 版面取舍

原图在 `reprint` 双栏下按 `\linewidth`（约 8.5 cm）排版。译本是 A4 单栏
16.2 cm 版心，若照搬 tex 的 `0.75\linewidth` 就是 12.15 cm，比原文大一截，
还会把整页撑出空洞。实测：

| 单面板图宽度 | 页数 | 页底空白带 |
| --- | --- | --- |
| 75%（照抄 tex） | 9 | 5.18 / 6.71 / **8.50** cm |
| 62%（采用值） | **8** | 5.18 / 7.18 cm |

图 9 从 100% 降到 78%。剩下的两处页底空白是"下一幅图整体放不下"造成的，
与 LaTeX 的非浮动图行为等价，压到 5 cm 以下只能靠把图缩到比原文还小，不值得。

## 5. 译名表

| 英文 | 中文 |
| --- | --- |
| Lower Hybrid Resonance (LH) | 下混合共振 |
| resonance cone | 共振锥 |
| private scrape-off layer (private SOL) | 私有刮削层 |
| connection length $L_\parallel$ | 特征连接长度 |
| ionization fraction | 电离度 |
| neutral density / pressure | 中性粒子密度 / 中性粒子压强 |
| charge exchange | 电荷交换 |
| Langevin polarization capture | 朗之万极化俘获 |
| Saha equilibrium | 萨哈平衡 |
| Stix parameter | Stix 参数 |
| nearly electrostatic slow wave | 准静电慢波 |
| mode conversion | 模式转换 |
| perfectly matched layer | 完全匹配层 |
| perfectly conducting wall | 完全导电壁 |
| sheath boundary condition | 鞘层边界条件 |
| tangency point | 切点 |
| limiter corner / corner radius of curvature | 限制器圆角 / 圆角曲率半径 |
| aperture | 天线开口 |
| electron Larmor radius | 电子拉莫尔半径 |
| exponential mesh spacing | 指数加密的网格 |
| plasma-material / plasma-wall interaction | 等离子体–壁相互作用（统一） |
| impurity sputtering | 杂质溅射 |
| separatrix | 分界面 |
| dimensionless factor | 无量纲因子 |
| scale separation | 尺度分离 |
