simulator lang=spectre

subckt buffer_WL_eight (vdd vss NBulkLine PBulkLine node_0 node_2)
xNot_8_1 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=1
xNot_8_2 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=4
ends buffer_WL_eight 


subckt buffer_WL_sixteen (vdd vss NBulkLine PBulkLine node_0 node_2)
xNot_16_1 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=1
xNot_16_2 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=4
ends buffer_WL_sixteen 


subckt buffer_WL_thirtytwo (vdd vss NBulkLine PBulkLine node_0 node_2)
xNot_32_2 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=4
xNot_32_3 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=16
ends buffer_WL_thirtytwo 


subckt buffer_WL_sixtyfour (vdd vss NBulkLine PBulkLine node_0 node_2)
xNot_64_2 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=4
xNot_64_3 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=16
ends buffer_WL_sixtyfour 


subckt buffer_WL_onehundredtwentyeight (vdd vss NBulkLine PBulkLine node_0 node_4)
xNot_128_1 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=1
xNot_128_2 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=4
xNot_128_3 (node_2 node_3 vdd vss PBulkLine NBulkLine) inverter mult=16
xNot_128_4 (node_3 node_4 vdd vss PBulkLine NBulkLine) inverter mult=64
ends buffer_WL_onehundredtwentyeight 


subckt buffer_WL_twohundredfiftysix (vdd vss NBulkLine PBulkLine node_0 node_4)
xNot_256_1 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=1
xNot_256_2 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=4
xNot_256_3 (node_2 node_3 vdd vss PBulkLine NBulkLine) inverter mult=16
xNot_256_4 (node_3 node_4 vdd vss PBulkLine NBulkLine) inverter mult=64
ends buffer_WL_twohundredfiftysix 


subckt buffer_WL_fivehundredandtwelve (vdd vss NBulkLine PBulkLine node_0 node_4)
xNot_512_2 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=4
xNot_512_3 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=16
xNot_512_4 (node_2 node_3 vdd vss PBulkLine NBulkLine) inverter mult=64
xNot_512_5 (node_3 node_4 vdd vss PBulkLine NBulkLine) inverter mult=256
ends buffer_WL_fivehundredandtwelve 


subckt buffer_WL_onethousandtwentyfour (vdd vss NBulkLine PBulkLine node_0 node_4)
xNot_1024_2 (node_0 node_1 vdd vss PBulkLine NBulkLine) inverter mult=4
xNot_1024_3 (node_1 node_2 vdd vss PBulkLine NBulkLine) inverter mult=16
xNot_1024_4 (node_2 node_3 vdd vss PBulkLine NBulkLine) inverter mult=64
xNot_1024_5 (node_3 node_4 vdd vss PBulkLine NBulkLine) inverter mult=256
ends buffer_WL_onethousandtwentyfour 



