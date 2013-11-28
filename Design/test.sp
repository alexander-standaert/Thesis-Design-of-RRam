// showcase for mismatch simulation

simulator lang=spectre

include "transistorsPTM.scs"
include "latch.scs"

// enableMismatch is used in transistorsPTM.  
// Put to 0 to disable mismatch
// use transistor instance parameters shiftVt and shiftBeta to perform
// worst-case analysis 
parameters enableMismatch=1

parameters PWmin = 100n
parameters PLmin = 45n
parameters PWp = 5*100n
parameters PWn = 3*100n

xLatch inout inoutbar vdd vss bp bn latch 

Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( bp 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( bn 0 ) vsource dc=0

ic inout=0.3
ic inoutbar=0.33

//myOpt options rawfmt=psfascii
//save * 
//save current all

mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=999
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=10n
}
option1 options rawfmt = psfascii

