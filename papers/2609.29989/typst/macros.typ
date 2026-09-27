// 2609.29989 共用宏：记号与化学式
// 约定：每个宏返回一个独立内容块，正文里以 #宏名 引用。

#let Ik = [$I _k$]
#let VGe = [VGe₃]
#let FSO = [Fe₂SiO₄]
#let rbar3 = [$overline(3)$]
#let kvec = [$bold(k)$]
#let Sop = [$bold(S)($bold(k)$)$]
#let nhat = [$hat(bold(n))$]
#let ThetaT = [$Θ T _bold(τ)$]

// SSG 国际记号：P^(1,1,1) m^1 3̄^1 n^1̄ (C_i^I) 一类，统一在此拼装
#let wave(x) = [$#x$ 波]

// 补充材料编号：Typst 用字符串模板 "(S1)" 时，交叉引用只会显示 "1"（丢掉 S 前缀），
// 必须改写成函数形式，引用才会渲染成「式 (S1)」「表 (S1)」。
#let suppnum(n) = "(S" + str(n) + ")"
