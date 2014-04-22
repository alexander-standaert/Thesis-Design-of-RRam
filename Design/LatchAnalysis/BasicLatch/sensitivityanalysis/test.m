system('spectre -64 +aps ./LatchAnalysis/BasicLatch/sensitivityanalysis/SPICE/sensitivity.sp');
sim = readPsfAscii(strcat('./LatchAnalysis/BasicLatch/sensitivityanalysis/SPICE/sensitivity.raw/mymc-001_mytran.tran'), '.*');
figure
sim.getSignal('outbar').plotSignal
hold all
sim.getSignal('out').plotSignal
sim.getSignal('n1').plotSignal
sim.getSignal('n2').plotSignal