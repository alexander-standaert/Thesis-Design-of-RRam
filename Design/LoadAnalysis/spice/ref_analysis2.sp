///////////////////////////////////////////////////////////////////////////
// SIMULATION SETTINGS

simulator lang=spice
.lib './technology_models/tech_wrapper.lib' tt

.OPTIONS METHOD=trap
.TEMP 30

simulator lang=spectre
  
parameters tp = mosp
parameters tn = mosn
parameters Vt_bias = 0
parameters Vt_switch = 0
VTswitchsweep dc param = Vt_switch values = [ 0 ]
VTbiassweep dc param = Vt_bias values = [ -0.08 -0.07 -0.06 -0.05 -0.04 -0.03 -0.02 -0.01 0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 ]

///////////////////////////////////////////////////////////////////////////
// TEST BENCH + SIGNALS
mref1 (bl_bias wl_1 sel_sl sel_pulldown sel_load sel_bias bl01 gnd vdd) ref
mref2 (bl_bias wl_1 sel_sl sel_pulldown sel_load sel_bias bl01 gnd vdd) ref
mref3 (bl_bias wl_1 sel_sl sel_pulldown sel_load sel_bias bl01 gnd vdd) ref
mref4 (bl_bias wl_1 sel_sl sel_pulldown sel_load sel_bias bl01 gnd vdd) ref


mmem (bl_mem wl_1 sel_sl sel_pulldown sel_load sel_bias bl02 gnd vdd2) mem

vwl_1 wl_1 gnd vsource type=dc dc=1

vsel_pulldown sel_pulldown gnd vsource type=dc dc=0
vsel_load sel_load gnd vsource type=dc dc=Vt_switch
vsel_bias sel_bias gnd vsource type=dc dc=Vt_bias
vsel_sl sel_sl gnd vsource type=dc dc=1

vgnd gnd 0 vsource type=dc dc=0
vvdd vdd 0 vsource type=dc dc=1
vvdd2 vdd2 0 vsource type=dc dc=1


subckt ref (bl wl_1 sel_sl sel_pulldown sel_load sel_bias bl01 gnd vdd)
    mmemarray_bias1 ( bl wl_1 sel_sl sel_pulldown gnd vdd) memarray1
    mmemarray_bias2 ( bl wl_1 sel_sl sel_pulldown gnd vdd) memarray2
    mload_bias1 ( bl sel_load sel_bias bl01 gnd vdd) load_bias
    mload_bias2 ( bl sel_load sel_bias bl01 gnd vdd) load_bias
ends ref

subckt mem (bl wl_1 sel_sl sel_pulldown sel_load sel_bias bl01 gnd vdd)
    mmemarray_bias1 ( bl wl_1 sel_sl sel_pulldown gnd vdd) memarray2
    mload_bias1 ( bl sel_load sel_bias bl01 gnd vdd) load_bias
ends ref

///////////////////////////////////////////////////////////////////////////
// MEMARRAY

subckt memarray1 ( bl wl_1 sel_sl sel_pulldown gnd vdd)
    rmemcell_h (bl nodecell_hh) resistor r=37500
    mcell_hh nodecell_hh wl_1 sl gnd tn
    // bl
    cbl (bl gnd) capacitor c=1.8e-14
    mpulldown gnd sel_pulldown bl gnd tn 
    // sl
    msl gnd sel_sl sl gnd tn w=1e-06
    csl (sl gnd) capacitor c=1.8e-14
ends memarray1

subckt memarray2 ( bl wl_1 sel_sl sel_pulldown gnd vdd)
    rmemcell_l (bl nodecell_hh) resistor r=7500
    mcell_hh nodecell_hh wl_1 sl gnd tn
    // bl
    cbl (bl gnd) capacitor c=1.8e-14
    mpulldown gnd sel_pulldown bl gnd tn 
    // sl
    msl gnd sel_sl sl gnd tn w=1e-06
    csl (sl gnd) capacitor c=1.8e-14
ends memarray2



///////////////////////////////////////////////////////////////////////////
// LOADS


subckt load_bias ( bl1 sel_load sel_bias  bl01 gnd vdd)

mswitch1 vdd sel_load bl01 vdd tp w=1e-07
mbias1 bl01 sel_bias bl1 vdd tp w=1.8e-07

ends load_bias
