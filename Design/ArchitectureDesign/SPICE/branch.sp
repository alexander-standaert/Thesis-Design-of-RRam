
simulator lang=spectre

include "cell.scs"
include "load.scs"

subckt branch (vdd vss BitLine WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 WL_8 WL_9 WL_10 WL_11 WL_12 WL_13 WL_14 WL_15 WL_16 WL_17 WL_18 WL_19 WL_20 WL_21 WL_22 WL_23 WL_24 WL_25 WL_26 WL_27 WL_28 WL_29 WL_30 WL_31 WL_32 WL_33 WL_34 WL_35 WL_36 WL_37 WL_38 WL_39 WL_40 WL_41 WL_42 WL_43 WL_44 WL_45 WL_46 WL_47 WL_48 WL_49 WL_50 WL_51 WL_52 WL_53 WL_54 WL_55 WL_56 WL_57 WL_58 WL_59 WL_60 WL_61 WL_62 WL_63 SourceSelect Charge Discharge PBulkLine NBulkLine)
parameters Rcell_0 Rcell_1 Rcell_2 Rcell_3 Rcell_4 Rcell_5 Rcell_6 Rcell_7 Rcell_8 Rcell_9 Rcell_10 Rcell_11 Rcell_12 Rcell_13 Rcell_14 Rcell_15 Rcell_16 Rcell_17 Rcell_18 Rcell_19 Rcell_20 Rcell_21 Rcell_22 Rcell_23 Rcell_24 Rcell_25 Rcell_26 Rcell_27 Rcell_28 Rcell_29 Rcell_30 Rcell_31 Rcell_32 Rcell_33 Rcell_34 Rcell_35 Rcell_36 Rcell_37 Rcell_38 Rcell_39 Rcell_40 Rcell_41 Rcell_42 Rcell_43 Rcell_44 Rcell_45 Rcell_46 Rcell_47 Rcell_48 Rcell_49 Rcell_50 Rcell_51 Rcell_52 Rcell_53 Rcell_54 Rcell_55 Rcell_56 Rcell_57 Rcell_58 Rcell_59 Rcell_60 Rcell_61 Rcell_62 Rcell_63

xSwitchVdd LoadLine Charge vdd PBulkLine mc_pmos_lvt w=WChargeBL l=PLmin
xSwitchVss1 BitLine Discharge vss NBulkLine mc_nmos_lvt w=WDischargeBL l=PLmin
xSwitchVss2 SourceLine SourceSelect vss NBulkLine mc_nmos_lvt w=WDischargeSL l=PLmin

xLoad LoadLine BitLine PBulkLine load


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
 
cParBLC (BitLine vss) capacitor c=Cpar*64
cParSLC (SourceLine vss) capacitor c=Cpar*64

ends branch