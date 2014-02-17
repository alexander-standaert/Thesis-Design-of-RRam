sp.NoI=7;


sp.MismatchOn=0;
sp.numruns=1;
sp.simlength=3e-9;

testvectorin = zeros(2^sp.NoI,sp.NoI);
j=1;
for i=2:2^sp.NoI
    jstr=dec2bin(j,sp.NoI);
    for k=1:sp.NoI
        testvectorin(i,k)=str2num(jstr(k));
    end
    j=j+1;
end
testvectorout = flip(eye(2^sp.NoI));


wavein = cell(sp.NoI,1);
for i=1:sp.NoI
   wavein{i}=wavegen([[0,1,2]*1e-9;[0,testvectorin(5,sp.NoI+1-i),0]],1e-10,0.5e-10,0,1,1e-7);
end
sp.enablewave = wavegen([[0,1,2]*1e-9;[0,1,0]],1e-10,0.5e-10,0,1,1e-7);
sp.wavesin = wavein;

inputfile = 'decodersynthesis.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strrep(currentpath,pwd,'');
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'test.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
inputfile = 'parameters.m2s';
mat2spicepath = strcat(currentpath,'/',inputfile);
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

system('spectre ./Decodertest/test.sp');

[sim, ~] = readPsfAscii(strcat('./Decodertest/test.raw/mymc-001_mytran.tran'), '.*');

a=sim.getSignal('OUT_0');
v=a.getYValues;
t=a.getXValues;
c=sim.getSignal('Vvdd:p');
t2=c.getXValues;
idd=c.getYValues;
E=trapz(t2(1:end),-idd(1:end))
[~, tstart] = min(abs(t - 1e-9));
delay=t(tstart+min(find(v(tstart:end)>0.99)))-1e-9
