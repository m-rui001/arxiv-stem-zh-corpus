# 2609.30268 翻译与排版约定（协调者 lane-B 维护，子代理只写自己那一个 frag）

原文：`papers/2609.30268/main-qcst.tex`（amsart 风格单栏，pdflatex，**20 页**，
1526 行，七个主节 + 附录 A，**全文无图无表**，参考文献是 tex 内手写的 23 条 `\bibitem`）。
标题：Quantum Channel Stein Theorem beyond Definite Causal Order
作者：Chengkai Zhu（QudeLeap Research, 上海）、Xin Wang（HKUST-GZ，通讯）
中文标题：**超出确定因果序的量子信道 Stein 定理**

---

## 1. 权威编号来源

**已用本机 TeX Live 2025 把原文编译出来，`main-qcst.aux` 的 `\newlabel` 就是编号的唯一权威**
（已存档在 `papers/2609.30268/main-qcst.aux`）。下面 §2/§3 的表是从 aux 抽出来的，
子代理**照抄**，一律不许自己数、不许改动。

编号规则（tex L43–60, L136）：
- `\numberwithin{equation}{section}` → 式号形如 `(4.7)`；附录里是 `(A.1)`、`(A.2)`。
- Theorem / Proposition / Lemma / Corollary / Definition / Remark **共用同一个按节计数器**
  （`aliascnt` 全部挂到 theorem 计数器上）。所以"定义 2.1、定义 2.2、定义 2.3、定理 2.4"
  是同一个序列；§5 里是"定理 5.1、引理 5.2、引理 5.3、推论 5.4、注 5.5"。
- 有 4 个定理类条目在 tex 里**没有 `\label`**，但占号：定义 2.1 / 2.2 / 2.3、注 5.5。

## 2. 定理类条目全表（16 项）

| 编号 | 类型 | tex 行 | 原文标题（可选方括号里的） |
| --- | --- | --- | --- |
| 定义 2.1 | definition | L284–300 | Parallel strategy |
| 定义 2.2 | definition | L302–327 | Adaptive strategy |
| 定义 2.3 | definition | L329–349 | General strategy |
| 定理 2.4 | theorem | L430–444 | Channel Stein theorem and exponential strong converse |
| 定理 3.1 | theorem | L547–564 | Exact one-shot duality |
| 引理 4.1 | lemma | L722–733 | Normalized testing slack |
| 定理 5.1 | theorem | L887–896 | Regularized Rényi endpoint |
| 引理 5.2 | lemma | L936–943 | Lifting positive order to amplitudes |
| 引理 5.3 | lemma | L1014–1023 | Tensor amplitude moment bound |
| 推论 5.4 | corollary | L1162–1175 | Modified smooth max-relative entropy AEP |
| 注 5.5 | remark | L1218–1230 | Budgets and boundary checks |
| 推论 6.1 | corollary | L1305–1318 | Exact exponent and its threshold |
| 命题 A.1 | proposition | L1417–1428 | Polynomial parallelization |

证明环境 `\begin{proof}` 不编号；带方括号说明的证明（如 L1068
`\begin{proof}[Proof of \Cref{thm:endpoint}]`、L1136 "Completion of the proof of …"）
译成"证明（定理 5.1）。"这类起头，收尾照常出 □。

## 3. 编号公式全表（60 式，按节连续无缺）

行号 = tex 里 `\label` 所在行，子代理据此定位。**每式恰好一次，不得增删编号。**

- §2（13 式）：2.1 eq:choi L257｜2.2 eq:state-testing L268｜2.3 eq:tester-errors L279｜
  2.4 sdp:parallel L295｜2.5 eq:comb L316｜2.6 eq:normalization L341｜2.7 eq:roc L356｜
  2.8 eq:probabilities L388｜2.9 eq:state-relative-entropy L396｜2.10 eq:channel-divergence L405｜
  2.11 eq:regularization L414｜2.12 eq:rates L423｜2.13 eq:stein L438
