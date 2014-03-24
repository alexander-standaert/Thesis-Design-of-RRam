simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt
.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre
include "../../technology_models/monte_carlo_models.scs"
include "../../ArchitectureDesign/SPICE/CMOSlogic.scs"
parameters enableMismatch=0
ana tran step=1e-12 stop=4e-08
option1 options rawfmt = psfascii
option2 options dc_pivot_check = yes

vin in vss vsource type=pwl wave=[0 0 1e-09 0 1.001e-09 1]
vgnd vss 0 vsource type=dc dc=0

vvdd vdd 0 vsource type=dc dc=1
vvdd1 vdd1 0 vsource type=dc dc=1
vvdd2 vdd2 0 vsource type=dc dc=1

parameters PWmin = 100n                         //MinimalTransistorWidth
parameters PLmin = 45n                          //MinimalTransistorLenght

xinv11 (in in1bar vdd1 vss PBulkLine NBulkLine) inverter mult=2
xinv12 (in1bar in1barbar vdd1 vss PBulkLine NBulkLine) inverter mult=4
xinv13 (in1barbar in1barbarbar vdd1 vss PBulkLine NBulkLine) inverter mult=16

xinv21 (in in2bar vdd2 vss PBulkLine NBulkLine) inverter mult=1
xinv221 (in2bar in21barbar vdd2 vss PBulkLine NBulkLine) inverter mult=2
xinv222 (in2bar in22barbar vdd2 vss PBulkLine NBulkLine) inverter mult=2
xinv231 (in21barbar in21barbarbar vdd2 vss PBulkLine NBulkLine) inverter mult=4
xinv232 (in21barbar in22barbarbar vdd2 vss PBulkLine NBulkLine) inverter mult=4
xinv233 (in22barbar in23barbarbar vdd2 vss PBulkLine NBulkLine) inverter mult=4
xinv234 (in22barbar in24barbarbar vdd2 vss PBulkLine NBulkLine) inverter mult=4

