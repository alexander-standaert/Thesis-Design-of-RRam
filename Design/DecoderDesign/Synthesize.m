function [sim,Emean,delaymean] = Synthesize(NoI)
sp.NoI=NoI;
sp.NoISTRING = int2spelledstring(NoI);

sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=3e-9;


E=zeros(2^sp.NoI,1);
delay=zeros(2^sp.NoI,1);


for i=1:2^sp.NoI

    sp = GenTestVectors(sp,i);
    sim = SpiceInit(sp);
    
    istr = int2str(i-1);
    
    a=sim.getSignal(strcat('OUT_',istr));
    v=a.getYValues;
    t=a.getXValues;
    c=sim.getSignal('Vvdd:p');
    t2=c.getXValues;
    idd=c.getYValues;
    
    [~, t2start] = min(abs(t2 - 1e-9));
    [~, t2stop] = min(abs(t2 - 2*1e-9));
    E(i)=trapz(t2(t2start:t2stop),-idd(t2start:t2stop));
    
    [~, tstart] = min(abs(t - 1e-9));
    [~, tstop] = min(abs(t - 2*1e-9));
    delay(i)=t(tstart+min(find(v(tstart:end)>0.99)))-1e-9;

end

Emean = mean(E)
delaymean = mean(delay)

end

function [sp] = GenTestVectors(sp,i)
testvectorin = zeros(1,sp.NoI);

% for i=2:2^sp.NoI
    jstr=dec2bin(i-1,sp.NoI);
    for k=1:sp.NoI
        testvectorin(k)=str2num(jstr(k));
    end
% end

wavein = cell(sp.NoI,1);
for j=1:sp.NoI
    wavetempgroup=[];
%     for k=1:2^sp.NoI
        wavetemp = makewave(strcat('wave',num2str(j)),[1,1,1]*1e-9,[0,testvectorin(sp.NoI+1-j),0]);
        wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
%         wavetempgroups(k) = wavetempgroup;
%     end
    wave = calcwaves(wavetempgroup);
    wavein{j}=getfield(wave,strcat('wave',num2str(j)));
end
    wavetempgroup=[];
% for k=1:2^sp.NoI
    wavetemp = makewave('enable',[1,1,1]*1e-9,[0,1,0]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
%     wavetempgroups(k) = wavetempgroup;
% end
wave = calcwaves(wavetempgroup);
        
sp.enablewave = wave.enable;
sp.wavesin = wavein;
end

function [sim] = SpiceInit(sp)
inputfile = 'test.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'parameters.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre -64 +aps ./DecoderDesign/SPICE/test.sp');

[sim] = readPsfAscii(strcat('./DecoderDesign/SPICE/test.raw/mymc-001_mytran.tran'), '.*');
end