
simulator lang=spectre

include "CMOSlogic.scs"

subckt decoder (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 vdd vss NBulkLine PBulkLine)

xinv (enable enablebar vdd vss PBulkLine NBulkLine) inverter

xdec (IN_4 IN_5 IN_6 enablebar temp_0 temp_1 temp_2 temp_3 temp_4 temp_5 temp_6 temp_7 vdd vss PBulkLine NBulkLine) threetoeightdecoder
xinv0 (temp_0 tempbar_0 vdd vss PBulkLine NBulkLine) inverter
xdec1L0 (IN_2 IN_3 tempbar_0 temp_0_0 temp_1_0 temp_2_0 temp_3_0 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_0 (temp_0_0 tempbar_0_0 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_0 (IN_0 IN_1 tempbar_0_0 OUT_0 OUT_1 OUT_2 OUT_3 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_0 (temp_1_0 tempbar_1_0 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_0 (IN_0 IN_1 tempbar_1_0 OUT_4 OUT_5 OUT_6 OUT_7 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_0 (temp_2_0 tempbar_2_0 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_0 (IN_0 IN_1 tempbar_2_0 OUT_8 OUT_9 OUT_10 OUT_11 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_0 (temp_3_0 tempbar_3_0 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_0 (IN_0 IN_1 tempbar_3_0 OUT_12 OUT_13 OUT_14 OUT_15 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv1 (temp_1 tempbar_1 vdd vss PBulkLine NBulkLine) inverter
xdec1L1 (IN_2 IN_3 tempbar_1 temp_0_1 temp_1_1 temp_2_1 temp_3_1 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_1 (temp_0_1 tempbar_0_1 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_1 (IN_0 IN_1 tempbar_0_1 OUT_16 OUT_17 OUT_18 OUT_19 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_1 (temp_1_1 tempbar_1_1 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_1 (IN_0 IN_1 tempbar_1_1 OUT_20 OUT_21 OUT_22 OUT_23 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_1 (temp_2_1 tempbar_2_1 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_1 (IN_0 IN_1 tempbar_2_1 OUT_24 OUT_25 OUT_26 OUT_27 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_1 (temp_3_1 tempbar_3_1 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_1 (IN_0 IN_1 tempbar_3_1 OUT_28 OUT_29 OUT_30 OUT_31 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv2 (temp_2 tempbar_2 vdd vss PBulkLine NBulkLine) inverter
xdec1L2 (IN_2 IN_3 tempbar_2 temp_0_2 temp_1_2 temp_2_2 temp_3_2 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_2 (temp_0_2 tempbar_0_2 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_2 (IN_0 IN_1 tempbar_0_2 OUT_32 OUT_33 OUT_34 OUT_35 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_2 (temp_1_2 tempbar_1_2 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_2 (IN_0 IN_1 tempbar_1_2 OUT_36 OUT_37 OUT_38 OUT_39 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_2 (temp_2_2 tempbar_2_2 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_2 (IN_0 IN_1 tempbar_2_2 OUT_40 OUT_41 OUT_42 OUT_43 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_2 (temp_3_2 tempbar_3_2 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_2 (IN_0 IN_1 tempbar_3_2 OUT_44 OUT_45 OUT_46 OUT_47 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv3 (temp_3 tempbar_3 vdd vss PBulkLine NBulkLine) inverter
xdec1L3 (IN_2 IN_3 tempbar_3 temp_0_3 temp_1_3 temp_2_3 temp_3_3 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_3 (temp_0_3 tempbar_0_3 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_3 (IN_0 IN_1 tempbar_0_3 OUT_48 OUT_49 OUT_50 OUT_51 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_3 (temp_1_3 tempbar_1_3 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_3 (IN_0 IN_1 tempbar_1_3 OUT_52 OUT_53 OUT_54 OUT_55 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_3 (temp_2_3 tempbar_2_3 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_3 (IN_0 IN_1 tempbar_2_3 OUT_56 OUT_57 OUT_58 OUT_59 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_3 (temp_3_3 tempbar_3_3 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_3 (IN_0 IN_1 tempbar_3_3 OUT_60 OUT_61 OUT_62 OUT_63 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv4 (temp_4 tempbar_4 vdd vss PBulkLine NBulkLine) inverter
xdec1L4 (IN_2 IN_3 tempbar_4 temp_0_4 temp_1_4 temp_2_4 temp_3_4 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_4 (temp_0_4 tempbar_0_4 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_4 (IN_0 IN_1 tempbar_0_4 OUT_64 OUT_65 OUT_66 OUT_67 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_4 (temp_1_4 tempbar_1_4 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_4 (IN_0 IN_1 tempbar_1_4 OUT_68 OUT_69 OUT_70 OUT_71 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_4 (temp_2_4 tempbar_2_4 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_4 (IN_0 IN_1 tempbar_2_4 OUT_72 OUT_73 OUT_74 OUT_75 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_4 (temp_3_4 tempbar_3_4 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_4 (IN_0 IN_1 tempbar_3_4 OUT_76 OUT_77 OUT_78 OUT_79 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv5 (temp_5 tempbar_5 vdd vss PBulkLine NBulkLine) inverter
xdec1L5 (IN_2 IN_3 tempbar_5 temp_0_5 temp_1_5 temp_2_5 temp_3_5 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_5 (temp_0_5 tempbar_0_5 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_5 (IN_0 IN_1 tempbar_0_5 OUT_80 OUT_81 OUT_82 OUT_83 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_5 (temp_1_5 tempbar_1_5 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_5 (IN_0 IN_1 tempbar_1_5 OUT_84 OUT_85 OUT_86 OUT_87 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_5 (temp_2_5 tempbar_2_5 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_5 (IN_0 IN_1 tempbar_2_5 OUT_88 OUT_89 OUT_90 OUT_91 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_5 (temp_3_5 tempbar_3_5 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_5 (IN_0 IN_1 tempbar_3_5 OUT_92 OUT_93 OUT_94 OUT_95 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv6 (temp_6 tempbar_6 vdd vss PBulkLine NBulkLine) inverter
xdec1L6 (IN_2 IN_3 tempbar_6 temp_0_6 temp_1_6 temp_2_6 temp_3_6 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_6 (temp_0_6 tempbar_0_6 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_6 (IN_0 IN_1 tempbar_0_6 OUT_96 OUT_97 OUT_98 OUT_99 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_6 (temp_1_6 tempbar_1_6 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_6 (IN_0 IN_1 tempbar_1_6 OUT_100 OUT_101 OUT_102 OUT_103 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_6 (temp_2_6 tempbar_2_6 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_6 (IN_0 IN_1 tempbar_2_6 OUT_104 OUT_105 OUT_106 OUT_107 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_6 (temp_3_6 tempbar_3_6 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_6 (IN_0 IN_1 tempbar_3_6 OUT_108 OUT_109 OUT_110 OUT_111 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv7 (temp_7 tempbar_7 vdd vss PBulkLine NBulkLine) inverter
xdec1L7 (IN_2 IN_3 tempbar_7 temp_0_7 temp_1_7 temp_2_7 temp_3_7 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_0_7 (temp_0_7 tempbar_0_7 vdd vss PBulkLine NBulkLine) inverter
xdec2L_0_7 (IN_0 IN_1 tempbar_0_7 OUT_112 OUT_113 OUT_114 OUT_115 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_1_7 (temp_1_7 tempbar_1_7 vdd vss PBulkLine NBulkLine) inverter
xdec2L_1_7 (IN_0 IN_1 tempbar_1_7 OUT_116 OUT_117 OUT_118 OUT_119 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_2_7 (temp_2_7 tempbar_2_7 vdd vss PBulkLine NBulkLine) inverter
xdec2L_2_7 (IN_0 IN_1 tempbar_2_7 OUT_120 OUT_121 OUT_122 OUT_123 vdd vss PBulkLine NBulkLine) twotofourdecoder
xinv_3_7 (temp_3_7 tempbar_3_7 vdd vss PBulkLine NBulkLine) inverter
xdec2L_3_7 (IN_0 IN_1 tempbar_3_7 OUT_124 OUT_125 OUT_126 OUT_127 vdd vss PBulkLine NBulkLine) twotofourdecoder


ends decoder