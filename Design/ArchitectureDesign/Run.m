% Architecture parameters
sp.NoWLpB=16;
sp.NoBLpLB=16;
sp.NoGB=1;
sp.PercentageHighRef = 0.5; %getal tussen 0 en 1

% TransistorWith parameters
sp.WChargeBL=300e-9;
sp.LChargeBL=195e-9;
sp.WDischargeBL=100e-9;
sp.WDischargeSL=500e-9;

sp.PWn=100e-9;
sp.PWp=100e-9;
sp.PWpenable=100e-9;
sp.PWnenable=100e-9;

sp.PWMmuxLB=200e-9;
sp.PWMmuxGB=200e-9;
sp.vdd = 1;

%Simulation parameters
sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=6e-9*(3+0*2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB);
sp.randomizecells =1;


sp.refcells = zeros(1,sp.NoBLpLB);
sp.refcells(1:round(sp.NoBLpLB*sp.PercentageHighRef)) = 1
save('./ArchitectureDesign/architecture_param.mat','sp')

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
        testvectorin(i+1,sp.NoGB+2+log2(sp.NoBLpLB)+1-k)=str2num(cstr(k));
    end
        dstr=dec2bin(d,log2(sp.NoWLpB));
    for k=1:log2(sp.NoWLpB)
        testvectorin(i+1,sp.NoGB+2+log2(sp.NoBLpLB)+log2(sp.NoWLpB)+1-k)=str2num(dstr(k));
    end
end
wavein = cell(sp.NoGB+log2(sp.NoWLpB)+log2(sp.NoBLpLB)+2,1);
for i=1:sp.NoGB+log2(sp.NoWLpB)+log2(sp.NoBLpLB)+2
    wavetempgroup=[];
    for k=1:2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB
        wavetemp = makewave(strcat('wave',num2str(i)),[1,4,1]*1e-9,[0,testvectorin(k,i),0]);
        wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
        wavetempgroups(k) = wavetempgroup;
    end
    wave = calcwaves(wavetempgroups);
    wavein{i}=getfield(wave,strcat('wave',num2str(i)));
end
sp.wavesin = wavein;
wavetempgroup=[];
for k=1:2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB
    wavetemp = makewave('samplehold',[3,1,2]*1e-9,[0,1,0]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
    wavetempgroups(k) = wavetempgroup;
end
wave = calcwaves(wavetempgroups);
sp.SA_SH=getfield(wave,'samplehold');
for k=1:2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB
    wavetemp = makewave('enableSAN',[4,1.5,0.5]*1e-9,[0,1,0]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
    wavetempgroups(k) = wavetempgroup;
end
wave = calcwaves(wavetempgroups);
sp.en_SAN=getfield(wave,'enableSAN');
for k=1:2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB
    wavetemp = makewave('enableSAP',[4,1.5,0.5]*1e-9,[1,0,1]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
    wavetempgroups(k) = wavetempgroup;
end
wave = calcwaves(wavetempgroups);
sp.en_SAP=getfield(wave,'enableSAP');


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
inputfile = 'drivers.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

% system('spectre -64 +aps ./ArchitectureDesign/SPICE/SpiceFile.sp');
% [sim] = readPsfAscii(strcat('./ArchitectureDesign/SPICE/SpiceFile.raw/mymc-001_mytran.tran'), '.*');
% 
% sim.getSignal('xGB0.Delay').plotSignal;


