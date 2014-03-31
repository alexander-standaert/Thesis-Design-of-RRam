
simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"

parameters enableMismatch=0

xMpassnlvtcomp in passEnablen outlvtcomp bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
xMpassplvtcomp in passEnablep outlvtcomp bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
cOutlvtcomp (outlvtcomp 0) capacitor c=0.16e-15

xMpassnhvtcomp in passEnablen outhvtcomp bn mc_nmos_lvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
xMpassphvtcomp in passEnablep outhvtcomp bp mc_pmos_lvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
cOuthvtcomp (outhvtcomp 0) capacitor c=0.16e-15

xMpassnlvt in passEnablen outnlvt bn mc_nmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
cOutnlvt (outnlvt 0) capacitor c=0.16e-15

xMpassplvt in passEnablep outplvt bp mc_pmos_hvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
cOutplvt (outplvt 0) capacitor c=0.16e-15

xMpassnhvt in passEnablen outnhvt bn mc_nmos_lvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
cOutnhvt (outnhvt 0) capacitor c=0.16e-15

xMpassphvt in passEnablep outphvt bp mc_pmos_lvt w=1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 1
cOutphvt (outphvt 0) capacitor c=0.16e-15


Vvdd     ( vdd     0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
Vbp      ( bp      0 ) vsource dc=1
Vbn      ( bn      0 ) vsource dc=0

Vin     ( in     0 ) vsource dc=1

Vpassn (passEnablen 0) vsource type=pwl wave=[0 0 5e-10 0 6e-10 1 1.5e-09 1 1.55e-09 0 7e-09 0]
Vpassp (passEnablep 0) vsource type=pwl wave=[0 1 5e-10 1 5.5e-10 0 1.5e-09 0 1.6e-09 1 7e-09 1]

ic outlvtcomp = 1
ic outhvtcomp = 1
ic outnlvt = 1
ic outplvt = 1
ic outnhvt = 1
ic outphvt = 1



mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=1
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=2n
}
option1 options rawfmt = psfascii