simulator lang=spice

.include './latch.sp'
.include './memarray.sp'
.lib '../../../technology_models/tech_wrapper.lib' mc


simulator lang=spectre

mmemarray ( bl_1 bl_2 sel1_1 sel1_2 sel1_3 sel2_1 sel2_2 sel2_3 wl_1 wl_2 wl_3 sl_1 sl_2 sl_3 vload_1 vload_2 vload_3 vss vdd ) memarray
mlatch (bl_1 bl_2 out outbar vdd vss vdd vss LE1 LE2 selL1 selL2) latch

vsel1_1 sel1_1 gnd vsource type=pwl wave=[0 0 4e-09 0 4.1e-09 1 1e-08 1]
vsel1_2 sel1_2 gnd vsource type=pwl wave=[0 0 4e-09 0 4.1e-09 1 1e-08 1]
vsel1_3 sel1_3 gnd vsource type=pwl wave=[0 0 4e-09 0 4.1e-09 1 1e-08 1]

vsel2_1 sel2_1 gnd vsource type=pwl wave=[0 0 2e-09 0 2.1e-09 1 4e-09 0 4.05e-09 0 1e-08 0]
vsel2_2 sel2_2 gnd vsource type=pwl wave=[0 0 2e-09 0 2.1e-09 1 4e-09 0 4.05e-09 0 1e-08 0]
vsel2_3 sel2_3 gnd vsource type=pwl wave=[0 0 2e-09 0 2.1e-09 1 4e-09 0 4.05e-09 0 1e-08 0]

vwl_1 wl_1 gnd vsource type=pwl wave=[0 0 4.2e-09 0 4.3e-09 1 9.7e-09 1]
vwl_2 wl_2 gnd vsource type=pwl wave=[0 0 4.2e-09 0 4.3e-09 1 9.7e-09 1]
vwl_3 wl_3 gnd vsource type=pwl wave=[0 0 4.2e-09 0 4.3e-09 1 9.7e-09 1]

vsl_1 sl_1 gnd vsource type=pwl wave=[0 0]
vsl_2 sl_2 gnd vsource type=pwl wave=[0 0]
vsl_3 sl_3 gnd vsource type=pwl wave=[0 0]

vvload_1 vload_1 gnd  vsource type=dc dc=1
vvload_2 vload_2 gnd  vsource type=dc dc=1
vvload_3 vload_3 gnd  vsource type=dc dc=1

vLE1 LE1 gnd vsource type=pwl wave=[0 1 5e-09 1 5.05e-09 0 1e-08 0]
vLE2 LE2 gnd vsource type=pwl wave=[0 0 5e-09 0 5.1e-09 1 1e-08 1]

vselL1 selL1 gnd vsource type=pwl wave=[0 0 4.5e-09 0 4.6e-09 1 5e-09 0 5.05e-09 0 1e-08 0]
vselL2 selL2 gnd vsource type=pwl wave=[0 0 4.5e-09 0 4.6e-09 1 5e-09 0 5.05e-09 0 1e-08 0]

vgnd gnd 0 vsource type=dc dc=0

ana tran step=1e-12 stop=1e-12