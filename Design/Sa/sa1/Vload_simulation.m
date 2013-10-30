close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice latch

inputfile = 'latch.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% transistor sizes										
pmult = 10*50*10^(-9);
nmult = 3*50*10^(-9);	

mismatch_latch = repmat({''},8,2);

mat2spice(mat2spicepath,spicepath,pmult,nmult,mismatch_latch)
clear inputfile currentpath mat2spicepath spicepath

i=0;
cmap = redgreencmap;

m_step = 0.15;
m_stop = 1.5;
m=[0.7:m_step:m_stop];

for m=m

i = i+1;

for k=1:2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice testbench

inputfile = 'sa1_testbench.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters
steptime = 10^-12;
stoptime = 10*10^-9;

sel1_1 = wavegen([0,4e-9;1,0],0.1e-9,0.05e-9,0,1,6e-9); %pmos gate
sel1_2 = sel1_1;
sel1_3 = sel1_1;

sel2_1 = wavegen([0,0.5e-9,2e-9;0,1,0],0.1e-9,0.05e-9,0,1,6e-9); %nmos gate
sel2_2 = sel2_1;
sel2_3 = sel2_1;

wl_1 = wavegen([0,4e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); %nmos gate
wl_2 = wavegen([0,4.0e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); %nmos gate
wl_3 = wavegen([0,4.0e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); %nmos gate

sl_1 = '[0 0]'; 
sl_2 = sl_1; 
sl_3 = sl_1; 

vload_1 = m; 
vload_2 = m;
vload_3 = m;

vpreload = 0;

LE1 = wavegen([0,7.2e-9;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
LE2 = wavegen([0,7.2e-9;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

selL1 = wavegen([0,6.5e-9,6.7e-9;0,0,0],0.1e-9,0.05e-9,0,1,5e-9);
selL2 = selL1;					


transistor_type = 'mc';

mat2spice(mat2spicepath,spicepath,sel1_1,sel1_2,sel1_3,sel2_1,sel2_2,sel2_3,wl_1,wl_2,wl_3,sl_1,sl_2,sl_3,vload_1,vload_2,vload_3,LE1,LE2,selL1,selL2,steptime,stoptime,transistor_type,vpreload)
clear inputfile currentpath mat2spicepath spicepath




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice memory array

inputfile = 'memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
Wpswitch = 50e-9;

Rload1 = 0;
Rload2 = Rload1;
Rload3 = Rload1;
Cload1 = 18*10^-15;
Cload2 = 18*10^-15;
Cload3 = 18*10^-15;
if k == 1
Rmemcell = 5000;
else
Rmemcell = 30000;   
end
Rmemhigh = 35000;
Rmemlow = 5000;	

%init conditions
init_bl_1 = 0.2;
init_bl_2 = 0.1;
init_bl_3 = 0.2;

mat2spice(mat2spicepath,spicepath,Rload1,Rload2,Rload3,Cload1,Cload2,Cload3,Rmemcell,Rmemhigh,Rmemlow,init_bl_1,init_bl_2,init_bl_3,Wpswitch)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run spice

system('spectre -format psfascii ./Sa/sa1/spice/sa1_testbench.sp')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot results

[sim tree] = readPsfAscii('./Sa/sa1/spice/sa1_testbench.raw/ana.tran', '.*')

bl_1 = sim.getSignal('bl_1');
bl_1x = bl_1.getXValues*10^9;
bl_1y = bl_1.getYValues;

bl_2 = sim.getSignal('bl_2');
bl_2x = bl_2.getXValues*10^9;
bl_2y = bl_2.getYValues;

Ibl_1 = sim.getSignal('vsel1_1:p');
Ibl_x = Ibl_1.getXValues*10^9;
Ibl_y = Ibl_1.getYValues;

Vdiff = bl_1y-bl_2y;

st = 5.5;
tmp = abs(bl_1x-st);
[x sti] = min(tmp);

if k == 1
    figure(1)
    hold on
    subplot(2,2,1)
    plot(bl_1x,bl_1y,'color',cmap(8*i,:));
    xlabel('time [ns]')
    ylabel('bitline voltage [V]')
    title('Low resistance cell')
    hold on
    subplot(2,2,3)
    plot(bl_1x,Vdiff*10^3,'color',cmap(8*i,:));
    xlabel('time [ns]')
    ylabel('diff bitline voltage [mV]')
else
    figure(1)
    hold on
    subplot(2,2,2)
    plot(bl_1x,bl_1y,'color',cmap(8*i,:));
    xlabel('time [ns]')
    ylabel('bitline voltage [V]')
    title('High resistance cell')
    hold on
    subplot(2,2,4)
    plot(bl_1x,Vdiff*10^3,'color',cmap(8*i,:));   
    xlabel('time [ns]')
    ylabel('diff bitline voltage [mV]')    
end



end

end

figure(1)
suptitle('Effect of Vload')
