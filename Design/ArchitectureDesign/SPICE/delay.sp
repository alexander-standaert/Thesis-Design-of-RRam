simulator lang=spectre

include "CMOSlogic.scs"
subckt delayone (a_0 a_2 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwo (a_0 a_4 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythree (a_0 a_6 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfour (a_0 a_8 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfive (a_0 a_10 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaysix (a_0 a_12 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayseven (a_0 a_14 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayeight (a_0 a_16 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaynine (a_0 a_18 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayten (a_0 a_20 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayeleven (a_0 a_22 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwelve (a_0 a_24 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirteen (a_0 a_26 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfourteen (a_0 a_28 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfifteen (a_0 a_30 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaysixteen (a_0 a_32 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayseventeen (a_0 a_34 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayeighteen (a_0 a_36 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaynineteen (a_0 a_38 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwenty (a_0 a_40 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentyone (a_0 a_42 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentytwo (a_0 a_44 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentythree (a_0 a_46 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentyfour (a_0 a_48 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentyfive (a_0 a_50 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentysix (a_0 a_52 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentyseven (a_0 a_54 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentyeight (a_0 a_56 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaytwentynine (a_0 a_58 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirty (a_0 a_60 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtyone (a_0 a_62 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtytwo (a_0 a_64 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtythree (a_0 a_66 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtyfour (a_0 a_68 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtyfive (a_0 a_70 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtysix (a_0 a_72 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtyseven (a_0 a_74 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtyeigth (a_0 a_76 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delaythirtynine (a_0 a_78 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayforty (a_0 a_80 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortyone (a_0 a_82 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortytwo (a_0 a_84 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortythree (a_0 a_86 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortyfour (a_0 a_88 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortyfive (a_0 a_90 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter
xinv_88 (a_88 a_89 vdd vss PBulkLine NBulkLine) inverter
xinv_89 (a_89 a_90 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortysix (a_0 a_92 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter
xinv_88 (a_88 a_89 vdd vss PBulkLine NBulkLine) inverter
xinv_89 (a_89 a_90 vdd vss PBulkLine NBulkLine) inverter
xinv_90 (a_90 a_91 vdd vss PBulkLine NBulkLine) inverter
xinv_91 (a_91 a_92 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortyseven (a_0 a_94 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter
xinv_88 (a_88 a_89 vdd vss PBulkLine NBulkLine) inverter
xinv_89 (a_89 a_90 vdd vss PBulkLine NBulkLine) inverter
xinv_90 (a_90 a_91 vdd vss PBulkLine NBulkLine) inverter
xinv_91 (a_91 a_92 vdd vss PBulkLine NBulkLine) inverter
xinv_92 (a_92 a_93 vdd vss PBulkLine NBulkLine) inverter
xinv_93 (a_93 a_94 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortyeight (a_0 a_96 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter
xinv_88 (a_88 a_89 vdd vss PBulkLine NBulkLine) inverter
xinv_89 (a_89 a_90 vdd vss PBulkLine NBulkLine) inverter
xinv_90 (a_90 a_91 vdd vss PBulkLine NBulkLine) inverter
xinv_91 (a_91 a_92 vdd vss PBulkLine NBulkLine) inverter
xinv_92 (a_92 a_93 vdd vss PBulkLine NBulkLine) inverter
xinv_93 (a_93 a_94 vdd vss PBulkLine NBulkLine) inverter
xinv_94 (a_94 a_95 vdd vss PBulkLine NBulkLine) inverter
xinv_95 (a_95 a_96 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfortynine (a_0 a_98 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter
xinv_88 (a_88 a_89 vdd vss PBulkLine NBulkLine) inverter
xinv_89 (a_89 a_90 vdd vss PBulkLine NBulkLine) inverter
xinv_90 (a_90 a_91 vdd vss PBulkLine NBulkLine) inverter
xinv_91 (a_91 a_92 vdd vss PBulkLine NBulkLine) inverter
xinv_92 (a_92 a_93 vdd vss PBulkLine NBulkLine) inverter
xinv_93 (a_93 a_94 vdd vss PBulkLine NBulkLine) inverter
xinv_94 (a_94 a_95 vdd vss PBulkLine NBulkLine) inverter
xinv_95 (a_95 a_96 vdd vss PBulkLine NBulkLine) inverter
xinv_96 (a_96 a_97 vdd vss PBulkLine NBulkLine) inverter
xinv_97 (a_97 a_98 vdd vss PBulkLine NBulkLine) inverter

ends delay


subckt delayfifty (a_0 a_100 vss PBulkLine NBulkLine)

xinv_0 (a_0 a_1 vdd vss PBulkLine NBulkLine) inverter
xinv_1 (a_1 a_2 vdd vss PBulkLine NBulkLine) inverter
xinv_2 (a_2 a_3 vdd vss PBulkLine NBulkLine) inverter
xinv_3 (a_3 a_4 vdd vss PBulkLine NBulkLine) inverter
xinv_4 (a_4 a_5 vdd vss PBulkLine NBulkLine) inverter
xinv_5 (a_5 a_6 vdd vss PBulkLine NBulkLine) inverter
xinv_6 (a_6 a_7 vdd vss PBulkLine NBulkLine) inverter
xinv_7 (a_7 a_8 vdd vss PBulkLine NBulkLine) inverter
xinv_8 (a_8 a_9 vdd vss PBulkLine NBulkLine) inverter
xinv_9 (a_9 a_10 vdd vss PBulkLine NBulkLine) inverter
xinv_10 (a_10 a_11 vdd vss PBulkLine NBulkLine) inverter
xinv_11 (a_11 a_12 vdd vss PBulkLine NBulkLine) inverter
xinv_12 (a_12 a_13 vdd vss PBulkLine NBulkLine) inverter
xinv_13 (a_13 a_14 vdd vss PBulkLine NBulkLine) inverter
xinv_14 (a_14 a_15 vdd vss PBulkLine NBulkLine) inverter
xinv_15 (a_15 a_16 vdd vss PBulkLine NBulkLine) inverter
xinv_16 (a_16 a_17 vdd vss PBulkLine NBulkLine) inverter
xinv_17 (a_17 a_18 vdd vss PBulkLine NBulkLine) inverter
xinv_18 (a_18 a_19 vdd vss PBulkLine NBulkLine) inverter
xinv_19 (a_19 a_20 vdd vss PBulkLine NBulkLine) inverter
xinv_20 (a_20 a_21 vdd vss PBulkLine NBulkLine) inverter
xinv_21 (a_21 a_22 vdd vss PBulkLine NBulkLine) inverter
xinv_22 (a_22 a_23 vdd vss PBulkLine NBulkLine) inverter
xinv_23 (a_23 a_24 vdd vss PBulkLine NBulkLine) inverter
xinv_24 (a_24 a_25 vdd vss PBulkLine NBulkLine) inverter
xinv_25 (a_25 a_26 vdd vss PBulkLine NBulkLine) inverter
xinv_26 (a_26 a_27 vdd vss PBulkLine NBulkLine) inverter
xinv_27 (a_27 a_28 vdd vss PBulkLine NBulkLine) inverter
xinv_28 (a_28 a_29 vdd vss PBulkLine NBulkLine) inverter
xinv_29 (a_29 a_30 vdd vss PBulkLine NBulkLine) inverter
xinv_30 (a_30 a_31 vdd vss PBulkLine NBulkLine) inverter
xinv_31 (a_31 a_32 vdd vss PBulkLine NBulkLine) inverter
xinv_32 (a_32 a_33 vdd vss PBulkLine NBulkLine) inverter
xinv_33 (a_33 a_34 vdd vss PBulkLine NBulkLine) inverter
xinv_34 (a_34 a_35 vdd vss PBulkLine NBulkLine) inverter
xinv_35 (a_35 a_36 vdd vss PBulkLine NBulkLine) inverter
xinv_36 (a_36 a_37 vdd vss PBulkLine NBulkLine) inverter
xinv_37 (a_37 a_38 vdd vss PBulkLine NBulkLine) inverter
xinv_38 (a_38 a_39 vdd vss PBulkLine NBulkLine) inverter
xinv_39 (a_39 a_40 vdd vss PBulkLine NBulkLine) inverter
xinv_40 (a_40 a_41 vdd vss PBulkLine NBulkLine) inverter
xinv_41 (a_41 a_42 vdd vss PBulkLine NBulkLine) inverter
xinv_42 (a_42 a_43 vdd vss PBulkLine NBulkLine) inverter
xinv_43 (a_43 a_44 vdd vss PBulkLine NBulkLine) inverter
xinv_44 (a_44 a_45 vdd vss PBulkLine NBulkLine) inverter
xinv_45 (a_45 a_46 vdd vss PBulkLine NBulkLine) inverter
xinv_46 (a_46 a_47 vdd vss PBulkLine NBulkLine) inverter
xinv_47 (a_47 a_48 vdd vss PBulkLine NBulkLine) inverter
xinv_48 (a_48 a_49 vdd vss PBulkLine NBulkLine) inverter
xinv_49 (a_49 a_50 vdd vss PBulkLine NBulkLine) inverter
xinv_50 (a_50 a_51 vdd vss PBulkLine NBulkLine) inverter
xinv_51 (a_51 a_52 vdd vss PBulkLine NBulkLine) inverter
xinv_52 (a_52 a_53 vdd vss PBulkLine NBulkLine) inverter
xinv_53 (a_53 a_54 vdd vss PBulkLine NBulkLine) inverter
xinv_54 (a_54 a_55 vdd vss PBulkLine NBulkLine) inverter
xinv_55 (a_55 a_56 vdd vss PBulkLine NBulkLine) inverter
xinv_56 (a_56 a_57 vdd vss PBulkLine NBulkLine) inverter
xinv_57 (a_57 a_58 vdd vss PBulkLine NBulkLine) inverter
xinv_58 (a_58 a_59 vdd vss PBulkLine NBulkLine) inverter
xinv_59 (a_59 a_60 vdd vss PBulkLine NBulkLine) inverter
xinv_60 (a_60 a_61 vdd vss PBulkLine NBulkLine) inverter
xinv_61 (a_61 a_62 vdd vss PBulkLine NBulkLine) inverter
xinv_62 (a_62 a_63 vdd vss PBulkLine NBulkLine) inverter
xinv_63 (a_63 a_64 vdd vss PBulkLine NBulkLine) inverter
xinv_64 (a_64 a_65 vdd vss PBulkLine NBulkLine) inverter
xinv_65 (a_65 a_66 vdd vss PBulkLine NBulkLine) inverter
xinv_66 (a_66 a_67 vdd vss PBulkLine NBulkLine) inverter
xinv_67 (a_67 a_68 vdd vss PBulkLine NBulkLine) inverter
xinv_68 (a_68 a_69 vdd vss PBulkLine NBulkLine) inverter
xinv_69 (a_69 a_70 vdd vss PBulkLine NBulkLine) inverter
xinv_70 (a_70 a_71 vdd vss PBulkLine NBulkLine) inverter
xinv_71 (a_71 a_72 vdd vss PBulkLine NBulkLine) inverter
xinv_72 (a_72 a_73 vdd vss PBulkLine NBulkLine) inverter
xinv_73 (a_73 a_74 vdd vss PBulkLine NBulkLine) inverter
xinv_74 (a_74 a_75 vdd vss PBulkLine NBulkLine) inverter
xinv_75 (a_75 a_76 vdd vss PBulkLine NBulkLine) inverter
xinv_76 (a_76 a_77 vdd vss PBulkLine NBulkLine) inverter
xinv_77 (a_77 a_78 vdd vss PBulkLine NBulkLine) inverter
xinv_78 (a_78 a_79 vdd vss PBulkLine NBulkLine) inverter
xinv_79 (a_79 a_80 vdd vss PBulkLine NBulkLine) inverter
xinv_80 (a_80 a_81 vdd vss PBulkLine NBulkLine) inverter
xinv_81 (a_81 a_82 vdd vss PBulkLine NBulkLine) inverter
xinv_82 (a_82 a_83 vdd vss PBulkLine NBulkLine) inverter
xinv_83 (a_83 a_84 vdd vss PBulkLine NBulkLine) inverter
xinv_84 (a_84 a_85 vdd vss PBulkLine NBulkLine) inverter
xinv_85 (a_85 a_86 vdd vss PBulkLine NBulkLine) inverter
xinv_86 (a_86 a_87 vdd vss PBulkLine NBulkLine) inverter
xinv_87 (a_87 a_88 vdd vss PBulkLine NBulkLine) inverter
xinv_88 (a_88 a_89 vdd vss PBulkLine NBulkLine) inverter
xinv_89 (a_89 a_90 vdd vss PBulkLine NBulkLine) inverter
xinv_90 (a_90 a_91 vdd vss PBulkLine NBulkLine) inverter
xinv_91 (a_91 a_92 vdd vss PBulkLine NBulkLine) inverter
xinv_92 (a_92 a_93 vdd vss PBulkLine NBulkLine) inverter
xinv_93 (a_93 a_94 vdd vss PBulkLine NBulkLine) inverter
xinv_94 (a_94 a_95 vdd vss PBulkLine NBulkLine) inverter
xinv_95 (a_95 a_96 vdd vss PBulkLine NBulkLine) inverter
xinv_96 (a_96 a_97 vdd vss PBulkLine NBulkLine) inverter
xinv_97 (a_97 a_98 vdd vss PBulkLine NBulkLine) inverter
xinv_98 (a_98 a_99 vdd vss PBulkLine NBulkLine) inverter
xinv_99 (a_99 a_100 vdd vss PBulkLine NBulkLine) inverter

ends delay

