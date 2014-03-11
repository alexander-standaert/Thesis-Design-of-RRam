
simulator lang=spectre

include "cell.scs"
include "load.scs"

subckt branch (vdd vss BitLine WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 WL_64 WL_65 WL_66 WL_67 WL_68 WL_69 WL_70 WL_71 WL_72 WL_73 WL_74 WL_75 WL_76 WL_77 WL_78 WL_79 WL_80 WL_81 WL_82 WL_83 WL_84 WL_85 WL_86 WL_87 WL_88 WL_89 WL_90 WL_91 WL_92 WL_93 WL_94 WL_95 WL_96 WL_97 WL_98 WL_99 WL_100 WL_101 WL_102 WL_103 WL_104 WL_105 WL_106 WL_107 WL_108 WL_109 WL_110 WL_111 WL_112 WL_113 WL_114 WL_115 WL_116 WL_117 WL_118 WL_119 WL_120 WL_121 WL_122 WL_123 WL_124 WL_125 WL_126 WL_127 WL_128 SourceSelect Charge Discharge PBulkLine NBulkLine)
parameters Rcell_0 Rcell_1 Rcell_2 Rcell_3 Rcell_4 Rcell_5 Rcell_6 Rcell_7 Rcell_8 Rcell_9 Rcell_10 Rcell_11 Rcell_12 Rcell_13 Rcell_14 Rcell_15 Rcell_16 Rcell_17 Rcell_18 Rcell_19 Rcell_20 Rcell_21 Rcell_22 Rcell_23 Rcell_24 Rcell_25 Rcell_26 Rcell_27 Rcell_28 Rcell_29 Rcell_30 Rcell_31 Rcell_32 Rcell_33 Rcell_34 Rcell_35 Rcell_36 Rcell_37 Rcell_38 Rcell_39 Rcell_40 Rcell_41 Rcell_42 Rcell_43 Rcell_44 Rcell_45 Rcell_46 Rcell_47 Rcell_48 Rcell_49 Rcell_50 Rcell_51 Rcell_52 Rcell_53 Rcell_54 Rcell_55 Rcell_56 Rcell_57 Rcell_58 Rcell_59 Rcell_60 Rcell_61 Rcell_62 Rcell_63 Rcell_64 Rcell_65 Rcell_66 Rcell_67 Rcell_68 Rcell_69 Rcell_70 Rcell_71 Rcell_72 Rcell_73 Rcell_74 Rcell_75 Rcell_76 Rcell_77 Rcell_78 Rcell_79 Rcell_80 Rcell_81 Rcell_82 Rcell_83 Rcell_84 Rcell_85 Rcell_86 Rcell_87 Rcell_88 Rcell_89 Rcell_90 Rcell_91 Rcell_92 Rcell_93 Rcell_94 Rcell_95 Rcell_96 Rcell_97 Rcell_98 Rcell_99 Rcell_100 Rcell_101 Rcell_102 Rcell_103 Rcell_104 Rcell_105 Rcell_106 Rcell_107 Rcell_108 Rcell_109 Rcell_110 Rcell_111 Rcell_112 Rcell_113 Rcell_114 Rcell_115 Rcell_116 Rcell_117 Rcell_118 Rcell_119 Rcell_120 Rcell_121 Rcell_122 Rcell_123 Rcell_124 Rcell_125 Rcell_126 Rcell_127 Rref

xSwitchVdd BitLine Charge vdd PBulkLine mc_pmos_lvt w=WChargeBL l=LChargeBL
xSwitchVss1 BitLine Discharge vss NBulkLine mc_nmos_lvt w=WDischargeBL l=PLmin
xSwitchVss2 SourceLine SourceSelect vss NBulkLine mc_nmos_lvt w=WDischargeSL l=PLmin

//xLoad LoadLine BitLine PBulkLine load


