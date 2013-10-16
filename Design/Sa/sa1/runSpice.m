
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice latch

inputfile = 'latch.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% transistor sizes										
pmult = 1;
nmult = 1;									

mat2spice(mat2spicepath,spicepath,pmult,nmult)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice memory array

inputfile = 'memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
Rload1 = 1;
Rload2 = 1;
Rload3 = 1;
Cload1 = 1;
Cload2 = 1;
Cload3 = 1;
Rmemcell = 1;
Rmemhigh = 1;
Rmemlow = 1;								

mat2spice(mat2spicepath,spicepath,Rload1,Rload2,Rload3,Cload1,Cload2,Cload3,Rmemcell,Rmemhigh,Rmemlow)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mat2spice testbench

inputfile = 'sa1_testbench.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');						
														
% parameters									
sel1_1 = 1;
sel1_2 = 1;
sel1_3 = 1;

sel2_1 = 1;
sel2_2 = 1;
sel2_3 = 1;

wl_1 = 1;
wl_2 = 1; 
wl_3 = 1; 

sl_1 = 1; 
sl_2 = 1; 
sl_3 = 1; 

vload_1 = 1; 
vload_2 = 1;
vload_3 = 1;

LE1 = 1;
LE2 = 1;

selL1 = 1;
selL2 = 1;						

mat2spice(mat2spicepath,spicepath,sel1_1,sel1_2,sel1_3,sel2_1,sel2_2,sel2_3,wl_1,wl_2,wl_3,sl_1,sl_2,sl_3,vload_1,vload_2,vload_3,LE1,LE2,selL1,selL2)
clear inputfile currentpath mat2spicepath spicepath

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run spice