- §3（9 式）：3.1 L486｜3.2 L495｜3.3 L514｜3.4 L531｜3.5 L542｜3.6 L556｜3.7 L560｜3.8 L575｜3.9 L605
- §4（13 式）：4.1 L666｜4.2 L702｜4.3 L710｜4.4 L728｜4.5 L757｜4.6 L776｜4.7 L796｜4.8 L805｜
  4.9 L814｜4.10 L832｜4.11 L851｜4.12 L866｜4.13 L873
- §5（18 式）：5.1 L894｜5.2 L924｜5.3 L941｜5.4 L948｜5.5 L969｜5.6 L981｜5.7 L989｜5.8 L1006｜
  5.9 L1021｜5.10 L1036｜5.11 L1046｜5.12 L1057｜5.13 L1077｜5.14 L1088｜5.15 L1105｜
  5.16 L1116｜5.17 L1147｜5.18 L1172
- §6（5 式）：6.1 L1258｜6.2 L1267｜6.3 L1275｜6.4 L1293｜6.5 L1314
- 附录 A（2 式）：A.1 L1426｜A.2 L1435

`\begin{align}` 里两个 `\label` 会占两个号（如 L552 那个 align 给 3.6/3.7，
L827 给 4.10，L846 给 4.11，L1052 给 5.12，L1100 给 5.15）——照表写，别自己合并。

## 4. 分片表（子代理各写一个文件，别的都不许碰）

| frag | tex 行范围 | 内容 | 应含编号 |
| --- | --- | --- | --- |
| frag_1.typ | L160–240 | 摘要 + §1 引言（含 L189 那个居中斜体问题句，用 `#question[...]`） | 无编号式 |
| frag_2.typ | L241–460 | §2 信道判别：定义 2.1–2.3、定理 2.4 | 式 2.1–2.13 |
| frag_3.typ | L461–646 | §3 精确单时对偶 | 式 3.1–3.9、定理 3.1 |
| frag_4.typ | L647–879 | §4 从检验得分到正 Choi 界（含小节 4.1 二元 Rényi 界） | 式 4.1–4.13、引理 4.1 |
| frag_5.typ | L880–992 | §5 开头 + 5.1 小节 | 式 5.1–5.7、定理 5.1、引理 5.2 |
| frag_6.typ | L993–1065 | §5.2 相干幅值估计 | 式 5.8–5.12、引理 5.3 |
| frag_7.typ | L1066–1232 | §5.3–5.4 端点闭合与定理完成 | 式 5.13–5.18、推论 5.4、注 5.5 |
| frag_8.typ | L1233–1344 | §6 有限次界与精确强逆指数 | 式 6.1–6.5、推论 6.1 |
| frag_9.typ | L1345–1409 | §7 讨论 + 致谢 + 作者贡献 | 无编号式 |
| frag_10.typ | L1410–1452 | 附录 A 精确多项式并行化 | 式 A.1–A.2、命题 A.1 |

**frag_7 与 frag_6 之间有一处跨片证明**：定理 5.1 的证明从 L1068 开始、到 L1134 结束，
整段在 frag_7 内，不跨片。真正要注意的是 **frag_5 结尾 L992 与 frag_6 开头 L993 属于同一段
行文不同小节**，按小节标题自然断开即可；`#proof[...]` 不许只写一半。

## 5. Typst 硬约定（**违反必炸**，都是实测过的）

1. 每个 `frag_N.typ` 的**第一行**必须是：
   ```typst
   #import "macros.typ": *
   ```
   `#include` 不继承父文件作用域；漏了这一行 `main.typ` 报 `unknown variable: eqn`。
2. 编号公式：`#eqn("(2.1)")[ $ … $ ]`，**编号字符串带括号**，原样照 §3 的表写。
   不编号的显示公式用 `#eqnb[ $ … $ ]`。
3. 定理类：`#thm("定理", title: "2.4")[ … ]`。**body 走 `[...]` 内容参数，不要写 `body: [...]`**
   （会报 `unknown variable: body`）。kind 只认这几个字面词：`定理 / 引理 / 推论 / 命题 / 定义 / 注`，
   配色已在 `macros.typ` 里按原文 mdframed 分派好了。