xCell0 (BitLine SourceLine WL_0 NBulkLine) cell RMEM=Rcell_0
xCell1 (BitLine SourceLine WL_1 NBulkLine) cell RMEM=Rcell_1
xCell2 (BitLine SourceLine WL_2 NBulkLine) cell RMEM=Rcell_2
xCell3 (BitLine SourceLine WL_3 NBulkLine) cell RMEM=Rcell_3
xCell4 (BitLine SourceLine WL_4 NBulkLine) cell RMEM=Rcell_4
xCell5 (BitLine SourceLine WL_5 NBulkLine) cell RMEM=Rcell_5
xCell6 (BitLine SourceLine WL_6 NBulkLine) cell RMEM=Rcell_6
xCell7 (BitLine SourceLine WL_7 NBulkLine) cell RMEM=Rcell_7
xCell8 (BitLine SourceLine WL_8 NBulkLine) cell RMEM=Rcell_8
xCell9 (BitLine SourceLine WL_9 NBulkLine) cell RMEM=Rcell_9
xCell10 (BitLine SourceLine WL_10 NBulkLine) cell RMEM=Rcell_10
xCell11 (BitLine SourceLine WL_11 NBulkLine) cell RMEM=Rcell_11
xCell12 (BitLine SourceLine WL_12 NBulkLine) cell RMEM=Rcell_12
xCell13 (BitLine SourceLine WL_13 NBulkLine) cell RMEM=Rcell_13
xCell14 (BitLine SourceLine WL_14 NBulkLine) cell RMEM=Rcell_14
xCell15 (BitLine SourceLine WL_15 NBulkLine) cell RMEM=Rcell_15
xCell16 (BitLine SourceLine WL_16 NBulkLine) cell RMEM=Rcell_16
xCell17 (BitLine SourceLine WL_17 NBulkLine) cell RMEM=Rcell_17
xCell18 (BitLine SourceLine WL_18 NBulkLine) cell RMEM=Rcell_18
xCell19 (BitLine SourceLine WL_19 NBulkLine) cell RMEM=Rcell_19
xCell20 (BitLine SourceLine WL_20 NBulkLine) cell RMEM=Rcell_20
xCell21 (BitLine SourceLine WL_21 NBulkLine) cell RMEM=Rcell_21
xCell22 (BitLine SourceLine WL_22 NBulkLine) cell RMEM=Rcell_22
xCell23 (BitLine SourceLine WL_23 NBulkLine) cell RMEM=Rcell_23
xCell24 (BitLine SourceLine WL_24 NBulkLine) cell RMEM=Rcell_24
xCell25 (BitLine SourceLine WL_25 NBulkLine) cell RMEM=Rcell_25
xCell26 (BitLine SourceLine WL_26 NBulkLine) cell RMEM=Rcell_26
xCell27 (BitLine SourceLine WL_27 NBulkLine) cell RMEM=Rcell_27
xCell28 (BitLine SourceLine WL_28 NBulkLine) cell RMEM=Rcell_28
xCell29 (BitLine SourceLine WL_29 NBulkLine) cell RMEM=Rcell_29
xCell30 (BitLine SourceLine WL_30 NBulkLine) cell RMEM=Rcell_30
xCell31 (BitLine SourceLine WL_31 NBulkLine) cell RMEM=Rcell_31
xCell32 (BitLine SourceLine WL_32 NBulkLine) cell RMEM=Rcell_32
xCell33 (BitLine SourceLine WL_33 NBulkLine) cell RMEM=Rcell_33
xCell34 (BitLine SourceLine WL_34 NBulkLine) cell RMEM=Rcell_34
xCell35 (BitLine SourceLine WL_35 NBulkLine) cell RMEM=Rcell_35
xCell36 (BitLine SourceLine WL_36 NBulkLine) cell RMEM=Rcell_36
xCell37 (BitLine SourceLine WL_37 NBulkLine) cell RMEM=Rcell_37
xCell38 (BitLine SourceLine WL_38 NBulkLine) cell RMEM=Rcell_38
xCell39 (BitLine SourceLine WL_39 NBulkLine) cell RMEM=Rcell_39
xCell40 (BitLine SourceLine WL_40 NBulkLine) cell RMEM=Rcell_40
xCell41 (BitLine SourceLine WL_41 NBulkLine) cell RMEM=Rcell_41
xCell42 (BitLine SourceLine WL_42 NBulkLine) cell RMEM=Rcell_42
xCell43 (BitLine SourceLine WL_43 NBulkLine) cell RMEM=Rcell_43
xCell44 (BitLine SourceLine WL_44 NBulkLine) cell RMEM=Rcell_44
xCell45 (BitLine SourceLine WL_45 NBulkLine) cell RMEM=Rcell_45
xCell46 (BitLine SourceLine WL_46 NBulkLine) cell RMEM=Rcell_46
xCell47 (BitLine SourceLine WL_47 NBulkLine) cell RMEM=Rcell_47
xCell48 (BitLine SourceLine WL_48 NBulkLine) cell RMEM=Rcell_48
xCell49 (BitLine SourceLine WL_49 NBulkLine) cell RMEM=Rcell_49
xCell50 (BitLine SourceLine WL_50 NBulkLine) cell RMEM=Rcell_50
xCell51 (BitLine SourceLine WL_51 NBulkLine) cell RMEM=Rcell_51
xCell52 (BitLine SourceLine WL_52 NBulkLine) cell RMEM=Rcell_52
xCell53 (BitLine SourceLine WL_53 NBulkLine) cell RMEM=Rcell_53
xCell54 (BitLine SourceLine WL_54 NBulkLine) cell RMEM=Rcell_54
xCell55 (BitLine SourceLine WL_55 NBulkLine) cell RMEM=Rcell_55
xCell56 (BitLine SourceLine WL_56 NBulkLine) cell RMEM=Rcell_56
xCell57 (BitLine SourceLine WL_57 NBulkLine) cell RMEM=Rcell_57
xCell58 (BitLine SourceLine WL_58 NBulkLine) cell RMEM=Rcell_58
xCell59 (BitLine SourceLine WL_59 NBulkLine) cell RMEM=Rcell_59
xCell60 (BitLine SourceLine WL_60 NBulkLine) cell RMEM=Rcell_60
xCell61 (BitLine SourceLine WL_61 NBulkLine) cell RMEM=Rcell_61
xCell62 (BitLine SourceLine WL_62 NBulkLine) cell RMEM=Rcell_62
xCell63 (BitLine SourceLine WL_63 NBulkLine) cell RMEM=Rcell_63
xCell64 (BitLine SourceLine WL_64 NBulkLine) cell RMEM=Rcell_64
xCell65 (BitLine SourceLine WL_65 NBulkLine) cell RMEM=Rcell_65
xCell66 (BitLine SourceLine WL_66 NBulkLine) cell RMEM=Rcell_66
xCell67 (BitLine SourceLine WL_67 NBulkLine) cell RMEM=Rcell_67
xCell68 (BitLine SourceLine WL_68 NBulkLine) cell RMEM=Rcell_68
xCell69 (BitLine SourceLine WL_69 NBulkLine) cell RMEM=Rcell_69
xCell70 (BitLine SourceLine WL_70 NBulkLine) cell RMEM=Rcell_70
xCell71 (BitLine SourceLine WL_71 NBulkLine) cell RMEM=Rcell_71
xCell72 (BitLine SourceLine WL_72 NBulkLine) cell RMEM=Rcell_72
xCell73 (BitLine SourceLine WL_73 NBulkLine) cell RMEM=Rcell_73
xCell74 (BitLine SourceLine WL_74 NBulkLine) cell RMEM=Rcell_74
xCell75 (BitLine SourceLine WL_75 NBulkLine) cell RMEM=Rcell_75
xCell76 (BitLine SourceLine WL_76 NBulkLine) cell RMEM=Rcell_76
xCell77 (BitLine SourceLine WL_77 NBulkLine) cell RMEM=Rcell_77
xCell78 (BitLine SourceLine WL_78 NBulkLine) cell RMEM=Rcell_78
xCell79 (BitLine SourceLine WL_79 NBulkLine) cell RMEM=Rcell_79
xCell80 (BitLine SourceLine WL_80 NBulkLine) cell RMEM=Rcell_80
xCell81 (BitLine SourceLine WL_81 NBulkLine) cell RMEM=Rcell_81
xCell82 (BitLine SourceLine WL_82 NBulkLine) cell RMEM=Rcell_82
xCell83 (BitLine SourceLine WL_83 NBulkLine) cell RMEM=Rcell_83
xCell84 (BitLine SourceLine WL_84 NBulkLine) cell RMEM=Rcell_84
xCell85 (BitLine SourceLine WL_85 NBulkLine) cell RMEM=Rcell_85
xCell86 (BitLine SourceLine WL_86 NBulkLine) cell RMEM=Rcell_86
xCell87 (BitLine SourceLine WL_87 NBulkLine) cell RMEM=Rcell_87
xCell88 (BitLine SourceLine WL_88 NBulkLine) cell RMEM=Rcell_88
xCell89 (BitLine SourceLine WL_89 NBulkLine) cell RMEM=Rcell_89
xCell90 (BitLine SourceLine WL_90 NBulkLine) cell RMEM=Rcell_90
xCell91 (BitLine SourceLine WL_91 NBulkLine) cell RMEM=Rcell_91
xCell92 (BitLine SourceLine WL_92 NBulkLine) cell RMEM=Rcell_92
xCell93 (BitLine SourceLine WL_93 NBulkLine) cell RMEM=Rcell_93
xCell94 (BitLine SourceLine WL_94 NBulkLine) cell RMEM=Rcell_94
xCell95 (BitLine SourceLine WL_95 NBulkLine) cell RMEM=Rcell_95
xCell96 (BitLine SourceLine WL_96 NBulkLine) cell RMEM=Rcell_96
xCell97 (BitLine SourceLine WL_97 NBulkLine) cell RMEM=Rcell_97
xCell98 (BitLine SourceLine WL_98 NBulkLine) cell RMEM=Rcell_98
xCell99 (BitLine SourceLine WL_99 NBulkLine) cell RMEM=Rcell_99
xCell100 (BitLine SourceLine WL_100 NBulkLine) cell RMEM=Rcell_100
xCell101 (BitLine SourceLine WL_101 NBulkLine) cell RMEM=Rcell_101
xCell102 (BitLine SourceLine WL_102 NBulkLine) cell RMEM=Rcell_102
xCell103 (BitLine SourceLine WL_103 NBulkLine) cell RMEM=Rcell_103
xCell104 (BitLine SourceLine WL_104 NBulkLine) cell RMEM=Rcell_104
xCell105 (BitLine SourceLine WL_105 NBulkLine) cell RMEM=Rcell_105
xCell106 (BitLine SourceLine WL_106 NBulkLine) cell RMEM=Rcell_106
xCell107 (BitLine SourceLine WL_107 NBulkLine) cell RMEM=Rcell_107
xCell108 (BitLine SourceLine WL_108 NBulkLine) cell RMEM=Rcell_108
xCell109 (BitLine SourceLine WL_109 NBulkLine) cell RMEM=Rcell_109
xCell110 (BitLine SourceLine WL_110 NBulkLine) cell RMEM=Rcell_110
xCell111 (BitLine SourceLine WL_111 NBulkLine) cell RMEM=Rcell_111
xCell112 (BitLine SourceLine WL_112 NBulkLine) cell RMEM=Rcell_112
xCell113 (BitLine SourceLine WL_113 NBulkLine) cell RMEM=Rcell_113
xCell114 (BitLine SourceLine WL_114 NBulkLine) cell RMEM=Rcell_114
xCell115 (BitLine SourceLine WL_115 NBulkLine) cell RMEM=Rcell_115
xCell116 (BitLine SourceLine WL_116 NBulkLine) cell RMEM=Rcell_116
xCell117 (BitLine SourceLine WL_117 NBulkLine) cell RMEM=Rcell_117
xCell118 (BitLine SourceLine WL_118 NBulkLine) cell RMEM=Rcell_118
xCell119 (BitLine SourceLine WL_119 NBulkLine) cell RMEM=Rcell_119
xCell120 (BitLine SourceLine WL_120 NBulkLine) cell RMEM=Rcell_120
xCell121 (BitLine SourceLine WL_121 NBulkLine) cell RMEM=Rcell_121
xCell122 (BitLine SourceLine WL_122 NBulkLine) cell RMEM=Rcell_122
xCell123 (BitLine SourceLine WL_123 NBulkLine) cell RMEM=Rcell_123
xCell124 (BitLine SourceLine WL_124 NBulkLine) cell RMEM=Rcell_124
xCell125 (BitLine SourceLine WL_125 NBulkLine) cell RMEM=Rcell_125
xCell126 (BitLine SourceLine WL_126 NBulkLine) cell RMEM=Rcell_126
xCell127 (BitLine SourceLine WL_127 NBulkLine) cell RMEM=Rcell_127
xCell128 (BitLine SourceLine WL_128 NBulkLine) cell RMEM=Rref
 
cParBLC (BitLine vss) capacitor c=Cpar*128
cParSLC (SourceLine vss) capacitor c=Cpar*128

ends branch