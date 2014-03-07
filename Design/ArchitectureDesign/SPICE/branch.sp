
simulator lang=spectre

include "cell.scs"
include "load.scs"

subckt branch (vdd vss BitLine WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 SourceSelect Charge Discharge PBulkLine NBulkLine)
parameters Rcell_0 Rcell_1 Rcell_2 Rcell_3 Rcell_4 Rcell_5 Rcell_6 Rcell_7 Rcell_8 Rcell_9 Rcell_10 Rcell_11 Rcell_12 Rcell_13 Rcell_14 Rcell_15 Rref

xSwitchVdd BitLine Charge vdd PBulkLine mc_pmos_lvt w=WChargeBL l=LChargeBL
xSwitchVss1 BitLine Discharge vss NBulkLine mc_nmos_lvt w=WDischargeBL l=PLmin
xSwitchVss2 SourceLine SourceSelect vss NBulkLine mc_nmos_lvt w=WDischargeSL l=PLmin

//xLoad LoadLine BitLine PBulkLine load


xCell0 (BitLine SourceLine WL_0 NBulkLine) cell RMEM=Rcell_0
xCell1 (BitLine SourceLine WL_1 NBulkLine) cell RMEM=Rcell_1
xCell2 (BitLine SourceLine WL_2 NBulkLine) cell RMEM=Rcell_2
xCell3 (BitLine SourceLine WL_3 NBulkLine) cell RMEM=Rcell_3
xCell4 (BitLine SourceLine WL_4 NBulkLine) cell RMEM=Rcell_4
xCell5 (BitLine SourceLine WL_5 NBulkLine) cell RMEM=Rcell_5
xCell6 (BitLine SourceLine WL_6 NBulkLine) cell RMEM=Rcell_6
xCell7 (BitLine SourceLine WL_7 NBulkLine) cell RMEM=Rcell_7
xCell8 (BitLine SourceLine WL_8 NBulkLine) cell RMEM=Rcell_8
xCell9 (BitLine SourceLine WL_9 NBulkLine) cell RMEM=Rcell_9
xCell10 (BitLine SourceLine WL_10 NBulkLine) cell RMEM=Rcell_10
xCell11 (BitLine SourceLine WL_11 NBulkLine) cell RMEM=Rcell_11
xCell12 (BitLine SourceLine WL_12 NBulkLine) cell RMEM=Rcell_12
xCell13 (BitLine SourceLine WL_13 NBulkLine) cell RMEM=Rcell_13
xCell14 (BitLine SourceLine WL_14 NBulkLine) cell RMEM=Rcell_14
xCell15 (BitLine SourceLine WL_15 NBulkLine) cell RMEM=Rcell_15
xCell16 (BitLine SourceLine WL_16 NBulkLine) cell RMEM=Rref
 
cParBLC (BitLine vss) capacitor c=Cpar*16
cParSLC (SourceLine vss) capacitor c=Cpar*16

ends branch