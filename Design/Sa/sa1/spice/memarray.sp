simulator lang=spectre

subckt memarray ( bl_1 bl_2 sel1_1 sel1_2 sel1_3 sel2_1 sel2_2 sel2_3 wl_1 wl_2 wl_3 sl_1 sl_2 sl_3 vload_1 vload_2 vload_3  vpreload gnd vdd )

// mem cell branch
xsel1_1 node1_1 sel1_1 vload_1 vdd MOSP w=5e-08
rload_1 (node1_1 bl_1) resistor r=0

rmemcell (bl_1 node2_1) resistor r=30000
msl_1 node2_1 wl_1 sl_1 gnd MOSN

cload_1 (bl_1 gnd) capacitor c=1.8e-14
xsel2_1 bl_1 sel2_1 vpreload gnd MOSN

// high ref cell branch
xsel1_2 node1_2 sel1_2 vload_2 vdd MOSP w=5e-08
rload_2 (node1_2 bl_2) resistor r=0

rmemhigh (bl_2 node2_2) resistor r=35000
xsl_2 node2_2 wl_2 sl_2 gnd MOSN

cload_2 (bl_2 gnd) capacitor c=1.8e-14
xsel2_2 bl_2 sel2_2 vpreload gnd MOSN

// low ref cell branch
xsel1_3 node1_3 sel1_3 vload_3 vdd MOSP w=5e-08
rload_3 (node1_3 bl_3) resistor r=0

rmemlow (bl_3 node2_3) resistor r=5000
msl_3 node2_3 wl_3 sl_3 gnd MOSN

cload_3 (bl_3 gnd) capacitor c=1.8e-14
xsel2_3 bl_3 sel2_3 vpreload gnd MOSN

aliasbl ( bl_2 bl_3 ) vsource type=dc dc=0

ic bl_1=0.2
ic bl_2=0.1
ic bl_3=0.2


ends memarray