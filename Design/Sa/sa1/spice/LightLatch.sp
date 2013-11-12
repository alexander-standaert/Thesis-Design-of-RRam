simulator lang=spectre

subckt latch (out outbar vdd vss bp bn LE1 LE2)

xM3 out outbar n1 bp MOSP w=8e-07  
xM4 outbar out n1 bp MOSP w=8e-07  
xM5 out outbar n2 bn MOSN w=4e-07  
xM6 outbar out n2 bn MOSN w=4e-07  

xM7 n1 LE1 vdd bp MOSP  
xM8 n2 LE2 vss bn MOSN  


ic out=0.4
ic outbar=0.81


ends latch

subckt invertor (in out vdd vss)

xM1 out in vss vss MOSN
xM2 out in vdd vdd MOSP

ends invertor