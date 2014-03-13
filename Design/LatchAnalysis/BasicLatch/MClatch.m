function [yield,tdelay,E,Pstat] = MClatch( DeltaV,multP,multN,multPen,multNen )
% tic
sp.numruns = 500;

sp.Pmult=multP;
sp.Nmult=multN;
sp.Pmultenable=multPen;
sp.Nmultenable=multNen;

sp.inout = 0.3-DeltaV;
sp.inoutbar = 0.3;

starttransition = 0.5e-9;

sp.lep = wavegen([0,starttransition;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
sp.len = wavegen([0,starttransition;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

inputfile = 'parameters.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre ./LatchAnalysis/BasicLatch/test.scs');

correct=zeros(sp.numruns,1);
td=[];
sim=[];

% figure(1)
% subplot(1,2,1)
% xlabel('time [ns]')
% ylabel('voltage [V]')
% hold all
% subplot(1,2,2)
% xlabel('time [ns]')
% ylabel('voltage [V]')
% hold all

tdelayvector=[];
correctvector=[];
Evector=[];
Pstatvector=[];

for i=1:sp.numruns
istr=num2str(i+1000);
istr=istr(end-2:end);
[temp] = readPsfAscii(strcat('./LatchAnalysis/BasicLatch/test.raw/mymc-',istr,'_mytran.tran'), '.*');
sim=[sim;temp];
a=sim(i).getSignal('inout');
b=sim(i).getSignal('inoutbar');
t=a.getXValues;
v1=a.getYValues;
v2=b.getYValues;

c=sim(i).getSignal('Vvdd:p');
idd=c.getYValues;

starttransindex = min(find(t>starttransition));

[tdel1,correct,tdelindex1]=calcYieldSpeed(v1,t,0);
[tdel2,correct2,tdelindex2]=calcYieldSpeed(v2,t,1);
E=trapz(t(starttransindex:max(tdelindex1,tdelindex2)),-idd(starttransindex:max(tdelindex1,tdelindex2)));
Pstat=trapz(t(max(tdelindex1,tdelindex2):end),-idd(max(tdelindex1,tdelindex2):end))/(t(end)-t(max(tdelindex1,tdelindex2)));

tdelayvector=[tdelayvector; max(tdel1,tdel2)];
correctvector=[correctvector;correct];
Evector = [Evector;E];
Pstatvector = [Pstatvector;Pstat];

% figure(1)
% subplot(1,2,1)
% plot(t*1e9,(v1))
% subplot(1,2,2)
% plot(t*1e9,v2)
end
% subplot(1,2,1)
% hold off
% subplot(1,2,2)
% hold off

yield=mean(correctvector)
tdelay=mean(tdelayvector)
E=mean(Evector)
Pstat=mean(Pstatvector)
% toc
end