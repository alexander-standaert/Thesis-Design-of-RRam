///////////////////////////////////////////////////////////////////////////
// SIMULATION SETTINGS

simulator lang=spice
.include '../../../technology_models/transistorsPTM.scs'

.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre

parameters enableVtMismatch=1
parameters enableBMismatch=0

    mc montecarlo donominal=no variations=mismatch seed=1234 numruns=30 firstrun=1 saveprocessparams=yes savefamilyplots=yes {
        ana tran step=1e-12 stop=1e-08
    }
    parameters tp = mc_pmos_lvt
    parameters tn = mc_nmos_lvt

///////////////////////////////////////////////////////////////////////////
// TEST BENCH + SIGNALS
mmemarray ( bl wl_1 sl_1 sel_1 sel_2 sel_3 sel_4 gnd vdd) memarray
msa (bl out gnd vdd) sa

vwl_1 wl_1 gnd vsource type=pwl wave=[0 0 1e-09 0 1.1e-09 1 6.5e-09 1]

vsl_1 sl_1 gnd vsource type=pwl wave=[0 0 1e-09 0 1.05e-09 0 6.5e-09 0]

vsel_1 sel_1 gnd vsource type=pwl wave=[0 1 1e-09 1 1.1e-09 1 6.5e-09 1]
vsel_2 sel_2 gnd vsource type=pwl wave=[0 1 1e-09 1 1.05e-09 0 6.5e-09 0]
vsel_3 sel_3 gnd vsource type=pwl wave=[0 1 1e-09 1 1.1e-09 1 6.5e-09 1]
vsel_4 sel_4 gnd vsource type=pwl wave=[0 1 1e-09 1 1.1e-09 1 6.5e-09 1]

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

subckt memarray ( bl wl_1 sl_1 sel_1 sel_2 sel_3 sel_4 gnd vdd)

// mem cell
rmemcell (bl node2_1) resistor r=10000
msl_1 node2_1 wl_1 sl_1 gnd tn

xsel_1 vdd sel_1 bl vdd tp w=1e-07
xsel_2 vdd sel_2 bl vdd tp w=1.2e-07
xsel_3 vdd sel_3 bl vdd tp w=1.4e-07
xsel_4 vdd sel_4 bl vdd tp w=1.6e-07

// bl
cload_1 (bl gnd) capacitor c=1.8e-14

ic bl=0

ends memarray