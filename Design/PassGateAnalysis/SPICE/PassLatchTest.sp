
simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"

parameters enableMismatch=0


xMup out outbar n1 bp mc_pmos_hvt w=1.7e-06 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 10
xMupbar outbar out n1 bp mc_pmos_hvt w=1.7e-06 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4
xMdown out outbar n2 bn mc_nmos_hvt w=1.5e-06 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 10
xMdownbar outbar out n2 bn mc_nmos_hvt w=1.5e-06 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4

//Rtop vdd n1 resistor r=0
//Rbottom vss n2 resistor r=0

xMtop n1 latchenablep vdd bp mc_pmos_hvt w=9e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4
xMbottom n2 latchenablen vss bn mc_nmos_hvt w=5e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4

xMpassn in2 passEnablen out bn mc_nmos_hvt w=5e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 1 sigmamult = -4
xMpassp in2 passEnablep out bp mc_pmos_hvt w=5e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 1 sigmamult = 4
xMpassbarn inbar2 passEnablen outbar bn mc_nmos_hvt w=5e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4
xMpassbarp inbar2 passEnablep outbar bp mc_pmos_hvt w=5e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4

//Rin in2 out resistor r=10000
//Rinbar inbar2 outbar resistor r=10000


Cin in2 0 capacitor c=256*0.18e-15*1
Cinbar inbar2 0 capacitor c=256*0.18e-15*1

//xMpassn2 in vdd in2 bn mc_nmos_hvt w=.5*1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4
//xMpassp2 in vss in2 bp mc_pmos_hvt w=.5*1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = 4
//xMpassbarn2 inbar vdd inbar2 bn mc_nmos_hvt w=.5*1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4
//xMpassbarp2 inbar vss inbar2 bp mc_pmos_hvt w=.5*1e-07 controlledOffset = 1  enableVtMismatch = 0 enableBetaMismatch = 0 sigmamult = -4


Vvdd     ( vdd     0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
Vbp      ( bp      0 ) vsource dc=1
Vbn      ( bn      0 ) vsource dc=0

Vin     ( in     0 ) vsource dc=0.38
Vinbar  ( inbar     0 ) vsource dc=0.4

//Vin2     ( in2     0 ) vsource dc=0.38
//Vinbar2  ( inbar2     0 ) vsource dc=0.4

// latch altijd af

//Venn (latchenablen 0) vsource dc=0
//Venp (latchenablep 0) vsource dc=1

// latch altijd aan

//Venn (latchenablen 0) vsource dc=1
//Venp (latchenablep 0) vsource dc=0

// latch op vaste tijdstip

//Venn (latchenablen 0) vsource type=pwl wave=[0 0 1.5e-09 0 1.6e-09 1 2.5e-09 1 2.55e-09 0 8e-09 0]
//Venp (latchenablep 0) vsource type=pwl wave=[0 1 1.55e-09 1 1.6e-09 0 2.5e-09 0 2.6e-09 1 8e-09 1]

// latch op vaste tijdstip, langer aan

Venn (latchenablen 0) vsource type=pwl wave=[0 0 1.5e-09 0 1.6e-09 1]
Venp (latchenablep 0) vsource type=pwl wave=[0 1 1.55e-09 1 1.6e-09 0]

///////////////////////////////////////////////////////////////////////////////////////////////////////

// passgate altijd af

//Vpassn (passEnablen 0) vsource dc=0
//Vpassp (passEnablep 0) vsource dc=1

// passgate altijd aan

//Vpassn (passEnablen 0) vsource dc=1
//Vpassp (passEnablep 0) vsource dc=0

// geen overlap passenable en latchenable

//Vpassn (passEnablen 0) vsource type=pwl wave=[0 0 5e-10 0 5.2e-10 1 1.3e-09 1 1.4e-09 0 8e-09 0]
//Vpassp (passEnablep 0) vsource type=pwl wave=[0 1 5e-10 1 5.2e-10 0 1.3e-09 0 1.4e-09 1 8e-09 1]

// kleine overlap passenable en latchenable

//Vpassn (passEnablen 0) vsource type=pwl wave=[0 0 5e-10 0 5.2e-10 1 1.7e-09 1 1.8e-09 0 8e-09 0]
//Vpassp (passEnablep 0) vsource type=pwl wave=[0 1 5e-10 1 5.2e-10 0 1.7e-09 0 1.8e-09 1 8e-09 1]

// grote overlap passenable en latchenable

Vpassn (passEnablen 0) vsource type=pwl wave=[0 0 5e-10 0 5.2e-10 1 2e-09 1 2.1e-09 0 8e-09 0]
Vpassp (passEnablep 0) vsource type=pwl wave=[0 1 5e-10 1 5.2e-10 0 2e-09 0 2.1e-09 1 8e-09 1]


ic out = 0
ic outbar = 0
ic in2 = 0.38
ic inbar2 = 0.4


mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=1
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=5n
}
option1 options rawfmt = psfascii
oper info what=captab