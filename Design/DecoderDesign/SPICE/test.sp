// showcase for mismatch simulation

simulator lang=spectre

include "transistorsPTM.scs"
include "decodersynthesis.sp"
include "parameters.sp"

xdecoder (IN_0 enable OUT_0 OUT_1 vdd vss NBulkLine PBulkLine) decoder

Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( PBulkLine 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( NBulkLine 0 ) vsource dc=0

Ven (enable 0) vsource type=pwl wave=waveen

Vin0 (IN_0 0) vsource type=pwl wave=wavein_0

save IN_0 enable OUT_0 OUT_1 Vvdd:currents

mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=numberofruns
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=simlength
}

option1 options rawfmt = psfascii

