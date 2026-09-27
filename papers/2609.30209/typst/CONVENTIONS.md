# 2609.30209 译本约定与编号地图

原文：Linjun Li, Shihe Liu, Lingfu Zhang, *Localization near the edge for the lattice
Anderson-Bernoulli model on general dimension*, arXiv:2609.30209（amsart，48 页）。
中文题名：《格点 Anderson–Bernoulli 模型在任意维下谱边缘附近的定域化》。

## 1. 全局排版约定（子代理必须遵守）

- 页面/字体/缩进在 main.typ 里统一设定，片段里**不要**再写 `#set` 或 `#show`。
- **所有编号都是字面字符串**（main.typ 里 `#set heading(numbering: none)`）。
  式号照抄本文件 §2 的表；定理类序号照抄；图的 `图 N` 照抄。任何"自己数一遍"都是错的。
- 显示公式：`#eqn("(2.13)")[ $ body $ ]`；原文 `equation*`/`\notag`/`align*` 用
  `#eqnb[ $ body $ ]`（不填号）。
- 多行对齐：在**一个** `#eqn` 里用 `$ a &= b \ c &= d $`；整块只挂一个号（与原文一致）。
- 定理类：`#thm("引理 2.4")[ 陈述…… ]`；`#begin{proof}` → `#proof[ … ]`，
  带说明的 `[Proof of X]` → `#proofof("构造 3.8")[ … ]`。
- 图：只写 `#fig("4")[ 图 4　译好的图注 ][ #include "fig/graded_set.typ" ]`，
  文件名与图号见 §3。**不要**翻译或改写 TikZ 源码，也不要自己画图。
- 引文：`\cite{And58}` → `@And58`；`\cite[Theorem~3.9]{Kir08}` → `@Kir08 [定理 3.9]`。
  引用号由 `#bibliography(style:"ieee")` 自动生成，不要在正文里写死 [12]。
- `\ref{sec:DUC}` → 直接写节号字面（本表 §2 给出每个 label 的编号），如"第 3 节"。
- 脚注 `\footnote{...}` → `#footnote[...]`。
- `\operatorname{X}` / `\rm X` → 数学模式里的 `"X"`，例如 `$"spec"(H)$`、`$"supp" u$`。
- 希腊字母、ℤ/ℕ/ℝ/ℂ/𝔼/ℙ 等直接写 Unicode；`\Z^d` → `$"Z"^d$` 保持黑体 Unicode：
  `$ℤ^d$`、`$ℝ^d$`、`$ℙ$`、`$ℰ$` 用 Unicode，不要写 `\Bbb`。
- **数学串里不许出现未闭合的双引号**：`$"spec"(H)$` 必须成对。
  未闭合会让解析器把后面几百个汉字吞成字面量，且编译 0 报错（第 27 轮翻过车）。
  写完跑 `python tools/typst_math_scan.py papers/2609.30209/typst/`。
- 交付物里**不允许残留任何 LaTeX 命令**（`\`、`{}`、`$...$` 之外的 `\frac`、`\sum` 等）。
  Typst 数学用 `$ sum_{x in ℤ^d} $`、`$ frac(a,b) $`、`$ integral_A f $`、`$ hat(f) $`、
  `$ bar(x) $`、`$ vec(a) $`、`$ cc{A} $`（黑板体直接 Unicode）。
- 正文用中文，行文要像中文数学书：长句拆短、被动改主动、"we show that"别译成
  "我们展示了"这种翻译腔。定理陈述里的 "Assume that… then…" 用"设……则……"。
  人名、期刊、算子保持原文；首次出现的关键术语在括号里附英文。
- 每个片段独立编译不了，别去 `#import`；只用 main.typ 已导入的宏（§1 列出的那几个）。

## 2. 编号地图（权威 = pdflatex 的 .aux，共 206 个 label）

下面按片段列出**本片段内定义**的 label 及其排印编号。
"被引"列是该 label 全文被 `\ref` 的次数，用于交叉核对，不是要你去引用。


