simulator lang=spice

.lib '../../tech_wrapper.lib' tt

simulator lang=spectre

//parameters Vgs = 1
parameters Vds = 0 
//parameters wpmos = 50e-9

xM1 d g s b mosp l=4.5e-08 w=1.8e-07

Vbulk   ( b 0 ) vsource type=dc dc=1
Vsource ( s 0 ) vsource type=dc dc=0.8
Vgate   ( g 0 ) vsource type=dc dc=0.05
Vdrain  ( d 0 ) vsource type=dc dc=0.8-Vds


//// sweep Vds for the given values of w
//swp sweep param=wpmos values=[ 100 ] {
mysweep dc param=Vds values=[ 0 0.1 0.2 0.3 0.4 0.5 ]
//printCapacitanceTable info what=captab where=file file="capNodes"
//}

