// showcase for mismatch simulation

simulator lang=spectre

include "transistorsPTM.scs"
include "../../ArchitectureDesign/SPICE/decoder.sp"
include "../../ArchitectureDesign/SPICE/CMOSlogic.scs"
include "parameters.sp"

xdecoder (IN_0 IN_1 IN_2 IN_3 IN_4 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 vdd vss NBulkLine PBulkLine) decoderfive

Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( PBulkLine 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( NBulkLine 0 ) vsource dc=0


xinv_0 (OUT_0 whatevs_0 vdd vss PBulkLine NBulkLine) inverter
//cCap0 OUT_0 0 capacitor c=0.18e-15
xinv_1 (OUT_1 whatevs_1 vdd vss PBulkLine NBulkLine) inverter
//cCap1 OUT_1 0 capacitor c=0.18e-15
xinv_2 (OUT_2 whatevs_2 vdd vss PBulkLine NBulkLine) inverter
//cCap2 OUT_2 0 capacitor c=0.18e-15
xinv_3 (OUT_3 whatevs_3 vdd vss PBulkLine NBulkLine) inverter
//cCap3 OUT_3 0 capacitor c=0.18e-15
xinv_4 (OUT_4 whatevs_4 vdd vss PBulkLine NBulkLine) inverter
//cCap4 OUT_4 0 capacitor c=0.18e-15
xinv_5 (OUT_5 whatevs_5 vdd vss PBulkLine NBulkLine) inverter
//cCap5 OUT_5 0 capacitor c=0.18e-15
xinv_6 (OUT_6 whatevs_6 vdd vss PBulkLine NBulkLine) inverter
//cCap6 OUT_6 0 capacitor c=0.18e-15
xinv_7 (OUT_7 whatevs_7 vdd vss PBulkLine NBulkLine) inverter
//cCap7 OUT_7 0 capacitor c=0.18e-15
xinv_8 (OUT_8 whatevs_8 vdd vss PBulkLine NBulkLine) inverter
//cCap8 OUT_8 0 capacitor c=0.18e-15
xinv_9 (OUT_9 whatevs_9 vdd vss PBulkLine NBulkLine) inverter
//cCap9 OUT_9 0 capacitor c=0.18e-15
xinv_10 (OUT_10 whatevs_10 vdd vss PBulkLine NBulkLine) inverter
//cCap10 OUT_10 0 capacitor c=0.18e-15
xinv_11 (OUT_11 whatevs_11 vdd vss PBulkLine NBulkLine) inverter
//cCap11 OUT_11 0 capacitor c=0.18e-15
xinv_12 (OUT_12 whatevs_12 vdd vss PBulkLine NBulkLine) inverter
//cCap12 OUT_12 0 capacitor c=0.18e-15
xinv_13 (OUT_13 whatevs_13 vdd vss PBulkLine NBulkLine) inverter
//cCap13 OUT_13 0 capacitor c=0.18e-15
xinv_14 (OUT_14 whatevs_14 vdd vss PBulkLine NBulkLine) inverter
//cCap14 OUT_14 0 capacitor c=0.18e-15
xinv_15 (OUT_15 whatevs_15 vdd vss PBulkLine NBulkLine) inverter
//cCap15 OUT_15 0 capacitor c=0.18e-15
xinv_16 (OUT_16 whatevs_16 vdd vss PBulkLine NBulkLine) inverter
//cCap16 OUT_16 0 capacitor c=0.18e-15
xinv_17 (OUT_17 whatevs_17 vdd vss PBulkLine NBulkLine) inverter
//cCap17 OUT_17 0 capacitor c=0.18e-15
xinv_18 (OUT_18 whatevs_18 vdd vss PBulkLine NBulkLine) inverter
//cCap18 OUT_18 0 capacitor c=0.18e-15
xinv_19 (OUT_19 whatevs_19 vdd vss PBulkLine NBulkLine) inverter
//cCap19 OUT_19 0 capacitor c=0.18e-15
xinv_20 (OUT_20 whatevs_20 vdd vss PBulkLine NBulkLine) inverter
//cCap20 OUT_20 0 capacitor c=0.18e-15
xinv_21 (OUT_21 whatevs_21 vdd vss PBulkLine NBulkLine) inverter
//cCap21 OUT_21 0 capacitor c=0.18e-15
xinv_22 (OUT_22 whatevs_22 vdd vss PBulkLine NBulkLine) inverter
//cCap22 OUT_22 0 capacitor c=0.18e-15
xinv_23 (OUT_23 whatevs_23 vdd vss PBulkLine NBulkLine) inverter
//cCap23 OUT_23 0 capacitor c=0.18e-15
xinv_24 (OUT_24 whatevs_24 vdd vss PBulkLine NBulkLine) inverter
//cCap24 OUT_24 0 capacitor c=0.18e-15
xinv_25 (OUT_25 whatevs_25 vdd vss PBulkLine NBulkLine) inverter
//cCap25 OUT_25 0 capacitor c=0.18e-15
xinv_26 (OUT_26 whatevs_26 vdd vss PBulkLine NBulkLine) inverter
//cCap26 OUT_26 0 capacitor c=0.18e-15
xinv_27 (OUT_27 whatevs_27 vdd vss PBulkLine NBulkLine) inverter
//cCap27 OUT_27 0 capacitor c=0.18e-15
xinv_28 (OUT_28 whatevs_28 vdd vss PBulkLine NBulkLine) inverter
//cCap28 OUT_28 0 capacitor c=0.18e-15
xinv_29 (OUT_29 whatevs_29 vdd vss PBulkLine NBulkLine) inverter
//cCap29 OUT_29 0 capacitor c=0.18e-15
xinv_30 (OUT_30 whatevs_30 vdd vss PBulkLine NBulkLine) inverter
//cCap30 OUT_30 0 capacitor c=0.18e-15
xinv_31 (OUT_31 whatevs_31 vdd vss PBulkLine NBulkLine) inverter
//cCap31 OUT_31 0 capacitor c=0.18e-15

Ven (enable 0) vsource type=pwl wave=waveen
//Ven (enable 0) vsource dc=1

Vin0 (IN_0 0) vsource type=pwl wave=wavein_0
Vin1 (IN_1 0) vsource type=pwl wave=wavein_1
Vin2 (IN_2 0) vsource type=pwl wave=wavein_2
Vin3 (IN_3 0) vsource type=pwl wave=wavein_3
Vin4 (IN_4 0) vsource type=pwl wave=wavein_4

save IN_0 IN_1 IN_2 IN_3 IN_4 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 Vvdd:currents

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

