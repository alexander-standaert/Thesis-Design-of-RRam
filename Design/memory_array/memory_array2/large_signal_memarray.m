function [] = large_signal_memarray()
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SET PARAM
param = init_param('bodye2');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSIS

% param_sweep(param,'temp','out',1,30,200,30)
% param_sweep(param,'temp','bl',2,30,200,30)
% 
% [sim tree] = analyse_array(param)
% calc_bl_energy(sim,'bl','vgnd:p',1,1e-9)

sim_monte_carlo(param,{'bl','mmemarray.bl_ex','out'},30000,10000,1,1)
end

function [param] = init_param(loadtype)
param.loadtype = loadtype;

% dimentions							
param.Cload = 18*10^-15;
param.Rmemcell1 = 30000;
param.Rmemcell2 = 30000;

if loadtype == 'switch'
    param.wref1 = 100e-9;
    param.wref2 = 120e-9;
    param.wref3 = 140e-9;
    param.wref4 = 160e-9;
elseif loadtype == 'diode1' %effect van switch sizing op p diode
    param.wref1 = 100e-9;
    param.wref2 = 100e-9;
    param.wref3 = 500e-9;
    param.wref4 = 1000e-9;
    param.wdiode = 100e-9;
elseif loadtype == 'diode2' %effect van bleeding tran size op p diode
    param.wref1 = 100e-9;
    param.wref2 = 100e-9;
    param.wref3 = 100e-9;
    param.wref4 = 100e-9;
    param.wdiode = 100e-9;
    param.wbleed1 = 100e-9;
    param.wbleed2 = 300e-9;
    param.wbleed3 = 500e-9;
    param.wbleed4 = 1000e-9;
elseif loadtype == 'diode3' %effect van switch sizing op n diode
    param.wref1 = 100e-9;
    param.wref2 = 100e-9;
    param.wref3 = 500e-9;
    param.wref4 = 1000e-9;
    param.wdiode = 100e-9;  
elseif loadtype == 'diode4' %bias
    param.wref1 = 100e-9;
    param.wref2 = 100e-9;
    param.wref3 = 100e-9;
    param.wref4 = 100e-9;
    param.wbias = 300e-9;
    param.vbias = wavegen([0,13e-9,25e-9,37e-9;0,0.1,0.3,0.4],0.1e-9,0.05e-9,0,1,5.5e-9); 
elseif loadtype == 'bodyef' %body
    param.wref1 = 100e-9;
    param.wref2 = 100e-9;
    param.wref3 = 100e-9;
    param.wref4 = 100e-9;
    param.wbias = 300e-9;
    param.vbias = wavegen([0,13e-9,25e-9,37e-9;0,0.1,0.3,0.4],0.1e-9,0.05e-9,0,1,5.5e-9); 
elseif loadtype == 'bodye2' %body
    param.wref1 = 100e-9;
    param.wref2 = 100e-9;
    param.wref3 = 100e-9;
    param.wref4 = 100e-9;
    param.wbias = 300e-9;
    param.vbias = wavegen([0,13e-9,25e-9,37e-9;0,0.1,0.3,0.4],0.1e-9,0.05e-9,0,1,5.5e-9); 
end
    
param.init_bl = 0;

param.temp = 30;
param.mult_inv = 2;