4. 证明：`#proof[ … ]`（自动"证明。"起头 + 右对齐 □）。
5. 交叉引用一律**写死字面编号**：`\Cref{thm:stein}` → "定理 2.4"，`\eqref{eq:choi}` → "式 (2.1)"，
   `\Cref{sec:reduction}` → "第 4 节"。**不要用 `@label`**（本稿编号是烘焙的字面值，走 @ 会断链）。
6. 文献引用：一律 `@key`（如 `@FawziFawzi2021`），**不写死数字 [5]**。
   tex 的 `\cite[Theorem 5.5]{FawziFawzi2021}` 把可选说明放进正文句子：
   "…这一指数的表达式见 @FawziFawzi2021 定理 5.5"。
   - **`@key` 后面必须留一个空格或中文标点**；紧跟汉字会被吞进 label 变成未知引用。
   - 多引用并列裸写 `@A @B`，**不要**写 `[@A, @B]`（ieee 样式会印成 `[[3], [4]]`）。
   - bibitem 顺序 == 正文首引顺序（已核对），所以 ieee 样式自动编号就是原文的 [1]–[23]。
7. 数学书写（Typst 0.15）：
   - **希腊字母一律直接写 Unicode**（`α β γ ε δ ρ σ τ Φ Ψ Ω χ` 等）。`\varepsilon` 这种
     LaTeX 反斜杠写法在 Typst 里报 "unknown variable"（`\` 是转义符），绝不要用。
     需要区分 `\varepsilon`/`\epsilon` 时统一用 ε。
   - **不许用 `over`/`left`/`right`**：分数 `frac(a,b)`，定界符 `lr(( ))`、`lr([ ])`、`lr({ })`。
   - 范数一律 `norm(...)`，**不要手搓裸 `‖`**；`D(cal(N) ‖ cal(M))` 这类"散度分隔"用
     `parallel`（`$D( cal(N) parallel cal(M))$`）。
   - 多字母函数名/算子加引号：`"Tr"`、`"sup"`、`"inf"`、`"rank"`、`"supp"`、`"id"`、`"span"`；
     连续大写字母会被当变量，`SO(2)` 要写 `"SO"(2)`。
   - `\cdots` → `dots.h`（**`cdots` 不是 Typst 符号**）；`\ldots` → `dots.l`。
   - `sqrt` 必须带括号 `sqrt(2)`，写 `sqrt 2` 会印成英文单词 sqrt。
   - 上下标里的希腊/符号用 Unicode，不要 `_ "pm"`（会原样印 pm）；正负号写 `±`。
   - 集合/逻辑符号缺的很多：`cap/cup/subset/otimes` 不存在，用 Unicode `∩ ∪ ⊗`；
     属于是 `in`，不属于 `not in`。
   - `\mathbb 1` → $bold(1)$ 或 `mathcal`？统一写 $mathbb(1)$（Typst 有 `mathbb`）。
     `\mathcal L` → `cal(L)`；`\widetilde D` → `tilde(D)`；`\widehat` → `hat(...)`。
   - 积分 `integral`（`int` 被内置整数类型遮蔽）；`qquad` 不存在，用 `quad quad`。
   - 分段用 `cases(...)`，分支之间用逗号，**分支里不要写 `;`**；`cases()` 不能有 `columns:`。
8. 正文里不要留英文句。术语按 §6 的表统一；专名（Hiai–Petz、de Finetti、Rényi、Stein、
   Tomamichel、Lütkenhaus、Brukner 的 Č 等）保持原文拼写。
   **注意**：Noto Serif SC 的 caron（ǎ Č ř ł）字形是坏的，参考文献已通过
   `main.typ` 里的 `#show bibliography: set text(lang: "en", font: ("New Computer Modern", "Noto Serif SC"))`
   规避；正文里若出现带 caron 的专名，用 `#text(font: "New Computer Modern")[Č]` 包一下。
