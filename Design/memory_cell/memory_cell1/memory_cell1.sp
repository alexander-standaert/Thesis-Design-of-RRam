
simulator lang=spice

.lib '../../technology_models/tech_wrapper.lib' tt
.include '../../memristor_model/spice/memristor.cir'

simulator lang=spectre



subckt memcell ( wl bl sl gnd )

m1 sl wl node1 gnd nmos
xmemristor (bl node1) memristor 

ends memcell

