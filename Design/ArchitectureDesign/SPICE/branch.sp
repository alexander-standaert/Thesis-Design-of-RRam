
simulator lang=spectre

include "cell.scs"
include "load.scs"

subckt branch (vdd vss BitLine WL_0 WL_1 SourceSelect Charge Discharge PBulkLine NBulkLine)
parameters Rcell_0 Rcell_1

xSwitchVdd LoadLine Charge vdd PBulkLine mc_pmos_lvt w=WChargeBL l=PLmin
xSwitchVss1 BitLine Discharge vss NBulkLine mc_nmos_lvt w=WDischargeBL l=PLmin
xSwitchVss2 SourceLine SourceSelect vss NBulkLine mc_nmos_lvt w=WDischargeSL l=PLmin

xLoad LoadLine BitLine load


xCell0 (BitLine SourceLine WL_0 NBulkLine) cell RMEM=Rcell_0
xCell1 (BitLine SourceLine WL_1 NBulkLine) cell RMEM=Rcell_1
 
cParBLC (BitLine vss) capacitor c=Cpar*2
cParSLC (SourceLine vss) capacitor c=Cpar*2

ends branch