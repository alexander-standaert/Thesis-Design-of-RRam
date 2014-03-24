function [Emean,extreme_E,delaymean,extreme_td] = Synthesize(NoI)
sp.NoI=NoI;
sp.NoISTRING = int2spelledstring(NoI);

sp.MismatchOn=1;
sp.numruns=100;
sp.simlength=3e-9;


E=zeros(sp.numruns,1);
delay=zeros(sp.numruns,1);

sp = GenTestVectors(sp,3); %output die gaat switchen
SpiceInit(sp);
    
for i=1:sp.numruns
    istr=num2str(i+1000);
    istr=istr(end-2:end);
    sim = readPsfAscii(strcat('./DecoderDesign/SPICE/test.raw/mymc-',istr,'_mytran.tran'), '.*');
    
    a=sim.getSignal('OUT_2');
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

Emean = mean(E);
delaymean = mean(delay);

E_statistics = fitdist(E,'Normal');
td_statistics = fitdist(delay,'Normal');
xE = [0:0.5e-16:1e-13];
xtd = [0:1e-11:1e-9];

cdf_E = cdf(E_statistics,xE);
[~, i1] = min(abs(cdf_E-0.999));
extreme_E = xE(i1);
cdf_td = cdf(td_statistics,xtd);
[~, i2] = min(abs(cdf_td-0.999));
extreme_td = xtd(i2);
end

function [sp] = GenTestVectors(sp,i)
testvectorin = zeros(1,sp.NoI);


    jstr=dec2bin(i-1,sp.NoI);
    for k=1:sp.NoI
        testvectorin(k)=str2num(jstr(k));
    end


wavein = cell(sp.NoI,1);
for j=1:sp.NoI
    wavetempgroup=[];
    wavetemp = makewave(strcat('wave',num2str(j)),[1,1,1]*1e-9,[0,testvectorin(sp.NoI+1-j),0]);
    wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
    wave = calcwaves(wavetempgroup);
    wavein{j}=getfield(wave,strcat('wave',num2str(j)));
end
wavetempgroup=[];

wavetemp = makewave('enable',[1,1,1]*1e-9,[0,1,0]);
wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
wave = calcwaves(wavetempgroup);

sp.enablewave = wave.enable;
sp.wavesin = wavein;
end

function [] = SpiceInit(sp)
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
end