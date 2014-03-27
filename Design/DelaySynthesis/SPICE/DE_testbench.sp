simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt
.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"
include "../../ArchitectureDesign/SPICE/CMOSlogic.scs"
include "../../ArchitectureDesign/SPICE/delay.sp"
parameters enableMismatch=0
ana tran step=1e-12 stop=2e-08
option1 options rawfmt = psfascii
//option2 options dc_pivot_check = yes

vin in vss vsource type=pwl wave=[0 0 1e-09 0 1.1e-09 1]
vgnd vss 0 vsource type=dc dc=0


parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght

    vvdd_1 vdd_1 0 vsource type=dc dc=1
    xdelayone (in out_1 vdd_1 vss vdd_1 vss) delayone
    xinv_1 out_1 out2_1 vdd vss vdd vss inverter
    save out_1
    save vvdd_1:p
    vvdd_2 vdd_2 0 vsource type=dc dc=1
    xdelaytwo (in out_2 vdd_2 vss vdd_2 vss) delaytwo
    xinv_2 out_2 out2_2 vdd vss vdd vss inverter
    save out_2
    save vvdd_2:p
    vvdd_3 vdd_3 0 vsource type=dc dc=1
    xdelaythree (in out_3 vdd_3 vss vdd_3 vss) delaythree
    xinv_3 out_3 out2_3 vdd vss vdd vss inverter
    save out_3
    save vvdd_3:p
    vvdd_4 vdd_4 0 vsource type=dc dc=1
    xdelayfour (in out_4 vdd_4 vss vdd_4 vss) delayfour
    xinv_4 out_4 out2_4 vdd vss vdd vss inverter
    save out_4
    save vvdd_4:p
    vvdd_5 vdd_5 0 vsource type=dc dc=1
    xdelayfive (in out_5 vdd_5 vss vdd_5 vss) delayfive
    xinv_5 out_5 out2_5 vdd vss vdd vss inverter
    save out_5
    save vvdd_5:p
    vvdd_6 vdd_6 0 vsource type=dc dc=1
    xdelaysix (in out_6 vdd_6 vss vdd_6 vss) delaysix
    xinv_6 out_6 out2_6 vdd vss vdd vss inverter
    save out_6
    save vvdd_6:p
    vvdd_7 vdd_7 0 vsource type=dc dc=1
    xdelayseven (in out_7 vdd_7 vss vdd_7 vss) delayseven
    xinv_7 out_7 out2_7 vdd vss vdd vss inverter
    save out_7
    save vvdd_7:p
    vvdd_8 vdd_8 0 vsource type=dc dc=1
    xdelayeight (in out_8 vdd_8 vss vdd_8 vss) delayeight
    xinv_8 out_8 out2_8 vdd vss vdd vss inverter
    save out_8
    save vvdd_8:p
    vvdd_9 vdd_9 0 vsource type=dc dc=1
    xdelaynine (in out_9 vdd_9 vss vdd_9 vss) delaynine
    xinv_9 out_9 out2_9 vdd vss vdd vss inverter
    save out_9
    save vvdd_9:p
    vvdd_10 vdd_10 0 vsource type=dc dc=1
    xdelayten (in out_10 vdd_10 vss vdd_10 vss) delayten
    xinv_10 out_10 out2_10 vdd vss vdd vss inverter
    save out_10
    save vvdd_10:p
    vvdd_11 vdd_11 0 vsource type=dc dc=1
    xdelayeleven (in out_11 vdd_11 vss vdd_11 vss) delayeleven
    xinv_11 out_11 out2_11 vdd vss vdd vss inverter
    save out_11
    save vvdd_11:p
    vvdd_12 vdd_12 0 vsource type=dc dc=1
    xdelaytwelve (in out_12 vdd_12 vss vdd_12 vss) delaytwelve
    xinv_12 out_12 out2_12 vdd vss vdd vss inverter
    save out_12
    save vvdd_12:p
    vvdd_13 vdd_13 0 vsource type=dc dc=1
    xdelaythirteen (in out_13 vdd_13 vss vdd_13 vss) delaythirteen
    xinv_13 out_13 out2_13 vdd vss vdd vss inverter
    save out_13
    save vvdd_13:p
    vvdd_14 vdd_14 0 vsource type=dc dc=1
    xdelayfourteen (in out_14 vdd_14 vss vdd_14 vss) delayfourteen
    xinv_14 out_14 out2_14 vdd vss vdd vss inverter
    save out_14
    save vvdd_14:p
    vvdd_15 vdd_15 0 vsource type=dc dc=1
    xdelayfifteen (in out_15 vdd_15 vss vdd_15 vss) delayfifteen
    xinv_15 out_15 out2_15 vdd vss vdd vss inverter
    save out_15
    save vvdd_15:p
    vvdd_16 vdd_16 0 vsource type=dc dc=1
    xdelaysixteen (in out_16 vdd_16 vss vdd_16 vss) delaysixteen
    xinv_16 out_16 out2_16 vdd vss vdd vss inverter
    save out_16
    save vvdd_16:p
    vvdd_17 vdd_17 0 vsource type=dc dc=1
    xdelayseventeen (in out_17 vdd_17 vss vdd_17 vss) delayseventeen
    xinv_17 out_17 out2_17 vdd vss vdd vss inverter
    save out_17
    save vvdd_17:p
    vvdd_18 vdd_18 0 vsource type=dc dc=1
    xdelayeighteen (in out_18 vdd_18 vss vdd_18 vss) delayeighteen
    xinv_18 out_18 out2_18 vdd vss vdd vss inverter
    save out_18
    save vvdd_18:p
    vvdd_19 vdd_19 0 vsource type=dc dc=1
    xdelaynineteen (in out_19 vdd_19 vss vdd_19 vss) delaynineteen
    xinv_19 out_19 out2_19 vdd vss vdd vss inverter
    save out_19
    save vvdd_19:p
    vvdd_20 vdd_20 0 vsource type=dc dc=1
    xdelaytwenty (in out_20 vdd_20 vss vdd_20 vss) delaytwenty
    xinv_20 out_20 out2_20 vdd vss vdd vss inverter
    save out_20
    save vvdd_20:p
    vvdd_21 vdd_21 0 vsource type=dc dc=1
    xdelaytwentyone (in out_21 vdd_21 vss vdd_21 vss) delaytwentyone
    xinv_21 out_21 out2_21 vdd vss vdd vss inverter
    save out_21
    save vvdd_21:p
    vvdd_22 vdd_22 0 vsource type=dc dc=1
    xdelaytwentytwo (in out_22 vdd_22 vss vdd_22 vss) delaytwentytwo
    xinv_22 out_22 out2_22 vdd vss vdd vss inverter
    save out_22
    save vvdd_22:p
    vvdd_23 vdd_23 0 vsource type=dc dc=1
    xdelaytwentythree (in out_23 vdd_23 vss vdd_23 vss) delaytwentythree
    xinv_23 out_23 out2_23 vdd vss vdd vss inverter
    save out_23
    save vvdd_23:p
    vvdd_24 vdd_24 0 vsource type=dc dc=1
    xdelaytwentyfour (in out_24 vdd_24 vss vdd_24 vss) delaytwentyfour
    xinv_24 out_24 out2_24 vdd vss vdd vss inverter
    save out_24
    save vvdd_24:p
    vvdd_25 vdd_25 0 vsource type=dc dc=1
    xdelaytwentyfive (in out_25 vdd_25 vss vdd_25 vss) delaytwentyfive
    xinv_25 out_25 out2_25 vdd vss vdd vss inverter
    save out_25
    save vvdd_25:p
    vvdd_26 vdd_26 0 vsource type=dc dc=1
    xdelaytwentysix (in out_26 vdd_26 vss vdd_26 vss) delaytwentysix
    xinv_26 out_26 out2_26 vdd vss vdd vss inverter
    save out_26
    save vvdd_26:p
    vvdd_27 vdd_27 0 vsource type=dc dc=1
    xdelaytwentyseven (in out_27 vdd_27 vss vdd_27 vss) delaytwentyseven
    xinv_27 out_27 out2_27 vdd vss vdd vss inverter
    save out_27
    save vvdd_27:p
    vvdd_28 vdd_28 0 vsource type=dc dc=1
    xdelaytwentyeight (in out_28 vdd_28 vss vdd_28 vss) delaytwentyeight
    xinv_28 out_28 out2_28 vdd vss vdd vss inverter
    save out_28
    save vvdd_28:p
    vvdd_29 vdd_29 0 vsource type=dc dc=1
    xdelaytwentynine (in out_29 vdd_29 vss vdd_29 vss) delaytwentynine
    xinv_29 out_29 out2_29 vdd vss vdd vss inverter
    save out_29
    save vvdd_29:p
    vvdd_30 vdd_30 0 vsource type=dc dc=1
    xdelaythirty (in out_30 vdd_30 vss vdd_30 vss) delaythirty
    xinv_30 out_30 out2_30 vdd vss vdd vss inverter
    save out_30
    save vvdd_30:p
    vvdd_31 vdd_31 0 vsource type=dc dc=1
    xdelaythirtyone (in out_31 vdd_31 vss vdd_31 vss) delaythirtyone
    xinv_31 out_31 out2_31 vdd vss vdd vss inverter
    save out_31
    save vvdd_31:p
    vvdd_32 vdd_32 0 vsource type=dc dc=1
    xdelaythirtytwo (in out_32 vdd_32 vss vdd_32 vss) delaythirtytwo
    xinv_32 out_32 out2_32 vdd vss vdd vss inverter
    save out_32
    save vvdd_32:p
    vvdd_33 vdd_33 0 vsource type=dc dc=1
    xdelaythirtythree (in out_33 vdd_33 vss vdd_33 vss) delaythirtythree
    xinv_33 out_33 out2_33 vdd vss vdd vss inverter
    save out_33
    save vvdd_33:p
    vvdd_34 vdd_34 0 vsource type=dc dc=1
    xdelaythirtyfour (in out_34 vdd_34 vss vdd_34 vss) delaythirtyfour
    xinv_34 out_34 out2_34 vdd vss vdd vss inverter
    save out_34
    save vvdd_34:p
    vvdd_35 vdd_35 0 vsource type=dc dc=1
    xdelaythirtyfive (in out_35 vdd_35 vss vdd_35 vss) delaythirtyfive
    xinv_35 out_35 out2_35 vdd vss vdd vss inverter
    save out_35
    save vvdd_35:p
    vvdd_36 vdd_36 0 vsource type=dc dc=1
    xdelaythirtysix (in out_36 vdd_36 vss vdd_36 vss) delaythirtysix
    xinv_36 out_36 out2_36 vdd vss vdd vss inverter
    save out_36
    save vvdd_36:p
    vvdd_37 vdd_37 0 vsource type=dc dc=1
    xdelaythirtyseven (in out_37 vdd_37 vss vdd_37 vss) delaythirtyseven
    xinv_37 out_37 out2_37 vdd vss vdd vss inverter
    save out_37
    save vvdd_37:p
    vvdd_38 vdd_38 0 vsource type=dc dc=1
    xdelaythirtyeigth (in out_38 vdd_38 vss vdd_38 vss) delaythirtyeigth
    xinv_38 out_38 out2_38 vdd vss vdd vss inverter
    save out_38
    save vvdd_38:p
    vvdd_39 vdd_39 0 vsource type=dc dc=1
    xdelaythirtynine (in out_39 vdd_39 vss vdd_39 vss) delaythirtynine
    xinv_39 out_39 out2_39 vdd vss vdd vss inverter
    save out_39
    save vvdd_39:p
    vvdd_40 vdd_40 0 vsource type=dc dc=1
    xdelayforty (in out_40 vdd_40 vss vdd_40 vss) delayforty
    xinv_40 out_40 out2_40 vdd vss vdd vss inverter
    save out_40
    save vvdd_40:p
    vvdd_41 vdd_41 0 vsource type=dc dc=1
    xdelayfortyone (in out_41 vdd_41 vss vdd_41 vss) delayfortyone
    xinv_41 out_41 out2_41 vdd vss vdd vss inverter
    save out_41
    save vvdd_41:p
    vvdd_42 vdd_42 0 vsource type=dc dc=1
    xdelayfortytwo (in out_42 vdd_42 vss vdd_42 vss) delayfortytwo
    xinv_42 out_42 out2_42 vdd vss vdd vss inverter
    save out_42
    save vvdd_42:p
    vvdd_43 vdd_43 0 vsource type=dc dc=1
    xdelayfortythree (in out_43 vdd_43 vss vdd_43 vss) delayfortythree
    xinv_43 out_43 out2_43 vdd vss vdd vss inverter
    save out_43
    save vvdd_43:p
    vvdd_44 vdd_44 0 vsource type=dc dc=1
    xdelayfortyfour (in out_44 vdd_44 vss vdd_44 vss) delayfortyfour
    xinv_44 out_44 out2_44 vdd vss vdd vss inverter
    save out_44
    save vvdd_44:p
    vvdd_45 vdd_45 0 vsource type=dc dc=1
    xdelayfortyfive (in out_45 vdd_45 vss vdd_45 vss) delayfortyfive
    xinv_45 out_45 out2_45 vdd vss vdd vss inverter
    save out_45
    save vvdd_45:p
    vvdd_46 vdd_46 0 vsource type=dc dc=1
    xdelayfortysix (in out_46 vdd_46 vss vdd_46 vss) delayfortysix
    xinv_46 out_46 out2_46 vdd vss vdd vss inverter
    save out_46
    save vvdd_46:p
    vvdd_47 vdd_47 0 vsource type=dc dc=1
    xdelayfortyseven (in out_47 vdd_47 vss vdd_47 vss) delayfortyseven
    xinv_47 out_47 out2_47 vdd vss vdd vss inverter
    save out_47
    save vvdd_47:p
    vvdd_48 vdd_48 0 vsource type=dc dc=1
    xdelayfortyeight (in out_48 vdd_48 vss vdd_48 vss) delayfortyeight
    xinv_48 out_48 out2_48 vdd vss vdd vss inverter
    save out_48
    save vvdd_48:p
    vvdd_49 vdd_49 0 vsource type=dc dc=1
    xdelayfortynine (in out_49 vdd_49 vss vdd_49 vss) delayfortynine
    xinv_49 out_49 out2_49 vdd vss vdd vss inverter
    save out_49
    save vvdd_49:p
    vvdd_50 vdd_50 0 vsource type=dc dc=1
    xdelayfifty (in out_50 vdd_50 vss vdd_50 vss) delayfifty
    xinv_50 out_50 out2_50 vdd vss vdd vss inverter
    save out_50
    save vvdd_50:p
save in