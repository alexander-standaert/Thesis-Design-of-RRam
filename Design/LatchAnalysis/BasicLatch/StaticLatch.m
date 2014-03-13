DeltaV = -0.035;
multP = 15;
multN =15;
multPen = 15;
multNen = 15;

sp.numruns = 150;

sp.Pmult=multP;
sp.Nmult=multN;
sp.Pmultenable=multPen;
sp.Nmultenable=multNen;

sp.inout =  0.3;
sp.inoutbar = sp.inout+DeltaV;

starttransition = 10e-9;

sp.lep = wavegen([0,starttransition;1,1],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
sp.len = wavegen([0,starttransition;0,0],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

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
figure(1)
subplot(1,2,1)
hold all
subplot(1,2,2)
hold all

tdelayvector=[];
correctvector=[];
Evector=[];
Pstatvector=[];

for i=1:sp.numruns
istr=num2str(i+1000);
istr=istr(end-2:end);
[temp, ~] = readPsfAscii(strcat('./LatchAnalysis/BasicLatch/test.raw/mymc-',istr,'_mytran.tran'), '.*');
sim=[sim;temp];
a=sim(i).getSignal('inout');
b=sim(i).getSignal('inoutbar');
t=a.getXValues;
v1=a.getYValues;
v2=b.getYValues;

c=sim(i).getSignal('Vvdd:p');
idd=c.getYValues;

Pstat=trapz(t(1:end),-idd(1:end))/(t(end)-t(1));

Pstatvector = [Pstatvector;Pstat];

figure(1)
subplot(1,2,1)
plot(t,(v1))
subplot(1,2,2)
plot(t,v2)
end
subplot(1,2,1)
hold off
subplot(1,2,2)
hold off
Pstat=mean(Pstatvector)
