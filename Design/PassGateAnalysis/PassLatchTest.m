system('spectre -64 +aps ./PassGateAnalysis/SPICE/PassLatchTest.sp');
sim = readPsfAscii(strcat('./PassGateAnalysis/SPICE/PassLatchTest.raw/mymc-001_mytran.tran'), '.*');
figure;
a=gca;
sim.getSignal('outbar').plotSignal
hold all
sim.getSignal('out').plotSignal
ylim([0,1])
xlabel('Time [s]','FontWeight','bold','FontSize',14);
ylabel('Voltage [V]','FontWeight','bold','FontSize',14);
sim.getSignal('in2').plotSignal
sim.getSignal('inbar2').plotSignal