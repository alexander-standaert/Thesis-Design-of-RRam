simulator lang=spice
.lib 'tech_wrapper.lib' tt

simulator lang=spectre

include "monte_carlo_models.scs"
include "globalblock.sp"
include "drivers.sp"
include "parameters.sp"

xDrivers (vdd vss NBulkLine PBulkLine
+ BLenc_start_0 BLenc_start_1
+ WLenc_start_0 WLenc_start_1 WLenc_start_2 WLenc_start_3
+ BLenc_0_0_0 BLenc_0_0_1 BLenc_0_1_0 BLenc_0_1_1
+ WLenc_0_0_0 WLenc_0_0_1 WLenc_0_0_2 WLenc_0_0_3 WLenc_0_1_0 WLenc_0_1_1 WLenc_0_1_2 WLenc_0_1_3
+ GBenable_0
+ LBenable_0 LBenable_1) drivers

xNot_0_0 (GBenable_0 GBenable_0_1 vdd vss PBulkLine NBulkLine) inverter
xNot_0_1 (GBenable_0_1 GBenable_0_2 vdd vss PBulkLine NBulkLine) inverter
xNot_0_2 (GBenable_0_2 GBenable_0_3 vdd vss PBulkLine NBulkLine) inverter
xNot_0_3 (GBenable_0_3 GBenable_0_4 vdd vss PBulkLine NBulkLine) inverter
xNot_0_4 (GBenable_0_4 GBenable_0_5 vdd vss PBulkLine NBulkLine) inverter
xNot_0_5 (GBenable_0_5 Delay_0 vdd vss PBulkLine NBulkLine) inverter

xNot_ref_0 (LBenable_0 LBenbar_0 vdd vss PBulkLine NBulkLine) inverter
xNot_ref_1 (LBenable_1 LBenbar_1 vdd vss PBulkLine NBulkLine) inverter 

xNand_ref_0_0 (LBenbar_0 GBenable_0 tempnand_0_0 vdd vss PBulkLine NBulkLine) twonand
xNot_ref_0_0 (tempnand_0_0 Refenable_0 vdd vss PBulkLine NBulkLine) inverter
xNand_ref_0_1 (LBenbar_1 GBenable_0 tempnand_0_1 vdd vss PBulkLine NBulkLine) twonand
xNot_ref_0_1 (tempnand_0_1 Refenable_1 vdd vss PBulkLine NBulkLine) inverter

