
simulator lang=spice
.include ../../../technology_models/tech_wrapper.lib mc

simulator lang=spectre

/////////////////////////////////////////////////////////

subckt memcell ( wl bl sl gnd R=10K )

m1 bl sl node1 gnd nmos
Rcell (wl node1) resistor r=R

ends memcell

/////////////////////////////////////////////////////////

subckt memarray ( wl_1 wl_2 wl_3 wl_4 wl_5 bl_1 bl_2 bl_3 bl_4 bl_5 sl_1_1 sl_1_2 sl_1_3 sl_1_4 sl_1_5 sl_2_1 sl_2_2 sl_2_3 sl_2_4 sl_2_5 sl_3_1 sl_3_2 sl_3_3 sl_3_4 sl_3_5 sl_4_1 sl_4_2 sl_4_3 sl_4_4 sl_4_5 sl_5_1 sl_5_2 sl_5_3 sl_5_4 sl_5_5 gnd )

Mcell_1_1 ( wl_1 bl_1 sl_1_1 gnd ) memcell	R=4484
Mcell_1_2 ( wl_1 bl_2 sl_1_2 gnd ) memcell	R=8117
Mcell_1_3 ( wl_1 bl_3 sl_1_3 gnd ) memcell	R=7896
Mcell_1_4 ( wl_1 bl_4 sl_1_4 gnd ) memcell	R=3464
Mcell_1_5 ( wl_1 bl_5 sl_1_5 gnd ) memcell	R=3071
Mcell_2_1 ( wl_2 bl_1 sl_2_1 gnd ) memcell	R=6485
Mcell_2_2 ( wl_2 bl_2 sl_2_2 gnd ) memcell	R=10638
Mcell_2_3 ( wl_2 bl_3 sl_2_3 gnd ) memcell	R=5063
Mcell_2_4 ( wl_2 bl_4 sl_2_4 gnd ) memcell	R=7267
Mcell_2_5 ( wl_2 bl_5 sl_2_5 gnd ) memcell	R=4014
Mcell_3_1 ( wl_3 bl_1 sl_3_1 gnd ) memcell	R=8761
Mcell_3_2 ( wl_3 bl_2 sl_3_2 gnd ) memcell	R=4296
Mcell_3_3 ( wl_3 bl_3 sl_3_3 gnd ) memcell	R=6554
Mcell_3_4 ( wl_3 bl_4 sl_3_4 gnd ) memcell	R=8292
Mcell_3_5 ( wl_3 bl_5 sl_3_5 gnd ) memcell	R=10018
Mcell_4_1 ( wl_4 bl_1 sl_4_1 gnd ) memcell	R=10634
Mcell_4_2 ( wl_4 bl_2 sl_4_2 gnd ) memcell	R=6925
Mcell_4_3 ( wl_4 bl_3 sl_4_3 gnd ) memcell	R=3248
Mcell_4_4 ( wl_4 bl_4 sl_4_4 gnd ) memcell	R=3344
Mcell_4_5 ( wl_4 bl_5 sl_4_5 gnd ) memcell	R=4318
Mcell_5_1 ( wl_5 bl_1 sl_5_1 gnd ) memcell	R=9566
Mcell_5_2 ( wl_5 bl_2 sl_5_2 gnd ) memcell	R=4289
Mcell_5_3 ( wl_5 bl_3 sl_5_3 gnd ) memcell	R=9329
Mcell_5_4 ( wl_5 bl_4 sl_5_4 gnd ) memcell	R=4192
Mcell_5_5 ( wl_5 bl_5 sl_5_5 gnd ) memcell	R=10363

ends memarray