
simulator lang=spectre

include "transistorsPTM.scs"
include "globalblock.sp"
include "drivers.sp"
include "parameters.sp"

xDrivers (vdd vss NBulkLine PBulkLine
+ BLenc_start_0 BLenc_start_1
+ WLenc_start_0 WLenc_start_1 WLenc_start_2 WLenc_start_3 WLenc_start_4 WLenc_start_5
+ BLenc_0_0_0 BLenc_0_0_1 BLenc_0_1_0 BLenc_0_1_1
+ WLenc_0_0_0 WLenc_0_0_1 WLenc_0_0_2 WLenc_0_0_3 WLenc_0_0_4 WLenc_0_0_5 WLenc_0_1_0 WLenc_0_1_1 WLenc_0_1_2 WLenc_0_1_3 WLenc_0_1_4 WLenc_0_1_5
+ GBenable_0
+ LBenable_0 LBenable_1) drivers

xNot_0_0 (GBenable_0 GBenable_0_1 vdd vss PBulkLine NBulkLine) inverter
xNot_1_0 (GBenable_0_1 GBenable_0_2 vdd vss PBulkLine NBulkLine) inverter
xNot_2_0 (GBenable_0_2 GBenable_0_3 vdd vss PBulkLine NBulkLine) inverter
xNot_3_0 (GBenable_0_3 GBenable_0_4 vdd vss PBulkLine NBulkLine) inverter
xNot_4_0 (GBenable_0_4 GBenable_0_5 vdd vss PBulkLine NBulkLine) inverter
xNot_0_5 (GBenable_0_5 Delay vdd vss PBulkLine NBulkLine) inverter


