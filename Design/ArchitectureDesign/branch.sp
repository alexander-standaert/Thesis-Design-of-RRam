simulator lang=spectre
include "cell.scs"
include "load.scs"

subckt branch (vdd vss BitLine WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SourceSelect Charge Discharge PBulkLine NBulkLine)

xSwitchVdd LoadLine Charge vdd PBulkLine mc_pmos_lvt w=WChargeBL l=PLmin
xSwitchVss1 Bitline Discharge vss NBulkLine mc_nmos_lvt w=WDischargeBL l=PLmin
xSwitchVss2 SourceLine SourceSelect vss NBulkLine mc_nmos_lvt w=WDischargeSL l=Plmin

xLoad LoadLine Bitline load


xCell0 (BitLine SourceLine WL_0 NBulkLine) cell
cParC0 (BitLine vss) capacitor c=Cpar
xCell1 (BitLine SourceLine WL_1 NBulkLine) cell
cParC1 (BitLine vss) capacitor c=Cpar
xCell2 (BitLine SourceLine WL_2 NBulkLine) cell
cParC2 (BitLine vss) capacitor c=Cpar
xCell3 (BitLine SourceLine WL_3 NBulkLine) cell
cParC3 (BitLine vss) capacitor c=Cpar
xCell4 (BitLine SourceLine WL_4 NBulkLine) cell
cParC4 (BitLine vss) capacitor c=Cpar
xCell5 (BitLine SourceLine WL_5 NBulkLine) cell
cParC5 (BitLine vss) capacitor c=Cpar
xCell6 (BitLine SourceLine WL_6 NBulkLine) cell
cParC6 (BitLine vss) capacitor c=Cpar
xCell7 (BitLine SourceLine WL_7 NBulkLine) cell
cParC7 (BitLine vss) capacitor c=Cpar
 
ends branch