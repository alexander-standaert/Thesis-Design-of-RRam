example file showing basic usage of mat2spice

//  this is spectre comment, it is copied verbatim to the generated file







this is N: 25.  Isn't that cute?

==>N=35.2
.
next line

test



shorthand notation: "75 "



//  you can do all things you can do in matlab, e.g. looping:
this is index 10,1 
Xcell_10_1 ( bl_10 wl_1 vdd vss ) SOLAR_CELL
this is index 10,2 
Xcell_10_2 ( bl_10 wl_2 vdd vss ) SOLAR_CELL
this is index 10,3 
Xcell_10_3 ( bl_10 wl_3 vdd vss ) SOLAR_CELL
this is index 20,1 
Xcell_20_1 ( bl_20 wl_1 vdd vss ) SOLAR_CELL
this is index 20,2 
Xcell_20_2 ( bl_20 wl_2 vdd vss ) SOLAR_CELL
this is index 20,3 
Xcell_20_3 ( bl_20 wl_3 vdd vss ) SOLAR_CELL


//  you can call any matlab function:
this is the result of calling myFunction(5): digit=5


//  some popular functions:
//  -- the bus function:
//  NOTE: if you use a bus function to write a signal at one place in a
//        subcircuit, use it all places in the subcircuit!
//        don't combine a_0 a_1 a_2 a_3 a_4 a_5 a_6 a_7 with a20 or a_20 !!
this is a bus: a_0 a_1 a_10


//  special bus function notation:
a_5 a_6 a_7 a_8 a_9 a_10
atest_2 atest_3
