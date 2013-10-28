mismatch_on = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice latch

inputfile = 'latch.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% transistor sizes										
sp.pmult = 10*50*10^(-9);
sp.nmult = 3*50*10^(-9);	

if mismatch_on == 1
   At = 10*10^-3*10^-6; %10mV/um
   
   sp.mismatch_latch = repmat({''},8,2);
   %mismatch vt
   sp.mismatch_latch(1,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M1
   sp.mismatch_latch(2,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M2
   sp.mismatch_latch(3,1)={['m_vt=',randnormal(0,sqrt(At^2/(pmult*45e-9)))]}; % M3
   sp.mismatch_latch(4,1)={'m_vt=0'}; % M4
   sp.mismatch_latch(5,1)={['m_vt=',randnormal(0,sqrt(At^2/(nmult*45e-9)))]}; % M5
   sp.mismatch_latch(6,1)={'m_vt=0'}; % M6
   sp.mismatch_latch(7,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M7
   sp.mismatch_latch(8,1)={['m_vt=',randnormal(0,sqrt(At^2/(50e-9*45e-9)))]}; % M8
   
   %mismatch B
   sp.mismatch_latch(1,2)={'m_B=0'}; % M1
   sp.mismatch_latch(2,2)={'m_B=0'}; % M2
   sp.mismatch_latch(3,2)={'m_B=0'}; % M3
   sp.mismatch_latch(4,2)={'m_B=0'}; % M4
   sp.mismatch_latch(5,2)={'m_B=0'}; % M5
   sp.mismatch_latch(6,2)={'m_B=0'}; % M6
   sp.mismatch_latch(7,2)={'m_B=0'}; % M7
   sp.mismatch_latch(8,2)={'m_B=0'}; % M8
else
   sp.mismatch_latch = repmat({''},8,2);
end

mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice memory array

inputfile = 'memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
sp.Rload1 = 100;
sp.Rload2 = sp.Rload1;
sp.Rload3 = sp.Rload1;
sp.Cload1 = 18*10^-15;
sp.Cload2 = 18*10^-15;
sp.Cload3 = 18*10^-15;
sp.Rmemcell = 10000;
sp.Rmemhigh = 35000;
sp.Rmemlow = 5000;	

%init conditions
sp.init_bl_1 = 0.2;
sp.init_bl_2 = 0.1;
sp.init_bl_3 = 0.2;

mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice testbench

inputfile = 'sa1_testbench.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters
sp.steptime = 10^-12;
sp.stoptime = 10*10^-9;

sp.sel1_1 = wavegen([0,4e-9;1,0],0.1e-9,0.05e-9,0,1,6e-9); %pmos gate
sp.sel1_2 = sp.sel1_1;
sp.sel1_3 = sp.sel1_1;

sp.sel2_1 = wavegen([0,0.5e-9,2e-9;0,1,0],0.1e-9,0.05e-9,0,1,6e-9); %nmos gate
sp.sel2_2 = sp.sel2_1;
sp.sel2_3 = sp.sel2_1;

sp.wl_1 = wavegen([0,3e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); %nmos gate
sp.wl_2 = sp.wl_1;
sp.wl_3 = sp.wl_1;

sp.sl_1 = '[0 0]'; 
sp.sl_2 = sp.sl_1; 
sp.sl_3 = sp.sl_1; 

sp.vload_1 = 1; 
sp.vload_2 = 1;
sp.vload_3 = 1;

sp.LE1 = wavegen([0,7.2e-9;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
sp.LE2 = wavegen([0,7.2e-9;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate

sp.selL1 = wavegen([0,6.5e-9,6.7e-9;0,0,0],0.1e-9,0.05e-9,0,1,5e-9);
sp.selL2 = sp.selL1;					

if mismatch_on == 1
   sp.transistor_type = 'mm';
else
   sp.transistor_type = 'mc';
end

mat2spice(mat2spicepath,spicepath,sp)
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

 
