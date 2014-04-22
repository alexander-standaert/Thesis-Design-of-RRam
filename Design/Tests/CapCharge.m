
system('spectre -64 +aps ./Tests/SPICE/CapCharge.sp');
sim = readPsfAscii(strcat('./Tests/SPICE/CapCharge.raw/mymc-001_mytran.tran'), '.*');

t=sim.getSignal('v1').getXValues;
c1=sim.getSignal('c1').getYValues;
r1=sim.getSignal('r1').getYValues;

plot(t,r1)