xGB0 (vdd vss NBulkLine PBulkLine
+WLenc_0_0_0 WLenc_0_0_1 WLenc_0_0_2 WLenc_0_0_3 WLenc_0_1_0 WLenc_0_1_1 WLenc_0_1_2 WLenc_0_1_3
+BLenc_0_0_0 BLenc_0_0_1 BLenc_0_1_0 BLenc_0_1_1
+LBenable_0 LBenable_1 Refenable_0 Refenable_1
+InOut_0 InOutbar_0 SA_SH_0 EnableSAP_0 EnableSAN_0 Delay_0)       
+globalblock Rcell_0_0_0 = Rcell_0_0_0_0 Rcell_0_0_1 = Rcell_0_0_0_1 Rcell_0_0_2 = Rcell_0_0_0_2 Rcell_0_0_3 = Rcell_0_0_0_3 Rcell_0_0_4 = Rcell_0_0_0_4 Rcell_0_0_5 = Rcell_0_0_0_5 Rcell_0_0_6 = Rcell_0_0_0_6 Rcell_0_0_7 = Rcell_0_0_0_7 Rcell_0_0_8 = Rcell_0_0_0_8 Rcell_0_0_9 = Rcell_0_0_0_9 Rcell_0_0_10 = Rcell_0_0_0_10 Rcell_0_0_11 = Rcell_0_0_0_11 Rcell_0_0_12 = Rcell_0_0_0_12 Rcell_0_0_13 = Rcell_0_0_0_13 Rcell_0_0_14 = Rcell_0_0_0_14 Rcell_0_0_15 = Rcell_0_0_0_15 Rcell_0_1_0 = Rcell_0_0_1_0 Rcell_0_1_1 = Rcell_0_0_1_1 Rcell_0_1_2 = Rcell_0_0_1_2 Rcell_0_1_3 = Rcell_0_0_1_3 Rcell_0_1_4 = Rcell_0_0_1_4 Rcell_0_1_5 = Rcell_0_0_1_5 Rcell_0_1_6 = Rcell_0_0_1_6 Rcell_0_1_7 = Rcell_0_0_1_7 Rcell_0_1_8 = Rcell_0_0_1_8 Rcell_0_1_9 = Rcell_0_0_1_9 Rcell_0_1_10 = Rcell_0_0_1_10 Rcell_0_1_11 = Rcell_0_0_1_11 Rcell_0_1_12 = Rcell_0_0_1_12 Rcell_0_1_13 = Rcell_0_0_1_13 Rcell_0_1_14 = Rcell_0_0_1_14 Rcell_0_1_15 = Rcell_0_0_1_15 Rcell_0_2_0 = Rcell_0_0_2_0 Rcell_0_2_1 = Rcell_0_0_2_1 Rcell_0_2_2 = Rcell_0_0_2_2 Rcell_0_2_3 = Rcell_0_0_2_3 Rcell_0_2_4 = Rcell_0_0_2_4 Rcell_0_2_5 = Rcell_0_0_2_5 Rcell_0_2_6 = Rcell_0_0_2_6 Rcell_0_2_7 = Rcell_0_0_2_7 Rcell_0_2_8 = Rcell_0_0_2_8 Rcell_0_2_9 = Rcell_0_0_2_9 Rcell_0_2_10 = Rcell_0_0_2_10 Rcell_0_2_11 = Rcell_0_0_2_11 Rcell_0_2_12 = Rcell_0_0_2_12 Rcell_0_2_13 = Rcell_0_0_2_13 Rcell_0_2_14 = Rcell_0_0_2_14 Rcell_0_2_15 = Rcell_0_0_2_15 Rcell_0_3_0 = Rcell_0_0_3_0 Rcell_0_3_1 = Rcell_0_0_3_1 Rcell_0_3_2 = Rcell_0_0_3_2 Rcell_0_3_3 = Rcell_0_0_3_3 Rcell_0_3_4 = Rcell_0_0_3_4 Rcell_0_3_5 = Rcell_0_0_3_5 Rcell_0_3_6 = Rcell_0_0_3_6 Rcell_0_3_7 = Rcell_0_0_3_7 Rcell_0_3_8 = Rcell_0_0_3_8 Rcell_0_3_9 = Rcell_0_0_3_9 Rcell_0_3_10 = Rcell_0_0_3_10 Rcell_0_3_11 = Rcell_0_0_3_11 Rcell_0_3_12 = Rcell_0_0_3_12 Rcell_0_3_13 = Rcell_0_0_3_13 Rcell_0_3_14 = Rcell_0_0_3_14 Rcell_0_3_15 = Rcell_0_0_3_15 Rcell_1_0_0 = Rcell_0_1_0_0 Rcell_1_0_1 = Rcell_0_1_0_1 Rcell_1_0_2 = Rcell_0_1_0_2 Rcell_1_0_3 = Rcell_0_1_0_3 Rcell_1_0_4 = Rcell_0_1_0_4 Rcell_1_0_5 = Rcell_0_1_0_5 Rcell_1_0_6 = Rcell_0_1_0_6 Rcell_1_0_7 = Rcell_0_1_0_7 Rcell_1_0_8 = Rcell_0_1_0_8 Rcell_1_0_9 = Rcell_0_1_0_9 Rcell_1_0_10 = Rcell_0_1_0_10 Rcell_1_0_11 = Rcell_0_1_0_11 Rcell_1_0_12 = Rcell_0_1_0_12 Rcell_1_0_13 = Rcell_0_1_0_13 Rcell_1_0_14 = Rcell_0_1_0_14 Rcell_1_0_15 = Rcell_0_1_0_15 Rcell_1_1_0 = Rcell_0_1_1_0 Rcell_1_1_1 = Rcell_0_1_1_1 Rcell_1_1_2 = Rcell_0_1_1_2 Rcell_1_1_3 = Rcell_0_1_1_3 Rcell_1_1_4 = Rcell_0_1_1_4 Rcell_1_1_5 = Rcell_0_1_1_5 Rcell_1_1_6 = Rcell_0_1_1_6 Rcell_1_1_7 = Rcell_0_1_1_7 Rcell_1_1_8 = Rcell_0_1_1_8 Rcell_1_1_9 = Rcell_0_1_1_9 Rcell_1_1_10 = Rcell_0_1_1_10 Rcell_1_1_11 = Rcell_0_1_1_11 Rcell_1_1_12 = Rcell_0_1_1_12 Rcell_1_1_13 = Rcell_0_1_1_13 Rcell_1_1_14 = Rcell_0_1_1_14 Rcell_1_1_15 = Rcell_0_1_1_15 Rcell_1_2_0 = Rcell_0_1_2_0 Rcell_1_2_1 = Rcell_0_1_2_1 Rcell_1_2_2 = Rcell_0_1_2_2 Rcell_1_2_3 = Rcell_0_1_2_3 Rcell_1_2_4 = Rcell_0_1_2_4 Rcell_1_2_5 = Rcell_0_1_2_5 Rcell_1_2_6 = Rcell_0_1_2_6 Rcell_1_2_7 = Rcell_0_1_2_7 Rcell_1_2_8 = Rcell_0_1_2_8 Rcell_1_2_9 = Rcell_0_1_2_9 Rcell_1_2_10 = Rcell_0_1_2_10 Rcell_1_2_11 = Rcell_0_1_2_11 Rcell_1_2_12 = Rcell_0_1_2_12 Rcell_1_2_13 = Rcell_0_1_2_13 Rcell_1_2_14 = Rcell_0_1_2_14 Rcell_1_2_15 = Rcell_0_1_2_15 Rcell_1_3_0 = Rcell_0_1_3_0 Rcell_1_3_1 = Rcell_0_1_3_1 Rcell_1_3_2 = Rcell_0_1_3_2 Rcell_1_3_3 = Rcell_0_1_3_3 Rcell_1_3_4 = Rcell_0_1_3_4 Rcell_1_3_5 = Rcell_0_1_3_5 Rcell_1_3_6 = Rcell_0_1_3_6 Rcell_1_3_7 = Rcell_0_1_3_7 Rcell_1_3_8 = Rcell_0_1_3_8 Rcell_1_3_9 = Rcell_0_1_3_9 Rcell_1_3_10 = Rcell_0_1_3_10 Rcell_1_3_11 = Rcell_0_1_3_11 Rcell_1_3_12 = Rcell_0_1_3_12 Rcell_1_3_13 = Rcell_0_1_3_13 Rcell_1_3_14 = Rcell_0_1_3_14 Rcell_1_3_15 = Rcell_0_1_3_15
xNOTout0 (InOutbar_0 Out_0 vdd vss PBulkLine NBulkLine) inverter
xNOToutbar0 (InOut_0 Outbar_0 vdd vss PBulkLine NBulkLine) inverter


