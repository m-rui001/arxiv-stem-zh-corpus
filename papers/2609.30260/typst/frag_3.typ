// frag_3.typ —— 覆盖 statistical_brane.tex 第 167–206 行：「Projected brane」一节，
// Grassmann 路径积分推导与式 (1)–(5) 全部（式 (5) 即原文 \label{eq:Heff}，后文回引「式 (5)」）。
#import "macros.typ": *

#runin[投影膜方法。]由于投影法是本文的核心，我们对其作详细讨论 @Panigrahi2022 。把母晶体紧束缚哈密顿量（含跃迁项与在位项）中仅在构成非晶晶格的位点之间起作用的一块记为 $H_(11)$（图 1(a) 中的红色位点），把仅在该膜之外的位点之间起作用的一块记为 $H_(22)$（图 1(a) 中的黑色位点）；连接这两组位点的跃迁哈密顿量矩阵元记为 $H_(12)$ 与 $H_(21)$（$equiv H_(12)^†$）。为了把非晶膜之外的位点积分掉，我们用 Grassmann 变量写出虚时间（$tau$）配分函数（$cal(Z)$）：$Psi_1$ 与 $macron(Psi)_1$ 作用在非晶晶格的位点上，$Psi_2$ 与 $macron(Psi)_2$ 作用在母晶体的其余位点上，

#eqn("(1)")[
  $ cal(Z) = integral cal(D) Psi_1 cal(D) Psi_2 cal(D) macron(Psi)_1 cal(D) macron(Psi)_2 op("exp") -S[Psi_1, Psi_2, macron(Psi)_1, macron(Psi)_2] $
]

其中作用量 $S[Psi_1, Psi_2, macron(Psi)_1, macron(Psi)_2] equiv S$ 为

#eqn("(2)")[
  $ S = integral_0^beta d tau mat(macron(Psi)^tau_1, macron(Psi)^tau_2) mat(partial_tau + H_(11), H_(12); H_(21), partial_tau + H_(22)) mat(Psi^tau_1; Psi^tau_2), $
]

这里 $beta$ 为逆温度。改用频率空间中的 Grassmann 变量 $Psi^tau_(1,2) = sum_ (omega_n) c^((n))_(1,2) e^(-i omega_n tau)/sqrt(beta)$，其中 $omega_n = (2n + 1) pi / beta$（$n in bb(Z)$，$bb(Z)$ 为整数集）是费米子 Matsubara 频率，

#eqn("(3)")[
  #grid(columns: (auto, auto), align: (right + horizon, left + horizon), gutter: 4pt,
    [$S$], $= limits(sum)_(omega_n) macron(c)^((n))_1 (-i omega_n + H_(11)) c^((n))_1 + macron(c)^((n))_1 H_(12) c^((n))_2 + macron(c)^((n))_2 H_(21) c^((n))_1 + macron(c)^((n))_2 (-i omega_n + H_(22)) c^((n))_2$,
    [], $= limits(sum)_(omega_n) macron(c)^((n))_1 (-i omega_n + H_(11)) c^((n))_1 - macron(c)^((n))_1 (H_(12) (-i omega_n + H_(22))^(-1) H_(21)) c^((n))_1 + macron(d)^((n))_2 (-i omega_n + H_(22)) d^((n))_2$,
  )
]

把移位变量 $d^((n))_2 = c^((n))_2 + (-i omega_n + H_(22))^(-1) H_(21) c^((n))_1$ 积分掉之后，我们得到非晶膜上位点的有效作用量

#eqn("(4)")[
  $ S_"eff"[Psi_1, macron(Psi)_1] = limits(sum)_(omega_n) macron(c)^((n))_1 [-i omega_n + H_(11) - H_(12) (-i omega_n + H_(22))^(-1) H_(21)] c^((n))_1 $
]

由 $S_"eff"[Psi_1, macron(Psi)_1]$ 出发，取极限 $omega_n -> 0$，我们得到以锐利准粒子激发描述膜内重整化跃迁元的有效哈密顿量（$H_"eff"$）

#eqn("(5)")[
  $ H_"eff" = H_(11) - H_(12) H_(22)^(-1) H_(21). $
]

我们所有的结论都由对角化 $H_"eff"$ 得到。