xGB0 (vdd vss NBulkLine PBulkLine
+WLenc_0_0_0 WLenc_0_0_1 WLenc_0_0_2 WLenc_0_0_3 WLenc_0_0_4 WLenc_0_0_5 WLenc_0_1_0 WLenc_0_1_1 WLenc_0_1_2 WLenc_0_1_3 WLenc_0_1_4 WLenc_0_1_5
+BLenc_0_0_0 BLenc_0_0_1 BLenc_0_1_0 BLenc_0_1_1
+LBenable_0 LBenable_1
+InOut InOutbar EnableSAP EnableSAN
+RefWL_0 RefWL_1 RefWL_2 RefWL_3 RefWL_4 RefWL_5 RefWL_6 RefWL_7 RefWL_8 RefWL_9 RefWL_10 RefWL_11 RefWL_12 RefWL_13 RefWL_14 RefWL_15 RefWL_16 RefWL_17 RefWL_18 RefWL_19 RefWL_20 RefWL_21 RefWL_22 RefWL_23 RefWL_24 RefWL_25 RefWL_26 RefWL_27 RefWL_28 RefWL_29 RefWL_30 RefWL_31 RefWL_32 RefWL_33 RefWL_34 RefWL_35 RefWL_36 RefWL_37 RefWL_38 RefWL_39 RefWL_40 RefWL_41 RefWL_42 RefWL_43 RefWL_44 RefWL_45 RefWL_46 RefWL_47 RefWL_48 RefWL_49 RefWL_50 RefWL_51 RefWL_52 RefWL_53 RefWL_54 RefWL_55 RefWL_56 RefWL_57 RefWL_58 RefWL_59 RefWL_60 RefWL_61 RefWL_62 RefWL_63 RefSourceSelect RefCharge RefDischarge PassRef Delay)       
+globalblock Rcell_0_0_0 = Rcell_0_0_0_0 Rcell_0_0_1 = Rcell_0_0_0_1 Rcell_0_0_2 = Rcell_0_0_0_2 Rcell_0_0_3 = Rcell_0_0_0_3 Rcell_0_0_4 = Rcell_0_0_0_4 Rcell_0_0_5 = Rcell_0_0_0_5 Rcell_0_0_6 = Rcell_0_0_0_6 Rcell_0_0_7 = Rcell_0_0_0_7 Rcell_0_0_8 = Rcell_0_0_0_8 Rcell_0_0_9 = Rcell_0_0_0_9 Rcell_0_0_10 = Rcell_0_0_0_10 Rcell_0_0_11 = Rcell_0_0_0_11 Rcell_0_0_12 = Rcell_0_0_0_12 Rcell_0_0_13 = Rcell_0_0_0_13 Rcell_0_0_14 = Rcell_0_0_0_14 Rcell_0_0_15 = Rcell_0_0_0_15 Rcell_0_0_16 = Rcell_0_0_0_16 Rcell_0_0_17 = Rcell_0_0_0_17 Rcell_0_0_18 = Rcell_0_0_0_18 Rcell_0_0_19 = Rcell_0_0_0_19 Rcell_0_0_20 = Rcell_0_0_0_20 Rcell_0_0_21 = Rcell_0_0_0_21 Rcell_0_0_22 = Rcell_0_0_0_22 Rcell_0_0_23 = Rcell_0_0_0_23 Rcell_0_0_24 = Rcell_0_0_0_24 Rcell_0_0_25 = Rcell_0_0_0_25 Rcell_0_0_26 = Rcell_0_0_0_26 Rcell_0_0_27 = Rcell_0_0_0_27 Rcell_0_0_28 = Rcell_0_0_0_28 Rcell_0_0_29 = Rcell_0_0_0_29 Rcell_0_0_30 = Rcell_0_0_0_30 Rcell_0_0_31 = Rcell_0_0_0_31 Rcell_0_0_32 = Rcell_0_0_0_32 Rcell_0_0_33 = Rcell_0_0_0_33 Rcell_0_0_34 = Rcell_0_0_0_34 Rcell_0_0_35 = Rcell_0_0_0_35 Rcell_0_0_36 = Rcell_0_0_0_36 Rcell_0_0_37 = Rcell_0_0_0_37 Rcell_0_0_38 = Rcell_0_0_0_38 Rcell_0_0_39 = Rcell_0_0_0_39 Rcell_0_0_40 = Rcell_0_0_0_40 Rcell_0_0_41 = Rcell_0_0_0_41 Rcell_0_0_42 = Rcell_0_0_0_42 Rcell_0_0_43 = Rcell_0_0_0_43 Rcell_0_0_44 = Rcell_0_0_0_44 Rcell_0_0_45 = Rcell_0_0_0_45 Rcell_0_0_46 = Rcell_0_0_0_46 Rcell_0_0_47 = Rcell_0_0_0_47 Rcell_0_0_48 = Rcell_0_0_0_48 Rcell_0_0_49 = Rcell_0_0_0_49 Rcell_0_0_50 = Rcell_0_0_0_50 Rcell_0_0_51 = Rcell_0_0_0_51 Rcell_0_0_52 = Rcell_0_0_0_52 Rcell_0_0_53 = Rcell_0_0_0_53 Rcell_0_0_54 = Rcell_0_0_0_54 Rcell_0_0_55 = Rcell_0_0_0_55 Rcell_0_0_56 = Rcell_0_0_0_56 Rcell_0_0_57 = Rcell_0_0_0_57 Rcell_0_0_58 = Rcell_0_0_0_58 Rcell_0_0_59 = Rcell_0_0_0_59 Rcell_0_0_60 = Rcell_0_0_0_60 Rcell_0_0_61 = Rcell_0_0_0_61 Rcell_0_0_62 = Rcell_0_0_0_62 Rcell_0_0_63 = Rcell_0_0_0_63 Rcell_0_1_0 = Rcell_0_0_1_0 Rcell_0_1_1 = Rcell_0_0_1_1 Rcell_0_1_2 = Rcell_0_0_1_2 Rcell_0_1_3 = Rcell_0_0_1_3 Rcell_0_1_4 = Rcell_0_0_1_4 Rcell_0_1_5 = Rcell_0_0_1_5 Rcell_0_1_6 = Rcell_0_0_1_6 Rcell_0_1_7 = Rcell_0_0_1_7 Rcell_0_1_8 = Rcell_0_0_1_8 Rcell_0_1_9 = Rcell_0_0_1_9 Rcell_0_1_10 = Rcell_0_0_1_10 Rcell_0_1_11 = Rcell_0_0_1_11 Rcell_0_1_12 = Rcell_0_0_1_12 Rcell_0_1_13 = Rcell_0_0_1_13 Rcell_0_1_14 = Rcell_0_0_1_14 Rcell_0_1_15 = Rcell_0_0_1_15 Rcell_0_1_16 = Rcell_0_0_1_16 Rcell_0_1_17 = Rcell_0_0_1_17 Rcell_0_1_18 = Rcell_0_0_1_18 Rcell_0_1_19 = Rcell_0_0_1_19 Rcell_0_1_20 = Rcell_0_0_1_20 Rcell_0_1_21 = Rcell_0_0_1_21 Rcell_0_1_22 = Rcell_0_0_1_22 Rcell_0_1_23 = Rcell_0_0_1_23 Rcell_0_1_24 = Rcell_0_0_1_24 Rcell_0_1_25 = Rcell_0_0_1_25 Rcell_0_1_26 = Rcell_0_0_1_26 Rcell_0_1_27 = Rcell_0_0_1_27 Rcell_0_1_28 = Rcell_0_0_1_28 Rcell_0_1_29 = Rcell_0_0_1_29 Rcell_0_1_30 = Rcell_0_0_1_30 Rcell_0_1_31 = Rcell_0_0_1_31 Rcell_0_1_32 = Rcell_0_0_1_32 Rcell_0_1_33 = Rcell_0_0_1_33 Rcell_0_1_34 = Rcell_0_0_1_34 Rcell_0_1_35 = Rcell_0_0_1_35 Rcell_0_1_36 = Rcell_0_0_1_36 Rcell_0_1_37 = Rcell_0_0_1_37 Rcell_0_1_38 = Rcell_0_0_1_38 Rcell_0_1_39 = Rcell_0_0_1_39 Rcell_0_1_40 = Rcell_0_0_1_40 Rcell_0_1_41 = Rcell_0_0_1_41 Rcell_0_1_42 = Rcell_0_0_1_42 Rcell_0_1_43 = Rcell_0_0_1_43 Rcell_0_1_44 = Rcell_0_0_1_44 Rcell_0_1_45 = Rcell_0_0_1_45 Rcell_0_1_46 = Rcell_0_0_1_46 Rcell_0_1_47 = Rcell_0_0_1_47 Rcell_0_1_48 = Rcell_0_0_1_48 Rcell_0_1_49 = Rcell_0_0_1_49 Rcell_0_1_50 = Rcell_0_0_1_50 Rcell_0_1_51 = Rcell_0_0_1_51 Rcell_0_1_52 = Rcell_0_0_1_52 Rcell_0_1_53 = Rcell_0_0_1_53 Rcell_0_1_54 = Rcell_0_0_1_54 Rcell_0_1_55 = Rcell_0_0_1_55 Rcell_0_1_56 = Rcell_0_0_1_56 Rcell_0_1_57 = Rcell_0_0_1_57 Rcell_0_1_58 = Rcell_0_0_1_58 Rcell_0_1_59 = Rcell_0_0_1_59 Rcell_0_1_60 = Rcell_0_0_1_60 Rcell_0_1_61 = Rcell_0_0_1_61 Rcell_0_1_62 = Rcell_0_0_1_62 Rcell_0_1_63 = Rcell_0_0_1_63 Rcell_0_2_0 = Rcell_0_0_2_0 Rcell_0_2_1 = Rcell_0_0_2_1 Rcell_0_2_2 = Rcell_0_0_2_2 Rcell_0_2_3 = Rcell_0_0_2_3 Rcell_0_2_4 = Rcell_0_0_2_4 Rcell_0_2_5 = Rcell_0_0_2_5 Rcell_0_2_6 = Rcell_0_0_2_6 Rcell_0_2_7 = Rcell_0_0_2_7 Rcell_0_2_8 = Rcell_0_0_2_8 Rcell_0_2_9 = Rcell_0_0_2_9 Rcell_0_2_10 = Rcell_0_0_2_10 Rcell_0_2_11 = Rcell_0_0_2_11 Rcell_0_2_12 = Rcell_0_0_2_12 Rcell_0_2_13 = Rcell_0_0_2_13 Rcell_0_2_14 = Rcell_0_0_2_14 Rcell_0_2_15 = Rcell_0_0_2_15 Rcell_0_2_16 = Rcell_0_0_2_16 Rcell_0_2_17 = Rcell_0_0_2_17 Rcell_0_2_18 = Rcell_0_0_2_18 Rcell_0_2_19 = Rcell_0_0_2_19 Rcell_0_2_20 = Rcell_0_0_2_20 Rcell_0_2_21 = Rcell_0_0_2_21 Rcell_0_2_22 = Rcell_0_0_2_22 Rcell_0_2_23 = Rcell_0_0_2_23 Rcell_0_2_24 = Rcell_0_0_2_24 Rcell_0_2_25 = Rcell_0_0_2_25 Rcell_0_2_26 = Rcell_0_0_2_26 Rcell_0_2_27 = Rcell_0_0_2_27 Rcell_0_2_28 = Rcell_0_0_2_28 Rcell_0_2_29 = Rcell_0_0_2_29 Rcell_0_2_30 = Rcell_0_0_2_30 Rcell_0_2_31 = Rcell_0_0_2_31 Rcell_0_2_32 = Rcell_0_0_2_32 Rcell_0_2_33 = Rcell_0_0_2_33 Rcell_0_2_34 = Rcell_0_0_2_34 Rcell_0_2_35 = Rcell_0_0_2_35 Rcell_0_2_36 = Rcell_0_0_2_36 Rcell_0_2_37 = Rcell_0_0_2_37 Rcell_0_2_38 = Rcell_0_0_2_38 Rcell_0_2_39 = Rcell_0_0_2_39 Rcell_0_2_40 = Rcell_0_0_2_40 Rcell_0_2_41 = Rcell_0_0_2_41 Rcell_0_2_42 = Rcell_0_0_2_42 Rcell_0_2_43 = Rcell_0_0_2_43 Rcell_0_2_44 = Rcell_0_0_2_44 Rcell_0_2_45 = Rcell_0_0_2_45 Rcell_0_2_46 = Rcell_0_0_2_46 Rcell_0_2_47 = Rcell_0_0_2_47 Rcell_0_2_48 = Rcell_0_0_2_48 Rcell_0_2_49 = Rcell_0_0_2_49 Rcell_0_2_50 = Rcell_0_0_2_50 Rcell_0_2_51 = Rcell_0_0_2_51 Rcell_0_2_52 = Rcell_0_0_2_52 Rcell_0_2_53 = Rcell_0_0_2_53 Rcell_0_2_54 = Rcell_0_0_2_54 Rcell_0_2_55 = Rcell_0_0_2_55 Rcell_0_2_56 = Rcell_0_0_2_56 Rcell_0_2_57 = Rcell_0_0_2_57 Rcell_0_2_58 = Rcell_0_0_2_58 Rcell_0_2_59 = Rcell_0_0_2_59 Rcell_0_2_60 = Rcell_0_0_2_60 Rcell_0_2_61 = Rcell_0_0_2_61 Rcell_0_2_62 = Rcell_0_0_2_62 Rcell_0_2_63 = Rcell_0_0_2_63 Rcell_0_3_0 = Rcell_0_0_3_0 Rcell_0_3_1 = Rcell_0_0_3_1 Rcell_0_3_2 = Rcell_0_0_3_2 Rcell_0_3_3 = Rcell_0_0_3_3 Rcell_0_3_4 = Rcell_0_0_3_4 Rcell_0_3_5 = Rcell_0_0_3_5 Rcell_0_3_6 = Rcell_0_0_3_6 Rcell_0_3_7 = Rcell_0_0_3_7 Rcell_0_3_8 = Rcell_0_0_3_8 Rcell_0_3_9 = Rcell_0_0_3_9 Rcell_0_3_10 = Rcell_0_0_3_10 Rcell_0_3_11 = Rcell_0_0_3_11 Rcell_0_3_12 = Rcell_0_0_3_12 Rcell_0_3_13 = Rcell_0_0_3_13 Rcell_0_3_14 = Rcell_0_0_3_14 Rcell_0_3_15 = Rcell_0_0_3_15 Rcell_0_3_16 = Rcell_0_0_3_16 Rcell_0_3_17 = Rcell_0_0_3_17 Rcell_0_3_18 = Rcell_0_0_3_18 Rcell_0_3_19 = Rcell_0_0_3_19 Rcell_0_3_20 = Rcell_0_0_3_20 Rcell_0_3_21 = Rcell_0_0_3_21 Rcell_0_3_22 = Rcell_0_0_3_22 Rcell_0_3_23 = Rcell_0_0_3_23 Rcell_0_3_24 = Rcell_0_0_3_24 Rcell_0_3_25 = Rcell_0_0_3_25 Rcell_0_3_26 = Rcell_0_0_3_26 Rcell_0_3_27 = Rcell_0_0_3_27 Rcell_0_3_28 = Rcell_0_0_3_28 Rcell_0_3_29 = Rcell_0_0_3_29 Rcell_0_3_30 = Rcell_0_0_3_30 Rcell_0_3_31 = Rcell_0_0_3_31 Rcell_0_3_32 = Rcell_0_0_3_32 Rcell_0_3_33 = Rcell_0_0_3_33 Rcell_0_3_34 = Rcell_0_0_3_34 Rcell_0_3_35 = Rcell_0_0_3_35 Rcell_0_3_36 = Rcell_0_0_3_36 Rcell_0_3_37 = Rcell_0_0_3_37 Rcell_0_3_38 = Rcell_0_0_3_38 Rcell_0_3_39 = Rcell_0_0_3_39 Rcell_0_3_40 = Rcell_0_0_3_40 Rcell_0_3_41 = Rcell_0_0_3_41 Rcell_0_3_42 = Rcell_0_0_3_42 Rcell_0_3_43 = Rcell_0_0_3_43 Rcell_0_3_44 = Rcell_0_0_3_44 Rcell_0_3_45 = Rcell_0_0_3_45 Rcell_0_3_46 = Rcell_0_0_3_46 Rcell_0_3_47 = Rcell_0_0_3_47 Rcell_0_3_48 = Rcell_0_0_3_48 Rcell_0_3_49 = Rcell_0_0_3_49 Rcell_0_3_50 = Rcell_0_0_3_50 Rcell_0_3_51 = Rcell_0_0_3_51 Rcell_0_3_52 = Rcell_0_0_3_52 Rcell_0_3_53 = Rcell_0_0_3_53 Rcell_0_3_54 = Rcell_0_0_3_54 Rcell_0_3_55 = Rcell_0_0_3_55 Rcell_0_3_56 = Rcell_0_0_3_56 Rcell_0_3_57 = Rcell_0_0_3_57 Rcell_0_3_58 = Rcell_0_0_3_58 Rcell_0_3_59 = Rcell_0_0_3_59 Rcell_0_3_60 = Rcell_0_0_3_60 Rcell_0_3_61 = Rcell_0_0_3_61 Rcell_0_3_62 = Rcell_0_0_3_62 Rcell_0_3_63 = Rcell_0_0_3_63 Rcell_1_0_0 = Rcell_0_1_0_0 Rcell_1_0_1 = Rcell_0_1_0_1 Rcell_1_0_2 = Rcell_0_1_0_2 Rcell_1_0_3 = Rcell_0_1_0_3 Rcell_1_0_4 = Rcell_0_1_0_4 Rcell_1_0_5 = Rcell_0_1_0_5 Rcell_1_0_6 = Rcell_0_1_0_6 Rcell_1_0_7 = Rcell_0_1_0_7 Rcell_1_0_8 = Rcell_0_1_0_8 Rcell_1_0_9 = Rcell_0_1_0_9 Rcell_1_0_10 = Rcell_0_1_0_10 Rcell_1_0_11 = Rcell_0_1_0_11 Rcell_1_0_12 = Rcell_0_1_0_12 Rcell_1_0_13 = Rcell_0_1_0_13 Rcell_1_0_14 = Rcell_0_1_0_14 Rcell_1_0_15 = Rcell_0_1_0_15 Rcell_1_0_16 = Rcell_0_1_0_16 Rcell_1_0_17 = Rcell_0_1_0_17 Rcell_1_0_18 = Rcell_0_1_0_18 Rcell_1_0_19 = Rcell_0_1_0_19 Rcell_1_0_20 = Rcell_0_1_0_20 Rcell_1_0_21 = Rcell_0_1_0_21 Rcell_1_0_22 = Rcell_0_1_0_22 Rcell_1_0_23 = Rcell_0_1_0_23 Rcell_1_0_24 = Rcell_0_1_0_24 Rcell_1_0_25 = Rcell_0_1_0_25 Rcell_1_0_26 = Rcell_0_1_0_26 Rcell_1_0_27 = Rcell_0_1_0_27 Rcell_1_0_28 = Rcell_0_1_0_28 Rcell_1_0_29 = Rcell_0_1_0_29 Rcell_1_0_30 = Rcell_0_1_0_30 Rcell_1_0_31 = Rcell_0_1_0_31 Rcell_1_0_32 = Rcell_0_1_0_32 Rcell_1_0_33 = Rcell_0_1_0_33 Rcell_1_0_34 = Rcell_0_1_0_34 Rcell_1_0_35 = Rcell_0_1_0_35 Rcell_1_0_36 = Rcell_0_1_0_36 Rcell_1_0_37 = Rcell_0_1_0_37 Rcell_1_0_38 = Rcell_0_1_0_38 Rcell_1_0_39 = Rcell_0_1_0_39 Rcell_1_0_40 = Rcell_0_1_0_40 Rcell_1_0_41 = Rcell_0_1_0_41 Rcell_1_0_42 = Rcell_0_1_0_42 Rcell_1_0_43 = Rcell_0_1_0_43 Rcell_1_0_44 = Rcell_0_1_0_44 Rcell_1_0_45 = Rcell_0_1_0_45 Rcell_1_0_46 = Rcell_0_1_0_46 Rcell_1_0_47 = Rcell_0_1_0_47 Rcell_1_0_48 = Rcell_0_1_0_48 Rcell_1_0_49 = Rcell_0_1_0_49 Rcell_1_0_50 = Rcell_0_1_0_50 Rcell_1_0_51 = Rcell_0_1_0_51 Rcell_1_0_52 = Rcell_0_1_0_52 Rcell_1_0_53 = Rcell_0_1_0_53 Rcell_1_0_54 = Rcell_0_1_0_54 Rcell_1_0_55 = Rcell_0_1_0_55 Rcell_1_0_56 = Rcell_0_1_0_56 Rcell_1_0_57 = Rcell_0_1_0_57 Rcell_1_0_58 = Rcell_0_1_0_58 Rcell_1_0_59 = Rcell_0_1_0_59 Rcell_1_0_60 = Rcell_0_1_0_60 Rcell_1_0_61 = Rcell_0_1_0_61 Rcell_1_0_62 = Rcell_0_1_0_62 Rcell_1_0_63 = Rcell_0_1_0_63 Rcell_1_1_0 = Rcell_0_1_1_0 Rcell_1_1_1 = Rcell_0_1_1_1 Rcell_1_1_2 = Rcell_0_1_1_2 Rcell_1_1_3 = Rcell_0_1_1_3 Rcell_1_1_4 = Rcell_0_1_1_4 Rcell_1_1_5 = Rcell_0_1_1_5 Rcell_1_1_6 = Rcell_0_1_1_6 Rcell_1_1_7 = Rcell_0_1_1_7 Rcell_1_1_8 = Rcell_0_1_1_8 Rcell_1_1_9 = Rcell_0_1_1_9 Rcell_1_1_10 = Rcell_0_1_1_10 Rcell_1_1_11 = Rcell_0_1_1_11 Rcell_1_1_12 = Rcell_0_1_1_12 Rcell_1_1_13 = Rcell_0_1_1_13 Rcell_1_1_14 = Rcell_0_1_1_14 Rcell_1_1_15 = Rcell_0_1_1_15 Rcell_1_1_16 = Rcell_0_1_1_16 Rcell_1_1_17 = Rcell_0_1_1_17 Rcell_1_1_18 = Rcell_0_1_1_18 Rcell_1_1_19 = Rcell_0_1_1_19 Rcell_1_1_20 = Rcell_0_1_1_20 Rcell_1_1_21 = Rcell_0_1_1_21 Rcell_1_1_22 = Rcell_0_1_1_22 Rcell_1_1_23 = Rcell_0_1_1_23 Rcell_1_1_24 = Rcell_0_1_1_24 Rcell_1_1_25 = Rcell_0_1_1_25 Rcell_1_1_26 = Rcell_0_1_1_26 Rcell_1_1_27 = Rcell_0_1_1_27 Rcell_1_1_28 = Rcell_0_1_1_28 Rcell_1_1_29 = Rcell_0_1_1_29 Rcell_1_1_30 = Rcell_0_1_1_30 Rcell_1_1_31 = Rcell_0_1_1_31 Rcell_1_1_32 = Rcell_0_1_1_32 Rcell_1_1_33 = Rcell_0_1_1_33 Rcell_1_1_34 = Rcell_0_1_1_34 Rcell_1_1_35 = Rcell_0_1_1_35 Rcell_1_1_36 = Rcell_0_1_1_36 Rcell_1_1_37 = Rcell_0_1_1_37 Rcell_1_1_38 = Rcell_0_1_1_38 Rcell_1_1_39 = Rcell_0_1_1_39 Rcell_1_1_40 = Rcell_0_1_1_40 Rcell_1_1_41 = Rcell_0_1_1_41 Rcell_1_1_42 = Rcell_0_1_1_42 Rcell_1_1_43 = Rcell_0_1_1_43 Rcell_1_1_44 = Rcell_0_1_1_44 Rcell_1_1_45 = Rcell_0_1_1_45 Rcell_1_1_46 = Rcell_0_1_1_46 Rcell_1_1_47 = Rcell_0_1_1_47 Rcell_1_1_48 = Rcell_0_1_1_48 Rcell_1_1_49 = Rcell_0_1_1_49 Rcell_1_1_50 = Rcell_0_1_1_50 Rcell_1_1_51 = Rcell_0_1_1_51 Rcell_1_1_52 = Rcell_0_1_1_52 Rcell_1_1_53 = Rcell_0_1_1_53 Rcell_1_1_54 = Rcell_0_1_1_54 Rcell_1_1_55 = Rcell_0_1_1_55 Rcell_1_1_56 = Rcell_0_1_1_56 Rcell_1_1_57 = Rcell_0_1_1_57 Rcell_1_1_58 = Rcell_0_1_1_58 Rcell_1_1_59 = Rcell_0_1_1_59 Rcell_1_1_60 = Rcell_0_1_1_60 Rcell_1_1_61 = Rcell_0_1_1_61 Rcell_1_1_62 = Rcell_0_1_1_62 Rcell_1_1_63 = Rcell_0_1_1_63 Rcell_1_2_0 = Rcell_0_1_2_0 Rcell_1_2_1 = Rcell_0_1_2_1 Rcell_1_2_2 = Rcell_0_1_2_2 Rcell_1_2_3 = Rcell_0_1_2_3 Rcell_1_2_4 = Rcell_0_1_2_4 Rcell_1_2_5 = Rcell_0_1_2_5 Rcell_1_2_6 = Rcell_0_1_2_6 Rcell_1_2_7 = Rcell_0_1_2_7 Rcell_1_2_8 = Rcell_0_1_2_8 Rcell_1_2_9 = Rcell_0_1_2_9 Rcell_1_2_10 = Rcell_0_1_2_10 Rcell_1_2_11 = Rcell_0_1_2_11 Rcell_1_2_12 = Rcell_0_1_2_12 Rcell_1_2_13 = Rcell_0_1_2_13 Rcell_1_2_14 = Rcell_0_1_2_14 Rcell_1_2_15 = Rcell_0_1_2_15 Rcell_1_2_16 = Rcell_0_1_2_16 Rcell_1_2_17 = Rcell_0_1_2_17 Rcell_1_2_18 = Rcell_0_1_2_18 Rcell_1_2_19 = Rcell_0_1_2_19 Rcell_1_2_20 = Rcell_0_1_2_20 Rcell_1_2_21 = Rcell_0_1_2_21 Rcell_1_2_22 = Rcell_0_1_2_22 Rcell_1_2_23 = Rcell_0_1_2_23 Rcell_1_2_24 = Rcell_0_1_2_24 Rcell_1_2_25 = Rcell_0_1_2_25 Rcell_1_2_26 = Rcell_0_1_2_26 Rcell_1_2_27 = Rcell_0_1_2_27 Rcell_1_2_28 = Rcell_0_1_2_28 Rcell_1_2_29 = Rcell_0_1_2_29 Rcell_1_2_30 = Rcell_0_1_2_30 Rcell_1_2_31 = Rcell_0_1_2_31 Rcell_1_2_32 = Rcell_0_1_2_32 Rcell_1_2_33 = Rcell_0_1_2_33 Rcell_1_2_34 = Rcell_0_1_2_34 Rcell_1_2_35 = Rcell_0_1_2_35 Rcell_1_2_36 = Rcell_0_1_2_36 Rcell_1_2_37 = Rcell_0_1_2_37 Rcell_1_2_38 = Rcell_0_1_2_38 Rcell_1_2_39 = Rcell_0_1_2_39 Rcell_1_2_40 = Rcell_0_1_2_40 Rcell_1_2_41 = Rcell_0_1_2_41 Rcell_1_2_42 = Rcell_0_1_2_42 Rcell_1_2_43 = Rcell_0_1_2_43 Rcell_1_2_44 = Rcell_0_1_2_44 Rcell_1_2_45 = Rcell_0_1_2_45 Rcell_1_2_46 = Rcell_0_1_2_46 Rcell_1_2_47 = Rcell_0_1_2_47 Rcell_1_2_48 = Rcell_0_1_2_48 Rcell_1_2_49 = Rcell_0_1_2_49 Rcell_1_2_50 = Rcell_0_1_2_50 Rcell_1_2_51 = Rcell_0_1_2_51 Rcell_1_2_52 = Rcell_0_1_2_52 Rcell_1_2_53 = Rcell_0_1_2_53 Rcell_1_2_54 = Rcell_0_1_2_54 Rcell_1_2_55 = Rcell_0_1_2_55 Rcell_1_2_56 = Rcell_0_1_2_56 Rcell_1_2_57 = Rcell_0_1_2_57 Rcell_1_2_58 = Rcell_0_1_2_58 Rcell_1_2_59 = Rcell_0_1_2_59 Rcell_1_2_60 = Rcell_0_1_2_60 Rcell_1_2_61 = Rcell_0_1_2_61 Rcell_1_2_62 = Rcell_0_1_2_62 Rcell_1_2_63 = Rcell_0_1_2_63 Rcell_1_3_0 = Rcell_0_1_3_0 Rcell_1_3_1 = Rcell_0_1_3_1 Rcell_1_3_2 = Rcell_0_1_3_2 Rcell_1_3_3 = Rcell_0_1_3_3 Rcell_1_3_4 = Rcell_0_1_3_4 Rcell_1_3_5 = Rcell_0_1_3_5 Rcell_1_3_6 = Rcell_0_1_3_6 Rcell_1_3_7 = Rcell_0_1_3_7 Rcell_1_3_8 = Rcell_0_1_3_8 Rcell_1_3_9 = Rcell_0_1_3_9 Rcell_1_3_10 = Rcell_0_1_3_10 Rcell_1_3_11 = Rcell_0_1_3_11 Rcell_1_3_12 = Rcell_0_1_3_12 Rcell_1_3_13 = Rcell_0_1_3_13 Rcell_1_3_14 = Rcell_0_1_3_14 Rcell_1_3_15 = Rcell_0_1_3_15 Rcell_1_3_16 = Rcell_0_1_3_16 Rcell_1_3_17 = Rcell_0_1_3_17 Rcell_1_3_18 = Rcell_0_1_3_18 Rcell_1_3_19 = Rcell_0_1_3_19 Rcell_1_3_20 = Rcell_0_1_3_20 Rcell_1_3_21 = Rcell_0_1_3_21 Rcell_1_3_22 = Rcell_0_1_3_22 Rcell_1_3_23 = Rcell_0_1_3_23 Rcell_1_3_24 = Rcell_0_1_3_24 Rcell_1_3_25 = Rcell_0_1_3_25 Rcell_1_3_26 = Rcell_0_1_3_26 Rcell_1_3_27 = Rcell_0_1_3_27 Rcell_1_3_28 = Rcell_0_1_3_28 Rcell_1_3_29 = Rcell_0_1_3_29 Rcell_1_3_30 = Rcell_0_1_3_30 Rcell_1_3_31 = Rcell_0_1_3_31 Rcell_1_3_32 = Rcell_0_1_3_32 Rcell_1_3_33 = Rcell_0_1_3_33 Rcell_1_3_34 = Rcell_0_1_3_34 Rcell_1_3_35 = Rcell_0_1_3_35 Rcell_1_3_36 = Rcell_0_1_3_36 Rcell_1_3_37 = Rcell_0_1_3_37 Rcell_1_3_38 = Rcell_0_1_3_38 Rcell_1_3_39 = Rcell_0_1_3_39 Rcell_1_3_40 = Rcell_0_1_3_40 Rcell_1_3_41 = Rcell_0_1_3_41 Rcell_1_3_42 = Rcell_0_1_3_42 Rcell_1_3_43 = Rcell_0_1_3_43 Rcell_1_3_44 = Rcell_0_1_3_44 Rcell_1_3_45 = Rcell_0_1_3_45 Rcell_1_3_46 = Rcell_0_1_3_46 Rcell_1_3_47 = Rcell_0_1_3_47 Rcell_1_3_48 = Rcell_0_1_3_48 Rcell_1_3_49 = Rcell_0_1_3_49 Rcell_1_3_50 = Rcell_0_1_3_50 Rcell_1_3_51 = Rcell_0_1_3_51 Rcell_1_3_52 = Rcell_0_1_3_52 Rcell_1_3_53 = Rcell_0_1_3_53 Rcell_1_3_54 = Rcell_0_1_3_54 Rcell_1_3_55 = Rcell_0_1_3_55 Rcell_1_3_56 = Rcell_0_1_3_56 Rcell_1_3_57 = Rcell_0_1_3_57 Rcell_1_3_58 = Rcell_0_1_3_58 Rcell_1_3_59 = Rcell_0_1_3_59 Rcell_1_3_60 = Rcell_0_1_3_60 Rcell_1_3_61 = Rcell_0_1_3_61 Rcell_1_3_62 = Rcell_0_1_3_62 Rcell_1_3_63 = Rcell_0_1_3_63

