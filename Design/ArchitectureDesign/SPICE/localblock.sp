simulator lang=spectre

include "branch.sp"
include "decoder.sp"

subckt localblock (vdd vss NBulkLine PBulkLine WLencoded_0 WLencoded_1 WLencoded_2 WLencoded_3 WLencoded_4 WLencoded_5 BLencoded_0 BLencoded_1 LBenable BLout Delay Refenable)
parameters Rcell_0_0 Rcell_0_1 Rcell_0_2 Rcell_0_3 Rcell_0_4 Rcell_0_5 Rcell_0_6 Rcell_0_7 Rcell_0_8 Rcell_0_9 Rcell_0_10 Rcell_0_11 Rcell_0_12 Rcell_0_13 Rcell_0_14 Rcell_0_15 Rcell_0_16 Rcell_0_17 Rcell_0_18 Rcell_0_19 Rcell_0_20 Rcell_0_21 Rcell_0_22 Rcell_0_23 Rcell_0_24 Rcell_0_25 Rcell_0_26 Rcell_0_27 Rcell_0_28 Rcell_0_29 Rcell_0_30 Rcell_0_31 Rcell_0_32 Rcell_0_33 Rcell_0_34 Rcell_0_35 Rcell_0_36 Rcell_0_37 Rcell_0_38 Rcell_0_39 Rcell_0_40 Rcell_0_41 Rcell_0_42 Rcell_0_43 Rcell_0_44 Rcell_0_45 Rcell_0_46 Rcell_0_47 Rcell_0_48 Rcell_0_49 Rcell_0_50 Rcell_0_51 Rcell_0_52 Rcell_0_53 Rcell_0_54 Rcell_0_55 Rcell_0_56 Rcell_0_57 Rcell_0_58 Rcell_0_59 Rcell_0_60 Rcell_0_61 Rcell_0_62 Rcell_0_63 Rcell_1_0 Rcell_1_1 Rcell_1_2 Rcell_1_3 Rcell_1_4 Rcell_1_5 Rcell_1_6 Rcell_1_7 Rcell_1_8 Rcell_1_9 Rcell_1_10 Rcell_1_11 Rcell_1_12 Rcell_1_13 Rcell_1_14 Rcell_1_15 Rcell_1_16 Rcell_1_17 Rcell_1_18 Rcell_1_19 Rcell_1_20 Rcell_1_21 Rcell_1_22 Rcell_1_23 Rcell_1_24 Rcell_1_25 Rcell_1_26 Rcell_1_27 Rcell_1_28 Rcell_1_29 Rcell_1_30 Rcell_1_31 Rcell_1_32 Rcell_1_33 Rcell_1_34 Rcell_1_35 Rcell_1_36 Rcell_1_37 Rcell_1_38 Rcell_1_39 Rcell_1_40 Rcell_1_41 Rcell_1_42 Rcell_1_43 Rcell_1_44 Rcell_1_45 Rcell_1_46 Rcell_1_47 Rcell_1_48 Rcell_1_49 Rcell_1_50 Rcell_1_51 Rcell_1_52 Rcell_1_53 Rcell_1_54 Rcell_1_55 Rcell_1_56 Rcell_1_57 Rcell_1_58 Rcell_1_59 Rcell_1_60 Rcell_1_61 Rcell_1_62 Rcell_1_63 Rcell_2_0 Rcell_2_1 Rcell_2_2 Rcell_2_3 Rcell_2_4 Rcell_2_5 Rcell_2_6 Rcell_2_7 Rcell_2_8 Rcell_2_9 Rcell_2_10 Rcell_2_11 Rcell_2_12 Rcell_2_13 Rcell_2_14 Rcell_2_15 Rcell_2_16 Rcell_2_17 Rcell_2_18 Rcell_2_19 Rcell_2_20 Rcell_2_21 Rcell_2_22 Rcell_2_23 Rcell_2_24 Rcell_2_25 Rcell_2_26 Rcell_2_27 Rcell_2_28 Rcell_2_29 Rcell_2_30 Rcell_2_31 Rcell_2_32 Rcell_2_33 Rcell_2_34 Rcell_2_35 Rcell_2_36 Rcell_2_37 Rcell_2_38 Rcell_2_39 Rcell_2_40 Rcell_2_41 Rcell_2_42 Rcell_2_43 Rcell_2_44 Rcell_2_45 Rcell_2_46 Rcell_2_47 Rcell_2_48 Rcell_2_49 Rcell_2_50 Rcell_2_51 Rcell_2_52 Rcell_2_53 Rcell_2_54 Rcell_2_55 Rcell_2_56 Rcell_2_57 Rcell_2_58 Rcell_2_59 Rcell_2_60 Rcell_2_61 Rcell_2_62 Rcell_2_63 Rcell_3_0 Rcell_3_1 Rcell_3_2 Rcell_3_3 Rcell_3_4 Rcell_3_5 Rcell_3_6 Rcell_3_7 Rcell_3_8 Rcell_3_9 Rcell_3_10 Rcell_3_11 Rcell_3_12 Rcell_3_13 Rcell_3_14 Rcell_3_15 Rcell_3_16 Rcell_3_17 Rcell_3_18 Rcell_3_19 Rcell_3_20 Rcell_3_21 Rcell_3_22 Rcell_3_23 Rcell_3_24 Rcell_3_25 Rcell_3_26 Rcell_3_27 Rcell_3_28 Rcell_3_29 Rcell_3_30 Rcell_3_31 Rcell_3_32 Rcell_3_33 Rcell_3_34 Rcell_3_35 Rcell_3_36 Rcell_3_37 Rcell_3_38 Rcell_3_39 Rcell_3_40 Rcell_3_41 Rcell_3_42 Rcell_3_43 Rcell_3_44 Rcell_3_45 Rcell_3_46 Rcell_3_47 Rcell_3_48 Rcell_3_49 Rcell_3_50 Rcell_3_51 Rcell_3_52 Rcell_3_53 Rcell_3_54 Rcell_3_55 Rcell_3_56 Rcell_3_57 Rcell_3_58 Rcell_3_59 Rcell_3_60 Rcell_3_61 Rcell_3_62 Rcell_3_63

