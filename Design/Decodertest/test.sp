// showcase for mismatch simulation

simulator lang=spectre

include "transistorsPTM.scs"
include "decodersynthesis.sp"
include "parameters.sp"

xdecoder (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 vdd vss NBulkLine PBulkLine) decoder

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
Vin5 (IN_5 0) vsource type=pwl wave=wavein_5
Vin6 (IN_6 0) vsource type=pwl wave=wavein_6


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

