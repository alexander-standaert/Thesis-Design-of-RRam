
simulator lang=spectre

include "transistorsPTM.scs"
include "../../ArchitectureDesign/SPICE/decoder.sp"
include "parameters2.sp"

xdecoder (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 vdd vss NBulkLine PBulkLine) decoderseven multstage_1 = dec1multstage_1 multstage_2 = dec1multstage_2 multstage_3 = dec1multstage_3 multstage_4 = dec1multstage_4 multstage_5 = dec1multstage_5 multstage_6 = dec1multstage_6
cLoad0 (OUT_0 0) capacitor c=2.88e-15
cLoad1 (OUT_1 0) capacitor c=2.88e-15
cLoad2 (OUT_2 0) capacitor c=2.88e-15
cLoad3 (OUT_3 0) capacitor c=2.88e-15
cLoad4 (OUT_4 0) capacitor c=2.88e-15
cLoad5 (OUT_5 0) capacitor c=2.88e-15
cLoad6 (OUT_6 0) capacitor c=2.88e-15
cLoad7 (OUT_7 0) capacitor c=2.88e-15
cLoad8 (OUT_8 0) capacitor c=2.88e-15
cLoad9 (OUT_9 0) capacitor c=2.88e-15
cLoad10 (OUT_10 0) capacitor c=2.88e-15
cLoad11 (OUT_11 0) capacitor c=2.88e-15
cLoad12 (OUT_12 0) capacitor c=2.88e-15
cLoad13 (OUT_13 0) capacitor c=2.88e-15
cLoad14 (OUT_14 0) capacitor c=2.88e-15
cLoad15 (OUT_15 0) capacitor c=2.88e-15
cLoad16 (OUT_16 0) capacitor c=2.88e-15
cLoad17 (OUT_17 0) capacitor c=2.88e-15
cLoad18 (OUT_18 0) capacitor c=2.88e-15
cLoad19 (OUT_19 0) capacitor c=2.88e-15
cLoad20 (OUT_20 0) capacitor c=2.88e-15
cLoad21 (OUT_21 0) capacitor c=2.88e-15
cLoad22 (OUT_22 0) capacitor c=2.88e-15
cLoad23 (OUT_23 0) capacitor c=2.88e-15
cLoad24 (OUT_24 0) capacitor c=2.88e-15
cLoad25 (OUT_25 0) capacitor c=2.88e-15
cLoad26 (OUT_26 0) capacitor c=2.88e-15
cLoad27 (OUT_27 0) capacitor c=2.88e-15
cLoad28 (OUT_28 0) capacitor c=2.88e-15
cLoad29 (OUT_29 0) capacitor c=2.88e-15
cLoad30 (OUT_30 0) capacitor c=2.88e-15
cLoad31 (OUT_31 0) capacitor c=2.88e-15
cLoad32 (OUT_32 0) capacitor c=2.88e-15
cLoad33 (OUT_33 0) capacitor c=2.88e-15
cLoad34 (OUT_34 0) capacitor c=2.88e-15
cLoad35 (OUT_35 0) capacitor c=2.88e-15
cLoad36 (OUT_36 0) capacitor c=2.88e-15
cLoad37 (OUT_37 0) capacitor c=2.88e-15
cLoad38 (OUT_38 0) capacitor c=2.88e-15
cLoad39 (OUT_39 0) capacitor c=2.88e-15
cLoad40 (OUT_40 0) capacitor c=2.88e-15
cLoad41 (OUT_41 0) capacitor c=2.88e-15
cLoad42 (OUT_42 0) capacitor c=2.88e-15
cLoad43 (OUT_43 0) capacitor c=2.88e-15
cLoad44 (OUT_44 0) capacitor c=2.88e-15
cLoad45 (OUT_45 0) capacitor c=2.88e-15
cLoad46 (OUT_46 0) capacitor c=2.88e-15
cLoad47 (OUT_47 0) capacitor c=2.88e-15
cLoad48 (OUT_48 0) capacitor c=2.88e-15
cLoad49 (OUT_49 0) capacitor c=2.88e-15
cLoad50 (OUT_50 0) capacitor c=2.88e-15
cLoad51 (OUT_51 0) capacitor c=2.88e-15
cLoad52 (OUT_52 0) capacitor c=2.88e-15
cLoad53 (OUT_53 0) capacitor c=2.88e-15
cLoad54 (OUT_54 0) capacitor c=2.88e-15
cLoad55 (OUT_55 0) capacitor c=2.88e-15
cLoad56 (OUT_56 0) capacitor c=2.88e-15
cLoad57 (OUT_57 0) capacitor c=2.88e-15
cLoad58 (OUT_58 0) capacitor c=2.88e-15
cLoad59 (OUT_59 0) capacitor c=2.88e-15
cLoad60 (OUT_60 0) capacitor c=2.88e-15
cLoad61 (OUT_61 0) capacitor c=2.88e-15
cLoad62 (OUT_62 0) capacitor c=2.88e-15
cLoad63 (OUT_63 0) capacitor c=2.88e-15
cLoad64 (OUT_64 0) capacitor c=2.88e-15
cLoad65 (OUT_65 0) capacitor c=2.88e-15
cLoad66 (OUT_66 0) capacitor c=2.88e-15
cLoad67 (OUT_67 0) capacitor c=2.88e-15
cLoad68 (OUT_68 0) capacitor c=2.88e-15
cLoad69 (OUT_69 0) capacitor c=2.88e-15
cLoad70 (OUT_70 0) capacitor c=2.88e-15
cLoad71 (OUT_71 0) capacitor c=2.88e-15
cLoad72 (OUT_72 0) capacitor c=2.88e-15
cLoad73 (OUT_73 0) capacitor c=2.88e-15
cLoad74 (OUT_74 0) capacitor c=2.88e-15
cLoad75 (OUT_75 0) capacitor c=2.88e-15
cLoad76 (OUT_76 0) capacitor c=2.88e-15
cLoad77 (OUT_77 0) capacitor c=2.88e-15
cLoad78 (OUT_78 0) capacitor c=2.88e-15
cLoad79 (OUT_79 0) capacitor c=2.88e-15
cLoad80 (OUT_80 0) capacitor c=2.88e-15
cLoad81 (OUT_81 0) capacitor c=2.88e-15
cLoad82 (OUT_82 0) capacitor c=2.88e-15
cLoad83 (OUT_83 0) capacitor c=2.88e-15
cLoad84 (OUT_84 0) capacitor c=2.88e-15
cLoad85 (OUT_85 0) capacitor c=2.88e-15
cLoad86 (OUT_86 0) capacitor c=2.88e-15
cLoad87 (OUT_87 0) capacitor c=2.88e-15
cLoad88 (OUT_88 0) capacitor c=2.88e-15
cLoad89 (OUT_89 0) capacitor c=2.88e-15
cLoad90 (OUT_90 0) capacitor c=2.88e-15
cLoad91 (OUT_91 0) capacitor c=2.88e-15
cLoad92 (OUT_92 0) capacitor c=2.88e-15
cLoad93 (OUT_93 0) capacitor c=2.88e-15
cLoad94 (OUT_94 0) capacitor c=2.88e-15
cLoad95 (OUT_95 0) capacitor c=2.88e-15
cLoad96 (OUT_96 0) capacitor c=2.88e-15
cLoad97 (OUT_97 0) capacitor c=2.88e-15
cLoad98 (OUT_98 0) capacitor c=2.88e-15
cLoad99 (OUT_99 0) capacitor c=2.88e-15
cLoad100 (OUT_100 0) capacitor c=2.88e-15
cLoad101 (OUT_101 0) capacitor c=2.88e-15
cLoad102 (OUT_102 0) capacitor c=2.88e-15
cLoad103 (OUT_103 0) capacitor c=2.88e-15
cLoad104 (OUT_104 0) capacitor c=2.88e-15
cLoad105 (OUT_105 0) capacitor c=2.88e-15
cLoad106 (OUT_106 0) capacitor c=2.88e-15
cLoad107 (OUT_107 0) capacitor c=2.88e-15
cLoad108 (OUT_108 0) capacitor c=2.88e-15
cLoad109 (OUT_109 0) capacitor c=2.88e-15
cLoad110 (OUT_110 0) capacitor c=2.88e-15
cLoad111 (OUT_111 0) capacitor c=2.88e-15
cLoad112 (OUT_112 0) capacitor c=2.88e-15
cLoad113 (OUT_113 0) capacitor c=2.88e-15
cLoad114 (OUT_114 0) capacitor c=2.88e-15
cLoad115 (OUT_115 0) capacitor c=2.88e-15
cLoad116 (OUT_116 0) capacitor c=2.88e-15
cLoad117 (OUT_117 0) capacitor c=2.88e-15
cLoad118 (OUT_118 0) capacitor c=2.88e-15
cLoad119 (OUT_119 0) capacitor c=2.88e-15
cLoad120 (OUT_120 0) capacitor c=2.88e-15
cLoad121 (OUT_121 0) capacitor c=2.88e-15
cLoad122 (OUT_122 0) capacitor c=2.88e-15
cLoad123 (OUT_123 0) capacitor c=2.88e-15
cLoad124 (OUT_124 0) capacitor c=2.88e-15
cLoad125 (OUT_125 0) capacitor c=2.88e-15
cLoad126 (OUT_126 0) capacitor c=2.88e-15
cLoad127 (OUT_127 0) capacitor c=2.88e-15

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