
simulator lang=spectre

include "transistorsPTM.scs"
include "../../ArchitectureDesign/SPICE/decoder.sp"
include "parameters2.sp"

xdecoder (IN_0 IN_1 IN_2 IN_3 IN_4 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 vdd vss NBulkLine PBulkLine) decoderfive multstage_1 = dec1multstage_1 multstage_2 = dec1multstage_2 multstage_3 = dec1multstage_3 multstage_4 = dec1multstage_4
cLoad0 (OUT_0 0) capacitor c=1.8432e-13
cLoad1 (OUT_1 0) capacitor c=1.8432e-13
cLoad2 (OUT_2 0) capacitor c=1.8432e-13
cLoad3 (OUT_3 0) capacitor c=1.8432e-13
cLoad4 (OUT_4 0) capacitor c=1.8432e-13
cLoad5 (OUT_5 0) capacitor c=1.8432e-13
cLoad6 (OUT_6 0) capacitor c=1.8432e-13
cLoad7 (OUT_7 0) capacitor c=1.8432e-13
cLoad8 (OUT_8 0) capacitor c=1.8432e-13
cLoad9 (OUT_9 0) capacitor c=1.8432e-13
cLoad10 (OUT_10 0) capacitor c=1.8432e-13
cLoad11 (OUT_11 0) capacitor c=1.8432e-13
cLoad12 (OUT_12 0) capacitor c=1.8432e-13
cLoad13 (OUT_13 0) capacitor c=1.8432e-13
cLoad14 (OUT_14 0) capacitor c=1.8432e-13
cLoad15 (OUT_15 0) capacitor c=1.8432e-13
cLoad16 (OUT_16 0) capacitor c=1.8432e-13
cLoad17 (OUT_17 0) capacitor c=1.8432e-13
cLoad18 (OUT_18 0) capacitor c=1.8432e-13
cLoad19 (OUT_19 0) capacitor c=1.8432e-13
cLoad20 (OUT_20 0) capacitor c=1.8432e-13
cLoad21 (OUT_21 0) capacitor c=1.8432e-13
cLoad22 (OUT_22 0) capacitor c=1.8432e-13
cLoad23 (OUT_23 0) capacitor c=1.8432e-13
cLoad24 (OUT_24 0) capacitor c=1.8432e-13
cLoad25 (OUT_25 0) capacitor c=1.8432e-13
cLoad26 (OUT_26 0) capacitor c=1.8432e-13
cLoad27 (OUT_27 0) capacitor c=1.8432e-13
cLoad28 (OUT_28 0) capacitor c=1.8432e-13
cLoad29 (OUT_29 0) capacitor c=1.8432e-13
cLoad30 (OUT_30 0) capacitor c=1.8432e-13
cLoad31 (OUT_31 0) capacitor c=1.8432e-13

Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( PBulkLine 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( NBulkLine 0 ) vsource dc=0

Ven (enable 0) vsource type=pwl wave=waveen

Vin0 (IN_0 0) vsource type=pwl wave=wavein_0
Vin1 (IN_1 0) vsource type=pwl wave=wavein_1
Vin2 (IN_2 0) vsource type=pwl wave=wavein_2
Vin3 (IN_3 0) vsource type=pwl wave=wavein_3
Vin4 (IN_4 0) vsource type=pwl wave=wavein_4


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