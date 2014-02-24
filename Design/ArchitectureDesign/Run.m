% Architecture parameters
sp.NoWLpB=512;
sp.NoBLpLB=256;
sp.NoGB=16;

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


testvectorin = zeros(2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB,sp.NoGB+log2(sp.NoWLpB)+log2(sp.NoBLpLB)+2);
for i=0:2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB-1;
    a=floor(i/(2*sp.NoBLpLB*sp.NoWLpB));
    b=floor((i-a*(2*sp.NoBLpLB*sp.NoWLpB))/(sp.NoBLpLB*sp.NoWLpB));
    c=floor((i-a*(2*sp.NoBLpLB*sp.NoWLpB)-b*(sp.NoBLpLB*sp.NoWLpB))/sp.NoWLpB);
    d=i-a*(2*sp.NoBLpLB*sp.NoWLpB)-b*(sp.NoBLpLB*sp.NoWLpB)-c*sp.NoWLpB;

    testvectorin(i+1,a+1)=1;
    testvectorin(i+1,sp.NoGB+b+1)=1;
    cstr=dec2bin(c,log2(sp.NoBLpLB));
    for k=1:log2(sp.NoBLpLB)
        testvectorin(i+1,sp.NoGB+3+k)=str2num(cstr(k));
    end
        dstr=dec2bin(d,log2(sp.NoWLpB));
    for k=1:log2(sp.NoWLpB)
        testvectorin(i+1,sp.NoGB+3+log2(sp.NoBLpLB)+k)=str2num(dstr(k));
    end
end

inputfile = 'branch.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
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

system('spectre -64 +aps ./ArchitectureDesign/SPICE/SpiceFile.sp')