### frag_1（tex 第 309–656 行）— §1 引言（含定理 1.1、§1.2 证明策略、§1.3 AI 使用说明）

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `eq:ABM-schrodinger-operator` | 1.1 | 1 | 公式 | 0 |
| `eq:free-Laplacian` | 1.2 | 1 | 公式 | 0 |
| `eq:Bernoulli-potential` | 1.3 | 1 | 公式 | 0 |
| `eq:as-spectrum` | 1.4 | 1 | 公式 | 0 |
| `thm:localization-near-the-edge-band` | 1.1 | 2 | 定理 | 2 |
| `ssec:iop` | 1.2 | 4 | 小节 | 1 |
| `eq:DUCneed` | 1.5 | 4 | 公式 | 0 |

### frag_2（tex 第 657–1047 行）— §2 线性鞅系统 + §2.1 被条带截去的凸集体积估计

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `sec:linear-martingale-system` | 2 | 7 | 节 | 1 |
| `def:linear-martingale-system` | 2.1 | 8 | 定义 | 6 |
| `eq:source` | 2.1 | 8 | 公式 | 0 |
| `eq:sink` | 2.2 | 8 | 公式 | 0 |
| `fig:fan-input-body` | 1 | 9 | 图 | 1 |
| `eq:propagation-condition` | 2.3 | 9 | 公式 | 0 |
| `eq:coefficient-bound-condition` | 2.4 | 9 | 公式 | 0 |
| `eq:fan-width` | 2.5 | 9 | 公式 | 0 |
| `fig:complex-central-strip` | 2 | 10 | 图 | 1 |
| `lem:complexstrip` | 2.3 | 10 | 引理 | 2 |
| `eq:complexstrip` | 2.6 | 10 | 公式 | 0 |
| `eq:rotation-invariance-section-volume` | 2.7 | 10 | 公式 | 0 |
| `eq:BM-seed` | 2.8 | 10 | 公式 | 0 |
| `eq:zero-max-section-volume` | 2.9 | 10 | 公式 | 0 |

### frag_3（tex 第 1048–1470 行）— §2.2 传播引理

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `eq:fan-NB` | 2.10 | 11 | 公式 | 0 |
| `eq:fan-highmass` | 2.11 | 11 | 公式 | 0 |
| `eq:fan-outputcount` | 2.12 | 11 | 公式 | 0 |
| `lem:propagation` | 2.4 | 12 | 引理 | 7 |
| `eq:fan-budget` | 2.13 | 12 | 公式 | 0 |
| `eq:propagation-bound` | 2.14 | 12 | 公式 | 0 |
| `eq:def-P-delta` | 2.15 | 12 | 公式 | 0 |
| `eq:propagation-bound-equal` | 2.16 | 12 | 公式 | 0 |
| `eq:fixed-input-propagation` | 2.17 | 12 | 公式 | 0 |
| `eq:propagation-loss-domination` | 2.18 | 13 | 公式 | 0 |
| `eq:cut-in-source-blocks` | 2.19 | 13 | 公式 | 0 |
| `eq:cut-in-targets` | 2.20 | 13 | 公式 | 0 |
| `eq:K-has-inner-ball` | 2.21 | 14 | 公式 | 0 |
| `eq:each-cut-ratio` | 2.22 | 14 | 公式 | 0 |
| `eq:fan-volume-ledger` | 2.23 | 14 | 公式 | 0 |
| `eq:cardinality-upper-bound-via-convex-geo` | 2.24 | 14 | 公式 | 0 |
| `fig:common-inner-ball` | 3 | 14 | 图 | 1 |
| `eq:fan-record-count` | 2.25 | 14 | 公式 | 0 |
| `eq:active-indicator` | 2.26 | 15 | 公式 | 0 |
| `eq:good-color-set` | 2.27 | 15 | 公式 | 0 |
| `eq:success-indicator` | 2.28 | 15 | 公式 | 0 |
| `eq:compare-If-Af` | 2.29 | 15 | 公式 | 0 |
| `eq:record-propagation-loss` | 2.30 | 15 | 公式 | 0 |
| `eq:nonempty-of-favourable-set` | 2.31 | 15 | 公式 | 0 |
| `eq:fan-fresh-active` | 2.32 | 15 | 公式 | 0 |
| `eq:filtration-exponential-estimate` | 2.33 | 16 | 公式 | 0 |
| `eq:fan-exponential` | 2.34 | 16 | 公式 | 0 |
| `eq:record-upper-tail` | 2.35 | 16 | 公式 | 0 |
| `eq:fan-activity` | 2.36 | 16 | 公式 | 0 |
| `eq:fan-cut-charge` | 2.37 | 16 | 公式 | 0 |
| `eq:propagation-record-domination` | 2.38 | 16 | 公式 | 0 |
| `eq:propagation-union-bound` | 2.39 | 16 | 公式 | 0 |

