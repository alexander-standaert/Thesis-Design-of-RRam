
simulator lang=spectre

include "localblock.sp"
include "senseamplifier.scs"
include "branch.scs"

subckt globalblock (vdd vss NBulkLine PBulkLine
+LWL_0_0 LWL_0_1 LWL_1_0 LWL_1_1 LWL_2_0 LWL_2_1 LWL_3_0 LWL_3_1 LWL_4_0 LWL_4_1 LWL_5_0 LWL_5_1 LWL_6_0 LWL_6_1 LWL_7_0 LWL_7_1
+SS_0_0 SS_0_1 SS_1_0 SS_1_1 SS_2_0 SS_2_1 SS_3_0 SS_3_1 SS_4_0 SS_4_1 SS_5_0 SS_5_1 SS_6_0 SS_6_1 SS_7_0 SS_7_1 SS_8_0 SS_8_1 SS_9_0 SS_9_1
+Charge_0_0 Charge_0_1 Charge_1_0 Charge_1_1 Charge_2_0 Charge_2_1 Charge_3_0 Charge_3_1 Charge_4_0 Charge_4_1 Charge_5_0 Charge_5_1 Charge_6_0 Charge_6_1 Charge_7_0 Charge_7_1 Charge_8_0 Charge_8_1 Charge_9_0 Charge_9_1
+Discharge_0_0 Discharge_0_1 Discharge_1_0 Discharge_1_1 Discharge_2_0 Discharge_2_1 Discharge_3_0 Discharge_3_1 Discharge_4_0 Discharge_4_1 Discharge_5_0 Discharge_5_1 Discharge_6_0 Discharge_6_1 Discharge_7_0 Discharge_7_1 Discharge_8_0 Discharge_8_1 Discharge_9_0 Discharge_9_1
+SelLB_0 SelLB_1
+InOut InOutbar EnableSAP EnableSAN
+RefWL_0 RefWL_1 RefWL_2 RefWL_3 RefWL_4 RefWL_5 RefWL_6 RefWL_7 RefSourceSelect Refcharge RefDischarge)

xLB0 (vdd vss NBulkLine PBulkLine LWL_0_0 LWL_1_0 LWL_2_0 LWL_3_0 LWL_4_0 LWL_5_0 LWL_6_0 LWL_7_0 SelBL_0_0 SelBL_1_0 SelBL_2_0 SelBL_3_0 SelBL_4_0 SelBL_5_0 SelBL_6_0 SelBL_7_0 SelBL_8_0 SelBL_9_0 BLout<strcat('_',int2str(i)) SS_0_0 SS_1_0 SS_2_0 SS_3_0 SS_4_0 SS_5_0 SS_6_0 SS_7_0 SS_8_0 SS_9_0 Charge_0_0 Charge_1_0 Charge_2_0 Charge_3_0 Charge_4_0 Charge_5_0 Charge_6_0 Charge_7_0 Charge_8_0 Charge_9_0 Discharge_0_0 Discharge_1_0 Discharge_2_0 Discharge_3_0 Discharge_4_0 Discharge_5_0 Discharge_6_0 Discharge_7_0 Discharge_8_0 Discharge_9_0) localblock
xM0 BLout_0 SelLB_0 InOut NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xLB1 (vdd vss NBulkLine PBulkLine LWL_0_1 LWL_1_1 LWL_2_1 LWL_3_1 LWL_4_1 LWL_5_1 LWL_6_1 LWL_7_1 SelBL_0_1 SelBL_1_1 SelBL_2_1 SelBL_3_1 SelBL_4_1 SelBL_5_1 SelBL_6_1 SelBL_7_1 SelBL_8_1 SelBL_9_1 BLout<strcat('_',int2str(i)) SS_0_1 SS_1_1 SS_2_1 SS_3_1 SS_4_1 SS_5_1 SS_6_1 SS_7_1 SS_8_1 SS_9_1 Charge_0_1 Charge_1_1 Charge_2_1 Charge_3_1 Charge_4_1 Charge_5_1 Charge_6_1 Charge_7_1 Charge_8_1 Charge_9_1 Discharge_0_1 Discharge_1_1 Discharge_2_1 Discharge_3_1 Discharge_4_1 Discharge_5_1 Discharge_6_1 Discharge_7_1 Discharge_8_1 Discharge_9_1) localblock
xM1 BLout_1 SelLB_1 InOut NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xRefBranch (vdd vss RefBitLine RefWL_0 RefWL_1 RefWL_2 RefWL_3 RefWL_4 RefWL_5 RefWL_6 RefWL_7 RefSourceSelect RefCharge RefDischarge PBulkLine NBulkLine) branch
xPassgate (RefBitLine PassRef InOutbar NBulkLine) mc_nmos_lvt w=PWmuxGB l=PLmin

xSA (vdd vss NBulkLine PBulkLine InOut InOutbar EnableSAP EnableSAN) senseamplifier

ends globalblock