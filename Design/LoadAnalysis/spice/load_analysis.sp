///////////////////////////////////////////////////////////////////////////
// SIMULATION SETTINGS

simulator lang=spice
.lib '../../technology_models/tech_wrapper.lib' tt

.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre

    ana tran step=1e-12 stop=3.4e-08
    parameters tp = MOSP
    parameters tn = MOSN
    parameters Rmemcellhh = 35000
    parameters Rmemcellhl = 30000
    parameters Rmemcelllh = 10000
    parameters Rmemcellll = 5000

///////////////////////////////////////////////////////////////////////////
// TEST BENCH + SIGNALS
mmemarray_switch ( bl_switch wl_1 wl_2 wl_3 wl_4 sel_sl sel_pulldown gnd vdd) memarray
mmemarray_bias ( bl_bias wl_1 wl_2 wl_3 wl_4 sel_sl sel_pulldown gnd vdd) memarray
mmemarray_diode ( bl_diode wl_1 wl_2 wl_3 wl_4 sel_sl sel_pulldown gnd vdd) memarray
mmemarray_bulk ( bl_bulk wl_1 wl_2 wl_3 wl_4 sel_sl sel_pulldown gnd vdd) memarray

mload_switch ( bl_switch sel_load gnd vdd) load_switch
mload_bias ( bl_bias sel_load sel_bias gnd vdd) load_bias
mload_diode ( bl_diode sel_load gnd vdd) load_diode
mload_bulk ( bl_bulk sel_load sel_bulk gnd vdd) load_bulk

vwl_1 wl_1 gnd vsource type=pwl wave=[0 0 2e-09 0 2.1e-09 1 8e-09 1 8.05e-09 0 1.6e-08 0 1.605e-08 0 2.4e-08 0 2.405e-08 0 3.2e-08 0 3.205e-08 0 3.4e-08 0 3.41e-08 1 4e-08 1 4.005e-08 0 4.8e-08 0 4.805e-08 0 5.6e-08 0 5.605e-08 0 6.15e-08 0]
vwl_2 wl_2 gnd vsource type=pwl wave=[0 0 8e-09 0 8.05e-09 0 1e-08 0 1.01e-08 1 1.6e-08 1 1.605e-08 0 2.4e-08 0 2.405e-08 0 3.2e-08 0 3.205e-08 0 4e-08 0 4.005e-08 0 4.2e-08 0 4.21e-08 1 4.8e-08 1 4.805e-08 0 5.6e-08 0 5.605e-08 0 6.15e-08 0]
vwl_3 wl_3 gnd vsource type=pwl wave=[0 0 8e-09 0 8.05e-09 0 1.6e-08 0 1.605e-08 0 1.8e-08 0 1.81e-08 1 2.4e-08 1 2.405e-08 0 3.2e-08 0 3.205e-08 0 4e-08 0 4.005e-08 0 4.8e-08 0 4.805e-08 0 5e-08 0 5.01e-08 1 5.6e-08 1 5.605e-08 0 6.15e-08 0]
vwl_4 wl_4 gnd vsource type=pwl wave=[0 0 8e-09 0 8.05e-09 0 1.6e-08 0 1.605e-08 0 2.4e-08 0 2.405e-08 0 2.6e-08 0 2.61e-08 1 3.2e-08 1 3.205e-08 0 4e-08 0 4.005e-08 0 4.8e-08 0 4.805e-08 0 5.6e-08 0 5.605e-08 0 5.8e-08 0 5.81e-08 1 6.35e-08 1]

