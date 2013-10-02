
source ~micasusr/design/scripts/eldo.rc 

# can either force output to CSDF from command line
eldo -gwl CSDF RC.sp
cd generatedNetlist
eldo -gwl CSDF RClong.sp
cd ..

# or simply from netlist with .OPTION CSDF

