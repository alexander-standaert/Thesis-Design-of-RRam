function [] = large_signal_memarray()
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SET PARAM
param = init_param();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSIS

% param_sweep(param,'temp','out',1,30,200,30)
% param_sweep(param,'temp','bl',2,30,200,30)
% 
% [sim tree] = analyse_array(param)
% calc_bl_energy(sim,'bl','vgnd:p',1,1e-9)

sim_monte_carlo(param,{'bl','out'},30000,10000,30,2)
end

function [param] = init_param()
% dimentions							
param.Cload = 18*10^-15;
param.Rmemcell = 30000;

param.wref1 = 100e-9;
param.wref2 = 120e-9;
param.wref3 = 140e-9;
param.wref4 = 160e-9;

param.init_bl = 0;

param.temp = 30;
param.mult_inv = 2;

% signals
param.wl_1 = wavegen([0,1e-9;0,1],0.1e-9,0.05e-9,0,1,5.5e-9); 

param.sl_1 = wavegen([0,1e-9;0,0],0.1e-9,0.05e-9,0,1,5.5e-9); 

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
param.Rmemcell = Rhigh;
[simhigh tree] = analyse_array(param);
param.Rmemcell = Rlow;
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

param.Rmemcell = Rhigh;

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
    [sim_high(i), ~] = readPsfAscii(strcat('./memory_array/memory_array2/spice/large_signal_memarray.raw/mc-',istr,'_ana.tran'), '.*');
end

param.Rmemcell = Rlow;

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
    [sim_low(i), ~] = readPsfAscii(strcat('./memory_array/memory_array2/spice/large_signal_memarray.raw/mc-',istr,'_ana.tran'), '.*');
end

for k=1:length(plot_param)
   for i=1:param.mcruns
        sig = sim_high(i).getSignal(plot_param(k));
        sig1x = sig.getXValues*10^9;
        sig1y = sig.getYValues;

        sig = sim_low(i).getSignal(plot_param(k));
        sig2x = sig.getXValues*10^9;
        sig2y = sig.getYValues;
        
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