xdecWL (WLencoded_0 WLencoded_1 WLencoded_2 WLencoded_3 WLencoded_4 WLencoded_5 LBenable WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 vdd vss NBulkLine PBulkLine) decodersix
xdecBL (BLencoded_0 BLencoded_1 LBenable BLencLine_0 BLencLine_1 BLencLine_2 BLencLine_3 vdd vss NBulkLine PBulkLine) decodertwo


xnor0 (BLencLine_0 Refenable temp_0 vdd vss PBulkLine NBulkLine) twonor
xnot0_0 (temp_0 SelL_0 vdd vss PBulkLine NBulkLine) inverter
xnot0_1 (SelL_0 SelLbar_0 vdd vss PBulkLine NBulkLine) inverter
xnot0_2 (SelLbar_0 SelLbarbar_0 vdd vss PBulkLine NBulkLine) inverter
xnand0 (SelL_0 Delay Selbarbarbar_0 vdd vss PBulkLine NBulkLine) twonand
xnor1 (BLencLine_1 Refenable temp_1 vdd vss PBulkLine NBulkLine) twonor
xnot1_0 (temp_1 SelL_1 vdd vss PBulkLine NBulkLine) inverter
xnot1_1 (SelL_1 SelLbar_1 vdd vss PBulkLine NBulkLine) inverter
xnot1_2 (SelLbar_1 SelLbarbar_1 vdd vss PBulkLine NBulkLine) inverter
xnand1 (SelL_1 Delay Selbarbarbar_1 vdd vss PBulkLine NBulkLine) twonand
xnor2 (BLencLine_2 Refenable temp_2 vdd vss PBulkLine NBulkLine) twonor
xnot2_0 (temp_2 SelL_2 vdd vss PBulkLine NBulkLine) inverter
xnot2_1 (SelL_2 SelLbar_2 vdd vss PBulkLine NBulkLine) inverter
xnot2_2 (SelLbar_2 SelLbarbar_2 vdd vss PBulkLine NBulkLine) inverter
xnand2 (SelL_2 Delay Selbarbarbar_2 vdd vss PBulkLine NBulkLine) twonand
xnor3 (BLencLine_3 Refenable temp_3 vdd vss PBulkLine NBulkLine) twonor
xnot3_0 (temp_3 SelL_3 vdd vss PBulkLine NBulkLine) inverter
xnot3_1 (SelL_3 SelLbar_3 vdd vss PBulkLine NBulkLine) inverter
xnot3_2 (SelLbar_3 SelLbarbar_3 vdd vss PBulkLine NBulkLine) inverter
xnand3 (SelL_3 Delay Selbarbarbar_3 vdd vss PBulkLine NBulkLine) twonand