9. 排版：中文段落**每段首行缩进 2em**（已在 main.typ 全局设好，片段里不要覆盖）；
   列表、公式块、定理框内不缩进（宏里已处理）。
10. 标题用 `= 2　信道判别`、`== 4.1　二元 Rényi 界`（节号手写进标题文本，中间是**全角空格**）。
    节号见 §7 结构表。

## 6. 术语表（全稿统一，子代理不要另创）

| 英文 | 中文 |
| --- | --- |
| quantum channel | 量子信道 |
| memoryless | 无记忆 |
| channel discrimination | 信道判别 |
| hypothesis testing / tester | 假设检验 / 检验器 |
| Type-I / Type-II error | 第一类 / 第二类错误 |
| Stein exponent / Stein's lemma | Stein 指数 / Stein 引理 |
| (exponential) strong converse | （指数）强逆命题 |
| parallel / adaptive / general strategy | 并行 / 自适应 / 一般策略 |
| indefinite causal order | 不定因果序 |
| quantum comb / processor | 量子梳 / 超过程 |
| Choi operator / Jamiołkowski isomorphism | Choi 算符 / Jamiolkowski 同构 |
| channel relative entropy | 信道相对熵 |
| sandwiched Rényi channel divergence | 夹逼 Rényi 信道散度 |
| regularized | 正则化的 |
| max-relative entropy | 最大相对熵 |
| smooth entropy / smoothing | 平滑熵 / 平滑 |
| one-shot | 单发 |
| asymptotic equipartition property (AEP) | 渐近等分性 |
| de Finetti reduction | de Finetti 归约 |
| weighted binary testing score | 加权二元检验得分 |
| hockey-stick divergence | 曲棍球棒散度 |
| data-processing inequality | 数据处理不等式 |
| affine hull | 仿射包 |
| positive part | 正部 |
| amplitude | 幅值 |
| slack | 松弛量 |
| reference-assisted | 参考辅助的 |
| entangled probe | 纠缠探针 |
| finite-dimensional | 有限维 |
| fidelity | 保真度 |
| trace norm / trace distance | 迹范数 / 迹距离 |
| order (of a Rényi divergence) | （Rényi 散度的）阶 |
| achievability / converse | 可达性 / 逆命题 |
| type-I error exponent | 第一类错误指数 |

固定句式：`$ε in (0,1)$`（希腊字母直接写 Unicode），"对任意固定的第一类错误容限
$ε in (0,1)$"；`whenever` → "只要…"；`yields` → "给出"，不要"产生了"。

## 7. 结构表（节号 + 中文标题）

| 节 | 英文 | 中文标题 |
| --- | --- | --- |
| 1 | Introduction | 引言 |
| 2 | Channel discrimination | 信道判别 |
| 3 | The exact one-shot duality | 精确的单时对偶 |
| 4 | From testing scores to positive Choi bounds | 从检验得分到正的 Choi 界 |
| 4.1 | Binary Rényi bounds | 二元 Rényi 界 |
| 5 | The regularized endpoint and the Stein converse | 正则化端点与 Stein 逆命题 |
| 5.1 | A positive slack gives one common amplitude | 正的松弛量给出统一的幅值逼近 |
| 5.2 | One tensor estimate for arbitrary entangled probes | 对任意纠缠探针的一次张量估计 |
| 5.3 | Closing the endpoint with two approximation rates | 用两种逼近速率闭合端点 |
| 5.4 | Completing the channel Stein theorem | 完成信道 Stein 定理 |
| 6 | Finite-use bounds and the exact strong-converse exponent | 有限次界与精确强逆指数 |
| 6.1 | The full fixed-order converse | 完整的定阶逆命题 |
| 6.2 | The exact strong-converse exponent | 精确的强逆指数 |
| 7 | Discussion | 讨论 |
| A | Exact polynomial parallelization | 精确的多项式并行化 |

