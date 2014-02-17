sp.numruns = 100;

sp.Pmult=5;
sp.Nmult=3;

sp.Rload1 = 100;
sp.Rload2 = sp.Rload1;
sp.Rload3 = sp.Rload1;
sp.Cload1 = 18*10^-15;
sp.Cload2 = 18*10^-15;
sp.Cload3 = 18*10^-15;
sp.Rmemcell = 5000;
sp.Rmemhigh = 35000;
sp.Rmemlow = 10000;	
sp.init_bl_1 = 0.1;
sp.init_bl_ref = 0.1;

sp.sel1_1 = wavegen([0,2.5e-9;1,0],0.1e-9,0.05e-9,0,1,6e-9); %pmos gate
sp.sel1_2 = sp.sel1_1;
sp.sel1_3 = sp.sel1_1;
sp.sel2_1 = wavegen([0,0.5e-9,1.5e-9;0,1,0],0.1e-9,0.05e-9,0,1,6e-9); %nmos gate
sp.sel2_2 = sp.sel2_1;
sp.sel2_3 = sp.sel2_1;
sp.wl_1 = wavegen([0,2.5e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); %nmos gate
sp.wl_2 = sp.wl_1;
sp.wl_3 = sp.wl_1;

sp.lep = wavegen([0,8e-9;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
sp.len = wavegen([0,8e-9;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

sp.switch1 = wavegen([0,5e-9,7e-9;0,1,0],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate
sp.switch2 = sp.switch1;


inputfile = 'parameters.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre ./MonteCarloTest/test.scs');

td=[];

figure(1)
hold all
% figure(2)
% hold all
sim=[];

for i=1:sp.numruns
istr=num2str(i+1000);
istr=istr(end-2:end);
[temp, ~] = readPsfAscii(strcat('./MonteCarloTest/test.raw/mymc-',istr,'_mytran.tran'), '.*');
sim=[sim;temp];
a=sim(i).getSignal('bl_1');
b=sim(i).getSignal('bl_ref');
c=sim(i).getSignal('inout');
t=a.getXValues;
v1=a.getYValues;
v2=b.getYValues;
v3=c.getYValues;

figure(1)
% plot(t,(v1))
% figure(2)
plot(t,v3)
end

hold off