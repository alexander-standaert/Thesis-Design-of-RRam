
simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"

parameters enableMismatch=0
parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght

Vvdd vdd 0 vsource type=dc dc=1
Vvss vss 0 vsource type=dc dc=0
Vin in 0 vsource type=pwl wave=[0 0 5e-11 1]

Rin in rin resistor r=0
xM1 out rin vdd vdd mc_pmos_lvt w=2*PWmin l=PLmin
xM2 out rin vss vss mc_nmos_lvt w=PWmin l=PLmin 



mytran tran stop=5e-9

option1 options rawfmt = psfascii
oper info what=captab