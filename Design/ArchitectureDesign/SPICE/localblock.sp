simulator lang=spectre

include "branch.sp"
include "decoder.sp"

subckt localblock (vdd_0 vdd_2 vss NBulkLine PBulkLine WLencoded_0 WLencoded_1 WLencoded_2 WLencoded_3 BLencoded_0 BLencoded_1 BLencoded_2 BLencoded_3 LBenable BLout Delay Refenable)
parameters Rcell_0_0 Rcell_0_1 Rcell_0_2 Rcell_0_3 Rcell_0_4 Rcell_0_5 Rcell_0_6 Rcell_0_7 Rcell_0_8 Rcell_0_9 Rcell_0_10 Rcell_0_11 Rcell_0_12 Rcell_0_13 Rcell_0_14 Rcell_0_15 Rcell_1_0 Rcell_1_1 Rcell_1_2 Rcell_1_3 Rcell_1_4 Rcell_1_5 Rcell_1_6 Rcell_1_7 Rcell_1_8 Rcell_1_9 Rcell_1_10 Rcell_1_11 Rcell_1_12 Rcell_1_13 Rcell_1_14 Rcell_1_15 Rcell_2_0 Rcell_2_1 Rcell_2_2 Rcell_2_3 Rcell_2_4 Rcell_2_5 Rcell_2_6 Rcell_2_7 Rcell_2_8 Rcell_2_9 Rcell_2_10 Rcell_2_11 Rcell_2_12 Rcell_2_13 Rcell_2_14 Rcell_2_15 Rcell_3_0 Rcell_3_1 Rcell_3_2 Rcell_3_3 Rcell_3_4 Rcell_3_5 Rcell_3_6 Rcell_3_7 Rcell_3_8 Rcell_3_9 Rcell_3_10 Rcell_3_11 Rcell_3_12 Rcell_3_13 Rcell_3_14 Rcell_3_15 Rcell_4_0 Rcell_4_1 Rcell_4_2 Rcell_4_3 Rcell_4_4 Rcell_4_5 Rcell_4_6 Rcell_4_7 Rcell_4_8 Rcell_4_9 Rcell_4_10 Rcell_4_11 Rcell_4_12 Rcell_4_13 Rcell_4_14 Rcell_4_15 Rcell_5_0 Rcell_5_1 Rcell_5_2 Rcell_5_3 Rcell_5_4 Rcell_5_5 Rcell_5_6 Rcell_5_7 Rcell_5_8 Rcell_5_9 Rcell_5_10 Rcell_5_11 Rcell_5_12 Rcell_5_13 Rcell_5_14 Rcell_5_15 Rcell_6_0 Rcell_6_1 Rcell_6_2 Rcell_6_3 Rcell_6_4 Rcell_6_5 Rcell_6_6 Rcell_6_7 Rcell_6_8 Rcell_6_9 Rcell_6_10 Rcell_6_11 Rcell_6_12 Rcell_6_13 Rcell_6_14 Rcell_6_15 Rcell_7_0 Rcell_7_1 Rcell_7_2 Rcell_7_3 Rcell_7_4 Rcell_7_5 Rcell_7_6 Rcell_7_7 Rcell_7_8 Rcell_7_9 Rcell_7_10 Rcell_7_11 Rcell_7_12 Rcell_7_13 Rcell_7_14 Rcell_7_15 Rcell_8_0 Rcell_8_1 Rcell_8_2 Rcell_8_3 Rcell_8_4 Rcell_8_5 Rcell_8_6 Rcell_8_7 Rcell_8_8 Rcell_8_9 Rcell_8_10 Rcell_8_11 Rcell_8_12 Rcell_8_13 Rcell_8_14 Rcell_8_15 Rcell_9_0 Rcell_9_1 Rcell_9_2 Rcell_9_3 Rcell_9_4 Rcell_9_5 Rcell_9_6 Rcell_9_7 Rcell_9_8 Rcell_9_9 Rcell_9_10 Rcell_9_11 Rcell_9_12 Rcell_9_13 Rcell_9_14 Rcell_9_15 Rcell_10_0 Rcell_10_1 Rcell_10_2 Rcell_10_3 Rcell_10_4 Rcell_10_5 Rcell_10_6 Rcell_10_7 Rcell_10_8 Rcell_10_9 Rcell_10_10 Rcell_10_11 Rcell_10_12 Rcell_10_13 Rcell_10_14 Rcell_10_15 Rcell_11_0 Rcell_11_1 Rcell_11_2 Rcell_11_3 Rcell_11_4 Rcell_11_5 Rcell_11_6 Rcell_11_7 Rcell_11_8 Rcell_11_9 Rcell_11_10 Rcell_11_11 Rcell_11_12 Rcell_11_13 Rcell_11_14 Rcell_11_15 Rcell_12_0 Rcell_12_1 Rcell_12_2 Rcell_12_3 Rcell_12_4 Rcell_12_5 Rcell_12_6 Rcell_12_7 Rcell_12_8 Rcell_12_9 Rcell_12_10 Rcell_12_11 Rcell_12_12 Rcell_12_13 Rcell_12_14 Rcell_12_15 Rcell_13_0 Rcell_13_1 Rcell_13_2 Rcell_13_3 Rcell_13_4 Rcell_13_5 Rcell_13_6 Rcell_13_7 Rcell_13_8 Rcell_13_9 Rcell_13_10 Rcell_13_11 Rcell_13_12 Rcell_13_13 Rcell_13_14 Rcell_13_15 Rcell_14_0 Rcell_14_1 Rcell_14_2 Rcell_14_3 Rcell_14_4 Rcell_14_5 Rcell_14_6 Rcell_14_7 Rcell_14_8 Rcell_14_9 Rcell_14_10 Rcell_14_11 Rcell_14_12 Rcell_14_13 Rcell_14_14 Rcell_14_15 Rcell_15_0 Rcell_15_1 Rcell_15_2 Rcell_15_3 Rcell_15_4 Rcell_15_5 Rcell_15_6 Rcell_15_7 Rcell_15_8 Rcell_15_9 Rcell_15_10 Rcell_15_11 Rcell_15_12 Rcell_15_13 Rcell_15_14 Rcell_15_15

