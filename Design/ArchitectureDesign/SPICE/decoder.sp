simulator lang=spectre

subckt decoderfive (IN_0 IN_1 IN_2 IN_3 IN_4 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 vdd vss NBulkLine PBulkLine)
parameters multstage_1 = 1 multstage_2 = 1 multstage_3 = 1 multstage_4 = 1


xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter mult=multstage_4

xdec (IN_3 IN_4 enablebar temp_0 temp_1 temp_2 temp_3 vdd vss PBulkLine NBulkLine) twotofourdecoder multinv=multstage_4 multnor=2*multstage_3
xinv0 (temp_0 tempbar_0 vdd vss PBulkLine NBulkLine) inverter mult=4*multstage_2
xdec0 (IN_0 IN_1 IN_2 tempbar_0 OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 vdd vss PBulkLine NBulkLine) threetoeightdecoder multinv=multstage_3 multnand=multstage_2 multnor=multstage_1
xinv1 (temp_1 tempbar_1 vdd vss PBulkLine NBulkLine) inverter mult=4*multstage_2
xdec1 (IN_0 IN_1 IN_2 tempbar_1 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 vdd vss PBulkLine NBulkLine) threetoeightdecoder multinv=multstage_3 multnand=multstage_2 multnor=multstage_1
xinv2 (temp_2 tempbar_2 vdd vss PBulkLine NBulkLine) inverter mult=4*multstage_2
xdec2 (IN_0 IN_1 IN_2 tempbar_2 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 vdd vss PBulkLine NBulkLine) threetoeightdecoder multinv=multstage_3 multnand=multstage_2 multnor=multstage_1
xinv3 (temp_3 tempbar_3 vdd vss PBulkLine NBulkLine) inverter mult=4*multstage_2
xdec3 (IN_0 IN_1 IN_2 tempbar_3 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 vdd vss PBulkLine NBulkLine) threetoeightdecoder multinv=multstage_3 multnand=multstage_2 multnor=multstage_1

ends decoder

