simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt
.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"
include "../../ArchitectureDesign/SPICE/CMOSlogic.scs"
include "decoder2.sp"
parameters enableMismatch=0
ana tran step=1e-12 stop=2e-08
option1 options rawfmt = psfascii
//option2 options dc_pivot_check = yes

vin in vss vsource type=pwl wave=[0 0 1e-09 0 1.1e-09 1]
ven en vss vsource type=pwl wave=[0 0 1e-09 0 1.1e-09 1]
vgnd vss 0 vsource type=dc dc=0


parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght

vvdd_4 vdd_4 0 vsource type=dc dc=1
xdecoderfour (vss in vss vss  en out_4_0 out_4_1 out_4_2 out_4_3 out_4_4 out_4_5 out_4_6 out_4_7 out_4_8 out_4_9 out_4_10 out_4_11 out_4_12 out_4_13 out_4_14 out_4_15 vdd_4 vss vss vdd_4) decoderfour
//cPar_4_0 out_4_0 vss capacitor c=0.18e-15
xinv_4_0 out_4_0 out2_4_0 vdd vss vdd vss inverter
//cPar_4_1 out_4_1 vss capacitor c=0.18e-15
xinv_4_1 out_4_1 out2_4_1 vdd vss vdd vss inverter
//cPar_4_2 out_4_2 vss capacitor c=0.18e-15
xinv_4_2 out_4_2 out2_4_2 vdd vss vdd vss inverter
//cPar_4_3 out_4_3 vss capacitor c=0.18e-15
xinv_4_3 out_4_3 out2_4_3 vdd vss vdd vss inverter
//cPar_4_4 out_4_4 vss capacitor c=0.18e-15
xinv_4_4 out_4_4 out2_4_4 vdd vss vdd vss inverter
//cPar_4_5 out_4_5 vss capacitor c=0.18e-15
xinv_4_5 out_4_5 out2_4_5 vdd vss vdd vss inverter
//cPar_4_6 out_4_6 vss capacitor c=0.18e-15
xinv_4_6 out_4_6 out2_4_6 vdd vss vdd vss inverter
//cPar_4_7 out_4_7 vss capacitor c=0.18e-15
xinv_4_7 out_4_7 out2_4_7 vdd vss vdd vss inverter
//cPar_4_8 out_4_8 vss capacitor c=0.18e-15
xinv_4_8 out_4_8 out2_4_8 vdd vss vdd vss inverter
//cPar_4_9 out_4_9 vss capacitor c=0.18e-15
xinv_4_9 out_4_9 out2_4_9 vdd vss vdd vss inverter
//cPar_4_10 out_4_10 vss capacitor c=0.18e-15
xinv_4_10 out_4_10 out2_4_10 vdd vss vdd vss inverter
//cPar_4_11 out_4_11 vss capacitor c=0.18e-15
xinv_4_11 out_4_11 out2_4_11 vdd vss vdd vss inverter
//cPar_4_12 out_4_12 vss capacitor c=0.18e-15
xinv_4_12 out_4_12 out2_4_12 vdd vss vdd vss inverter
//cPar_4_13 out_4_13 vss capacitor c=0.18e-15
xinv_4_13 out_4_13 out2_4_13 vdd vss vdd vss inverter
//cPar_4_14 out_4_14 vss capacitor c=0.18e-15
xinv_4_14 out_4_14 out2_4_14 vdd vss vdd vss inverter
//cPar_4_15 out_4_15 vss capacitor c=0.18e-15
xinv_4_15 out_4_15 out2_4_15 vdd vss vdd vss inverter
save out_4_2
save out_4_2
save vvdd_4:p
vvdd_5 vdd_5 0 vsource type=dc dc=1
xdecoderfive (vss in vss vss vss  en out_5_0 out_5_1 out_5_2 out_5_3 out_5_4 out_5_5 out_5_6 out_5_7 out_5_8 out_5_9 out_5_10 out_5_11 out_5_12 out_5_13 out_5_14 out_5_15 out_5_16 out_5_17 out_5_18 out_5_19 out_5_20 out_5_21 out_5_22 out_5_23 out_5_24 out_5_25 out_5_26 out_5_27 out_5_28 out_5_29 out_5_30 out_5_31 vdd_5 vss vss vdd_5) decoderfive
//cPar_5_0 out_5_0 vss capacitor c=0.18e-15
xinv_5_0 out_5_0 out2_5_0 vdd vss vdd vss inverter
//cPar_5_1 out_5_1 vss capacitor c=0.18e-15
xinv_5_1 out_5_1 out2_5_1 vdd vss vdd vss inverter
//cPar_5_2 out_5_2 vss capacitor c=0.18e-15
xinv_5_2 out_5_2 out2_5_2 vdd vss vdd vss inverter
//cPar_5_3 out_5_3 vss capacitor c=0.18e-15
xinv_5_3 out_5_3 out2_5_3 vdd vss vdd vss inverter
//cPar_5_4 out_5_4 vss capacitor c=0.18e-15
xinv_5_4 out_5_4 out2_5_4 vdd vss vdd vss inverter
//cPar_5_5 out_5_5 vss capacitor c=0.18e-15
xinv_5_5 out_5_5 out2_5_5 vdd vss vdd vss inverter
//cPar_5_6 out_5_6 vss capacitor c=0.18e-15
xinv_5_6 out_5_6 out2_5_6 vdd vss vdd vss inverter
//cPar_5_7 out_5_7 vss capacitor c=0.18e-15
xinv_5_7 out_5_7 out2_5_7 vdd vss vdd vss inverter
//cPar_5_8 out_5_8 vss capacitor c=0.18e-15
xinv_5_8 out_5_8 out2_5_8 vdd vss vdd vss inverter
//cPar_5_9 out_5_9 vss capacitor c=0.18e-15
xinv_5_9 out_5_9 out2_5_9 vdd vss vdd vss inverter
//cPar_5_10 out_5_10 vss capacitor c=0.18e-15
xinv_5_10 out_5_10 out2_5_10 vdd vss vdd vss inverter
//cPar_5_11 out_5_11 vss capacitor c=0.18e-15
xinv_5_11 out_5_11 out2_5_11 vdd vss vdd vss inverter
//cPar_5_12 out_5_12 vss capacitor c=0.18e-15
xinv_5_12 out_5_12 out2_5_12 vdd vss vdd vss inverter
//cPar_5_13 out_5_13 vss capacitor c=0.18e-15
xinv_5_13 out_5_13 out2_5_13 vdd vss vdd vss inverter
//cPar_5_14 out_5_14 vss capacitor c=0.18e-15
xinv_5_14 out_5_14 out2_5_14 vdd vss vdd vss inverter
//cPar_5_15 out_5_15 vss capacitor c=0.18e-15
xinv_5_15 out_5_15 out2_5_15 vdd vss vdd vss inverter
//cPar_5_16 out_5_16 vss capacitor c=0.18e-15
xinv_5_16 out_5_16 out2_5_16 vdd vss vdd vss inverter
//cPar_5_17 out_5_17 vss capacitor c=0.18e-15
xinv_5_17 out_5_17 out2_5_17 vdd vss vdd vss inverter
//cPar_5_18 out_5_18 vss capacitor c=0.18e-15
xinv_5_18 out_5_18 out2_5_18 vdd vss vdd vss inverter
//cPar_5_19 out_5_19 vss capacitor c=0.18e-15
xinv_5_19 out_5_19 out2_5_19 vdd vss vdd vss inverter
//cPar_5_20 out_5_20 vss capacitor c=0.18e-15
xinv_5_20 out_5_20 out2_5_20 vdd vss vdd vss inverter
//cPar_5_21 out_5_21 vss capacitor c=0.18e-15
xinv_5_21 out_5_21 out2_5_21 vdd vss vdd vss inverter
//cPar_5_22 out_5_22 vss capacitor c=0.18e-15
xinv_5_22 out_5_22 out2_5_22 vdd vss vdd vss inverter
//cPar_5_23 out_5_23 vss capacitor c=0.18e-15
xinv_5_23 out_5_23 out2_5_23 vdd vss vdd vss inverter
//cPar_5_24 out_5_24 vss capacitor c=0.18e-15
xinv_5_24 out_5_24 out2_5_24 vdd vss vdd vss inverter
//cPar_5_25 out_5_25 vss capacitor c=0.18e-15
xinv_5_25 out_5_25 out2_5_25 vdd vss vdd vss inverter
//cPar_5_26 out_5_26 vss capacitor c=0.18e-15
xinv_5_26 out_5_26 out2_5_26 vdd vss vdd vss inverter
//cPar_5_27 out_5_27 vss capacitor c=0.18e-15
xinv_5_27 out_5_27 out2_5_27 vdd vss vdd vss inverter
//cPar_5_28 out_5_28 vss capacitor c=0.18e-15
xinv_5_28 out_5_28 out2_5_28 vdd vss vdd vss inverter
//cPar_5_29 out_5_29 vss capacitor c=0.18e-15
xinv_5_29 out_5_29 out2_5_29 vdd vss vdd vss inverter
//cPar_5_30 out_5_30 vss capacitor c=0.18e-15
xinv_5_30 out_5_30 out2_5_30 vdd vss vdd vss inverter
//cPar_5_31 out_5_31 vss capacitor c=0.18e-15
xinv_5_31 out_5_31 out2_5_31 vdd vss vdd vss inverter
save out_5_2
save out_5_2
save vvdd_5:p
vvdd_6 vdd_6 0 vsource type=dc dc=1
xdecodersix (vss in vss vss vss vss  en out_6_0 out_6_1 out_6_2 out_6_3 out_6_4 out_6_5 out_6_6 out_6_7 out_6_8 out_6_9 out_6_10 out_6_11 out_6_12 out_6_13 out_6_14 out_6_15 out_6_16 out_6_17 out_6_18 out_6_19 out_6_20 out_6_21 out_6_22 out_6_23 out_6_24 out_6_25 out_6_26 out_6_27 out_6_28 out_6_29 out_6_30 out_6_31 out_6_32 out_6_33 out_6_34 out_6_35 out_6_36 out_6_37 out_6_38 out_6_39 out_6_40 out_6_41 out_6_42 out_6_43 out_6_44 out_6_45 out_6_46 out_6_47 out_6_48 out_6_49 out_6_50 out_6_51 out_6_52 out_6_53 out_6_54 out_6_55 out_6_56 out_6_57 out_6_58 out_6_59 out_6_60 out_6_61 out_6_62 out_6_63 vdd_6 vss vss vdd_6) decodersix
//cPar_6_0 out_6_0 vss capacitor c=0.18e-15
xinv_6_0 out_6_0 out2_6_0 vdd vss vdd vss inverter
//cPar_6_1 out_6_1 vss capacitor c=0.18e-15
xinv_6_1 out_6_1 out2_6_1 vdd vss vdd vss inverter
//cPar_6_2 out_6_2 vss capacitor c=0.18e-15
xinv_6_2 out_6_2 out2_6_2 vdd vss vdd vss inverter
//cPar_6_3 out_6_3 vss capacitor c=0.18e-15
xinv_6_3 out_6_3 out2_6_3 vdd vss vdd vss inverter
//cPar_6_4 out_6_4 vss capacitor c=0.18e-15
xinv_6_4 out_6_4 out2_6_4 vdd vss vdd vss inverter
//cPar_6_5 out_6_5 vss capacitor c=0.18e-15
xinv_6_5 out_6_5 out2_6_5 vdd vss vdd vss inverter
//cPar_6_6 out_6_6 vss capacitor c=0.18e-15
xinv_6_6 out_6_6 out2_6_6 vdd vss vdd vss inverter
//cPar_6_7 out_6_7 vss capacitor c=0.18e-15
xinv_6_7 out_6_7 out2_6_7 vdd vss vdd vss inverter
//cPar_6_8 out_6_8 vss capacitor c=0.18e-15
xinv_6_8 out_6_8 out2_6_8 vdd vss vdd vss inverter
//cPar_6_9 out_6_9 vss capacitor c=0.18e-15
xinv_6_9 out_6_9 out2_6_9 vdd vss vdd vss inverter
//cPar_6_10 out_6_10 vss capacitor c=0.18e-15
xinv_6_10 out_6_10 out2_6_10 vdd vss vdd vss inverter
//cPar_6_11 out_6_11 vss capacitor c=0.18e-15
xinv_6_11 out_6_11 out2_6_11 vdd vss vdd vss inverter
//cPar_6_12 out_6_12 vss capacitor c=0.18e-15
xinv_6_12 out_6_12 out2_6_12 vdd vss vdd vss inverter
//cPar_6_13 out_6_13 vss capacitor c=0.18e-15
xinv_6_13 out_6_13 out2_6_13 vdd vss vdd vss inverter
//cPar_6_14 out_6_14 vss capacitor c=0.18e-15
xinv_6_14 out_6_14 out2_6_14 vdd vss vdd vss inverter
//cPar_6_15 out_6_15 vss capacitor c=0.18e-15
xinv_6_15 out_6_15 out2_6_15 vdd vss vdd vss inverter
//cPar_6_16 out_6_16 vss capacitor c=0.18e-15
xinv_6_16 out_6_16 out2_6_16 vdd vss vdd vss inverter
//cPar_6_17 out_6_17 vss capacitor c=0.18e-15
xinv_6_17 out_6_17 out2_6_17 vdd vss vdd vss inverter
//cPar_6_18 out_6_18 vss capacitor c=0.18e-15
xinv_6_18 out_6_18 out2_6_18 vdd vss vdd vss inverter
//cPar_6_19 out_6_19 vss capacitor c=0.18e-15
xinv_6_19 out_6_19 out2_6_19 vdd vss vdd vss inverter
//cPar_6_20 out_6_20 vss capacitor c=0.18e-15
xinv_6_20 out_6_20 out2_6_20 vdd vss vdd vss inverter
//cPar_6_21 out_6_21 vss capacitor c=0.18e-15
xinv_6_21 out_6_21 out2_6_21 vdd vss vdd vss inverter
//cPar_6_22 out_6_22 vss capacitor c=0.18e-15
xinv_6_22 out_6_22 out2_6_22 vdd vss vdd vss inverter
//cPar_6_23 out_6_23 vss capacitor c=0.18e-15
xinv_6_23 out_6_23 out2_6_23 vdd vss vdd vss inverter
//cPar_6_24 out_6_24 vss capacitor c=0.18e-15
xinv_6_24 out_6_24 out2_6_24 vdd vss vdd vss inverter
//cPar_6_25 out_6_25 vss capacitor c=0.18e-15
xinv_6_25 out_6_25 out2_6_25 vdd vss vdd vss inverter
//cPar_6_26 out_6_26 vss capacitor c=0.18e-15
xinv_6_26 out_6_26 out2_6_26 vdd vss vdd vss inverter
//cPar_6_27 out_6_27 vss capacitor c=0.18e-15
xinv_6_27 out_6_27 out2_6_27 vdd vss vdd vss inverter
//cPar_6_28 out_6_28 vss capacitor c=0.18e-15
xinv_6_28 out_6_28 out2_6_28 vdd vss vdd vss inverter
//cPar_6_29 out_6_29 vss capacitor c=0.18e-15
xinv_6_29 out_6_29 out2_6_29 vdd vss vdd vss inverter
//cPar_6_30 out_6_30 vss capacitor c=0.18e-15
xinv_6_30 out_6_30 out2_6_30 vdd vss vdd vss inverter
//cPar_6_31 out_6_31 vss capacitor c=0.18e-15
xinv_6_31 out_6_31 out2_6_31 vdd vss vdd vss inverter
//cPar_6_32 out_6_32 vss capacitor c=0.18e-15
xinv_6_32 out_6_32 out2_6_32 vdd vss vdd vss inverter
//cPar_6_33 out_6_33 vss capacitor c=0.18e-15
xinv_6_33 out_6_33 out2_6_33 vdd vss vdd vss inverter
//cPar_6_34 out_6_34 vss capacitor c=0.18e-15
xinv_6_34 out_6_34 out2_6_34 vdd vss vdd vss inverter
//cPar_6_35 out_6_35 vss capacitor c=0.18e-15
xinv_6_35 out_6_35 out2_6_35 vdd vss vdd vss inverter
//cPar_6_36 out_6_36 vss capacitor c=0.18e-15
xinv_6_36 out_6_36 out2_6_36 vdd vss vdd vss inverter
//cPar_6_37 out_6_37 vss capacitor c=0.18e-15
xinv_6_37 out_6_37 out2_6_37 vdd vss vdd vss inverter
//cPar_6_38 out_6_38 vss capacitor c=0.18e-15
xinv_6_38 out_6_38 out2_6_38 vdd vss vdd vss inverter
//cPar_6_39 out_6_39 vss capacitor c=0.18e-15
xinv_6_39 out_6_39 out2_6_39 vdd vss vdd vss inverter
//cPar_6_40 out_6_40 vss capacitor c=0.18e-15
xinv_6_40 out_6_40 out2_6_40 vdd vss vdd vss inverter
//cPar_6_41 out_6_41 vss capacitor c=0.18e-15
xinv_6_41 out_6_41 out2_6_41 vdd vss vdd vss inverter
//cPar_6_42 out_6_42 vss capacitor c=0.18e-15
xinv_6_42 out_6_42 out2_6_42 vdd vss vdd vss inverter
//cPar_6_43 out_6_43 vss capacitor c=0.18e-15
xinv_6_43 out_6_43 out2_6_43 vdd vss vdd vss inverter
//cPar_6_44 out_6_44 vss capacitor c=0.18e-15
xinv_6_44 out_6_44 out2_6_44 vdd vss vdd vss inverter
//cPar_6_45 out_6_45 vss capacitor c=0.18e-15
xinv_6_45 out_6_45 out2_6_45 vdd vss vdd vss inverter
//cPar_6_46 out_6_46 vss capacitor c=0.18e-15
xinv_6_46 out_6_46 out2_6_46 vdd vss vdd vss inverter
//cPar_6_47 out_6_47 vss capacitor c=0.18e-15
xinv_6_47 out_6_47 out2_6_47 vdd vss vdd vss inverter
//cPar_6_48 out_6_48 vss capacitor c=0.18e-15
xinv_6_48 out_6_48 out2_6_48 vdd vss vdd vss inverter
//cPar_6_49 out_6_49 vss capacitor c=0.18e-15
xinv_6_49 out_6_49 out2_6_49 vdd vss vdd vss inverter
//cPar_6_50 out_6_50 vss capacitor c=0.18e-15
xinv_6_50 out_6_50 out2_6_50 vdd vss vdd vss inverter
//cPar_6_51 out_6_51 vss capacitor c=0.18e-15
xinv_6_51 out_6_51 out2_6_51 vdd vss vdd vss inverter
//cPar_6_52 out_6_52 vss capacitor c=0.18e-15
xinv_6_52 out_6_52 out2_6_52 vdd vss vdd vss inverter
//cPar_6_53 out_6_53 vss capacitor c=0.18e-15
xinv_6_53 out_6_53 out2_6_53 vdd vss vdd vss inverter
//cPar_6_54 out_6_54 vss capacitor c=0.18e-15
xinv_6_54 out_6_54 out2_6_54 vdd vss vdd vss inverter
//cPar_6_55 out_6_55 vss capacitor c=0.18e-15
xinv_6_55 out_6_55 out2_6_55 vdd vss vdd vss inverter
//cPar_6_56 out_6_56 vss capacitor c=0.18e-15
xinv_6_56 out_6_56 out2_6_56 vdd vss vdd vss inverter
//cPar_6_57 out_6_57 vss capacitor c=0.18e-15
xinv_6_57 out_6_57 out2_6_57 vdd vss vdd vss inverter
//cPar_6_58 out_6_58 vss capacitor c=0.18e-15
xinv_6_58 out_6_58 out2_6_58 vdd vss vdd vss inverter
//cPar_6_59 out_6_59 vss capacitor c=0.18e-15
xinv_6_59 out_6_59 out2_6_59 vdd vss vdd vss inverter
//cPar_6_60 out_6_60 vss capacitor c=0.18e-15
xinv_6_60 out_6_60 out2_6_60 vdd vss vdd vss inverter
//cPar_6_61 out_6_61 vss capacitor c=0.18e-15
xinv_6_61 out_6_61 out2_6_61 vdd vss vdd vss inverter
//cPar_6_62 out_6_62 vss capacitor c=0.18e-15
xinv_6_62 out_6_62 out2_6_62 vdd vss vdd vss inverter
//cPar_6_63 out_6_63 vss capacitor c=0.18e-15
xinv_6_63 out_6_63 out2_6_63 vdd vss vdd vss inverter
save out_6_2
save out_6_2
save vvdd_6:p
vvdd_7 vdd_7 0 vsource type=dc dc=1
xdecoderseven (vss in vss vss vss vss vss  en out_7_0 out_7_1 out_7_2 out_7_3 out_7_4 out_7_5 out_7_6 out_7_7 out_7_8 out_7_9 out_7_10 out_7_11 out_7_12 out_7_13 out_7_14 out_7_15 out_7_16 out_7_17 out_7_18 out_7_19 out_7_20 out_7_21 out_7_22 out_7_23 out_7_24 out_7_25 out_7_26 out_7_27 out_7_28 out_7_29 out_7_30 out_7_31 out_7_32 out_7_33 out_7_34 out_7_35 out_7_36 out_7_37 out_7_38 out_7_39 out_7_40 out_7_41 out_7_42 out_7_43 out_7_44 out_7_45 out_7_46 out_7_47 out_7_48 out_7_49 out_7_50 out_7_51 out_7_52 out_7_53 out_7_54 out_7_55 out_7_56 out_7_57 out_7_58 out_7_59 out_7_60 out_7_61 out_7_62 out_7_63 out_7_64 out_7_65 out_7_66 out_7_67 out_7_68 out_7_69 out_7_70 out_7_71 out_7_72 out_7_73 out_7_74 out_7_75 out_7_76 out_7_77 out_7_78 out_7_79 out_7_80 out_7_81 out_7_82 out_7_83 out_7_84 out_7_85 out_7_86 out_7_87 out_7_88 out_7_89 out_7_90 out_7_91 out_7_92 out_7_93 out_7_94 out_7_95 out_7_96 out_7_97 out_7_98 out_7_99 out_7_100 out_7_101 out_7_102 out_7_103 out_7_104 out_7_105 out_7_106 out_7_107 out_7_108 out_7_109 out_7_110 out_7_111 out_7_112 out_7_113 out_7_114 out_7_115 out_7_116 out_7_117 out_7_118 out_7_119 out_7_120 out_7_121 out_7_122 out_7_123 out_7_124 out_7_125 out_7_126 out_7_127 vdd_7 vss vss vdd_7) decoderseven
//cPar_7_0 out_7_0 vss capacitor c=0.18e-15
xinv_7_0 out_7_0 out2_7_0 vdd vss vdd vss inverter
//cPar_7_1 out_7_1 vss capacitor c=0.18e-15
xinv_7_1 out_7_1 out2_7_1 vdd vss vdd vss inverter
//cPar_7_2 out_7_2 vss capacitor c=0.18e-15
xinv_7_2 out_7_2 out2_7_2 vdd vss vdd vss inverter
//cPar_7_3 out_7_3 vss capacitor c=0.18e-15
xinv_7_3 out_7_3 out2_7_3 vdd vss vdd vss inverter
//cPar_7_4 out_7_4 vss capacitor c=0.18e-15
xinv_7_4 out_7_4 out2_7_4 vdd vss vdd vss inverter
//cPar_7_5 out_7_5 vss capacitor c=0.18e-15
xinv_7_5 out_7_5 out2_7_5 vdd vss vdd vss inverter
//cPar_7_6 out_7_6 vss capacitor c=0.18e-15
xinv_7_6 out_7_6 out2_7_6 vdd vss vdd vss inverter
//cPar_7_7 out_7_7 vss capacitor c=0.18e-15
xinv_7_7 out_7_7 out2_7_7 vdd vss vdd vss inverter
//cPar_7_8 out_7_8 vss capacitor c=0.18e-15
xinv_7_8 out_7_8 out2_7_8 vdd vss vdd vss inverter
//cPar_7_9 out_7_9 vss capacitor c=0.18e-15
xinv_7_9 out_7_9 out2_7_9 vdd vss vdd vss inverter
//cPar_7_10 out_7_10 vss capacitor c=0.18e-15
xinv_7_10 out_7_10 out2_7_10 vdd vss vdd vss inverter
//cPar_7_11 out_7_11 vss capacitor c=0.18e-15
xinv_7_11 out_7_11 out2_7_11 vdd vss vdd vss inverter
//cPar_7_12 out_7_12 vss capacitor c=0.18e-15
xinv_7_12 out_7_12 out2_7_12 vdd vss vdd vss inverter
//cPar_7_13 out_7_13 vss capacitor c=0.18e-15
xinv_7_13 out_7_13 out2_7_13 vdd vss vdd vss inverter
//cPar_7_14 out_7_14 vss capacitor c=0.18e-15
xinv_7_14 out_7_14 out2_7_14 vdd vss vdd vss inverter
//cPar_7_15 out_7_15 vss capacitor c=0.18e-15
xinv_7_15 out_7_15 out2_7_15 vdd vss vdd vss inverter
//cPar_7_16 out_7_16 vss capacitor c=0.18e-15
xinv_7_16 out_7_16 out2_7_16 vdd vss vdd vss inverter
//cPar_7_17 out_7_17 vss capacitor c=0.18e-15
xinv_7_17 out_7_17 out2_7_17 vdd vss vdd vss inverter
//cPar_7_18 out_7_18 vss capacitor c=0.18e-15
xinv_7_18 out_7_18 out2_7_18 vdd vss vdd vss inverter
//cPar_7_19 out_7_19 vss capacitor c=0.18e-15
xinv_7_19 out_7_19 out2_7_19 vdd vss vdd vss inverter
//cPar_7_20 out_7_20 vss capacitor c=0.18e-15
xinv_7_20 out_7_20 out2_7_20 vdd vss vdd vss inverter
//cPar_7_21 out_7_21 vss capacitor c=0.18e-15
xinv_7_21 out_7_21 out2_7_21 vdd vss vdd vss inverter
//cPar_7_22 out_7_22 vss capacitor c=0.18e-15
xinv_7_22 out_7_22 out2_7_22 vdd vss vdd vss inverter
//cPar_7_23 out_7_23 vss capacitor c=0.18e-15
xinv_7_23 out_7_23 out2_7_23 vdd vss vdd vss inverter
//cPar_7_24 out_7_24 vss capacitor c=0.18e-15
xinv_7_24 out_7_24 out2_7_24 vdd vss vdd vss inverter
//cPar_7_25 out_7_25 vss capacitor c=0.18e-15
xinv_7_25 out_7_25 out2_7_25 vdd vss vdd vss inverter
//cPar_7_26 out_7_26 vss capacitor c=0.18e-15
xinv_7_26 out_7_26 out2_7_26 vdd vss vdd vss inverter
//cPar_7_27 out_7_27 vss capacitor c=0.18e-15
xinv_7_27 out_7_27 out2_7_27 vdd vss vdd vss inverter
//cPar_7_28 out_7_28 vss capacitor c=0.18e-15
xinv_7_28 out_7_28 out2_7_28 vdd vss vdd vss inverter
//cPar_7_29 out_7_29 vss capacitor c=0.18e-15
xinv_7_29 out_7_29 out2_7_29 vdd vss vdd vss inverter
//cPar_7_30 out_7_30 vss capacitor c=0.18e-15
xinv_7_30 out_7_30 out2_7_30 vdd vss vdd vss inverter
//cPar_7_31 out_7_31 vss capacitor c=0.18e-15
xinv_7_31 out_7_31 out2_7_31 vdd vss vdd vss inverter
//cPar_7_32 out_7_32 vss capacitor c=0.18e-15
xinv_7_32 out_7_32 out2_7_32 vdd vss vdd vss inverter
//cPar_7_33 out_7_33 vss capacitor c=0.18e-15
xinv_7_33 out_7_33 out2_7_33 vdd vss vdd vss inverter
//cPar_7_34 out_7_34 vss capacitor c=0.18e-15
xinv_7_34 out_7_34 out2_7_34 vdd vss vdd vss inverter
//cPar_7_35 out_7_35 vss capacitor c=0.18e-15
xinv_7_35 out_7_35 out2_7_35 vdd vss vdd vss inverter
//cPar_7_36 out_7_36 vss capacitor c=0.18e-15
xinv_7_36 out_7_36 out2_7_36 vdd vss vdd vss inverter
//cPar_7_37 out_7_37 vss capacitor c=0.18e-15
xinv_7_37 out_7_37 out2_7_37 vdd vss vdd vss inverter
//cPar_7_38 out_7_38 vss capacitor c=0.18e-15
xinv_7_38 out_7_38 out2_7_38 vdd vss vdd vss inverter
//cPar_7_39 out_7_39 vss capacitor c=0.18e-15
xinv_7_39 out_7_39 out2_7_39 vdd vss vdd vss inverter
//cPar_7_40 out_7_40 vss capacitor c=0.18e-15
xinv_7_40 out_7_40 out2_7_40 vdd vss vdd vss inverter
//cPar_7_41 out_7_41 vss capacitor c=0.18e-15
xinv_7_41 out_7_41 out2_7_41 vdd vss vdd vss inverter
//cPar_7_42 out_7_42 vss capacitor c=0.18e-15
xinv_7_42 out_7_42 out2_7_42 vdd vss vdd vss inverter
//cPar_7_43 out_7_43 vss capacitor c=0.18e-15
xinv_7_43 out_7_43 out2_7_43 vdd vss vdd vss inverter
//cPar_7_44 out_7_44 vss capacitor c=0.18e-15
xinv_7_44 out_7_44 out2_7_44 vdd vss vdd vss inverter
//cPar_7_45 out_7_45 vss capacitor c=0.18e-15
xinv_7_45 out_7_45 out2_7_45 vdd vss vdd vss inverter
//cPar_7_46 out_7_46 vss capacitor c=0.18e-15
xinv_7_46 out_7_46 out2_7_46 vdd vss vdd vss inverter
//cPar_7_47 out_7_47 vss capacitor c=0.18e-15
xinv_7_47 out_7_47 out2_7_47 vdd vss vdd vss inverter
//cPar_7_48 out_7_48 vss capacitor c=0.18e-15
xinv_7_48 out_7_48 out2_7_48 vdd vss vdd vss inverter
//cPar_7_49 out_7_49 vss capacitor c=0.18e-15
xinv_7_49 out_7_49 out2_7_49 vdd vss vdd vss inverter
//cPar_7_50 out_7_50 vss capacitor c=0.18e-15
xinv_7_50 out_7_50 out2_7_50 vdd vss vdd vss inverter
//cPar_7_51 out_7_51 vss capacitor c=0.18e-15
xinv_7_51 out_7_51 out2_7_51 vdd vss vdd vss inverter
//cPar_7_52 out_7_52 vss capacitor c=0.18e-15
xinv_7_52 out_7_52 out2_7_52 vdd vss vdd vss inverter
//cPar_7_53 out_7_53 vss capacitor c=0.18e-15
xinv_7_53 out_7_53 out2_7_53 vdd vss vdd vss inverter
//cPar_7_54 out_7_54 vss capacitor c=0.18e-15
xinv_7_54 out_7_54 out2_7_54 vdd vss vdd vss inverter
//cPar_7_55 out_7_55 vss capacitor c=0.18e-15
xinv_7_55 out_7_55 out2_7_55 vdd vss vdd vss inverter
//cPar_7_56 out_7_56 vss capacitor c=0.18e-15
xinv_7_56 out_7_56 out2_7_56 vdd vss vdd vss inverter
//cPar_7_57 out_7_57 vss capacitor c=0.18e-15
xinv_7_57 out_7_57 out2_7_57 vdd vss vdd vss inverter
//cPar_7_58 out_7_58 vss capacitor c=0.18e-15
xinv_7_58 out_7_58 out2_7_58 vdd vss vdd vss inverter
//cPar_7_59 out_7_59 vss capacitor c=0.18e-15
xinv_7_59 out_7_59 out2_7_59 vdd vss vdd vss inverter
//cPar_7_60 out_7_60 vss capacitor c=0.18e-15
xinv_7_60 out_7_60 out2_7_60 vdd vss vdd vss inverter
//cPar_7_61 out_7_61 vss capacitor c=0.18e-15
xinv_7_61 out_7_61 out2_7_61 vdd vss vdd vss inverter
//cPar_7_62 out_7_62 vss capacitor c=0.18e-15
xinv_7_62 out_7_62 out2_7_62 vdd vss vdd vss inverter
//cPar_7_63 out_7_63 vss capacitor c=0.18e-15
xinv_7_63 out_7_63 out2_7_63 vdd vss vdd vss inverter
//cPar_7_64 out_7_64 vss capacitor c=0.18e-15
xinv_7_64 out_7_64 out2_7_64 vdd vss vdd vss inverter
//cPar_7_65 out_7_65 vss capacitor c=0.18e-15
xinv_7_65 out_7_65 out2_7_65 vdd vss vdd vss inverter
//cPar_7_66 out_7_66 vss capacitor c=0.18e-15
xinv_7_66 out_7_66 out2_7_66 vdd vss vdd vss inverter
//cPar_7_67 out_7_67 vss capacitor c=0.18e-15
xinv_7_67 out_7_67 out2_7_67 vdd vss vdd vss inverter
//cPar_7_68 out_7_68 vss capacitor c=0.18e-15
xinv_7_68 out_7_68 out2_7_68 vdd vss vdd vss inverter
//cPar_7_69 out_7_69 vss capacitor c=0.18e-15
xinv_7_69 out_7_69 out2_7_69 vdd vss vdd vss inverter
//cPar_7_70 out_7_70 vss capacitor c=0.18e-15
xinv_7_70 out_7_70 out2_7_70 vdd vss vdd vss inverter
//cPar_7_71 out_7_71 vss capacitor c=0.18e-15
xinv_7_71 out_7_71 out2_7_71 vdd vss vdd vss inverter
//cPar_7_72 out_7_72 vss capacitor c=0.18e-15
xinv_7_72 out_7_72 out2_7_72 vdd vss vdd vss inverter
//cPar_7_73 out_7_73 vss capacitor c=0.18e-15
xinv_7_73 out_7_73 out2_7_73 vdd vss vdd vss inverter
//cPar_7_74 out_7_74 vss capacitor c=0.18e-15
xinv_7_74 out_7_74 out2_7_74 vdd vss vdd vss inverter
//cPar_7_75 out_7_75 vss capacitor c=0.18e-15
xinv_7_75 out_7_75 out2_7_75 vdd vss vdd vss inverter
//cPar_7_76 out_7_76 vss capacitor c=0.18e-15
xinv_7_76 out_7_76 out2_7_76 vdd vss vdd vss inverter
//cPar_7_77 out_7_77 vss capacitor c=0.18e-15
xinv_7_77 out_7_77 out2_7_77 vdd vss vdd vss inverter
//cPar_7_78 out_7_78 vss capacitor c=0.18e-15
xinv_7_78 out_7_78 out2_7_78 vdd vss vdd vss inverter
//cPar_7_79 out_7_79 vss capacitor c=0.18e-15
xinv_7_79 out_7_79 out2_7_79 vdd vss vdd vss inverter
//cPar_7_80 out_7_80 vss capacitor c=0.18e-15
xinv_7_80 out_7_80 out2_7_80 vdd vss vdd vss inverter
//cPar_7_81 out_7_81 vss capacitor c=0.18e-15
xinv_7_81 out_7_81 out2_7_81 vdd vss vdd vss inverter
//cPar_7_82 out_7_82 vss capacitor c=0.18e-15
xinv_7_82 out_7_82 out2_7_82 vdd vss vdd vss inverter
//cPar_7_83 out_7_83 vss capacitor c=0.18e-15
xinv_7_83 out_7_83 out2_7_83 vdd vss vdd vss inverter
//cPar_7_84 out_7_84 vss capacitor c=0.18e-15
xinv_7_84 out_7_84 out2_7_84 vdd vss vdd vss inverter
//cPar_7_85 out_7_85 vss capacitor c=0.18e-15
xinv_7_85 out_7_85 out2_7_85 vdd vss vdd vss inverter
//cPar_7_86 out_7_86 vss capacitor c=0.18e-15
xinv_7_86 out_7_86 out2_7_86 vdd vss vdd vss inverter
//cPar_7_87 out_7_87 vss capacitor c=0.18e-15
xinv_7_87 out_7_87 out2_7_87 vdd vss vdd vss inverter
//cPar_7_88 out_7_88 vss capacitor c=0.18e-15
xinv_7_88 out_7_88 out2_7_88 vdd vss vdd vss inverter
//cPar_7_89 out_7_89 vss capacitor c=0.18e-15
xinv_7_89 out_7_89 out2_7_89 vdd vss vdd vss inverter
//cPar_7_90 out_7_90 vss capacitor c=0.18e-15
xinv_7_90 out_7_90 out2_7_90 vdd vss vdd vss inverter
//cPar_7_91 out_7_91 vss capacitor c=0.18e-15
xinv_7_91 out_7_91 out2_7_91 vdd vss vdd vss inverter
//cPar_7_92 out_7_92 vss capacitor c=0.18e-15
xinv_7_92 out_7_92 out2_7_92 vdd vss vdd vss inverter
//cPar_7_93 out_7_93 vss capacitor c=0.18e-15
xinv_7_93 out_7_93 out2_7_93 vdd vss vdd vss inverter
//cPar_7_94 out_7_94 vss capacitor c=0.18e-15
xinv_7_94 out_7_94 out2_7_94 vdd vss vdd vss inverter
//cPar_7_95 out_7_95 vss capacitor c=0.18e-15
xinv_7_95 out_7_95 out2_7_95 vdd vss vdd vss inverter
//cPar_7_96 out_7_96 vss capacitor c=0.18e-15
xinv_7_96 out_7_96 out2_7_96 vdd vss vdd vss inverter
//cPar_7_97 out_7_97 vss capacitor c=0.18e-15
xinv_7_97 out_7_97 out2_7_97 vdd vss vdd vss inverter
//cPar_7_98 out_7_98 vss capacitor c=0.18e-15
xinv_7_98 out_7_98 out2_7_98 vdd vss vdd vss inverter
//cPar_7_99 out_7_99 vss capacitor c=0.18e-15
xinv_7_99 out_7_99 out2_7_99 vdd vss vdd vss inverter
//cPar_7_100 out_7_100 vss capacitor c=0.18e-15
xinv_7_100 out_7_100 out2_7_100 vdd vss vdd vss inverter
//cPar_7_101 out_7_101 vss capacitor c=0.18e-15
xinv_7_101 out_7_101 out2_7_101 vdd vss vdd vss inverter
//cPar_7_102 out_7_102 vss capacitor c=0.18e-15
xinv_7_102 out_7_102 out2_7_102 vdd vss vdd vss inverter
//cPar_7_103 out_7_103 vss capacitor c=0.18e-15
xinv_7_103 out_7_103 out2_7_103 vdd vss vdd vss inverter
//cPar_7_104 out_7_104 vss capacitor c=0.18e-15
xinv_7_104 out_7_104 out2_7_104 vdd vss vdd vss inverter
//cPar_7_105 out_7_105 vss capacitor c=0.18e-15
xinv_7_105 out_7_105 out2_7_105 vdd vss vdd vss inverter
//cPar_7_106 out_7_106 vss capacitor c=0.18e-15
xinv_7_106 out_7_106 out2_7_106 vdd vss vdd vss inverter
//cPar_7_107 out_7_107 vss capacitor c=0.18e-15
xinv_7_107 out_7_107 out2_7_107 vdd vss vdd vss inverter
//cPar_7_108 out_7_108 vss capacitor c=0.18e-15
xinv_7_108 out_7_108 out2_7_108 vdd vss vdd vss inverter
//cPar_7_109 out_7_109 vss capacitor c=0.18e-15
xinv_7_109 out_7_109 out2_7_109 vdd vss vdd vss inverter
//cPar_7_110 out_7_110 vss capacitor c=0.18e-15
xinv_7_110 out_7_110 out2_7_110 vdd vss vdd vss inverter
//cPar_7_111 out_7_111 vss capacitor c=0.18e-15
xinv_7_111 out_7_111 out2_7_111 vdd vss vdd vss inverter
//cPar_7_112 out_7_112 vss capacitor c=0.18e-15
xinv_7_112 out_7_112 out2_7_112 vdd vss vdd vss inverter
//cPar_7_113 out_7_113 vss capacitor c=0.18e-15
xinv_7_113 out_7_113 out2_7_113 vdd vss vdd vss inverter
//cPar_7_114 out_7_114 vss capacitor c=0.18e-15
xinv_7_114 out_7_114 out2_7_114 vdd vss vdd vss inverter
//cPar_7_115 out_7_115 vss capacitor c=0.18e-15
xinv_7_115 out_7_115 out2_7_115 vdd vss vdd vss inverter
//cPar_7_116 out_7_116 vss capacitor c=0.18e-15
xinv_7_116 out_7_116 out2_7_116 vdd vss vdd vss inverter
//cPar_7_117 out_7_117 vss capacitor c=0.18e-15
xinv_7_117 out_7_117 out2_7_117 vdd vss vdd vss inverter
//cPar_7_118 out_7_118 vss capacitor c=0.18e-15
xinv_7_118 out_7_118 out2_7_118 vdd vss vdd vss inverter
//cPar_7_119 out_7_119 vss capacitor c=0.18e-15
xinv_7_119 out_7_119 out2_7_119 vdd vss vdd vss inverter
//cPar_7_120 out_7_120 vss capacitor c=0.18e-15
xinv_7_120 out_7_120 out2_7_120 vdd vss vdd vss inverter
//cPar_7_121 out_7_121 vss capacitor c=0.18e-15
xinv_7_121 out_7_121 out2_7_121 vdd vss vdd vss inverter
//cPar_7_122 out_7_122 vss capacitor c=0.18e-15
xinv_7_122 out_7_122 out2_7_122 vdd vss vdd vss inverter
//cPar_7_123 out_7_123 vss capacitor c=0.18e-15
xinv_7_123 out_7_123 out2_7_123 vdd vss vdd vss inverter
//cPar_7_124 out_7_124 vss capacitor c=0.18e-15
xinv_7_124 out_7_124 out2_7_124 vdd vss vdd vss inverter
//cPar_7_125 out_7_125 vss capacitor c=0.18e-15
xinv_7_125 out_7_125 out2_7_125 vdd vss vdd vss inverter
//cPar_7_126 out_7_126 vss capacitor c=0.18e-15
xinv_7_126 out_7_126 out2_7_126 vdd vss vdd vss inverter
//cPar_7_127 out_7_127 vss capacitor c=0.18e-15
xinv_7_127 out_7_127 out2_7_127 vdd vss vdd vss inverter
save out_7_2
save out_7_2
save vvdd_7:p
vvdd_8 vdd_8 0 vsource type=dc dc=1
xdecodereight (vss in vss vss vss vss vss vss  en out_8_0 out_8_1 out_8_2 out_8_3 out_8_4 out_8_5 out_8_6 out_8_7 out_8_8 out_8_9 out_8_10 out_8_11 out_8_12 out_8_13 out_8_14 out_8_15 out_8_16 out_8_17 out_8_18 out_8_19 out_8_20 out_8_21 out_8_22 out_8_23 out_8_24 out_8_25 out_8_26 out_8_27 out_8_28 out_8_29 out_8_30 out_8_31 out_8_32 out_8_33 out_8_34 out_8_35 out_8_36 out_8_37 out_8_38 out_8_39 out_8_40 out_8_41 out_8_42 out_8_43 out_8_44 out_8_45 out_8_46 out_8_47 out_8_48 out_8_49 out_8_50 out_8_51 out_8_52 out_8_53 out_8_54 out_8_55 out_8_56 out_8_57 out_8_58 out_8_59 out_8_60 out_8_61 out_8_62 out_8_63 out_8_64 out_8_65 out_8_66 out_8_67 out_8_68 out_8_69 out_8_70 out_8_71 out_8_72 out_8_73 out_8_74 out_8_75 out_8_76 out_8_77 out_8_78 out_8_79 out_8_80 out_8_81 out_8_82 out_8_83 out_8_84 out_8_85 out_8_86 out_8_87 out_8_88 out_8_89 out_8_90 out_8_91 out_8_92 out_8_93 out_8_94 out_8_95 out_8_96 out_8_97 out_8_98 out_8_99 out_8_100 out_8_101 out_8_102 out_8_103 out_8_104 out_8_105 out_8_106 out_8_107 out_8_108 out_8_109 out_8_110 out_8_111 out_8_112 out_8_113 out_8_114 out_8_115 out_8_116 out_8_117 out_8_118 out_8_119 out_8_120 out_8_121 out_8_122 out_8_123 out_8_124 out_8_125 out_8_126 out_8_127 out_8_128 out_8_129 out_8_130 out_8_131 out_8_132 out_8_133 out_8_134 out_8_135 out_8_136 out_8_137 out_8_138 out_8_139 out_8_140 out_8_141 out_8_142 out_8_143 out_8_144 out_8_145 out_8_146 out_8_147 out_8_148 out_8_149 out_8_150 out_8_151 out_8_152 out_8_153 out_8_154 out_8_155 out_8_156 out_8_157 out_8_158 out_8_159 out_8_160 out_8_161 out_8_162 out_8_163 out_8_164 out_8_165 out_8_166 out_8_167 out_8_168 out_8_169 out_8_170 out_8_171 out_8_172 out_8_173 out_8_174 out_8_175 out_8_176 out_8_177 out_8_178 out_8_179 out_8_180 out_8_181 out_8_182 out_8_183 out_8_184 out_8_185 out_8_186 out_8_187 out_8_188 out_8_189 out_8_190 out_8_191 out_8_192 out_8_193 out_8_194 out_8_195 out_8_196 out_8_197 out_8_198 out_8_199 out_8_200 out_8_201 out_8_202 out_8_203 out_8_204 out_8_205 out_8_206 out_8_207 out_8_208 out_8_209 out_8_210 out_8_211 out_8_212 out_8_213 out_8_214 out_8_215 out_8_216 out_8_217 out_8_218 out_8_219 out_8_220 out_8_221 out_8_222 out_8_223 out_8_224 out_8_225 out_8_226 out_8_227 out_8_228 out_8_229 out_8_230 out_8_231 out_8_232 out_8_233 out_8_234 out_8_235 out_8_236 out_8_237 out_8_238 out_8_239 out_8_240 out_8_241 out_8_242 out_8_243 out_8_244 out_8_245 out_8_246 out_8_247 out_8_248 out_8_249 out_8_250 out_8_251 out_8_252 out_8_253 out_8_254 out_8_255 vdd_8 vss vss vdd_8) decodereight
//cPar_8_0 out_8_0 vss capacitor c=0.18e-15
xinv_8_0 out_8_0 out2_8_0 vdd vss vdd vss inverter
//cPar_8_1 out_8_1 vss capacitor c=0.18e-15
xinv_8_1 out_8_1 out2_8_1 vdd vss vdd vss inverter
//cPar_8_2 out_8_2 vss capacitor c=0.18e-15
xinv_8_2 out_8_2 out2_8_2 vdd vss vdd vss inverter
//cPar_8_3 out_8_3 vss capacitor c=0.18e-15
xinv_8_3 out_8_3 out2_8_3 vdd vss vdd vss inverter
//cPar_8_4 out_8_4 vss capacitor c=0.18e-15
xinv_8_4 out_8_4 out2_8_4 vdd vss vdd vss inverter
//cPar_8_5 out_8_5 vss capacitor c=0.18e-15
xinv_8_5 out_8_5 out2_8_5 vdd vss vdd vss inverter
//cPar_8_6 out_8_6 vss capacitor c=0.18e-15
xinv_8_6 out_8_6 out2_8_6 vdd vss vdd vss inverter
//cPar_8_7 out_8_7 vss capacitor c=0.18e-15
xinv_8_7 out_8_7 out2_8_7 vdd vss vdd vss inverter
//cPar_8_8 out_8_8 vss capacitor c=0.18e-15
xinv_8_8 out_8_8 out2_8_8 vdd vss vdd vss inverter
//cPar_8_9 out_8_9 vss capacitor c=0.18e-15
xinv_8_9 out_8_9 out2_8_9 vdd vss vdd vss inverter
//cPar_8_10 out_8_10 vss capacitor c=0.18e-15
xinv_8_10 out_8_10 out2_8_10 vdd vss vdd vss inverter
//cPar_8_11 out_8_11 vss capacitor c=0.18e-15
xinv_8_11 out_8_11 out2_8_11 vdd vss vdd vss inverter
//cPar_8_12 out_8_12 vss capacitor c=0.18e-15
xinv_8_12 out_8_12 out2_8_12 vdd vss vdd vss inverter
//cPar_8_13 out_8_13 vss capacitor c=0.18e-15
xinv_8_13 out_8_13 out2_8_13 vdd vss vdd vss inverter
//cPar_8_14 out_8_14 vss capacitor c=0.18e-15
xinv_8_14 out_8_14 out2_8_14 vdd vss vdd vss inverter
//cPar_8_15 out_8_15 vss capacitor c=0.18e-15
xinv_8_15 out_8_15 out2_8_15 vdd vss vdd vss inverter
//cPar_8_16 out_8_16 vss capacitor c=0.18e-15
xinv_8_16 out_8_16 out2_8_16 vdd vss vdd vss inverter
//cPar_8_17 out_8_17 vss capacitor c=0.18e-15
xinv_8_17 out_8_17 out2_8_17 vdd vss vdd vss inverter
//cPar_8_18 out_8_18 vss capacitor c=0.18e-15
xinv_8_18 out_8_18 out2_8_18 vdd vss vdd vss inverter
//cPar_8_19 out_8_19 vss capacitor c=0.18e-15
xinv_8_19 out_8_19 out2_8_19 vdd vss vdd vss inverter
//cPar_8_20 out_8_20 vss capacitor c=0.18e-15
xinv_8_20 out_8_20 out2_8_20 vdd vss vdd vss inverter
//cPar_8_21 out_8_21 vss capacitor c=0.18e-15
xinv_8_21 out_8_21 out2_8_21 vdd vss vdd vss inverter
//cPar_8_22 out_8_22 vss capacitor c=0.18e-15
xinv_8_22 out_8_22 out2_8_22 vdd vss vdd vss inverter
//cPar_8_23 out_8_23 vss capacitor c=0.18e-15
xinv_8_23 out_8_23 out2_8_23 vdd vss vdd vss inverter
//cPar_8_24 out_8_24 vss capacitor c=0.18e-15
xinv_8_24 out_8_24 out2_8_24 vdd vss vdd vss inverter
//cPar_8_25 out_8_25 vss capacitor c=0.18e-15
xinv_8_25 out_8_25 out2_8_25 vdd vss vdd vss inverter
//cPar_8_26 out_8_26 vss capacitor c=0.18e-15
xinv_8_26 out_8_26 out2_8_26 vdd vss vdd vss inverter
//cPar_8_27 out_8_27 vss capacitor c=0.18e-15
xinv_8_27 out_8_27 out2_8_27 vdd vss vdd vss inverter
//cPar_8_28 out_8_28 vss capacitor c=0.18e-15
xinv_8_28 out_8_28 out2_8_28 vdd vss vdd vss inverter
//cPar_8_29 out_8_29 vss capacitor c=0.18e-15
xinv_8_29 out_8_29 out2_8_29 vdd vss vdd vss inverter
//cPar_8_30 out_8_30 vss capacitor c=0.18e-15
xinv_8_30 out_8_30 out2_8_30 vdd vss vdd vss inverter
//cPar_8_31 out_8_31 vss capacitor c=0.18e-15
xinv_8_31 out_8_31 out2_8_31 vdd vss vdd vss inverter
//cPar_8_32 out_8_32 vss capacitor c=0.18e-15
xinv_8_32 out_8_32 out2_8_32 vdd vss vdd vss inverter
//cPar_8_33 out_8_33 vss capacitor c=0.18e-15
xinv_8_33 out_8_33 out2_8_33 vdd vss vdd vss inverter
//cPar_8_34 out_8_34 vss capacitor c=0.18e-15
xinv_8_34 out_8_34 out2_8_34 vdd vss vdd vss inverter
//cPar_8_35 out_8_35 vss capacitor c=0.18e-15
xinv_8_35 out_8_35 out2_8_35 vdd vss vdd vss inverter
//cPar_8_36 out_8_36 vss capacitor c=0.18e-15
xinv_8_36 out_8_36 out2_8_36 vdd vss vdd vss inverter
//cPar_8_37 out_8_37 vss capacitor c=0.18e-15
xinv_8_37 out_8_37 out2_8_37 vdd vss vdd vss inverter
//cPar_8_38 out_8_38 vss capacitor c=0.18e-15
xinv_8_38 out_8_38 out2_8_38 vdd vss vdd vss inverter
//cPar_8_39 out_8_39 vss capacitor c=0.18e-15
xinv_8_39 out_8_39 out2_8_39 vdd vss vdd vss inverter
//cPar_8_40 out_8_40 vss capacitor c=0.18e-15
xinv_8_40 out_8_40 out2_8_40 vdd vss vdd vss inverter
//cPar_8_41 out_8_41 vss capacitor c=0.18e-15
xinv_8_41 out_8_41 out2_8_41 vdd vss vdd vss inverter
//cPar_8_42 out_8_42 vss capacitor c=0.18e-15
xinv_8_42 out_8_42 out2_8_42 vdd vss vdd vss inverter
//cPar_8_43 out_8_43 vss capacitor c=0.18e-15
xinv_8_43 out_8_43 out2_8_43 vdd vss vdd vss inverter
//cPar_8_44 out_8_44 vss capacitor c=0.18e-15
xinv_8_44 out_8_44 out2_8_44 vdd vss vdd vss inverter
//cPar_8_45 out_8_45 vss capacitor c=0.18e-15
xinv_8_45 out_8_45 out2_8_45 vdd vss vdd vss inverter
//cPar_8_46 out_8_46 vss capacitor c=0.18e-15
xinv_8_46 out_8_46 out2_8_46 vdd vss vdd vss inverter
//cPar_8_47 out_8_47 vss capacitor c=0.18e-15
xinv_8_47 out_8_47 out2_8_47 vdd vss vdd vss inverter
//cPar_8_48 out_8_48 vss capacitor c=0.18e-15
xinv_8_48 out_8_48 out2_8_48 vdd vss vdd vss inverter
//cPar_8_49 out_8_49 vss capacitor c=0.18e-15
xinv_8_49 out_8_49 out2_8_49 vdd vss vdd vss inverter
//cPar_8_50 out_8_50 vss capacitor c=0.18e-15
xinv_8_50 out_8_50 out2_8_50 vdd vss vdd vss inverter
//cPar_8_51 out_8_51 vss capacitor c=0.18e-15
xinv_8_51 out_8_51 out2_8_51 vdd vss vdd vss inverter
//cPar_8_52 out_8_52 vss capacitor c=0.18e-15
xinv_8_52 out_8_52 out2_8_52 vdd vss vdd vss inverter
//cPar_8_53 out_8_53 vss capacitor c=0.18e-15
xinv_8_53 out_8_53 out2_8_53 vdd vss vdd vss inverter
//cPar_8_54 out_8_54 vss capacitor c=0.18e-15
xinv_8_54 out_8_54 out2_8_54 vdd vss vdd vss inverter
//cPar_8_55 out_8_55 vss capacitor c=0.18e-15
xinv_8_55 out_8_55 out2_8_55 vdd vss vdd vss inverter
//cPar_8_56 out_8_56 vss capacitor c=0.18e-15
xinv_8_56 out_8_56 out2_8_56 vdd vss vdd vss inverter
//cPar_8_57 out_8_57 vss capacitor c=0.18e-15
xinv_8_57 out_8_57 out2_8_57 vdd vss vdd vss inverter
//cPar_8_58 out_8_58 vss capacitor c=0.18e-15
xinv_8_58 out_8_58 out2_8_58 vdd vss vdd vss inverter
//cPar_8_59 out_8_59 vss capacitor c=0.18e-15
xinv_8_59 out_8_59 out2_8_59 vdd vss vdd vss inverter
//cPar_8_60 out_8_60 vss capacitor c=0.18e-15
xinv_8_60 out_8_60 out2_8_60 vdd vss vdd vss inverter
//cPar_8_61 out_8_61 vss capacitor c=0.18e-15
xinv_8_61 out_8_61 out2_8_61 vdd vss vdd vss inverter
//cPar_8_62 out_8_62 vss capacitor c=0.18e-15
xinv_8_62 out_8_62 out2_8_62 vdd vss vdd vss inverter
//cPar_8_63 out_8_63 vss capacitor c=0.18e-15
xinv_8_63 out_8_63 out2_8_63 vdd vss vdd vss inverter
//cPar_8_64 out_8_64 vss capacitor c=0.18e-15
xinv_8_64 out_8_64 out2_8_64 vdd vss vdd vss inverter
//cPar_8_65 out_8_65 vss capacitor c=0.18e-15
xinv_8_65 out_8_65 out2_8_65 vdd vss vdd vss inverter
//cPar_8_66 out_8_66 vss capacitor c=0.18e-15
xinv_8_66 out_8_66 out2_8_66 vdd vss vdd vss inverter
//cPar_8_67 out_8_67 vss capacitor c=0.18e-15
xinv_8_67 out_8_67 out2_8_67 vdd vss vdd vss inverter
//cPar_8_68 out_8_68 vss capacitor c=0.18e-15
xinv_8_68 out_8_68 out2_8_68 vdd vss vdd vss inverter
//cPar_8_69 out_8_69 vss capacitor c=0.18e-15
xinv_8_69 out_8_69 out2_8_69 vdd vss vdd vss inverter
//cPar_8_70 out_8_70 vss capacitor c=0.18e-15
xinv_8_70 out_8_70 out2_8_70 vdd vss vdd vss inverter
//cPar_8_71 out_8_71 vss capacitor c=0.18e-15
xinv_8_71 out_8_71 out2_8_71 vdd vss vdd vss inverter
//cPar_8_72 out_8_72 vss capacitor c=0.18e-15
xinv_8_72 out_8_72 out2_8_72 vdd vss vdd vss inverter
//cPar_8_73 out_8_73 vss capacitor c=0.18e-15
xinv_8_73 out_8_73 out2_8_73 vdd vss vdd vss inverter
//cPar_8_74 out_8_74 vss capacitor c=0.18e-15
xinv_8_74 out_8_74 out2_8_74 vdd vss vdd vss inverter
//cPar_8_75 out_8_75 vss capacitor c=0.18e-15
xinv_8_75 out_8_75 out2_8_75 vdd vss vdd vss inverter
//cPar_8_76 out_8_76 vss capacitor c=0.18e-15
xinv_8_76 out_8_76 out2_8_76 vdd vss vdd vss inverter
//cPar_8_77 out_8_77 vss capacitor c=0.18e-15
xinv_8_77 out_8_77 out2_8_77 vdd vss vdd vss inverter
//cPar_8_78 out_8_78 vss capacitor c=0.18e-15
xinv_8_78 out_8_78 out2_8_78 vdd vss vdd vss inverter
//cPar_8_79 out_8_79 vss capacitor c=0.18e-15
xinv_8_79 out_8_79 out2_8_79 vdd vss vdd vss inverter
//cPar_8_80 out_8_80 vss capacitor c=0.18e-15
xinv_8_80 out_8_80 out2_8_80 vdd vss vdd vss inverter
//cPar_8_81 out_8_81 vss capacitor c=0.18e-15
xinv_8_81 out_8_81 out2_8_81 vdd vss vdd vss inverter
//cPar_8_82 out_8_82 vss capacitor c=0.18e-15
xinv_8_82 out_8_82 out2_8_82 vdd vss vdd vss inverter
//cPar_8_83 out_8_83 vss capacitor c=0.18e-15
xinv_8_83 out_8_83 out2_8_83 vdd vss vdd vss inverter
//cPar_8_84 out_8_84 vss capacitor c=0.18e-15
xinv_8_84 out_8_84 out2_8_84 vdd vss vdd vss inverter
//cPar_8_85 out_8_85 vss capacitor c=0.18e-15
xinv_8_85 out_8_85 out2_8_85 vdd vss vdd vss inverter
//cPar_8_86 out_8_86 vss capacitor c=0.18e-15
xinv_8_86 out_8_86 out2_8_86 vdd vss vdd vss inverter
//cPar_8_87 out_8_87 vss capacitor c=0.18e-15
xinv_8_87 out_8_87 out2_8_87 vdd vss vdd vss inverter
//cPar_8_88 out_8_88 vss capacitor c=0.18e-15
xinv_8_88 out_8_88 out2_8_88 vdd vss vdd vss inverter
//cPar_8_89 out_8_89 vss capacitor c=0.18e-15
xinv_8_89 out_8_89 out2_8_89 vdd vss vdd vss inverter
//cPar_8_90 out_8_90 vss capacitor c=0.18e-15
xinv_8_90 out_8_90 out2_8_90 vdd vss vdd vss inverter
//cPar_8_91 out_8_91 vss capacitor c=0.18e-15
xinv_8_91 out_8_91 out2_8_91 vdd vss vdd vss inverter
//cPar_8_92 out_8_92 vss capacitor c=0.18e-15
xinv_8_92 out_8_92 out2_8_92 vdd vss vdd vss inverter
//cPar_8_93 out_8_93 vss capacitor c=0.18e-15
xinv_8_93 out_8_93 out2_8_93 vdd vss vdd vss inverter
//cPar_8_94 out_8_94 vss capacitor c=0.18e-15
xinv_8_94 out_8_94 out2_8_94 vdd vss vdd vss inverter
//cPar_8_95 out_8_95 vss capacitor c=0.18e-15
xinv_8_95 out_8_95 out2_8_95 vdd vss vdd vss inverter
//cPar_8_96 out_8_96 vss capacitor c=0.18e-15
xinv_8_96 out_8_96 out2_8_96 vdd vss vdd vss inverter
//cPar_8_97 out_8_97 vss capacitor c=0.18e-15
xinv_8_97 out_8_97 out2_8_97 vdd vss vdd vss inverter
//cPar_8_98 out_8_98 vss capacitor c=0.18e-15
xinv_8_98 out_8_98 out2_8_98 vdd vss vdd vss inverter
//cPar_8_99 out_8_99 vss capacitor c=0.18e-15
xinv_8_99 out_8_99 out2_8_99 vdd vss vdd vss inverter
//cPar_8_100 out_8_100 vss capacitor c=0.18e-15
xinv_8_100 out_8_100 out2_8_100 vdd vss vdd vss inverter
//cPar_8_101 out_8_101 vss capacitor c=0.18e-15
xinv_8_101 out_8_101 out2_8_101 vdd vss vdd vss inverter
//cPar_8_102 out_8_102 vss capacitor c=0.18e-15
xinv_8_102 out_8_102 out2_8_102 vdd vss vdd vss inverter
//cPar_8_103 out_8_103 vss capacitor c=0.18e-15
xinv_8_103 out_8_103 out2_8_103 vdd vss vdd vss inverter
//cPar_8_104 out_8_104 vss capacitor c=0.18e-15
xinv_8_104 out_8_104 out2_8_104 vdd vss vdd vss inverter
//cPar_8_105 out_8_105 vss capacitor c=0.18e-15
xinv_8_105 out_8_105 out2_8_105 vdd vss vdd vss inverter
//cPar_8_106 out_8_106 vss capacitor c=0.18e-15
xinv_8_106 out_8_106 out2_8_106 vdd vss vdd vss inverter
//cPar_8_107 out_8_107 vss capacitor c=0.18e-15
xinv_8_107 out_8_107 out2_8_107 vdd vss vdd vss inverter
//cPar_8_108 out_8_108 vss capacitor c=0.18e-15
xinv_8_108 out_8_108 out2_8_108 vdd vss vdd vss inverter
//cPar_8_109 out_8_109 vss capacitor c=0.18e-15
xinv_8_109 out_8_109 out2_8_109 vdd vss vdd vss inverter
//cPar_8_110 out_8_110 vss capacitor c=0.18e-15
xinv_8_110 out_8_110 out2_8_110 vdd vss vdd vss inverter
//cPar_8_111 out_8_111 vss capacitor c=0.18e-15
xinv_8_111 out_8_111 out2_8_111 vdd vss vdd vss inverter
//cPar_8_112 out_8_112 vss capacitor c=0.18e-15
xinv_8_112 out_8_112 out2_8_112 vdd vss vdd vss inverter
//cPar_8_113 out_8_113 vss capacitor c=0.18e-15
xinv_8_113 out_8_113 out2_8_113 vdd vss vdd vss inverter
//cPar_8_114 out_8_114 vss capacitor c=0.18e-15
xinv_8_114 out_8_114 out2_8_114 vdd vss vdd vss inverter
//cPar_8_115 out_8_115 vss capacitor c=0.18e-15
xinv_8_115 out_8_115 out2_8_115 vdd vss vdd vss inverter
//cPar_8_116 out_8_116 vss capacitor c=0.18e-15
xinv_8_116 out_8_116 out2_8_116 vdd vss vdd vss inverter
//cPar_8_117 out_8_117 vss capacitor c=0.18e-15
xinv_8_117 out_8_117 out2_8_117 vdd vss vdd vss inverter
//cPar_8_118 out_8_118 vss capacitor c=0.18e-15
xinv_8_118 out_8_118 out2_8_118 vdd vss vdd vss inverter
//cPar_8_119 out_8_119 vss capacitor c=0.18e-15
xinv_8_119 out_8_119 out2_8_119 vdd vss vdd vss inverter
//cPar_8_120 out_8_120 vss capacitor c=0.18e-15
xinv_8_120 out_8_120 out2_8_120 vdd vss vdd vss inverter
//cPar_8_121 out_8_121 vss capacitor c=0.18e-15
xinv_8_121 out_8_121 out2_8_121 vdd vss vdd vss inverter
//cPar_8_122 out_8_122 vss capacitor c=0.18e-15
xinv_8_122 out_8_122 out2_8_122 vdd vss vdd vss inverter
//cPar_8_123 out_8_123 vss capacitor c=0.18e-15
xinv_8_123 out_8_123 out2_8_123 vdd vss vdd vss inverter
//cPar_8_124 out_8_124 vss capacitor c=0.18e-15
xinv_8_124 out_8_124 out2_8_124 vdd vss vdd vss inverter
//cPar_8_125 out_8_125 vss capacitor c=0.18e-15
xinv_8_125 out_8_125 out2_8_125 vdd vss vdd vss inverter
//cPar_8_126 out_8_126 vss capacitor c=0.18e-15
xinv_8_126 out_8_126 out2_8_126 vdd vss vdd vss inverter
//cPar_8_127 out_8_127 vss capacitor c=0.18e-15
xinv_8_127 out_8_127 out2_8_127 vdd vss vdd vss inverter
//cPar_8_128 out_8_128 vss capacitor c=0.18e-15
xinv_8_128 out_8_128 out2_8_128 vdd vss vdd vss inverter
//cPar_8_129 out_8_129 vss capacitor c=0.18e-15
xinv_8_129 out_8_129 out2_8_129 vdd vss vdd vss inverter
//cPar_8_130 out_8_130 vss capacitor c=0.18e-15
xinv_8_130 out_8_130 out2_8_130 vdd vss vdd vss inverter
//cPar_8_131 out_8_131 vss capacitor c=0.18e-15
xinv_8_131 out_8_131 out2_8_131 vdd vss vdd vss inverter
//cPar_8_132 out_8_132 vss capacitor c=0.18e-15
xinv_8_132 out_8_132 out2_8_132 vdd vss vdd vss inverter
//cPar_8_133 out_8_133 vss capacitor c=0.18e-15
xinv_8_133 out_8_133 out2_8_133 vdd vss vdd vss inverter
//cPar_8_134 out_8_134 vss capacitor c=0.18e-15
xinv_8_134 out_8_134 out2_8_134 vdd vss vdd vss inverter
//cPar_8_135 out_8_135 vss capacitor c=0.18e-15
xinv_8_135 out_8_135 out2_8_135 vdd vss vdd vss inverter
//cPar_8_136 out_8_136 vss capacitor c=0.18e-15
xinv_8_136 out_8_136 out2_8_136 vdd vss vdd vss inverter
//cPar_8_137 out_8_137 vss capacitor c=0.18e-15
xinv_8_137 out_8_137 out2_8_137 vdd vss vdd vss inverter
//cPar_8_138 out_8_138 vss capacitor c=0.18e-15
xinv_8_138 out_8_138 out2_8_138 vdd vss vdd vss inverter
//cPar_8_139 out_8_139 vss capacitor c=0.18e-15
xinv_8_139 out_8_139 out2_8_139 vdd vss vdd vss inverter
//cPar_8_140 out_8_140 vss capacitor c=0.18e-15
xinv_8_140 out_8_140 out2_8_140 vdd vss vdd vss inverter
//cPar_8_141 out_8_141 vss capacitor c=0.18e-15
xinv_8_141 out_8_141 out2_8_141 vdd vss vdd vss inverter
//cPar_8_142 out_8_142 vss capacitor c=0.18e-15
xinv_8_142 out_8_142 out2_8_142 vdd vss vdd vss inverter
//cPar_8_143 out_8_143 vss capacitor c=0.18e-15
xinv_8_143 out_8_143 out2_8_143 vdd vss vdd vss inverter
//cPar_8_144 out_8_144 vss capacitor c=0.18e-15
xinv_8_144 out_8_144 out2_8_144 vdd vss vdd vss inverter
//cPar_8_145 out_8_145 vss capacitor c=0.18e-15
xinv_8_145 out_8_145 out2_8_145 vdd vss vdd vss inverter
//cPar_8_146 out_8_146 vss capacitor c=0.18e-15
xinv_8_146 out_8_146 out2_8_146 vdd vss vdd vss inverter
//cPar_8_147 out_8_147 vss capacitor c=0.18e-15
xinv_8_147 out_8_147 out2_8_147 vdd vss vdd vss inverter
//cPar_8_148 out_8_148 vss capacitor c=0.18e-15
xinv_8_148 out_8_148 out2_8_148 vdd vss vdd vss inverter
//cPar_8_149 out_8_149 vss capacitor c=0.18e-15
xinv_8_149 out_8_149 out2_8_149 vdd vss vdd vss inverter
//cPar_8_150 out_8_150 vss capacitor c=0.18e-15
xinv_8_150 out_8_150 out2_8_150 vdd vss vdd vss inverter
//cPar_8_151 out_8_151 vss capacitor c=0.18e-15
xinv_8_151 out_8_151 out2_8_151 vdd vss vdd vss inverter
//cPar_8_152 out_8_152 vss capacitor c=0.18e-15
xinv_8_152 out_8_152 out2_8_152 vdd vss vdd vss inverter
//cPar_8_153 out_8_153 vss capacitor c=0.18e-15
xinv_8_153 out_8_153 out2_8_153 vdd vss vdd vss inverter
//cPar_8_154 out_8_154 vss capacitor c=0.18e-15
xinv_8_154 out_8_154 out2_8_154 vdd vss vdd vss inverter
//cPar_8_155 out_8_155 vss capacitor c=0.18e-15
xinv_8_155 out_8_155 out2_8_155 vdd vss vdd vss inverter
//cPar_8_156 out_8_156 vss capacitor c=0.18e-15
xinv_8_156 out_8_156 out2_8_156 vdd vss vdd vss inverter
//cPar_8_157 out_8_157 vss capacitor c=0.18e-15
xinv_8_157 out_8_157 out2_8_157 vdd vss vdd vss inverter
//cPar_8_158 out_8_158 vss capacitor c=0.18e-15
xinv_8_158 out_8_158 out2_8_158 vdd vss vdd vss inverter
//cPar_8_159 out_8_159 vss capacitor c=0.18e-15
xinv_8_159 out_8_159 out2_8_159 vdd vss vdd vss inverter
//cPar_8_160 out_8_160 vss capacitor c=0.18e-15
xinv_8_160 out_8_160 out2_8_160 vdd vss vdd vss inverter
//cPar_8_161 out_8_161 vss capacitor c=0.18e-15
xinv_8_161 out_8_161 out2_8_161 vdd vss vdd vss inverter
//cPar_8_162 out_8_162 vss capacitor c=0.18e-15
xinv_8_162 out_8_162 out2_8_162 vdd vss vdd vss inverter
//cPar_8_163 out_8_163 vss capacitor c=0.18e-15
xinv_8_163 out_8_163 out2_8_163 vdd vss vdd vss inverter
//cPar_8_164 out_8_164 vss capacitor c=0.18e-15
xinv_8_164 out_8_164 out2_8_164 vdd vss vdd vss inverter
//cPar_8_165 out_8_165 vss capacitor c=0.18e-15
xinv_8_165 out_8_165 out2_8_165 vdd vss vdd vss inverter
//cPar_8_166 out_8_166 vss capacitor c=0.18e-15
xinv_8_166 out_8_166 out2_8_166 vdd vss vdd vss inverter
//cPar_8_167 out_8_167 vss capacitor c=0.18e-15
xinv_8_167 out_8_167 out2_8_167 vdd vss vdd vss inverter
//cPar_8_168 out_8_168 vss capacitor c=0.18e-15
xinv_8_168 out_8_168 out2_8_168 vdd vss vdd vss inverter
//cPar_8_169 out_8_169 vss capacitor c=0.18e-15
xinv_8_169 out_8_169 out2_8_169 vdd vss vdd vss inverter
//cPar_8_170 out_8_170 vss capacitor c=0.18e-15
xinv_8_170 out_8_170 out2_8_170 vdd vss vdd vss inverter
//cPar_8_171 out_8_171 vss capacitor c=0.18e-15
xinv_8_171 out_8_171 out2_8_171 vdd vss vdd vss inverter
//cPar_8_172 out_8_172 vss capacitor c=0.18e-15
xinv_8_172 out_8_172 out2_8_172 vdd vss vdd vss inverter
//cPar_8_173 out_8_173 vss capacitor c=0.18e-15
xinv_8_173 out_8_173 out2_8_173 vdd vss vdd vss inverter
//cPar_8_174 out_8_174 vss capacitor c=0.18e-15
xinv_8_174 out_8_174 out2_8_174 vdd vss vdd vss inverter
//cPar_8_175 out_8_175 vss capacitor c=0.18e-15
xinv_8_175 out_8_175 out2_8_175 vdd vss vdd vss inverter
//cPar_8_176 out_8_176 vss capacitor c=0.18e-15
xinv_8_176 out_8_176 out2_8_176 vdd vss vdd vss inverter
//cPar_8_177 out_8_177 vss capacitor c=0.18e-15
xinv_8_177 out_8_177 out2_8_177 vdd vss vdd vss inverter
//cPar_8_178 out_8_178 vss capacitor c=0.18e-15
xinv_8_178 out_8_178 out2_8_178 vdd vss vdd vss inverter
//cPar_8_179 out_8_179 vss capacitor c=0.18e-15
xinv_8_179 out_8_179 out2_8_179 vdd vss vdd vss inverter
//cPar_8_180 out_8_180 vss capacitor c=0.18e-15
xinv_8_180 out_8_180 out2_8_180 vdd vss vdd vss inverter
//cPar_8_181 out_8_181 vss capacitor c=0.18e-15
xinv_8_181 out_8_181 out2_8_181 vdd vss vdd vss inverter
//cPar_8_182 out_8_182 vss capacitor c=0.18e-15
xinv_8_182 out_8_182 out2_8_182 vdd vss vdd vss inverter
//cPar_8_183 out_8_183 vss capacitor c=0.18e-15
xinv_8_183 out_8_183 out2_8_183 vdd vss vdd vss inverter
//cPar_8_184 out_8_184 vss capacitor c=0.18e-15
xinv_8_184 out_8_184 out2_8_184 vdd vss vdd vss inverter
//cPar_8_185 out_8_185 vss capacitor c=0.18e-15
xinv_8_185 out_8_185 out2_8_185 vdd vss vdd vss inverter
//cPar_8_186 out_8_186 vss capacitor c=0.18e-15
xinv_8_186 out_8_186 out2_8_186 vdd vss vdd vss inverter
//cPar_8_187 out_8_187 vss capacitor c=0.18e-15
xinv_8_187 out_8_187 out2_8_187 vdd vss vdd vss inverter
//cPar_8_188 out_8_188 vss capacitor c=0.18e-15
xinv_8_188 out_8_188 out2_8_188 vdd vss vdd vss inverter
//cPar_8_189 out_8_189 vss capacitor c=0.18e-15
xinv_8_189 out_8_189 out2_8_189 vdd vss vdd vss inverter
//cPar_8_190 out_8_190 vss capacitor c=0.18e-15
xinv_8_190 out_8_190 out2_8_190 vdd vss vdd vss inverter
//cPar_8_191 out_8_191 vss capacitor c=0.18e-15
xinv_8_191 out_8_191 out2_8_191 vdd vss vdd vss inverter
//cPar_8_192 out_8_192 vss capacitor c=0.18e-15
xinv_8_192 out_8_192 out2_8_192 vdd vss vdd vss inverter
//cPar_8_193 out_8_193 vss capacitor c=0.18e-15
xinv_8_193 out_8_193 out2_8_193 vdd vss vdd vss inverter
//cPar_8_194 out_8_194 vss capacitor c=0.18e-15
xinv_8_194 out_8_194 out2_8_194 vdd vss vdd vss inverter
//cPar_8_195 out_8_195 vss capacitor c=0.18e-15
xinv_8_195 out_8_195 out2_8_195 vdd vss vdd vss inverter
//cPar_8_196 out_8_196 vss capacitor c=0.18e-15
xinv_8_196 out_8_196 out2_8_196 vdd vss vdd vss inverter
//cPar_8_197 out_8_197 vss capacitor c=0.18e-15
xinv_8_197 out_8_197 out2_8_197 vdd vss vdd vss inverter
//cPar_8_198 out_8_198 vss capacitor c=0.18e-15
xinv_8_198 out_8_198 out2_8_198 vdd vss vdd vss inverter
//cPar_8_199 out_8_199 vss capacitor c=0.18e-15
xinv_8_199 out_8_199 out2_8_199 vdd vss vdd vss inverter
//cPar_8_200 out_8_200 vss capacitor c=0.18e-15
xinv_8_200 out_8_200 out2_8_200 vdd vss vdd vss inverter
//cPar_8_201 out_8_201 vss capacitor c=0.18e-15
xinv_8_201 out_8_201 out2_8_201 vdd vss vdd vss inverter
//cPar_8_202 out_8_202 vss capacitor c=0.18e-15
xinv_8_202 out_8_202 out2_8_202 vdd vss vdd vss inverter
//cPar_8_203 out_8_203 vss capacitor c=0.18e-15
xinv_8_203 out_8_203 out2_8_203 vdd vss vdd vss inverter
//cPar_8_204 out_8_204 vss capacitor c=0.18e-15
xinv_8_204 out_8_204 out2_8_204 vdd vss vdd vss inverter
//cPar_8_205 out_8_205 vss capacitor c=0.18e-15
xinv_8_205 out_8_205 out2_8_205 vdd vss vdd vss inverter
//cPar_8_206 out_8_206 vss capacitor c=0.18e-15
xinv_8_206 out_8_206 out2_8_206 vdd vss vdd vss inverter
//cPar_8_207 out_8_207 vss capacitor c=0.18e-15
xinv_8_207 out_8_207 out2_8_207 vdd vss vdd vss inverter
//cPar_8_208 out_8_208 vss capacitor c=0.18e-15
xinv_8_208 out_8_208 out2_8_208 vdd vss vdd vss inverter
//cPar_8_209 out_8_209 vss capacitor c=0.18e-15
xinv_8_209 out_8_209 out2_8_209 vdd vss vdd vss inverter
//cPar_8_210 out_8_210 vss capacitor c=0.18e-15
xinv_8_210 out_8_210 out2_8_210 vdd vss vdd vss inverter
//cPar_8_211 out_8_211 vss capacitor c=0.18e-15
xinv_8_211 out_8_211 out2_8_211 vdd vss vdd vss inverter
//cPar_8_212 out_8_212 vss capacitor c=0.18e-15
xinv_8_212 out_8_212 out2_8_212 vdd vss vdd vss inverter
//cPar_8_213 out_8_213 vss capacitor c=0.18e-15
xinv_8_213 out_8_213 out2_8_213 vdd vss vdd vss inverter
//cPar_8_214 out_8_214 vss capacitor c=0.18e-15
xinv_8_214 out_8_214 out2_8_214 vdd vss vdd vss inverter
//cPar_8_215 out_8_215 vss capacitor c=0.18e-15
xinv_8_215 out_8_215 out2_8_215 vdd vss vdd vss inverter
//cPar_8_216 out_8_216 vss capacitor c=0.18e-15
xinv_8_216 out_8_216 out2_8_216 vdd vss vdd vss inverter
//cPar_8_217 out_8_217 vss capacitor c=0.18e-15
xinv_8_217 out_8_217 out2_8_217 vdd vss vdd vss inverter
//cPar_8_218 out_8_218 vss capacitor c=0.18e-15
xinv_8_218 out_8_218 out2_8_218 vdd vss vdd vss inverter
//cPar_8_219 out_8_219 vss capacitor c=0.18e-15
xinv_8_219 out_8_219 out2_8_219 vdd vss vdd vss inverter
//cPar_8_220 out_8_220 vss capacitor c=0.18e-15
xinv_8_220 out_8_220 out2_8_220 vdd vss vdd vss inverter
//cPar_8_221 out_8_221 vss capacitor c=0.18e-15
xinv_8_221 out_8_221 out2_8_221 vdd vss vdd vss inverter
//cPar_8_222 out_8_222 vss capacitor c=0.18e-15
xinv_8_222 out_8_222 out2_8_222 vdd vss vdd vss inverter
//cPar_8_223 out_8_223 vss capacitor c=0.18e-15
xinv_8_223 out_8_223 out2_8_223 vdd vss vdd vss inverter
//cPar_8_224 out_8_224 vss capacitor c=0.18e-15
xinv_8_224 out_8_224 out2_8_224 vdd vss vdd vss inverter
//cPar_8_225 out_8_225 vss capacitor c=0.18e-15
xinv_8_225 out_8_225 out2_8_225 vdd vss vdd vss inverter
//cPar_8_226 out_8_226 vss capacitor c=0.18e-15
xinv_8_226 out_8_226 out2_8_226 vdd vss vdd vss inverter
//cPar_8_227 out_8_227 vss capacitor c=0.18e-15
xinv_8_227 out_8_227 out2_8_227 vdd vss vdd vss inverter
//cPar_8_228 out_8_228 vss capacitor c=0.18e-15
xinv_8_228 out_8_228 out2_8_228 vdd vss vdd vss inverter
//cPar_8_229 out_8_229 vss capacitor c=0.18e-15
xinv_8_229 out_8_229 out2_8_229 vdd vss vdd vss inverter
//cPar_8_230 out_8_230 vss capacitor c=0.18e-15
xinv_8_230 out_8_230 out2_8_230 vdd vss vdd vss inverter
//cPar_8_231 out_8_231 vss capacitor c=0.18e-15
xinv_8_231 out_8_231 out2_8_231 vdd vss vdd vss inverter
//cPar_8_232 out_8_232 vss capacitor c=0.18e-15
xinv_8_232 out_8_232 out2_8_232 vdd vss vdd vss inverter
//cPar_8_233 out_8_233 vss capacitor c=0.18e-15
xinv_8_233 out_8_233 out2_8_233 vdd vss vdd vss inverter
//cPar_8_234 out_8_234 vss capacitor c=0.18e-15
xinv_8_234 out_8_234 out2_8_234 vdd vss vdd vss inverter
//cPar_8_235 out_8_235 vss capacitor c=0.18e-15
xinv_8_235 out_8_235 out2_8_235 vdd vss vdd vss inverter
//cPar_8_236 out_8_236 vss capacitor c=0.18e-15
xinv_8_236 out_8_236 out2_8_236 vdd vss vdd vss inverter
//cPar_8_237 out_8_237 vss capacitor c=0.18e-15
xinv_8_237 out_8_237 out2_8_237 vdd vss vdd vss inverter
//cPar_8_238 out_8_238 vss capacitor c=0.18e-15
xinv_8_238 out_8_238 out2_8_238 vdd vss vdd vss inverter
//cPar_8_239 out_8_239 vss capacitor c=0.18e-15
xinv_8_239 out_8_239 out2_8_239 vdd vss vdd vss inverter
//cPar_8_240 out_8_240 vss capacitor c=0.18e-15
xinv_8_240 out_8_240 out2_8_240 vdd vss vdd vss inverter
//cPar_8_241 out_8_241 vss capacitor c=0.18e-15
xinv_8_241 out_8_241 out2_8_241 vdd vss vdd vss inverter
//cPar_8_242 out_8_242 vss capacitor c=0.18e-15
xinv_8_242 out_8_242 out2_8_242 vdd vss vdd vss inverter
//cPar_8_243 out_8_243 vss capacitor c=0.18e-15
xinv_8_243 out_8_243 out2_8_243 vdd vss vdd vss inverter
//cPar_8_244 out_8_244 vss capacitor c=0.18e-15
xinv_8_244 out_8_244 out2_8_244 vdd vss vdd vss inverter
//cPar_8_245 out_8_245 vss capacitor c=0.18e-15
xinv_8_245 out_8_245 out2_8_245 vdd vss vdd vss inverter
//cPar_8_246 out_8_246 vss capacitor c=0.18e-15
xinv_8_246 out_8_246 out2_8_246 vdd vss vdd vss inverter
//cPar_8_247 out_8_247 vss capacitor c=0.18e-15
xinv_8_247 out_8_247 out2_8_247 vdd vss vdd vss inverter
//cPar_8_248 out_8_248 vss capacitor c=0.18e-15
xinv_8_248 out_8_248 out2_8_248 vdd vss vdd vss inverter
//cPar_8_249 out_8_249 vss capacitor c=0.18e-15
xinv_8_249 out_8_249 out2_8_249 vdd vss vdd vss inverter
//cPar_8_250 out_8_250 vss capacitor c=0.18e-15
xinv_8_250 out_8_250 out2_8_250 vdd vss vdd vss inverter
//cPar_8_251 out_8_251 vss capacitor c=0.18e-15
xinv_8_251 out_8_251 out2_8_251 vdd vss vdd vss inverter
//cPar_8_252 out_8_252 vss capacitor c=0.18e-15
xinv_8_252 out_8_252 out2_8_252 vdd vss vdd vss inverter
//cPar_8_253 out_8_253 vss capacitor c=0.18e-15
xinv_8_253 out_8_253 out2_8_253 vdd vss vdd vss inverter
//cPar_8_254 out_8_254 vss capacitor c=0.18e-15
xinv_8_254 out_8_254 out2_8_254 vdd vss vdd vss inverter
//cPar_8_255 out_8_255 vss capacitor c=0.18e-15
xinv_8_255 out_8_255 out2_8_255 vdd vss vdd vss inverter
save out_8_2
save out_8_2
save vvdd_8:p
vvdd_9 vdd_9 0 vsource type=dc dc=1
xdecodernine (vss in vss vss vss vss vss vss vss  en out_9_0 out_9_1 out_9_2 out_9_3 out_9_4 out_9_5 out_9_6 out_9_7 out_9_8 out_9_9 out_9_10 out_9_11 out_9_12 out_9_13 out_9_14 out_9_15 out_9_16 out_9_17 out_9_18 out_9_19 out_9_20 out_9_21 out_9_22 out_9_23 out_9_24 out_9_25 out_9_26 out_9_27 out_9_28 out_9_29 out_9_30 out_9_31 out_9_32 out_9_33 out_9_34 out_9_35 out_9_36 out_9_37 out_9_38 out_9_39 out_9_40 out_9_41 out_9_42 out_9_43 out_9_44 out_9_45 out_9_46 out_9_47 out_9_48 out_9_49 out_9_50 out_9_51 out_9_52 out_9_53 out_9_54 out_9_55 out_9_56 out_9_57 out_9_58 out_9_59 out_9_60 out_9_61 out_9_62 out_9_63 out_9_64 out_9_65 out_9_66 out_9_67 out_9_68 out_9_69 out_9_70 out_9_71 out_9_72 out_9_73 out_9_74 out_9_75 out_9_76 out_9_77 out_9_78 out_9_79 out_9_80 out_9_81 out_9_82 out_9_83 out_9_84 out_9_85 out_9_86 out_9_87 out_9_88 out_9_89 out_9_90 out_9_91 out_9_92 out_9_93 out_9_94 out_9_95 out_9_96 out_9_97 out_9_98 out_9_99 out_9_100 out_9_101 out_9_102 out_9_103 out_9_104 out_9_105 out_9_106 out_9_107 out_9_108 out_9_109 out_9_110 out_9_111 out_9_112 out_9_113 out_9_114 out_9_115 out_9_116 out_9_117 out_9_118 out_9_119 out_9_120 out_9_121 out_9_122 out_9_123 out_9_124 out_9_125 out_9_126 out_9_127 out_9_128 out_9_129 out_9_130 out_9_131 out_9_132 out_9_133 out_9_134 out_9_135 out_9_136 out_9_137 out_9_138 out_9_139 out_9_140 out_9_141 out_9_142 out_9_143 out_9_144 out_9_145 out_9_146 out_9_147 out_9_148 out_9_149 out_9_150 out_9_151 out_9_152 out_9_153 out_9_154 out_9_155 out_9_156 out_9_157 out_9_158 out_9_159 out_9_160 out_9_161 out_9_162 out_9_163 out_9_164 out_9_165 out_9_166 out_9_167 out_9_168 out_9_169 out_9_170 out_9_171 out_9_172 out_9_173 out_9_174 out_9_175 out_9_176 out_9_177 out_9_178 out_9_179 out_9_180 out_9_181 out_9_182 out_9_183 out_9_184 out_9_185 out_9_186 out_9_187 out_9_188 out_9_189 out_9_190 out_9_191 out_9_192 out_9_193 out_9_194 out_9_195 out_9_196 out_9_197 out_9_198 out_9_199 out_9_200 out_9_201 out_9_202 out_9_203 out_9_204 out_9_205 out_9_206 out_9_207 out_9_208 out_9_209 out_9_210 out_9_211 out_9_212 out_9_213 out_9_214 out_9_215 out_9_216 out_9_217 out_9_218 out_9_219 out_9_220 out_9_221 out_9_222 out_9_223 out_9_224 out_9_225 out_9_226 out_9_227 out_9_228 out_9_229 out_9_230 out_9_231 out_9_232 out_9_233 out_9_234 out_9_235 out_9_236 out_9_237 out_9_238 out_9_239 out_9_240 out_9_241 out_9_242 out_9_243 out_9_244 out_9_245 out_9_246 out_9_247 out_9_248 out_9_249 out_9_250 out_9_251 out_9_252 out_9_253 out_9_254 out_9_255 out_9_256 out_9_257 out_9_258 out_9_259 out_9_260 out_9_261 out_9_262 out_9_263 out_9_264 out_9_265 out_9_266 out_9_267 out_9_268 out_9_269 out_9_270 out_9_271 out_9_272 out_9_273 out_9_274 out_9_275 out_9_276 out_9_277 out_9_278 out_9_279 out_9_280 out_9_281 out_9_282 out_9_283 out_9_284 out_9_285 out_9_286 out_9_287 out_9_288 out_9_289 out_9_290 out_9_291 out_9_292 out_9_293 out_9_294 out_9_295 out_9_296 out_9_297 out_9_298 out_9_299 out_9_300 out_9_301 out_9_302 out_9_303 out_9_304 out_9_305 out_9_306 out_9_307 out_9_308 out_9_309 out_9_310 out_9_311 out_9_312 out_9_313 out_9_314 out_9_315 out_9_316 out_9_317 out_9_318 out_9_319 out_9_320 out_9_321 out_9_322 out_9_323 out_9_324 out_9_325 out_9_326 out_9_327 out_9_328 out_9_329 out_9_330 out_9_331 out_9_332 out_9_333 out_9_334 out_9_335 out_9_336 out_9_337 out_9_338 out_9_339 out_9_340 out_9_341 out_9_342 out_9_343 out_9_344 out_9_345 out_9_346 out_9_347 out_9_348 out_9_349 out_9_350 out_9_351 out_9_352 out_9_353 out_9_354 out_9_355 out_9_356 out_9_357 out_9_358 out_9_359 out_9_360 out_9_361 out_9_362 out_9_363 out_9_364 out_9_365 out_9_366 out_9_367 out_9_368 out_9_369 out_9_370 out_9_371 out_9_372 out_9_373 out_9_374 out_9_375 out_9_376 out_9_377 out_9_378 out_9_379 out_9_380 out_9_381 out_9_382 out_9_383 out_9_384 out_9_385 out_9_386 out_9_387 out_9_388 out_9_389 out_9_390 out_9_391 out_9_392 out_9_393 out_9_394 out_9_395 out_9_396 out_9_397 out_9_398 out_9_399 out_9_400 out_9_401 out_9_402 out_9_403 out_9_404 out_9_405 out_9_406 out_9_407 out_9_408 out_9_409 out_9_410 out_9_411 out_9_412 out_9_413 out_9_414 out_9_415 out_9_416 out_9_417 out_9_418 out_9_419 out_9_420 out_9_421 out_9_422 out_9_423 out_9_424 out_9_425 out_9_426 out_9_427 out_9_428 out_9_429 out_9_430 out_9_431 out_9_432 out_9_433 out_9_434 out_9_435 out_9_436 out_9_437 out_9_438 out_9_439 out_9_440 out_9_441 out_9_442 out_9_443 out_9_444 out_9_445 out_9_446 out_9_447 out_9_448 out_9_449 out_9_450 out_9_451 out_9_452 out_9_453 out_9_454 out_9_455 out_9_456 out_9_457 out_9_458 out_9_459 out_9_460 out_9_461 out_9_462 out_9_463 out_9_464 out_9_465 out_9_466 out_9_467 out_9_468 out_9_469 out_9_470 out_9_471 out_9_472 out_9_473 out_9_474 out_9_475 out_9_476 out_9_477 out_9_478 out_9_479 out_9_480 out_9_481 out_9_482 out_9_483 out_9_484 out_9_485 out_9_486 out_9_487 out_9_488 out_9_489 out_9_490 out_9_491 out_9_492 out_9_493 out_9_494 out_9_495 out_9_496 out_9_497 out_9_498 out_9_499 out_9_500 out_9_501 out_9_502 out_9_503 out_9_504 out_9_505 out_9_506 out_9_507 out_9_508 out_9_509 out_9_510 out_9_511 vdd_9 vss vss vdd_9) decodernine
//cPar_9_0 out_9_0 vss capacitor c=0.18e-15
xinv_9_0 out_9_0 out2_9_0 vdd vss vdd vss inverter
//cPar_9_1 out_9_1 vss capacitor c=0.18e-15
xinv_9_1 out_9_1 out2_9_1 vdd vss vdd vss inverter
//cPar_9_2 out_9_2 vss capacitor c=0.18e-15
xinv_9_2 out_9_2 out2_9_2 vdd vss vdd vss inverter
//cPar_9_3 out_9_3 vss capacitor c=0.18e-15
xinv_9_3 out_9_3 out2_9_3 vdd vss vdd vss inverter
//cPar_9_4 out_9_4 vss capacitor c=0.18e-15
xinv_9_4 out_9_4 out2_9_4 vdd vss vdd vss inverter
//cPar_9_5 out_9_5 vss capacitor c=0.18e-15
xinv_9_5 out_9_5 out2_9_5 vdd vss vdd vss inverter
//cPar_9_6 out_9_6 vss capacitor c=0.18e-15
xinv_9_6 out_9_6 out2_9_6 vdd vss vdd vss inverter
//cPar_9_7 out_9_7 vss capacitor c=0.18e-15
xinv_9_7 out_9_7 out2_9_7 vdd vss vdd vss inverter
//cPar_9_8 out_9_8 vss capacitor c=0.18e-15
xinv_9_8 out_9_8 out2_9_8 vdd vss vdd vss inverter
//cPar_9_9 out_9_9 vss capacitor c=0.18e-15
xinv_9_9 out_9_9 out2_9_9 vdd vss vdd vss inverter
//cPar_9_10 out_9_10 vss capacitor c=0.18e-15
xinv_9_10 out_9_10 out2_9_10 vdd vss vdd vss inverter
//cPar_9_11 out_9_11 vss capacitor c=0.18e-15
xinv_9_11 out_9_11 out2_9_11 vdd vss vdd vss inverter
//cPar_9_12 out_9_12 vss capacitor c=0.18e-15
xinv_9_12 out_9_12 out2_9_12 vdd vss vdd vss inverter
//cPar_9_13 out_9_13 vss capacitor c=0.18e-15
xinv_9_13 out_9_13 out2_9_13 vdd vss vdd vss inverter
//cPar_9_14 out_9_14 vss capacitor c=0.18e-15
xinv_9_14 out_9_14 out2_9_14 vdd vss vdd vss inverter
//cPar_9_15 out_9_15 vss capacitor c=0.18e-15
xinv_9_15 out_9_15 out2_9_15 vdd vss vdd vss inverter
//cPar_9_16 out_9_16 vss capacitor c=0.18e-15
xinv_9_16 out_9_16 out2_9_16 vdd vss vdd vss inverter
//cPar_9_17 out_9_17 vss capacitor c=0.18e-15
xinv_9_17 out_9_17 out2_9_17 vdd vss vdd vss inverter
//cPar_9_18 out_9_18 vss capacitor c=0.18e-15
xinv_9_18 out_9_18 out2_9_18 vdd vss vdd vss inverter
//cPar_9_19 out_9_19 vss capacitor c=0.18e-15
xinv_9_19 out_9_19 out2_9_19 vdd vss vdd vss inverter
//cPar_9_20 out_9_20 vss capacitor c=0.18e-15
xinv_9_20 out_9_20 out2_9_20 vdd vss vdd vss inverter
//cPar_9_21 out_9_21 vss capacitor c=0.18e-15
xinv_9_21 out_9_21 out2_9_21 vdd vss vdd vss inverter
//cPar_9_22 out_9_22 vss capacitor c=0.18e-15
xinv_9_22 out_9_22 out2_9_22 vdd vss vdd vss inverter
//cPar_9_23 out_9_23 vss capacitor c=0.18e-15
xinv_9_23 out_9_23 out2_9_23 vdd vss vdd vss inverter
//cPar_9_24 out_9_24 vss capacitor c=0.18e-15
xinv_9_24 out_9_24 out2_9_24 vdd vss vdd vss inverter
//cPar_9_25 out_9_25 vss capacitor c=0.18e-15
xinv_9_25 out_9_25 out2_9_25 vdd vss vdd vss inverter
//cPar_9_26 out_9_26 vss capacitor c=0.18e-15
xinv_9_26 out_9_26 out2_9_26 vdd vss vdd vss inverter
//cPar_9_27 out_9_27 vss capacitor c=0.18e-15
xinv_9_27 out_9_27 out2_9_27 vdd vss vdd vss inverter
//cPar_9_28 out_9_28 vss capacitor c=0.18e-15
xinv_9_28 out_9_28 out2_9_28 vdd vss vdd vss inverter
//cPar_9_29 out_9_29 vss capacitor c=0.18e-15
xinv_9_29 out_9_29 out2_9_29 vdd vss vdd vss inverter
//cPar_9_30 out_9_30 vss capacitor c=0.18e-15
xinv_9_30 out_9_30 out2_9_30 vdd vss vdd vss inverter
//cPar_9_31 out_9_31 vss capacitor c=0.18e-15
xinv_9_31 out_9_31 out2_9_31 vdd vss vdd vss inverter
//cPar_9_32 out_9_32 vss capacitor c=0.18e-15
xinv_9_32 out_9_32 out2_9_32 vdd vss vdd vss inverter
//cPar_9_33 out_9_33 vss capacitor c=0.18e-15
xinv_9_33 out_9_33 out2_9_33 vdd vss vdd vss inverter
//cPar_9_34 out_9_34 vss capacitor c=0.18e-15
xinv_9_34 out_9_34 out2_9_34 vdd vss vdd vss inverter
//cPar_9_35 out_9_35 vss capacitor c=0.18e-15
xinv_9_35 out_9_35 out2_9_35 vdd vss vdd vss inverter
//cPar_9_36 out_9_36 vss capacitor c=0.18e-15
xinv_9_36 out_9_36 out2_9_36 vdd vss vdd vss inverter
//cPar_9_37 out_9_37 vss capacitor c=0.18e-15
xinv_9_37 out_9_37 out2_9_37 vdd vss vdd vss inverter
//cPar_9_38 out_9_38 vss capacitor c=0.18e-15
xinv_9_38 out_9_38 out2_9_38 vdd vss vdd vss inverter
//cPar_9_39 out_9_39 vss capacitor c=0.18e-15
xinv_9_39 out_9_39 out2_9_39 vdd vss vdd vss inverter
//cPar_9_40 out_9_40 vss capacitor c=0.18e-15
xinv_9_40 out_9_40 out2_9_40 vdd vss vdd vss inverter
//cPar_9_41 out_9_41 vss capacitor c=0.18e-15
xinv_9_41 out_9_41 out2_9_41 vdd vss vdd vss inverter
//cPar_9_42 out_9_42 vss capacitor c=0.18e-15
xinv_9_42 out_9_42 out2_9_42 vdd vss vdd vss inverter
//cPar_9_43 out_9_43 vss capacitor c=0.18e-15
xinv_9_43 out_9_43 out2_9_43 vdd vss vdd vss inverter
//cPar_9_44 out_9_44 vss capacitor c=0.18e-15
xinv_9_44 out_9_44 out2_9_44 vdd vss vdd vss inverter
//cPar_9_45 out_9_45 vss capacitor c=0.18e-15
xinv_9_45 out_9_45 out2_9_45 vdd vss vdd vss inverter
//cPar_9_46 out_9_46 vss capacitor c=0.18e-15
xinv_9_46 out_9_46 out2_9_46 vdd vss vdd vss inverter
//cPar_9_47 out_9_47 vss capacitor c=0.18e-15
xinv_9_47 out_9_47 out2_9_47 vdd vss vdd vss inverter
//cPar_9_48 out_9_48 vss capacitor c=0.18e-15
xinv_9_48 out_9_48 out2_9_48 vdd vss vdd vss inverter
//cPar_9_49 out_9_49 vss capacitor c=0.18e-15
xinv_9_49 out_9_49 out2_9_49 vdd vss vdd vss inverter
//cPar_9_50 out_9_50 vss capacitor c=0.18e-15
xinv_9_50 out_9_50 out2_9_50 vdd vss vdd vss inverter
//cPar_9_51 out_9_51 vss capacitor c=0.18e-15
xinv_9_51 out_9_51 out2_9_51 vdd vss vdd vss inverter
//cPar_9_52 out_9_52 vss capacitor c=0.18e-15
xinv_9_52 out_9_52 out2_9_52 vdd vss vdd vss inverter
//cPar_9_53 out_9_53 vss capacitor c=0.18e-15
xinv_9_53 out_9_53 out2_9_53 vdd vss vdd vss inverter
//cPar_9_54 out_9_54 vss capacitor c=0.18e-15
xinv_9_54 out_9_54 out2_9_54 vdd vss vdd vss inverter
//cPar_9_55 out_9_55 vss capacitor c=0.18e-15
xinv_9_55 out_9_55 out2_9_55 vdd vss vdd vss inverter
//cPar_9_56 out_9_56 vss capacitor c=0.18e-15
xinv_9_56 out_9_56 out2_9_56 vdd vss vdd vss inverter
//cPar_9_57 out_9_57 vss capacitor c=0.18e-15
xinv_9_57 out_9_57 out2_9_57 vdd vss vdd vss inverter
//cPar_9_58 out_9_58 vss capacitor c=0.18e-15
xinv_9_58 out_9_58 out2_9_58 vdd vss vdd vss inverter
//cPar_9_59 out_9_59 vss capacitor c=0.18e-15
xinv_9_59 out_9_59 out2_9_59 vdd vss vdd vss inverter
//cPar_9_60 out_9_60 vss capacitor c=0.18e-15
xinv_9_60 out_9_60 out2_9_60 vdd vss vdd vss inverter
//cPar_9_61 out_9_61 vss capacitor c=0.18e-15
xinv_9_61 out_9_61 out2_9_61 vdd vss vdd vss inverter
//cPar_9_62 out_9_62 vss capacitor c=0.18e-15
xinv_9_62 out_9_62 out2_9_62 vdd vss vdd vss inverter
//cPar_9_63 out_9_63 vss capacitor c=0.18e-15
xinv_9_63 out_9_63 out2_9_63 vdd vss vdd vss inverter
//cPar_9_64 out_9_64 vss capacitor c=0.18e-15
xinv_9_64 out_9_64 out2_9_64 vdd vss vdd vss inverter
//cPar_9_65 out_9_65 vss capacitor c=0.18e-15
xinv_9_65 out_9_65 out2_9_65 vdd vss vdd vss inverter
//cPar_9_66 out_9_66 vss capacitor c=0.18e-15
xinv_9_66 out_9_66 out2_9_66 vdd vss vdd vss inverter
//cPar_9_67 out_9_67 vss capacitor c=0.18e-15
xinv_9_67 out_9_67 out2_9_67 vdd vss vdd vss inverter
//cPar_9_68 out_9_68 vss capacitor c=0.18e-15
xinv_9_68 out_9_68 out2_9_68 vdd vss vdd vss inverter
//cPar_9_69 out_9_69 vss capacitor c=0.18e-15
xinv_9_69 out_9_69 out2_9_69 vdd vss vdd vss inverter
//cPar_9_70 out_9_70 vss capacitor c=0.18e-15
xinv_9_70 out_9_70 out2_9_70 vdd vss vdd vss inverter
//cPar_9_71 out_9_71 vss capacitor c=0.18e-15
xinv_9_71 out_9_71 out2_9_71 vdd vss vdd vss inverter
//cPar_9_72 out_9_72 vss capacitor c=0.18e-15
xinv_9_72 out_9_72 out2_9_72 vdd vss vdd vss inverter
//cPar_9_73 out_9_73 vss capacitor c=0.18e-15
xinv_9_73 out_9_73 out2_9_73 vdd vss vdd vss inverter
//cPar_9_74 out_9_74 vss capacitor c=0.18e-15
xinv_9_74 out_9_74 out2_9_74 vdd vss vdd vss inverter
//cPar_9_75 out_9_75 vss capacitor c=0.18e-15
xinv_9_75 out_9_75 out2_9_75 vdd vss vdd vss inverter
//cPar_9_76 out_9_76 vss capacitor c=0.18e-15
xinv_9_76 out_9_76 out2_9_76 vdd vss vdd vss inverter
//cPar_9_77 out_9_77 vss capacitor c=0.18e-15
xinv_9_77 out_9_77 out2_9_77 vdd vss vdd vss inverter
//cPar_9_78 out_9_78 vss capacitor c=0.18e-15
xinv_9_78 out_9_78 out2_9_78 vdd vss vdd vss inverter
//cPar_9_79 out_9_79 vss capacitor c=0.18e-15
xinv_9_79 out_9_79 out2_9_79 vdd vss vdd vss inverter
//cPar_9_80 out_9_80 vss capacitor c=0.18e-15
xinv_9_80 out_9_80 out2_9_80 vdd vss vdd vss inverter
//cPar_9_81 out_9_81 vss capacitor c=0.18e-15
xinv_9_81 out_9_81 out2_9_81 vdd vss vdd vss inverter
//cPar_9_82 out_9_82 vss capacitor c=0.18e-15
xinv_9_82 out_9_82 out2_9_82 vdd vss vdd vss inverter
//cPar_9_83 out_9_83 vss capacitor c=0.18e-15
xinv_9_83 out_9_83 out2_9_83 vdd vss vdd vss inverter
//cPar_9_84 out_9_84 vss capacitor c=0.18e-15
xinv_9_84 out_9_84 out2_9_84 vdd vss vdd vss inverter
//cPar_9_85 out_9_85 vss capacitor c=0.18e-15
xinv_9_85 out_9_85 out2_9_85 vdd vss vdd vss inverter
//cPar_9_86 out_9_86 vss capacitor c=0.18e-15
xinv_9_86 out_9_86 out2_9_86 vdd vss vdd vss inverter
//cPar_9_87 out_9_87 vss capacitor c=0.18e-15
xinv_9_87 out_9_87 out2_9_87 vdd vss vdd vss inverter
//cPar_9_88 out_9_88 vss capacitor c=0.18e-15
xinv_9_88 out_9_88 out2_9_88 vdd vss vdd vss inverter
//cPar_9_89 out_9_89 vss capacitor c=0.18e-15
xinv_9_89 out_9_89 out2_9_89 vdd vss vdd vss inverter
//cPar_9_90 out_9_90 vss capacitor c=0.18e-15
xinv_9_90 out_9_90 out2_9_90 vdd vss vdd vss inverter
//cPar_9_91 out_9_91 vss capacitor c=0.18e-15
xinv_9_91 out_9_91 out2_9_91 vdd vss vdd vss inverter
//cPar_9_92 out_9_92 vss capacitor c=0.18e-15
xinv_9_92 out_9_92 out2_9_92 vdd vss vdd vss inverter
//cPar_9_93 out_9_93 vss capacitor c=0.18e-15
xinv_9_93 out_9_93 out2_9_93 vdd vss vdd vss inverter
//cPar_9_94 out_9_94 vss capacitor c=0.18e-15
xinv_9_94 out_9_94 out2_9_94 vdd vss vdd vss inverter
//cPar_9_95 out_9_95 vss capacitor c=0.18e-15
xinv_9_95 out_9_95 out2_9_95 vdd vss vdd vss inverter
//cPar_9_96 out_9_96 vss capacitor c=0.18e-15
xinv_9_96 out_9_96 out2_9_96 vdd vss vdd vss inverter
//cPar_9_97 out_9_97 vss capacitor c=0.18e-15
xinv_9_97 out_9_97 out2_9_97 vdd vss vdd vss inverter
//cPar_9_98 out_9_98 vss capacitor c=0.18e-15
xinv_9_98 out_9_98 out2_9_98 vdd vss vdd vss inverter
//cPar_9_99 out_9_99 vss capacitor c=0.18e-15
xinv_9_99 out_9_99 out2_9_99 vdd vss vdd vss inverter
//cPar_9_100 out_9_100 vss capacitor c=0.18e-15
xinv_9_100 out_9_100 out2_9_100 vdd vss vdd vss inverter
//cPar_9_101 out_9_101 vss capacitor c=0.18e-15
xinv_9_101 out_9_101 out2_9_101 vdd vss vdd vss inverter
//cPar_9_102 out_9_102 vss capacitor c=0.18e-15
xinv_9_102 out_9_102 out2_9_102 vdd vss vdd vss inverter
//cPar_9_103 out_9_103 vss capacitor c=0.18e-15
xinv_9_103 out_9_103 out2_9_103 vdd vss vdd vss inverter
//cPar_9_104 out_9_104 vss capacitor c=0.18e-15
xinv_9_104 out_9_104 out2_9_104 vdd vss vdd vss inverter
//cPar_9_105 out_9_105 vss capacitor c=0.18e-15
xinv_9_105 out_9_105 out2_9_105 vdd vss vdd vss inverter
//cPar_9_106 out_9_106 vss capacitor c=0.18e-15
xinv_9_106 out_9_106 out2_9_106 vdd vss vdd vss inverter
//cPar_9_107 out_9_107 vss capacitor c=0.18e-15
xinv_9_107 out_9_107 out2_9_107 vdd vss vdd vss inverter
//cPar_9_108 out_9_108 vss capacitor c=0.18e-15
xinv_9_108 out_9_108 out2_9_108 vdd vss vdd vss inverter
//cPar_9_109 out_9_109 vss capacitor c=0.18e-15
xinv_9_109 out_9_109 out2_9_109 vdd vss vdd vss inverter
//cPar_9_110 out_9_110 vss capacitor c=0.18e-15
xinv_9_110 out_9_110 out2_9_110 vdd vss vdd vss inverter
//cPar_9_111 out_9_111 vss capacitor c=0.18e-15
xinv_9_111 out_9_111 out2_9_111 vdd vss vdd vss inverter
//cPar_9_112 out_9_112 vss capacitor c=0.18e-15
xinv_9_112 out_9_112 out2_9_112 vdd vss vdd vss inverter
//cPar_9_113 out_9_113 vss capacitor c=0.18e-15
xinv_9_113 out_9_113 out2_9_113 vdd vss vdd vss inverter
//cPar_9_114 out_9_114 vss capacitor c=0.18e-15
xinv_9_114 out_9_114 out2_9_114 vdd vss vdd vss inverter
//cPar_9_115 out_9_115 vss capacitor c=0.18e-15
xinv_9_115 out_9_115 out2_9_115 vdd vss vdd vss inverter
//cPar_9_116 out_9_116 vss capacitor c=0.18e-15
xinv_9_116 out_9_116 out2_9_116 vdd vss vdd vss inverter
//cPar_9_117 out_9_117 vss capacitor c=0.18e-15
xinv_9_117 out_9_117 out2_9_117 vdd vss vdd vss inverter
//cPar_9_118 out_9_118 vss capacitor c=0.18e-15
xinv_9_118 out_9_118 out2_9_118 vdd vss vdd vss inverter
//cPar_9_119 out_9_119 vss capacitor c=0.18e-15
xinv_9_119 out_9_119 out2_9_119 vdd vss vdd vss inverter
//cPar_9_120 out_9_120 vss capacitor c=0.18e-15
xinv_9_120 out_9_120 out2_9_120 vdd vss vdd vss inverter
//cPar_9_121 out_9_121 vss capacitor c=0.18e-15
xinv_9_121 out_9_121 out2_9_121 vdd vss vdd vss inverter
//cPar_9_122 out_9_122 vss capacitor c=0.18e-15
xinv_9_122 out_9_122 out2_9_122 vdd vss vdd vss inverter
//cPar_9_123 out_9_123 vss capacitor c=0.18e-15
xinv_9_123 out_9_123 out2_9_123 vdd vss vdd vss inverter
//cPar_9_124 out_9_124 vss capacitor c=0.18e-15
xinv_9_124 out_9_124 out2_9_124 vdd vss vdd vss inverter
//cPar_9_125 out_9_125 vss capacitor c=0.18e-15
xinv_9_125 out_9_125 out2_9_125 vdd vss vdd vss inverter
//cPar_9_126 out_9_126 vss capacitor c=0.18e-15
xinv_9_126 out_9_126 out2_9_126 vdd vss vdd vss inverter
//cPar_9_127 out_9_127 vss capacitor c=0.18e-15
xinv_9_127 out_9_127 out2_9_127 vdd vss vdd vss inverter
//cPar_9_128 out_9_128 vss capacitor c=0.18e-15
xinv_9_128 out_9_128 out2_9_128 vdd vss vdd vss inverter
//cPar_9_129 out_9_129 vss capacitor c=0.18e-15
xinv_9_129 out_9_129 out2_9_129 vdd vss vdd vss inverter
//cPar_9_130 out_9_130 vss capacitor c=0.18e-15
xinv_9_130 out_9_130 out2_9_130 vdd vss vdd vss inverter
//cPar_9_131 out_9_131 vss capacitor c=0.18e-15
xinv_9_131 out_9_131 out2_9_131 vdd vss vdd vss inverter
//cPar_9_132 out_9_132 vss capacitor c=0.18e-15
xinv_9_132 out_9_132 out2_9_132 vdd vss vdd vss inverter
//cPar_9_133 out_9_133 vss capacitor c=0.18e-15
xinv_9_133 out_9_133 out2_9_133 vdd vss vdd vss inverter
//cPar_9_134 out_9_134 vss capacitor c=0.18e-15
xinv_9_134 out_9_134 out2_9_134 vdd vss vdd vss inverter
//cPar_9_135 out_9_135 vss capacitor c=0.18e-15
xinv_9_135 out_9_135 out2_9_135 vdd vss vdd vss inverter
//cPar_9_136 out_9_136 vss capacitor c=0.18e-15
xinv_9_136 out_9_136 out2_9_136 vdd vss vdd vss inverter
//cPar_9_137 out_9_137 vss capacitor c=0.18e-15
xinv_9_137 out_9_137 out2_9_137 vdd vss vdd vss inverter
//cPar_9_138 out_9_138 vss capacitor c=0.18e-15
xinv_9_138 out_9_138 out2_9_138 vdd vss vdd vss inverter
//cPar_9_139 out_9_139 vss capacitor c=0.18e-15
xinv_9_139 out_9_139 out2_9_139 vdd vss vdd vss inverter
//cPar_9_140 out_9_140 vss capacitor c=0.18e-15
xinv_9_140 out_9_140 out2_9_140 vdd vss vdd vss inverter
//cPar_9_141 out_9_141 vss capacitor c=0.18e-15
xinv_9_141 out_9_141 out2_9_141 vdd vss vdd vss inverter
//cPar_9_142 out_9_142 vss capacitor c=0.18e-15
xinv_9_142 out_9_142 out2_9_142 vdd vss vdd vss inverter
//cPar_9_143 out_9_143 vss capacitor c=0.18e-15
xinv_9_143 out_9_143 out2_9_143 vdd vss vdd vss inverter
//cPar_9_144 out_9_144 vss capacitor c=0.18e-15
xinv_9_144 out_9_144 out2_9_144 vdd vss vdd vss inverter
//cPar_9_145 out_9_145 vss capacitor c=0.18e-15
xinv_9_145 out_9_145 out2_9_145 vdd vss vdd vss inverter
//cPar_9_146 out_9_146 vss capacitor c=0.18e-15
xinv_9_146 out_9_146 out2_9_146 vdd vss vdd vss inverter
//cPar_9_147 out_9_147 vss capacitor c=0.18e-15
xinv_9_147 out_9_147 out2_9_147 vdd vss vdd vss inverter
//cPar_9_148 out_9_148 vss capacitor c=0.18e-15
xinv_9_148 out_9_148 out2_9_148 vdd vss vdd vss inverter
//cPar_9_149 out_9_149 vss capacitor c=0.18e-15
xinv_9_149 out_9_149 out2_9_149 vdd vss vdd vss inverter
//cPar_9_150 out_9_150 vss capacitor c=0.18e-15
xinv_9_150 out_9_150 out2_9_150 vdd vss vdd vss inverter
//cPar_9_151 out_9_151 vss capacitor c=0.18e-15
xinv_9_151 out_9_151 out2_9_151 vdd vss vdd vss inverter
//cPar_9_152 out_9_152 vss capacitor c=0.18e-15
xinv_9_152 out_9_152 out2_9_152 vdd vss vdd vss inverter
//cPar_9_153 out_9_153 vss capacitor c=0.18e-15
xinv_9_153 out_9_153 out2_9_153 vdd vss vdd vss inverter
//cPar_9_154 out_9_154 vss capacitor c=0.18e-15
xinv_9_154 out_9_154 out2_9_154 vdd vss vdd vss inverter
//cPar_9_155 out_9_155 vss capacitor c=0.18e-15
xinv_9_155 out_9_155 out2_9_155 vdd vss vdd vss inverter
//cPar_9_156 out_9_156 vss capacitor c=0.18e-15
xinv_9_156 out_9_156 out2_9_156 vdd vss vdd vss inverter
//cPar_9_157 out_9_157 vss capacitor c=0.18e-15
xinv_9_157 out_9_157 out2_9_157 vdd vss vdd vss inverter
//cPar_9_158 out_9_158 vss capacitor c=0.18e-15
xinv_9_158 out_9_158 out2_9_158 vdd vss vdd vss inverter
//cPar_9_159 out_9_159 vss capacitor c=0.18e-15
xinv_9_159 out_9_159 out2_9_159 vdd vss vdd vss inverter
//cPar_9_160 out_9_160 vss capacitor c=0.18e-15
xinv_9_160 out_9_160 out2_9_160 vdd vss vdd vss inverter
//cPar_9_161 out_9_161 vss capacitor c=0.18e-15
xinv_9_161 out_9_161 out2_9_161 vdd vss vdd vss inverter
//cPar_9_162 out_9_162 vss capacitor c=0.18e-15
xinv_9_162 out_9_162 out2_9_162 vdd vss vdd vss inverter
//cPar_9_163 out_9_163 vss capacitor c=0.18e-15
xinv_9_163 out_9_163 out2_9_163 vdd vss vdd vss inverter
//cPar_9_164 out_9_164 vss capacitor c=0.18e-15
xinv_9_164 out_9_164 out2_9_164 vdd vss vdd vss inverter
//cPar_9_165 out_9_165 vss capacitor c=0.18e-15
xinv_9_165 out_9_165 out2_9_165 vdd vss vdd vss inverter
//cPar_9_166 out_9_166 vss capacitor c=0.18e-15
xinv_9_166 out_9_166 out2_9_166 vdd vss vdd vss inverter
//cPar_9_167 out_9_167 vss capacitor c=0.18e-15
xinv_9_167 out_9_167 out2_9_167 vdd vss vdd vss inverter
//cPar_9_168 out_9_168 vss capacitor c=0.18e-15
xinv_9_168 out_9_168 out2_9_168 vdd vss vdd vss inverter
//cPar_9_169 out_9_169 vss capacitor c=0.18e-15
xinv_9_169 out_9_169 out2_9_169 vdd vss vdd vss inverter
//cPar_9_170 out_9_170 vss capacitor c=0.18e-15
xinv_9_170 out_9_170 out2_9_170 vdd vss vdd vss inverter
//cPar_9_171 out_9_171 vss capacitor c=0.18e-15
xinv_9_171 out_9_171 out2_9_171 vdd vss vdd vss inverter
//cPar_9_172 out_9_172 vss capacitor c=0.18e-15
xinv_9_172 out_9_172 out2_9_172 vdd vss vdd vss inverter
//cPar_9_173 out_9_173 vss capacitor c=0.18e-15
xinv_9_173 out_9_173 out2_9_173 vdd vss vdd vss inverter
//cPar_9_174 out_9_174 vss capacitor c=0.18e-15
xinv_9_174 out_9_174 out2_9_174 vdd vss vdd vss inverter
//cPar_9_175 out_9_175 vss capacitor c=0.18e-15
xinv_9_175 out_9_175 out2_9_175 vdd vss vdd vss inverter
//cPar_9_176 out_9_176 vss capacitor c=0.18e-15
xinv_9_176 out_9_176 out2_9_176 vdd vss vdd vss inverter
//cPar_9_177 out_9_177 vss capacitor c=0.18e-15
xinv_9_177 out_9_177 out2_9_177 vdd vss vdd vss inverter
//cPar_9_178 out_9_178 vss capacitor c=0.18e-15
xinv_9_178 out_9_178 out2_9_178 vdd vss vdd vss inverter
//cPar_9_179 out_9_179 vss capacitor c=0.18e-15
xinv_9_179 out_9_179 out2_9_179 vdd vss vdd vss inverter
//cPar_9_180 out_9_180 vss capacitor c=0.18e-15
xinv_9_180 out_9_180 out2_9_180 vdd vss vdd vss inverter
//cPar_9_181 out_9_181 vss capacitor c=0.18e-15
xinv_9_181 out_9_181 out2_9_181 vdd vss vdd vss inverter
//cPar_9_182 out_9_182 vss capacitor c=0.18e-15
xinv_9_182 out_9_182 out2_9_182 vdd vss vdd vss inverter
//cPar_9_183 out_9_183 vss capacitor c=0.18e-15
xinv_9_183 out_9_183 out2_9_183 vdd vss vdd vss inverter
//cPar_9_184 out_9_184 vss capacitor c=0.18e-15
xinv_9_184 out_9_184 out2_9_184 vdd vss vdd vss inverter
//cPar_9_185 out_9_185 vss capacitor c=0.18e-15
xinv_9_185 out_9_185 out2_9_185 vdd vss vdd vss inverter
//cPar_9_186 out_9_186 vss capacitor c=0.18e-15
xinv_9_186 out_9_186 out2_9_186 vdd vss vdd vss inverter
//cPar_9_187 out_9_187 vss capacitor c=0.18e-15
xinv_9_187 out_9_187 out2_9_187 vdd vss vdd vss inverter
//cPar_9_188 out_9_188 vss capacitor c=0.18e-15
xinv_9_188 out_9_188 out2_9_188 vdd vss vdd vss inverter
//cPar_9_189 out_9_189 vss capacitor c=0.18e-15
xinv_9_189 out_9_189 out2_9_189 vdd vss vdd vss inverter
//cPar_9_190 out_9_190 vss capacitor c=0.18e-15
xinv_9_190 out_9_190 out2_9_190 vdd vss vdd vss inverter
//cPar_9_191 out_9_191 vss capacitor c=0.18e-15
xinv_9_191 out_9_191 out2_9_191 vdd vss vdd vss inverter
//cPar_9_192 out_9_192 vss capacitor c=0.18e-15
xinv_9_192 out_9_192 out2_9_192 vdd vss vdd vss inverter
//cPar_9_193 out_9_193 vss capacitor c=0.18e-15
xinv_9_193 out_9_193 out2_9_193 vdd vss vdd vss inverter
//cPar_9_194 out_9_194 vss capacitor c=0.18e-15
xinv_9_194 out_9_194 out2_9_194 vdd vss vdd vss inverter
//cPar_9_195 out_9_195 vss capacitor c=0.18e-15
xinv_9_195 out_9_195 out2_9_195 vdd vss vdd vss inverter
//cPar_9_196 out_9_196 vss capacitor c=0.18e-15
xinv_9_196 out_9_196 out2_9_196 vdd vss vdd vss inverter
//cPar_9_197 out_9_197 vss capacitor c=0.18e-15
xinv_9_197 out_9_197 out2_9_197 vdd vss vdd vss inverter
//cPar_9_198 out_9_198 vss capacitor c=0.18e-15
xinv_9_198 out_9_198 out2_9_198 vdd vss vdd vss inverter
//cPar_9_199 out_9_199 vss capacitor c=0.18e-15
xinv_9_199 out_9_199 out2_9_199 vdd vss vdd vss inverter
//cPar_9_200 out_9_200 vss capacitor c=0.18e-15
xinv_9_200 out_9_200 out2_9_200 vdd vss vdd vss inverter
//cPar_9_201 out_9_201 vss capacitor c=0.18e-15
xinv_9_201 out_9_201 out2_9_201 vdd vss vdd vss inverter
//cPar_9_202 out_9_202 vss capacitor c=0.18e-15
xinv_9_202 out_9_202 out2_9_202 vdd vss vdd vss inverter
//cPar_9_203 out_9_203 vss capacitor c=0.18e-15
xinv_9_203 out_9_203 out2_9_203 vdd vss vdd vss inverter
//cPar_9_204 out_9_204 vss capacitor c=0.18e-15
xinv_9_204 out_9_204 out2_9_204 vdd vss vdd vss inverter
//cPar_9_205 out_9_205 vss capacitor c=0.18e-15
xinv_9_205 out_9_205 out2_9_205 vdd vss vdd vss inverter
//cPar_9_206 out_9_206 vss capacitor c=0.18e-15
xinv_9_206 out_9_206 out2_9_206 vdd vss vdd vss inverter
//cPar_9_207 out_9_207 vss capacitor c=0.18e-15
xinv_9_207 out_9_207 out2_9_207 vdd vss vdd vss inverter
//cPar_9_208 out_9_208 vss capacitor c=0.18e-15
xinv_9_208 out_9_208 out2_9_208 vdd vss vdd vss inverter
//cPar_9_209 out_9_209 vss capacitor c=0.18e-15
xinv_9_209 out_9_209 out2_9_209 vdd vss vdd vss inverter
//cPar_9_210 out_9_210 vss capacitor c=0.18e-15
xinv_9_210 out_9_210 out2_9_210 vdd vss vdd vss inverter
//cPar_9_211 out_9_211 vss capacitor c=0.18e-15
xinv_9_211 out_9_211 out2_9_211 vdd vss vdd vss inverter
//cPar_9_212 out_9_212 vss capacitor c=0.18e-15
xinv_9_212 out_9_212 out2_9_212 vdd vss vdd vss inverter
//cPar_9_213 out_9_213 vss capacitor c=0.18e-15
xinv_9_213 out_9_213 out2_9_213 vdd vss vdd vss inverter
//cPar_9_214 out_9_214 vss capacitor c=0.18e-15
xinv_9_214 out_9_214 out2_9_214 vdd vss vdd vss inverter
//cPar_9_215 out_9_215 vss capacitor c=0.18e-15
xinv_9_215 out_9_215 out2_9_215 vdd vss vdd vss inverter
//cPar_9_216 out_9_216 vss capacitor c=0.18e-15
xinv_9_216 out_9_216 out2_9_216 vdd vss vdd vss inverter
//cPar_9_217 out_9_217 vss capacitor c=0.18e-15
xinv_9_217 out_9_217 out2_9_217 vdd vss vdd vss inverter
//cPar_9_218 out_9_218 vss capacitor c=0.18e-15
xinv_9_218 out_9_218 out2_9_218 vdd vss vdd vss inverter
//cPar_9_219 out_9_219 vss capacitor c=0.18e-15
xinv_9_219 out_9_219 out2_9_219 vdd vss vdd vss inverter
//cPar_9_220 out_9_220 vss capacitor c=0.18e-15
xinv_9_220 out_9_220 out2_9_220 vdd vss vdd vss inverter
//cPar_9_221 out_9_221 vss capacitor c=0.18e-15
xinv_9_221 out_9_221 out2_9_221 vdd vss vdd vss inverter
//cPar_9_222 out_9_222 vss capacitor c=0.18e-15
xinv_9_222 out_9_222 out2_9_222 vdd vss vdd vss inverter
//cPar_9_223 out_9_223 vss capacitor c=0.18e-15
xinv_9_223 out_9_223 out2_9_223 vdd vss vdd vss inverter
//cPar_9_224 out_9_224 vss capacitor c=0.18e-15
xinv_9_224 out_9_224 out2_9_224 vdd vss vdd vss inverter
//cPar_9_225 out_9_225 vss capacitor c=0.18e-15
xinv_9_225 out_9_225 out2_9_225 vdd vss vdd vss inverter
//cPar_9_226 out_9_226 vss capacitor c=0.18e-15
xinv_9_226 out_9_226 out2_9_226 vdd vss vdd vss inverter
//cPar_9_227 out_9_227 vss capacitor c=0.18e-15
xinv_9_227 out_9_227 out2_9_227 vdd vss vdd vss inverter
//cPar_9_228 out_9_228 vss capacitor c=0.18e-15
xinv_9_228 out_9_228 out2_9_228 vdd vss vdd vss inverter
//cPar_9_229 out_9_229 vss capacitor c=0.18e-15
xinv_9_229 out_9_229 out2_9_229 vdd vss vdd vss inverter
//cPar_9_230 out_9_230 vss capacitor c=0.18e-15
xinv_9_230 out_9_230 out2_9_230 vdd vss vdd vss inverter
//cPar_9_231 out_9_231 vss capacitor c=0.18e-15
xinv_9_231 out_9_231 out2_9_231 vdd vss vdd vss inverter
//cPar_9_232 out_9_232 vss capacitor c=0.18e-15
xinv_9_232 out_9_232 out2_9_232 vdd vss vdd vss inverter
//cPar_9_233 out_9_233 vss capacitor c=0.18e-15
xinv_9_233 out_9_233 out2_9_233 vdd vss vdd vss inverter
//cPar_9_234 out_9_234 vss capacitor c=0.18e-15
xinv_9_234 out_9_234 out2_9_234 vdd vss vdd vss inverter
//cPar_9_235 out_9_235 vss capacitor c=0.18e-15
xinv_9_235 out_9_235 out2_9_235 vdd vss vdd vss inverter
//cPar_9_236 out_9_236 vss capacitor c=0.18e-15
xinv_9_236 out_9_236 out2_9_236 vdd vss vdd vss inverter
//cPar_9_237 out_9_237 vss capacitor c=0.18e-15
xinv_9_237 out_9_237 out2_9_237 vdd vss vdd vss inverter
//cPar_9_238 out_9_238 vss capacitor c=0.18e-15
xinv_9_238 out_9_238 out2_9_238 vdd vss vdd vss inverter
//cPar_9_239 out_9_239 vss capacitor c=0.18e-15
xinv_9_239 out_9_239 out2_9_239 vdd vss vdd vss inverter
//cPar_9_240 out_9_240 vss capacitor c=0.18e-15
xinv_9_240 out_9_240 out2_9_240 vdd vss vdd vss inverter
//cPar_9_241 out_9_241 vss capacitor c=0.18e-15
xinv_9_241 out_9_241 out2_9_241 vdd vss vdd vss inverter
//cPar_9_242 out_9_242 vss capacitor c=0.18e-15
xinv_9_242 out_9_242 out2_9_242 vdd vss vdd vss inverter
//cPar_9_243 out_9_243 vss capacitor c=0.18e-15
xinv_9_243 out_9_243 out2_9_243 vdd vss vdd vss inverter
//cPar_9_244 out_9_244 vss capacitor c=0.18e-15
xinv_9_244 out_9_244 out2_9_244 vdd vss vdd vss inverter
//cPar_9_245 out_9_245 vss capacitor c=0.18e-15
xinv_9_245 out_9_245 out2_9_245 vdd vss vdd vss inverter
//cPar_9_246 out_9_246 vss capacitor c=0.18e-15
xinv_9_246 out_9_246 out2_9_246 vdd vss vdd vss inverter
//cPar_9_247 out_9_247 vss capacitor c=0.18e-15
xinv_9_247 out_9_247 out2_9_247 vdd vss vdd vss inverter
//cPar_9_248 out_9_248 vss capacitor c=0.18e-15
xinv_9_248 out_9_248 out2_9_248 vdd vss vdd vss inverter
//cPar_9_249 out_9_249 vss capacitor c=0.18e-15
xinv_9_249 out_9_249 out2_9_249 vdd vss vdd vss inverter
//cPar_9_250 out_9_250 vss capacitor c=0.18e-15
xinv_9_250 out_9_250 out2_9_250 vdd vss vdd vss inverter
//cPar_9_251 out_9_251 vss capacitor c=0.18e-15
xinv_9_251 out_9_251 out2_9_251 vdd vss vdd vss inverter
//cPar_9_252 out_9_252 vss capacitor c=0.18e-15
xinv_9_252 out_9_252 out2_9_252 vdd vss vdd vss inverter
//cPar_9_253 out_9_253 vss capacitor c=0.18e-15
xinv_9_253 out_9_253 out2_9_253 vdd vss vdd vss inverter
//cPar_9_254 out_9_254 vss capacitor c=0.18e-15
xinv_9_254 out_9_254 out2_9_254 vdd vss vdd vss inverter
//cPar_9_255 out_9_255 vss capacitor c=0.18e-15
xinv_9_255 out_9_255 out2_9_255 vdd vss vdd vss inverter
//cPar_9_256 out_9_256 vss capacitor c=0.18e-15
xinv_9_256 out_9_256 out2_9_256 vdd vss vdd vss inverter
//cPar_9_257 out_9_257 vss capacitor c=0.18e-15
xinv_9_257 out_9_257 out2_9_257 vdd vss vdd vss inverter
//cPar_9_258 out_9_258 vss capacitor c=0.18e-15
xinv_9_258 out_9_258 out2_9_258 vdd vss vdd vss inverter
//cPar_9_259 out_9_259 vss capacitor c=0.18e-15
xinv_9_259 out_9_259 out2_9_259 vdd vss vdd vss inverter
//cPar_9_260 out_9_260 vss capacitor c=0.18e-15
xinv_9_260 out_9_260 out2_9_260 vdd vss vdd vss inverter
//cPar_9_261 out_9_261 vss capacitor c=0.18e-15
xinv_9_261 out_9_261 out2_9_261 vdd vss vdd vss inverter
//cPar_9_262 out_9_262 vss capacitor c=0.18e-15
xinv_9_262 out_9_262 out2_9_262 vdd vss vdd vss inverter
//cPar_9_263 out_9_263 vss capacitor c=0.18e-15
xinv_9_263 out_9_263 out2_9_263 vdd vss vdd vss inverter
//cPar_9_264 out_9_264 vss capacitor c=0.18e-15
xinv_9_264 out_9_264 out2_9_264 vdd vss vdd vss inverter
//cPar_9_265 out_9_265 vss capacitor c=0.18e-15
xinv_9_265 out_9_265 out2_9_265 vdd vss vdd vss inverter
//cPar_9_266 out_9_266 vss capacitor c=0.18e-15
xinv_9_266 out_9_266 out2_9_266 vdd vss vdd vss inverter
//cPar_9_267 out_9_267 vss capacitor c=0.18e-15
xinv_9_267 out_9_267 out2_9_267 vdd vss vdd vss inverter
//cPar_9_268 out_9_268 vss capacitor c=0.18e-15
xinv_9_268 out_9_268 out2_9_268 vdd vss vdd vss inverter
//cPar_9_269 out_9_269 vss capacitor c=0.18e-15
xinv_9_269 out_9_269 out2_9_269 vdd vss vdd vss inverter
//cPar_9_270 out_9_270 vss capacitor c=0.18e-15
xinv_9_270 out_9_270 out2_9_270 vdd vss vdd vss inverter
//cPar_9_271 out_9_271 vss capacitor c=0.18e-15
xinv_9_271 out_9_271 out2_9_271 vdd vss vdd vss inverter
//cPar_9_272 out_9_272 vss capacitor c=0.18e-15
xinv_9_272 out_9_272 out2_9_272 vdd vss vdd vss inverter
//cPar_9_273 out_9_273 vss capacitor c=0.18e-15
xinv_9_273 out_9_273 out2_9_273 vdd vss vdd vss inverter
//cPar_9_274 out_9_274 vss capacitor c=0.18e-15
xinv_9_274 out_9_274 out2_9_274 vdd vss vdd vss inverter
//cPar_9_275 out_9_275 vss capacitor c=0.18e-15
xinv_9_275 out_9_275 out2_9_275 vdd vss vdd vss inverter
//cPar_9_276 out_9_276 vss capacitor c=0.18e-15
xinv_9_276 out_9_276 out2_9_276 vdd vss vdd vss inverter
//cPar_9_277 out_9_277 vss capacitor c=0.18e-15
xinv_9_277 out_9_277 out2_9_277 vdd vss vdd vss inverter
//cPar_9_278 out_9_278 vss capacitor c=0.18e-15
xinv_9_278 out_9_278 out2_9_278 vdd vss vdd vss inverter
//cPar_9_279 out_9_279 vss capacitor c=0.18e-15
xinv_9_279 out_9_279 out2_9_279 vdd vss vdd vss inverter
//cPar_9_280 out_9_280 vss capacitor c=0.18e-15
xinv_9_280 out_9_280 out2_9_280 vdd vss vdd vss inverter
//cPar_9_281 out_9_281 vss capacitor c=0.18e-15
xinv_9_281 out_9_281 out2_9_281 vdd vss vdd vss inverter
//cPar_9_282 out_9_282 vss capacitor c=0.18e-15
xinv_9_282 out_9_282 out2_9_282 vdd vss vdd vss inverter
//cPar_9_283 out_9_283 vss capacitor c=0.18e-15
xinv_9_283 out_9_283 out2_9_283 vdd vss vdd vss inverter
//cPar_9_284 out_9_284 vss capacitor c=0.18e-15
xinv_9_284 out_9_284 out2_9_284 vdd vss vdd vss inverter
//cPar_9_285 out_9_285 vss capacitor c=0.18e-15
xinv_9_285 out_9_285 out2_9_285 vdd vss vdd vss inverter
//cPar_9_286 out_9_286 vss capacitor c=0.18e-15
xinv_9_286 out_9_286 out2_9_286 vdd vss vdd vss inverter
//cPar_9_287 out_9_287 vss capacitor c=0.18e-15
xinv_9_287 out_9_287 out2_9_287 vdd vss vdd vss inverter
//cPar_9_288 out_9_288 vss capacitor c=0.18e-15
xinv_9_288 out_9_288 out2_9_288 vdd vss vdd vss inverter
//cPar_9_289 out_9_289 vss capacitor c=0.18e-15
xinv_9_289 out_9_289 out2_9_289 vdd vss vdd vss inverter
//cPar_9_290 out_9_290 vss capacitor c=0.18e-15
xinv_9_290 out_9_290 out2_9_290 vdd vss vdd vss inverter
//cPar_9_291 out_9_291 vss capacitor c=0.18e-15
xinv_9_291 out_9_291 out2_9_291 vdd vss vdd vss inverter
//cPar_9_292 out_9_292 vss capacitor c=0.18e-15
xinv_9_292 out_9_292 out2_9_292 vdd vss vdd vss inverter
//cPar_9_293 out_9_293 vss capacitor c=0.18e-15
xinv_9_293 out_9_293 out2_9_293 vdd vss vdd vss inverter
//cPar_9_294 out_9_294 vss capacitor c=0.18e-15
xinv_9_294 out_9_294 out2_9_294 vdd vss vdd vss inverter
//cPar_9_295 out_9_295 vss capacitor c=0.18e-15
xinv_9_295 out_9_295 out2_9_295 vdd vss vdd vss inverter
//cPar_9_296 out_9_296 vss capacitor c=0.18e-15
xinv_9_296 out_9_296 out2_9_296 vdd vss vdd vss inverter
//cPar_9_297 out_9_297 vss capacitor c=0.18e-15
xinv_9_297 out_9_297 out2_9_297 vdd vss vdd vss inverter
//cPar_9_298 out_9_298 vss capacitor c=0.18e-15
xinv_9_298 out_9_298 out2_9_298 vdd vss vdd vss inverter
//cPar_9_299 out_9_299 vss capacitor c=0.18e-15
xinv_9_299 out_9_299 out2_9_299 vdd vss vdd vss inverter
//cPar_9_300 out_9_300 vss capacitor c=0.18e-15
xinv_9_300 out_9_300 out2_9_300 vdd vss vdd vss inverter
//cPar_9_301 out_9_301 vss capacitor c=0.18e-15
xinv_9_301 out_9_301 out2_9_301 vdd vss vdd vss inverter
//cPar_9_302 out_9_302 vss capacitor c=0.18e-15
xinv_9_302 out_9_302 out2_9_302 vdd vss vdd vss inverter
//cPar_9_303 out_9_303 vss capacitor c=0.18e-15
xinv_9_303 out_9_303 out2_9_303 vdd vss vdd vss inverter
//cPar_9_304 out_9_304 vss capacitor c=0.18e-15
xinv_9_304 out_9_304 out2_9_304 vdd vss vdd vss inverter
//cPar_9_305 out_9_305 vss capacitor c=0.18e-15
xinv_9_305 out_9_305 out2_9_305 vdd vss vdd vss inverter
//cPar_9_306 out_9_306 vss capacitor c=0.18e-15
xinv_9_306 out_9_306 out2_9_306 vdd vss vdd vss inverter
//cPar_9_307 out_9_307 vss capacitor c=0.18e-15
xinv_9_307 out_9_307 out2_9_307 vdd vss vdd vss inverter
//cPar_9_308 out_9_308 vss capacitor c=0.18e-15
xinv_9_308 out_9_308 out2_9_308 vdd vss vdd vss inverter
//cPar_9_309 out_9_309 vss capacitor c=0.18e-15
xinv_9_309 out_9_309 out2_9_309 vdd vss vdd vss inverter
//cPar_9_310 out_9_310 vss capacitor c=0.18e-15
xinv_9_310 out_9_310 out2_9_310 vdd vss vdd vss inverter
//cPar_9_311 out_9_311 vss capacitor c=0.18e-15
xinv_9_311 out_9_311 out2_9_311 vdd vss vdd vss inverter
//cPar_9_312 out_9_312 vss capacitor c=0.18e-15
xinv_9_312 out_9_312 out2_9_312 vdd vss vdd vss inverter
//cPar_9_313 out_9_313 vss capacitor c=0.18e-15
xinv_9_313 out_9_313 out2_9_313 vdd vss vdd vss inverter
//cPar_9_314 out_9_314 vss capacitor c=0.18e-15
xinv_9_314 out_9_314 out2_9_314 vdd vss vdd vss inverter
//cPar_9_315 out_9_315 vss capacitor c=0.18e-15
xinv_9_315 out_9_315 out2_9_315 vdd vss vdd vss inverter
//cPar_9_316 out_9_316 vss capacitor c=0.18e-15
xinv_9_316 out_9_316 out2_9_316 vdd vss vdd vss inverter
//cPar_9_317 out_9_317 vss capacitor c=0.18e-15
xinv_9_317 out_9_317 out2_9_317 vdd vss vdd vss inverter
//cPar_9_318 out_9_318 vss capacitor c=0.18e-15
xinv_9_318 out_9_318 out2_9_318 vdd vss vdd vss inverter
//cPar_9_319 out_9_319 vss capacitor c=0.18e-15
xinv_9_319 out_9_319 out2_9_319 vdd vss vdd vss inverter
//cPar_9_320 out_9_320 vss capacitor c=0.18e-15
xinv_9_320 out_9_320 out2_9_320 vdd vss vdd vss inverter
//cPar_9_321 out_9_321 vss capacitor c=0.18e-15
xinv_9_321 out_9_321 out2_9_321 vdd vss vdd vss inverter
//cPar_9_322 out_9_322 vss capacitor c=0.18e-15
xinv_9_322 out_9_322 out2_9_322 vdd vss vdd vss inverter
//cPar_9_323 out_9_323 vss capacitor c=0.18e-15
xinv_9_323 out_9_323 out2_9_323 vdd vss vdd vss inverter
//cPar_9_324 out_9_324 vss capacitor c=0.18e-15
xinv_9_324 out_9_324 out2_9_324 vdd vss vdd vss inverter
//cPar_9_325 out_9_325 vss capacitor c=0.18e-15
xinv_9_325 out_9_325 out2_9_325 vdd vss vdd vss inverter
//cPar_9_326 out_9_326 vss capacitor c=0.18e-15
xinv_9_326 out_9_326 out2_9_326 vdd vss vdd vss inverter
//cPar_9_327 out_9_327 vss capacitor c=0.18e-15
xinv_9_327 out_9_327 out2_9_327 vdd vss vdd vss inverter
//cPar_9_328 out_9_328 vss capacitor c=0.18e-15
xinv_9_328 out_9_328 out2_9_328 vdd vss vdd vss inverter
//cPar_9_329 out_9_329 vss capacitor c=0.18e-15
xinv_9_329 out_9_329 out2_9_329 vdd vss vdd vss inverter
//cPar_9_330 out_9_330 vss capacitor c=0.18e-15
xinv_9_330 out_9_330 out2_9_330 vdd vss vdd vss inverter
//cPar_9_331 out_9_331 vss capacitor c=0.18e-15
xinv_9_331 out_9_331 out2_9_331 vdd vss vdd vss inverter
//cPar_9_332 out_9_332 vss capacitor c=0.18e-15
xinv_9_332 out_9_332 out2_9_332 vdd vss vdd vss inverter
//cPar_9_333 out_9_333 vss capacitor c=0.18e-15
xinv_9_333 out_9_333 out2_9_333 vdd vss vdd vss inverter
//cPar_9_334 out_9_334 vss capacitor c=0.18e-15
xinv_9_334 out_9_334 out2_9_334 vdd vss vdd vss inverter
//cPar_9_335 out_9_335 vss capacitor c=0.18e-15
xinv_9_335 out_9_335 out2_9_335 vdd vss vdd vss inverter
//cPar_9_336 out_9_336 vss capacitor c=0.18e-15
xinv_9_336 out_9_336 out2_9_336 vdd vss vdd vss inverter
//cPar_9_337 out_9_337 vss capacitor c=0.18e-15
xinv_9_337 out_9_337 out2_9_337 vdd vss vdd vss inverter
//cPar_9_338 out_9_338 vss capacitor c=0.18e-15
xinv_9_338 out_9_338 out2_9_338 vdd vss vdd vss inverter
//cPar_9_339 out_9_339 vss capacitor c=0.18e-15
xinv_9_339 out_9_339 out2_9_339 vdd vss vdd vss inverter
//cPar_9_340 out_9_340 vss capacitor c=0.18e-15
xinv_9_340 out_9_340 out2_9_340 vdd vss vdd vss inverter
//cPar_9_341 out_9_341 vss capacitor c=0.18e-15
xinv_9_341 out_9_341 out2_9_341 vdd vss vdd vss inverter
//cPar_9_342 out_9_342 vss capacitor c=0.18e-15
xinv_9_342 out_9_342 out2_9_342 vdd vss vdd vss inverter
//cPar_9_343 out_9_343 vss capacitor c=0.18e-15
xinv_9_343 out_9_343 out2_9_343 vdd vss vdd vss inverter
//cPar_9_344 out_9_344 vss capacitor c=0.18e-15
xinv_9_344 out_9_344 out2_9_344 vdd vss vdd vss inverter
//cPar_9_345 out_9_345 vss capacitor c=0.18e-15
xinv_9_345 out_9_345 out2_9_345 vdd vss vdd vss inverter
//cPar_9_346 out_9_346 vss capacitor c=0.18e-15
xinv_9_346 out_9_346 out2_9_346 vdd vss vdd vss inverter
//cPar_9_347 out_9_347 vss capacitor c=0.18e-15
xinv_9_347 out_9_347 out2_9_347 vdd vss vdd vss inverter
//cPar_9_348 out_9_348 vss capacitor c=0.18e-15
xinv_9_348 out_9_348 out2_9_348 vdd vss vdd vss inverter
//cPar_9_349 out_9_349 vss capacitor c=0.18e-15
xinv_9_349 out_9_349 out2_9_349 vdd vss vdd vss inverter
//cPar_9_350 out_9_350 vss capacitor c=0.18e-15
xinv_9_350 out_9_350 out2_9_350 vdd vss vdd vss inverter
//cPar_9_351 out_9_351 vss capacitor c=0.18e-15
xinv_9_351 out_9_351 out2_9_351 vdd vss vdd vss inverter
//cPar_9_352 out_9_352 vss capacitor c=0.18e-15
xinv_9_352 out_9_352 out2_9_352 vdd vss vdd vss inverter
//cPar_9_353 out_9_353 vss capacitor c=0.18e-15
xinv_9_353 out_9_353 out2_9_353 vdd vss vdd vss inverter
//cPar_9_354 out_9_354 vss capacitor c=0.18e-15
xinv_9_354 out_9_354 out2_9_354 vdd vss vdd vss inverter
//cPar_9_355 out_9_355 vss capacitor c=0.18e-15
xinv_9_355 out_9_355 out2_9_355 vdd vss vdd vss inverter
//cPar_9_356 out_9_356 vss capacitor c=0.18e-15
xinv_9_356 out_9_356 out2_9_356 vdd vss vdd vss inverter
//cPar_9_357 out_9_357 vss capacitor c=0.18e-15
xinv_9_357 out_9_357 out2_9_357 vdd vss vdd vss inverter
//cPar_9_358 out_9_358 vss capacitor c=0.18e-15
xinv_9_358 out_9_358 out2_9_358 vdd vss vdd vss inverter
//cPar_9_359 out_9_359 vss capacitor c=0.18e-15
xinv_9_359 out_9_359 out2_9_359 vdd vss vdd vss inverter
//cPar_9_360 out_9_360 vss capacitor c=0.18e-15
xinv_9_360 out_9_360 out2_9_360 vdd vss vdd vss inverter
//cPar_9_361 out_9_361 vss capacitor c=0.18e-15
xinv_9_361 out_9_361 out2_9_361 vdd vss vdd vss inverter
//cPar_9_362 out_9_362 vss capacitor c=0.18e-15
xinv_9_362 out_9_362 out2_9_362 vdd vss vdd vss inverter
//cPar_9_363 out_9_363 vss capacitor c=0.18e-15
xinv_9_363 out_9_363 out2_9_363 vdd vss vdd vss inverter
//cPar_9_364 out_9_364 vss capacitor c=0.18e-15
xinv_9_364 out_9_364 out2_9_364 vdd vss vdd vss inverter
//cPar_9_365 out_9_365 vss capacitor c=0.18e-15
xinv_9_365 out_9_365 out2_9_365 vdd vss vdd vss inverter
//cPar_9_366 out_9_366 vss capacitor c=0.18e-15
xinv_9_366 out_9_366 out2_9_366 vdd vss vdd vss inverter
//cPar_9_367 out_9_367 vss capacitor c=0.18e-15
xinv_9_367 out_9_367 out2_9_367 vdd vss vdd vss inverter
//cPar_9_368 out_9_368 vss capacitor c=0.18e-15
xinv_9_368 out_9_368 out2_9_368 vdd vss vdd vss inverter
//cPar_9_369 out_9_369 vss capacitor c=0.18e-15
xinv_9_369 out_9_369 out2_9_369 vdd vss vdd vss inverter
//cPar_9_370 out_9_370 vss capacitor c=0.18e-15
xinv_9_370 out_9_370 out2_9_370 vdd vss vdd vss inverter
//cPar_9_371 out_9_371 vss capacitor c=0.18e-15
xinv_9_371 out_9_371 out2_9_371 vdd vss vdd vss inverter
//cPar_9_372 out_9_372 vss capacitor c=0.18e-15
xinv_9_372 out_9_372 out2_9_372 vdd vss vdd vss inverter
//cPar_9_373 out_9_373 vss capacitor c=0.18e-15
xinv_9_373 out_9_373 out2_9_373 vdd vss vdd vss inverter
//cPar_9_374 out_9_374 vss capacitor c=0.18e-15
xinv_9_374 out_9_374 out2_9_374 vdd vss vdd vss inverter
//cPar_9_375 out_9_375 vss capacitor c=0.18e-15
xinv_9_375 out_9_375 out2_9_375 vdd vss vdd vss inverter
//cPar_9_376 out_9_376 vss capacitor c=0.18e-15
xinv_9_376 out_9_376 out2_9_376 vdd vss vdd vss inverter
//cPar_9_377 out_9_377 vss capacitor c=0.18e-15
xinv_9_377 out_9_377 out2_9_377 vdd vss vdd vss inverter
//cPar_9_378 out_9_378 vss capacitor c=0.18e-15
xinv_9_378 out_9_378 out2_9_378 vdd vss vdd vss inverter
//cPar_9_379 out_9_379 vss capacitor c=0.18e-15
xinv_9_379 out_9_379 out2_9_379 vdd vss vdd vss inverter
//cPar_9_380 out_9_380 vss capacitor c=0.18e-15
xinv_9_380 out_9_380 out2_9_380 vdd vss vdd vss inverter
//cPar_9_381 out_9_381 vss capacitor c=0.18e-15
xinv_9_381 out_9_381 out2_9_381 vdd vss vdd vss inverter
//cPar_9_382 out_9_382 vss capacitor c=0.18e-15
xinv_9_382 out_9_382 out2_9_382 vdd vss vdd vss inverter
//cPar_9_383 out_9_383 vss capacitor c=0.18e-15
xinv_9_383 out_9_383 out2_9_383 vdd vss vdd vss inverter
//cPar_9_384 out_9_384 vss capacitor c=0.18e-15
xinv_9_384 out_9_384 out2_9_384 vdd vss vdd vss inverter
//cPar_9_385 out_9_385 vss capacitor c=0.18e-15
xinv_9_385 out_9_385 out2_9_385 vdd vss vdd vss inverter
//cPar_9_386 out_9_386 vss capacitor c=0.18e-15
xinv_9_386 out_9_386 out2_9_386 vdd vss vdd vss inverter
//cPar_9_387 out_9_387 vss capacitor c=0.18e-15
xinv_9_387 out_9_387 out2_9_387 vdd vss vdd vss inverter
//cPar_9_388 out_9_388 vss capacitor c=0.18e-15
xinv_9_388 out_9_388 out2_9_388 vdd vss vdd vss inverter
//cPar_9_389 out_9_389 vss capacitor c=0.18e-15
xinv_9_389 out_9_389 out2_9_389 vdd vss vdd vss inverter
//cPar_9_390 out_9_390 vss capacitor c=0.18e-15
xinv_9_390 out_9_390 out2_9_390 vdd vss vdd vss inverter
//cPar_9_391 out_9_391 vss capacitor c=0.18e-15
xinv_9_391 out_9_391 out2_9_391 vdd vss vdd vss inverter
//cPar_9_392 out_9_392 vss capacitor c=0.18e-15
xinv_9_392 out_9_392 out2_9_392 vdd vss vdd vss inverter
//cPar_9_393 out_9_393 vss capacitor c=0.18e-15
xinv_9_393 out_9_393 out2_9_393 vdd vss vdd vss inverter
//cPar_9_394 out_9_394 vss capacitor c=0.18e-15
xinv_9_394 out_9_394 out2_9_394 vdd vss vdd vss inverter
//cPar_9_395 out_9_395 vss capacitor c=0.18e-15
xinv_9_395 out_9_395 out2_9_395 vdd vss vdd vss inverter
//cPar_9_396 out_9_396 vss capacitor c=0.18e-15
xinv_9_396 out_9_396 out2_9_396 vdd vss vdd vss inverter
//cPar_9_397 out_9_397 vss capacitor c=0.18e-15
xinv_9_397 out_9_397 out2_9_397 vdd vss vdd vss inverter
//cPar_9_398 out_9_398 vss capacitor c=0.18e-15
xinv_9_398 out_9_398 out2_9_398 vdd vss vdd vss inverter
//cPar_9_399 out_9_399 vss capacitor c=0.18e-15
xinv_9_399 out_9_399 out2_9_399 vdd vss vdd vss inverter
//cPar_9_400 out_9_400 vss capacitor c=0.18e-15
xinv_9_400 out_9_400 out2_9_400 vdd vss vdd vss inverter
//cPar_9_401 out_9_401 vss capacitor c=0.18e-15
xinv_9_401 out_9_401 out2_9_401 vdd vss vdd vss inverter
//cPar_9_402 out_9_402 vss capacitor c=0.18e-15
xinv_9_402 out_9_402 out2_9_402 vdd vss vdd vss inverter
//cPar_9_403 out_9_403 vss capacitor c=0.18e-15
xinv_9_403 out_9_403 out2_9_403 vdd vss vdd vss inverter
//cPar_9_404 out_9_404 vss capacitor c=0.18e-15
xinv_9_404 out_9_404 out2_9_404 vdd vss vdd vss inverter
//cPar_9_405 out_9_405 vss capacitor c=0.18e-15
xinv_9_405 out_9_405 out2_9_405 vdd vss vdd vss inverter
//cPar_9_406 out_9_406 vss capacitor c=0.18e-15
xinv_9_406 out_9_406 out2_9_406 vdd vss vdd vss inverter
//cPar_9_407 out_9_407 vss capacitor c=0.18e-15
xinv_9_407 out_9_407 out2_9_407 vdd vss vdd vss inverter
//cPar_9_408 out_9_408 vss capacitor c=0.18e-15
xinv_9_408 out_9_408 out2_9_408 vdd vss vdd vss inverter
//cPar_9_409 out_9_409 vss capacitor c=0.18e-15
xinv_9_409 out_9_409 out2_9_409 vdd vss vdd vss inverter
//cPar_9_410 out_9_410 vss capacitor c=0.18e-15
xinv_9_410 out_9_410 out2_9_410 vdd vss vdd vss inverter
//cPar_9_411 out_9_411 vss capacitor c=0.18e-15
xinv_9_411 out_9_411 out2_9_411 vdd vss vdd vss inverter
//cPar_9_412 out_9_412 vss capacitor c=0.18e-15
xinv_9_412 out_9_412 out2_9_412 vdd vss vdd vss inverter
//cPar_9_413 out_9_413 vss capacitor c=0.18e-15
xinv_9_413 out_9_413 out2_9_413 vdd vss vdd vss inverter
//cPar_9_414 out_9_414 vss capacitor c=0.18e-15
xinv_9_414 out_9_414 out2_9_414 vdd vss vdd vss inverter
//cPar_9_415 out_9_415 vss capacitor c=0.18e-15
xinv_9_415 out_9_415 out2_9_415 vdd vss vdd vss inverter
//cPar_9_416 out_9_416 vss capacitor c=0.18e-15
xinv_9_416 out_9_416 out2_9_416 vdd vss vdd vss inverter
//cPar_9_417 out_9_417 vss capacitor c=0.18e-15
xinv_9_417 out_9_417 out2_9_417 vdd vss vdd vss inverter
//cPar_9_418 out_9_418 vss capacitor c=0.18e-15
xinv_9_418 out_9_418 out2_9_418 vdd vss vdd vss inverter
//cPar_9_419 out_9_419 vss capacitor c=0.18e-15
xinv_9_419 out_9_419 out2_9_419 vdd vss vdd vss inverter
//cPar_9_420 out_9_420 vss capacitor c=0.18e-15
xinv_9_420 out_9_420 out2_9_420 vdd vss vdd vss inverter
//cPar_9_421 out_9_421 vss capacitor c=0.18e-15
xinv_9_421 out_9_421 out2_9_421 vdd vss vdd vss inverter
//cPar_9_422 out_9_422 vss capacitor c=0.18e-15
xinv_9_422 out_9_422 out2_9_422 vdd vss vdd vss inverter
//cPar_9_423 out_9_423 vss capacitor c=0.18e-15
xinv_9_423 out_9_423 out2_9_423 vdd vss vdd vss inverter
//cPar_9_424 out_9_424 vss capacitor c=0.18e-15
xinv_9_424 out_9_424 out2_9_424 vdd vss vdd vss inverter
//cPar_9_425 out_9_425 vss capacitor c=0.18e-15
xinv_9_425 out_9_425 out2_9_425 vdd vss vdd vss inverter
//cPar_9_426 out_9_426 vss capacitor c=0.18e-15
xinv_9_426 out_9_426 out2_9_426 vdd vss vdd vss inverter
//cPar_9_427 out_9_427 vss capacitor c=0.18e-15
xinv_9_427 out_9_427 out2_9_427 vdd vss vdd vss inverter
//cPar_9_428 out_9_428 vss capacitor c=0.18e-15
xinv_9_428 out_9_428 out2_9_428 vdd vss vdd vss inverter
//cPar_9_429 out_9_429 vss capacitor c=0.18e-15
xinv_9_429 out_9_429 out2_9_429 vdd vss vdd vss inverter
//cPar_9_430 out_9_430 vss capacitor c=0.18e-15
xinv_9_430 out_9_430 out2_9_430 vdd vss vdd vss inverter
//cPar_9_431 out_9_431 vss capacitor c=0.18e-15
xinv_9_431 out_9_431 out2_9_431 vdd vss vdd vss inverter
//cPar_9_432 out_9_432 vss capacitor c=0.18e-15
xinv_9_432 out_9_432 out2_9_432 vdd vss vdd vss inverter
//cPar_9_433 out_9_433 vss capacitor c=0.18e-15
xinv_9_433 out_9_433 out2_9_433 vdd vss vdd vss inverter
//cPar_9_434 out_9_434 vss capacitor c=0.18e-15
xinv_9_434 out_9_434 out2_9_434 vdd vss vdd vss inverter
//cPar_9_435 out_9_435 vss capacitor c=0.18e-15
xinv_9_435 out_9_435 out2_9_435 vdd vss vdd vss inverter
//cPar_9_436 out_9_436 vss capacitor c=0.18e-15
xinv_9_436 out_9_436 out2_9_436 vdd vss vdd vss inverter
//cPar_9_437 out_9_437 vss capacitor c=0.18e-15
xinv_9_437 out_9_437 out2_9_437 vdd vss vdd vss inverter
//cPar_9_438 out_9_438 vss capacitor c=0.18e-15
xinv_9_438 out_9_438 out2_9_438 vdd vss vdd vss inverter
//cPar_9_439 out_9_439 vss capacitor c=0.18e-15
xinv_9_439 out_9_439 out2_9_439 vdd vss vdd vss inverter
//cPar_9_440 out_9_440 vss capacitor c=0.18e-15
xinv_9_440 out_9_440 out2_9_440 vdd vss vdd vss inverter
//cPar_9_441 out_9_441 vss capacitor c=0.18e-15
xinv_9_441 out_9_441 out2_9_441 vdd vss vdd vss inverter
//cPar_9_442 out_9_442 vss capacitor c=0.18e-15
xinv_9_442 out_9_442 out2_9_442 vdd vss vdd vss inverter
//cPar_9_443 out_9_443 vss capacitor c=0.18e-15
xinv_9_443 out_9_443 out2_9_443 vdd vss vdd vss inverter
//cPar_9_444 out_9_444 vss capacitor c=0.18e-15
xinv_9_444 out_9_444 out2_9_444 vdd vss vdd vss inverter
//cPar_9_445 out_9_445 vss capacitor c=0.18e-15
xinv_9_445 out_9_445 out2_9_445 vdd vss vdd vss inverter
//cPar_9_446 out_9_446 vss capacitor c=0.18e-15
xinv_9_446 out_9_446 out2_9_446 vdd vss vdd vss inverter
//cPar_9_447 out_9_447 vss capacitor c=0.18e-15
xinv_9_447 out_9_447 out2_9_447 vdd vss vdd vss inverter
//cPar_9_448 out_9_448 vss capacitor c=0.18e-15
xinv_9_448 out_9_448 out2_9_448 vdd vss vdd vss inverter
//cPar_9_449 out_9_449 vss capacitor c=0.18e-15
xinv_9_449 out_9_449 out2_9_449 vdd vss vdd vss inverter
//cPar_9_450 out_9_450 vss capacitor c=0.18e-15
xinv_9_450 out_9_450 out2_9_450 vdd vss vdd vss inverter
//cPar_9_451 out_9_451 vss capacitor c=0.18e-15
xinv_9_451 out_9_451 out2_9_451 vdd vss vdd vss inverter
//cPar_9_452 out_9_452 vss capacitor c=0.18e-15
xinv_9_452 out_9_452 out2_9_452 vdd vss vdd vss inverter
//cPar_9_453 out_9_453 vss capacitor c=0.18e-15
xinv_9_453 out_9_453 out2_9_453 vdd vss vdd vss inverter
//cPar_9_454 out_9_454 vss capacitor c=0.18e-15
xinv_9_454 out_9_454 out2_9_454 vdd vss vdd vss inverter
//cPar_9_455 out_9_455 vss capacitor c=0.18e-15
xinv_9_455 out_9_455 out2_9_455 vdd vss vdd vss inverter
//cPar_9_456 out_9_456 vss capacitor c=0.18e-15
xinv_9_456 out_9_456 out2_9_456 vdd vss vdd vss inverter
//cPar_9_457 out_9_457 vss capacitor c=0.18e-15
xinv_9_457 out_9_457 out2_9_457 vdd vss vdd vss inverter
//cPar_9_458 out_9_458 vss capacitor c=0.18e-15
xinv_9_458 out_9_458 out2_9_458 vdd vss vdd vss inverter
//cPar_9_459 out_9_459 vss capacitor c=0.18e-15
xinv_9_459 out_9_459 out2_9_459 vdd vss vdd vss inverter
//cPar_9_460 out_9_460 vss capacitor c=0.18e-15
xinv_9_460 out_9_460 out2_9_460 vdd vss vdd vss inverter
//cPar_9_461 out_9_461 vss capacitor c=0.18e-15
xinv_9_461 out_9_461 out2_9_461 vdd vss vdd vss inverter
//cPar_9_462 out_9_462 vss capacitor c=0.18e-15
xinv_9_462 out_9_462 out2_9_462 vdd vss vdd vss inverter
//cPar_9_463 out_9_463 vss capacitor c=0.18e-15
xinv_9_463 out_9_463 out2_9_463 vdd vss vdd vss inverter
//cPar_9_464 out_9_464 vss capacitor c=0.18e-15
xinv_9_464 out_9_464 out2_9_464 vdd vss vdd vss inverter
//cPar_9_465 out_9_465 vss capacitor c=0.18e-15
xinv_9_465 out_9_465 out2_9_465 vdd vss vdd vss inverter
//cPar_9_466 out_9_466 vss capacitor c=0.18e-15
xinv_9_466 out_9_466 out2_9_466 vdd vss vdd vss inverter
//cPar_9_467 out_9_467 vss capacitor c=0.18e-15
xinv_9_467 out_9_467 out2_9_467 vdd vss vdd vss inverter
//cPar_9_468 out_9_468 vss capacitor c=0.18e-15
xinv_9_468 out_9_468 out2_9_468 vdd vss vdd vss inverter
//cPar_9_469 out_9_469 vss capacitor c=0.18e-15
xinv_9_469 out_9_469 out2_9_469 vdd vss vdd vss inverter
//cPar_9_470 out_9_470 vss capacitor c=0.18e-15
xinv_9_470 out_9_470 out2_9_470 vdd vss vdd vss inverter
//cPar_9_471 out_9_471 vss capacitor c=0.18e-15
xinv_9_471 out_9_471 out2_9_471 vdd vss vdd vss inverter
//cPar_9_472 out_9_472 vss capacitor c=0.18e-15
xinv_9_472 out_9_472 out2_9_472 vdd vss vdd vss inverter
//cPar_9_473 out_9_473 vss capacitor c=0.18e-15
xinv_9_473 out_9_473 out2_9_473 vdd vss vdd vss inverter
//cPar_9_474 out_9_474 vss capacitor c=0.18e-15
xinv_9_474 out_9_474 out2_9_474 vdd vss vdd vss inverter
//cPar_9_475 out_9_475 vss capacitor c=0.18e-15
xinv_9_475 out_9_475 out2_9_475 vdd vss vdd vss inverter
//cPar_9_476 out_9_476 vss capacitor c=0.18e-15
xinv_9_476 out_9_476 out2_9_476 vdd vss vdd vss inverter
//cPar_9_477 out_9_477 vss capacitor c=0.18e-15
xinv_9_477 out_9_477 out2_9_477 vdd vss vdd vss inverter
//cPar_9_478 out_9_478 vss capacitor c=0.18e-15
xinv_9_478 out_9_478 out2_9_478 vdd vss vdd vss inverter
//cPar_9_479 out_9_479 vss capacitor c=0.18e-15
xinv_9_479 out_9_479 out2_9_479 vdd vss vdd vss inverter
//cPar_9_480 out_9_480 vss capacitor c=0.18e-15
xinv_9_480 out_9_480 out2_9_480 vdd vss vdd vss inverter
//cPar_9_481 out_9_481 vss capacitor c=0.18e-15
xinv_9_481 out_9_481 out2_9_481 vdd vss vdd vss inverter
//cPar_9_482 out_9_482 vss capacitor c=0.18e-15
xinv_9_482 out_9_482 out2_9_482 vdd vss vdd vss inverter
//cPar_9_483 out_9_483 vss capacitor c=0.18e-15
xinv_9_483 out_9_483 out2_9_483 vdd vss vdd vss inverter
//cPar_9_484 out_9_484 vss capacitor c=0.18e-15
xinv_9_484 out_9_484 out2_9_484 vdd vss vdd vss inverter
//cPar_9_485 out_9_485 vss capacitor c=0.18e-15
xinv_9_485 out_9_485 out2_9_485 vdd vss vdd vss inverter
//cPar_9_486 out_9_486 vss capacitor c=0.18e-15
xinv_9_486 out_9_486 out2_9_486 vdd vss vdd vss inverter
//cPar_9_487 out_9_487 vss capacitor c=0.18e-15
xinv_9_487 out_9_487 out2_9_487 vdd vss vdd vss inverter
//cPar_9_488 out_9_488 vss capacitor c=0.18e-15
xinv_9_488 out_9_488 out2_9_488 vdd vss vdd vss inverter
//cPar_9_489 out_9_489 vss capacitor c=0.18e-15
xinv_9_489 out_9_489 out2_9_489 vdd vss vdd vss inverter
//cPar_9_490 out_9_490 vss capacitor c=0.18e-15
xinv_9_490 out_9_490 out2_9_490 vdd vss vdd vss inverter
//cPar_9_491 out_9_491 vss capacitor c=0.18e-15
xinv_9_491 out_9_491 out2_9_491 vdd vss vdd vss inverter
//cPar_9_492 out_9_492 vss capacitor c=0.18e-15
xinv_9_492 out_9_492 out2_9_492 vdd vss vdd vss inverter
//cPar_9_493 out_9_493 vss capacitor c=0.18e-15
xinv_9_493 out_9_493 out2_9_493 vdd vss vdd vss inverter
//cPar_9_494 out_9_494 vss capacitor c=0.18e-15
xinv_9_494 out_9_494 out2_9_494 vdd vss vdd vss inverter
//cPar_9_495 out_9_495 vss capacitor c=0.18e-15
xinv_9_495 out_9_495 out2_9_495 vdd vss vdd vss inverter
//cPar_9_496 out_9_496 vss capacitor c=0.18e-15
xinv_9_496 out_9_496 out2_9_496 vdd vss vdd vss inverter
//cPar_9_497 out_9_497 vss capacitor c=0.18e-15
xinv_9_497 out_9_497 out2_9_497 vdd vss vdd vss inverter
//cPar_9_498 out_9_498 vss capacitor c=0.18e-15
xinv_9_498 out_9_498 out2_9_498 vdd vss vdd vss inverter
//cPar_9_499 out_9_499 vss capacitor c=0.18e-15
xinv_9_499 out_9_499 out2_9_499 vdd vss vdd vss inverter
//cPar_9_500 out_9_500 vss capacitor c=0.18e-15
xinv_9_500 out_9_500 out2_9_500 vdd vss vdd vss inverter
//cPar_9_501 out_9_501 vss capacitor c=0.18e-15
xinv_9_501 out_9_501 out2_9_501 vdd vss vdd vss inverter
//cPar_9_502 out_9_502 vss capacitor c=0.18e-15
xinv_9_502 out_9_502 out2_9_502 vdd vss vdd vss inverter
//cPar_9_503 out_9_503 vss capacitor c=0.18e-15
xinv_9_503 out_9_503 out2_9_503 vdd vss vdd vss inverter
//cPar_9_504 out_9_504 vss capacitor c=0.18e-15
xinv_9_504 out_9_504 out2_9_504 vdd vss vdd vss inverter
//cPar_9_505 out_9_505 vss capacitor c=0.18e-15
xinv_9_505 out_9_505 out2_9_505 vdd vss vdd vss inverter
//cPar_9_506 out_9_506 vss capacitor c=0.18e-15
xinv_9_506 out_9_506 out2_9_506 vdd vss vdd vss inverter
//cPar_9_507 out_9_507 vss capacitor c=0.18e-15
xinv_9_507 out_9_507 out2_9_507 vdd vss vdd vss inverter
//cPar_9_508 out_9_508 vss capacitor c=0.18e-15
xinv_9_508 out_9_508 out2_9_508 vdd vss vdd vss inverter
//cPar_9_509 out_9_509 vss capacitor c=0.18e-15
xinv_9_509 out_9_509 out2_9_509 vdd vss vdd vss inverter
//cPar_9_510 out_9_510 vss capacitor c=0.18e-15
xinv_9_510 out_9_510 out2_9_510 vdd vss vdd vss inverter
//cPar_9_511 out_9_511 vss capacitor c=0.18e-15
xinv_9_511 out_9_511 out2_9_511 vdd vss vdd vss inverter
save out_9_2
save out_9_2
save vvdd_9:p
save in