xnor_1_0 (in1barbarbar vss OUT1_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_1 (in1barbarbar vss OUT1_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_2 (in1barbarbar vss OUT1_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_3 (in1barbarbar vss OUT1_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_4 (in1barbarbar vss OUT1_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_5 (in1barbarbar vss OUT1_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_6 (in1barbarbar vss OUT1_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_7 (in1barbarbar vss OUT1_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_8 (in1barbarbar vss OUT1_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_9 (in1barbarbar vss OUT1_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_10 (in1barbarbar vss OUT1_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_11 (in1barbarbar vss OUT1_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_12 (in1barbarbar vss OUT1_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_13 (in1barbarbar vss OUT1_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_14 (in1barbarbar vss OUT1_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_15 (in1barbarbar vss OUT1_15 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_16 (in1barbarbar vss OUT1_16 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_17 (in1barbarbar vss OUT1_17 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_18 (in1barbarbar vss OUT1_18 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_19 (in1barbarbar vss OUT1_19 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_20 (in1barbarbar vss OUT1_20 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_21 (in1barbarbar vss OUT1_21 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_22 (in1barbarbar vss OUT1_22 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_23 (in1barbarbar vss OUT1_23 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_24 (in1barbarbar vss OUT1_24 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_25 (in1barbarbar vss OUT1_25 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_26 (in1barbarbar vss OUT1_26 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_27 (in1barbarbar vss OUT1_27 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_28 (in1barbarbar vss OUT1_28 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_29 (in1barbarbar vss OUT1_29 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_30 (in1barbarbar vss OUT1_30 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_31 (in1barbarbar vss OUT1_31 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_32 (in1barbarbar vss OUT1_32 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_33 (in1barbarbar vss OUT1_33 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_34 (in1barbarbar vss OUT1_34 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_35 (in1barbarbar vss OUT1_35 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_36 (in1barbarbar vss OUT1_36 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_37 (in1barbarbar vss OUT1_37 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_38 (in1barbarbar vss OUT1_38 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_39 (in1barbarbar vss OUT1_39 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_40 (in1barbarbar vss OUT1_40 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_41 (in1barbarbar vss OUT1_41 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_42 (in1barbarbar vss OUT1_42 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_43 (in1barbarbar vss OUT1_43 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_44 (in1barbarbar vss OUT1_44 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_45 (in1barbarbar vss OUT1_45 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_46 (in1barbarbar vss OUT1_46 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_47 (in1barbarbar vss OUT1_47 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_48 (in1barbarbar vss OUT1_48 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_49 (in1barbarbar vss OUT1_49 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_50 (in1barbarbar vss OUT1_50 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_51 (in1barbarbar vss OUT1_51 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_52 (in1barbarbar vss OUT1_52 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_53 (in1barbarbar vss OUT1_53 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_54 (in1barbarbar vss OUT1_54 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_55 (in1barbarbar vss OUT1_55 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_56 (in1barbarbar vss OUT1_56 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_57 (in1barbarbar vss OUT1_57 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_58 (in1barbarbar vss OUT1_58 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_59 (in1barbarbar vss OUT1_59 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_60 (in1barbarbar vss OUT1_60 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_61 (in1barbarbar vss OUT1_61 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_62 (in1barbarbar vss OUT1_62 vdd vss PBulkLine NBulkLine) twonor 
xnor_1_63 (in1barbarbar vss OUT1_63 vdd vss PBulkLine NBulkLine) twonor 

xnor_21_0 (in21barbarbar vss OUT21_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_0 (in22barbarbar vss OUT22_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_0 (in23barbarbar vss OUT23_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_0 (in24barbarbar vss OUT24_0 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_1 (in21barbarbar vss OUT21_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_1 (in22barbarbar vss OUT22_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_1 (in23barbarbar vss OUT23_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_1 (in24barbarbar vss OUT24_1 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_2 (in21barbarbar vss OUT21_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_2 (in22barbarbar vss OUT22_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_2 (in23barbarbar vss OUT23_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_2 (in24barbarbar vss OUT24_2 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_3 (in21barbarbar vss OUT21_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_3 (in22barbarbar vss OUT22_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_3 (in23barbarbar vss OUT23_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_3 (in24barbarbar vss OUT24_3 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_4 (in21barbarbar vss OUT21_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_4 (in22barbarbar vss OUT22_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_4 (in23barbarbar vss OUT23_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_4 (in24barbarbar vss OUT24_4 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_5 (in21barbarbar vss OUT21_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_5 (in22barbarbar vss OUT22_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_5 (in23barbarbar vss OUT23_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_5 (in24barbarbar vss OUT24_5 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_6 (in21barbarbar vss OUT21_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_6 (in22barbarbar vss OUT22_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_6 (in23barbarbar vss OUT23_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_6 (in24barbarbar vss OUT24_6 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_7 (in21barbarbar vss OUT21_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_7 (in22barbarbar vss OUT22_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_7 (in23barbarbar vss OUT23_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_7 (in24barbarbar vss OUT24_7 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_8 (in21barbarbar vss OUT21_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_8 (in22barbarbar vss OUT22_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_8 (in23barbarbar vss OUT23_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_8 (in24barbarbar vss OUT24_8 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_9 (in21barbarbar vss OUT21_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_9 (in22barbarbar vss OUT22_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_9 (in23barbarbar vss OUT23_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_9 (in24barbarbar vss OUT24_9 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_10 (in21barbarbar vss OUT21_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_10 (in22barbarbar vss OUT22_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_10 (in23barbarbar vss OUT23_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_10 (in24barbarbar vss OUT24_10 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_11 (in21barbarbar vss OUT21_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_11 (in22barbarbar vss OUT22_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_11 (in23barbarbar vss OUT23_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_11 (in24barbarbar vss OUT24_11 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_12 (in21barbarbar vss OUT21_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_12 (in22barbarbar vss OUT22_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_12 (in23barbarbar vss OUT23_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_12 (in24barbarbar vss OUT24_12 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_13 (in21barbarbar vss OUT21_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_13 (in22barbarbar vss OUT22_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_13 (in23barbarbar vss OUT23_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_13 (in24barbarbar vss OUT24_13 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_14 (in21barbarbar vss OUT21_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_14 (in22barbarbar vss OUT22_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_14 (in23barbarbar vss OUT23_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_14 (in24barbarbar vss OUT24_14 vdd vss PBulkLine NBulkLine) twonor 
xnor_21_15 (in21barbarbar vss OUT21_15 vdd vss PBulkLine NBulkLine) twonor 
xnor_22_15 (in22barbarbar vss OUT22_15 vdd vss PBulkLine NBulkLine) twonor 
xnor_23_15 (in23barbarbar vss OUT23_15 vdd vss PBulkLine NBulkLine) twonor 
xnor_24_15 (in24barbarbar vss OUT24_15 vdd vss PBulkLine NBulkLine) twonor 
