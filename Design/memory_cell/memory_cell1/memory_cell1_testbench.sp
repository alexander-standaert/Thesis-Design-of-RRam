
simulator lang=spice

.include ./memory_cell1.sp

simulator lang=spectre

xmemcell ( wl bl sl gnd ) memcell

vbl bl gnd vsource type=pwl 
+ wave=[
+ 0 0 
+ 10n 0 
+ 11n -0.2 
+ 70n -0.2 
+ 71n 0 
+ 80n 0 
+ 81n 0 
+ 100n 0 
+ 101n 0
+ 110n 0 
+ 111n 1 
+ 170n 1 
+ 171n 0 
+ 180n 0 
+ 181n 0 
+ 200n 0 
+ 201n 0
+ 210n 0 
+ 211n -0.2 
+ 270n -0.2 
+ 271n 0 
+ 280n 0 
+ 281n 0 
+ 300n 0 
+ 301n 0
+ 310n 0 
+ 311n 1 
+ 370n 1 
+ 371n 0 
+ 380n 0 
+ 381n 0 
+ 400n 0 
+ 401n 0
+]

vsl sl gnd vsource type=pwl 
+ wave=[
+ 0 0 
+ 10n 0 
+ 11n 1
+ 70n 1
+ 71n 0 
+ 80n 0 
+ 81n 1 
+ 100n 1 
+ 101n 0
+ 110n 0 
+ 111n 0 
+ 170n 0 
+ 171n 0 
+ 180n 0 
+ 181n 1 
+ 200n 1 
+ 201n 0
+ 210n 0 
+ 211n 1 
+ 270n 1 
+ 271n 0 
+ 280n 0 
+ 281n 1 
+ 300n 1 
+ 301n 0
+ 310n 0 
+ 311n 0 
+ 370n 0 
+ 371n 0 
+ 380n 0 
+ 381n 1 
+ 400n 1 
+ 401n 0
+]

vwl wl gnd vsource type=pwl wave=[0 0 1n 1]

vgnd gnd 0 vsource type=dc dc=0

ana tran step=1n stop=410n
