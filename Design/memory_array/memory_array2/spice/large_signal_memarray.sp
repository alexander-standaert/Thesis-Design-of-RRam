///////////////////////////////////////////////////////////////////////////
// SIMULATION SETTINGS

simulator lang=spice
.include '../../../technology_models/transistorsPTM.scs'

.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre

    mc montecarlo donominal=no variations=mismatch seed=1234 numruns=50 firstrun=1 saveprocessparams=yes savefamilyplots=yes {
        ana tran step=1e-12 stop=4.9e-08
    }
    parameters tp = mc_pmos_lvt
    parameters tn = mc_nmos_lvt
    parameters enableVtMismatch=1
    parameters enableBMismatch=0

///////////////////////////////////////////////////////////////////////////
// TEST BENCH + SIGNALS
mmemarray ( bl wl_1 wl_2 sl_1 sel_0 sel_1 sel_2 sel_3 sel_4 gnd vdd) memarray
msa (bl out gnd vdd) sa

vwl_1 wl_1 gnd vsource type=pwl wave=[0 0 1e-09 0 1.1e-09 1 6e-09 1 6.05e-09 0 7e-09 0 7.05e-09 0 1.2e-08 0 1.205e-08 0 1.3e-08 0 1.31e-08 1 1.8e-08 1 1.805e-08 0 1.9e-08 0 1.905e-08 0 2.4e-08 0 2.405e-08 0 2.5e-08 0 2.51e-08 1 3e-08 1 3.005e-08 0 3.1e-08 0 3.105e-08 0 3.6e-08 0 3.605e-08 0 3.7e-08 0 3.71e-08 1 4.2e-08 1 4.205e-08 0 4.3e-08 0 4.305e-08 0 4.8e-08 0 4.805e-08 0 5.35e-08 0]
vwl_2 wl_2 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6e-09 0 6.05e-09 0 7e-09 0 7.1e-09 1 1.2e-08 1 1.205e-08 0 1.3e-08 0 1.305e-08 0 1.8e-08 0 1.805e-08 0 1.9e-08 0 1.91e-08 1 2.4e-08 1 2.405e-08 0 2.5e-08 0 2.505e-08 0 3e-08 0 3.005e-08 0 3.1e-08 0 3.11e-08 1 3.6e-08 1 3.605e-08 0 3.7e-08 0 3.705e-08 0 4.2e-08 0 4.205e-08 0 4.3e-08 0 4.31e-08 1 4.8e-08 1 4.805e-08 0 5.35e-08 0]

vsl_1 sl_1 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6.5e-09 0]

vsel_0 sel_0 gnd vsource type=pwl wave=[0 1 1e-09 1 1.05e-09 0 6e-09 0 6.1e-09 1 7e-09 1 7.05e-09 0 1.2e-08 0 1.21e-08 1 1.3e-08 1 1.305e-08 0 1.8e-08 0 1.81e-08 1 1.9e-08 1 1.905e-08 0 2.4e-08 0 2.41e-08 1 2.5e-08 1 2.505e-08 0 3e-08 0 3.01e-08 1 3.1e-08 1 3.105e-08 0 3.6e-08 0 3.61e-08 1 3.7e-08 1 3.705e-08 0 4.2e-08 0 4.21e-08 1 4.3e-08 1 4.305e-08 0 4.8e-08 0 4.81e-08 1 5.35e-08 1]

vsel_1 sel_1 gnd vsource type=pwl wave=[0 1 1e-09 1 1.05e-09 0 6e-09 0 6.1e-09 1 7e-09 1 7.05e-09 0 1.2e-08 0 1.21e-08 1 1.75e-08 1]
vsel_2 sel_2 gnd vsource type=pwl wave=[0 1 1.3e-08 1 1.305e-08 0 1.8e-08 0 1.81e-08 1 1.9e-08 1 1.905e-08 0 2.4e-08 0 2.41e-08 1 2.95e-08 1]
vsel_3 sel_3 gnd vsource type=pwl wave=[0 1 2.5e-08 1 2.505e-08 0 3e-08 0 3.01e-08 1 3.1e-08 1 3.105e-08 0 3.6e-08 0 3.61e-08 1 4.15e-08 1]
vsel_4 sel_4 gnd vsource type=pwl wave=[0 1 3.7e-08 1 3.705e-08 0 4.2e-08 0 4.21e-08 1 4.3e-08 1 4.305e-08 0 4.8e-08 0 4.81e-08 1 5.35e-08 1]

vgnd gnd 0 vsource type=dc dc=0
vvdd vdd 0 vsource type=pwl wave=[0 0 0.01n 1]

///////////////////////////////////////////////////////////////////////////
// SA

subckt sa (in out gnd vdd)

minvp out in vdd vdd tp w=4e-07
minvn out in gnd gnd tn w=2e-07

ends sa

///////////////////////////////////////////////////////////////////////////
// MEMARRAY

subckt memarray ( bl wl_1 wl_2 sl_1 sel_0 sel_1 sel_2 sel_3 sel_4 gnd vdd)

// mem cell 1
rmemcell1 (bl node2_1) resistor r=30000
msl_1 node2_1 wl_1 sl_1 gnd tn
// mem cell 2
rmemcell2 (bl node2_2) resistor r=10000
msl_2 node2_2 wl_2 sl_1 gnd tn

    xsel_1 bl_ex sel_1 bl vdd tp w=1e-07
    xsel_2 bl_ex sel_2 bl vdd tp w=1e-07
    xsel_3 bl_ex sel_3 bl vdd tp w=1e-07
    xsel_4 bl_ex sel_4 bl vdd tp w=1e-07
    xbias bl_ex biasV vdd bl_ex tp w=3e-07
    vbias biasV gnd vsource type=pwl wave=[0 0 1.3e-08 0 1.31e-08 0.1 2.5e-08 0.1 2.51e-08 0.3 3.7e-08 0.3 3.71e-08 0.4 4.25e-08 0.4]

// bl
cload_1 (bl gnd) capacitor c=1.8e-14
xsel_0 gnd sel_0 bl gnd tn 

ic bl=0

ends memarray