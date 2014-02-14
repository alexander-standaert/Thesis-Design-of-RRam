function [] = load_analysis()
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SET PARAM
param = init_param([]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSIS
param = gen_sig(param);
%plot_controlsig({'sel_pulldown','sel_load','wl_3','bl_bulk'})
%plot_controlsig({'sel_pulldown','sel_load','wl_1','sel_sl'})
%plot_controlsig({'wl_1','wl_2','wl_3','wl_4'})
%plot_controlsig({'bl_switch'})

%iterate_size(100e-9,20e-9,300e-9,100e-9,20e-9,300e-9,0,0.1,0.7,param,1)
reduce_data()

end

function [param] = init_param(param)
param.init_bl = 0;

% load settings
param.wswitchswitch = 100e-9;
param.wswitchbias = 100e-9;
param.wswitchdiode = 100e-9;
param.wswitchbulk = 100e-9;

param.wbias = 100e-9;
param.wdiode = 100e-9;
param.wbulk = 100e-9;

% memarray settings
param.Csl = 18*10^-15;
param.Cbl = 18*10^-15;

param.wsl = 100e-9;

param.Rmemcellhh = 35000;
param.Rmemcellhl = 30000;
param.Rmemcelllh = 10000;
param.Rmemcellll = 5000;

param.vbias = 1;

% sim settings
param.steptime = 10^-12;
param.stoptime = 50*10^-9;
param.temp = 30;

param.simulationtype = 'tran'; % 'mc'
end

function [] = runspice(param)
% Mat2spice memory array

inputfile = 'load_analysis.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');			

mat2spice(mat2spicepath,spicepath,param)
clear inputfile currentpath mat2spicepath spicepath

% Run spice
system('spectre -format psfascii ./load_analysis/spice/load_analysis.sp');

end

function [param] = gen_sig(param)

sensetime = 6;
param.senstime = sensetime;

wave_sel_pulldown = makewave('vsel_pulldown',[0.1,0.8,1]*1e-9,[0,1,0]);
wave_sel_load = makewave('vsel_load',[2,sensetime]*1e-9,[1,0]);
wave_sel_bias = makewave('vsel_bias',[2,sensetime]*1e-9,[param.vbias,0]);
wave_sel_bulk = makewave('vsel_bulk',[2,sensetime]*1e-9,[1,0]);
wave_sel_sl = makewave('vsel_sl',[1]*1e-9,[1]);

%READ RHH
wave_wl_1 = makewave('vwl_1',[2,sensetime]*1e-9,[0,1]);
wave_wl_2 = makewave('vwl_2',[1]*1e-9,[0]);    
wave_wl_3 = makewave('vwl_3',[1]*1e-9,[0]);
wave_wl_4 = makewave('vwl_4',[1]*1e-9,[0]);

wavegroup_readRHH = makewavegroup('readRHH',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2,wave_wl_3,wave_wl_4]);

%READ RHL
wave_wl_1 = makewave('vwl_1',[1]*1e-9,[0]);
wave_wl_2 = makewave('vwl_2',[2,sensetime]*1e-9,[0,1]);    
wave_wl_3 = makewave('vwl_3',[1]*1e-9,[0]);
wave_wl_4 = makewave('vwl_4',[1]*1e-9,[0]);

wavegroup_readRHL = makewavegroup('readRHL',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2,wave_wl_3,wave_wl_4]);

%READ RLH
wave_wl_1 = makewave('vwl_1',[1]*1e-9,[0]);
wave_wl_2 = makewave('vwl_2',[1]*1e-9,[0]);    
wave_wl_3 = makewave('vwl_3',[2,sensetime]*1e-9,[0,1]);
wave_wl_4 = makewave('vwl_4',[1]*1e-9,[0]);

wavegroup_readRLH = makewavegroup('readRLH',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2,wave_wl_3,wave_wl_4]);

%READ RLL
wave_wl_1 = makewave('vwl_1',[1]*1e-9,[0]);
wave_wl_2 = makewave('vwl_2',[1]*1e-9,[0]);    
wave_wl_3 = makewave('vwl_3',[1]*1e-9,[0]);
wave_wl_4 = makewave('vwl_4',[2,sensetime]*1e-9,[0,1]);

wavegroup_readRLL = makewavegroup('readRLL',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2,wave_wl_3,wave_wl_4]);

%make total waves
allwaves = calcwaves([wavegroup_readRHH,wavegroup_readRHL,wavegroup_readRLH,wavegroup_readRLL,wavegroup_readRHH,wavegroup_readRHL,wavegroup_readRLH,wavegroup_readRLL]);

param.wl_1 = allwaves.vwl_1;
param.wl_2 = allwaves.vwl_2;
param.wl_3 = allwaves.vwl_3;
param.wl_4 = allwaves.vwl_4;