### frag_4（tex 第 1471–1692 行）— §3.1 分级集合与 PDUC 的陈述

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `sec:DUC` | 3 | 17 | 节 | 3 |
| `sec:graded-set` | 3.1 | 17 | 节 | 0 |
| `def:fsa-graded` | 3.1 | 17 | 定义 | 1 |
| `fig:graded-set` | 4 | 18 | 图 | 1 |
| `eq:pointwise-equation` | 3.1 | 19 | 公式 | 0 |
| `thm:duc-linear` | 3.2 | 19 | 定理 | 12 |
| `eq:fsa-probability` | 3.2 | 19 | 公式 | 0 |
| `eq:fsa-quadratic-count` | 3.3 | 19 | 公式 | 0 |

### frag_5（tex 第 1693–2147 行）— §3.2 分级集合的稀疏性 + §3.3 最小碗形边界

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `def:cone-chain` | 3.3 | 19 | 定义 | 0 |
| `prop:cone-property` | 3.4 | 19 | 命题 | 6 |
| `eq:cone-property-lower-bound` | 3.4 | 19 | 公式 | 0 |
| `lem:fsa-packing` | 3.5 | 20 | 引理 | 6 |
| `eq:fsa-packing` | 3.5 | 20 | 公式 | 0 |
| `eq:ample-free-site-in-long-chain` | 3.6 | 20 | 公式 | 0 |
| `eq:cone-chain-coordinates-changes` | 3.7 | 20 | 公式 | 0 |
| `eq:chain-in-i-t-grade` | 3.8 | 20 | 公式 | 0 |
| `eq:chain-in-0-grade` | 3.9 | 20 | 公式 | 0 |
| `eq:rewrite-packing` | 3.10 | 21 | 公式 | 0 |
| `eq:fsa-scale-sums` | 3.11 | 21 | 公式 | 0 |
| `eq:fsa-trace` | 3.12 | 21 | 公式 | 0 |
| `eq:fsa-recurrence` | 3.13 | 21 | 公式 | 0 |
| `eq:fsa-depth` | 3.14 | 22 | 公式 | 0 |
| `eq:height-interpretion` | 3.15 | 22 | 公式 | 0 |
| `eq:adjust-boundary` | 3.16 | 22 | 公式 | 0 |
| `eq:adjust-region` | 3.17 | 22 | 公式 | 0 |
| `fig:adjusted-boundaries-two-dimensions` | 5 | 22 | 图 | 1 |
| `thm:reconstruction` | 3.6 | 23 | 定理 | 7 |
| `eq:reconstruct-formula` | 3.18 | 23 | 公式 | 0 |
| `eq:bound-reconstruction-coefficients` | 3.19 | 23 | 公式 | 0 |
| `eq:reconstruct-ell-infty-control` | 3.20 | 23 | 公式 | 0 |
| `eq:reconstruction-time-order` | 3.21 | 23 | 公式 | 0 |
| `eq:reconstruction-height-closure` | 3.22 | 23 | 公式 | 0 |
| `eq:reconstruction-domain-closure` | 3.23 | 23 | 公式 | 0 |
| `eq:one-step-downside-recurrence` | 3.24 | 23 | 公式 | 0 |
| `eq:one-step-coefficient` | 3.25 | 24 | 公式 | 0 |
| `eq:exact-formula-reconstruct-coefficients` | 3.26 | 24 | 公式 | 0 |
| `eq:weight-P` | 3.27 | 24 | 公式 | 0 |
| `lem:min-bowl` | 3.7 | 24 | 引理 | 5 |
| `eq:min-bowl` | 3.28 | 25 | 公式 | 0 |
| `eq:height-no-touch` | 3.29 | 25 | 公式 | 0 |

### frag_6（tex 第 2148–2411 行）— §3.4 线性鞅系统的构造（陈述与图 6）

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `eq:feasible-direction` | 3.30 | 25 | 公式 | 0 |
| `construction:fc-system` | 3.8 | 26 | 构造 | 9 |
| `eq:ell-tag` | 3.31 | 26 | 公式 | 0 |
| `eq:input-as-initial-data` | 3.32 | 26 | 公式 | 0 |
| `eq:source-block-constants` | 3.33 | 26 | 公式 | 0 |
| `fig:fc-system` | 6 | 26 | 图 | 1 |

