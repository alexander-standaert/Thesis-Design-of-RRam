
simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"

parameters enableMismatch=0
parameters Res=5000
parameters Cap=460f


V1 v1 0 vsource type=pwl wave=[0 0 1e-10 1]
V2 v2 0 vsource type=pwl wave=[0 0 1e-9 1]
V3 v3 0 vsource type=pwl wave=[0 0 1e-8 1]
V4 v4 0 vsource type=pwl wave=[0 0 1e-7 1]

R11 v1 r1 resistor r=Res 
R12 v2 r2 resistor r=Res 
R13 v3 r3 resistor r=Res 
R14 v4 r4 resistor r=Res 

R21 r1 c1 resistor r=Res 
R22 r2 c2 resistor r=Res 
R23 r3 c3 resistor r=Res 
R24 r4 c4 resistor r=Res 

C1 c1 0 capacitor c=Cap
C2 c2 0 capacitor c=Cap
C3 c3 0 capacitor c=Cap
C4 c4 0 capacitor c=Cap

mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=1
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=1e-9
}
option1 options rawfmt = psfascii
oper info what=captab