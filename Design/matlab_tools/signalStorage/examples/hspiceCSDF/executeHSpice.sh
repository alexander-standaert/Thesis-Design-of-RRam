source ~micasusr/design/scripts/hspice.rc

hspice RC.sp
cd generatedNetlist
hspice RClong.sp
cd ..
