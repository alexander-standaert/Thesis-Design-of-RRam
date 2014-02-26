
simulator lang=spectre

include "transistorsPTM.scs"
include "globalblock.sp"
include "drivers.sp"
include "parameters.sp"




xDrivers (vdd vss NBulkLine PBulkLine
+ BLenc_start_0 BLenc_start_1
+ WLenc_start_0
+ BLenc_0_0_0 BLenc_0_0_1 BLenc_0_1_0 BLenc_0_1_1
+ WLenc_0_0_0 WLenc_0_1_0
+ GBenable_0
+ LBenable_0 LBenable_1) drivers


xGB0 (vdd vss NBulkLine PBulkLine
+WLenc_0_0_0 WLenc_0_1_0
+BLenc_0_0_0 BLenc_0_0_1 BLenc_0_1_0 BLenc_0_1_1
+LBenable_0 LBenable_1
+InOut InOutbar EnableSAP EnableSAN
+RefWL_0 RefWL_1 RefSourceSelect RefCharge RefDischarge PassRef)       
+globalblock Rcell_0_0_0 = Rcell_0_0_0_0 Rcell_0_0_1 = Rcell_0_0_0_1 Rcell_0_1_0 = Rcell_0_0_1_0 Rcell_0_1_1 = Rcell_0_0_1_1 Rcell_0_2_0 = Rcell_0_0_2_0 Rcell_0_2_1 = Rcell_0_0_2_1 Rcell_0_3_0 = Rcell_0_0_3_0 Rcell_0_3_1 = Rcell_0_0_3_1 Rcell_1_0_0 = Rcell_0_1_0_0 Rcell_1_0_1 = Rcell_0_1_0_1 Rcell_1_1_0 = Rcell_0_1_1_0 Rcell_1_1_1 = Rcell_0_1_1_1 Rcell_1_2_0 = Rcell_0_1_2_0 Rcell_1_2_1 = Rcell_0_1_2_1 Rcell_1_3_0 = Rcell_0_1_3_0 Rcell_1_3_1 = Rcell_0_1_3_1

xInv0 (InOut InOutbarBuf vdd vss PBulkLine NBulkLine) inverter
xInv1 (InOutbar InOutBuf vdd vss PBulkLine NBulkLine) inverter

VGBen0 (GBenable_0 0) vsource type=pwl wave=waveEnGB_0
VLBen0 (LBenable_0 0) vsource type=pwl wave=waveEnLB_0
VLBen1 (LBenable_1 0) vsource type=pwl wave=waveEnLB_1
VBLenc0 (BLenc_start_0 0) vsource type=pwl wave=waveBLstart_0
VBLenc1 (BLenc_start_1 0) vsource type=pwl wave=waveBLstart_1
VWLenc0 (WLenc_start_0 0) vsource type=pwl wave=waveWLstart_0



Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( PBulkLine 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( NBulkLine 0 ) vsource dc=0

Vsap (EnableSAP 0) vsource dc=1
Vsan (EnableSAN 0) vsource dc=0
VRefSS (RefSourceSelect 0) vsource dc=0
VRefDC (RefDischarge 0) vsource dc=1
VrefC (RefCharge 0) vsource dc=1
Vpref (PassRef 0) vsource dc=0

VrefWL0 (RefWL_0 0) vsource dc=0
VrefWL1 (RefWL_1 0) vsource dc=0


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