范围决定（协调者已定，子代理不必再问）：
- 原文 L165–170 的 `\tableofcontents` **不做**（那是 arXiv 预印本的可读性安排，与正文内容无关）。
- 原文无图无表，所以本稿零 CeTZ、零 table。
- mdframed 的浅色框已在 `macros.typ` 复刻，颜色照 tex L18–23。
- 作者署名下方的单位、通讯邮箱脚注照译；`date` 的 "September 2026" 译作"2026 年 9 月"。
- 致谢里点名 Lami、Regula、Li Gao、Yinan Li；作者贡献段如实说明"定理 5.1 的初版由
  GPT-5.6 sol 生成、作者负责核验"——**照原文译，不增删评论**。

## 8. 符号实测表（本稿在本机 Typst 0.15.1 逐条编译验过，照此写）

**可用**：`bb(1)`（ℝ/ℂ/𝟙 用 `bb(R)`、`bb(1)`）、`cal(N)`、`frak(H)`、`tilde(D)`、`hat(J)`、
`macron(a)`、`dot(a)`、`dot.double(a)`、`norm(rho)`、`abs(x)`、`parallel`（散度分隔 $D( cal(N) parallel cal(M) )$）、
`dots.h`（⋯）、`integral`、`sum_(i=1)^n`、`union.big`（⋃）、`sup`、`inf`、`lim`、
`"Tr"`、`"rank"`、`"supp"`、`"span"`、`"id"`、`"par"`、`"ada"`、`"gen"`、
`mapsto`（⟼）、`arrow.tr`（转置箭头 ⊤ 用 `T`）、`⟂`、`≐`、`approx.eq`、`lt.approx`、`lt.eq`、`gt.eq`、
`eq.def`（=：）、`colon.eq.double`、`prop`（∝）、`therefore`、`because`、`dif`（微分 d）、
`binom(n,k)`、`mat(1,2;3,4)`、`cases(1, 2)`、`floor(x)`/`ceil(x)`/`brace(x)` 配对定界符、
Unicode 直写：`⊗ ⊕ ⊙ ⊓ ⊔ ⋂ ∩ ∪ ⊂ ⊆ ⊄ ∈ ∉ ≪ ≫ ⟨ ⟩`。

**不可用（会直接报错，别试）**：`mathbb`、`otimes`、`oplus`、`tensor`、`intersect`、`sect.big`、
`product.big`、`big.union`、`vector`、`eye`、`seq`、`opar`、`transpose`、`surd`、`ll`、`gg`、
`eqcolon`、`lt.sim`、`gt.sim`、`gt.n`、`lt.n`、`gt.eq.sim`、`subset.n.eqs`、`union.mx`、`sup.n`、
`angle.l`/`angle.r`、`absangle`、`tilde.hat`、`bar.hat`、`bold.cal`、`cdots`、`dots.l`、`limit`、`qquad`、`over`、`left`、`right`。
其中 `mid` 是函数不是符号（`lr(mid)` 会报 "expected content, found function"），
式子里表示"条件/使得"的竖线直接写 `|`。

**零告警陷阱（编译通过但排版错）**：`sqrt 2` 印成英文单词、`_ "pm"` 原样印 pm、
`$ … ∥ … $` 裸双竖线会吞掉中间内容、`9/10` 自动堆成分数（行内写 `9 slash 10`）、
连续字母被当变量（`$SO(2)$` 要写 `$"SO"(2)$`）、`@key` 紧跟汉字被吞、
`D_"max"(ρ)` 会把左括号吞进下标（写成 `D_"max" (ρ)`，全篇 15 处）、
`R^(k)` 丢括号（写 `R^paren(k)`）、代码块里 `brace(h: …)` 被当命名参数（写 `{h: …}`）。

**宏里 `#set` 会切断段落**：`[ #text(...)[标题] \n #set par(first-line-indent: 0em) \n #body ]`
渲染成"标题独占一行"。正确写法是把 `#set` 放到块内容最前、标题与 `#body` 紧挨：
`#text(weight: "bold")[#kind　#title。]#body`。本文 13 个定理框 + 9 个证明块因此省掉一整页。