% signals
param.wl_1 = wavegen([0,1e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.wl_2 = wavegen([0,1e-9;0,0],0.1e-9,0.05e-9,0,1,5.5e-9);

param.sl_1 = wavegen([0,1e-9;0,0],0.1e-9,0.05e-9,0,1,5.5e-9); 

param.sel_0 = wavegen([0,1e-9;0,0],0.1e-9,0.05e-9,0,1,5.5e-9); 

param.sel_1 = wavegen([0,1e-9;1,1],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.sel_2 = wavegen([0,1e-9;1,0],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.sel_3 = wavegen([0,1e-9;1,1],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.sel_4 = wavegen([0,1e-9;1,1],0.1e-9,0.05e-9,0,1,5.5e-9); 

% sim settings
param.steptime = 10^-12;
param.stoptime = 10*10^-9;

param.simulationtype = 'tran'; % 'mc'
end

function [sim tree] = analyse_array(param)
% Mat2spice memory array

inputfile = 'large_signal_memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');			

mat2spice(mat2spicepath,spicepath,param)
clear inputfile currentpath mat2spicepath spicepath

% Run spice
system('spectre -format psfascii ./memory_array/memory_array2/spice/large_signal_memarray.sp');

[sim tree] = readPsfAscii('./memory_array/memory_array2/spice/large_signal_memarray.raw/ana.tran', '.*');

end

function [] = dualplot(sim1,sim2,signal,arg,fignb)
sig = sim1.getSignal(signal);
sig1x = sig.getXValues*10^9;
sig1y = sig.getYValues;

sig = sim2.getSignal(signal);
sig2x = sig.getXValues*10^9;
sig2y = sig.getYValues;

figure(fignb)
hold all
subplot(1,2,1)
plot(sig1x,sig1y,arg)
axis([sig1x(1) sig1x(end) -0.01 1.01])
subplot(1,2,2)
plot(sig2x,sig2y,arg)
axis([sig2x(1) sig2x(end) -0.01 1.01])
hold off

end

function [simhigh simlow] = sim_highlow(param,Rhigh,Rlow)
param.Rmemcell1 = Rhigh;
[simhigh tree] = analyse_array(param);
param.Rmemcell1 = Rlow;
[simlow tree] = analyse_array(param);
end

function [] = param_sweep(param,field,plotnode,plotfig,start_val,stop_val,step_val)
cmap = redgreencmap;
i=1;
for k = start_val:step_val:stop_val
    param = setfield(param,field,k);
    [simhigh,simlow] = sim_highlow(param,30000,10000);
    
    sig = simhigh.getSignal(plotnode);
    sig1x = sig.getXValues*10^9;
    sig1y = sig.getYValues;

    sig = simlow.getSignal(plotnode);
    sig2x = sig.getXValues*10^9;
    sig2y = sig.getYValues;

    figure(plotfig)
    hold on
    subplot(1,2,1)
    plot(sig1x,sig1y,'color',cmap(5*i,:))
    axis([sig1x(1) sig1x(end) -0.01 1.01])
    hold on
    subplot(1,2,2)
    plot(sig2x,sig2y,'color',cmap(5*i,:))
    axis([sig2x(1) sig2x(end) -0.01 1.01])
    
    i = i+1;
end
end

function [energy] = calc_bl_energy(sim,Vsignal,Isignal,Vdd,starttime)
sig = sim.getSignal(Vsignal);
Vsignal = sig.getYValues;

time = sig.getXValues;

Vmax = Vsignal(end);
Vstable = Vmax-Vmax*0.01;
[Y I1] = min(abs(time - starttime));
[Y I2] = min(abs(Vsignal - Vstable));

sig = sim.getSignal(Isignal);
Isignal = sig.getYValues;

energy = trapz(time(I1:I2),Isignal(I1:I2))*Vdd*10e15; %in femto Joule
end

function [] = sim_monte_carlo(param,plot_param,Rhigh,Rlow,mc_runs,fignb)
param.simulationtype = 'mont';
param.VtMismatch = 1;
param.BMismatch = 0;
param.mcruns = mc_runs;

param.stoptime = 49e-9;

param.wl_1 = wavegen([0,1e-9,6e-9,7e-9,12e-9,13e-9,18e-9,19e-9,24e-9,25e-9,30e-9,31e-9,36e-9,37e-9,42e-9,43e-9,48e-9;0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0],0.1e-9,0.05e-9,0,1,5.5e-9);
param.wl_2 = wavegen([0,1e-9,6e-9,7e-9,12e-9,13e-9,18e-9,19e-9,24e-9,25e-9,30e-9,31e-9,36e-9,37e-9,42e-9,43e-9,48e-9;0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0],0.1e-9,0.05e-9,0,1,5.5e-9);

param.sel_0 = wavegen([0,1e-9,6e-9,7e-9,12e-9,13e-9,18e-9,19e-9,24e-9,25e-9,30e-9,31e-9,36e-9,37e-9,42e-9,43e-9,48e-9;1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1],0.1e-9,0.05e-9,0,1,5.5e-9);

param.sel_1 = wavegen([0,1e-9,6e-9,7e-9,12e-9;1,0,1,0,1],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.sel_2 = wavegen([0,13e-9,18e-9,19e-9,24e-9;1,0,1,0,1],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.sel_3 = wavegen([0,25e-9,30e-9,31e-9,36e-9;1,0,1,0,1],0.1e-9,0.05e-9,0,1,5.5e-9); 
param.sel_4 = wavegen([0,37e-9,42e-9,43e-9,48e-9;1,0,1,0,1],0.1e-9,0.05e-9,0,1,5.5e-9);  

param.Rmemcell1 = Rhigh;
param.Rmemcell2 = Rlow;
% Mat2spice memory array

inputfile = 'large_signal_memarray.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');			

mat2spice(mat2spicepath,spicepath,param)
clear inputfile currentpath mat2spicepath spicepath

% Run spice
system('spectre -format psfascii ./memory_array/memory_array2/spice/large_signal_memarray.sp');

for i=1:param.mcruns
    istr=num2str(i+1000);
    istr=istr(end-2:end);
    [sim(i), ~] = readPsfAscii(strcat('./memory_array/memory_array2/spice/large_signal_memarray.raw/mc-',istr,'_ana.tran'), '.*');
end

for k=1:length(plot_param)
   for i=1:param.mcruns
        sig = sim(i).getSignal(plot_param(k));
        sig1x = sig.getXValues*10^9;
        sig1y = sig.getYValues;

        figure(fignb+k-1)
        hold all
        subplot(1,2,1)
        plot(sig1x,sig1y)
        axis([sig1x(1) sig1x(end) -0.01 1.01])
        hold all
        subplot(1,2,2)
        plot(sig2x,sig2y)
        axis([sig2x(1) sig2x(end) -0.01 1.01])
    end
end
end