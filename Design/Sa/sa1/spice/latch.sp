simulator lang=spectre

subckt latch (in inbar out outbar vdd vss bp bn LE1 LE2 sel1 sel2)

xM1 in sel1 out bn MOSN  
xM2 inbar sel2 outbar bn MOSN  

xM3 out outbar n1 bp MOSP w=5e-07  
xM4 outbar out n1 bp MOSP w=5e-07  
xM5 out outbar n2 bn MOSN w=1.5e-07  
xM6 outbar out n2 bn MOSN w=1.5e-07  
xM7 n1 LE1 vdd bp MOSP  
xM8 n2 LE2 vss bn MOSN  

ends latch