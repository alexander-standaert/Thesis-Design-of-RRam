
simulator lang=spice
.lib '../../../../technology_models/tech_wrapper.lib' tt

simulator lang=spectre
include "../../../../technology_models/monte_carlo_models.scs"

parameters enableMismatch=0


xMup out outbar n1 bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMupbar outbar out n1 bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMdown out outbar n2 bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMdownbar outbar out n2 bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4

xMtop n1 latchenablep vdd bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMbottom n2 latchenablen vss bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 1 enableBetaMismatch = 0 sigmamult = 4

xMpassn in passEnablen out bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMpassp in passEnablep out bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMpassbarn inbar passEnablen outbar bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
xMpassbarp inbar passEnablep outbar bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4

Vvdd     ( vdd     0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
Vbp      ( bp      0 ) vsource dc=1
Vbn      ( bn      0 ) vsource dc=0

Vin     ( in     0 ) vsource dc=0.449
Vinbar  ( inbar     0 ) vsource dc=0.4

Venn (latchenablen 0) vsource type=pwl wave=[0 0 1.1e-09 0 1.2e-09 1 2.1e-09 1 2.15e-09 0 7.6e-09 0]
Venp (latchenablep 0) vsource type=pwl wave=[0 1 1.1e-09 1 1.15e-09 0 2.1e-09 0 2.2e-09 1 7.6e-09 1]
Vpassn (passEnablen 0) vsource type=pwl wave=[0 0 5e-10 0 6e-10 1 1.6e-09 1 1.65e-09 0 7.1e-09 0]
Vpassp (passEnablep 0) vsource type=pwl wave=[0 1 5e-10 1 5.5e-10 0 1.6e-09 0 1.7e-09 1 7.1e-09 1]

ic out = 0
ic outbar = 1


mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=1
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=3n
}
option1 options rawfmt = psfascii