### frag_7（tex 第 2412–2744 行）— §3.4 构造 3.8 的证明（含图 7）

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `eq:cone-coordinate` | 3.34 | 27 | 公式 | 0 |
| `eq:line-in-direction` | 3.35 | 27 | 公式 | 0 |
| `eq:fc-source-blocks` | 3.36 | 27 | 公式 | 0 |
| `eq:fc-original-targets` | 3.37 | 27 | 公式 | 0 |
| `eq:fc-shell` | 3.38 | 27 | 公式 | 0 |
| `eq:fc-targets` | 3.39 | 27 | 公式 | 0 |
| `eq:cone-propagation-whole-region` | 3.40 | 28 | 公式 | 0 |
| `eq:fc-source-causality` | 3.41 | 28 | 公式 | 0 |
| `eq:fc-source-forms` | 3.42 | 28 | 公式 | 0 |
| `eq:fc-target-causality` | 3.43 | 28 | 公式 | 0 |
| `eq:source-blocks-of-same-kappa` | 3.44 | 28 | 公式 | 0 |
| `eq:fc-sink-forms` | 3.45 | 28 | 公式 | 0 |
| `rmk:fit-for-the-whole-line` | 3.9 | 28 | 注记 | 1 |
| `eq:zero-diff-low-line` | 3.46 | 29 | 公式 | 0 |
| `eq:fc-difference` | 3.47 | 29 | 公式 | 0 |
| `eq:diff-iteration-along-nu` | 3.48 | 29 | 公式 | 0 |
| `eq:initial-difference` | 3.49 | 29 | 公式 | 0 |
| `fig:backward-shifted-source-block` | 7 | 30 | 图 | 1 |
| `eq:formula-DXn` | 3.50 | 29 | 公式 | 0 |
| `eq:fc-contrast` | 3.51 | 29 | 公式 | 0 |

### frag_8（tex 第 2745–2887 行）— §3.5 环状结构多尺度自举：开场与引理 3.10

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `sec:bootstrap-annular` | 3.5 | 30 | 节 | 0 |
| `lem:many-lattice-lines` | 3.10 | 30 | 引理 | 3 |
| `eq:many-lattice-lines` | 3.53 | 30 | 公式 | 0 |
| `eq:portfolio-coordinate-map` | 3.54 | 30 | 公式 | 0 |
| `eq:portfolio-even-lattice` | 3.55 | 30 | 公式 | 0 |
| `eq:portfolio-inverse-map` | 3.56 | 31 | 公式 | 0 |
| `eq:portfolio-large-projection` | 3.57 | 31 | 公式 | 0 |

### frag_9（tex 第 2888–3321 行）— §3.5 定理 3.2 的证明（Step 1–3，含图 8）

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `eq:fsa-scales` | 3.58 | 32 | 公式 | 0 |
| `eq:fsa-scale-bounds` | 3.59 | 32 | 公式 | 0 |
| `eq:fsa-heights` | 3.60 | 32 | 公式 | 0 |
| `eq:low-bound-Hj` | 3.61 | 32 | 公式 | 0 |
| `eq:fsa-counts` | 3.62 | 32 | 公式 | 0 |
| `eq:fsa-seed` | 3.63 | 32 | 公式 | 0 |
| `eq:index-set-of-all-system` | 3.64 | 33 | 公式 | 0 |
| `eq:check-ke-lemma-parameter` | 3.65 | 33 | 公式 | 0 |
| `eq:fsa-record-bound` | 3.66 | 34 | 公式 | 0 |
| `eq:event-discribe-out-of-Ui` | 3.67 | 34 | 公式 | 0 |
| `eq:prob-of-Ui` | 3.68 | 34 | 公式 | 0 |
| `eq:number-sys-p` | 3.69 | 34 | 公式 | 0 |
| `eq:prob-absorb-Tp` | 3.70 | 34 | 公式 | 0 |
| `eq:Tp` | 3.71 | 34 | 公式 | 0 |
| `eq:final-probability` | 3.72 | 34 | 公式 | 0 |
| `eq:propagation-inequality-for-bootstrap` | 3.73 | 35 | 公式 | 0 |
| `eq:min-bowl-at-i-scale` | 3.74 | 35 | 公式 | 0 |
| `eq:fsa-mask` | 3.75 | 35 | 公式 | 0 |
| `eq:many-lattice-lines-apply` | 3.76 | 35 | 公式 | 0 |
| `fig:free-site-annular-bootstrap` | 8 | 36 | 图 | 1 |
| `eq:u_1-boundary-data` | 3.77 | 35 | 公式 | 0 |
| `eq:diff-solution-1` | 3.78 | 35 | 公式 | 0 |
| `eq:diff-solution-2` | 3.79 | 35 | 公式 | 1 |
| `eq:total-diff-solution` | 3.80 | 35 | 公式 | 0 |
| `eq:recontrol-1` | 3.81 | 36 | 公式 | 0 |
| `eq:recontrol-2` | 3.82 | 36 | 公式 | 0 |
| `eq:baby-recurrence` | 3.83 | 36 | 公式 | 0 |
| `eq:seed-big-absorb` | 3.84 | 36 | 公式 | 0 |
| `eq:fsa-growth` | 3.85 | 37 | 公式 | 0 |
| `eq:fsa-iteration` | 3.86 | 37 | 公式 | 0 |