xInv0 (InOut InOutbarBuf vdd vss PBulkLine NBulkLine) inverter
xInv1 (InOutbar InOutBuf vdd vss PBulkLine NBulkLine) inverter

VGBen0 (GBenable_0 0) vsource type=pwl wave=waveEnGB_0
VLBen0 (LBenable_0 0) vsource type=pwl wave=waveEnLB_0
VLBen1 (LBenable_1 0) vsource type=pwl wave=waveEnLB_1
VBLenc0 (BLenc_start_0 0) vsource type=pwl wave=waveBLstart_0
VBLenc1 (BLenc_start_1 0) vsource type=pwl wave=waveBLstart_1
VWLenc0 (WLenc_start_0 0) vsource type=pwl wave=waveWLstart_0
VWLenc1 (WLenc_start_1 0) vsource type=pwl wave=waveWLstart_1
VWLenc2 (WLenc_start_2 0) vsource type=pwl wave=waveWLstart_2
VWLenc3 (WLenc_start_3 0) vsource type=pwl wave=waveWLstart_3
VWLenc4 (WLenc_start_4 0) vsource type=pwl wave=waveWLstart_4
VWLenc5 (WLenc_start_5 0) vsource type=pwl wave=waveWLstart_5



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
VrefWL2 (RefWL_2 0) vsource dc=0
VrefWL3 (RefWL_3 0) vsource dc=0
VrefWL4 (RefWL_4 0) vsource dc=0
VrefWL5 (RefWL_5 0) vsource dc=0
VrefWL6 (RefWL_6 0) vsource dc=0
VrefWL7 (RefWL_7 0) vsource dc=0
VrefWL8 (RefWL_8 0) vsource dc=0
VrefWL9 (RefWL_9 0) vsource dc=0
VrefWL10 (RefWL_10 0) vsource dc=0
VrefWL11 (RefWL_11 0) vsource dc=0
VrefWL12 (RefWL_12 0) vsource dc=0
VrefWL13 (RefWL_13 0) vsource dc=0
VrefWL14 (RefWL_14 0) vsource dc=0
VrefWL15 (RefWL_15 0) vsource dc=0
VrefWL16 (RefWL_16 0) vsource dc=0
VrefWL17 (RefWL_17 0) vsource dc=0
VrefWL18 (RefWL_18 0) vsource dc=0
VrefWL19 (RefWL_19 0) vsource dc=0
VrefWL20 (RefWL_20 0) vsource dc=0
VrefWL21 (RefWL_21 0) vsource dc=0
VrefWL22 (RefWL_22 0) vsource dc=0
VrefWL23 (RefWL_23 0) vsource dc=0
VrefWL24 (RefWL_24 0) vsource dc=0
VrefWL25 (RefWL_25 0) vsource dc=0
VrefWL26 (RefWL_26 0) vsource dc=0
VrefWL27 (RefWL_27 0) vsource dc=0
VrefWL28 (RefWL_28 0) vsource dc=0
VrefWL29 (RefWL_29 0) vsource dc=0
VrefWL30 (RefWL_30 0) vsource dc=0
VrefWL31 (RefWL_31 0) vsource dc=0
VrefWL32 (RefWL_32 0) vsource dc=0
VrefWL33 (RefWL_33 0) vsource dc=0
VrefWL34 (RefWL_34 0) vsource dc=0
VrefWL35 (RefWL_35 0) vsource dc=0
VrefWL36 (RefWL_36 0) vsource dc=0
VrefWL37 (RefWL_37 0) vsource dc=0
VrefWL38 (RefWL_38 0) vsource dc=0
VrefWL39 (RefWL_39 0) vsource dc=0
VrefWL40 (RefWL_40 0) vsource dc=0
VrefWL41 (RefWL_41 0) vsource dc=0
VrefWL42 (RefWL_42 0) vsource dc=0
VrefWL43 (RefWL_43 0) vsource dc=0
VrefWL44 (RefWL_44 0) vsource dc=0
VrefWL45 (RefWL_45 0) vsource dc=0
VrefWL46 (RefWL_46 0) vsource dc=0
VrefWL47 (RefWL_47 0) vsource dc=0
VrefWL48 (RefWL_48 0) vsource dc=0
VrefWL49 (RefWL_49 0) vsource dc=0
VrefWL50 (RefWL_50 0) vsource dc=0
VrefWL51 (RefWL_51 0) vsource dc=0
VrefWL52 (RefWL_52 0) vsource dc=0
VrefWL53 (RefWL_53 0) vsource dc=0
VrefWL54 (RefWL_54 0) vsource dc=0
VrefWL55 (RefWL_55 0) vsource dc=0
VrefWL56 (RefWL_56 0) vsource dc=0
VrefWL57 (RefWL_57 0) vsource dc=0
VrefWL58 (RefWL_58 0) vsource dc=0
VrefWL59 (RefWL_59 0) vsource dc=0
VrefWL60 (RefWL_60 0) vsource dc=0
VrefWL61 (RefWL_61 0) vsource dc=0
VrefWL62 (RefWL_62 0) vsource dc=0
VrefWL63 (RefWL_63 0) vsource dc=0

save InOut xGB0.xLB0.BL_0 xGB0.xLB0.SelLbar_0 xGB0.xLB0.SelLbarbar_0 xGB0.xLB0.BLCharge_0

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