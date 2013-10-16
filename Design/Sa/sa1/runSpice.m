%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice latch

inputfile = 'latch.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% transistor sizes										
pmult = 10*50*10^(-9);
nmult = 3*50*10^(-9);									

mat2spice(mat2spicepath,spicepath,pmult,nmult)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice memory array

inputfile = 'memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
Rload1 = 100;
Rload2 = 100;
Rload3 = 100;
Cload1 = 18*10^-15;
Cload2 = 18*10^-15;
Cload3 = 18*10^-15;
Rmemcell = 10000;
Rmemhigh = 35000;
Rmemlow = 5000;								

mat2spice(mat2spicepath,spicepath,Rload1,Rload2,Rload3,Cload1,Cload2,Cload3,Rmemcell,Rmemhigh,Rmemlow)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice testbench

inputfile = 'sa1_testbench.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
sel1_1 = wavegen([0,4e-9;0,1],0.1e-9,0.05e-9,0,1,6e-9);
sel1_2 = wavegen([0,4e-9;0,1],0.1e-9,0.05e-9,0,1,6e-9);
sel1_3 = wavegen([0,4e-9;0,1],0.1e-9,0.05e-9,0,1,6e-9);

sel2_1 = wavegen([0,2e-9,4e-9;0,1,0],0.1e-9,0.05e-9,0,1,6e-9);
sel2_2 = wavegen([0,2e-9,4e-9;0,1,0],0.1e-9,0.05e-9,0,1,6e-9);
sel2_3 = wavegen([0,2e-9,4e-9;0,1,0],0.1e-9,0.05e-9,0,1,6e-9);

wl_1 = wavegen([0,4.2e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9);
wl_2 = wavegen([0,4.2e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9);
wl_3 = wavegen([0,4.2e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9);

sl_1 = '[0 0]'; 
sl_2 = '[0 0]'; 
sl_3 = '[0 0]'; 

vload_1 = 1; 
vload_2 = 1;
vload_3 = 1;

LE1 = wavegen([0,5e-9;1,0],0.1e-9,0.05e-9,0,1,5e-9);
LE2 = wavegen([0,5e-9;0,1],0.1e-9,0.05e-9,0,1,5e-9);

selL1 = wavegen([0,4.5e-9,5e-9;0,1,0],0.1e-9,0.05e-9,0,1,5e-9);
selL2 = wavegen([0,4.5e-9,5e-9;0,1,0],0.1e-9,0.05e-9,0,1,5e-9);					

mat2spice(mat2spicepath,spicepath,sel1_1,sel1_2,sel1_3,sel2_1,sel2_2,sel2_3,wl_1,wl_2,wl_3,sl_1,sl_2,sl_3,vload_1,vload_2,vload_3,LE1,LE2,selL1,selL2)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run spice

close all
system('spectre -format psfascii ./Sa/sa1/spice/sa1_testbench.sp')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot results


