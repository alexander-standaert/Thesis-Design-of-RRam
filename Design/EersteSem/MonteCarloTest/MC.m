system('spectre ./MonteCarloTest/example.scs');
figure(1)
hold all
sim=[];

for i=1:500
istr=num2str(i+1000);
istr=istr(end-2:end);
[temp, ~] = readPsfAscii(strcat('./MonteCarloTest/example.raw/mymc-',istr,'_mytran.tran'), '.*');
sim=[sim;temp];
a=sim(i).getSignal('out');
t=a.getXValues;
v=a.getYValues;
[tdel,correct]=calcYieldSpeed(v,t,0);
plotSignal(a)
end

hold off