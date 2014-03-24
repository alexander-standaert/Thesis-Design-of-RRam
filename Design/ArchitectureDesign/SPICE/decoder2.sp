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
parameters multstage_1 = 1 multstage_2 = 1 multstage_3 = 1


xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=multstage_2

xdec (IN_0 IN_1 IN_2 enablebar OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 vdd vss PBulkLine NBulkLine) threetoeightdecoder multinv=multstage_3 multnand=multstage_2 multnor=multstage_1

ends decoder






subckt decoderfour (IN_0 IN_1 IN_2 IN_3 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter 

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

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter 

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

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter 

xdec0 (IN_0 IN_1 IN_2 enablebar temp_00 temp_01 temp_02 temp_03 temp_04 temp_05 temp_06 temp_07 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xdec1 (IN_0 IN_1 IN_2 enablebar temp_10 temp_11 temp_12 temp_13 temp_14 temp_15 temp_16 temp_17 vdd vss PBulkLine NBulkLine) threetoeightdecoder

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

