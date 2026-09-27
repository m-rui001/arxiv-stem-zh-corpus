# 2609.30179 译本作业约定（分片代理必读）

原文：`papers/2609.30179/Main.tex`，`\documentclass[journal=jacsat,manuscript=article]{achemso}`，
Karmakar / Klok / Ligmajer / de S. Menezes，*Tunable hyperbolic metamaterials for brightening
single-photon emission*。本机 TeX Live 编译出的 `Main.pdf` 23 页（预印本单栏），
`Main.aux` 是编号权威。

## 1. 你是什么、你只做哪一段

本稿由六个子代理并行产出。**只在分给你的 `frag_N.typ` 里写文件**，不要碰 `main.typ`、
`macros.typ`、别的 frag、`refs.bib`。每个 frag 第一行必须是：

```typst
#import "macros.typ": *
```

（`#include` 在隔离作用域里求值，不 import 就用不了 `fig`/`tbl`/`eqn`/`runin`。）

## 2. 编号权威表（取自 `Main.aux` 的 `\newlabel`）

| tex 里的 label | 印出的号 | 位置 |
| --- | --- | --- |
| `fig1` | 图 1 | 结果与讨论开头，TiO₂/Ag 堆叠的 EMT/PF/EQE 六联图 |
| `tab:photonic` | 表 1 | PF / EQE / PF_rad 三种指标对照，6 行数据 |
| `fig2` | 图 2 | HMM 光子晶体（PhC）的 PF_rad，6 联图，含式 (1) 的上下文 |
| `eq:momentum_matching` | 式 (1) | `k_HMM − G = k₀ sinθ`，全文唯一被回引的公式 |
| `fig3` | 图 3 | Sb₂S₃/Ag 堆叠的双曲可调谐性，6 联图 |
| `fig4` | 图 4 | 偶极子高度依赖（未图形化堆叠 vs PhC），(a)(b) 两联 |
| `fig5` | 图 5 | 优化构型的 PF_rad 与两相近场，(a)(b)(c) 三联 |
| （无 label） | 式 (2) | 方法节 `F_P = Γ/Γ₀ = (Γ_rad+Γ_non-rad)/Γ₀` |

**所有编号都是字面字符串**：`#fig("1")[ … ]`、`#eqn("(1)")[ … ]`、`#tbl("1")[ … ]`。
`main.typ` 里 `#set heading(numbering: none)`、`#set math.equation(numbering: none)`，
章节标题不带号，公式/图/表也不会自动编号 —— 写错号不会报错，只会印出错号。

正文交叉引用一律写死：`图 1(a)`、`图 2(c)`、`式 (1)`、`表 1`。原文 `Fig.~\ref{fig1}(a)` → `图 1(a)`。

## 3. 文献

原文 41 条（`Main.aux` 里 41 个 `\bibcite`），achemso 走的是**按正文首引顺序编号**的 ACS 数字式，
和 Typst 的 `ieee` 样式同序 —— 所以本译本的文献号与原文印出的 [1]–[41] **应当逐条对齐**。
写引用时用 `@bibkey`，键名与 `refs.bib` 一致（见 §6 分工，bib 由单独一个代理建）。
`refs.bib` 还没落地前照 §6 给的键名写就行。

## 4. Typst 0.15.1 的坑（本项目实测，别再踩）

- `\xi` `\nu` 这类两字母希腊名会退化成字面 "xi"/"nu"；写 `$xi$`、`$nu$` 才对。本文高频的
  下标名（`rad`、`non-rad`、`P`、`d`、`m`、`HMM`）都写成 `$"rad"$` 或直接 `text`：
  **`PF_rad` 统一写 `$"PF"_rad$`**（`"…"` 里的多字母是正体，不会被拆成斜体变量乘积）。
- 化学式：原文用 mhchem 的 `\ce{Sb2S3}` 和裸 `Sb$_2$S$_3$` 混写。译文统一用**字面 Unicode 下标**：
  Sb₂S₃、TiO₂、SiO₂、Ag。别在数学里写 `Sb_2S_3`（`S_2S` 会被当两个变量）。
- 上标带括号会被吞：`c^(n)` → 写 `c^((n))`。
- 正文里的 `/` 会立成分数；行内比写 `$a slash b$` 或干脆用文字"除以"。
- `bar(x)` 是绝对值不是上横线；要上横线用 `macron`。本文的 |*E*|、|*E*₀| 本来就是绝对值，
  写 `$"|" E " "|"$` 或直接 `$"|"E|"|"$`。
