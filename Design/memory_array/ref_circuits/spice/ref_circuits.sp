///////////////////////////////////////////////////////////////////////////
// SIMULATION SETTINGS

simulator lang=spice
.include '../../../technology_models/transistorsPTM.scs'

.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre

    mc montecarlo donominal=no variations=mismatch seed=1234 numruns=200 firstrun=1 saveprocessparams=yes savefamilyplots=yes {
        ana tran step=1e-12 stop=2e-08
    }
    parameters tp = mc_pmos_lvt
    parameters tn = mc_nmos_lvt
    parameters enableVtMismatch=1
    parameters enableBMismatch=0

///////////////////////////////////////////////////////////////////////////
// TEST BENCH + SIGNALS
mmemarray ( bl wl_1 wl_2 wl_3 wl_4 sl_1 sel_0 sel_1 sel_2 gnd vdd) memarray
msa (bl out gnd vdd) sa

vwl_1 wl_1 gnd vsource type=pwl wave=[0 0 1e-09 0 1.1e-09 1 6e-09 1 6.05e-09 0 7e-09 0 7.05e-09 0 1.2e-08 0 1.205e-08 0 1.3e-08 0 1.305e-08 0 1.8e-08 0 1.805e-08 0 2.35e-08 0]
vwl_2 wl_2 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6e-09 0 6.05e-09 0 7e-09 0 7.1e-09 1 1.2e-08 1 1.205e-08 0 1.3e-08 0 1.305e-08 0 1.8e-08 0 1.805e-08 0 2.35e-08 0]
vwl_3 wl_3 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6e-09 0 6.05e-09 0 7e-09 0 7.05e-09 0 1.2e-08 0 1.205e-08 0 1.3e-08 0 1.31e-08 1 1.8e-08 1 1.805e-08 0 2.35e-08 0]
vwl_4 wl_4 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6e-09 0 6.05e-09 0 7e-09 0 7.05e-09 0 1.2e-08 0 1.205e-08 0 1.3e-08 0 1.31e-08 1 1.8e-08 1 1.805e-08 0 2.35e-08 0]

vsl_1 sl_1 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6.5e-09 0]

vsel_0 sel_0 gnd vsource type=pwl wave=[0 1 1e-09 1 1.05e-09 0 6e-09 0 6.1e-09 1 7e-09 1 7.05e-09 0 1.2e-08 0 1.21e-08 1 1.3e-08 1 1.305e-08 0 1.8e-08 0 1.81e-08 1 2.35e-08 1]

vsel_1 sel_1 gnd vsource type=pwl wave=[0 1 1e-09 1 1.05e-09 0 6e-09 0 6.1e-09 1 7e-09 1 7.05e-09 0 1.2e-08 0 1.21e-08 1 1.3e-08 1 1.305e-08 0 1.8e-08 0 1.81e-08 1 2.35e-08 1]
vsel_2 sel_2 gnd vsource type=pwl wave=[0 1 1e-09 1 1.1e-09 1 6e-09 1 6.1e-09 1 7e-09 1 7.1e-09 1 1.2e-08 1 1.21e-08 1 1.3e-08 1 1.305e-08 0 1.8e-08 0 1.81e-08 1 2.35e-08 1]

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

subckt memarray ( bl wl_1 wl_2 wl_3 wl_4 sl_1 sel_0 sel_1 sel_2 gnd vdd)

// mem cell 1
rmemcell1 (bl node2_1) resistor r=30000
msl_1 node2_1 wl_1 sl_1 gnd tn
// mem cell 2
rmemcell2 (bl node2_2) resistor r=10000
msl_2 node2_2 wl_2 sl_1 gnd tn
// mem cell 3
rmemcell3 (bl node2_3) resistor r=mismatched_Rlow
msl_3 node2_3 wl_3 sl_1 gnd tn
// mem cell 4
rmemcell4 (bl node2_4) resistor r=mismatched_Rhigh
msl_4 node2_4 wl_4 sl_1 gnd tn

xsel_1 vdd sel_1 bl vdd tp w=1e-07

    xsel_2 vdd sel_2 bl vdd tp w=1e-07

// bl
cload_1 (bl gnd) capacitor c=1.8e-14
xsel_0 gnd sel_0 bl gnd tn 



ic bl=0

ends memarray