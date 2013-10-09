
simulator lang=spice

.include ./memory_cell1.sp

simulator lang=spectre

xmemcell ( wl gnd sl gnd ) memcell

vwl wl gnd vsource type=pwl wave=[0 0 1n 0 2n 1 10n 1 11n 0 12n 0]
vsl sl gnd vsource type=pwl wave=[0 0 1n 1 2n 1 10n 1 11n 1 12n 1]

