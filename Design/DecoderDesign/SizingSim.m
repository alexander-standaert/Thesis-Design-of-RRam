function [sim,delay,energy] = SizingSim(NoI,NoIS,multfac,NoBLpLB)
% NoI=10;
sp.NoI=NoI;
sp.NoISTRING = int2spelledstring(NoI);
sp.CL = 0.18e-15*NoBLpLB;

sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=3e-9;   %2^sp.NoI*3e-9;

sp.NoIS = NoIS;

testvectorin = zeros(2^sp.NoI,sp.NoI);

sp.sizingcell = cell(decoderparameters(NoI),1);
for i=1:decoderparameters(NoI)
    sp.sizingcell{i} = 1^((decoderparameters(NoI)-i)/decoderparameters(NoI));
end

sp.sizingcell{1}=sp.sizingcell{1}/5*3;
% sp.sizingcell{2}=80;
% sp.sizingcell{3}=1;
% sp.sizingcell{4}=1;
% sp.sizingcell{5}=1;
% sp.sizingcell{6}=1;

sp.invsize = cell(sp.NoIS,1);
for i=1:sp.NoIS
    sp.invsize{i}=multfac^((i-1)/sp.NoIS);
end


j=1;
for i=2:2^sp.NoI
    jstr=dec2bin(j,sp.NoI);
    for k=1:sp.NoI
        testvectorin(i,k)=str2num(jstr(k));
    end
    j=j+1;
end

wavein = cell(sp.NoI,1);
for i=1:sp.NoI
    wavetempgroup=[];
    for k=5             %1:2^sp.NoI
        wavetemp = makewave(strcat('wave',num2str(i)),[1,1,1]*1e-9,[0,testvectorin(k,sp.NoI+1-i),0]);
        wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
        wavetempgroups(1) = wavetempgroup;
    end
    wave = calcwaves(wavetempgroups);
    wavein{i}=getfield(wave,strcat('wave',num2str(i)));
end
clear wave
wavetempgroup=[];
for k=1         %:2^sp.NoI
    wavetemp = makewave('enable',[1,1,1]*1e-9,[0,1,0]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
    wavetempgroups(k) = wavetempgroup;
end
wave = calcwaves(wavetempgroups);

sp.enablewave = wave.enable;
sp.wavesin = wavein;

clear wave

inputfile = 'parameters2.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'sizingsim.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre -64 +aps ./DecoderDesign/SPICE/sizingsim.sp');

[sim] = readPsfAscii(strcat('./DecoderDesign/SPICE/sizingsim.raw/mymc-001_mytran.tran'), '.*');


a=sim.getSignal('OUT_4');
v=a.getYValues;
t=a.getXValues;
[~, tstart] = min(abs(t - 1e-9));
[~, tstop] = min(abs(t - 2*1e-9));
delay=t(tstart+min(find(v(tstart:end)>0.99)))-1e-9

c=sim.getSignal('Vvdd:p');
t2=c.getXValues;
idd=c.getYValues;
[~, t2start] = min(abs(t2 - 1e-9));
[~, t2stop] = min(abs(t2 - 2*1e-9));
energy=trapz(t2(t2start:t2stop),-idd(t2start:t2stop))
end