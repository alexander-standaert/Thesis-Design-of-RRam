simulator lang=spectre

subckt decoderone (IN_0 enable OUT_0 OUT_1 vdd vss NBulkLine PBulkLine)
parameters multstage_1 = 1 multstage_2 = 1


xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=multstage_2

xinv0 (IN_0 OUT_1pre vdd vss PBulkLine NBulkLine) inverter mult=multstage_2
xnor1 (OUT_1pre enablebar OUT_1 vdd vss PBulkLine NBulkLine) twonor mult=multstage_1
xnor2 (IN_0 enablebar OUT_0 vdd vss PBulkLine NBulkLine) twonor mult=multstage_1

ends decoder




subckt decodertwo (IN_0 IN_1 enable OUT_0 OUT_1 OUT_2 OUT_3 vdd vss NBulkLine PBulkLine)
parameters multstage_1 = 1 multstage_2 = 1


xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=multstage_2

xdec (IN_0 IN_1 enablebar OUT_0 OUT_1 OUT_2 OUT_3 vdd vss PBulkLine NBulkLine) twotofourdecoder multinv=multstage_2 multnor=multstage_1

ends decoder






subckt decoderthree (IN_0 IN_1 IN_2 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec (IN_0 IN_1 IN_2 enablebar OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 vdd vss PBulkLine NBulkLine) threetoeightdecoder 
ends decoder






subckt decoderfour (IN_0 IN_1 IN_2 IN_3 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec0 (IN_0 IN_1 enablebar temp_00 temp_01 temp_02 temp_03 vdd vss PBulkLine NBulkLine) twotofourdecoder 
xdec1 (IN_2 IN_3 enablebar temp_10 temp_11 temp_12 temp_13 vdd vss PBulkLine NBulkLine) twotofourdecoder 

xinv00 (temp_00 tempbar_00 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv10 (temp_10 tempbar_10 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv01 (temp_01 tempbar_01 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv11 (temp_11 tempbar_11 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv02 (temp_02 tempbar_02 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv12 (temp_12 tempbar_12 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv03 (temp_03 tempbar_03 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv13 (temp_13 tempbar_13 vdd vss PBulkLine NBulkLine) inverter mult=1.2

xnor_0_0 (tempbar_00 tempbar_10 OUT_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_0 (tempbar_01 tempbar_10 OUT_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_0 (tempbar_02 tempbar_10 OUT_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_0 (tempbar_03 tempbar_10 OUT_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_1 (tempbar_00 tempbar_11 OUT_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_1 (tempbar_01 tempbar_11 OUT_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_1 (tempbar_02 tempbar_11 OUT_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_1 (tempbar_03 tempbar_11 OUT_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_2 (tempbar_00 tempbar_12 OUT_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_2 (tempbar_01 tempbar_12 OUT_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_2 (tempbar_02 tempbar_12 OUT_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_2 (tempbar_03 tempbar_12 OUT_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_3 (tempbar_00 tempbar_13 OUT_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_3 (tempbar_01 tempbar_13 OUT_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_3 (tempbar_02 tempbar_13 OUT_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_3 (tempbar_03 tempbar_13 OUT_15 vdd vss PBulkLine NBulkLine) twonor 
ends decoderfour



subckt decoderfive (IN_0 IN_1 IN_2 IN_3 IN_4 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec0 (IN_0 IN_1 IN_2 enablebar temp_00 temp_01 temp_02 temp_03 temp_04 temp_05 temp_06 temp_07 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec1 (IN_3 IN_4 enablebar temp_10 temp_11 temp_12 temp_13 vdd vss PBulkLine NBulkLine) twotofourdecoder 

xinv00 (temp_00 tempbar_00 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv01 (temp_01 tempbar_01 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv02 (temp_02 tempbar_02 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv03 (temp_03 tempbar_03 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv04 (temp_04 tempbar_04 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv05 (temp_05 tempbar_05 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv06 (temp_06 tempbar_06 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv07 (temp_07 tempbar_07 vdd vss PBulkLine NBulkLine) inverter mult=1.2
xinv10 (temp_10 tempbar_10 vdd vss PBulkLine NBulkLine) inverter mult=1.5
xinv11 (temp_11 tempbar_11 vdd vss PBulkLine NBulkLine) inverter mult=1.5
xinv12 (temp_12 tempbar_12 vdd vss PBulkLine NBulkLine) inverter mult=1.5
xinv13 (temp_13 tempbar_13 vdd vss PBulkLine NBulkLine) inverter mult=1.5

xnor_0_0 (tempbar_00 tempbar_10 OUT_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_0 (tempbar_01 tempbar_10 OUT_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_0 (tempbar_02 tempbar_10 OUT_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_0 (tempbar_03 tempbar_10 OUT_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_0 (tempbar_04 tempbar_10 OUT_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_0 (tempbar_05 tempbar_10 OUT_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_0 (tempbar_06 tempbar_10 OUT_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_0 (tempbar_07 tempbar_10 OUT_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_1 (tempbar_00 tempbar_11 OUT_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_1 (tempbar_01 tempbar_11 OUT_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_1 (tempbar_02 tempbar_11 OUT_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_1 (tempbar_03 tempbar_11 OUT_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_1 (tempbar_04 tempbar_11 OUT_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_1 (tempbar_05 tempbar_11 OUT_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_1 (tempbar_06 tempbar_11 OUT_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_1 (tempbar_07 tempbar_11 OUT_15 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_2 (tempbar_00 tempbar_12 OUT_16 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_2 (tempbar_01 tempbar_12 OUT_17 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_2 (tempbar_02 tempbar_12 OUT_18 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_2 (tempbar_03 tempbar_12 OUT_19 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_2 (tempbar_04 tempbar_12 OUT_20 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_2 (tempbar_05 tempbar_12 OUT_21 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_2 (tempbar_06 tempbar_12 OUT_22 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_2 (tempbar_07 tempbar_12 OUT_23 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_3 (tempbar_00 tempbar_13 OUT_24 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_3 (tempbar_01 tempbar_13 OUT_25 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_3 (tempbar_02 tempbar_13 OUT_26 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_3 (tempbar_03 tempbar_13 OUT_27 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_3 (tempbar_04 tempbar_13 OUT_28 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_3 (tempbar_05 tempbar_13 OUT_29 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_3 (tempbar_06 tempbar_13 OUT_30 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_3 (tempbar_07 tempbar_13 OUT_31 vdd vss PBulkLine NBulkLine) twonor 
ends decoderfive



subckt decodersix (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec0 (IN_0 IN_1 IN_2 enablebar temp_00 temp_01 temp_02 temp_03 temp_04 temp_05 temp_06 temp_07 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec1 (IN_3 IN_4 IN_5 enablebar temp_10 temp_11 temp_12 temp_13 temp_14 temp_15 temp_16 temp_17 vdd vss PBulkLine NBulkLine) threetoeightdecoder

xinv00 (temp_00 tempbar_00 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv10 (temp_10 tempbar_10 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv01 (temp_01 tempbar_01 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv11 (temp_11 tempbar_11 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv02 (temp_02 tempbar_02 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv12 (temp_12 tempbar_12 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv03 (temp_03 tempbar_03 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv13 (temp_13 tempbar_13 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv04 (temp_04 tempbar_04 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv14 (temp_14 tempbar_14 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv05 (temp_05 tempbar_05 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv15 (temp_15 tempbar_15 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv06 (temp_06 tempbar_06 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv16 (temp_16 tempbar_16 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv07 (temp_07 tempbar_07 vdd vss PBulkLine NBulkLine) inverter  mult=1.5
xinv17 (temp_17 tempbar_17 vdd vss PBulkLine NBulkLine) inverter  mult=1.5


xnor_0_0 (tempbar_00 tempbar_10 OUT_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_0 (tempbar_01 tempbar_10 OUT_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_0 (tempbar_02 tempbar_10 OUT_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_0 (tempbar_03 tempbar_10 OUT_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_0 (tempbar_04 tempbar_10 OUT_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_0 (tempbar_05 tempbar_10 OUT_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_0 (tempbar_06 tempbar_10 OUT_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_0 (tempbar_07 tempbar_10 OUT_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_1 (tempbar_00 tempbar_11 OUT_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_1 (tempbar_01 tempbar_11 OUT_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_1 (tempbar_02 tempbar_11 OUT_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_1 (tempbar_03 tempbar_11 OUT_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_1 (tempbar_04 tempbar_11 OUT_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_1 (tempbar_05 tempbar_11 OUT_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_1 (tempbar_06 tempbar_11 OUT_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_1 (tempbar_07 tempbar_11 OUT_15 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_2 (tempbar_00 tempbar_12 OUT_16 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_2 (tempbar_01 tempbar_12 OUT_17 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_2 (tempbar_02 tempbar_12 OUT_18 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_2 (tempbar_03 tempbar_12 OUT_19 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_2 (tempbar_04 tempbar_12 OUT_20 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_2 (tempbar_05 tempbar_12 OUT_21 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_2 (tempbar_06 tempbar_12 OUT_22 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_2 (tempbar_07 tempbar_12 OUT_23 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_3 (tempbar_00 tempbar_13 OUT_24 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_3 (tempbar_01 tempbar_13 OUT_25 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_3 (tempbar_02 tempbar_13 OUT_26 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_3 (tempbar_03 tempbar_13 OUT_27 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_3 (tempbar_04 tempbar_13 OUT_28 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_3 (tempbar_05 tempbar_13 OUT_29 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_3 (tempbar_06 tempbar_13 OUT_30 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_3 (tempbar_07 tempbar_13 OUT_31 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_4 (tempbar_00 tempbar_14 OUT_32 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_4 (tempbar_01 tempbar_14 OUT_33 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_4 (tempbar_02 tempbar_14 OUT_34 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_4 (tempbar_03 tempbar_14 OUT_35 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_4 (tempbar_04 tempbar_14 OUT_36 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_4 (tempbar_05 tempbar_14 OUT_37 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_4 (tempbar_06 tempbar_14 OUT_38 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_4 (tempbar_07 tempbar_14 OUT_39 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_5 (tempbar_00 tempbar_15 OUT_40 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_5 (tempbar_01 tempbar_15 OUT_41 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_5 (tempbar_02 tempbar_15 OUT_42 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_5 (tempbar_03 tempbar_15 OUT_43 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_5 (tempbar_04 tempbar_15 OUT_44 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_5 (tempbar_05 tempbar_15 OUT_45 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_5 (tempbar_06 tempbar_15 OUT_46 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_5 (tempbar_07 tempbar_15 OUT_47 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_6 (tempbar_00 tempbar_16 OUT_48 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_6 (tempbar_01 tempbar_16 OUT_49 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_6 (tempbar_02 tempbar_16 OUT_50 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_6 (tempbar_03 tempbar_16 OUT_51 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_6 (tempbar_04 tempbar_16 OUT_52 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_6 (tempbar_05 tempbar_16 OUT_53 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_6 (tempbar_06 tempbar_16 OUT_54 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_6 (tempbar_07 tempbar_16 OUT_55 vdd vss PBulkLine NBulkLine) twonor 
xnor_0_7 (tempbar_00 tempbar_17 OUT_56 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_7 (tempbar_01 tempbar_17 OUT_57 vdd vss PBulkLine NBulkLine) twonor 
xnor_2_7 (tempbar_02 tempbar_17 OUT_58 vdd vss PBulkLine NBulkLine) twonor 
xnor_3_7 (tempbar_03 tempbar_17 OUT_59 vdd vss PBulkLine NBulkLine) twonor 
xnor_4_7 (tempbar_04 tempbar_17 OUT_60 vdd vss PBulkLine NBulkLine) twonor 
xnor_5_7 (tempbar_05 tempbar_17 OUT_61 vdd vss PBulkLine NBulkLine) twonor 
xnor_6_7 (tempbar_06 tempbar_17 OUT_62 vdd vss PBulkLine NBulkLine) twonor 
xnor_7_7 (tempbar_07 tempbar_17 OUT_63 vdd vss PBulkLine NBulkLine) twonor 
ends decodersix



subckt decoderseven (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec0 (IN_0 IN_1 IN_2 enablebar temp_00 temp_01 temp_02 temp_03 temp_04 temp_05 temp_06 temp_07 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec1 (IN_3 IN_4 enablebar temp_10 temp_11 temp_12 temp_13 vdd vss PBulkLine NBulkLine) twotofourdecoder 
xdec2 (IN_5 IN_6 enablebar temp_20 temp_21 temp_22 temp_23 vdd vss PBulkLine NBulkLine) twotofourdecoder 

xinv00 (temp_00 tempbar_00 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar00 (tempbar_00 tempbarbar_00 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar00 (tempbarbar_00 tempbarbarbar_00 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv01 (temp_01 tempbar_01 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar01 (tempbar_01 tempbarbar_01 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar01 (tempbarbar_01 tempbarbarbar_01 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv02 (temp_02 tempbar_02 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar02 (tempbar_02 tempbarbar_02 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar02 (tempbarbar_02 tempbarbarbar_02 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv03 (temp_03 tempbar_03 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar03 (tempbar_03 tempbarbar_03 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar03 (tempbarbar_03 tempbarbarbar_03 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv04 (temp_04 tempbar_04 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar04 (tempbar_04 tempbarbar_04 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar04 (tempbarbar_04 tempbarbarbar_04 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv05 (temp_05 tempbar_05 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar05 (tempbar_05 tempbarbar_05 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar05 (tempbarbar_05 tempbarbarbar_05 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv06 (temp_06 tempbar_06 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar06 (tempbar_06 tempbarbar_06 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar06 (tempbarbar_06 tempbarbarbar_06 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv07 (temp_07 tempbar_07 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar07 (tempbar_07 tempbarbar_07 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar07 (tempbarbar_07 tempbarbarbar_07 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv10 (temp_10 tempbar_10 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv20 (temp_20 tempbar_20 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar10 (tempbar_10 tempbarbar_10 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar10 (tempbarbar_10 tempbarbarbar_10 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbar20 (tempbar_20 tempbarbar_20 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar20 (tempbarbar_20 tempbarbarbar_20 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv11 (temp_11 tempbar_11 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv21 (temp_21 tempbar_21 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar11 (tempbar_11 tempbarbar_11 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar11 (tempbarbar_11 tempbarbarbar_11 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbar21 (tempbar_21 tempbarbar_21 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar21 (tempbarbar_21 tempbarbarbar_21 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv12 (temp_12 tempbar_12 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv22 (temp_22 tempbar_22 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar12 (tempbar_12 tempbarbar_12 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar12 (tempbarbar_12 tempbarbarbar_12 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbar22 (tempbar_22 tempbarbar_22 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar22 (tempbarbar_22 tempbarbarbar_22 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv13 (temp_13 tempbar_13 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv23 (temp_23 tempbar_23 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar13 (tempbar_13 tempbarbar_13 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar13 (tempbarbar_13 tempbarbarbar_13 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbar23 (tempbar_23 tempbarbar_23 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar23 (tempbarbar_23 tempbarbarbar_23 vdd vss PBulkLine NBulkLine) inverter mult=16

xnor_0_0_0 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_20 OUT_0 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_0 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_20 OUT_1 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_0 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_20 OUT_2 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_0 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_20 OUT_3 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_0 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_20 OUT_4 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_0 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_20 OUT_5 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_0 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_20 OUT_6 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_0 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_20 OUT_7 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_0 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_20 OUT_8 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_0 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_20 OUT_9 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_0 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_20 OUT_10 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_0 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_20 OUT_11 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_0 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_20 OUT_12 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_0 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_20 OUT_13 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_0 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_20 OUT_14 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_0 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_20 OUT_15 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_0 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_20 OUT_16 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_0 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_20 OUT_17 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_0 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_20 OUT_18 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_0 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_20 OUT_19 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_0 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_20 OUT_20 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_0 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_20 OUT_21 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_0 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_20 OUT_22 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_0 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_20 OUT_23 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_0 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_20 OUT_24 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_0 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_20 OUT_25 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_0 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_20 OUT_26 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_0 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_20 OUT_27 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_0 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_20 OUT_28 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_0 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_20 OUT_29 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_0 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_20 OUT_30 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_0 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_20 OUT_31 vdd vss PBulkLine NBulkLine) threenor
xnor_0_0_1 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_21 OUT_32 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_1 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_21 OUT_33 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_1 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_21 OUT_34 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_1 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_21 OUT_35 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_1 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_21 OUT_36 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_1 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_21 OUT_37 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_1 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_21 OUT_38 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_1 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_21 OUT_39 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_1 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_21 OUT_40 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_1 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_21 OUT_41 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_1 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_21 OUT_42 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_1 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_21 OUT_43 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_1 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_21 OUT_44 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_1 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_21 OUT_45 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_1 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_21 OUT_46 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_1 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_21 OUT_47 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_1 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_21 OUT_48 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_1 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_21 OUT_49 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_1 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_21 OUT_50 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_1 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_21 OUT_51 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_1 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_21 OUT_52 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_1 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_21 OUT_53 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_1 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_21 OUT_54 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_1 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_21 OUT_55 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_1 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_21 OUT_56 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_1 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_21 OUT_57 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_1 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_21 OUT_58 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_1 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_21 OUT_59 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_1 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_21 OUT_60 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_1 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_21 OUT_61 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_1 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_21 OUT_62 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_1 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_21 OUT_63 vdd vss PBulkLine NBulkLine) threenor
xnor_0_0_2 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_22 OUT_64 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_2 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_22 OUT_65 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_2 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_22 OUT_66 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_2 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_22 OUT_67 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_2 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_22 OUT_68 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_2 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_22 OUT_69 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_2 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_22 OUT_70 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_2 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_22 OUT_71 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_2 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_22 OUT_72 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_2 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_22 OUT_73 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_2 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_22 OUT_74 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_2 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_22 OUT_75 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_2 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_22 OUT_76 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_2 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_22 OUT_77 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_2 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_22 OUT_78 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_2 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_22 OUT_79 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_2 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_22 OUT_80 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_2 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_22 OUT_81 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_2 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_22 OUT_82 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_2 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_22 OUT_83 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_2 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_22 OUT_84 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_2 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_22 OUT_85 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_2 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_22 OUT_86 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_2 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_22 OUT_87 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_2 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_22 OUT_88 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_2 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_22 OUT_89 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_2 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_22 OUT_90 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_2 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_22 OUT_91 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_2 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_22 OUT_92 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_2 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_22 OUT_93 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_2 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_22 OUT_94 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_2 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_22 OUT_95 vdd vss PBulkLine NBulkLine) threenor
xnor_0_0_3 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_23 OUT_96 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_3 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_23 OUT_97 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_3 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_23 OUT_98 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_3 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_23 OUT_99 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_3 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_23 OUT_100 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_3 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_23 OUT_101 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_3 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_23 OUT_102 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_3 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_23 OUT_103 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_3 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_23 OUT_104 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_3 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_23 OUT_105 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_3 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_23 OUT_106 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_3 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_23 OUT_107 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_3 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_23 OUT_108 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_3 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_23 OUT_109 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_3 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_23 OUT_110 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_3 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_23 OUT_111 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_3 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_23 OUT_112 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_3 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_23 OUT_113 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_3 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_23 OUT_114 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_3 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_23 OUT_115 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_3 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_23 OUT_116 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_3 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_23 OUT_117 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_3 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_23 OUT_118 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_3 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_23 OUT_119 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_3 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_23 OUT_120 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_3 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_23 OUT_121 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_3 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_23 OUT_122 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_3 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_23 OUT_123 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_3 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_23 OUT_124 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_3 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_23 OUT_125 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_3 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_23 OUT_126 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_3 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_23 OUT_127 vdd vss PBulkLine NBulkLine) threenor
ends decoderseven





subckt decodereight (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 IN_7 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 OUT_128 OUT_129 OUT_130 OUT_131 OUT_132 OUT_133 OUT_134 OUT_135 OUT_136 OUT_137 OUT_138 OUT_139 OUT_140 OUT_141 OUT_142 OUT_143 OUT_144 OUT_145 OUT_146 OUT_147 OUT_148 OUT_149 OUT_150 OUT_151 OUT_152 OUT_153 OUT_154 OUT_155 OUT_156 OUT_157 OUT_158 OUT_159 OUT_160 OUT_161 OUT_162 OUT_163 OUT_164 OUT_165 OUT_166 OUT_167 OUT_168 OUT_169 OUT_170 OUT_171 OUT_172 OUT_173 OUT_174 OUT_175 OUT_176 OUT_177 OUT_178 OUT_179 OUT_180 OUT_181 OUT_182 OUT_183 OUT_184 OUT_185 OUT_186 OUT_187 OUT_188 OUT_189 OUT_190 OUT_191 OUT_192 OUT_193 OUT_194 OUT_195 OUT_196 OUT_197 OUT_198 OUT_199 OUT_200 OUT_201 OUT_202 OUT_203 OUT_204 OUT_205 OUT_206 OUT_207 OUT_208 OUT_209 OUT_210 OUT_211 OUT_212 OUT_213 OUT_214 OUT_215 OUT_216 OUT_217 OUT_218 OUT_219 OUT_220 OUT_221 OUT_222 OUT_223 OUT_224 OUT_225 OUT_226 OUT_227 OUT_228 OUT_229 OUT_230 OUT_231 OUT_232 OUT_233 OUT_234 OUT_235 OUT_236 OUT_237 OUT_238 OUT_239 OUT_240 OUT_241 OUT_242 OUT_243 OUT_244 OUT_245 OUT_246 OUT_247 OUT_248 OUT_249 OUT_250 OUT_251 OUT_252 OUT_253 OUT_254 OUT_255 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec0 (IN_0 IN_1 IN_2 enablebar temp_00 temp_01 temp_02 temp_03 temp_04 temp_05 temp_06 temp_07 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec1 (IN_3 IN_4 IN_5 enablebar temp_10 temp_11 temp_12 temp_13 temp_14 temp_15 temp_16 temp_17 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec2 (IN_6 IN_7 enablebar temp_20 temp_21 temp_22 temp_23 vdd vss PBulkLine NBulkLine) twotofourdecoder 

xinv00 (temp_00 tempbar_00 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv10 (temp_10 tempbar_10 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar00 (tempbar_00 tempbarbar_00 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar10 (tempbar_10 tempbarbar_10 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar00 (tempbarbar_00 tempbarbarbar_00 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar10 (tempbarbar_10 tempbarbarbar_10 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv01 (temp_01 tempbar_01 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv11 (temp_11 tempbar_11 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar01 (tempbar_01 tempbarbar_01 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar11 (tempbar_11 tempbarbar_11 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar01 (tempbarbar_01 tempbarbarbar_01 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar11 (tempbarbar_11 tempbarbarbar_11 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv02 (temp_02 tempbar_02 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv12 (temp_12 tempbar_12 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar02 (tempbar_02 tempbarbar_02 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar12 (tempbar_12 tempbarbar_12 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar02 (tempbarbar_02 tempbarbarbar_02 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar12 (tempbarbar_12 tempbarbarbar_12 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv03 (temp_03 tempbar_03 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv13 (temp_13 tempbar_13 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar03 (tempbar_03 tempbarbar_03 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar13 (tempbar_13 tempbarbar_13 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar03 (tempbarbar_03 tempbarbarbar_03 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar13 (tempbarbar_13 tempbarbarbar_13 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv04 (temp_04 tempbar_04 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv14 (temp_14 tempbar_14 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar04 (tempbar_04 tempbarbar_04 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar14 (tempbar_14 tempbarbar_14 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar04 (tempbarbar_04 tempbarbarbar_04 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar14 (tempbarbar_14 tempbarbarbar_14 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv05 (temp_05 tempbar_05 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv15 (temp_15 tempbar_15 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar05 (tempbar_05 tempbarbar_05 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar15 (tempbar_15 tempbarbar_15 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar05 (tempbarbar_05 tempbarbarbar_05 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar15 (tempbarbar_15 tempbarbarbar_15 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv06 (temp_06 tempbar_06 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv16 (temp_16 tempbar_16 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar06 (tempbar_06 tempbarbar_06 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar16 (tempbar_16 tempbarbar_16 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar06 (tempbarbar_06 tempbarbarbar_06 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar16 (tempbarbar_16 tempbarbarbar_16 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv07 (temp_07 tempbar_07 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv17 (temp_17 tempbar_17 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar07 (tempbar_07 tempbarbar_07 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar17 (tempbar_17 tempbarbar_17 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar07 (tempbarbar_07 tempbarbarbar_07 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar17 (tempbarbar_17 tempbarbarbar_17 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv20 (temp_20 tempbar_20 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar20 (tempbar_20 tempbarbar_20 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar20 (tempbarbar_20 tempbarbarbar_20 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv21 (temp_21 tempbar_21 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar21 (tempbar_21 tempbarbar_21 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar21 (tempbarbar_21 tempbarbarbar_21 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv22 (temp_22 tempbar_22 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar22 (tempbar_22 tempbarbar_22 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar22 (tempbarbar_22 tempbarbarbar_22 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv23 (temp_23 tempbar_23 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar23 (tempbar_23 tempbarbar_23 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar23 (tempbarbar_23 tempbarbarbar_23 vdd vss PBulkLine NBulkLine) inverter mult=16

xnor_0_0_0 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_20 OUT_0 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_0 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_20 OUT_1 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_0 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_20 OUT_2 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_0 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_20 OUT_3 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_0 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_20 OUT_4 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_0 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_20 OUT_5 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_0 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_20 OUT_6 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_0 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_20 OUT_7 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_0 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_20 OUT_8 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_0 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_20 OUT_9 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_0 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_20 OUT_10 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_0 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_20 OUT_11 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_0 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_20 OUT_12 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_0 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_20 OUT_13 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_0 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_20 OUT_14 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_0 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_20 OUT_15 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_0 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_20 OUT_16 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_0 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_20 OUT_17 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_0 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_20 OUT_18 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_0 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_20 OUT_19 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_0 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_20 OUT_20 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_0 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_20 OUT_21 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_0 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_20 OUT_22 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_0 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_20 OUT_23 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_0 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_20 OUT_24 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_0 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_20 OUT_25 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_0 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_20 OUT_26 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_0 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_20 OUT_27 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_0 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_20 OUT_28 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_0 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_20 OUT_29 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_0 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_20 OUT_30 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_0 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_20 OUT_31 vdd vss PBulkLine NBulkLine) threenor
xnor_0_4_0 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_20 OUT_32 vdd vss PBulkLine NBulkLine) threenor
xnor_1_4_0 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_20 OUT_33 vdd vss PBulkLine NBulkLine) threenor
xnor_2_4_0 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_20 OUT_34 vdd vss PBulkLine NBulkLine) threenor
xnor_3_4_0 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_20 OUT_35 vdd vss PBulkLine NBulkLine) threenor
xnor_4_4_0 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_20 OUT_36 vdd vss PBulkLine NBulkLine) threenor
xnor_5_4_0 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_20 OUT_37 vdd vss PBulkLine NBulkLine) threenor
xnor_6_4_0 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_20 OUT_38 vdd vss PBulkLine NBulkLine) threenor
xnor_7_4_0 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_20 OUT_39 vdd vss PBulkLine NBulkLine) threenor
xnor_0_5_0 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_20 OUT_40 vdd vss PBulkLine NBulkLine) threenor
xnor_1_5_0 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_20 OUT_41 vdd vss PBulkLine NBulkLine) threenor
xnor_2_5_0 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_20 OUT_42 vdd vss PBulkLine NBulkLine) threenor
xnor_3_5_0 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_20 OUT_43 vdd vss PBulkLine NBulkLine) threenor
xnor_4_5_0 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_20 OUT_44 vdd vss PBulkLine NBulkLine) threenor
xnor_5_5_0 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_20 OUT_45 vdd vss PBulkLine NBulkLine) threenor
xnor_6_5_0 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_20 OUT_46 vdd vss PBulkLine NBulkLine) threenor
xnor_7_5_0 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_20 OUT_47 vdd vss PBulkLine NBulkLine) threenor
xnor_0_6_0 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_20 OUT_48 vdd vss PBulkLine NBulkLine) threenor
xnor_1_6_0 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_20 OUT_49 vdd vss PBulkLine NBulkLine) threenor
xnor_2_6_0 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_20 OUT_50 vdd vss PBulkLine NBulkLine) threenor
xnor_3_6_0 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_20 OUT_51 vdd vss PBulkLine NBulkLine) threenor
xnor_4_6_0 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_20 OUT_52 vdd vss PBulkLine NBulkLine) threenor
xnor_5_6_0 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_20 OUT_53 vdd vss PBulkLine NBulkLine) threenor
xnor_6_6_0 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_20 OUT_54 vdd vss PBulkLine NBulkLine) threenor
xnor_7_6_0 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_20 OUT_55 vdd vss PBulkLine NBulkLine) threenor
xnor_0_7_0 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_20 OUT_56 vdd vss PBulkLine NBulkLine) threenor
xnor_1_7_0 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_20 OUT_57 vdd vss PBulkLine NBulkLine) threenor
xnor_2_7_0 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_20 OUT_58 vdd vss PBulkLine NBulkLine) threenor
xnor_3_7_0 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_20 OUT_59 vdd vss PBulkLine NBulkLine) threenor
xnor_4_7_0 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_20 OUT_60 vdd vss PBulkLine NBulkLine) threenor
xnor_5_7_0 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_20 OUT_61 vdd vss PBulkLine NBulkLine) threenor
xnor_6_7_0 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_20 OUT_62 vdd vss PBulkLine NBulkLine) threenor
xnor_7_7_0 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_20 OUT_63 vdd vss PBulkLine NBulkLine) threenor
xnor_0_0_1 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_21 OUT_64 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_1 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_21 OUT_65 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_1 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_21 OUT_66 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_1 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_21 OUT_67 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_1 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_21 OUT_68 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_1 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_21 OUT_69 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_1 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_21 OUT_70 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_1 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_21 OUT_71 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_1 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_21 OUT_72 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_1 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_21 OUT_73 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_1 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_21 OUT_74 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_1 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_21 OUT_75 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_1 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_21 OUT_76 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_1 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_21 OUT_77 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_1 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_21 OUT_78 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_1 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_21 OUT_79 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_1 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_21 OUT_80 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_1 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_21 OUT_81 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_1 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_21 OUT_82 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_1 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_21 OUT_83 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_1 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_21 OUT_84 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_1 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_21 OUT_85 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_1 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_21 OUT_86 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_1 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_21 OUT_87 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_1 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_21 OUT_88 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_1 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_21 OUT_89 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_1 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_21 OUT_90 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_1 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_21 OUT_91 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_1 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_21 OUT_92 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_1 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_21 OUT_93 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_1 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_21 OUT_94 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_1 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_21 OUT_95 vdd vss PBulkLine NBulkLine) threenor
xnor_0_4_1 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_21 OUT_96 vdd vss PBulkLine NBulkLine) threenor
xnor_1_4_1 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_21 OUT_97 vdd vss PBulkLine NBulkLine) threenor
xnor_2_4_1 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_21 OUT_98 vdd vss PBulkLine NBulkLine) threenor
xnor_3_4_1 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_21 OUT_99 vdd vss PBulkLine NBulkLine) threenor
xnor_4_4_1 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_21 OUT_100 vdd vss PBulkLine NBulkLine) threenor
xnor_5_4_1 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_21 OUT_101 vdd vss PBulkLine NBulkLine) threenor
xnor_6_4_1 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_21 OUT_102 vdd vss PBulkLine NBulkLine) threenor
xnor_7_4_1 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_21 OUT_103 vdd vss PBulkLine NBulkLine) threenor
xnor_0_5_1 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_21 OUT_104 vdd vss PBulkLine NBulkLine) threenor
xnor_1_5_1 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_21 OUT_105 vdd vss PBulkLine NBulkLine) threenor
xnor_2_5_1 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_21 OUT_106 vdd vss PBulkLine NBulkLine) threenor
xnor_3_5_1 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_21 OUT_107 vdd vss PBulkLine NBulkLine) threenor
xnor_4_5_1 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_21 OUT_108 vdd vss PBulkLine NBulkLine) threenor
xnor_5_5_1 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_21 OUT_109 vdd vss PBulkLine NBulkLine) threenor
xnor_6_5_1 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_21 OUT_110 vdd vss PBulkLine NBulkLine) threenor
xnor_7_5_1 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_21 OUT_111 vdd vss PBulkLine NBulkLine) threenor
xnor_0_6_1 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_21 OUT_112 vdd vss PBulkLine NBulkLine) threenor
xnor_1_6_1 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_21 OUT_113 vdd vss PBulkLine NBulkLine) threenor
xnor_2_6_1 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_21 OUT_114 vdd vss PBulkLine NBulkLine) threenor
xnor_3_6_1 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_21 OUT_115 vdd vss PBulkLine NBulkLine) threenor
xnor_4_6_1 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_21 OUT_116 vdd vss PBulkLine NBulkLine) threenor
xnor_5_6_1 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_21 OUT_117 vdd vss PBulkLine NBulkLine) threenor
xnor_6_6_1 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_21 OUT_118 vdd vss PBulkLine NBulkLine) threenor
xnor_7_6_1 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_21 OUT_119 vdd vss PBulkLine NBulkLine) threenor
xnor_0_7_1 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_21 OUT_120 vdd vss PBulkLine NBulkLine) threenor
xnor_1_7_1 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_21 OUT_121 vdd vss PBulkLine NBulkLine) threenor
xnor_2_7_1 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_21 OUT_122 vdd vss PBulkLine NBulkLine) threenor
xnor_3_7_1 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_21 OUT_123 vdd vss PBulkLine NBulkLine) threenor
xnor_4_7_1 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_21 OUT_124 vdd vss PBulkLine NBulkLine) threenor
xnor_5_7_1 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_21 OUT_125 vdd vss PBulkLine NBulkLine) threenor
xnor_6_7_1 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_21 OUT_126 vdd vss PBulkLine NBulkLine) threenor
xnor_7_7_1 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_21 OUT_127 vdd vss PBulkLine NBulkLine) threenor
xnor_0_0_2 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_22 OUT_128 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_2 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_22 OUT_129 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_2 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_22 OUT_130 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_2 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_22 OUT_131 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_2 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_22 OUT_132 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_2 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_22 OUT_133 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_2 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_22 OUT_134 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_2 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_22 OUT_135 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_2 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_22 OUT_136 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_2 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_22 OUT_137 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_2 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_22 OUT_138 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_2 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_22 OUT_139 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_2 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_22 OUT_140 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_2 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_22 OUT_141 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_2 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_22 OUT_142 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_2 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_22 OUT_143 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_2 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_22 OUT_144 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_2 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_22 OUT_145 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_2 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_22 OUT_146 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_2 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_22 OUT_147 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_2 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_22 OUT_148 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_2 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_22 OUT_149 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_2 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_22 OUT_150 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_2 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_22 OUT_151 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_2 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_22 OUT_152 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_2 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_22 OUT_153 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_2 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_22 OUT_154 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_2 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_22 OUT_155 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_2 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_22 OUT_156 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_2 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_22 OUT_157 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_2 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_22 OUT_158 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_2 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_22 OUT_159 vdd vss PBulkLine NBulkLine) threenor
xnor_0_4_2 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_22 OUT_160 vdd vss PBulkLine NBulkLine) threenor
xnor_1_4_2 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_22 OUT_161 vdd vss PBulkLine NBulkLine) threenor
xnor_2_4_2 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_22 OUT_162 vdd vss PBulkLine NBulkLine) threenor
xnor_3_4_2 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_22 OUT_163 vdd vss PBulkLine NBulkLine) threenor
xnor_4_4_2 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_22 OUT_164 vdd vss PBulkLine NBulkLine) threenor
xnor_5_4_2 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_22 OUT_165 vdd vss PBulkLine NBulkLine) threenor
xnor_6_4_2 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_22 OUT_166 vdd vss PBulkLine NBulkLine) threenor
xnor_7_4_2 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_22 OUT_167 vdd vss PBulkLine NBulkLine) threenor
xnor_0_5_2 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_22 OUT_168 vdd vss PBulkLine NBulkLine) threenor
xnor_1_5_2 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_22 OUT_169 vdd vss PBulkLine NBulkLine) threenor
xnor_2_5_2 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_22 OUT_170 vdd vss PBulkLine NBulkLine) threenor
xnor_3_5_2 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_22 OUT_171 vdd vss PBulkLine NBulkLine) threenor
xnor_4_5_2 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_22 OUT_172 vdd vss PBulkLine NBulkLine) threenor
xnor_5_5_2 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_22 OUT_173 vdd vss PBulkLine NBulkLine) threenor
xnor_6_5_2 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_22 OUT_174 vdd vss PBulkLine NBulkLine) threenor
xnor_7_5_2 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_22 OUT_175 vdd vss PBulkLine NBulkLine) threenor
xnor_0_6_2 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_22 OUT_176 vdd vss PBulkLine NBulkLine) threenor
xnor_1_6_2 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_22 OUT_177 vdd vss PBulkLine NBulkLine) threenor
xnor_2_6_2 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_22 OUT_178 vdd vss PBulkLine NBulkLine) threenor
xnor_3_6_2 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_22 OUT_179 vdd vss PBulkLine NBulkLine) threenor
xnor_4_6_2 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_22 OUT_180 vdd vss PBulkLine NBulkLine) threenor
xnor_5_6_2 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_22 OUT_181 vdd vss PBulkLine NBulkLine) threenor
xnor_6_6_2 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_22 OUT_182 vdd vss PBulkLine NBulkLine) threenor
xnor_7_6_2 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_22 OUT_183 vdd vss PBulkLine NBulkLine) threenor
xnor_0_7_2 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_22 OUT_184 vdd vss PBulkLine NBulkLine) threenor
xnor_1_7_2 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_22 OUT_185 vdd vss PBulkLine NBulkLine) threenor
xnor_2_7_2 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_22 OUT_186 vdd vss PBulkLine NBulkLine) threenor
xnor_3_7_2 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_22 OUT_187 vdd vss PBulkLine NBulkLine) threenor
xnor_4_7_2 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_22 OUT_188 vdd vss PBulkLine NBulkLine) threenor
xnor_5_7_2 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_22 OUT_189 vdd vss PBulkLine NBulkLine) threenor
xnor_6_7_2 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_22 OUT_190 vdd vss PBulkLine NBulkLine) threenor
xnor_7_7_2 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_22 OUT_191 vdd vss PBulkLine NBulkLine) threenor
xnor_0_0_3 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_23 OUT_192 vdd vss PBulkLine NBulkLine) threenor
xnor_1_0_3 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_23 OUT_193 vdd vss PBulkLine NBulkLine) threenor
xnor_2_0_3 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_23 OUT_194 vdd vss PBulkLine NBulkLine) threenor
xnor_3_0_3 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_23 OUT_195 vdd vss PBulkLine NBulkLine) threenor
xnor_4_0_3 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_23 OUT_196 vdd vss PBulkLine NBulkLine) threenor
xnor_5_0_3 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_23 OUT_197 vdd vss PBulkLine NBulkLine) threenor
xnor_6_0_3 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_23 OUT_198 vdd vss PBulkLine NBulkLine) threenor
xnor_7_0_3 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_23 OUT_199 vdd vss PBulkLine NBulkLine) threenor
xnor_0_1_3 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_23 OUT_200 vdd vss PBulkLine NBulkLine) threenor
xnor_1_1_3 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_23 OUT_201 vdd vss PBulkLine NBulkLine) threenor
xnor_2_1_3 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_23 OUT_202 vdd vss PBulkLine NBulkLine) threenor
xnor_3_1_3 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_23 OUT_203 vdd vss PBulkLine NBulkLine) threenor
xnor_4_1_3 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_23 OUT_204 vdd vss PBulkLine NBulkLine) threenor
xnor_5_1_3 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_23 OUT_205 vdd vss PBulkLine NBulkLine) threenor
xnor_6_1_3 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_23 OUT_206 vdd vss PBulkLine NBulkLine) threenor
xnor_7_1_3 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_23 OUT_207 vdd vss PBulkLine NBulkLine) threenor
xnor_0_2_3 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_23 OUT_208 vdd vss PBulkLine NBulkLine) threenor
xnor_1_2_3 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_23 OUT_209 vdd vss PBulkLine NBulkLine) threenor
xnor_2_2_3 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_23 OUT_210 vdd vss PBulkLine NBulkLine) threenor
xnor_3_2_3 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_23 OUT_211 vdd vss PBulkLine NBulkLine) threenor
xnor_4_2_3 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_23 OUT_212 vdd vss PBulkLine NBulkLine) threenor
xnor_5_2_3 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_23 OUT_213 vdd vss PBulkLine NBulkLine) threenor
xnor_6_2_3 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_23 OUT_214 vdd vss PBulkLine NBulkLine) threenor
xnor_7_2_3 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_23 OUT_215 vdd vss PBulkLine NBulkLine) threenor
xnor_0_3_3 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_23 OUT_216 vdd vss PBulkLine NBulkLine) threenor
xnor_1_3_3 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_23 OUT_217 vdd vss PBulkLine NBulkLine) threenor
xnor_2_3_3 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_23 OUT_218 vdd vss PBulkLine NBulkLine) threenor
xnor_3_3_3 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_23 OUT_219 vdd vss PBulkLine NBulkLine) threenor
xnor_4_3_3 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_23 OUT_220 vdd vss PBulkLine NBulkLine) threenor
xnor_5_3_3 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_23 OUT_221 vdd vss PBulkLine NBulkLine) threenor
xnor_6_3_3 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_23 OUT_222 vdd vss PBulkLine NBulkLine) threenor
xnor_7_3_3 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_23 OUT_223 vdd vss PBulkLine NBulkLine) threenor
xnor_0_4_3 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_23 OUT_224 vdd vss PBulkLine NBulkLine) threenor
xnor_1_4_3 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_23 OUT_225 vdd vss PBulkLine NBulkLine) threenor
xnor_2_4_3 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_23 OUT_226 vdd vss PBulkLine NBulkLine) threenor
xnor_3_4_3 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_23 OUT_227 vdd vss PBulkLine NBulkLine) threenor
xnor_4_4_3 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_23 OUT_228 vdd vss PBulkLine NBulkLine) threenor
xnor_5_4_3 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_23 OUT_229 vdd vss PBulkLine NBulkLine) threenor
xnor_6_4_3 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_23 OUT_230 vdd vss PBulkLine NBulkLine) threenor
xnor_7_4_3 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_23 OUT_231 vdd vss PBulkLine NBulkLine) threenor
xnor_0_5_3 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_23 OUT_232 vdd vss PBulkLine NBulkLine) threenor
xnor_1_5_3 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_23 OUT_233 vdd vss PBulkLine NBulkLine) threenor
xnor_2_5_3 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_23 OUT_234 vdd vss PBulkLine NBulkLine) threenor
xnor_3_5_3 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_23 OUT_235 vdd vss PBulkLine NBulkLine) threenor
xnor_4_5_3 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_23 OUT_236 vdd vss PBulkLine NBulkLine) threenor
xnor_5_5_3 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_23 OUT_237 vdd vss PBulkLine NBulkLine) threenor
xnor_6_5_3 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_23 OUT_238 vdd vss PBulkLine NBulkLine) threenor
xnor_7_5_3 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_23 OUT_239 vdd vss PBulkLine NBulkLine) threenor
xnor_0_6_3 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_23 OUT_240 vdd vss PBulkLine NBulkLine) threenor
xnor_1_6_3 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_23 OUT_241 vdd vss PBulkLine NBulkLine) threenor
xnor_2_6_3 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_23 OUT_242 vdd vss PBulkLine NBulkLine) threenor
xnor_3_6_3 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_23 OUT_243 vdd vss PBulkLine NBulkLine) threenor
xnor_4_6_3 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_23 OUT_244 vdd vss PBulkLine NBulkLine) threenor
xnor_5_6_3 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_23 OUT_245 vdd vss PBulkLine NBulkLine) threenor
xnor_6_6_3 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_23 OUT_246 vdd vss PBulkLine NBulkLine) threenor
xnor_7_6_3 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_23 OUT_247 vdd vss PBulkLine NBulkLine) threenor
xnor_0_7_3 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_23 OUT_248 vdd vss PBulkLine NBulkLine) threenor
xnor_1_7_3 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_23 OUT_249 vdd vss PBulkLine NBulkLine) threenor
xnor_2_7_3 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_23 OUT_250 vdd vss PBulkLine NBulkLine) threenor
xnor_3_7_3 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_23 OUT_251 vdd vss PBulkLine NBulkLine) threenor
xnor_4_7_3 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_23 OUT_252 vdd vss PBulkLine NBulkLine) threenor
xnor_5_7_3 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_23 OUT_253 vdd vss PBulkLine NBulkLine) threenor
xnor_6_7_3 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_23 OUT_254 vdd vss PBulkLine NBulkLine) threenor
xnor_7_7_3 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_23 OUT_255 vdd vss PBulkLine NBulkLine) threenor
ends decodereight




subckt decodernine (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 IN_7 IN_8 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 OUT_128 OUT_129 OUT_130 OUT_131 OUT_132 OUT_133 OUT_134 OUT_135 OUT_136 OUT_137 OUT_138 OUT_139 OUT_140 OUT_141 OUT_142 OUT_143 OUT_144 OUT_145 OUT_146 OUT_147 OUT_148 OUT_149 OUT_150 OUT_151 OUT_152 OUT_153 OUT_154 OUT_155 OUT_156 OUT_157 OUT_158 OUT_159 OUT_160 OUT_161 OUT_162 OUT_163 OUT_164 OUT_165 OUT_166 OUT_167 OUT_168 OUT_169 OUT_170 OUT_171 OUT_172 OUT_173 OUT_174 OUT_175 OUT_176 OUT_177 OUT_178 OUT_179 OUT_180 OUT_181 OUT_182 OUT_183 OUT_184 OUT_185 OUT_186 OUT_187 OUT_188 OUT_189 OUT_190 OUT_191 OUT_192 OUT_193 OUT_194 OUT_195 OUT_196 OUT_197 OUT_198 OUT_199 OUT_200 OUT_201 OUT_202 OUT_203 OUT_204 OUT_205 OUT_206 OUT_207 OUT_208 OUT_209 OUT_210 OUT_211 OUT_212 OUT_213 OUT_214 OUT_215 OUT_216 OUT_217 OUT_218 OUT_219 OUT_220 OUT_221 OUT_222 OUT_223 OUT_224 OUT_225 OUT_226 OUT_227 OUT_228 OUT_229 OUT_230 OUT_231 OUT_232 OUT_233 OUT_234 OUT_235 OUT_236 OUT_237 OUT_238 OUT_239 OUT_240 OUT_241 OUT_242 OUT_243 OUT_244 OUT_245 OUT_246 OUT_247 OUT_248 OUT_249 OUT_250 OUT_251 OUT_252 OUT_253 OUT_254 OUT_255 OUT_256 OUT_257 OUT_258 OUT_259 OUT_260 OUT_261 OUT_262 OUT_263 OUT_264 OUT_265 OUT_266 OUT_267 OUT_268 OUT_269 OUT_270 OUT_271 OUT_272 OUT_273 OUT_274 OUT_275 OUT_276 OUT_277 OUT_278 OUT_279 OUT_280 OUT_281 OUT_282 OUT_283 OUT_284 OUT_285 OUT_286 OUT_287 OUT_288 OUT_289 OUT_290 OUT_291 OUT_292 OUT_293 OUT_294 OUT_295 OUT_296 OUT_297 OUT_298 OUT_299 OUT_300 OUT_301 OUT_302 OUT_303 OUT_304 OUT_305 OUT_306 OUT_307 OUT_308 OUT_309 OUT_310 OUT_311 OUT_312 OUT_313 OUT_314 OUT_315 OUT_316 OUT_317 OUT_318 OUT_319 OUT_320 OUT_321 OUT_322 OUT_323 OUT_324 OUT_325 OUT_326 OUT_327 OUT_328 OUT_329 OUT_330 OUT_331 OUT_332 OUT_333 OUT_334 OUT_335 OUT_336 OUT_337 OUT_338 OUT_339 OUT_340 OUT_341 OUT_342 OUT_343 OUT_344 OUT_345 OUT_346 OUT_347 OUT_348 OUT_349 OUT_350 OUT_351 OUT_352 OUT_353 OUT_354 OUT_355 OUT_356 OUT_357 OUT_358 OUT_359 OUT_360 OUT_361 OUT_362 OUT_363 OUT_364 OUT_365 OUT_366 OUT_367 OUT_368 OUT_369 OUT_370 OUT_371 OUT_372 OUT_373 OUT_374 OUT_375 OUT_376 OUT_377 OUT_378 OUT_379 OUT_380 OUT_381 OUT_382 OUT_383 OUT_384 OUT_385 OUT_386 OUT_387 OUT_388 OUT_389 OUT_390 OUT_391 OUT_392 OUT_393 OUT_394 OUT_395 OUT_396 OUT_397 OUT_398 OUT_399 OUT_400 OUT_401 OUT_402 OUT_403 OUT_404 OUT_405 OUT_406 OUT_407 OUT_408 OUT_409 OUT_410 OUT_411 OUT_412 OUT_413 OUT_414 OUT_415 OUT_416 OUT_417 OUT_418 OUT_419 OUT_420 OUT_421 OUT_422 OUT_423 OUT_424 OUT_425 OUT_426 OUT_427 OUT_428 OUT_429 OUT_430 OUT_431 OUT_432 OUT_433 OUT_434 OUT_435 OUT_436 OUT_437 OUT_438 OUT_439 OUT_440 OUT_441 OUT_442 OUT_443 OUT_444 OUT_445 OUT_446 OUT_447 OUT_448 OUT_449 OUT_450 OUT_451 OUT_452 OUT_453 OUT_454 OUT_455 OUT_456 OUT_457 OUT_458 OUT_459 OUT_460 OUT_461 OUT_462 OUT_463 OUT_464 OUT_465 OUT_466 OUT_467 OUT_468 OUT_469 OUT_470 OUT_471 OUT_472 OUT_473 OUT_474 OUT_475 OUT_476 OUT_477 OUT_478 OUT_479 OUT_480 OUT_481 OUT_482 OUT_483 OUT_484 OUT_485 OUT_486 OUT_487 OUT_488 OUT_489 OUT_490 OUT_491 OUT_492 OUT_493 OUT_494 OUT_495 OUT_496 OUT_497 OUT_498 OUT_499 OUT_500 OUT_501 OUT_502 OUT_503 OUT_504 OUT_505 OUT_506 OUT_507 OUT_508 OUT_509 OUT_510 OUT_511 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=2

xdec0 (IN_0 IN_1 IN_2 enablebar temp_00 temp_01 temp_02 temp_03 temp_04 temp_05 temp_06 temp_07 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec1 (IN_3 IN_4 IN_5 enablebar temp_10 temp_11 temp_12 temp_13 temp_14 temp_15 temp_16 temp_17 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec2 (IN_6 IN_7 IN_8 enablebar temp_20 temp_21 temp_22 temp_23 temp_24 temp_25 temp_26 temp_27 vdd vss PBulkLine NBulkLine) threetoeightdecoder

xinv00 (temp_00 tempbar_00 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv10 (temp_10 tempbar_10 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv20 (temp_20 tempbar_20 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar00 (tempbar_00 tempbarbar_00 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar10 (tempbar_10 tempbarbar_10 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar20 (tempbar_20 tempbarbar_20 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar00 (tempbarbar_00 tempbarbarbar_00 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar10 (tempbarbar_10 tempbarbarbar_10 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar20 (tempbarbar_20 tempbarbarbar_20 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv01 (temp_01 tempbar_01 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv11 (temp_11 tempbar_11 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv21 (temp_21 tempbar_21 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar01 (tempbar_01 tempbarbar_01 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar11 (tempbar_11 tempbarbar_11 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar21 (tempbar_21 tempbarbar_21 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar01 (tempbarbar_01 tempbarbarbar_01 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar11 (tempbarbar_11 tempbarbarbar_11 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar21 (tempbarbar_21 tempbarbarbar_21 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv02 (temp_02 tempbar_02 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv12 (temp_12 tempbar_12 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv22 (temp_22 tempbar_22 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar02 (tempbar_02 tempbarbar_02 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar12 (tempbar_12 tempbarbar_12 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar22 (tempbar_22 tempbarbar_22 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar02 (tempbarbar_02 tempbarbarbar_02 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar12 (tempbarbar_12 tempbarbarbar_12 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar22 (tempbarbar_22 tempbarbarbar_22 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv03 (temp_03 tempbar_03 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv13 (temp_13 tempbar_13 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv23 (temp_23 tempbar_23 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar03 (tempbar_03 tempbarbar_03 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar13 (tempbar_13 tempbarbar_13 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar23 (tempbar_23 tempbarbar_23 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar03 (tempbarbar_03 tempbarbarbar_03 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar13 (tempbarbar_13 tempbarbarbar_13 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar23 (tempbarbar_23 tempbarbarbar_23 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv04 (temp_04 tempbar_04 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv14 (temp_14 tempbar_14 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv24 (temp_24 tempbar_24 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar04 (tempbar_04 tempbarbar_04 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar14 (tempbar_14 tempbarbar_14 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar24 (tempbar_24 tempbarbar_24 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar04 (tempbarbar_04 tempbarbarbar_04 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar14 (tempbarbar_14 tempbarbarbar_14 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar24 (tempbarbar_24 tempbarbarbar_24 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv05 (temp_05 tempbar_05 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv15 (temp_15 tempbar_15 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv25 (temp_25 tempbar_25 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar05 (tempbar_05 tempbarbar_05 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar15 (tempbar_15 tempbarbar_15 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar25 (tempbar_25 tempbarbar_25 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar05 (tempbarbar_05 tempbarbarbar_05 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar15 (tempbarbar_15 tempbarbarbar_15 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar25 (tempbarbar_25 tempbarbarbar_25 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv06 (temp_06 tempbar_06 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv16 (temp_16 tempbar_16 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv26 (temp_26 tempbar_26 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar06 (tempbar_06 tempbarbar_06 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar16 (tempbar_16 tempbarbar_16 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar26 (tempbar_26 tempbarbar_26 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar06 (tempbarbar_06 tempbarbarbar_06 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar16 (tempbarbar_16 tempbarbarbar_16 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar26 (tempbarbar_26 tempbarbarbar_26 vdd vss PBulkLine NBulkLine) inverter mult=16
xinv07 (temp_07 tempbar_07 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv17 (temp_17 tempbar_17 vdd vss PBulkLine NBulkLine) inverter mult=2
xinv27 (temp_27 tempbar_27 vdd vss PBulkLine NBulkLine) inverter mult=2
xinvbar07 (tempbar_07 tempbarbar_07 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar17 (tempbar_17 tempbarbar_17 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbar27 (tempbar_27 tempbarbar_27 vdd vss PBulkLine NBulkLine) inverter mult=4
xinvbarbar07 (tempbarbar_07 tempbarbarbar_07 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar17 (tempbarbar_17 tempbarbarbar_17 vdd vss PBulkLine NBulkLine) inverter mult=16
xinvbarbar27 (tempbarbar_27 tempbarbarbar_27 vdd vss PBulkLine NBulkLine) inverter mult=16


xnor_0_0_0 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_20 OUT_0 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_0 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_20 OUT_1 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_0 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_20 OUT_2 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_0 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_20 OUT_3 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_0 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_20 OUT_4 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_0 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_20 OUT_5 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_0 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_20 OUT_6 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_0 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_20 OUT_7 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_0 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_20 OUT_8 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_0 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_20 OUT_9 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_0 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_20 OUT_10 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_0 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_20 OUT_11 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_0 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_20 OUT_12 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_0 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_20 OUT_13 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_0 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_20 OUT_14 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_0 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_20 OUT_15 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_0 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_20 OUT_16 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_0 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_20 OUT_17 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_0 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_20 OUT_18 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_0 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_20 OUT_19 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_0 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_20 OUT_20 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_0 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_20 OUT_21 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_0 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_20 OUT_22 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_0 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_20 OUT_23 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_0 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_20 OUT_24 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_0 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_20 OUT_25 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_0 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_20 OUT_26 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_0 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_20 OUT_27 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_0 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_20 OUT_28 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_0 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_20 OUT_29 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_0 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_20 OUT_30 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_0 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_20 OUT_31 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_0 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_20 OUT_32 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_0 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_20 OUT_33 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_0 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_20 OUT_34 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_0 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_20 OUT_35 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_0 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_20 OUT_36 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_0 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_20 OUT_37 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_0 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_20 OUT_38 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_0 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_20 OUT_39 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_0 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_20 OUT_40 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_0 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_20 OUT_41 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_0 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_20 OUT_42 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_0 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_20 OUT_43 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_0 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_20 OUT_44 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_0 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_20 OUT_45 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_0 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_20 OUT_46 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_0 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_20 OUT_47 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_0 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_20 OUT_48 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_0 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_20 OUT_49 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_0 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_20 OUT_50 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_0 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_20 OUT_51 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_0 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_20 OUT_52 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_0 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_20 OUT_53 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_0 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_20 OUT_54 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_0 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_20 OUT_55 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_0 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_20 OUT_56 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_0 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_20 OUT_57 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_0 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_20 OUT_58 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_0 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_20 OUT_59 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_0 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_20 OUT_60 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_0 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_20 OUT_61 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_0 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_20 OUT_62 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_0 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_20 OUT_63 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_1 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_21 OUT_64 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_1 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_21 OUT_65 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_1 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_21 OUT_66 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_1 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_21 OUT_67 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_1 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_21 OUT_68 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_1 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_21 OUT_69 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_1 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_21 OUT_70 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_1 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_21 OUT_71 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_1 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_21 OUT_72 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_1 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_21 OUT_73 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_1 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_21 OUT_74 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_1 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_21 OUT_75 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_1 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_21 OUT_76 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_1 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_21 OUT_77 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_1 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_21 OUT_78 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_1 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_21 OUT_79 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_1 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_21 OUT_80 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_1 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_21 OUT_81 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_1 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_21 OUT_82 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_1 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_21 OUT_83 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_1 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_21 OUT_84 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_1 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_21 OUT_85 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_1 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_21 OUT_86 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_1 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_21 OUT_87 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_1 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_21 OUT_88 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_1 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_21 OUT_89 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_1 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_21 OUT_90 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_1 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_21 OUT_91 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_1 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_21 OUT_92 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_1 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_21 OUT_93 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_1 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_21 OUT_94 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_1 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_21 OUT_95 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_1 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_21 OUT_96 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_1 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_21 OUT_97 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_1 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_21 OUT_98 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_1 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_21 OUT_99 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_1 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_21 OUT_100 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_1 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_21 OUT_101 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_1 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_21 OUT_102 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_1 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_21 OUT_103 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_1 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_21 OUT_104 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_1 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_21 OUT_105 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_1 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_21 OUT_106 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_1 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_21 OUT_107 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_1 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_21 OUT_108 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_1 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_21 OUT_109 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_1 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_21 OUT_110 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_1 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_21 OUT_111 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_1 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_21 OUT_112 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_1 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_21 OUT_113 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_1 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_21 OUT_114 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_1 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_21 OUT_115 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_1 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_21 OUT_116 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_1 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_21 OUT_117 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_1 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_21 OUT_118 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_1 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_21 OUT_119 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_1 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_21 OUT_120 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_1 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_21 OUT_121 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_1 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_21 OUT_122 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_1 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_21 OUT_123 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_1 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_21 OUT_124 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_1 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_21 OUT_125 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_1 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_21 OUT_126 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_1 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_21 OUT_127 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_2 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_22 OUT_128 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_2 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_22 OUT_129 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_2 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_22 OUT_130 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_2 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_22 OUT_131 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_2 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_22 OUT_132 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_2 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_22 OUT_133 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_2 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_22 OUT_134 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_2 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_22 OUT_135 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_2 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_22 OUT_136 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_2 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_22 OUT_137 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_2 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_22 OUT_138 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_2 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_22 OUT_139 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_2 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_22 OUT_140 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_2 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_22 OUT_141 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_2 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_22 OUT_142 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_2 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_22 OUT_143 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_2 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_22 OUT_144 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_2 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_22 OUT_145 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_2 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_22 OUT_146 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_2 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_22 OUT_147 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_2 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_22 OUT_148 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_2 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_22 OUT_149 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_2 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_22 OUT_150 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_2 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_22 OUT_151 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_2 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_22 OUT_152 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_2 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_22 OUT_153 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_2 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_22 OUT_154 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_2 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_22 OUT_155 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_2 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_22 OUT_156 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_2 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_22 OUT_157 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_2 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_22 OUT_158 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_2 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_22 OUT_159 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_2 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_22 OUT_160 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_2 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_22 OUT_161 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_2 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_22 OUT_162 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_2 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_22 OUT_163 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_2 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_22 OUT_164 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_2 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_22 OUT_165 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_2 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_22 OUT_166 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_2 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_22 OUT_167 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_2 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_22 OUT_168 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_2 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_22 OUT_169 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_2 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_22 OUT_170 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_2 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_22 OUT_171 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_2 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_22 OUT_172 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_2 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_22 OUT_173 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_2 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_22 OUT_174 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_2 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_22 OUT_175 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_2 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_22 OUT_176 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_2 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_22 OUT_177 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_2 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_22 OUT_178 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_2 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_22 OUT_179 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_2 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_22 OUT_180 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_2 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_22 OUT_181 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_2 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_22 OUT_182 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_2 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_22 OUT_183 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_2 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_22 OUT_184 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_2 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_22 OUT_185 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_2 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_22 OUT_186 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_2 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_22 OUT_187 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_2 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_22 OUT_188 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_2 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_22 OUT_189 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_2 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_22 OUT_190 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_2 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_22 OUT_191 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_3 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_23 OUT_192 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_3 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_23 OUT_193 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_3 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_23 OUT_194 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_3 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_23 OUT_195 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_3 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_23 OUT_196 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_3 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_23 OUT_197 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_3 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_23 OUT_198 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_3 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_23 OUT_199 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_3 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_23 OUT_200 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_3 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_23 OUT_201 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_3 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_23 OUT_202 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_3 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_23 OUT_203 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_3 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_23 OUT_204 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_3 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_23 OUT_205 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_3 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_23 OUT_206 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_3 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_23 OUT_207 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_3 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_23 OUT_208 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_3 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_23 OUT_209 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_3 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_23 OUT_210 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_3 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_23 OUT_211 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_3 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_23 OUT_212 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_3 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_23 OUT_213 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_3 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_23 OUT_214 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_3 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_23 OUT_215 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_3 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_23 OUT_216 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_3 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_23 OUT_217 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_3 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_23 OUT_218 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_3 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_23 OUT_219 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_3 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_23 OUT_220 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_3 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_23 OUT_221 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_3 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_23 OUT_222 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_3 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_23 OUT_223 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_3 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_23 OUT_224 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_3 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_23 OUT_225 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_3 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_23 OUT_226 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_3 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_23 OUT_227 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_3 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_23 OUT_228 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_3 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_23 OUT_229 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_3 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_23 OUT_230 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_3 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_23 OUT_231 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_3 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_23 OUT_232 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_3 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_23 OUT_233 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_3 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_23 OUT_234 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_3 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_23 OUT_235 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_3 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_23 OUT_236 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_3 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_23 OUT_237 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_3 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_23 OUT_238 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_3 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_23 OUT_239 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_3 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_23 OUT_240 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_3 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_23 OUT_241 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_3 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_23 OUT_242 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_3 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_23 OUT_243 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_3 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_23 OUT_244 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_3 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_23 OUT_245 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_3 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_23 OUT_246 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_3 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_23 OUT_247 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_3 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_23 OUT_248 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_3 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_23 OUT_249 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_3 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_23 OUT_250 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_3 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_23 OUT_251 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_3 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_23 OUT_252 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_3 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_23 OUT_253 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_3 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_23 OUT_254 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_3 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_23 OUT_255 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_4 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_24 OUT_256 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_4 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_24 OUT_257 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_4 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_24 OUT_258 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_4 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_24 OUT_259 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_4 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_24 OUT_260 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_4 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_24 OUT_261 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_4 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_24 OUT_262 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_4 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_24 OUT_263 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_4 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_24 OUT_264 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_4 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_24 OUT_265 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_4 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_24 OUT_266 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_4 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_24 OUT_267 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_4 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_24 OUT_268 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_4 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_24 OUT_269 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_4 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_24 OUT_270 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_4 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_24 OUT_271 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_4 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_24 OUT_272 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_4 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_24 OUT_273 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_4 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_24 OUT_274 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_4 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_24 OUT_275 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_4 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_24 OUT_276 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_4 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_24 OUT_277 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_4 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_24 OUT_278 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_4 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_24 OUT_279 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_4 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_24 OUT_280 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_4 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_24 OUT_281 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_4 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_24 OUT_282 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_4 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_24 OUT_283 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_4 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_24 OUT_284 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_4 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_24 OUT_285 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_4 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_24 OUT_286 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_4 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_24 OUT_287 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_4 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_24 OUT_288 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_4 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_24 OUT_289 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_4 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_24 OUT_290 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_4 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_24 OUT_291 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_4 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_24 OUT_292 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_4 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_24 OUT_293 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_4 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_24 OUT_294 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_4 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_24 OUT_295 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_4 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_24 OUT_296 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_4 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_24 OUT_297 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_4 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_24 OUT_298 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_4 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_24 OUT_299 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_4 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_24 OUT_300 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_4 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_24 OUT_301 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_4 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_24 OUT_302 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_4 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_24 OUT_303 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_4 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_24 OUT_304 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_4 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_24 OUT_305 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_4 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_24 OUT_306 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_4 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_24 OUT_307 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_4 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_24 OUT_308 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_4 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_24 OUT_309 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_4 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_24 OUT_310 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_4 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_24 OUT_311 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_4 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_24 OUT_312 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_4 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_24 OUT_313 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_4 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_24 OUT_314 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_4 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_24 OUT_315 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_4 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_24 OUT_316 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_4 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_24 OUT_317 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_4 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_24 OUT_318 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_4 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_24 OUT_319 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_5 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_25 OUT_320 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_5 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_25 OUT_321 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_5 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_25 OUT_322 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_5 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_25 OUT_323 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_5 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_25 OUT_324 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_5 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_25 OUT_325 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_5 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_25 OUT_326 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_5 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_25 OUT_327 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_5 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_25 OUT_328 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_5 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_25 OUT_329 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_5 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_25 OUT_330 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_5 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_25 OUT_331 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_5 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_25 OUT_332 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_5 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_25 OUT_333 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_5 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_25 OUT_334 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_5 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_25 OUT_335 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_5 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_25 OUT_336 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_5 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_25 OUT_337 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_5 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_25 OUT_338 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_5 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_25 OUT_339 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_5 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_25 OUT_340 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_5 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_25 OUT_341 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_5 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_25 OUT_342 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_5 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_25 OUT_343 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_5 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_25 OUT_344 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_5 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_25 OUT_345 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_5 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_25 OUT_346 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_5 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_25 OUT_347 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_5 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_25 OUT_348 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_5 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_25 OUT_349 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_5 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_25 OUT_350 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_5 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_25 OUT_351 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_5 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_25 OUT_352 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_5 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_25 OUT_353 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_5 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_25 OUT_354 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_5 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_25 OUT_355 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_5 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_25 OUT_356 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_5 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_25 OUT_357 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_5 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_25 OUT_358 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_5 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_25 OUT_359 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_5 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_25 OUT_360 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_5 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_25 OUT_361 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_5 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_25 OUT_362 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_5 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_25 OUT_363 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_5 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_25 OUT_364 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_5 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_25 OUT_365 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_5 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_25 OUT_366 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_5 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_25 OUT_367 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_5 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_25 OUT_368 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_5 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_25 OUT_369 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_5 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_25 OUT_370 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_5 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_25 OUT_371 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_5 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_25 OUT_372 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_5 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_25 OUT_373 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_5 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_25 OUT_374 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_5 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_25 OUT_375 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_5 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_25 OUT_376 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_5 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_25 OUT_377 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_5 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_25 OUT_378 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_5 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_25 OUT_379 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_5 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_25 OUT_380 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_5 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_25 OUT_381 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_5 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_25 OUT_382 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_5 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_25 OUT_383 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_6 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_26 OUT_384 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_6 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_26 OUT_385 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_6 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_26 OUT_386 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_6 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_26 OUT_387 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_6 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_26 OUT_388 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_6 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_26 OUT_389 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_6 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_26 OUT_390 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_6 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_26 OUT_391 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_6 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_26 OUT_392 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_6 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_26 OUT_393 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_6 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_26 OUT_394 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_6 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_26 OUT_395 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_6 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_26 OUT_396 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_6 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_26 OUT_397 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_6 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_26 OUT_398 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_6 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_26 OUT_399 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_6 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_26 OUT_400 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_6 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_26 OUT_401 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_6 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_26 OUT_402 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_6 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_26 OUT_403 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_6 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_26 OUT_404 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_6 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_26 OUT_405 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_6 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_26 OUT_406 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_6 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_26 OUT_407 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_6 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_26 OUT_408 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_6 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_26 OUT_409 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_6 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_26 OUT_410 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_6 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_26 OUT_411 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_6 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_26 OUT_412 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_6 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_26 OUT_413 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_6 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_26 OUT_414 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_6 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_26 OUT_415 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_6 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_26 OUT_416 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_6 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_26 OUT_417 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_6 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_26 OUT_418 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_6 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_26 OUT_419 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_6 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_26 OUT_420 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_6 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_26 OUT_421 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_6 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_26 OUT_422 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_6 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_26 OUT_423 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_6 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_26 OUT_424 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_6 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_26 OUT_425 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_6 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_26 OUT_426 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_6 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_26 OUT_427 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_6 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_26 OUT_428 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_6 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_26 OUT_429 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_6 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_26 OUT_430 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_6 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_26 OUT_431 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_6 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_26 OUT_432 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_6 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_26 OUT_433 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_6 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_26 OUT_434 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_6 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_26 OUT_435 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_6 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_26 OUT_436 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_6 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_26 OUT_437 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_6 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_26 OUT_438 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_6 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_26 OUT_439 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_6 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_26 OUT_440 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_6 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_26 OUT_441 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_6 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_26 OUT_442 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_6 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_26 OUT_443 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_6 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_26 OUT_444 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_6 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_26 OUT_445 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_6 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_26 OUT_446 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_6 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_26 OUT_447 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_0_7 (tempbarbarbar_00 tempbarbarbar_10 tempbarbarbar_27 OUT_448 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_0_7 (tempbarbarbar_01 tempbarbarbar_10 tempbarbarbar_27 OUT_449 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_0_7 (tempbarbarbar_02 tempbarbarbar_10 tempbarbarbar_27 OUT_450 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_0_7 (tempbarbarbar_03 tempbarbarbar_10 tempbarbarbar_27 OUT_451 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_0_7 (tempbarbarbar_04 tempbarbarbar_10 tempbarbarbar_27 OUT_452 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_0_7 (tempbarbarbar_05 tempbarbarbar_10 tempbarbarbar_27 OUT_453 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_0_7 (tempbarbarbar_06 tempbarbarbar_10 tempbarbarbar_27 OUT_454 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_0_7 (tempbarbarbar_07 tempbarbarbar_10 tempbarbarbar_27 OUT_455 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_1_7 (tempbarbarbar_00 tempbarbarbar_11 tempbarbarbar_27 OUT_456 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_1_7 (tempbarbarbar_01 tempbarbarbar_11 tempbarbarbar_27 OUT_457 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_1_7 (tempbarbarbar_02 tempbarbarbar_11 tempbarbarbar_27 OUT_458 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_1_7 (tempbarbarbar_03 tempbarbarbar_11 tempbarbarbar_27 OUT_459 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_1_7 (tempbarbarbar_04 tempbarbarbar_11 tempbarbarbar_27 OUT_460 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_1_7 (tempbarbarbar_05 tempbarbarbar_11 tempbarbarbar_27 OUT_461 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_1_7 (tempbarbarbar_06 tempbarbarbar_11 tempbarbarbar_27 OUT_462 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_1_7 (tempbarbarbar_07 tempbarbarbar_11 tempbarbarbar_27 OUT_463 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_2_7 (tempbarbarbar_00 tempbarbarbar_12 tempbarbarbar_27 OUT_464 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_2_7 (tempbarbarbar_01 tempbarbarbar_12 tempbarbarbar_27 OUT_465 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_2_7 (tempbarbarbar_02 tempbarbarbar_12 tempbarbarbar_27 OUT_466 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_2_7 (tempbarbarbar_03 tempbarbarbar_12 tempbarbarbar_27 OUT_467 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_2_7 (tempbarbarbar_04 tempbarbarbar_12 tempbarbarbar_27 OUT_468 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_2_7 (tempbarbarbar_05 tempbarbarbar_12 tempbarbarbar_27 OUT_469 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_2_7 (tempbarbarbar_06 tempbarbarbar_12 tempbarbarbar_27 OUT_470 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_2_7 (tempbarbarbar_07 tempbarbarbar_12 tempbarbarbar_27 OUT_471 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_3_7 (tempbarbarbar_00 tempbarbarbar_13 tempbarbarbar_27 OUT_472 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_3_7 (tempbarbarbar_01 tempbarbarbar_13 tempbarbarbar_27 OUT_473 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_3_7 (tempbarbarbar_02 tempbarbarbar_13 tempbarbarbar_27 OUT_474 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_3_7 (tempbarbarbar_03 tempbarbarbar_13 tempbarbarbar_27 OUT_475 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_3_7 (tempbarbarbar_04 tempbarbarbar_13 tempbarbarbar_27 OUT_476 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_3_7 (tempbarbarbar_05 tempbarbarbar_13 tempbarbarbar_27 OUT_477 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_3_7 (tempbarbarbar_06 tempbarbarbar_13 tempbarbarbar_27 OUT_478 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_3_7 (tempbarbarbar_07 tempbarbarbar_13 tempbarbarbar_27 OUT_479 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_4_7 (tempbarbarbar_00 tempbarbarbar_14 tempbarbarbar_27 OUT_480 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_4_7 (tempbarbarbar_01 tempbarbarbar_14 tempbarbarbar_27 OUT_481 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_4_7 (tempbarbarbar_02 tempbarbarbar_14 tempbarbarbar_27 OUT_482 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_4_7 (tempbarbarbar_03 tempbarbarbar_14 tempbarbarbar_27 OUT_483 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_4_7 (tempbarbarbar_04 tempbarbarbar_14 tempbarbarbar_27 OUT_484 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_4_7 (tempbarbarbar_05 tempbarbarbar_14 tempbarbarbar_27 OUT_485 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_4_7 (tempbarbarbar_06 tempbarbarbar_14 tempbarbarbar_27 OUT_486 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_4_7 (tempbarbarbar_07 tempbarbarbar_14 tempbarbarbar_27 OUT_487 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_5_7 (tempbarbarbar_00 tempbarbarbar_15 tempbarbarbar_27 OUT_488 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_5_7 (tempbarbarbar_01 tempbarbarbar_15 tempbarbarbar_27 OUT_489 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_5_7 (tempbarbarbar_02 tempbarbarbar_15 tempbarbarbar_27 OUT_490 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_5_7 (tempbarbarbar_03 tempbarbarbar_15 tempbarbarbar_27 OUT_491 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_5_7 (tempbarbarbar_04 tempbarbarbar_15 tempbarbarbar_27 OUT_492 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_5_7 (tempbarbarbar_05 tempbarbarbar_15 tempbarbarbar_27 OUT_493 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_5_7 (tempbarbarbar_06 tempbarbarbar_15 tempbarbarbar_27 OUT_494 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_5_7 (tempbarbarbar_07 tempbarbarbar_15 tempbarbarbar_27 OUT_495 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_6_7 (tempbarbarbar_00 tempbarbarbar_16 tempbarbarbar_27 OUT_496 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_6_7 (tempbarbarbar_01 tempbarbarbar_16 tempbarbarbar_27 OUT_497 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_6_7 (tempbarbarbar_02 tempbarbarbar_16 tempbarbarbar_27 OUT_498 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_6_7 (tempbarbarbar_03 tempbarbarbar_16 tempbarbarbar_27 OUT_499 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_6_7 (tempbarbarbar_04 tempbarbarbar_16 tempbarbarbar_27 OUT_500 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_6_7 (tempbarbarbar_05 tempbarbarbar_16 tempbarbarbar_27 OUT_501 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_6_7 (tempbarbarbar_06 tempbarbarbar_16 tempbarbarbar_27 OUT_502 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_6_7 (tempbarbarbar_07 tempbarbarbar_16 tempbarbarbar_27 OUT_503 vdd vss PBulkLine NBulkLine) threenor 
xnor_0_7_7 (tempbarbarbar_00 tempbarbarbar_17 tempbarbarbar_27 OUT_504 vdd vss PBulkLine NBulkLine) threenor 
xnor_1_7_7 (tempbarbarbar_01 tempbarbarbar_17 tempbarbarbar_27 OUT_505 vdd vss PBulkLine NBulkLine) threenor 
xnor_2_7_7 (tempbarbarbar_02 tempbarbarbar_17 tempbarbarbar_27 OUT_506 vdd vss PBulkLine NBulkLine) threenor 
xnor_3_7_7 (tempbarbarbar_03 tempbarbarbar_17 tempbarbarbar_27 OUT_507 vdd vss PBulkLine NBulkLine) threenor 
xnor_4_7_7 (tempbarbarbar_04 tempbarbarbar_17 tempbarbarbar_27 OUT_508 vdd vss PBulkLine NBulkLine) threenor 
xnor_5_7_7 (tempbarbarbar_05 tempbarbarbar_17 tempbarbarbar_27 OUT_509 vdd vss PBulkLine NBulkLine) threenor 
xnor_6_7_7 (tempbarbarbar_06 tempbarbarbar_17 tempbarbarbar_27 OUT_510 vdd vss PBulkLine NBulkLine) threenor 
xnor_7_7_7 (tempbarbarbar_07 tempbarbarbar_17 tempbarbarbar_27 OUT_511 vdd vss PBulkLine NBulkLine) threenor 
ends decodernine