- 求和/积分若要上下限正上下方，在 `eqn` 里必须 `limits(sum)_(…)`；grid 单元格里默认按行内式排，
  下标会跑到右边。本文方法节的 `$∫_A$` 用 `limits(int)_A`。
- **内容模式里多出来的 `)` 不报错，会照排成字面右括号。**写完自己数一遍括号配平。
- 图片：`#image("figs/Fig1.png", width: 100%)`。五幅都是跨栏整幅图，一律
  `#fig("1", breakable: false)[ 图注 ]( #image(…) )`。
- 表格：`#tbl("1")[ … ]( … )` 内部用 `table(columns: …)`，三线表用
  `stroke: (x, y) => { if y == 0 or y == 1 or y == 7 … }` 这类判断；表头粗体。
  表 1 有 6 行数据 + 2 行表头，注意 `y` 从 0 起算且表头占两行。
- 单位：`\SI{5}{\nm}` → `5 nm`（数字与单位之间用空格，别用 `~`）；`\SI{0.3}{\micro\meter}` → `0.3 μm`；
  `\SI{6}{\micro\meter} \times \SI{6}{\micro\meter}` → `6 μm × 6 μm`。
- 温度 `~543 K`、能量 `~2.1 eV` 里的 `~` 在原文是"约"的意思（不是 LaTeX 不间断空格），译成"约 543 K"。
- `>` `<` 在数学里写 `$>$` `$<$`；正文里写"大于""低于"更顺，但数值区间如 `>100`、`<0.01`
  可保留符号并放进数学模式。

## 5. 译文风格（用户长期要求，硬性）

- 中文，无翻译腔：句式要变通，别把 "we show that…" 一律写成"我们展示了……"，
  "It is worth noting that" 不要写成"值得注意的是"。主语可省、可换、可被动转主动。
- 每段首行缩进由全局 `first-line-indent` 处理，**frag 里不要自己加空格或 `#v()`**。
- 不要给正文加粗、加引号来"强调"，除非原文确实斜体强调（原文的 `\textit{first aim}`、
  `\textit{second aim}` 用"第一个目标""第二个目标"直陈即可，不必加格式）。
- 术语统一（本稿定名，勿改）：

| 英文 | 中文 |
| --- | --- |
| hyperbolic metamaterial (HMM) | 双曲超材料（HMM） |
| Purcell factor (PF) | Purcell 因子（PF） |
| radiative Purcell factor (PF_rad) | 辐射 Purcell 因子（PF_rad） |
| external quantum efficiency (EQE) | 外量子效率（EQE） |
| photonic density of states (PDOS) | 光子态密度（PDOS） |
| photonic crystal (PhC) | 光子晶体（PhC） |
| single-photon emitter (SPE) | 单光子发射器（SPE） |
| effective medium theory (EMT) | 有效介质理论（EMT） |
| phase-change material (PCM) | 相变材料（PCM） |
| high-$k$ modes | 高 *k* 模式 |
| light line / light cone | 光锥（"light line" 亦作光锥线） |
| outcoupling | 输出耦合 |
| transfer matrix method | 传输矩阵方法 |
| finite-difference time-domain (FDTD) | 时域有限差分（FDTD） |
| metal fraction | 金属占比 |
| type I / type II hyperbolicity | 第一类 / 第二类双曲性 |
| amorphous / crystalline phase | 非晶相 / 晶相 |
| switching contrast | 开关对比度 |
| near-infrared | 近红外 |
| ohmic loss | 欧姆损耗 |
| quenching | 猝灭 |
| color center | 色心 |
| quantum dot | 量子点 |
| numerical aperture (NA) | 数值孔径（NA） |
| perfectly matched layer (PML) | 完全匹配层（PML） |

- 首次出现给"中文（英文缩写）"，之后用缩写。缩写与中文之间不加空格：`双曲超材料（HMM）`。
- 数字与单位、中文与拉丁字母之间由排版自动留空，不要手写空格。

## 6. 分片

| 文件 | 覆盖 tex 行 | 内容 |
| --- | --- | --- |
| `frag_1.typ` | 93–121 | 摘要 + 关键词 + 引言全节 |
| `frag_2.typ` | 123–143 | `= 结果与讨论` 一级标题 + 图 1 + EMT/PF/EQE 论述各段 |
| `frag_3.typ` | 144–195 | 表 1 + 图 2 + PhC 纳米图形化论述，含式 (1) |
| `frag_4.typ` | 197–231 | `=== 双曲性的可调谐` + 图 3 + 图 4 + 相关段落 |
| `frag_5.typ` | 234–282 | 图 5 + 结论 + 致谢 + 方法（式 (2)）+ 竞争利益 + 数据可用性 |
| `refs.bib` | — | 单独代理：从 `References.bib` 抽出被引的 41 条，按首引顺序 |

