simulator lang=spectre

include "branch.sp"
include "decoder.sp"

subckt localblock (vdd vss NBulkLine PBulkLine WLencoded_0 WLenable BLencoded_0 BLencoded_1 BLenable BLout)
parameters Rcell_0_0 Rcell_0_1 Rcell_1_0 Rcell_1_1 Rcell_2_0 Rcell_2_1 Rcell_3_0 Rcell_3_1

xdecWL (WLencoded_0 WLenable WL_0 WL_1 vdd vss NBulkLine PBulkLine) decoderone
xdecBL (BLencoded_0 BLencoded_1 BLenable SelL_0 SelL_1 SelL_2 SelL_3 vdd vss NBulkLine PBulkLine) decodertwo

xnot0_0 (SelL_0 SelLbar_0 vdd vss PBulkLine NBulkLine) inverter
xnot0_1 (SelLbar_0 SelLbarbar_0 vdd vss PBulkLine NBulkLine) inverter
xnot0_2 (SelLbarbar_0 SelLbarbarbar_0 vdd vss PBulkLine NBulkLine) inverter
xnot1_0 (SelL_1 SelLbar_1 vdd vss PBulkLine NBulkLine) inverter
xnot1_1 (SelLbar_1 SelLbarbar_1 vdd vss PBulkLine NBulkLine) inverter
xnot1_2 (SelLbarbar_1 SelLbarbarbar_1 vdd vss PBulkLine NBulkLine) inverter
xnot2_0 (SelL_2 SelLbar_2 vdd vss PBulkLine NBulkLine) inverter
xnot2_1 (SelLbar_2 SelLbarbar_2 vdd vss PBulkLine NBulkLine) inverter
xnot2_2 (SelLbarbar_2 SelLbarbarbar_2 vdd vss PBulkLine NBulkLine) inverter
xnot3_0 (SelL_3 SelLbar_3 vdd vss PBulkLine NBulkLine) inverter
xnot3_1 (SelLbar_3 SelLbarbar_3 vdd vss PBulkLine NBulkLine) inverter
xnot3_2 (SelLbarbar_3 SelLbarbarbar_3 vdd vss PBulkLine NBulkLine) inverter


xBranch0 (vdd vss BL_0 WL_0 WL_1 SelLbarbar_0 SelLbarbarbar_0 SelLbar_0 PBulkLine NBulkLine) branch Rcell_0 = Rcell_0_0 Rcell_1 = Rcell_0_1
xM0 BL_0 SelLbarbar_0 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
xBranch1 (vdd vss BL_1 WL_0 WL_1 SelLbarbar_1 SelLbarbarbar_1 SelLbar_1 PBulkLine NBulkLine) branch Rcell_0 = Rcell_1_0 Rcell_1 = Rcell_1_1
xM1 BL_1 SelLbarbar_1 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
xBranch2 (vdd vss BL_2 WL_0 WL_1 SelLbarbar_2 SelLbarbarbar_2 SelLbar_2 PBulkLine NBulkLine) branch Rcell_0 = Rcell_2_0 Rcell_1 = Rcell_2_1
xM2 BL_2 SelLbarbar_2 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
xBranch3 (vdd vss BL_3 WL_0 WL_1 SelLbarbar_3 SelLbarbarbar_3 SelLbar_3 PBulkLine NBulkLine) branch Rcell_0 = Rcell_3_0 Rcell_1 = Rcell_3_1
xM3 BL_3 SelLbarbar_3 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
cParWL0 WL_0 vss capacitor c=Cpar*2
cParWL1 WL_1 vss capacitor c=Cpar*2

ends localblock