// 2609.30122 共用宏：化学/物理量符号与常见记号
// 约定：每个宏返回一个独立的 $...$ 块，避免同一块内多字母标识符报错。
// Typst 数学里多字母下标必须加引号或用括号分组，裸写 eps / skin 会被当成变量。

#let PPG = [PPG]
#let ABG = [ABG]
#let mBLL = [mBLL]
#let LD = [LD]
#let LED = [LED]
#let FWHM = [FWHM]
#let SaO2 = [$"SaO"_2$]
#let SpO2 = [$"SpO"_2$]
#let StO2 = [$"StO"_2$]
#let HbO2 = [$"HbO"_2$]
#let HbT = [HbT]
#let RoR = [RoR]
#let Mel = [$M$]
#let W = [$W$]
#let ITA = [ITA]
#let mua = [$"μ"_a$]
#let musp = [$"μ"_s^"′"$]
#let rho = [$ρ$]
#let Arms = [$A _"rms"$]
#let Gam = [$Γ$]
#let fHR = [$f _"HR"$]
#let Lamb = [$Λ$]
#let oq = [$o$]
#let fRay = [$f _"Ray"$]
#let bMie = [$b _"Mie"$]

// 算法浮动体：正文按“算法 1”引用，编号独立于图与表。
// 必须定义在本文件里：#include 不继承宿主作用域，方法片段也要能用。
#let algobox(caption, body) = figure(
  kind: "alg",
  supplement: [算法],
  numbering: "1",
  caption: caption,
  body,
)
