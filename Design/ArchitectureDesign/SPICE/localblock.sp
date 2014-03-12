simulator lang=spectre

include "branch.sp"
include "decoder.sp"

subckt localblock (vdd vss NBulkLine PBulkLine WLencoded_0 WLencoded_1 WLencoded_2 WLencoded_3 BLencoded_0 BLencoded_1 LBenable BLout Delay Refenable)
parameters Rcell_0_0 Rcell_0_1 Rcell_0_2 Rcell_0_3 Rcell_0_4 Rcell_0_5 Rcell_0_6 Rcell_0_7 Rcell_0_8 Rcell_0_9 Rcell_0_10 Rcell_0_11 Rcell_0_12 Rcell_0_13 Rcell_0_14 Rcell_0_15 Rcell_1_0 Rcell_1_1 Rcell_1_2 Rcell_1_3 Rcell_1_4 Rcell_1_5 Rcell_1_6 Rcell_1_7 Rcell_1_8 Rcell_1_9 Rcell_1_10 Rcell_1_11 Rcell_1_12 Rcell_1_13 Rcell_1_14 Rcell_1_15 Rcell_2_0 Rcell_2_1 Rcell_2_2 Rcell_2_3 Rcell_2_4 Rcell_2_5 Rcell_2_6 Rcell_2_7 Rcell_2_8 Rcell_2_9 Rcell_2_10 Rcell_2_11 Rcell_2_12 Rcell_2_13 Rcell_2_14 Rcell_2_15 Rcell_3_0 Rcell_3_1 Rcell_3_2 Rcell_3_3 Rcell_3_4 Rcell_3_5 Rcell_3_6 Rcell_3_7 Rcell_3_8 Rcell_3_9 Rcell_3_10 Rcell_3_11 Rcell_3_12 Rcell_3_13 Rcell_3_14 Rcell_3_15

xdecWL (WLencoded_0 WLencoded_1 WLencoded_2 WLencoded_3 LBenable WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 vdd vss NBulkLine PBulkLine) decoderfour
xdecBL (BLencoded_0 BLencoded_1 LBenable BLencLine_0 BLencLine_1 BLencLine_2 BLencLine_3 vdd vss NBulkLine PBulkLine) decodertwo


xnor0 (BLencLine_0 Refenable temp_0 vdd vss PBulkLine NBulkLine) twonor
xnot0_0 (temp_0 SelL_0 vdd vss PBulkLine NBulkLine) inverter
xnot0_1 (SelL_0 SelLbar_0 vdd vss PBulkLine NBulkLine) inverter
xnot0_2 (SelLbar_0 SelLbarbar_0 vdd vss PBulkLine NBulkLine) inverter
xnand0 (SelL_0 Delay SelLbarbarbar_0 vdd vss PBulkLine NBulkLine) twonand
xnor1 (BLencLine_1 Refenable temp_1 vdd vss PBulkLine NBulkLine) twonor
xnot1_0 (temp_1 SelL_1 vdd vss PBulkLine NBulkLine) inverter
xnot1_1 (SelL_1 SelLbar_1 vdd vss PBulkLine NBulkLine) inverter
xnot1_2 (SelLbar_1 SelLbarbar_1 vdd vss PBulkLine NBulkLine) inverter
xnand1 (SelL_1 Delay SelLbarbarbar_1 vdd vss PBulkLine NBulkLine) twonand
xnor2 (BLencLine_2 Refenable temp_2 vdd vss PBulkLine NBulkLine) twonor
xnot2_0 (temp_2 SelL_2 vdd vss PBulkLine NBulkLine) inverter
xnot2_1 (SelL_2 SelLbar_2 vdd vss PBulkLine NBulkLine) inverter
xnot2_2 (SelLbar_2 SelLbarbar_2 vdd vss PBulkLine NBulkLine) inverter
xnand2 (SelL_2 Delay SelLbarbarbar_2 vdd vss PBulkLine NBulkLine) twonand
xnor3 (BLencLine_3 Refenable temp_3 vdd vss PBulkLine NBulkLine) twonor
xnot3_0 (temp_3 SelL_3 vdd vss PBulkLine NBulkLine) inverter
xnot3_1 (SelL_3 SelLbar_3 vdd vss PBulkLine NBulkLine) inverter
xnot3_2 (SelLbar_3 SelLbarbar_3 vdd vss PBulkLine NBulkLine) inverter
xnand3 (SelL_3 Delay SelLbarbarbar_3 vdd vss PBulkLine NBulkLine) twonand