VGBen0 (GBenable_0 0) vsource type=pwl wave=waveEnGB_0
VLBen0 (LBenable_0 0) vsource type=pwl wave=waveEnLB_0
VLBen1 (LBenable_1 0) vsource type=pwl wave=waveEnLB_1
VBLenc0 (BLenc_start_0 0) vsource type=pwl wave=waveBLstart_0
VBLenc1 (BLenc_start_1 0) vsource type=pwl wave=waveBLstart_1
VWLenc0 (WLenc_start_0 0) vsource type=pwl wave=waveWLstart_0
VWLenc1 (WLenc_start_1 0) vsource type=pwl wave=waveWLstart_1
VWLenc2 (WLenc_start_2 0) vsource type=pwl wave=waveWLstart_2
VWLenc3 (WLenc_start_3 0) vsource type=pwl wave=waveWLstart_3

VSH (SA_SH_0 0) vsource type=pwl wave=wave_SA_SH
VSAN (EnableSAN_0 0) vsource type=pwl wave=wave_SAN
VSAP (EnableSAP_0 0) vsource type=pwl wave=wave_SAP

Vvdd     ( vdd     0 ) vsource dc=vdd
VvddBulk ( PBulkLine 0 ) vsource dc=vdd
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
cap info what=captab where=file file="%C:r.info.what"