vsel_pulldown sel_pulldown gnd vsource type=pwl wave=[0 0 1e-10 0 2e-10 1 9e-10 1 9.5e-10 0 8e-09 0 8.05e-09 0 8.1e-09 0 8.2e-09 1 8.9e-09 1 8.95e-09 0 1.6e-08 0 1.605e-08 0 1.61e-08 0 1.62e-08 1 1.69e-08 1 1.695e-08 0 2.4e-08 0 2.405e-08 0 2.41e-08 0 2.42e-08 1 2.49e-08 1 2.495e-08 0 3.2e-08 0 3.205e-08 0 3.21e-08 0 3.22e-08 1 3.29e-08 1 3.295e-08 0 4e-08 0 4.005e-08 0 4.01e-08 0 4.02e-08 1 4.09e-08 1 4.095e-08 0 4.8e-08 0 4.805e-08 0 4.81e-08 0 4.82e-08 1 4.89e-08 1 4.895e-08 0 5.6e-08 0 5.605e-08 0 5.61e-08 0 5.62e-08 1 5.69e-08 1 5.695e-08 0 6.24e-08 0]
vsel_load sel_load gnd vsource type=pwl wave=[0 1 2e-09 1 2.05e-09 0 8e-09 0 8.1e-09 1 1e-08 1 1.005e-08 0 1.6e-08 0 1.61e-08 1 1.8e-08 1 1.805e-08 0 2.4e-08 0 2.41e-08 1 2.6e-08 1 2.605e-08 0 3.2e-08 0 3.21e-08 1 3.4e-08 1 3.405e-08 0 4e-08 0 4.01e-08 1 4.2e-08 1 4.205e-08 0 4.8e-08 0 4.81e-08 1 5e-08 1 5.005e-08 0 5.6e-08 0 5.61e-08 1 5.8e-08 1 5.805e-08 0 6.35e-08 0]
vsel_bias sel_bias gnd vsource type=pwl wave=[0 0 8e-09 0 8.05e-09 0 1.6e-08 0 1.605e-08 0 2.4e-08 0 2.405e-08 0 3.2e-08 0 3.205e-08 0 4e-08 0 4.005e-08 0 4.8e-08 0 4.805e-08 0 5.6e-08 0 5.605e-08 0 6.15e-08 0]
vsel_bulk sel_bulk gnd vsource type=pwl wave=[0 1 2e-09 1 2.05e-09 0 8e-09 0 8.1e-09 1 1e-08 1 1.005e-08 0 1.6e-08 0 1.61e-08 1 1.8e-08 1 1.805e-08 0 2.4e-08 0 2.41e-08 1 2.6e-08 1 2.605e-08 0 3.2e-08 0 3.21e-08 1 3.4e-08 1 3.405e-08 0 4e-08 0 4.01e-08 1 4.2e-08 1 4.205e-08 0 4.8e-08 0 4.81e-08 1 5e-08 1 5.005e-08 0 5.6e-08 0 5.61e-08 1 5.8e-08 1 5.805e-08 0 6.35e-08 0]
vsel_sl sel_sl gnd vsource type=pwl wave=[0 1 8e-09 1 8.1e-09 1 1.6e-08 1 1.61e-08 1 2.4e-08 1 2.41e-08 1 3.2e-08 1 3.21e-08 1 4e-08 1 4.01e-08 1 4.8e-08 1 4.81e-08 1 5.6e-08 1 5.61e-08 1 6.15e-08 1]

vgnd gnd 0 vsource type=dc dc=0
vvdd vdd 0 vsource type=pwl wave=[0 0 0.01n 1]


///////////////////////////////////////////////////////////////////////////
// MEMARRAY

subckt memarray ( bl wl_1 wl_2 wl_3 wl_4 sel_sl sel_pulldown gnd vdd)

// mem cell high high
rmemcell_hh (bl nodecell_hh) resistor r=Rmemcellhh
mcell_hh nodecell_hh wl_1 sl gnd tn
// mem cell high low
rmemcell_hl (bl nodecell_hl) resistor r=Rmemcellhl
mcell_hl nodecell_hl wl_2 sl gnd tn

// mem cell low high
rmemcell_lh (bl nodecell_lh) resistor r=Rmemcelllh
mcell_lh nodecell_lh wl_3 sl gnd tn
// mem cell low low
rmemcell_ll (bl nodecell_ll) resistor r=Rmemcellll
mcell_ll nodecell_ll wl_4 sl gnd tn

// bl
cbl (bl gnd) capacitor c=1.8e-14
mpulldown gnd sel_pulldown bl gnd tn 

// sl
msl gnd sel_sl sl gnd tn w=1e-07
csl (sl gnd) capacitor c=1.8e-14

ic bl=0

ends memarray

///////////////////////////////////////////////////////////////////////////
// LOADS


subckt load_switch ( bl sel_load gnd vdd)
mswitch vdd sel_load bl vdd tp w=1e-07
ends load_switch

subckt load_bias ( bl sel_load sel_bias gnd vdd)
mswitch vdd sel_load bl0 vdd tp w=1e-07
mbias bl0 sel_bias bl vdd tp w=1e-07
ends load_bias


subckt load_diode ( bl sel_load gnd vdd)
mswitch vdd sel_load bl0 vdd tp w=1e-07
mdiode bl0 bl bl vdd tp w=1e-07
ends load_diode

subckt load_bulk ( bl sel_load sel_bias gnd vdd)
mswitch vdd sel_load bl0 vdd tp w=1e-07
mbulk bl0 sel_bias bl bl tp w=1e-07
ends load_bulk