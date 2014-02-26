
simulator lang=spectre

include "localblock.sp"
include "senseamplifier.scs"

subckt globalblock (vdd vss NBulkLine PBulkLine
+LWLencoded_0_0 LWLencoded_1_0
+LBLencoded_0_0 LBLencoded_0_1 LBLencoded_1_0 LBLencoded_1_1
+SelLB_0 SelLB_1
+InOut InOutbar EnableSAP EnableSAN
+RefWL_0 RefWL_1 RefSourceSelect RefCharge RefDischarge PassRef)

parameters Rcell_0_0_0 Rcell_0_0_1 Rcell_0_1_0 Rcell_0_1_1 Rcell_0_2_0 Rcell_0_2_1 Rcell_0_3_0 Rcell_0_3_1 Rcell_1_0_0 Rcell_1_0_1 Rcell_1_1_0 Rcell_1_1_1 Rcell_1_2_0 Rcell_1_2_1 Rcell_1_3_0 Rcell_1_3_1

xLB0 (vdd vss NBulkLine PBulkLine LWLencoded_0_0 SelLB_0 LBLencoded_0_0 LBLencoded_0_1 SelLB_0 BLout_0) localblock Rcell_0_0 = Rcell_0_0_0 Rcell_0_1 = Rcell_0_0_1 Rcell_1_0 = Rcell_0_1_0 Rcell_1_1 = Rcell_0_1_1 Rcell_2_0 = Rcell_0_2_0 Rcell_2_1 = Rcell_0_2_1 Rcell_3_0 = Rcell_0_3_0 Rcell_3_1 = Rcell_0_3_1
xM0 BLout_0 SelLB_0 InOut NBulkLine mc_nmos_lvt w=PWmuxGB l=PLmin
xLB1 (vdd vss NBulkLine PBulkLine LWLencoded_1_0 SelLB_1 LBLencoded_1_0 LBLencoded_1_1 SelLB_1 BLout_1) localblock Rcell_0_0 = Rcell_1_0_0 Rcell_0_1 = Rcell_1_0_1 Rcell_1_0 = Rcell_1_1_0 Rcell_1_1 = Rcell_1_1_1 Rcell_2_0 = Rcell_1_2_0 Rcell_2_1 = Rcell_1_2_1 Rcell_3_0 = Rcell_1_3_0 Rcell_3_1 = Rcell_1_3_1
xM1 BLout_1 SelLB_1 InOut NBulkLine mc_nmos_lvt w=PWmuxGB l=PLmin
xRefBranch (vdd vss RefBitLine RefWL_0 RefWL_1 RefSourceSelect RefCharge RefDischarge PBulkLine NBulkLine) branch Rcell_0 = Rref_0 Rcell_1 = Rref_1
xPassgate (RefBitLine PassRef InOutbar NBulkLine) mc_nmos_lvt w=PWmuxGB l=PLmin

xSA (vdd vss NBulkLine PBulkLine InOut InOutbar EnableSAP EnableSAN) senseamplifier

ends globalblock