xBranch0 (vdd vss BL_0 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 Refenable SelLbarbar_0 SelLbarbarbar_0 SelLbar_0 PBulkLine NBulkLine) branch Rcell_0 = Rcell_0_0 Rcell_1 = Rcell_0_1 Rcell_2 = Rcell_0_2 Rcell_3 = Rcell_0_3 Rcell_4 = Rcell_0_4 Rcell_5 = Rcell_0_5 Rcell_6 = Rcell_0_6 Rcell_7 = Rcell_0_7 Rcell_8 = Rcell_0_8 Rcell_9 = Rcell_0_9 Rcell_10 = Rcell_0_10 Rcell_11 = Rcell_0_11 Rcell_12 = Rcell_0_12 Rcell_13 = Rcell_0_13 Rcell_14 = Rcell_0_14 Rcell_15 = Rcell_0_15 Rref = Rref_0
xMn0 BL_0 SelLbarbar_0 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin
//xMp0 BL_0 SelLbar_0 BLout PBulkLine nc_pmos_hvt w=PWmuxLB l=PLmin
xBranch1 (vdd vss BL_1 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 Refenable SelLbarbar_1 SelLbarbarbar_1 SelLbar_1 PBulkLine NBulkLine) branch Rcell_0 = Rcell_1_0 Rcell_1 = Rcell_1_1 Rcell_2 = Rcell_1_2 Rcell_3 = Rcell_1_3 Rcell_4 = Rcell_1_4 Rcell_5 = Rcell_1_5 Rcell_6 = Rcell_1_6 Rcell_7 = Rcell_1_7 Rcell_8 = Rcell_1_8 Rcell_9 = Rcell_1_9 Rcell_10 = Rcell_1_10 Rcell_11 = Rcell_1_11 Rcell_12 = Rcell_1_12 Rcell_13 = Rcell_1_13 Rcell_14 = Rcell_1_14 Rcell_15 = Rcell_1_15 Rref = Rref_1
xMn1 BL_1 SelLbarbar_1 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin
//xMp1 BL_1 SelLbar_1 BLout PBulkLine nc_pmos_hvt w=PWmuxLB l=PLmin
xBranch2 (vdd vss BL_2 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 Refenable SelLbarbar_2 SelLbarbarbar_2 SelLbar_2 PBulkLine NBulkLine) branch Rcell_0 = Rcell_2_0 Rcell_1 = Rcell_2_1 Rcell_2 = Rcell_2_2 Rcell_3 = Rcell_2_3 Rcell_4 = Rcell_2_4 Rcell_5 = Rcell_2_5 Rcell_6 = Rcell_2_6 Rcell_7 = Rcell_2_7 Rcell_8 = Rcell_2_8 Rcell_9 = Rcell_2_9 Rcell_10 = Rcell_2_10 Rcell_11 = Rcell_2_11 Rcell_12 = Rcell_2_12 Rcell_13 = Rcell_2_13 Rcell_14 = Rcell_2_14 Rcell_15 = Rcell_2_15 Rref = Rref_2
xMn2 BL_2 SelLbarbar_2 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin
//xMp2 BL_2 SelLbar_2 BLout PBulkLine nc_pmos_hvt w=PWmuxLB l=PLmin
xBranch3 (vdd vss BL_3 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 Refenable SelLbarbar_3 SelLbarbarbar_3 SelLbar_3 PBulkLine NBulkLine) branch Rcell_0 = Rcell_3_0 Rcell_1 = Rcell_3_1 Rcell_2 = Rcell_3_2 Rcell_3 = Rcell_3_3 Rcell_4 = Rcell_3_4 Rcell_5 = Rcell_3_5 Rcell_6 = Rcell_3_6 Rcell_7 = Rcell_3_7 Rcell_8 = Rcell_3_8 Rcell_9 = Rcell_3_9 Rcell_10 = Rcell_3_10 Rcell_11 = Rcell_3_11 Rcell_12 = Rcell_3_12 Rcell_13 = Rcell_3_13 Rcell_14 = Rcell_3_14 Rcell_15 = Rcell_3_15 Rref = Rref_3
xMn3 BL_3 SelLbarbar_3 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin
//xMp3 BL_3 SelLbar_3 BLout PBulkLine nc_pmos_hvt w=PWmuxLB l=PLmin
cParWL0 WL_0 vss capacitor c=Cpar*4
cParWL1 WL_1 vss capacitor c=Cpar*4
cParWL2 WL_2 vss capacitor c=Cpar*4
cParWL3 WL_3 vss capacitor c=Cpar*4
cParWL4 WL_4 vss capacitor c=Cpar*4
cParWL5 WL_5 vss capacitor c=Cpar*4
cParWL6 WL_6 vss capacitor c=Cpar*4
cParWL7 WL_7 vss capacitor c=Cpar*4
cParWL8 WL_8 vss capacitor c=Cpar*4
cParWL9 WL_9 vss capacitor c=Cpar*4
cParWL10 WL_10 vss capacitor c=Cpar*4
cParWL11 WL_11 vss capacitor c=Cpar*4
cParWL12 WL_12 vss capacitor c=Cpar*4
cParWL13 WL_13 vss capacitor c=Cpar*4
cParWL14 WL_14 vss capacitor c=Cpar*4
cParWL15 WL_15 vss capacitor c=Cpar*4
cParWL16 Refenable vss capacitor c=Cpar*4

ends localblock