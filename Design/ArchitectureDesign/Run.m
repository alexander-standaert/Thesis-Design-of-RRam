% Architecture parameters
sp.NoWLpB=8;
sp.NoBLpLB=10;
sp.NoLBpSA=6;

% TransistorWith parameters
sp.WChargeBL=500e-9;
sp.WDischargeBL=500e-9;
sp.WDischargeSL=500e-9;

sp.PWn=100e-9;
sp.PWp=100e-9;
sp.PWpenable=100e-9;
sp.PWnenable=100e-9;

sp.PWMmuxLB=200e-9;
sp.PWMmuxGB=200e-9;

%Simulation parameters
sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=3e-9;


inputfile = 'branch.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'mux.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'localblock.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'globalblock.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'SpiceFile.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'parameters.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre ./ArchitectureDesign/SpiceFile.sp');