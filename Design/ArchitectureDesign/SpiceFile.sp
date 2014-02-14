
simulator lang=spectre

include "transistorsPTM.scs"
include "globalblock.sp"
include "inverter.scs"
include "parameters.sp"

xGlobal (vdd vss NBulkLine PBulkLine
+LWL_0_0 LWL_0_1 LWL_0_2 LWL_0_3 LWL_0_4 LWL_0_5 LWL_1_0 LWL_1_1 LWL_1_2 LWL_1_3 LWL_1_4 LWL_1_5 LWL_2_0 LWL_2_1 LWL_2_2 LWL_2_3 LWL_2_4 LWL_2_5 LWL_3_0 LWL_3_1 LWL_3_2 LWL_3_3 LWL_3_4 LWL_3_5 LWL_4_0 LWL_4_1 LWL_4_2 LWL_4_3 LWL_4_4 LWL_4_5 LWL_5_0 LWL_5_1 LWL_5_2 LWL_5_3 LWL_5_4 LWL_5_5 LWL_6_0 LWL_6_1 LWL_6_2 LWL_6_3 LWL_6_4 LWL_6_5 LWL_7_0 LWL_7_1 LWL_7_2 LWL_7_3 LWL_7_4 LWL_7_5
+SS_0_0 SS_0_1 SS_0_2 SS_0_3 SS_0_4 SS_0_5 SS_1_0 SS_1_1 SS_1_2 SS_1_3 SS_1_4 SS_1_5 SS_2_0 SS_2_1 SS_2_2 SS_2_3 SS_2_4 SS_2_5 SS_3_0 SS_3_1 SS_3_2 SS_3_3 SS_3_4 SS_3_5 SS_4_0 SS_4_1 SS_4_2 SS_4_3 SS_4_4 SS_4_5 SS_5_0 SS_5_1 SS_5_2 SS_5_3 SS_5_4 SS_5_5 SS_6_0 SS_6_1 SS_6_2 SS_6_3 SS_6_4 SS_6_5 SS_7_0 SS_7_1 SS_7_2 SS_7_3 SS_7_4 SS_7_5 SS_8_0 SS_8_1 SS_8_2 SS_8_3 SS_8_4 SS_8_5 SS_9_0 SS_9_1 SS_9_2 SS_9_3 SS_9_4 SS_9_5
+Charge_0_0 Charge_0_1 Charge_0_2 Charge_0_3 Charge_0_4 Charge_0_5 Charge_1_0 Charge_1_1 Charge_1_2 Charge_1_3 Charge_1_4 Charge_1_5 Charge_2_0 Charge_2_1 Charge_2_2 Charge_2_3 Charge_2_4 Charge_2_5 Charge_3_0 Charge_3_1 Charge_3_2 Charge_3_3 Charge_3_4 Charge_3_5 Charge_4_0 Charge_4_1 Charge_4_2 Charge_4_3 Charge_4_4 Charge_4_5 Charge_5_0 Charge_5_1 Charge_5_2 Charge_5_3 Charge_5_4 Charge_5_5 Charge_6_0 Charge_6_1 Charge_6_2 Charge_6_3 Charge_6_4 Charge_6_5 Charge_7_0 Charge_7_1 Charge_7_2 Charge_7_3 Charge_7_4 Charge_7_5 Charge_8_0 Charge_8_1 Charge_8_2 Charge_8_3 Charge_8_4 Charge_8_5 Charge_9_0 Charge_9_1 Charge_9_2 Charge_9_3 Charge_9_4 Charge_9_5
+Discharge_0_0 Discharge_0_1 Discharge_0_2 Discharge_0_3 Discharge_0_4 Discharge_0_5 Discharge_1_0 Discharge_1_1 Discharge_1_2 Discharge_1_3 Discharge_1_4 Discharge_1_5 Discharge_2_0 Discharge_2_1 Discharge_2_2 Discharge_2_3 Discharge_2_4 Discharge_2_5 Discharge_3_0 Discharge_3_1 Discharge_3_2 Discharge_3_3 Discharge_3_4 Discharge_3_5 Discharge_4_0 Discharge_4_1 Discharge_4_2 Discharge_4_3 Discharge_4_4 Discharge_4_5 Discharge_5_0 Discharge_5_1 Discharge_5_2 Discharge_5_3 Discharge_5_4 Discharge_5_5 Discharge_6_0 Discharge_6_1 Discharge_6_2 Discharge_6_3 Discharge_6_4 Discharge_6_5 Discharge_7_0 Discharge_7_1 Discharge_7_2 Discharge_7_3 Discharge_7_4 Discharge_7_5 Discharge_8_0 Discharge_8_1 Discharge_8_2 Discharge_8_3 Discharge_8_4 Discharge_8_5 Discharge_9_0 Discharge_9_1 Discharge_9_2 Discharge_9_3 Discharge_9_4 Discharge_9_5
+SelBL_0_0 SelBL_0_1 SelBL_0_2 SelBL_0_3 SelBL_0_4 SelBL_0_5 SelBL_1_0 SelBL_1_1 SelBL_1_2 SelBL_1_3 SelBL_1_4 SelBL_1_5 SelBL_2_0 SelBL_2_1 SelBL_2_2 SelBL_2_3 SelBL_2_4 SelBL_2_5 SelBL_3_0 SelBL_3_1 SelBL_3_2 SelBL_3_3 SelBL_3_4 SelBL_3_5 SelBL_4_0 SelBL_4_1 SelBL_4_2 SelBL_4_3 SelBL_4_4 SelBL_4_5 SelBL_5_0 SelBL_5_1 SelBL_5_2 SelBL_5_3 SelBL_5_4 SelBL_5_5 SelBL_6_0 SelBL_6_1 SelBL_6_2 SelBL_6_3 SelBL_6_4 SelBL_6_5 SelBL_7_0 SelBL_7_1 SelBL_7_2 SelBL_7_3 SelBL_7_4 SelBL_7_5 SelBL_8_0 SelBL_8_1 SelBL_8_2 SelBL_8_3 SelBL_8_4 SelBL_8_5 SelBL_9_0 SelBL_9_1 SelBL_9_2 SelBL_9_3 SelBL_9_4 SelBL_9_5
+InOut InOutbar EnableSAP EnableSAN) globalblock

xInv0 (InOut InOutbarBuf vdd vss PBulkLine NBulkLine) inverter
xInv1 (InOutbar InOutBuf vdd vss PBulkLine NBulkLine) inverter

Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( PBulkLine 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( NBulkLine 0 ) vsource dc=0

mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=numberofruns
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=simlength
}

option1 options rawfmt = psfascii