xdecWL (WLencoded_0 WLencoded_1 WLencoded_2 WLencoded_3 LBenable WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 vdd_0 vss NBulkLine PBulkLine) decoderfour //decoders
xdecBL (BLencoded_0 BLencoded_1 BLencoded_2 BLencoded_3 LBenable BLencLine_0 BLencLine_1 BLencLine_2 BLencLine_3 BLencLine_4 BLencLine_5 BLencLine_6 BLencLine_7 BLencLine_8 BLencLine_9 BLencLine_10 BLencLine_11 BLencLine_12 BLencLine_13 BLencLine_14 BLencLine_15 vdd_0 vss NBulkLine PBulkLine) decoderfour


xnor0 (BLencLine_0 Refenable temp_0 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot0_0 (temp_0 SelL_0 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay0 (SelL_0 SelL_0Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot0_1 (SelL_0 SelLbar_0 vdd_0 vss PBulkLine NBulkLine) inverter
xnot0_2 (SelLbar_0 SelLbarbar_0 vdd_0 vss PBulkLine NBulkLine) inverter
xnand0 (SelL_0 Delay SelLbarbarbar_0 vdd_0 vss PBulkLine NBulkLine) twonand
xnor1 (BLencLine_1 Refenable temp_1 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot1_0 (temp_1 SelL_1 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay1 (SelL_1 SelL_1Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot1_1 (SelL_1 SelLbar_1 vdd_0 vss PBulkLine NBulkLine) inverter
xnot1_2 (SelLbar_1 SelLbarbar_1 vdd_0 vss PBulkLine NBulkLine) inverter
xnand1 (SelL_1 Delay SelLbarbarbar_1 vdd_0 vss PBulkLine NBulkLine) twonand
xnor2 (BLencLine_2 Refenable temp_2 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot2_0 (temp_2 SelL_2 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay2 (SelL_2 SelL_2Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot2_1 (SelL_2 SelLbar_2 vdd_0 vss PBulkLine NBulkLine) inverter
xnot2_2 (SelLbar_2 SelLbarbar_2 vdd_0 vss PBulkLine NBulkLine) inverter
xnand2 (SelL_2 Delay SelLbarbarbar_2 vdd_0 vss PBulkLine NBulkLine) twonand
xnor3 (BLencLine_3 Refenable temp_3 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot3_0 (temp_3 SelL_3 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay3 (SelL_3 SelL_3Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot3_1 (SelL_3 SelLbar_3 vdd_0 vss PBulkLine NBulkLine) inverter
xnot3_2 (SelLbar_3 SelLbarbar_3 vdd_0 vss PBulkLine NBulkLine) inverter
xnand3 (SelL_3 Delay SelLbarbarbar_3 vdd_0 vss PBulkLine NBulkLine) twonand
xnor4 (BLencLine_4 Refenable temp_4 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot4_0 (temp_4 SelL_4 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay4 (SelL_4 SelL_4Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot4_1 (SelL_4 SelLbar_4 vdd_0 vss PBulkLine NBulkLine) inverter
xnot4_2 (SelLbar_4 SelLbarbar_4 vdd_0 vss PBulkLine NBulkLine) inverter
xnand4 (SelL_4 Delay SelLbarbarbar_4 vdd_0 vss PBulkLine NBulkLine) twonand
xnor5 (BLencLine_5 Refenable temp_5 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot5_0 (temp_5 SelL_5 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay5 (SelL_5 SelL_5Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot5_1 (SelL_5 SelLbar_5 vdd_0 vss PBulkLine NBulkLine) inverter
xnot5_2 (SelLbar_5 SelLbarbar_5 vdd_0 vss PBulkLine NBulkLine) inverter
xnand5 (SelL_5 Delay SelLbarbarbar_5 vdd_0 vss PBulkLine NBulkLine) twonand
xnor6 (BLencLine_6 Refenable temp_6 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot6_0 (temp_6 SelL_6 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay6 (SelL_6 SelL_6Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot6_1 (SelL_6 SelLbar_6 vdd_0 vss PBulkLine NBulkLine) inverter
xnot6_2 (SelLbar_6 SelLbarbar_6 vdd_0 vss PBulkLine NBulkLine) inverter
xnand6 (SelL_6 Delay SelLbarbarbar_6 vdd_0 vss PBulkLine NBulkLine) twonand
xnor7 (BLencLine_7 Refenable temp_7 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot7_0 (temp_7 SelL_7 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay7 (SelL_7 SelL_7Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot7_1 (SelL_7 SelLbar_7 vdd_0 vss PBulkLine NBulkLine) inverter
xnot7_2 (SelLbar_7 SelLbarbar_7 vdd_0 vss PBulkLine NBulkLine) inverter
xnand7 (SelL_7 Delay SelLbarbarbar_7 vdd_0 vss PBulkLine NBulkLine) twonand
xnor8 (BLencLine_8 Refenable temp_8 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot8_0 (temp_8 SelL_8 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay8 (SelL_8 SelL_8Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot8_1 (SelL_8 SelLbar_8 vdd_0 vss PBulkLine NBulkLine) inverter
xnot8_2 (SelLbar_8 SelLbarbar_8 vdd_0 vss PBulkLine NBulkLine) inverter
xnand8 (SelL_8 Delay SelLbarbarbar_8 vdd_0 vss PBulkLine NBulkLine) twonand
xnor9 (BLencLine_9 Refenable temp_9 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot9_0 (temp_9 SelL_9 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay9 (SelL_9 SelL_9Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot9_1 (SelL_9 SelLbar_9 vdd_0 vss PBulkLine NBulkLine) inverter
xnot9_2 (SelLbar_9 SelLbarbar_9 vdd_0 vss PBulkLine NBulkLine) inverter
xnand9 (SelL_9 Delay SelLbarbarbar_9 vdd_0 vss PBulkLine NBulkLine) twonand
xnor10 (BLencLine_10 Refenable temp_10 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot10_0 (temp_10 SelL_10 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay10 (SelL_10 SelL_10Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot10_1 (SelL_10 SelLbar_10 vdd_0 vss PBulkLine NBulkLine) inverter
xnot10_2 (SelLbar_10 SelLbarbar_10 vdd_0 vss PBulkLine NBulkLine) inverter
xnand10 (SelL_10 Delay SelLbarbarbar_10 vdd_0 vss PBulkLine NBulkLine) twonand
xnor11 (BLencLine_11 Refenable temp_11 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot11_0 (temp_11 SelL_11 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay11 (SelL_11 SelL_11Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot11_1 (SelL_11 SelLbar_11 vdd_0 vss PBulkLine NBulkLine) inverter
xnot11_2 (SelLbar_11 SelLbarbar_11 vdd_0 vss PBulkLine NBulkLine) inverter
xnand11 (SelL_11 Delay SelLbarbarbar_11 vdd_0 vss PBulkLine NBulkLine) twonand
xnor12 (BLencLine_12 Refenable temp_12 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot12_0 (temp_12 SelL_12 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay12 (SelL_12 SelL_12Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot12_1 (SelL_12 SelLbar_12 vdd_0 vss PBulkLine NBulkLine) inverter
xnot12_2 (SelLbar_12 SelLbarbar_12 vdd_0 vss PBulkLine NBulkLine) inverter
xnand12 (SelL_12 Delay SelLbarbarbar_12 vdd_0 vss PBulkLine NBulkLine) twonand
xnor13 (BLencLine_13 Refenable temp_13 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot13_0 (temp_13 SelL_13 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay13 (SelL_13 SelL_13Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot13_1 (SelL_13 SelLbar_13 vdd_0 vss PBulkLine NBulkLine) inverter
xnot13_2 (SelLbar_13 SelLbarbar_13 vdd_0 vss PBulkLine NBulkLine) inverter
xnand13 (SelL_13 Delay SelLbarbarbar_13 vdd_0 vss PBulkLine NBulkLine) twonand
xnor14 (BLencLine_14 Refenable temp_14 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot14_0 (temp_14 SelL_14 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay14 (SelL_14 SelL_14Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot14_1 (SelL_14 SelLbar_14 vdd_0 vss PBulkLine NBulkLine) inverter
xnot14_2 (SelLbar_14 SelLbarbar_14 vdd_0 vss PBulkLine NBulkLine) inverter
xnand14 (SelL_14 Delay SelLbarbarbar_14 vdd_0 vss PBulkLine NBulkLine) twonand
xnor15 (BLencLine_15 Refenable temp_15 vdd_0 vss PBulkLine NBulkLine) twonor //load logic
xnot15_0 (temp_15 SelL_15 vdd_0 vss PBulkLine NBulkLine) inverter
//xDelay15 (SelL_15 SelL_15Delay vdd_0 vss PBulkLine NBulkLine) delayfour
xnot15_1 (SelL_15 SelLbar_15 vdd_0 vss PBulkLine NBulkLine) inverter
xnot15_2 (SelLbar_15 SelLbarbar_15 vdd_0 vss PBulkLine NBulkLine) inverter
xnand15 (SelL_15 Delay SelLbarbarbar_15 vdd_0 vss PBulkLine NBulkLine) twonand

xDelayrefenable (Refenable WL_Ref vdd_0 vss PBulkLine NBulkLine) delaytwo // moet min 2 delays lang zijn

xBranch0 (vdd_2 vss BL_0 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_0 SelLbarbarbar_0 SelLbar_0 PBulkLine NBulkLine) branch Rcell_0 = Rcell_0_0 Rcell_1 = Rcell_0_1 Rcell_2 = Rcell_0_2 Rcell_3 = Rcell_0_3 Rcell_4 = Rcell_0_4 Rcell_5 = Rcell_0_5 Rcell_6 = Rcell_0_6 Rcell_7 = Rcell_0_7 Rcell_8 = Rcell_0_8 Rcell_9 = Rcell_0_9 Rcell_10 = Rcell_0_10 Rcell_11 = Rcell_0_11 Rcell_12 = Rcell_0_12 Rcell_13 = Rcell_0_13 Rcell_14 = Rcell_0_14 Rcell_15 = Rcell_0_15 Rref = Rref_0
xMn0 BL_0 SelLbarbar_0 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp0 BL_0 SelLbar_0 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch1 (vdd_2 vss BL_1 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_1 SelLbarbarbar_1 SelLbar_1 PBulkLine NBulkLine) branch Rcell_0 = Rcell_1_0 Rcell_1 = Rcell_1_1 Rcell_2 = Rcell_1_2 Rcell_3 = Rcell_1_3 Rcell_4 = Rcell_1_4 Rcell_5 = Rcell_1_5 Rcell_6 = Rcell_1_6 Rcell_7 = Rcell_1_7 Rcell_8 = Rcell_1_8 Rcell_9 = Rcell_1_9 Rcell_10 = Rcell_1_10 Rcell_11 = Rcell_1_11 Rcell_12 = Rcell_1_12 Rcell_13 = Rcell_1_13 Rcell_14 = Rcell_1_14 Rcell_15 = Rcell_1_15 Rref = Rref_1
xMn1 BL_1 SelLbarbar_1 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp1 BL_1 SelLbar_1 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch2 (vdd_2 vss BL_2 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_2 SelLbarbarbar_2 SelLbar_2 PBulkLine NBulkLine) branch Rcell_0 = Rcell_2_0 Rcell_1 = Rcell_2_1 Rcell_2 = Rcell_2_2 Rcell_3 = Rcell_2_3 Rcell_4 = Rcell_2_4 Rcell_5 = Rcell_2_5 Rcell_6 = Rcell_2_6 Rcell_7 = Rcell_2_7 Rcell_8 = Rcell_2_8 Rcell_9 = Rcell_2_9 Rcell_10 = Rcell_2_10 Rcell_11 = Rcell_2_11 Rcell_12 = Rcell_2_12 Rcell_13 = Rcell_2_13 Rcell_14 = Rcell_2_14 Rcell_15 = Rcell_2_15 Rref = Rref_2
xMn2 BL_2 SelLbarbar_2 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp2 BL_2 SelLbar_2 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch3 (vdd_2 vss BL_3 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_3 SelLbarbarbar_3 SelLbar_3 PBulkLine NBulkLine) branch Rcell_0 = Rcell_3_0 Rcell_1 = Rcell_3_1 Rcell_2 = Rcell_3_2 Rcell_3 = Rcell_3_3 Rcell_4 = Rcell_3_4 Rcell_5 = Rcell_3_5 Rcell_6 = Rcell_3_6 Rcell_7 = Rcell_3_7 Rcell_8 = Rcell_3_8 Rcell_9 = Rcell_3_9 Rcell_10 = Rcell_3_10 Rcell_11 = Rcell_3_11 Rcell_12 = Rcell_3_12 Rcell_13 = Rcell_3_13 Rcell_14 = Rcell_3_14 Rcell_15 = Rcell_3_15 Rref = Rref_3
xMn3 BL_3 SelLbarbar_3 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp3 BL_3 SelLbar_3 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch4 (vdd_2 vss BL_4 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_4 SelLbarbarbar_4 SelLbar_4 PBulkLine NBulkLine) branch Rcell_0 = Rcell_4_0 Rcell_1 = Rcell_4_1 Rcell_2 = Rcell_4_2 Rcell_3 = Rcell_4_3 Rcell_4 = Rcell_4_4 Rcell_5 = Rcell_4_5 Rcell_6 = Rcell_4_6 Rcell_7 = Rcell_4_7 Rcell_8 = Rcell_4_8 Rcell_9 = Rcell_4_9 Rcell_10 = Rcell_4_10 Rcell_11 = Rcell_4_11 Rcell_12 = Rcell_4_12 Rcell_13 = Rcell_4_13 Rcell_14 = Rcell_4_14 Rcell_15 = Rcell_4_15 Rref = Rref_4
xMn4 BL_4 SelLbarbar_4 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp4 BL_4 SelLbar_4 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch5 (vdd_2 vss BL_5 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_5 SelLbarbarbar_5 SelLbar_5 PBulkLine NBulkLine) branch Rcell_0 = Rcell_5_0 Rcell_1 = Rcell_5_1 Rcell_2 = Rcell_5_2 Rcell_3 = Rcell_5_3 Rcell_4 = Rcell_5_4 Rcell_5 = Rcell_5_5 Rcell_6 = Rcell_5_6 Rcell_7 = Rcell_5_7 Rcell_8 = Rcell_5_8 Rcell_9 = Rcell_5_9 Rcell_10 = Rcell_5_10 Rcell_11 = Rcell_5_11 Rcell_12 = Rcell_5_12 Rcell_13 = Rcell_5_13 Rcell_14 = Rcell_5_14 Rcell_15 = Rcell_5_15 Rref = Rref_5
xMn5 BL_5 SelLbarbar_5 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp5 BL_5 SelLbar_5 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch6 (vdd_2 vss BL_6 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_6 SelLbarbarbar_6 SelLbar_6 PBulkLine NBulkLine) branch Rcell_0 = Rcell_6_0 Rcell_1 = Rcell_6_1 Rcell_2 = Rcell_6_2 Rcell_3 = Rcell_6_3 Rcell_4 = Rcell_6_4 Rcell_5 = Rcell_6_5 Rcell_6 = Rcell_6_6 Rcell_7 = Rcell_6_7 Rcell_8 = Rcell_6_8 Rcell_9 = Rcell_6_9 Rcell_10 = Rcell_6_10 Rcell_11 = Rcell_6_11 Rcell_12 = Rcell_6_12 Rcell_13 = Rcell_6_13 Rcell_14 = Rcell_6_14 Rcell_15 = Rcell_6_15 Rref = Rref_6
xMn6 BL_6 SelLbarbar_6 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp6 BL_6 SelLbar_6 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch7 (vdd_2 vss BL_7 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_7 SelLbarbarbar_7 SelLbar_7 PBulkLine NBulkLine) branch Rcell_0 = Rcell_7_0 Rcell_1 = Rcell_7_1 Rcell_2 = Rcell_7_2 Rcell_3 = Rcell_7_3 Rcell_4 = Rcell_7_4 Rcell_5 = Rcell_7_5 Rcell_6 = Rcell_7_6 Rcell_7 = Rcell_7_7 Rcell_8 = Rcell_7_8 Rcell_9 = Rcell_7_9 Rcell_10 = Rcell_7_10 Rcell_11 = Rcell_7_11 Rcell_12 = Rcell_7_12 Rcell_13 = Rcell_7_13 Rcell_14 = Rcell_7_14 Rcell_15 = Rcell_7_15 Rref = Rref_7
xMn7 BL_7 SelLbarbar_7 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp7 BL_7 SelLbar_7 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch8 (vdd_2 vss BL_8 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_8 SelLbarbarbar_8 SelLbar_8 PBulkLine NBulkLine) branch Rcell_0 = Rcell_8_0 Rcell_1 = Rcell_8_1 Rcell_2 = Rcell_8_2 Rcell_3 = Rcell_8_3 Rcell_4 = Rcell_8_4 Rcell_5 = Rcell_8_5 Rcell_6 = Rcell_8_6 Rcell_7 = Rcell_8_7 Rcell_8 = Rcell_8_8 Rcell_9 = Rcell_8_9 Rcell_10 = Rcell_8_10 Rcell_11 = Rcell_8_11 Rcell_12 = Rcell_8_12 Rcell_13 = Rcell_8_13 Rcell_14 = Rcell_8_14 Rcell_15 = Rcell_8_15 Rref = Rref_8
xMn8 BL_8 SelLbarbar_8 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp8 BL_8 SelLbar_8 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch9 (vdd_2 vss BL_9 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_9 SelLbarbarbar_9 SelLbar_9 PBulkLine NBulkLine) branch Rcell_0 = Rcell_9_0 Rcell_1 = Rcell_9_1 Rcell_2 = Rcell_9_2 Rcell_3 = Rcell_9_3 Rcell_4 = Rcell_9_4 Rcell_5 = Rcell_9_5 Rcell_6 = Rcell_9_6 Rcell_7 = Rcell_9_7 Rcell_8 = Rcell_9_8 Rcell_9 = Rcell_9_9 Rcell_10 = Rcell_9_10 Rcell_11 = Rcell_9_11 Rcell_12 = Rcell_9_12 Rcell_13 = Rcell_9_13 Rcell_14 = Rcell_9_14 Rcell_15 = Rcell_9_15 Rref = Rref_9
xMn9 BL_9 SelLbarbar_9 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp9 BL_9 SelLbar_9 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch10 (vdd_2 vss BL_10 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_10 SelLbarbarbar_10 SelLbar_10 PBulkLine NBulkLine) branch Rcell_0 = Rcell_10_0 Rcell_1 = Rcell_10_1 Rcell_2 = Rcell_10_2 Rcell_3 = Rcell_10_3 Rcell_4 = Rcell_10_4 Rcell_5 = Rcell_10_5 Rcell_6 = Rcell_10_6 Rcell_7 = Rcell_10_7 Rcell_8 = Rcell_10_8 Rcell_9 = Rcell_10_9 Rcell_10 = Rcell_10_10 Rcell_11 = Rcell_10_11 Rcell_12 = Rcell_10_12 Rcell_13 = Rcell_10_13 Rcell_14 = Rcell_10_14 Rcell_15 = Rcell_10_15 Rref = Rref_10
xMn10 BL_10 SelLbarbar_10 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp10 BL_10 SelLbar_10 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch11 (vdd_2 vss BL_11 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_11 SelLbarbarbar_11 SelLbar_11 PBulkLine NBulkLine) branch Rcell_0 = Rcell_11_0 Rcell_1 = Rcell_11_1 Rcell_2 = Rcell_11_2 Rcell_3 = Rcell_11_3 Rcell_4 = Rcell_11_4 Rcell_5 = Rcell_11_5 Rcell_6 = Rcell_11_6 Rcell_7 = Rcell_11_7 Rcell_8 = Rcell_11_8 Rcell_9 = Rcell_11_9 Rcell_10 = Rcell_11_10 Rcell_11 = Rcell_11_11 Rcell_12 = Rcell_11_12 Rcell_13 = Rcell_11_13 Rcell_14 = Rcell_11_14 Rcell_15 = Rcell_11_15 Rref = Rref_11
xMn11 BL_11 SelLbarbar_11 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp11 BL_11 SelLbar_11 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch12 (vdd_2 vss BL_12 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_12 SelLbarbarbar_12 SelLbar_12 PBulkLine NBulkLine) branch Rcell_0 = Rcell_12_0 Rcell_1 = Rcell_12_1 Rcell_2 = Rcell_12_2 Rcell_3 = Rcell_12_3 Rcell_4 = Rcell_12_4 Rcell_5 = Rcell_12_5 Rcell_6 = Rcell_12_6 Rcell_7 = Rcell_12_7 Rcell_8 = Rcell_12_8 Rcell_9 = Rcell_12_9 Rcell_10 = Rcell_12_10 Rcell_11 = Rcell_12_11 Rcell_12 = Rcell_12_12 Rcell_13 = Rcell_12_13 Rcell_14 = Rcell_12_14 Rcell_15 = Rcell_12_15 Rref = Rref_12
xMn12 BL_12 SelLbarbar_12 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp12 BL_12 SelLbar_12 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch13 (vdd_2 vss BL_13 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_13 SelLbarbarbar_13 SelLbar_13 PBulkLine NBulkLine) branch Rcell_0 = Rcell_13_0 Rcell_1 = Rcell_13_1 Rcell_2 = Rcell_13_2 Rcell_3 = Rcell_13_3 Rcell_4 = Rcell_13_4 Rcell_5 = Rcell_13_5 Rcell_6 = Rcell_13_6 Rcell_7 = Rcell_13_7 Rcell_8 = Rcell_13_8 Rcell_9 = Rcell_13_9 Rcell_10 = Rcell_13_10 Rcell_11 = Rcell_13_11 Rcell_12 = Rcell_13_12 Rcell_13 = Rcell_13_13 Rcell_14 = Rcell_13_14 Rcell_15 = Rcell_13_15 Rref = Rref_13
xMn13 BL_13 SelLbarbar_13 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp13 BL_13 SelLbar_13 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch14 (vdd_2 vss BL_14 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_14 SelLbarbarbar_14 SelLbar_14 PBulkLine NBulkLine) branch Rcell_0 = Rcell_14_0 Rcell_1 = Rcell_14_1 Rcell_2 = Rcell_14_2 Rcell_3 = Rcell_14_3 Rcell_4 = Rcell_14_4 Rcell_5 = Rcell_14_5 Rcell_6 = Rcell_14_6 Rcell_7 = Rcell_14_7 Rcell_8 = Rcell_14_8 Rcell_9 = Rcell_14_9 Rcell_10 = Rcell_14_10 Rcell_11 = Rcell_14_11 Rcell_12 = Rcell_14_12 Rcell_13 = Rcell_14_13 Rcell_14 = Rcell_14_14 Rcell_15 = Rcell_14_15 Rref = Rref_14
xMn14 BL_14 SelLbarbar_14 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp14 BL_14 SelLbar_14 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
xBranch15 (vdd_2 vss BL_15 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_Ref SelLbarbar_15 SelLbarbarbar_15 SelLbar_15 PBulkLine NBulkLine) branch Rcell_0 = Rcell_15_0 Rcell_1 = Rcell_15_1 Rcell_2 = Rcell_15_2 Rcell_3 = Rcell_15_3 Rcell_4 = Rcell_15_4 Rcell_5 = Rcell_15_5 Rcell_6 = Rcell_15_6 Rcell_7 = Rcell_15_7 Rcell_8 = Rcell_15_8 Rcell_9 = Rcell_15_9 Rcell_10 = Rcell_15_10 Rcell_11 = Rcell_15_11 Rcell_12 = Rcell_15_12 Rcell_13 = Rcell_15_13 Rcell_14 = Rcell_15_14 Rcell_15 = Rcell_15_15 Rref = Rref_15
xMn15 BL_15 SelLbarbar_15 BLout NBulkLine mc_nmos_hvt w=PWmuxLB l=PLmin //mux
//xMp15 BL_15 SelLbar_15 BLout PBulkLine mc_pmos_hvt w=PWmuxLB l=PLmin
cParWL0 WL_0 vss capacitor c=Cpar*16
cParWL1 WL_1 vss capacitor c=Cpar*16
cParWL2 WL_2 vss capacitor c=Cpar*16
cParWL3 WL_3 vss capacitor c=Cpar*16
cParWL4 WL_4 vss capacitor c=Cpar*16
cParWL5 WL_5 vss capacitor c=Cpar*16
cParWL6 WL_6 vss capacitor c=Cpar*16
cParWL7 WL_7 vss capacitor c=Cpar*16
cParWL8 WL_8 vss capacitor c=Cpar*16
cParWL9 WL_9 vss capacitor c=Cpar*16
cParWL10 WL_10 vss capacitor c=Cpar*16
cParWL11 WL_11 vss capacitor c=Cpar*16
cParWL12 WL_12 vss capacitor c=Cpar*16
cParWL13 WL_13 vss capacitor c=Cpar*16
cParWL14 WL_14 vss capacitor c=Cpar*16
cParWL15 WL_15 vss capacitor c=Cpar*16
cParWL16 Refenable vss capacitor c=Cpar*16

ends localblock