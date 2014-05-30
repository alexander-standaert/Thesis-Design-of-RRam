system('spectre -64 +aps ./LatchAnalysis/BasicLatch/sensitivityanalysis/SPICE/sensitivity.sp');
sim = readPsfAscii(strcat('./LatchAnalysis/BasicLatch/sensitivityanalysis/SPICE/sensitivity.raw/mymc-001_mytran.tran'), '.*');
figure
a=sim.getSignal('outbar');
b=sim.getSignal('out');
t=a.getXValues;
Vbar=a.getYValues;
V=b.getYValues;
plot(t*1e9,V);
hold all
plot(t*1e9,Vbar);
xlabel('Time [ns]','FontWeight','bold','FontSize',14);
ylabel('Voltages [V]','FontWeight','bold','FontSize',14);