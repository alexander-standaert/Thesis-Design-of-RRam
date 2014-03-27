clc
close all
sp.stages = 2.^[3:10];

inputfile = 'DE_testbench.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

% system('spectre -64 +aps ./DelaySynthesis/SPICE/DE_testbench.sp')

[sim, ~] = readPsfAscii(strjoin({'./DelaySynthesis/SPICE/DE_testbench.raw/ana.tran'},''), '.*');

%voor 128Bit

i_bl = 1.92e-3
t_diff = (1.48-1.36)*1e-9

for i = 1:50
sig = sim.getSignal(strjoin({'out_',num2str(i)},''));
sigx = sig.getXValues;
sigy = sig.getYValues;
[Y I] = min(abs(sigy-0.98));
delay(i) = sigx(I)-1e-9;
sig = sim.getSignal(strjoin({'vvdd_',num2str(i),':p'},''));
sigx = sig.getXValues;
sigy = sig.getYValues*-1;
energy(i) = trapz(sigx,sigy);  
energytot(i) = trapz(sigx,sigy) + (t_diff-delay(i))*i_bl;
end

figure
plot(delay)
hold on 
plot(1:50,ones(1,50)*t_diff,'r')
figure
plot(1:50,ones(1,50)*t_diff*i_bl,'r')
hold on
plot(energytot)
