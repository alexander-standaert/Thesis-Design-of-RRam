mismatch_on = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice latch

inputfile = 'latch.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% transistor sizes										
pmult = 10*50*10^(-9);
nmult = 3*50*10^(-9);	

if mismatch_on == 1
   At = 10*10^-3*10^-6; %10mV/um
   
   mismatch_latch = repmat({''},8,2);
   %mismatch vt
   mismatch_latch(1,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M1
   mismatch_latch(2,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M2
   mismatch_latch(3,1)={['m_vt=',randnormal(0,sqrt(At^2/(pmult*45e-9)))]}; % M3
   mismatch_latch(4,1)={'m_vt=0'}; % M4
   mismatch_latch(5,1)={['m_vt=',randnormal(0,sqrt(At^2/(nmult*45e-9)))]}; % M5
   mismatch_latch(6,1)={'m_vt=0'}; % M6
   mismatch_latch(7,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M7
   mismatch_latch(8,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M8
   
   %mismatch B
   mismatch_latch(1,2)={'m_B=0'}; % M1
   mismatch_latch(2,2)={'m_B=0'}; % M2
   mismatch_latch(3,2)={'m_B=0'}; % M3
   mismatch_latch(4,2)={'m_B=0'}; % M4
   mismatch_latch(5,2)={'m_B=0'}; % M5
   mismatch_latch(6,2)={'m_B=0'}; % M6
   mismatch_latch(7,2)={'m_B=0'}; % M7
   mismatch_latch(8,2)={'m_B=0'}; % M8
else
   mismatch_latch = repmat({''},8,2);
end

mat2spice(mat2spicepath,spicepath,pmult,nmult,mismatch_latch)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice memory array

inputfile = 'memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
Rload1 = 100;
Rload2 = Rload1;
Rload3 = Rload1;
Cload1 = 18*10^-15;
Cload2 = 18*10^-15;
Cload3 = 18*10^-15;
Rmemcell = 10000;
Rmemhigh = 35000;
Rmemlow = 5000;	

%init conditions
init_bl_1 = 0.2;
init_bl_2 = 0.1;
init_bl_3 = 0.2;

mat2spice(mat2spicepath,spicepath,Rload1,Rload2,Rload3,Cload1,Cload2,Cload3,Rmemcell,Rmemhigh,Rmemlow,init_bl_1,init_bl_2,init_bl_3)
clear inputfile currentpath mat2spicepath spicepath

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

wl_1 = wavegen([0,3e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); %nmos gate
wl_2 = wl_1;
wl_3 = wl_1;

sl_1 = '[0 0]'; 
sl_2 = sl_1; 
sl_3 = sl_1; 

vload_1 = 1; 
vload_2 = 1;
vload_3 = 1;

LE1 = wavegen([0,7.2e-9;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
LE2 = wavegen([0,7.2e-9;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

selL1 = wavegen([0,6.5e-9,6.7e-9;0,0,0],0.1e-9,0.05e-9,0,1,5e-9);
selL2 = selL1;					

if mismatch_on == 1
   transistor_type = 'mm';
else
   transistor_type = 'mc';
end

mat2spice(mat2spicepath,spicepath,sel1_1,sel1_2,sel1_3,sel2_1,sel2_2,sel2_3,wl_1,wl_2,wl_3,sl_1,sl_2,sl_3,vload_1,vload_2,vload_3,LE1,LE2,selL1,selL2,steptime,stoptime,transistor_type)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run spice

close all
system('spectre -format psfascii ./Sa/sa1/spice/sa1_testbench.sp')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot results

[sim tree] = readPsfAscii('./Sa/sa1/spice/sa1_testbench.raw/ana.tran', '.*')

%plot control signals
sel1_1 = sim.getSignal('sel1_1');
sel1_1x = sel1_1.getXValues*10^9;
sel1_1y = sel1_1.getYValues;

sel2_1 = sim.getSignal('sel2_1');
sel2_1x = sel2_1.getXValues*10^9;
sel2_1y = sel2_1.getYValues;

wl_1 = sim.getSignal('wl_1');
wl_1x = wl_1.getXValues*10^9;
wl_1y = wl_1.getYValues;

LE1 = sim.getSignal('LE1');
LE1x = LE1.getXValues*10^9;
LE1y = LE1.getYValues;

selL1 = sim.getSignal('selL1');
selL1x = selL1.getXValues*10^9;
selL1y = selL1.getYValues;



figure
hold on
plot(sel1_1x,(sel1_1y)*-1+2.1,sel2_1x,sel2_1y+2.2,wl_1x,wl_1y+3.3,LE1x,LE1y+4.4,selL1x,selL1y+5.5)
hleg1 = legend('selectline1*-1','selectline2','wordline','latch enable','select latch','Location','SouthEastOutside');
xlabel('time [ps]')
ylabel('voltage [V]')
hold off

%plot bitline

bl_1 = sim.getSignal('bl_1');
bl_1x = bl_1.getXValues*10^9;
bl_1y = bl_1.getYValues;

bl_2 = sim.getSignal('bl_2');
bl_2x = bl_2.getXValues*10^9;
bl_2y = bl_2.getYValues;

figure
hold on
plot(bl_1x,bl_1y,bl_2x,bl_2y)
hleg1 = legend('bitline1','bitline2','Location','SouthEastOutside');
xlabel('time [ps]')
ylabel('voltage [V]')
hold off

%plot output

out = sim.getSignal('out');
outx = out.getXValues*10^9;
outy = out.getYValues;
 
outb = sim.getSignal('outbar');
outbx = outb.getXValues*10^9;
outby = outb.getYValues;
 
figure
hold on
plot(outx,outy,outbx,outby)
hleg1 = legend('out','outbar','Location','SouthEastOutside');
xlabel('time [ps]')
ylabel('voltage [V]')
hold off

 