param.sel_pulldown = allwaves.vsel_pulldown;
param.sel_load = allwaves.vsel_load;
param.sel_bias = allwaves.vsel_bias;
param.sel_bulk = allwaves.vsel_bulk;
param.sel_sl = allwaves.vsel_sl;

end

function [] = plot_controlsig(controlsignals)
%controlsignals = cellstr(controlsignals);
[sim tree] = readPsfAscii('./load_analysis/spice/load_analysis.raw/ana.tran', '.*');

figure

for i=1:length(controlsignals)
    sig = sim.getSignal(controlsignals(i));
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;

    subplot(length(controlsignals),1,i)
    plot(sigx,sigy)
    ylabel(controlsignals(i),'FontSize', 10,'FontWeight','bold')
end

end

function [] = iterate_size(wsstart,wsstep,wsstop,wlstart,wlstep,wlstop,vstart,vstep,vstop,param,noplot)
i1=1;
ws = [wsstart:wsstep:wsstop];
wl = [wlstart:wlstep:wlstop];
v = [vstart:vstep:vstop];

for k = wsstart:wsstep:wsstop
    
    param.wswitchswitch = k;
    param.wswitchbias = k;
    param.wswitchdiode = k;
    param.wswitchbulk = k;

    i2=1;
    for p = wlstart:wlstep:wlstop
        param.wbias = p;
        param.wdiode = p;
        param.wbulk = p;

        i3 = 1;
        for o = vstart:vstep:vstop
            param.vbias = o;
            wave_sel_bias = makewave('vsel_bias',[2,param.senstime]*1e-9,[param.vbias,0]);
            wavegroup_bias = makewavegroup('readRHL',[wave_sel_bias]);
            allwaves = calcwaves([wavegroup_bias]);
            param.sel_bias = allwaves.vsel_bias;
            
            runspice(param);

            [sim tree] = readPsfAscii('./load_analysis/spice/load_analysis.raw/ana.tran', '.*');

            [b,tr,n] = gatherdata(sim,'switch');
            b_switch(i1,:) = b;
            tr_switch(i1,:) = tr;
            n_switch(i1,:) = n;
            [b,tr,n] = gatherdata(sim,'bias');
            b_bias(i1,i2,i3,:) = b;
            tr_bias(i1,i2,i3,:) = tr;
            n_bias(i1,i2,i3,:) = n;
            [b,tr,n] = gatherdata(sim,'diode');
            b_diode(i1,i2,:) = b;
            tr_diode(i1,i2,:) = tr;
            n_diode(i1,i2,:) = n;
            [b,tr,n] = gatherdata(sim,'bulk');
            b_bulk(i1,i2,:) = b;
            tr_bulk(i1,i2,:) = tr;
            n_bulk(i1,i2,:) = n;
            
            i3 = i3+1;        
        end
            
        i2 = i2+1;
    end

    i1 = i1+1;
end

if noplot
    save ./load_analysis/loadanalysis.mat ws wl v b_switch tr_switch n_switch b_bias tr_bias n_bias b_diode tr_diode n_diode b_bulk tr_bulk n_bulk
else
    plotdata(b_switch,tr_switch,n_switch,'SWITCH');
    for k = 1:length(wl) 
        for p = 1:length(v)
            plotdata(b_bias(:,k,p,:),tr_bias(:,k,p,:),n_bias(:,k,p,:),strcat('BIAS sizing   ',num2str(wl(k)),'      BIAS voltage   ',num2str(v(p))));
        end
        plotdata(b_diode(:,k,:),tr_diode(:,k,:),n_diode(:,k,:),strcat('DIODE sizing   ',num2str(wl(k))));
        plotdata(b_bulk(:,k,:),tr_bulk(:,k,:),n_bulk(:,k,:),strcat('BULK sizing   ',num2str(wl(k))));
    end