### frag_10（tex 第 3322–3748 行）— §4 Wegner 估计与多尺度分析

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `sec:WegnerMSA` | 4 | 37 | 节 | 2 |
| `lem:duc-block-lemma` | 4.1 | 37 | 引理 | 1 |
| `eq:dirft-of-cone-chain` | 4.1 | 37 | 公式 | 0 |
| `thm:wegner` | 4.2 | 38 | 定理 | 2 |
| `eq:six-adjacent-scales` | 4.2 | 39 | 公式 | 0 |
| `eq:six-robust-support` | 4.3 | 39 | 公式 | 0 |
| `eq:six-wegner-bound` | 4.4 | 39 | 公式 | 0 |
| `eq:QUC-event-wegner` | 4.5 | 39 | 公式 | 0 |
| `eq:six-quc-event` | 4.6 | 39 | 公式 | 0 |
| `eq:six-high-count` | 4.7 | 40 | 公式 | 0 |
| `eq:six-quc-window` | 4.1 | 40 | 公式 | 0 |
| `eq:six-rank-list` | 4.8 | 40 | 公式 | 0 |
| `eq:Bourgain-bootstrap` | 4.9 | 40 | 公式 | 0 |
| `eq:six-rank-number` | 4.10 | 40 | 公式 | 0 |
| `eq:six-cover` | 4.11 | 40 | 公式 | 0 |
| `eq:event-inclusion` | 4.12 | 41 | 公式 | 0 |
| `eq:pigeonhole-event` | 4.13 | 41 | 公式 | 0 |
| `Claim:Sperner` | 4.1 | 41 | 断言 | 2 |
| `eq:six-rank-one-scales` | 4.14 | 41 | 公式 | 0 |
| `r_3` | 4.15 | 41 | 其他 | 0 |
| `r_4` | 4.16 | 41 | 其他 | 0 |
| `Sperner rho final` | 4.17 | 41 | 其他 | 0 |
| `Sperner estimate for i=0` | 4.1 | 41 | 其他 | 0 |
| `eq:single-event-prob` | 4.18 | 42 | 公式 | 0 |
| `thm:msa-initial` | 4.3 | 42 | 定理 | 1 |
| `eq:LiZhang-B11` | 4.19 | 42 | 公式 | 0 |
| `eq:LiZhang-B12` | 4.20 | 42 | 公式 | 0 |
| `thm:msa-short-large` | 4.4 | 43 | 定理 | 3 |
| `eq:msa-short-large` | 4.21 | 43 | 公式 | 0 |

### frag_11（tex 第 3749–3988 行）— 附录 A 一致离散唯一延拓

