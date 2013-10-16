simulator lang=spectre

subckt memarray ( bl_1 bl_2 sel1_1 sel1_2 sel1_3 sel2_1 sel2_2 sel2_3 wl_1 wl_2 wl_3 sl_1 sl_2 sl_3 vload_1 vload_2 vload_3 gnd vdd )

// mem cell branch
msel1_1 node1_1 sel1_1 vload_1 vdd pmos
rload_1 (node1_1 bl_1) resistor r=100

rmemcell (bl_1 node2_1) resistor r=10000
msl_1 node2_1 wl_1 sl_1 gnd nmos

cload_1 (bl_1 gnd) capacitor c=1.8e-14
msel2_1 bl_1 sel2_1 gnd gnd nmos

// high ref cell branch
msel1_2 node1_1 sel1_1 vload_2 vdd pmos
rload_2 (node1_1 bl_1) resistor r=100

rmemhigh (bl_1 node2_1) resistor r=35000
msl1_2 node2_1 wl_1 sl_1 gnd nmos

cload_2 (bl_1 gnd) capacitor c=1.8e-14
msel2_2 bl_1 sel2_1 gnd gnd nmos

// low ref cell branch
msel1_3 node1_3 sel1_3 vload_3 vdd pmos
rload_3 (node1_3 bl_3) resistor r=100

rmemlow (bl_3 node2_3) resistor r=5000
msl1_3 node2_3 wl_3 sl_3 gnd nmos

cload_3 (bl_3 gnd) capacitor c=1.8e-14
msel2_3 bl_3 sel2_3 gnd gnd nmos

aliasbl ( bl_2 bl_3 ) vsource type=dc dc=0

ends memarray