xBranch0 (vdd vss BL_0 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 Refenable SelLbarbar_0 SelLbarbarbar_0 SelLbar_0 PBulkLine NBulkLine) branch Rcell_0 = Rcell_0_0 Rcell_1 = Rcell_0_1 Rcell_2 = Rcell_0_2 Rcell_3 = Rcell_0_3 Rcell_4 = Rcell_0_4 Rcell_5 = Rcell_0_5 Rcell_6 = Rcell_0_6 Rcell_7 = Rcell_0_7 Rcell_8 = Rcell_0_8 Rcell_9 = Rcell_0_9 Rcell_10 = Rcell_0_10 Rcell_11 = Rcell_0_11 Rcell_12 = Rcell_0_12 Rcell_13 = Rcell_0_13 Rcell_14 = Rcell_0_14 Rcell_15 = Rcell_0_15 Rcell_16 = Rcell_0_16 Rcell_17 = Rcell_0_17 Rcell_18 = Rcell_0_18 Rcell_19 = Rcell_0_19 Rcell_20 = Rcell_0_20 Rcell_21 = Rcell_0_21 Rcell_22 = Rcell_0_22 Rcell_23 = Rcell_0_23 Rcell_24 = Rcell_0_24 Rcell_25 = Rcell_0_25 Rcell_26 = Rcell_0_26 Rcell_27 = Rcell_0_27 Rcell_28 = Rcell_0_28 Rcell_29 = Rcell_0_29 Rcell_30 = Rcell_0_30 Rcell_31 = Rcell_0_31 Rcell_32 = Rcell_0_32 Rcell_33 = Rcell_0_33 Rcell_34 = Rcell_0_34 Rcell_35 = Rcell_0_35 Rcell_36 = Rcell_0_36 Rcell_37 = Rcell_0_37 Rcell_38 = Rcell_0_38 Rcell_39 = Rcell_0_39 Rcell_40 = Rcell_0_40 Rcell_41 = Rcell_0_41 Rcell_42 = Rcell_0_42 Rcell_43 = Rcell_0_43 Rcell_44 = Rcell_0_44 Rcell_45 = Rcell_0_45 Rcell_46 = Rcell_0_46 Rcell_47 = Rcell_0_47 Rcell_48 = Rcell_0_48 Rcell_49 = Rcell_0_49 Rcell_50 = Rcell_0_50 Rcell_51 = Rcell_0_51 Rcell_52 = Rcell_0_52 Rcell_53 = Rcell_0_53 Rcell_54 = Rcell_0_54 Rcell_55 = Rcell_0_55 Rcell_56 = Rcell_0_56 Rcell_57 = Rcell_0_57 Rcell_58 = Rcell_0_58 Rcell_59 = Rcell_0_59 Rcell_60 = Rcell_0_60 Rcell_61 = Rcell_0_61 Rcell_62 = Rcell_0_62 Rcell_63 = Rcell_0_63 Rref = Rref_0
xM0 BL_0 SelLbarbar_0 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
xBranch1 (vdd vss BL_1 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 Refenable SelLbarbar_1 SelLbarbarbar_1 SelLbar_1 PBulkLine NBulkLine) branch Rcell_0 = Rcell_1_0 Rcell_1 = Rcell_1_1 Rcell_2 = Rcell_1_2 Rcell_3 = Rcell_1_3 Rcell_4 = Rcell_1_4 Rcell_5 = Rcell_1_5 Rcell_6 = Rcell_1_6 Rcell_7 = Rcell_1_7 Rcell_8 = Rcell_1_8 Rcell_9 = Rcell_1_9 Rcell_10 = Rcell_1_10 Rcell_11 = Rcell_1_11 Rcell_12 = Rcell_1_12 Rcell_13 = Rcell_1_13 Rcell_14 = Rcell_1_14 Rcell_15 = Rcell_1_15 Rcell_16 = Rcell_1_16 Rcell_17 = Rcell_1_17 Rcell_18 = Rcell_1_18 Rcell_19 = Rcell_1_19 Rcell_20 = Rcell_1_20 Rcell_21 = Rcell_1_21 Rcell_22 = Rcell_1_22 Rcell_23 = Rcell_1_23 Rcell_24 = Rcell_1_24 Rcell_25 = Rcell_1_25 Rcell_26 = Rcell_1_26 Rcell_27 = Rcell_1_27 Rcell_28 = Rcell_1_28 Rcell_29 = Rcell_1_29 Rcell_30 = Rcell_1_30 Rcell_31 = Rcell_1_31 Rcell_32 = Rcell_1_32 Rcell_33 = Rcell_1_33 Rcell_34 = Rcell_1_34 Rcell_35 = Rcell_1_35 Rcell_36 = Rcell_1_36 Rcell_37 = Rcell_1_37 Rcell_38 = Rcell_1_38 Rcell_39 = Rcell_1_39 Rcell_40 = Rcell_1_40 Rcell_41 = Rcell_1_41 Rcell_42 = Rcell_1_42 Rcell_43 = Rcell_1_43 Rcell_44 = Rcell_1_44 Rcell_45 = Rcell_1_45 Rcell_46 = Rcell_1_46 Rcell_47 = Rcell_1_47 Rcell_48 = Rcell_1_48 Rcell_49 = Rcell_1_49 Rcell_50 = Rcell_1_50 Rcell_51 = Rcell_1_51 Rcell_52 = Rcell_1_52 Rcell_53 = Rcell_1_53 Rcell_54 = Rcell_1_54 Rcell_55 = Rcell_1_55 Rcell_56 = Rcell_1_56 Rcell_57 = Rcell_1_57 Rcell_58 = Rcell_1_58 Rcell_59 = Rcell_1_59 Rcell_60 = Rcell_1_60 Rcell_61 = Rcell_1_61 Rcell_62 = Rcell_1_62 Rcell_63 = Rcell_1_63 Rref = Rref_1
xM1 BL_1 SelLbarbar_1 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
xBranch2 (vdd vss BL_2 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 Refenable SelLbarbar_2 SelLbarbarbar_2 SelLbar_2 PBulkLine NBulkLine) branch Rcell_0 = Rcell_2_0 Rcell_1 = Rcell_2_1 Rcell_2 = Rcell_2_2 Rcell_3 = Rcell_2_3 Rcell_4 = Rcell_2_4 Rcell_5 = Rcell_2_5 Rcell_6 = Rcell_2_6 Rcell_7 = Rcell_2_7 Rcell_8 = Rcell_2_8 Rcell_9 = Rcell_2_9 Rcell_10 = Rcell_2_10 Rcell_11 = Rcell_2_11 Rcell_12 = Rcell_2_12 Rcell_13 = Rcell_2_13 Rcell_14 = Rcell_2_14 Rcell_15 = Rcell_2_15 Rcell_16 = Rcell_2_16 Rcell_17 = Rcell_2_17 Rcell_18 = Rcell_2_18 Rcell_19 = Rcell_2_19 Rcell_20 = Rcell_2_20 Rcell_21 = Rcell_2_21 Rcell_22 = Rcell_2_22 Rcell_23 = Rcell_2_23 Rcell_24 = Rcell_2_24 Rcell_25 = Rcell_2_25 Rcell_26 = Rcell_2_26 Rcell_27 = Rcell_2_27 Rcell_28 = Rcell_2_28 Rcell_29 = Rcell_2_29 Rcell_30 = Rcell_2_30 Rcell_31 = Rcell_2_31 Rcell_32 = Rcell_2_32 Rcell_33 = Rcell_2_33 Rcell_34 = Rcell_2_34 Rcell_35 = Rcell_2_35 Rcell_36 = Rcell_2_36 Rcell_37 = Rcell_2_37 Rcell_38 = Rcell_2_38 Rcell_39 = Rcell_2_39 Rcell_40 = Rcell_2_40 Rcell_41 = Rcell_2_41 Rcell_42 = Rcell_2_42 Rcell_43 = Rcell_2_43 Rcell_44 = Rcell_2_44 Rcell_45 = Rcell_2_45 Rcell_46 = Rcell_2_46 Rcell_47 = Rcell_2_47 Rcell_48 = Rcell_2_48 Rcell_49 = Rcell_2_49 Rcell_50 = Rcell_2_50 Rcell_51 = Rcell_2_51 Rcell_52 = Rcell_2_52 Rcell_53 = Rcell_2_53 Rcell_54 = Rcell_2_54 Rcell_55 = Rcell_2_55 Rcell_56 = Rcell_2_56 Rcell_57 = Rcell_2_57 Rcell_58 = Rcell_2_58 Rcell_59 = Rcell_2_59 Rcell_60 = Rcell_2_60 Rcell_61 = Rcell_2_61 Rcell_62 = Rcell_2_62 Rcell_63 = Rcell_2_63 Rref = Rref_2
xM2 BL_2 SelLbarbar_2 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
xBranch3 (vdd vss BL_3 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 Refenable SelLbarbar_3 SelLbarbarbar_3 SelLbar_3 PBulkLine NBulkLine) branch Rcell_0 = Rcell_3_0 Rcell_1 = Rcell_3_1 Rcell_2 = Rcell_3_2 Rcell_3 = Rcell_3_3 Rcell_4 = Rcell_3_4 Rcell_5 = Rcell_3_5 Rcell_6 = Rcell_3_6 Rcell_7 = Rcell_3_7 Rcell_8 = Rcell_3_8 Rcell_9 = Rcell_3_9 Rcell_10 = Rcell_3_10 Rcell_11 = Rcell_3_11 Rcell_12 = Rcell_3_12 Rcell_13 = Rcell_3_13 Rcell_14 = Rcell_3_14 Rcell_15 = Rcell_3_15 Rcell_16 = Rcell_3_16 Rcell_17 = Rcell_3_17 Rcell_18 = Rcell_3_18 Rcell_19 = Rcell_3_19 Rcell_20 = Rcell_3_20 Rcell_21 = Rcell_3_21 Rcell_22 = Rcell_3_22 Rcell_23 = Rcell_3_23 Rcell_24 = Rcell_3_24 Rcell_25 = Rcell_3_25 Rcell_26 = Rcell_3_26 Rcell_27 = Rcell_3_27 Rcell_28 = Rcell_3_28 Rcell_29 = Rcell_3_29 Rcell_30 = Rcell_3_30 Rcell_31 = Rcell_3_31 Rcell_32 = Rcell_3_32 Rcell_33 = Rcell_3_33 Rcell_34 = Rcell_3_34 Rcell_35 = Rcell_3_35 Rcell_36 = Rcell_3_36 Rcell_37 = Rcell_3_37 Rcell_38 = Rcell_3_38 Rcell_39 = Rcell_3_39 Rcell_40 = Rcell_3_40 Rcell_41 = Rcell_3_41 Rcell_42 = Rcell_3_42 Rcell_43 = Rcell_3_43 Rcell_44 = Rcell_3_44 Rcell_45 = Rcell_3_45 Rcell_46 = Rcell_3_46 Rcell_47 = Rcell_3_47 Rcell_48 = Rcell_3_48 Rcell_49 = Rcell_3_49 Rcell_50 = Rcell_3_50 Rcell_51 = Rcell_3_51 Rcell_52 = Rcell_3_52 Rcell_53 = Rcell_3_53 Rcell_54 = Rcell_3_54 Rcell_55 = Rcell_3_55 Rcell_56 = Rcell_3_56 Rcell_57 = Rcell_3_57 Rcell_58 = Rcell_3_58 Rcell_59 = Rcell_3_59 Rcell_60 = Rcell_3_60 Rcell_61 = Rcell_3_61 Rcell_62 = Rcell_3_62 Rcell_63 = Rcell_3_63 Rref = Rref_3
xM3 BL_3 SelLbarbar_3 BLout NBulkLine mc_nmos_lvt w=PWmuxLB l=PLmin
cParWL0 WL_0 vss capacitor c=Cpar*4
cParWL1 WL_1 vss capacitor c=Cpar*4
cParWL2 WL_2 vss capacitor c=Cpar*4
cParWL3 WL_3 vss capacitor c=Cpar*4
cParWL4 WL_4 vss capacitor c=Cpar*4
cParWL5 WL_5 vss capacitor c=Cpar*4
cParWL6 WL_6 vss capacitor c=Cpar*4
cParWL7 WL_7 vss capacitor c=Cpar*4
cParWL8 WL_8 vss capacitor c=Cpar*4
cParWL9 WL_9 vss capacitor c=Cpar*4
cParWL10 WL_10 vss capacitor c=Cpar*4
cParWL11 WL_11 vss capacitor c=Cpar*4
cParWL12 WL_12 vss capacitor c=Cpar*4
cParWL13 WL_13 vss capacitor c=Cpar*4
cParWL14 WL_14 vss capacitor c=Cpar*4
cParWL15 WL_15 vss capacitor c=Cpar*4
cParWL16 WL_16 vss capacitor c=Cpar*4
cParWL17 WL_17 vss capacitor c=Cpar*4
cParWL18 WL_18 vss capacitor c=Cpar*4
cParWL19 WL_19 vss capacitor c=Cpar*4
cParWL20 WL_20 vss capacitor c=Cpar*4
cParWL21 WL_21 vss capacitor c=Cpar*4
cParWL22 WL_22 vss capacitor c=Cpar*4
cParWL23 WL_23 vss capacitor c=Cpar*4
cParWL24 WL_24 vss capacitor c=Cpar*4
cParWL25 WL_25 vss capacitor c=Cpar*4
cParWL26 WL_26 vss capacitor c=Cpar*4
cParWL27 WL_27 vss capacitor c=Cpar*4
cParWL28 WL_28 vss capacitor c=Cpar*4
cParWL29 WL_29 vss capacitor c=Cpar*4
cParWL30 WL_30 vss capacitor c=Cpar*4
cParWL31 WL_31 vss capacitor c=Cpar*4
cParWL32 WL_32 vss capacitor c=Cpar*4
cParWL33 WL_33 vss capacitor c=Cpar*4
cParWL34 WL_34 vss capacitor c=Cpar*4
cParWL35 WL_35 vss capacitor c=Cpar*4
cParWL36 WL_36 vss capacitor c=Cpar*4
cParWL37 WL_37 vss capacitor c=Cpar*4
cParWL38 WL_38 vss capacitor c=Cpar*4
cParWL39 WL_39 vss capacitor c=Cpar*4
cParWL40 WL_40 vss capacitor c=Cpar*4
cParWL41 WL_41 vss capacitor c=Cpar*4
cParWL42 WL_42 vss capacitor c=Cpar*4
cParWL43 WL_43 vss capacitor c=Cpar*4
cParWL44 WL_44 vss capacitor c=Cpar*4
cParWL45 WL_45 vss capacitor c=Cpar*4
cParWL46 WL_46 vss capacitor c=Cpar*4
cParWL47 WL_47 vss capacitor c=Cpar*4
cParWL48 WL_48 vss capacitor c=Cpar*4
cParWL49 WL_49 vss capacitor c=Cpar*4
cParWL50 WL_50 vss capacitor c=Cpar*4
cParWL51 WL_51 vss capacitor c=Cpar*4
cParWL52 WL_52 vss capacitor c=Cpar*4
cParWL53 WL_53 vss capacitor c=Cpar*4
cParWL54 WL_54 vss capacitor c=Cpar*4
cParWL55 WL_55 vss capacitor c=Cpar*4
cParWL56 WL_56 vss capacitor c=Cpar*4
cParWL57 WL_57 vss capacitor c=Cpar*4
cParWL58 WL_58 vss capacitor c=Cpar*4
cParWL59 WL_59 vss capacitor c=Cpar*4
cParWL60 WL_60 vss capacitor c=Cpar*4
cParWL61 WL_61 vss capacitor c=Cpar*4
cParWL62 WL_62 vss capacitor c=Cpar*4
cParWL63 WL_63 vss capacitor c=Cpar*4
cParWL64 RefWL vss capacitor c=Cpar*4

ends localblock