| 原文 label | 排印编号 | 页 | 类型 | 被引 |
| --- | --- | --- | --- | --- |
| `appendix:uniform-duc` | A | 43 | 附录 | 2 |
| `eq:parameter-space-uniform` | A.1 | 43 | 公式 | 0 |
| `thm:uniform-duc-linear` | A.1 | 43 | 定理 | 3 |
| `eq:uniform-fsa-probability` | A.2 | 43 | 公式 | 0 |
| `eq:uniform-fsa--count` | A.3 | 43 | 公式 | 0 |
| `eq:bound-on-partial-lambda` | A.4 | 44 | 公式 | 0 |
| `eq:index-set-of-all-system-uniform` | A.5 | 44 | 公式 | 0 |
| `eq:cardinality-of-net` | A.6 | 44 | 公式 | 0 |
| `eq:prob-absorb-Tp-uniform` | A.7 | 44 | 公式 | 0 |
| `eq:Tp-uniform` | A.8 | 44 | 公式 | 0 |
| `eq:baby-recurrence-uniform` | A.9 | 44 | 公式 | 0 |
| `eq:seed-big-absorb-uniform` | A.10 | 44 | 公式 | 0 |
| `eq:fsa-seed-uniform` | A.11 | 45 | 公式 | 0 |
| `thm:3-d-deter-duc` | A.2 | 45 | 定理 | 1 |
| `thm:deter-duc-d-geq-4` | A.3 | 45 | 定理 | 5 |
| `eq:deter-cardinality` | A.15 | 45 | 公式 | 0 |
| `thm:deter-duc-d-geq-4-trade-off` | A.4 | 45 | 定理 | 1 |
| `eq:deter-cardinality-trade-off` | A.17 | 45 | 公式 | 0 |
| `eq:trade-off-path` | A.18 | 46 | 公式 | 0 |
| `eq:transversal-in-each-small-cube` | A.19 | 46 | 公式 | 0 |
| `eq:transversal-in-each-small-cube-for-exactly-solu` | A.20 | 46 | 公式 | 0 |

## 3. 八幅 TikZ 示意图 → CeTZ 重画清单

原文全部图形都是 TikZ 手绘示意（无数据图、无 includegraphics），按 §0 要求用 CeTZ 0.4.2 重画。
子代理只负责翻译图注，图本体由协调人填。

| 图号 | 原文 label | tex 行 | CeTZ 文件 | 图注首句 |
| --- | --- | --- | --- | --- |

