
simulator lang=spice

.include ../technology_models/tech_wrapper.lib mc
.include ../memristor_model/spice/memristor.cir

simulator lang=spectre



subckt memcell ( wl bl sl gnd )

m1 bl sl node1 gnd nmos
xmemristor (wl node1) memristor 

ends memcell