end
    function [b,tr,n] = gatherdata(sim,branch)

        sig = sim.getSignal(strcat('bl_',branch));
        sigx = sig.getXValues*10^9;
        sigy = sig.getYValues;

        ts_hh = 2;
        ts_hl = 10;
        ts_lh = 18;
        ts_ll = 26;

        t_hh = 8;
        t_hl = 16;
        t_lh = 24;
        t_ll = 32;

        [Y, i_hh] = min(abs(sigx - t_hh));
        [Y, i_hl] = min(abs(sigx - t_hl));
        [Y, i_lh] = min(abs(sigx - t_lh));
        [Y, i_ll] = min(abs(sigx - t_ll));

        [Y, l_hh] = min(abs(sigx - ts_hh));
        [Y, l_hl] = min(abs(sigx - ts_hl));
        [Y, l_lh] = min(abs(sigx - ts_lh));
        [Y, l_ll] = min(abs(sigx - ts_ll));

        b_hh = sigy(i_hh);
        b_hl = sigy(i_hl);
        b_lh = sigy(i_lh);
        b_ll = sigy(i_ll);

        st_limit = 0.1;

        [Y, k_hh] = min(abs(sigy(l_hh:i_hh) - (b_hh-b_hh*st_limit)));
        [Y, k_hl] = min(abs(sigy(l_hl:i_hl) - (b_hl-b_hl*st_limit)));
        [Y, k_lh] = min(abs(sigy(l_lh:i_lh) - (b_lh-b_lh*st_limit)));
        [Y, k_ll] = min(abs(sigy(l_ll:i_ll) - (b_ll-b_ll*st_limit)));

        tst_hh = sigx(k_hh+l_hh);
        tst_hl = sigx(k_hl+l_hl);
        tst_lh = sigx(k_lh+l_lh);
        tst_ll = sigx(k_ll+l_ll);

        tr_hh = (tst_hh - ts_hh)*10^-9;
        tr_hl = (tst_hl - ts_hl)*10^-9;
        tr_lh = (tst_lh - ts_lh)*10^-9;
        tr_ll = (tst_ll - ts_ll)*10^-9;

        sig = sim.getSignal(strcat('mmemarray_',branch,'.nodecell_hh'));
        sigy = sig.getYValues;
        n_hh = sigy(i_hh); 

        sig = sim.getSignal(strcat('mmemarray_',branch,'.nodecell_hl'));
        sigy = sig.getYValues;
        n_hl = sigy(i_hl); 

        sig = sim.getSignal(strcat('mmemarray_',branch,'.nodecell_lh'));
        sigy = sig.getYValues;
        n_lh = sigy(i_lh); 

        sig = sim.getSignal(strcat('mmemarray_',branch,'.nodecell_ll'));
        sigy = sig.getYValues;
        n_ll = sigy(i_ll); 
        
        b = [b_hh,b_hl,b_lh,b_ll];
        tr = [tr_hh,tr_hl,tr_lh,tr_ll];
        n = [n_hh,n_hl,n_lh,n_ll];

end

    function [] = plotdata(b,tr,n,plot_caption)
        figure
        subplot(3,1,1)
        title(plot_caption,'FontSize', 14,'FontWeight','bold');
        hold on
        plot(ws,b(:,1),'r')
        plot(ws,b(:,2),'r--')
        plot(ws,b(:,3))
        plot(ws,b(:,4),'--')
        ylabel('BITLINE VOLTAGE','FontSize', 10,'FontWeight','bold')
        subplot(3,1,2)
        hold on
        plot(ws,tr(:,1),'r')
        plot(ws,tr(:,2),'r--')
        plot(ws,tr(:,3))
        plot(ws,tr(:,4),'--')
        ylabel('RISETIME','FontSize', 10,'FontWeight','bold')
        subplot(3,1,3)
        hold on
        plot(ws,b(:,1)-n(:,1),'r')
        plot(ws,b(:,2)-n(:,2),'r--')
        plot(ws,b(:,3)-n(:,3))
        plot(ws,b(:,4)-n(:,4),'--')
        ylabel('VOLTAGE DROP R','FontSize', 10,'FontWeight','bold') 
        xlabel('SIZING SWITCH','FontSize', 10,'FontWeight','bold') 
    end
end

function [] = reduce_data()
    load ./load_analysis/loadanalysis.mat
    
    switch_elements = [ones(length(ws),1),ws',ones(length(ws),1)*nan,ones(length(ws),1)*nan,b_switch(:,2)-b_switch(:,3),tr_switch(:,4),n_switch(:,4)];
    
    bias_elements = [];
    for k = 1:length(wl)
        for l = 1:length(v)
            bias_elements = [bias_elements;[ones(length(ws),1)*2,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*v(l),b_bias(:,k,l,2)-b_bias(:,k,l,3),tr_bias(:,k,l,4),n_bias(:,k,l,4)]];
        end
    end
    
    diode_elements = [];
    bulk_elements = [];
    for k = 1:length(wl)
        diode_elements = [diode_elements;[ones(length(ws),1)*3,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*nan,b_diode(:,k,2)-b_diode(:,k,3),tr_diode(:,k,4),n_diode(:,k,4)]];
        bulk_elements = [bulk_elements;[ones(length(ws),1)*4,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*nan,b_bulk(:,k,2)-b_bulk(:,k,3),tr_bulk(:,k,4),n_bulk(:,k,4)]];
    end
    
    
   all_elements = [switch_elements;bias_elements;diode_elements;bulk_elements];
   
   
end