| 图 1 | `fig:fan-input-body` | 777 | `fig/fan_input_body.typ` | An illustration of a real two-dimensional input body $K$, with an input $v$ and  |
| 图 2 | `fig:complex-central-strip` | 982 | `fig/complex_central_strip.typ` | A illustration of the estimate in Lemma \ref{lem:complexstrip}. |
| 图 3 | `fig:common-inner-ball` | 1305 | `fig/common_inner_ball.typ` | An illustration of the estimate \eqref{eq:fan-volume-ledger}. |
| 图 4 | `fig:graded-set` | 1632 | `fig/graded_set.typ` | An illustration of a $(2,\varepsilon,\boldsymbol\rho)$-graded set. |
| 图 5 | `fig:adjusted-boundaries-two-dimensions` | 1983 | `fig/adjusted_boundary.typ` | An illustration of the height function and the adjusted boundaries in 2D. |
| 图 6 | `fig:fc-system` | 2405 | `fig/fc_system.typ` | Illustrations of linear-martingale systems from Construction \ref{construction:f |
| 图 7 | `fig:backward-shifted-source-block` | 2699 | `fig/backward_shifted_source.typ` | An illustration of \eqref{eq:initial-difference}. |
| 图 8 | `fig:free-site-annular-bootstrap` | 3224 | `fig/annular_bootstrap.typ` | An illustration of annular bootstrap through multiscale cubes. |


## 4. 术语表（全稿统一，不得另译）

| 英文 | 中文 |
| --- | --- |
| Anderson tight-binding model | 安德森紧束缚模型 |
| Anderson–Bernoulli model (ABM) | 安德森–伯努利模型 |
| Anderson localization | 安德森定域化 |
| random Schrödinger operator | 随机薛定谔算子 |
| discrete Laplacian | 离散拉普拉斯算子 |
| disorder strength | 无序强度 |
| bottom of the spectrum | 谱的下边缘 |
| integrated density of states (IDS) | 状态密度（IDS） |
| density of states | 状态密度 |
| localization length | 定域化长度 |
| exponentially decaying eigenfunction | 指数衰减本征函数 |
| multi-scale analysis (MSA) | 多尺度分析 |
| Wegner estimate | Wegner 估计 |
| single-site / annular event | 单格点事件 / 环状事件 |
| discrete unique continuation (DUC) | 离散唯一延拓 |
| probabilistic DUC (PDUC) | 概率型离散唯一延拓（PDUC） |
| uniform / deterministic DUC | 一致（确定性）离散唯一延拓 |
| linear-martingale system | 线性鞅系统 |
| propagation lemma | 传播引理 |
| input body / output body | 输入体 / 输出体 |
| source block / sink | 源块 / 汇 |
| fan | 扇 |
| graded set | 分级集合 |
| cone chain | 锥链 |
| height function | 高度函数 |
| adjusted boundary | 调整边界 |
| minimal bowl-shape boundary | 最小碗形边界 |
| frozen set / free site | 冻结集 / 自由格点 |
| bootstrap | 自举 |
| annular structure | 环状结构 |
| bad event / good event | 坏事件 / 好事件 |
| filtration | 滤子 |
| stopping time | 停时 |
| conditional expectation | 条件期望 |
| almost surely (a.s.) | 几乎必然 |
| with high probability (w.h.p.) | 以高概率 |
| outside an event of probability at most | 除一个概率不超过……的事件外 |
| convex body / convex set | 凸体 / 凸集 |
| strip | 条带 |
| lattice | 格点 |
| Sperner family / lemma | Sperner 族 / Sperner 引理 |
| pigeonhole principle | 鸽巢原理 |
| net (ε-net) | 网（ε-网） |
| resolvent | 预解式 |
| eigenvalue cluster | 特征值聚簇 |
| Bernoulli random variable | 伯努利随机变量 |
| i.i.d. | 独立同分布 |
| indicator | 示性函数 |
| cardinality | 基数 |
| boundary data | 边值数据 |
| scale | 尺度 |

## 5. 合并说明（协调人自用，子代理忽略）

- 片段范围见上；切点全部落在 `\subsection` 或 `\begin{proof}`/`\end{proof}` 边界，
  已用 `_b_split.py` 校验各片段内 `\begin{env}` 与 `\end{env}` 成对。
- 原文 `\numberwithin{equation}{section}`：式号形如 (3.28)。**注意 §4 里有两处手写
  `\tag{4.1}`**（`eq:six-quc-window`、`Sperner estimate for i=0`），编号会重复，
  照 .aux 抄即可，不要"顺手改成 4.8"。
- `eq:many-lattice-lines` 在 .aux 里是 (3.53)，跳过了 3.52——(3.52) 是一条没有
  `\label` 的 `equation`，号照排，详见 §5.1 第一条。
- Claim 用独立计数器（`断言 4.1`）。
- 参考文献 57 条由 `_b_bib.py` 从 `thebibliography` 转写；编号权威 = bibitem 顺序。

### 5.1 合并时踩到的坑（本轮实测，下次直接照做）

- **`.aux` 不是编号的全部权威。** 原文里不带 `\label` 的 `remark` 和无标签 `equation`
  照样占号：注记 2.2（tex 第 856 行附近）、注记 2.5（tex 第 1115 行）、式 (3.52)
  （tex 第 2744 行前）三处在 `.aux` 里查不到，但渲染 PDF 第 9/12/29 页确有此号。
  凡是"号不在 .aux 集合里"的告警，一律先渲染原文对应页确认，再决定删号还是留号。
  `_b_verify.py` 里已把这三个号放进 `UNLABELED_OK`。
- **`#include` 不继承外层作用域。** Typst 的 include 会把子文件当独立模块求值，
  main.typ 里 `#import "macros.typ": *` 对片段无效 —— 每个 `frag_N.typ` 顶部必须
  自带一行 `#import "macros.typ": *`，否则全线 `unknown variable: thm`。
- **Typst 0.15 数学模式没有 LaTeX 命令名。** 实测不存在的常用名（`_b_probe_syms.py`）：
  `cap cup sect setminus subseteq supseteq superset notin ni cdots ldots vdots ddots`
  `infty int oint diff doublecolon Rightarrow implies iff le ge neq sim simeq cong propto`
  `big Big bigg align stack choose member tt up varepsilon varphi star(作为符号)`。
  对应写法：`∩ ∪  ∖ ⊆ ⊇ ⊃ ∉ ∋ ⋯ … ⋮  ∞ integral ∮ dif ∷ ⇒ ⟹ ⟺ ≤ ≥ ≠ ∼ ≃  ∝`
  用 `lr()`、`cases` 行分隔用 `,`、`prod`→`product`、`sum` 保留。
  `emptyset without union product sum integral cases mat vec lr mid hat bar dot cal frak bb cc`
  这些 Typst 是认得的，不必换。
- **`cases(...)` 的行分隔符是逗号，`&` 是列分隔符。** 直译 LaTeX 的
  `cases(a, & x; b, & y)` 会报 `expected content, found array`；正确写法
  `cases(a & x, b & y)`。改的时候注意别把 `f(x; y)` 里的合法分号也换掉 ——
  `_b_cases_fix.py` 按括号深度只改第 0 层的分号。
- **`#thm` 有两种调用形式**（`#thm("定理 A.1")` 与 `#thm[定理 A.4（…）][`），
  对账脚本两种都要抓，否则误报"漏了某个定理"。
- 图注前缀：`macros.typ` 的 `#fig` 自己会印 `图 N　`，片段里只写描述文字。
  本轮 frag_5 多写了一次"图 5　"，合并时要查。

### 5.2 逐页目检阶段实测到的 Typst 坑（第二轮，交付前必查）

- **反引号在 Typst 里是"原生内容"标记。** 从 LaTeX 直译时若整段被 `` `$…$` `` 包住，
  渲染出来是等宽字体的源码本身，公式全部失效。合并后要 grep 反引号配对数，
  再用 `re.sub(r"`(\$[^`]*?\$)`", r"\1", s)` 剥掉。
- **`$…$` 内单个反斜杠 + 空白 = 换行符。** LaTeX 直译的 `Q \ D` 会把公式从中间劈开，
  集差符号整个丢掉。差集一律写 `∖`。合法的换行只有 `\` 后紧跟 `&`（对齐式）。
- **ASCII `/` 在数学里会被自动升级成堆叠分式。** `(d-1)/d` 变成上下结构，行内时把行距撑坏；
  更要命的是 `|S|/2` 直接渲染成 `|S` + 一个残缺分式（绝对值竖线被吞进分子）。
  行内比值一律 `#s`，真分式一律 `frac(a, b)`。
  `_b_slashscan.py` 专抓 `|` 紧接 `/` 的破图站点。
- **`sqrt ( x )` 中间有空格就退化成单词 "sqrt"。** 函数调用括号前不留空格。
- **`mat(delim: #"{")` 会连右花括号一起印出来。** 分段函数用 `cases`。
- **引用定位符不能带空格**：`@LZ22[第 2 节]` 出 `[7, 第 2 节]`；写成 `@LZ22 [第 2 节]`
  出 `[7] [第 2 节]` 双括号。
- **`par` 没有 `keep-with-next` 属性**（Typst 0.15 直接 `error: unexpected argument`）。
  要把引导语和公式/图钉在一起，用 `#block(breakable: false)[ … ]`，或把引导语改成段首 run-in。
- **顶层 `float` 在 0.15 是数字转换，不是浮动。** 不许断页的 CeTZ 图用
  `figure(placement: auto, numbering: none, block(breakable: false)[…])`，
  否则整页底部留下 4–9 cm 的空洞。
- **行内数学是原子**：`$…$。` 可能把句号顶到下一行行首，破坏中文标点禁则；
  用 `#box[$…$。]` 捆住。展示式后的 `，使得…` 同理 —— 把逗号挪进分式末尾更干净。
- **`refs.bib` 是纯文本字段**：LaTeX 的 `^` 会原样印出来，改用 Unicode 上标（`ℤᵈ`、`cm²`）。
- **Hayagriva 的 `ieee` 样式对 `@incollection` 会把 `series` 和 `volume` 各印一遍**，
  出 `vol. 1850, in Lecture Notes in Mathematics, vol. 1850.,`。这类条目直接删掉 `series`。
  另外期刊缩写缺尾点会印成 `Comm. Math. Phys,`，与 `Discrete Anal.,` 混排不齐，
  投稿前统一补 `.`（`Fields`/`Theory` 这类完整词除外）。
- **验收手段**：`pdftotext` 抽不出中文（CJK 子集没 ToUnicode），但 ASCII 残留能抽。
  用它扫反斜杠、`quad`、`mathrm`、`#eqn` 等源码痕迹最快；图与版式只能渲染成 PNG 用眼睛看。
