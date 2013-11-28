// showcase for mismatch simulation
//
// an invertor driving an nmos driver


include "transistorsPTM.scs"

// enableMismatch is used in transistorsPTM.  
// Put to 0 to disable mismatch
// use transistor instance parameters shiftVt and shiftBeta to perform
// worst-case analysis 
parameters enableMismatch=1

parameters PWmin = 100n
parameters PLmin = 45n
parameters PWp = 1*100n
parameters PWn = 1*100n

xM1 out outbar n1 bp mc_pmos_lvt w=PWp l=PLmin
xM2 outbar out n1 bp mc_pmos_lvt w=PWp l=PLmin
xM3 out outbar n2 bn mc_nmos_lvt w=PWn l=PLmin
xM4 outbar out n2 bn mc_nmos_lvt w=PWn l=PLmin

xM5 n1 vss vdd bp mc_pmos_lvt w=PWmin l=PLmin
xM6 n2 vdd vss bn mc_nmos_lvt w=PWmin l=PLmin


Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( bp 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( bn 0 ) vsource dc=0

ic out=0.3
ic outbar=0.35

//myOpt options rawfmt=psfascii
//save * 
//save current all

mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=100
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=10n
}
option1 options rawfmt = psfascii