一级标题写法：`= 结果与讨论`、`= 结论`、`= 方法`；二级用 `== 双曲性的可调谐`。
（`main.typ` 已设 `heading(numbering: none)`，标题不会带号。）

## 7. 交付前自查（每个 frag 自己先跑）

在自己的 frag 上建一个临时 `_bN_typ.typ`（`#import` 全局设置照 `main.typ` 抄）单独编译，
确认 0 error 0 warning，再 `pdftoppm -r 150` 看图。临时文件一律用**自己的单字母前缀**（本 lane 是 `b`，
加数字后缀如 `_b3_`）。最后把 frag 交回来，合并与逐页验收由协调者做。

## 8. frag_1 实测补充（后续分片必读，覆盖 §4 的对应条目）

- `$"PF"_rad$` **会报错** `unknown variable: rad`。带连字符或多字母的下标也要加引号：
  写成 `$"PF"_"rad"$`、`$Gamma_"non-rad"$`。
- 摘要框模板里的 `#h(2em)[内容]` **报错** unexpected argument，正确写法是 `#h(2em)内容`（不带方括号）。
- **含 `/` 的 bib 键不能用 `@key`** —— label 语法在斜杠处截断。原文有 7 个这种键
  （`doi:10.1021/…`、`https://doi.org/…`、`oea-2021-0031-Andrei` 一类）。统一改写：

  ```typst
  #cite(label("doi:10.1021/acs.jpclett.2c03674"))
  #cite(label("https://doi.org/10.1002/adom.202202759"), label("Akselrod2014"))
  ```

  `refs.bib` 保持 tex 原键名不变（含斜杠），两边才能对上。
- `@key` 紧跟汉字时会把汉字吞进 label，引用后必须接标点或空格。
- 缩写展开：全文只在**首次出现处**给"中文（缩写）"，摘要与正文各算一次首次，之后一律用缩写或纯中文名。
- tex 第 102/103 行之间没有空行，但内容上是两段（"固体单光子发射器……"与"工程化的光学微腔……"），
  按两段排。

## 9. frag_2 实测补充（后续分片必读）

- **`\epsilon` 会报错** `unknown variable: psilon`（Typst 把 `\e` 当控制符吃掉，剩下 `psilon` 当变量）。
  希腊字母一律**不带反斜杠**：`$epsilon$` → ε。下标同理：`$epsilon_perp$` → ε_⊥、
  `$epsilon_parallel$` → ε_∥。写成 `$epsilon_"perp"$` 反而只排出字面 "perp"（引号下标不做符号映射）。
- `fig`/`tbl` 宏的第三个参数是**内容块**，调用形式是 `#fig("1", breakable: false)[ 图注 ][ 正文 ]`
  （两个方括号连写）。**不要**写成 `#fig("1")[ 图注 ]( #image(...) )` —— 圆括号形式会报
  "the character `#` is not valid in code"。
- `#cite(label("…"))` 前面**不能加 `@`**。`@cite(...)` 会被解析成引用名为 `<cite>` 的标签。
- 正文里裸写 `<0.01`、`>100` 会触发 unclosed label / unclosed delimiter，数值不等号一律进数学模式。

## 10. 交付前排版复核（2026-09-28 04:08，lane-B）

**全文五幅 `figure*` 一律改用 `#figf` 浮动，不能只改最高的一幅。**

起初只把占整页的图 3 包成浮动体，编译后第 5 页底部仍空着 8 cm。逐页像素探针定位到真凶：
紧跟其后的图 4 是非浮动 `block(breakable: false)`，在剩余 8 cm 里放不下，于是整块被推到下一页，
把第 5 页的正文截断在半页处；而图 3 浮动到第 6 页顶部后，它下方 5.5 cm 又塞不下图 4，
空洞便顺着版面往下接力。把图 1/2/4/5 一并换成 `#figf` 之后：10 页 → 9 页，
`blank_bands.py` 只剩末页一条（正文自然收尾），逐页目检无空洞。

判据：**只要一篇稿子里有多幅整宽跨栏大图，就必须全部浮动**，否则空洞会在图与图之间传递，
修一幅只把洞挪到下一页。

另记一条工具坑：`blank_bands.py` 在退出前会 `os.remove()` 掉自己渲染的 PNG，
所以它扫过的 `<tag>-NN.png` 事后无法复查；要看图就用**另一个从未用过的文件名前缀**重新
`pdftoppm -r 75 -png`。同一目录下复用旧前缀会得到过期画面，容易把"已修好"误判成"没修好"。
