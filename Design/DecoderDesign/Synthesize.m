function [sim,Emean,delaymean] = Synthesize(NoI)
sp.NoI=NoI;
sp.NoISTRING = [];

sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=2^sp.NoI*3e-9;

sp = GenTestVectors(sp);
sim = SpiceInit(sp);

E=zeros(2^sp.NoI,1);
delay=zeros(2^sp.NoI,1);

for i=1:2^sp.NoI

    istr = int2str(i-1);
    
    a=sim.getSignal(strcat('OUT_',istr));
    v=a.getYValues;
    t=a.getXValues;
    c=sim.getSignal('Vvdd:p');
    t2=c.getXValues;
    idd=c.getYValues;
    
    [~, t2start] = min(abs(t2 - (3*(i-1)+1)*1e-9));
    [~, t2stop] = min(abs(t2 - (3*(i-1)+4)*1e-9));
    E(i)=trapz(t2(t2start:t2stop),-idd(t2start:t2stop));
    
    [~, tstart] = min(abs(t - (3*(i-1)+1)*1e-9));
    [~, tstop] = min(abs(t - (3*(i-1)+4)*1e-9));
    delay(i)=t(tstart+min(find(v(tstart:end)>0.99)))-(3*(i-1)+1)*1e-9;

end

Emean = mean(E)
delaymean = mean(delay)

end

function [sp] = GenTestVectors(sp)
testvectorin = zeros(2^sp.NoI,sp.NoI);
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
    for k=1:2^sp.NoI
        wavetemp = makewave(strcat('wave',num2str(i)),[1,1,1]*1e-9,[0,testvectorin(k,sp.NoI+1-i),0]);
        wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
        wavetempgroups(k) = wavetempgroup;
    end
    wave = calcwaves(wavetempgroups);
    wavein{i}=getfield(wave,strcat('wave',num2str(i)));
end
    wavetempgroup=[];
for k=1:2^sp.NoI
    wavetemp = makewave('enable',[1,1,1]*1e-9,[0,1,0]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
    wavetempgroups(k) = wavetempgroup;
end
wave = calcwaves(wavetempgroups);
        
sp.enablewave = wave.enable;
sp.wavesin = wavein;
end

function [sim] = SpiceInit(sp)
inputfile = 'decodersynthesis.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'test.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'parameters.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre ./DecoderDesign/SPICE/test.sp');

[sim] = readPsfAscii(strcat('./DecoderDesign/SPICE/test.raw/mymc-001_mytran.tran'), '.*');
end