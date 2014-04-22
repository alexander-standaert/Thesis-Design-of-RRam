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

%in wordt ontladen -> IR
%inbar wordt opgeladen

% R=20000;
% t=sim.getSignal('out').getXValues;
% out=sim.getSignal('out').getYValues;
% outbar=sim.getSignal('outbar').getYValues;
% in2=sim.getSignal('in2').getYValues;
% inbar2=sim.getSignal('inbar2').getYValues;
% Ivdd=sim.getSignal('Vvdd:p').getYValues; %negatief
% Ivss=sim.getSignal('Vvss:p').getYValues; %positief
% IR=(out-in2)/R; %negatief
% IRbar=(outbar-inbar2)/R; %positief
% 
% IC=Ivss+IR;
% ICbar=Ivdd+IRbar;
% 
% figure
% plot(t,IC)
% hold all
% plot(t,ICbar)