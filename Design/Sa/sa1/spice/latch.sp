simulator lang=spice

.lib '../../technology_models/tech_wrapper.lib' mc

simulator lang=spectre

subckt latch (in inbar out outbar vdd vss bp bn LE1 LE2 sel1 sel2)

M1 in sel1 out bn mosn
M2 inbar sel2 outbar bn mosn

M3 out outbar n1 bp mosp w='1 *50e-9'
M3 outbar out n1 bp mosp w='1 *50e-9'
M4 out outbar n2 bn mosn w='1 *50e-9'
M5 outbar out n2 bn mosn w='1 *50e-9'

M6 n1 LE1 vdd bp mosp
M7 n2 LE2 vss bn mosn

ends latch