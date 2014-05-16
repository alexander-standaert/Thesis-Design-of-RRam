function [] = load_analysis()
    close all
    clc
    %disp(strjoin({'ID ',num2str(simid)},''))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% SET PARAM
    param = init_param([]);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% ANALYSIS
     param = gen_sig(param,6);
%      runspice(param)
      
    %plot_controlsig({'sel_pulldown','sel_load','wl_1','sel_sl'})
    %plot_controlsig({'wl_1','wl_2','wl_3','wl_4'})
    %plot_controlsig({'bl_switch'})
    
%      la_run(100e-9,10e-9,500e-9,100e-9,10e-9,500e-9,0,0.1,0.3,param,0)
    
    %data = reduce_data()
    %  data = load('./LoadAnalysis/loadanalysis_alldata.mat');
    %  data = data.all_elements
    %  plot_data(data)
%     data = load('./LoadAnalysis/loadanalysis_frontdata.mat');
%     data = data.best_elements
    % % selecteddata = plot_data(data)
%     run_mc(data(1,:),param,300,1,1,1,1)
    % run_mc([[2,100e-9,210e-9,1,0.210739944779165,0.000000001502476,0.059856054676761,0.000000000000014]],param,200,1,1,1)
%     la_reduce_data()
    
    
%       la_analize_data()

    % find_unitbit_param(gen_sig(param,15),1)
    %data_stats(data)
    
%      element = [2.000000000000000   0.000000100000000   0.000000180000000  0   0.250000000000000   0.000000001938000   0.351954746151612     0.000000000000013   0.080000000000000   0.058924686423743   0.089155067750199   0.000000003926000]
%mc_run(element,param,1,1,1,1,1) 
%   mc_run_ref(element,param,50,20)
%  mc_analize_ref()
     la_analize_data()
%    mc_finalload(param)
%     la_run_trippel(param,0,1)
%       la_run_length(param,0,1)
%        mc_run_length(param,0,1)
%     mc_run_tripel(param,1,0)
% la_run_ref2(element,param,4) 
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
    
    param.wsl = 500e-9;
    
    param.Rmemcellhh = 35000;
    param.Rmemcellhl = 30000;
    param.Rmemcelllh = 10000;
    param.Rmemcellll = 5000;
    param.Rmemcellh = 37500;
    param.Rmemcelll = 7500;
    
    param.vbias = 0;
    
    % sim settings
    param.steptime = 10^-12;
    param.stoptime = 50*10^-9;
    param.temp = 30;
    
    param.simulationtype = 'tran'; % 'mc'
end

function [param] = gen_sig(param,sensetime)
    param.senstime = sensetime;
    
    wave_sel_pulldown = makewave('vsel_pulldown',[0.1,0.8,1]*1e-9,[0,1,0]);
    wave_sel_load = makewave('vsel_load',[2,sensetime]*1e-9,[1,0]);
    wave_sel_bias = makewave('vsel_bias',[1]*1e-9,[param.vbias]);
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

function [] = runspice(param)
    % Mat2spice memory array
    
    inputfile = 'load_analysis.m2s';
    
    [currentpath,~,~] = fileparts(which(mfilename));
    
    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
    
    mat2spice(mat2spicepath,spicepath,param)
    clear inputfile currentpath mat2spicepath spicepath
    
    % Run spice
    system('spectre -format psfascii ./LoadAnalysis/spice/load_analysis.sp');
    
end

function [] = la_run(wsstart,wsstep,wsstop,wlstart,wlstep,wlstop,vstart,vstep,vstop,param,noplot)
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
                param.vbias = o
                wave_sel_bias = makewave('vsel_bias',[1 2]*1e-9,[param.vbias param.vbias]);
                wavegroup_bias = makewavegroup('readRHL',[wave_sel_bias]);
                allwaves = calcwaves([wavegroup_bias]);
                param.sel_bias = allwaves.vsel_bias;
                
                runspice(param);
                
                [sim tree] = readPsfAscii('./LoadAnalysis/spice/load_analysis.raw/ana.tran', '.*');
                
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
        save ./LoadAnalysis/loadanalysis_raw.mat ws wl v b_switch tr_switch n_switch b_bias tr_bias n_bias b_diode tr_diode n_diode b_bulk tr_bulk n_bulk
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

function [] = la_run_ref(element,param)
    param.simulationtype = 'tran';
    
    
    switch element(1)
        case 1
            loadtype = 'switch';
            param.wswitchswitch = element(2);
        case 2
            loadtype = 'bias';
            param.wswitchbias = element(2);
            param.wbias = element(3);
            param.vbias = element(4);
        case 3
            loadtype = 'diode';
            param.wswitchdiode = element(2);
            param.wdiode = element(3);
        case 4
            loadtype = 'bulk';
            param.wswitchbulk = element(2);
            param.wbulk = element(3);
        otherwise
            loadtype = 1;
            error('unknown element type')
    end
    
    param.senstime = 6;
    
    wave_sel_pulldown = makewave('vsel_pulldown',[0.1,0.8,1]*1e-9,[0,1,0]);
    wave_sel_load = makewave('vsel_load',[2,param.senstime]*1e-9,[1,0]);
    wave_sel_bias = makewave('vsel_bias',[1]*1e-9,[param.vbias]);
    wave_sel_bulk = makewave('vsel_bulk',[2,param.senstime]*1e-9,[1,0]);
    wave_sel_sl = makewave('vsel_sl',[1]*1e-9,[1]);
    
    %READ RHH
    wave_wl_1 = makewave('vwl_1',[2,param.senstime]*1e-9,[0,1]);
    wave_wl_2 = makewave('vwl_2',[1]*1e-9,[0]);
    
    
    wavegroup_read1 = makewavegroup('read1',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2]);
    
    %READ RHL
    wave_wl_1 = makewave('vwl_1',[1]*1e-9,[0]);
    wave_wl_2 = makewave('vwl_2',[2,param.senstime]*1e-9,[0,1]);
    
    wavegroup_read2 = makewavegroup('read2',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2]);
    
    %make total waves
    allwaves = calcwaves([wavegroup_read1,wavegroup_read2]);
    
    param.wl_1 = allwaves.vwl_1;
    param.wl_2 = allwaves.vwl_2;
    
    param.sel_pulldown = allwaves.vsel_pulldown;
    param.sel_load = allwaves.vsel_load;
    param.sel_bias = allwaves.vsel_bias;
    param.sel_bulk = allwaves.vsel_bulk;
    param.sel_sl = allwaves.vsel_sl;
    
    
    inputfile = 'ref_analysis.m2s';
    
    [currentpath,~,~] = fileparts(which(mfilename));
    
    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
    
    mat2spice(mat2spicepath,spicepath,param)
    clear inputfile currentpath mat2spicepath spicepath
    
    % Run spice
    system(strjoin({'mv ./LoadAnalysis/spice/ref_analysis.sp /tmp/s0211331-loadana/spice/ref_analysis.sp'},''));
    system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/ref_analysis.sp'},''));
    
    
    
end

function [] = la_run_ref2(element,param,refcellnb) 
    param.wswitchbias = element(2);
    param.wbias = element(3);
    param.refnb = refcellnb;
    param.wsl = 1000e-9;
    
    for o = 1:2
        if o == 1
            param.Vtswitch_sweep = [-0.08:0.01:0.08];
            param.Vtbias_sweep = [0];
            param.sweettype = 'VTswitchsweep';
        else
            param.Vtswitch_sweep = [0];
            param.Vtbias_sweep = [-0.08:0.01:0.08];
            param.sweettype = 'VTbiassweep';
        end
        
        for k = 1:refcellnb
            param.refnb = k;
            
            inputfile = 'ref_analysis2.m2s';
            
            [currentpath,~,~] = fileparts(which(mfilename));
            
            mat2spicepath = strcat(currentpath,'/',inputfile);
            spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
            
            mat2spice(mat2spicepath,spicepath,param)
            clear inputfile currentpath mat2spicepath spicepath
            
            % make Sim folders
            system('rm -rf /tmp/s0211331-loadana/');
            system('mkdir /tmp/s0211331-loadana/');
            system('mkdir /tmp/s0211331-loadana/spice');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');
            
            % Run spice
            system(strjoin({'cp ./LoadAnalysis/spice/ref_analysis2.sp /tmp/s0211331-loadana/spice/ref_analysis2.sp'},''));
            system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/ref_analysis2.sp'},''));
            
            [sim, ~] = readPsfAscii(strjoin({'/tmp/s0211331-loadana/spice/ref_analysis2.raw/',param.sweettype,'.dc'},''));
            
            bl101 = (sim.getSignal('bl01').getYValues)';
            bl_bias = (sim.getSignal('bl_bias').getYValues)';
            ivdd = (-1*(sim.getSignal('vvdd:p').getYValues))';
            
            bl102 = (sim.getSignal('bl02').getYValues)';
            bl_mem = (sim.getSignal('bl_mem').getYValues)';
            ivdd2 = (-1*(sim.getSignal('vvdd2:p').getYValues))';
            
            if o==1
                sws_vgs_switch(k,:) = 1-param.Vtswitch_sweep;
                sws_vgs_bias(k,:) = bl101-param.Vtbias_sweep;
                sws_vds_switch(k,:) = 1-bl101;
                sws_vds_bias(k,:) = bl101-bl_bias;
                sws_gm_switch(k,:) = 2*ivdd./(sws_vgs_switch(k,:)-0.4);
                sws_gm_bias(k,:) = 2*ivdd./(sws_vgs_bias(k,:)-0.4);
                sws_r_switch(k,:) = sws_vds_switch(k,:)./ivdd;
                sws_r_bias(k,:) = sws_vds_bias(k,:)./ivdd;
                sws_vbias(k,:) = bl_bias;
                
                swsm_vgs_switch(k,:) = 1-param.Vtswitch_sweep;
                swsm_vgs_bias(k,:) = bl102-param.Vtbias_sweep;
                swsm_vds_switch(k,:) = 1-bl102;
                swsm_vds_bias(k,:) = bl102-bl_mem;
                swsm_gm_switch(k,:) = 2*ivdd2./(swsm_vgs_switch(k,:)-0.4);
                swsm_gm_bias(k,:) = 2*ivdd2./(swsm_vgs_bias(k,:)-0.4);
                swsm_r_switch(k,:) = swsm_vds_switch(k,:)./ivdd2;
                swsm_r_bias(k,:) = swsm_vds_bias(k,:)./ivdd2;
                swsm_vbias(k,:) = bl_mem;
            else
                swb_vgs_switch(k,:) = 1-param.Vtswitch_sweep;
                swb_vgs_bias(k,:) = bl101-param.Vtbias_sweep;
                swb_vds_switch(k,:) = 1-bl101;
                swb_vds_bias(k,:) = bl101-bl_bias;
                swb_gm_switch(k,:) = 2*ivdd./(swb_vgs_switch(k,:)-0.4);
                swb_gm_bias(k,:) = 2*ivdd./(swb_vgs_bias(k,:)-0.4);
                swb_r_switch(k,:) = swb_vds_switch(k,:)./ivdd;
                swb_r_bias(k,:) = swb_vds_bias(k,:)./ivdd;
                swb_vbias(k,:) = bl_bias;
                
                
                swbm_vgs_switch(k,:) = 1-param.Vtswitch_sweep;
                swbm_vgs_bias(k,:) = bl102-param.Vtbias_sweep;
                swbm_vds_switch(k,:) = 1-bl102;
                swbm_vds_bias(k,:) = bl102-bl_mem;
                swbm_gm_switch(k,:) = 2*ivdd2./(swbm_vgs_switch(k,:)-0.4);
                swbm_gm_bias(k,:) = 2*ivdd2./(swbm_vgs_bias(k,:)-0.4);
                swbm_r_switch(k,:) = swbm_vds_switch(k,:)./ivdd2;
                swbm_r_bias(k,:) = swbm_vds_bias(k,:)./ivdd2;
                swbm_vbias(k,:) = bl_mem;
            end
        end
        
        
    end
    
    makeplot(sws_vgs_switch,sws_vds_switch,sws_gm_switch,sws_r_switch,sws_vgs_bias,sws_vds_bias,sws_gm_bias,sws_r_bias,sws_vbias,'Vgs switch')
    makeplot(swb_vgs_switch,swb_vds_switch,swb_gm_switch,swb_r_switch,swb_vgs_bias,swb_vds_bias,swb_gm_bias,swb_r_bias,swb_vbias,'Vgs bias')
    
    makeplot(swsm_vgs_switch,swsm_vds_switch,swsm_gm_switch,swsm_r_switch,swsm_vgs_bias,swsm_vds_bias,swsm_gm_bias,swsm_r_bias,swsm_vbias,'Vgs switch')
    makeplot(swbm_vgs_switch,swbm_vds_switch,swbm_gm_switch,swbm_r_switch,swbm_vgs_bias,swbm_vds_bias,swbm_gm_bias,swbm_r_bias,swbm_vbias,'Vgs bias')
    
    function [] = makeplot(vgs_switch,vds_switch,gm_switch,r_switch,vgs_bias,vds_bias,gm_bias,r_bias,vbias,xlab)
        if strcmp(xlab,'Vgs switch')
           vgs = vgs_switch; 
        else
           vgs = vgs_bias; 
        end
        
        xlimits = [min(min(vgs)),max(max(vgs))];
  
        v_th = 0.4;
        vg_vt = vgs_switch(1,:) - v_th;
        [y1, i1] = min(abs(vds_switch(1,:)-vg_vt));
        
        vg_vt = vgs_bias(1,:) - v_th;
        [y2, i2] = min(abs(vds_bias(1,:)-vg_vt));
        
        figure
        sp = 6;
        h(1) = subplot(sp,2,1);
        h(2) = subplot(sp,2,3);
        h(3) = subplot(sp,2,5);
        h(4) = subplot(sp,2,7);
        h(5) = subplot(sp,2,9);
        h(6) = subplot(sp,2,11);
        h(7) = subplot(sp,2,[2,4,6,8,10,12]);
        
        hold all
        for k = 1:size(vds_switch,1)
            subplot(h(1))
            hold all
            plot(vgs(k,:),vds_switch(k,:))
            plot([vgs(k,i1),vgs(k,i1)],[0.18,0.2],'r')
            ylabel('vds_switch','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            subplot(h(2))
            hold all
            plot(vgs(k,:),gm_switch(k,:))
            ylabel('gm_switch','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            subplot(h(3))
            hold all
            plot(vgs(k,:),r_switch(k,:))
            ylabel('r_switch','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            subplot(h(4))
            hold all
            plot(vgs(k,:),vds_bias(k,:))
            plot([vgs(k,i2),vgs(k,i2)],[0.4,0.6],'r')
            ylabel('vds_bias','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            subplot(h(5))
            hold all
            plot(vgs(k,:),gm_bias(k,:))
            ylabel('gm_bias','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            subplot(h(6))
            hold all
            plot(vgs(k,:),r_bias(k,:))
            ylabel('r_bias','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            xlabel(xlab,'FontSize', 12,'FontWeight','bold','interpreter','none')    
            subplot(h(7))
            hold all
            plot(vgs(k,:),vbias(k,:))
            ylabel('v_bias','FontSize', 12,'FontWeight','bold','interpreter','none')
            xlim(xlimits);
            xlabel(xlab,'FontSize', 12,'FontWeight','bold','interpreter','none')  
        end
    end
end

function [] = la_run_trippel(param,simulate,analyse)
   allelements = allcomb([100:50:500]*1e-9,[100:50:500]*1e-9,[100:50:500]*1e-9); 
   
   if simulate
       notfinished = 1;
       element_nb = 1;

       while notfinished
           calcelement(element_nb);
           [notfinished,element_nb] = getelement_nb();
       end

       disp('========================================================')
       disp('  ')
       disp('SIM FINISHED')
       disp('  ')
       disp('========================================================')
   end
   
   if analyse
       for k = 1:size(allelements,1)
          data = load(strjoin({'./LoadAnalysis/la_tripel/tripel_',num2str(k),'.mat'},'')); 
          b = data.b;
          element = data.element;
          
          elements(k,:) = [element,b(2)-b(3)];
          
          if k == 1
             best_b = b;
             best_element = element;
          else
              b_diff = b(2)-b(3);
              best_b_diff = best_b(2)-best_b(3);
              if b_diff > best_b_diff
                  best_b = b;
                  best_element = element;
              end
          end          
       end
       best_b
       best_element
       elements
   end
   
    function [notfinished,element_nb] = getelement_nb()
        system('ls ./LoadAnalysis/la_tripel > ./LoadAnalysis/monitor.txt')

        fid = fopen('./LoadAnalysis/monitor.txt');
        
        sim_done = [];
        i = 1;
        tline = fgets(fid);
        while ischar(tline)
            [C,matches] = strsplit(tline,{'tripel_','.mat'});
            sim_done(i) = str2num(cell2mat(C(2)));
            tline = fgets(fid);
            i = i+1;
        end
        
        if size(allelements,1) == length(sim_done)
            notfinished = 0;
            element_nb = 1;
        else
            notfinished = 1;
            index_pool = setdiff([1:size(allelements,1)],sim_done);
            index = randi(size(index_pool,2));
            element_nb = index_pool(index);
            disp('========================================================')
            disp('  ')
            disp(strjoin({'CURRENT ELEMENT NUMBER ',num2str(element_nb)},''))
            disp('  ')
            disp('========================================================')
            
        end
        
    end
    
    function [] = calcelement(element_nb)
        param.wswitch = allelements(element_nb,1);
        param.wbias = allelements(element_nb,2);
        param.wbias2 = allelements(element_nb,3);
        
        % make Sim folders
        system('rm -rf /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/spice');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');
        
        inputfile = 'tripel.m2s';
        
        [currentpath,~,~] = fileparts(which(mfilename));
        
        mat2spicepath = strcat(currentpath,'/',inputfile)
        spicepath = '../../../../../tmp/s0211331-loadana/spice/'
        
        mat2spice(mat2spicepath,spicepath,param)
        clear inputfile currentpath mat2spicepath spicepath
        
        
        
        % Run spice
        
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/tripel.sp'},''));
        
        [sim tree] = readPsfAscii('/tmp/s0211331-loadana/spice/tripel.raw/ana.tran', '.*');
        
        [b,tr,n] = gatherdata(sim,'bias');
        element = allelements(element_nb,:)
        
        save(strjoin({'./LoadAnalysis/la_tripel/tripel_',num2str(element_nb)},''),'b','tr','n','element')
        
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
    end
    
end

function [] = la_run_length(param,simulate,analyse)
   allelements = allcomb([100:50:500]*1e-9,[100:50:500]*1e-9,[45:10:100]*1e-9,[45:10:100]*1e-9); 
	allelements = allcomb([100:50:500]*1e-9,[45:10:200]*1e-9); 
      

   if simulate
       notfinished = 1;
       element_nb = 1;

       while notfinished
           calcelement(element_nb);
           [notfinished,element_nb] = getelement_nb();
       end

       disp('========================================================')
       disp('  ')
       disp('SIM FINISHED')
       disp('  ')
       disp('========================================================')
   end
   
   if analyse
       for k = 1:size(allelements,1)
          data = load(strjoin({'./LoadAnalysis/la_length/length_',num2str(k),'.mat'},'')); 
          b = data.b;
          n = data.n
          element = data.element;
          
%           elements(k,:) = [element,b(2)-b(3)];
          woverl = element(1)/element(2);
            b_diff = b(2)-b(3);
            vcellmax = b(1)-n(1);
            datamatrix(k,:) = [woverl,b_diff,vcellmax,element(1),element(2)]
%           if k == 1
%              best_b = b;
%              best_element = element;
%           else
%               b_diff = b(2)-b(3);
%               best_b_diff = best_b(2)-best_b(3);
%               if b_diff > best_b_diff
%                   best_b = b;
%                   best_element = element;
%               end
%           end          
       end
       
       figure
      scatter(datamatrix(:,1),datamatrix(:,2))
       figure
      scatter(datamatrix(:,1),datamatrix(:,3))
%        best_b
%        best_element
%        elements
   end
   
    function [notfinished,element_nb] = getelement_nb()
        rng('shuffle');
        rndname = num2str(randi(1000000)); % make unique random temp folder
        system(strjoin({'ls ./LoadAnalysis/la_length > ./LoadAnalysis/',rndname,'.txt'},''))

        fid = fopen(strjoin({'./LoadAnalysis/',rndname,'.txt'},''));
        
        sim_done = [];
        i = 1;
        tline = fgets(fid);
        while ischar(tline)
            [C,matches] = strsplit(tline,{'length_','.mat'});
            sim_done(i) = str2num(cell2mat(C(2)));
            tline = fgets(fid);
            i = i+1;    
        end
        
        if size(allelements,1) == length(sim_done)
            notfinished = 0;
            element_nb = 1;
        else
            notfinished = 1;
            index_pool = setdiff([1:size(allelements,1)],sim_done);
            index = randi(size(index_pool,2));
            element_nb = index_pool(index);
            disp('========================================================')
            disp('  ')
            disp(strjoin({'CURRENT ELEMENT NUMBER ',num2str(element_nb)},''))
            disp('  ')
            disp('========================================================')
            
        end
        
        system(strjoin({'rm ./LoadAnalysis/',rndname,'.txt'},''))
        
    end
    
    function [] = calcelement(element_nb)
        %param.wswitch = allelements(element_nb,1);
        %param.wbias = allelements(element_nb,2);
        %param.lswitch = allelements(element_nb,3);
        %param.lbias = allelements(element_nb,4);
        
		param.wswitch = allelements(element_nb,1);
	    param.lswitch = allelements(element_nb,2);
                

        rng('shuffle');
        rnddirname = num2str(randi(1000000)); % make unique random temp folder
        param.rnddirname = rnddirname;
        
        % make Sim folders
        system(strjoin({'mkdir /tmp/',rnddirname,'/'},''));
        system(strjoin({'mkdir /tmp/',rnddirname,'/spice'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/',rnddirname,'/spice/'},''));
        
        inputfile = 'length2.m2s';
        
        [currentpath,~,~] = fileparts(which(mfilename));
        
        mat2spicepath = strcat(currentpath,'/',inputfile)
        spicepath = strjoin({'../../../../../tmp/',rnddirname,'/spice/'},'')
        
        mat2spice(mat2spicepath,spicepath,param)
        clear inputfile currentpath mat2spicepath spicepath
        
        
        
        % Run spice
        
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/',rnddirname,'/spice/length2.sp'},''));
        
        [sim tree] = readPsfAscii(strjoin({'/tmp/',rnddirname,'/spice/length2.raw/ana.tran'},''), '.*');
        
        [b,tr,n] = gatherdata(sim,'bias');
        element = allelements(element_nb,:)
        
        save(strjoin({'./LoadAnalysis/la_length/length_',num2str(element_nb)},''),'b','tr','n','element')
        system(strjoin({'rm -rf /tmp/',param.rnddirname,'/'},''));
        
        clear sim tree
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
    end
    
end

function [best_elements] = la_reduce_data()
    
           all_elements = organize_data(1);
           best_elements = []
%     data = load('./LoadAnalysis/loadanalysis_alldata.mat');
%     best_elements = sort_data(data.all_elements,1)
     function [all_elements] = organize_data(savedata)
        
        data = load('./LoadAnalysis/loadanalysis_raw.mat');
        ws = data.ws;
        wl = data.wl;
        v = data.v;
        b_switch = data.b_switch;
        tr_switch = data.tr_switch;
        n_switch = data.n_switch;
        b_bias = data.b_bias;
        tr_bias = data.tr_bias;
        n_bias = data.n_bias;
        b_diode = data.b_diode;
        tr_diode = data.tr_diode;
        n_diode = data.n_diode;
        b_bulk = data.b_bulk;
        tr_bulk = data.tr_bulk;
        n_bulk = data.n_bulk;
        
        switch_elements = [ones(length(ws),1),ws',ones(length(ws),1)*nan,ones(length(ws),1)*nan,((b_switch(:,1)+b_switch(:,2))/2) - ((b_switch(:,3)+b_switch(:,4))/2) ...
            ,((tr_switch(:,1)+tr_switch(:,2)+tr_switch(:,3)+tr_switch(:,4))/4) ...
            ,((b_switch(:,1)+b_switch(:,2))/2) - ((n_switch(:,1)+n_switch(:,2))/2) ...
            ,ws'*45e-9];
        
        bias_elements = [];
        for k = 1:length(wl)
            for l = 1:length(v)
                bias_elements = [bias_elements;[ones(length(ws),1)*2,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*v(l),((b_bias(:,k,l,1)+b_bias(:,k,l,2))/2) - ((b_bias(:,k,l,3)+b_bias(:,k,l,4))/2) ...
                    ,((tr_bias(:,k,l,1)+tr_bias(:,k,l,2)+tr_bias(:,k,l,3)+tr_bias(:,k,l,4))/4) ...
                    ,((b_bias(:,k,l,1)+b_bias(:,k,l,2))/2) - ((n_bias(:,k,l,1)+n_bias(:,k,l,2))/2) ...
                    ,(ws'+wl(k))*45e-9]];
            end
        end
        
        diode_elements = [];
        bulk_elements = [];
        for k = 1:length(wl)
            diode_elements = [diode_elements;[ones(length(ws),1)*3,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*nan,((b_diode(:,k,1)+b_diode(:,k,2))/2) - ((b_diode(:,k,3)+b_diode(:,k,4))/2) ...
                ,((tr_diode(:,k,1)+tr_diode(:,k,2)+tr_diode(:,k,3)+tr_diode(:,k,4))/4) ...
                ,((b_diode(:,k,1)+b_diode(:,k,2))/2) - ((n_diode(:,k,1)+n_diode(:,k,2))/2) ...
                ,(ws'+wl(k))*45e-9]];
            bulk_elements = [bulk_elements;[ones(length(ws),1)*4,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*nan,((b_bulk(:,k,1)+b_bulk(:,k,2))/2) - ((b_bulk(:,k,3)+b_bulk(:,k,4))/2) ...
                ,((tr_bulk(:,k,1)+tr_bulk(:,k,2)+tr_bulk(:,k,3)+tr_bulk(:,k,4))/4) ...
                ,((b_bulk(:,k,1)+b_bulk(:,k,2))/2) - ((n_bulk(:,k,1)+n_bulk(:,k,2))/2) ...
                ,(ws'+wl(k))*45e-9]];
        end
        
        % SORT ALL ELEMENTS IN FRONTS
        
        all_elements = [switch_elements;bias_elements;diode_elements;bulk_elements];
        
        if savedata
            save ./LoadAnalysis/loadanalysis_alldata.mat all_elements
        end
    end
    
    function [best_elements] = sort_data(x,savedata)
        %plot_data(x)
        x(:,5) = x(:,5)*-1;
        
        N = size(x,1);
        
        M = 4;
        V = 4;
        
        x(:,V+M+1) = ones(N,1);
        
        [c2,ia,ic] = unique(x(:,V+1:V+M),'rows');
        x = x(ia,:);
        
        out_of_fronts = 0;
        front = 1;
        while out_of_fronts == 0
            x_index = find(x(:,V+M+1) == front);
            N_new = size(x_index,1);
            
            if isempty(x_index)
                out_of_fronts = 1;
            else
                for i = 1:N_new
                    continu = 1;
                    x_index_temp = x_index;
                    x_index_temp(i) = [];
                    x_temp = x(x_index_temp,:);
                    k = 0;
                    while k < M && continu
                        k=k+1;
                        f = x(x_index(i),V+k);
                        x_temp = x_temp(find(x_temp(:,V+k) <= f),:);
                        if isempty(x_temp)
                            continu = 0;
                        elseif k == M
                            x(x_index(i),V+M+1) = front + 1;
                        end
                    end
                end
            end
            front = front+1;
        end
        x(:,5) = x(:,5)*-1;
        
        best_elements = x(find(x(:,(V+M+1))==1),1:V+M);
        
        if savedata
            save ./LoadAnalysis/loadanalysis_frontdata.mat best_elements
        end
    end
end

function [] = la_analize_data()
    
     % CONTROL SIGNALS
     param = init_param([]);
     param = gen_sig(param,6);
     param.stoptime = 34*10^-9;
     runspice(param)
    
    f = plot_controlsig({'sel_sl','sel_pulldown','sel_load','wl_2','bl_bias'},[8.1 16.1],[],'./LoadAnalysis/spice/load_analysis.raw/ana.tran')
    annotation(f,'rectangle',...
        [0.21273964131107 0.110642781875659 0.691947858688931 0.816649104320337],...
        'LineStyle','none',...
        'FaceAlpha',0.4,...
        'FaceColor',[1 0 0]);
    r = 150; % pixels per inch
    set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(gcf,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/controlsig1.png');

    f = plot_controlsig({'sel_sl','sel_pulldown','sel_load','wl_2','bl_bias'},[8.1 16.1],[],'./LoadAnalysis/spice/load_analysis.raw/ana.tran')
    annotation(f,'rectangle',...
        [0.129166666666667 0.110642781875659 0.0835729746444033 0.816649104320337],...
        'LineStyle','none',...
        'FaceAlpha',0.4,...
        'FaceColor',[1 0 0]); 
    annotation(f,'rectangle',...
        [0.318491032776747 0.110642781875659 0.586270871985159 0.8171875],'LineStyle','none',...
        'FaceAlpha',0.4,...
        'FaceColor',[1 0 0]);
    r = 150; % pixels per inch
    set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(gcf,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/controlsig2.png');
    
    f = plot_controlsig({'sel_sl','sel_pulldown','sel_load','wl_2','bl_bias'},[8.1 16.1],[],'./LoadAnalysis/spice/load_analysis.raw/ana.tran')
    annotation(f,'rectangle',...
        [0.128571428571429 0.110642781875659 0.1875 0.816649104320337],...
        'LineStyle','none',...
        'FaceAlpha',0.4,...
        'FaceColor',[1 0 0]);
    r = 150; % pixels per inch
    set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(gcf,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/controlsig3.png');

    % LA OBJECTIVES
     f = plot_controlsig({'bl_bias'},[9.5 16.1],[-0.1,0.5],'./LoadAnalysis/spice/load_analysis.raw/ana.tran')

    % LA SWEEP
    data = load('./LoadAnalysis/loadanalysis_alldata.mat');
    data = data.all_elements;
    f = plot_data(data,[],[],[]);
    r = 150; % pixels per inch
    set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/la_sweep.png');
    
%     f = plot_data_bytype(data,1,[0 0.2],[0 2.5e-9],[0.46 0.56])
%     r = 150; % pixels per inch
%     set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
%     print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/la_sweep_switch2.png');
%     f = plot_data_bytype(data,2,[0 0.35],[0.5 3]*1e-9,[0.25 0.6])
%     r = 150; % pixels per inch
%     set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
%     print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/la_sweep_bias2.png');
%     f = plot_data_bytype(data,3,[0.05 0.11],[4 11]*1e-10,[0.14 0.26])
%     r = 150; % pixels per inch
%     set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
%     print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/la_sweep_diode2.png');
%     f = plot_data_bytype(data,4,[0 0.3],[0 3]*1e-9,[0.35 0.55])
%     r = 150; % pixels per inch
%     set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
%     print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/la_sweep_bulk2.png');
%     plot_highlight(data(find(data(:,1) == 4),:),2)
% 
%     data = load('./LoadAnalysis/loadanalysis_frontdata.mat');
%     data = data.best_elements;
%     f = plot_data(data,[],[],[]);
%     r = 150; % pixels per inch
%     set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
%     print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/la_pareto.png');

    
end

function [fig] = plot_data_bytype(elements,type,xlimits,ylimits1,ylimits2)
    elementstype = elements(find(elements(:,1) == type),:);
    fig = plot_data(elementstype,xlimits,ylimits1,ylimits2);
end

function [fig1] = plot_data(elements,xlimits,ylimits1,ylimits2)
    show_3d = 0;
    c = [[139/255,0,139/255];[0,0,255/255];[50/255,205/255,50/255];[255/255,0,0]]; %color
    s = 5e15;
    
    ia = find(elements(:,1)==1);
    ib = find(elements(:,1)==2);
    ic = find(elements(:,1)==3);
    id = find(elements(:,1)==4);
    elements(:,end+1:end+3) = repmat([1,0,0],length(elements),1);
    elements(ia,end-2:end) = repmat(c(1,:),length(ia),1);
    elements(ib,end-2:end) = repmat(c(2,:),length(ib),1);
    elements(ic,end-2:end) = repmat(c(3,:),length(ic),1);
    elements(id,end-2:end) = repmat(c(4,:),length(id),1);
    
    
    
    fig1 = figure
    sh(1) = subplot(2,1,1)
    hold on
    a = scatter(elements(ia,5),elements(ia,6),elements(ia,8)*s,elements(ia,end-2:end));
    b = scatter(elements(ib,5),elements(ib,6),elements(ib,8)*s,elements(ib,end-2:end));
    c = scatter(elements(ic,5),elements(ic,6),elements(ic,8)*s,elements(ic,end-2:end));
    d = scatter(elements(id,5),elements(id,6),elements(id,8)*s,elements(id,end-2:end));
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
    ylabel('DELAY (ns)','FontSize', 12,'FontWeight','bold')
    if xlimits
        xlim(xlimits)
    else
        xlim([0,0.4])
    end
    if ylimits1
        ylim(ylimits1)
    else
        ylim([0,3e-9])
    end
    legend([a,b,c,d],'Switch Load','Bias Load','Diode Load','Bulk Load')
    
    
    sh(2) = subplot(2,1,2)
    hold on
    e = scatter(elements(ia,5),elements(ia,7),elements(ia,8)*s,elements(ia,end-2:end));
    f = scatter(elements(ib,5),elements(ib,7),elements(ib,8)*s,elements(ib,end-2:end));
    g = scatter(elements(ic,5),elements(ic,7),elements(ic,8)*s,elements(ic,end-2:end));
    h = scatter(elements(id,5),elements(id,7),elements(id,8)*s,elements(id,end-2:end));
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
    ylabel('MEMORY ELEMENT VOLTAGE DROP (V)','FontSize', 12,'FontWeight','bold')
    if xlimits
        xlim(xlimits)
    else
        xlim([0,0.4])
    end
    if ylimits2
        ylim(ylimits2)
    else
        ylim([0,0.7])
    end
    legend([a,b,c,d],'Switch Load','Bias Load','Diode Load','Bulk Load')
    
end

function [data] = plot_highlight(elements,highlight)
    s = 5e15;
    
    max_highlight = max(elements(:,highlight));
    
    fig1 = figure
    sh(1) = subplot(2,1,1)
    hold on
    a = scatter(elements(:,5),elements(:,6),elements(:,8)*s,elements(:,highlight)/max_highlight);
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
    ylabel('DELAY (ns)','FontSize', 12,'FontWeight','bold')
    xlim([0,0.4])
    ylim([0,3e-9])
    colorbar
    
    
    sh(2) = subplot(2,1,2)
    hold on
    b = scatter(elements(:,5),elements(:,7),elements(:,8)*s,elements(:,highlight)/max_highlight);
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
    ylabel('CELL VOLTAGE DROP (V)','FontSize', 12,'FontWeight','bold')
    xlim([0,0.4])
    ylim([0,0.7])
    colorbar

    
end

function [f] = plot_controlsig(controlsignals,xlimits,ylimits,file)
    %controlsignals = cellstr(controlsignals);
    %'/tmp/s0211331-loadana/spice/ref_analysis.raw/ana.tran'
%     [sim tree] = readPsfAscii('./LoadAnalysis/spice/load_analysis.raw/ana.tran', '.*');
    [sim tree] = readPsfAscii(file, '.*');
    
    f = figure;
    
    for i=1:length(controlsignals)
        sig = sim.getSignal(controlsignals(i));
        sigx = sig.getXValues*10^9;
        sigy = sig.getYValues;
        
        sp(i) = subplot(length(controlsignals),1,i);
        plot(sigx,sigy)
        ylabel(controlsignals(i),'FontSize', 12,'FontWeight','bold','interpreter','none')
        if ylimits
            ylim(ylimits)
        else
            ylim([-0.1 1.1])
        end
        if xlimits
            xlim(xlimits)
        end
    end
    
    xlabel('time (ns)','FontSize', 12,'FontWeight','bold')
    
end

function [] = mc_run(elements,param,mc_runs,noplot,id,nb_id,startele)
    n = length(elements(:,1));
    n/nb_id;
    n_blok = round(n/nb_id);
    if id == nb_id
        n_start = (id-1)*n_blok+1;
        n_stop = n;
    else
        n_start = (id-1)*n_blok+1;
        n_stop = (id)*n_blok;
    end
    
    elements = elements(n_start:n_stop,:);
    
    param.simulationtype = 'mont';
    param.VtMismatch = 1;
    param.BMismatch = 0;
    param.mcruns = mc_runs;
    
    for i = startele:length(elements(:,1))
        disp(strjoin({'ELEMENT ',num2str(i),'OF THE',num2str(length(elements(:,1))),'OF BLOK',num2str(id)},' '))
        switch elements(i,1)
            case 1
                loadtype = 'switch';
                param.wswitchswitch = elements(i,2);
            case 2
                loadtype = 'bias';
                param.wswitchbias = elements(i,2);
                param.wbias = elements(i,3);
                param.vbias = elements(i,4);
            case 3
                loadtype = 'diode';
                param.wswitchdiode = elements(i,2);
                param.wdiode = elements(i,3);
            case 4
                loadtype = 'bulk';
                param.wswitchbulk = elements(i,2);
                param.wbulk = elements(i,3);
            otherwise
                loadtype = 1;
                error('unknown element type')
        end
        
        inputfile = 'load_analysis.m2s';
        
        [currentpath,~,~] = fileparts(which(mfilename));
        
        mat2spicepath = strcat(currentpath,'/',inputfile);
        spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
        
        mat2spice(mat2spicepath,spicepath,param)
        clear inputfile currentpath mat2spicepath spicepath
        
        % make Sim folders
                
        % Run spice
        system(strjoin({'mv ./LoadAnalysis/spice/load_analysis.sp /tmp/s0211331-loadana/spice/load_analysis.sp'},''));
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/load_analysis.sp'},''));
        
        for l=1:param.mcruns
            istr=num2str(l+1000);
            istr=istr(end-2:end);
            [sim, ~] = readPsfAscii(strcat('/tmp/s0211331-loadana/spice/load_analysis',num2str(id),'.raw/mc-',istr,'_ana.tran'), '.*');
            
            [b,tr,n] = gatherdata(sim,loadtype);
            b_all(l,:) = b;
            tr_all(l,:) = tr;
            n_all(l,:) = n;
        end
        element = elements(i,:);
       % save(strjoin({'./LoadAnalysis/mc_raw/loadanalysis_mc',num2str(id),'_',num2str(i),'.mat'},''),'b_all','tr_all','n_all','element')
    end
    
    if noplot
        % save(strjoin({'./LoadAnalysis/loadanalysis_mc',num2str(id),'.mat'},''),'b_all','tr_all','n_all','elements')
    else
        for i = 1:length(elements(:,1))
            switch elements(i,1)
                case 1
                    plotcaption = strcat('MC switch   Wswitch:',num2str(elements(i,2)));
                case 2
                    plotcaption = strcat('MC bias   Wswitch:',num2str(elements(i,2)),'     Wbias:',num2str(elements(i,3)),'     Vbias:',num2str(elements(i,4)));
                case 3
                    plotcaption = strcat('MC diode   Wswitch:',num2str(elements(i,2)),'     Wbias:',num2str(elements(i,3)));
                case 4
                    plotcaption = strcat('MC bulk   Wswitch:',num2str(elements(i,2)),'     Wbias:',num2str(elements(i,3)));
                otherwise
                    plotcaption = '';
                    error('unknown element type')
            end
            plotdata(b_all(i,:,:),tr_all(i,:,:),n_all(i,:,:),plotcaption)
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
        bh = [b(1,:,1),b(1,:,2)];
        bl = [b(1,:,3),b(1,:,4)];
        
        trh = [tr(1,:,1),tr(1,:,2)];
        trl = [tr(1,:,3),tr(1,:,4)];
        
        nh = bh-[n(1,:,1),n(1,:,2)];
        nl = bl-[n(1,:,3),n(1,:,4)];
        
        nbins = 10;
        
        figure
        subplot(3,1,1)
        title(plot_caption,'FontSize', 14,'FontWeight','bold');
        hold on
        h =  histfit(bh,nbins,'kernel')
        set(h(2),'color','r')
        delete(h(1))
        h =  histfit(bl,nbins,'kernel')
        set(h(2),'color','g')
        delete(h(1))
        xlabel('BITLINE VOLTAGE','FontSize', 10,'FontWeight','bold')
        subplot(3,1,2)
        hold on
        h =  histfit(trh,nbins,'kernel')
        set(h(2),'color','r')
        delete(h(1))
        h =  histfit(trl,nbins,'kernel')
        set(h(2),'color','g')
        delete(h(1))
        xlabel('RISETIME','FontSize', 10,'FontWeight','bold')
        subplot(3,1,3)
        hold on
        h =  histfit(nh,nbins,'kernel')
        set(h(2),'color','r')
        delete(h(1))
        h =  histfit(nl,nbins,'kernel')
        set(h(2),'color','g')
        delete(h(1))
        xlabel('VOLTAGE DROP R','FontSize', 10,'FontWeight','bold')
    end
    
end

function [] = mc_run_tripel(param,simulate,analyse)
    if simulate
        param.VtMismatch = 0;
        param.BMismatch = 0;
        param.enableMismatch = 0;
        param.wswitch = 150e-9;
        param.wbias = 300e-9;
        param.wbias2 = 500e-9;
        param.mcruns = 1
        param.wsl = 100e-9;
        calcelement();

        
        disp('========================================================')
        disp('  ')
        disp('SIM FINISHED')
        disp('  ')
        disp('========================================================')
    end
    
    if analyse
        data = load('./LoadAnalysis/triple_allmismatch');
        b_all = data.b_all;
        b_memhigh = [b_all(:,1);b_all(:,2)];
        b_memlow = [b_all(:,3);b_all(:,4)];
        b_refall = data.b_refall;
        b_ref = [b_refall(:,1);b_refall(:,2);b_refall(:,3);b_refall(:,4)];
        
        x = [0:0.001:1];
        p_b_memhigh = fitdist(b_memhigh(:),'Normal');
        p_b_memlow = fitdist(b_memlow(:),'Normal');
        p_b_ref = fitdist(b_ref(:),'Normal');
        
        cdf_blow = cdf(p_b_memhigh,x);
        [y i1] = min(abs(cdf_blow-0.001));
        cdf_blow = cdf(p_b_memlow,x);
        [y i2] = min(abs(cdf_blow-0.999));
        cdf_blow = cdf(p_b_ref,x);
        [y i3] = min(abs(cdf_blow-0.001));
        [y i4] = min(abs(cdf_blow-0.999));
        
        p_b_memhigh = fitdist(b_memhigh(:),'Kernel');
        p_b_memlow = fitdist(b_memlow(:),'Kernel');
        p_b_ref = fitdist(b_ref(:),'Kernel');        
        f1 = figure
        hold on
        plot(x,pdf(p_b_memhigh,x),'LineWidth',3);
        plot(x,pdf(p_b_memlow,x),'LineWidth',3);
        plot(x,pdf(p_b_ref,x),'LineWidth',3,'Color','r');
        xlabel('BITLINE VOLTAGE (V)','FontSize', 12,'FontWeight','bold')
    ylabel('PDF (V)','FontSize', 12,'FontWeight','bold')
        r = 150; % pixels per inch
         set(f1, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
         print(f1,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/bitline_distribution_tripel.png');
%         plot([x(i1),x(i1)],[0,4],'b','LineWidth',3)
%         plot([x(i2),x(i2)],[0,4],'b','LineWidth',3)
%         plot([x(i3),x(i3)],[0,4],'r','LineWidth',3)
%         plot([x(i4),x(i4)],[0,4],'r','LineWidth',3)
        
        figure
        hold on 
        hist(b_memhigh)
        hist(b_memlow)
        
        figure
        hist(b_ref)
    end
    
    function [] = calcelement()
        element = [150e-9,300e-9,500e-9];
        rng('shuffle');
        
        rndfilename = num2str(randi(1000000));
        
        % make Sim folders
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/LoadAnalysis/tripel_mc.m2s ~/Thesis-Design-of-RRam/Design/LoadAnalysis/',rndfilename,'.m2s'},''));
        system('rm -rf /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/spice');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');
        
        inputfile = strjoin({rndfilename,'.m2s'},'');
        
        [currentpath,~,~] = fileparts(which(mfilename));
        
        mat2spicepath = strcat(currentpath,'/',inputfile)
        spicepath = '../../../../../tmp/s0211331-loadana/spice/'
        
        mat2spice(mat2spicepath,spicepath,param)
        clear inputfile currentpath mat2spicepath spicepath
        
        
        
        % Run spice
        
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/',rndfilename,'.sp'},''));
        system(strjoin({'rm ~/Thesis-Design-of-RRam/Design/LoadAnalysis/',rndfilename,'.m2s'},''));
        
        for l=1:param.mcruns
            istr=num2str(l+1000);
            istr=istr(end-2:end);
            [sim, ~] = readPsfAscii(strjoin({'/tmp/s0211331-loadana/spice/',rndfilename,'.raw/mc-',istr,'_ana.tran'},''), '.*');
            
            [b,tr,n,bO,b00] = gatherdata(sim,'bias')
            b_all(l,:) = b;
            tr_all(l,:) = tr;
            n_all(l,:) = n;
            [b,tr,n,bO,b00] = gatherdata(sim,'ref');
            b_refall(l,:) = b;
            tr_refall(l,:) = tr;
            n_refall(l,:) = n;
            error('dfsdfsdf')
            save(strjoin({'./LoadAnalysis/triple_allmismatch'},''),'b_all','tr_all','n_all','b_refall','tr_refall','n_refall','element')
        end
        
        function [b,tr,n,bO,b00] = gatherdata(sim,branch)
            
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
            
             sig = sim.getSignal(strcat('blOO'));
            sigx = sig.getXValues*10^9;
            sigy = sig.getYValues;
            b00(1) = sigy(i_hl);
            b00(2) = sigy(i_lh);
            
             sig = sim.getSignal(strcat('bl0'));
            sigx = sig.getXValues*10^9;
            sigy = sig.getYValues;
            b0(1) = sigy(i_hl);
            b0(2) = sigy(i_lh);
            
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
    end
    
end

function [] = mc_run_length(param,simulate,analyse)
    if simulate
        param.VtMismatch = 1;
        param.BMismatch = 0;
       
        param.wswitch = 4*100e-9;%300e-9;
        param.lswitch = 4*195e-9;
        param.wsl = 1000e-9;
        param.lsl = 45e-9;
        param.mcruns = 200;
        
        calcelement();

        
        disp('========================================================')
        disp('  ')
        disp('SIM FINISHED')
        disp('  ')
        disp('========================================================')
    end
    
    if analyse
        data = load('./LoadAnalysis/length_100_195_allmismatch');
        b_all = data.b_all;
        n_all = data.n_all;
        b_memhigh = [b_all(:,1);b_all(:,2)];
        n_memhigh = [n_all(:,1);n_all(:,2)]
        b_memlow = [b_all(:,3);b_all(:,4)];
        b_refall = data.b_refall;
        b_ref = [b_refall(:,3);b_refall(:,4)];
            
        x = [0:0.001:1];
        p_b_memhigh = fitdist(b_memhigh(:),'Normal');
        p_b_memlow = fitdist(b_memlow(:),'Normal');
        p_b_ref = fitdist(b_ref(:),'Normal');
        
        cdf_blow = cdf(p_b_memhigh,x);
        [y i1] = min(abs(cdf_blow-0.001));
        cdf_blow = cdf(p_b_memlow,x);
        [y i2] = min(abs(cdf_blow-0.999));
        cdf_blow = cdf(p_b_ref,x);
        [y i3] = min(abs(cdf_blow-0.001));
        [y i4] = min(abs(cdf_blow-0.999));
        
                
        figure1 = figure;
        hold on
        plot(x,pdf(p_b_memhigh,x),'LineWidth',3);
        plot(x,pdf(p_b_memlow,x),'LineWidth',3);
        plot(x,pdf(p_b_ref,x),'LineWidth',3,'Color','r');
        
        plot([x(i1),x(i1)],[0,4],'b','LineWidth',3)
        plot([x(i2),x(i2)],[0,4],'b','LineWidth',3)
        plot([x(i3),x(i3)],[0,4],'r','LineWidth',3)
        plot([x(i4),x(i4)],[0,4],'r','LineWidth',3)
        plot([p_b_ref.mu,p_b_ref.mu],[0,4],'r','LineWidth',3)
        
        % Create textbox
%     annotation(figure1,'textbox',...
%         [0.511416666666667 0.13380788148074 0.028447742733457 0.0400593471810089],...
%         'Interpreter','none',...
%         'String',{num2str(p_b_ref.mu-x(i2))},...
%         'EdgeColor',[1 1 1],...
%         'LineWidth',2);
%     
%     % Create textbox
%     annotation(figure1,'textbox',...
%         [0.555375 0.135936437855871 0.028447742733457 0.0400593471810089],...
%         'Interpreter','none',...
%         'String',{num2str(x(i1)-p_b_ref.mu)},...
%         'EdgeColor',[1 1 1],...
%         'LineWidth',2);
        
%         figure
%         hold on 
%         hist(b_memhigh,50)
%         hist(b_memlow,50)
%         
%         figure
%         hist(b_ref,50)

        figure
        x = [0:0.001:1];
        norm = normpdf(x,p_b_memhigh.mu-p_b_ref.mu,sqrt(p_b_ref.sigma^2 + p_b_memhigh.sigma^2));
        plot(x,norm)
        normc = normcdf(x,p_b_memhigh.mu-p_b_ref.mu,sqrt(p_b_ref.sigma^2 + p_b_memhigh.sigma^2)) 
        [Y,I]=min(abs(normc-0.001))
        hold on 
        plot([x(I),x(I)],[0,5])
        
        figure
        
     end
    
    function [] = calcelement()
%         element = [param.wswitch,param.wbias,param.lswitch,param.lbias,param.mcruns];
        element = [param.wswitch,param.lswitch];
        rng('shuffle');
        
        rndfilename = num2str(randi(1000000));
        
        % make Sim folders
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/LoadAnalysis/length_mc2.m2s ~/Thesis-Design-of-RRam/Design/LoadAnalysis/',rndfilename,'.m2s'},''));
        system('rm -rf /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/spice');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');
        
        inputfile = strjoin({rndfilename,'.m2s'},'');
        
        [currentpath,~,~] = fileparts(which(mfilename));
        
        mat2spicepath = strcat(currentpath,'/',inputfile)
        spicepath = '../../../../../tmp/s0211331-loadana/spice/'
        
        mat2spice(mat2spicepath,spicepath,param)
        clear inputfile currentpath mat2spicepath spicepath
        
        
        
        % Run spice
        
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/',rndfilename,'.sp'},''));
        system(strjoin({'rm ~/Thesis-Design-of-RRam/Design/LoadAnalysis/',rndfilename,'.m2s'},''));
        
        for l=1:param.mcruns
            istr=num2str(l+1000);
            istr=istr(end-2:end);
            try
                echo off
            [sim, ~] = readPsfAscii(strjoin({'/tmp/s0211331-loadana/spice/',rndfilename,'.raw/mc-',istr,'_ana.tran'},''), '.*');
                echo on
            [b,tr,n] = gatherdata(sim,'bias');
            b_all(l,:) = b;
            tr_all(l,:) = tr;
            n_all(l,:) = n;
            [b,tr,n] = gatherdata(sim,'ref');
            b_refall(l,:) = b;
            tr_refall(l,:) = tr;
            n_refall(l,:) = n;
            
            save(strjoin({'./LoadAnalysis/length_100_195_allmismatch'},''),'b_all','tr_all','n_all','b_refall','tr_refall','n_refall','element')
            catch
                disp('boeee')
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
    end
    
end

function [] = mc_run_finalload(element,param,mc_runs,savename)
    param.simulationtype = 'mont';
    param.VtMismatch = 1;
    param.BMismatch = 0;
    param.mcruns = mc_runs;
    param.delta_Ip = 0;
    param.delta_Vp = 0;
    param.delta_Ip2 = 0;
    param.delta_Vp2 = 0;
    
    switch element(1)
        case 1
            loadtype = 'switch';
            param.wswitchswitch = element(2);
        case 2
            loadtype = 'bias';
            param.wswitchbias = element(2);
            param.wbias = element(3);
            param.vbias = element(4);
        case 3
            loadtype = 'diode';
            param.wswitchdiode = element(2);
            param.wdiode = element(3);
        case 4
            loadtype = 'bulk';
            param.wswitchbulk = element(2);
            param.wbulk = element(3);
        otherwise
            loadtype = 1;
            error('unknown element type')
    end
       
    inputfile = 'final_load_analysis.m2s';
    
    [currentpath,~,~] = fileparts(which(mfilename));
    
    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
    
    mat2spice(mat2spicepath,spicepath,param)
    clear inputfile currentpath mat2spicepath spicepath
    
    if strcmp(param.fullmcsim,'yes')
        % make Sim folders
        system('rm -rf /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/spice');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');


        % Run spice
        system(strjoin({'mv ./LoadAnalysis/spice/final_load_analysis.sp /tmp/s0211331-loadana/spice/final_load_analysis.sp'},''));
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/final_load_analysis.sp'},''));

        for l=1:param.mcruns
            istr=num2str(l+1000);
            istr=istr(end-2:end);
            [sim, ~] = readPsfAscii(strcat('/tmp/s0211331-loadana/spice/final_load_analysis.raw/mc-',istr,'_ana.tran'), '.*');

            [b,tr,n] = gatherdata(sim,loadtype);
            b_all(l,:) = b;
            tr_all(l,:) = tr;
            n_all(l,:) = n;
            [b,tr,n] = gatherdata(sim,'ref');
            b_refall(l,:) = b;
            tr_refall(l,:) = tr;
            n_refall(l,:) = n;
        end
        b_all = [b_all(:,1),b_all(:,3);b_all(:,2),b_all(:,4)];
        tr_all = [tr_all(:,1),tr_all(:,3);tr_all(:,2),tr_all(:,4)];
        n_all = [n_all(:,1),n_all(:,3);n_all(:,2),n_all(:,4)];

        b_refall = [b_refall(:,1);b_refall(:,2)];
        tr_refall = [tr_refall(:,1);tr_refall(:,2)];
        n_refall = [n_refall(:,1);n_refall(:,2)];

        save(strjoin({'./LoadAnalysis/',savename},''),'b_all','tr_all','n_all','b_refall','tr_refall','n_refall','element')
    else
        
        param.mcruns = 50;
        for k=1:mc_runs
            AdVt_p = 2.5;    
            AdI_I0_p = 1.2;  
            sigma_LVT_Vt_p   = (( AdVt_p   /1000)/sqrt(2))*sqrt(1e-6*1e-6);
            sigma_LVT_I_I0_p = (( AdI_I0_p /100 )/sqrt(2))*sqrt(1e-6*1e-6);
            
            a=[4:0.02:6]*1e-9;
            b=[2:0.02:3]*1e-8;
            
            param.delta_Ip = normrnd(0,sigma_LVT_I_I0_p);%b(randi(4))*(-1)^randi(2);
            param.delta_Vp = normrnd(0,sigma_LVT_Vt_p);
            param.delta_Ip2 = normrnd(0,sigma_LVT_I_I0_p);
            param.delta_Vp2 = normrnd(0,sigma_LVT_Vt_p);
            
            inputfile = 'final_load_analysis.m2s';
    
            [currentpath,~,~] = fileparts(which(mfilename));

            mat2spicepath = strcat(currentpath,'/',inputfile);
            spicepath = strcat(strrep(currentpath,pwd,''),'/spice');

            mat2spice(mat2spicepath,spicepath,param)
            clear inputfile currentpath mat2spicepath spicepath
            
            % make Sim folders
            system('rm -rf /tmp/s0211331-loadana/');
            system('mkdir /tmp/s0211331-loadana/');
            system('mkdir /tmp/s0211331-loadana/spice');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
            system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');


            % Run spice
            system(strjoin({'mv ./LoadAnalysis/spice/final_load_analysis.sp /tmp/s0211331-loadana/spice/final_load_analysis.sp'},''));
            system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/final_load_analysis.sp'},''));

            for l=1:param.mcruns
                istr=num2str(l+1000);
                istr=istr(end-2:end);
                [sim, ~] = readPsfAscii(strcat('/tmp/s0211331-loadana/spice/final_load_analysis.raw/mc-',istr,'_ana.tran'), '.*');

                [b,tr,n] = gatherdata(sim,loadtype);
                b_all(l,:) = b;
                [b,tr,n] = gatherdata(sim,'ref');
                b_ref(l,:) = b;
            end
            dist_type = 'Normal';
            x = [0:0.005:1];
            b_high = fitdist([b_all(:,1);b_all(:,2)],dist_type);
            cdf_blow = cdf(b_high,x);
            [y i1] = min(abs(cdf_blow-0.001));
            
            b_min(k) = x(i1)
            
            x = [0:0.005:1];
            b_low = fitdist([b_all(:,3);b_all(:,4)],dist_type);
            cdf_blow = cdf(b_low,x);
            [y i1] = min(abs(cdf_blow-0.999));
            
            b_max(k) = x(i1)
            
            x = [0:0.005:1];
            b_refd = fitdist([b_ref(:,1);b_ref(:,2)],dist_type);
            cdf_blow = cdf(b_refd,x);
            [y i1] = min(abs(cdf_blow-0.001));
            [y i2] = min(abs(cdf_blow-0.999));
            
            b_refmin(k) = x(i1)
            b_refmax(k) = x(i2)
            
            vt1(k) = param.delta_Vp
            ip1(k) = param.delta_Ip
            vt2(k) = param.delta_Vp2
            ip2(k) = param.delta_Ip2
            
            
            save(strjoin({'./LoadAnalysis/',savename},''),'b_min','b_max','b_refmin','b_refmax','vt1','ip1','vt2','ip2','element')
        end
        save(strjoin({'./LoadAnalysis/',savename},''),'b_min','b_max','b_refmin','b_refmax','vt1','ip1','vt2','ip2','element')
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
    
    
end

function [] = mc_run_res(element,param,mc_runs)
    
    param.simulationtype = 'mres';
    param.VtMismatch = 1;
    param.BMismatch = 0;
    param.mcruns = mc_runs;
    
    switch element(1)
        case 1
            loadtype = 'switch';
            param.wswitchswitch = element(2);
        case 2
            loadtype = 'bias';
            param.wswitchbias = element(2);
            param.wbias = element(3);
            param.vbias = element(4);
        case 3
            loadtype = 'diode';
            param.wswitchdiode = element(2);
            param.wdiode = element(3);
        case 4
            loadtype = 'bulk';
            param.wswitchbulk = element(2);
            param.wbulk = element(3);
        otherwise
            loadtype = 1;
            error('unknown element type')
    end  
    
    inputfile = 'load_analysis.m2s';
    
    [currentpath,~,~] = fileparts(which(mfilename));
    
    mat2spicepath = strcat(currentpath,'/',inputfile);
    spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
    
    mat2spice(mat2spicepath,spicepath,param)
    clear inputfile currentpath mat2spicepath spicepath
    
    % Run spice
    %system(strjoin({'mv ./LoadAnalysis/spice/load_analysis.sp /tmp/s0211331-loadana/spice/load_analysis.sp'},''));
    %system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/load_analysis.sp'},''));
	system(strjoin({'spectre -64 +aps  -format psfascii ./LoadAnalysis/spice/load_analysis.sp'},''));
    
   % for l=1:param.mcruns
    %    istr=num2str(l+1000);
     %   istr=istr(end-2:end);
      %  [sim, ~] = readPsfAscii(strcat('/tmp/s0211331-loadana/spice/load_analysis.raw/mc-',istr,'_ana.tran'), '.*');
        
       % [b,tr,n] = gatherdata(sim,loadtype);
        %b_all(l,:) = b;
        %tr_all(l,:) = tr;
        
   % end
   % b_all = [b_all(:,1);b_all(:,2);b_all(:,3);b_all(:,4)];
   % tr_all = [tr_all(:,1);tr_all(:,2)];
   % save(strjoin({'./LoadAnalysis/loadanalysis_mcres.mat'},''),'b_all','tr_all','element')
    
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
    
end

function [] = mc_run_ref(element,param,mc_runs,refcellnb)
    
    param.simulationtype = 'mont';
    param.VtMismatch = 1;
    param.BMismatch = 0;
    param.mcruns = mc_runs;
    
    param.wswitchbias = element(2);
    param.wbias = element(3);
    param.vbias = element(4);
        
    param.senstime = 6;
    
    wave_sel_pulldown = makewave('vsel_pulldown',[0.1,0.8,1]*1e-9,[0,1,0]);
    wave_sel_load = makewave('vsel_load',[2,param.senstime]*1e-9,[1,0]);
    wave_sel_bias = makewave('vsel_bias',[1]*1e-9,[param.vbias]);
    wave_sel_bulk = makewave('vsel_bulk',[2,param.senstime]*1e-9,[1,0]);
    wave_sel_sl = makewave('vsel_sl',[1]*1e-9,[1]);
    
    %READ RHH
    wave_wl_1 = makewave('vwl_1',[2,param.senstime]*1e-9,[0,1]);
    wave_wl_2 = makewave('vwl_2',[1]*1e-9,[0]);
    
    
    wavegroup_read1 = makewavegroup('read1',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2]);
    
    %READ RHL
    wave_wl_1 = makewave('vwl_1',[1]*1e-9,[0]);
    wave_wl_2 = makewave('vwl_2',[2,param.senstime]*1e-9,[0,1]);
    
    wavegroup_read2 = makewavegroup('read2',[wave_sel_pulldown,wave_sel_load,wave_sel_bias,wave_sel_bulk,wave_sel_sl,wave_wl_1,wave_wl_2]);
    
    %make total waves
    allwaves = calcwaves([wavegroup_read1,wavegroup_read2]);
    
    param.wl_1 = allwaves.vwl_1;
    param.wl_2 = allwaves.vwl_2;
    
    param.sel_pulldown = allwaves.vsel_pulldown;
    param.sel_load = allwaves.vsel_load;
    param.sel_bias = allwaves.vsel_bias;
    param.sel_bulk = allwaves.vsel_bulk;
    param.sel_sl = allwaves.vsel_sl;
    
    for k = 1:refcellnb
        param.refnb = k;
    
        inputfile = 'ref_analysis.m2s';

        [currentpath,~,~] = fileparts(which(mfilename));

        mat2spicepath = strcat(currentpath,'/',inputfile);
        spicepath = strcat(strrep(currentpath,pwd,''),'/spice');

        mat2spice(mat2spicepath,spicepath,param)
        clear inputfile currentpath mat2spicepath spicepath

        % make Sim folders
        system('rm -rf /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/');
        system('mkdir /tmp/s0211331-loadana/spice');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/s0211331-loadana/spice/');
        system('cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/s0211331-loadana/spice/');

        % Run spice
        system(strjoin({'mv ./LoadAnalysis/spice/ref_analysis.sp /tmp/s0211331-loadana/spice/ref_analysis.sp'},''));
        system(strjoin({'spectre -64 +aps  -format psfascii /tmp/s0211331-loadana/spice/ref_analysis.sp'},''));

        for l=1:param.mcruns
            istr=num2str(l+1000);
            istr=istr(end-2:end);
            [sim, ~] = readPsfAscii(strcat('/tmp/s0211331-loadana/spice/ref_analysis.raw/mc-',istr,'_ana.tran'), '.*');

            [b,tr] = gatherdata(sim,'bias');
            b_all(l,:) = b;
            tr_all(l,:) = tr;

        end
        b_all = [b_all(:,1);b_all(:,2)];
        save(strjoin({'./LoadAnalysis/mc_ref/loadanalysis_mcref',num2str(k),'.mat'},''),'b_all','tr_all','element')
        clear b_all tr_all
    end
    
    function [b,tr,n] = gatherdata(sim,branch)
        
        sig = sim.getSignal(strcat('bl_',branch));
        sigx = sig.getXValues*10^9;
        sigy = sig.getYValues;
        
        ts_hh = 2;
        ts_hl = 10;
                
        t_hh = 8;
        t_hl = 16;
        
        
        [Y, i_hh] = min(abs(sigx - t_hh));
        [Y, i_hl] = min(abs(sigx - t_hl));
        
        
        [Y, l_hh] = min(abs(sigx - ts_hh));
        [Y, l_hl] = min(abs(sigx - ts_hl));
        
        
        b_hh = sigy(i_hh);
        b_hl = sigy(i_hl);
        
        
        st_limit = 0.1;
        
        [Y, k_hh] = min(abs(sigy(l_hh:i_hh) - (b_hh-b_hh*st_limit)));
        [Y, k_hl] = min(abs(sigy(l_hl:i_hl) - (b_hl-b_hl*st_limit)));
        
        
        tst_hh = sigx(k_hh+l_hh);
        tst_hl = sigx(k_hl+l_hl);
        
        
        tr_hh = (tst_hh - ts_hh)*10^-9;
        tr_hl = (tst_hl - ts_hl)*10^-9;
        
        b = [b_hh,b_hl];
        tr = [tr_hh,tr_hl];
        
    end
    
end

function [] = mc_process_data()
    for i = 1:1681
        data = load(strjoin({'./LoadAnalysis/mc_raw/loadanalysis_mc',num2str(i),'.mat'},''));
        element(i,1:8) = data.element;
        n(:,1) = [data.n_all(:,1);data.n_all(:,2)];
        n(:,2) = [data.n_all(:,3);data.n_all(:,4)];
        b(:,1) = [data.b_all(:,1);data.b_all(:,2)];
        b(:,2) = [data.b_all(:,3);data.b_all(:,4)];
        tr(:,1) = [data.tr_all(:,1);data.tr_all(:,2)];
        tr(:,2) = [data.tr_all(:,3);data.tr_all(:,4)];
        
        element(i,7) = mean(b(:,1)-n(:,1));
        
        x = [0:0.005:1];
        dist_type = 'LogNormal';
        
        p1 = fitdist(b(:,1),dist_type);
        cdf_blow = cdf(p1,x);
        [y i1] = min(abs(cdf_blow-0.001));
        [y b1] = min(abs(cdf_blow-0.5));
        
        p2 = fitdist(b(:,2),dist_type);
        cdf_blow = cdf(p2,x);
        [y i2] = min(abs(cdf_blow-0.999));
        [y b2] = min(abs(cdf_blow-0.5));
        
        %         figure
        %         hold on
        %         plot(x,cdf(p1,x))
        %         plot([x(i1),x(i1)],[0,1],'r')
        %         plot(x,cdf(p2,x))
        %         plot([x(i2),x(i2)],[0,1],'g')
        
        
        %         figure
        %         hold on
        %         plot(x,pdf(p1,x))
        %         plot([x(i1),x(i1)],[0,1],'r')
        %         plot(x,pdf(p2,x))
        %         plot([x(i2),x(i2)],[0,1],'g')
        
        element(i,5) = x(b1)-x(b2); %9
        element(i,9) = x(i1)-x(i2); %9
        element(i,10) = p1.sigma; %10
        element(i,11) = p2.sigma; %11
        
        dist_type = 'LogNormal';
        x = 0:1e-12:6e-9;
        
        p1 = fitdist(tr(:,1),dist_type);
        p2 = fitdist(tr(:,2),dist_type);
        p3 = fitdist([tr(:,2);tr(:,1)],dist_type);
        cdf_tr = cdf(p3,x);
        [y i3] = min(abs(cdf_tr-0.999));
        [y i4] = min(abs(cdf_tr-0.5));
        
        %         figure
        %         hold on
        %         plot(x,pdf(p1,x))
        %         plot(x,pdf(p2,x))
        %         plot(x,pdf(p3,x),'r')
        %         plot([x(i3),x(i3)],[0,1e9],'g')
        
        element(i,12) = x(i3); %12
        element(i,6) = x(i4); %
        
        
    end
    
    allmcdata = element;
    save('./LoadAnalysis/loadanalysis_allmcdata.mat','allmcdata')
end

function [] = mc_reduce_data()
    
    data = load('./LoadAnalysis/loadanalysis_allmcdata.mat');
    disp(strjoin({'START WITH',num2str(length(data.allmcdata(:,1))),'ELEMENTS'},' '))
    best_elements = sort_data1(data.allmcdata);
    disp(strjoin({'REDUCED TO',num2str(length(best_elements(:,1))),'ELEMENTS'},' '))
    best_elements = sort_data2(best_elements,1);
    disp(strjoin({'ENDED WITH',num2str(length(best_elements(:,1))),'ELEMENTS'},' '))
    %     plot_mcdata(best_elements)
    
    function [best_elements] = sort_data1(y)
        x=y;
        %plot_data(x)
        x(:,5) = x(:,5)*-1;
        
        x = x(:,5:8);
        
        N=size(y,1);
        f = zeros(N,1);
        
        
        front=1;
        elements = N;
        while (elements > 0)
            for i=1:N
                flag = 0;
                if f(i)==0
                    rowi = x(i,:);
                    for j=1:N
                        if( (i ~= j) & ( (f(j) == 0 ) | (f(j) == front ) ) )
                            rowj = x(j,:);
                            
                            if( all(rowj-rowi <= 0) )
                                if(all(rowj-rowi ~= 0))
                                    flag = 1;
                                    break;
                                end
                            end
                            
                        end
                    end
                    
                    if(flag == 0)
                        f(i) = front;
                        elements = elements - 1;
                    end
                    
                end
            end
            front=front+1;
        end
        
        best_elements = y(find(f==1),:);
        
    end
    
    function [best_elements] = sort_data2(x,savedata)
        x(:,9) = x(:,9)*-1;
        
        N = size(x,1);
        
        M = 4;
        V = 8;
        
        x(:,V+M+1) = ones(N,1);
        
        [c2,ia,ic] = unique(x(:,V+1:V+M),'rows');
        x = x(ia,:);
        
        out_of_fronts = 0;
        front = 1;
        while out_of_fronts == 0
            x_index = find(x(:,V+M+1) == front);
            N_new = size(x_index,1);
            
            if isempty(x_index)
                out_of_fronts = 1;
            else
                for i = 1:N_new
                    continu = 1;
                    x_index_temp = x_index;
                    x_index_temp(i) = [];
                    x_temp = x(x_index_temp,:);
                    k = 0;
                    while k < M && continu
                        k=k+1;
                        f = x(x_index(i),V+k);
                        x_temp = x_temp(find(x_temp(:,V+k) <= f),:);
                        if isempty(x_temp)
                            continu = 0;
                        elseif k == M
                            x(x_index(i),V+M+1) = front + 1;
                        end
                    end
                end
            end
            front = front+1;
        end
        x(:,9) = x(:,9)*-1;
        
        %find(x(:,9)>0.08)
        %x = x(find(x(:,9)>0.08),:)
        
        best_elements = x(find(x(:,(V+M+1))==1),1:V+M);
        
        
        if savedata
            save ./LoadAnalysis/loadanalysis_frontdatamc.mat best_elements
        end
    end
    
end

function [] = mc_contourplot(plotmcelements,figurenb)
    figure(figurenb)
    
    for k = 1:length(plotmcelements(:,1))
        data = find_element(plotmcelements(k,:));
        load_type = data.element(1,1);
        n = [data.b_all(:,1)-data.n_all(:,1);data.b_all(:,2)-data.n_all(:,2);0;0.7];
        b = [(data.b_all(:,1)-data.b_all(:,3));(data.b_all(:,2)-data.b_all(:,4));0;0.4];
        tr = [(data.tr_all(:,1)+data.tr_all(:,3))/2;(data.tr_all(:,2)+data.tr_all(:,4))/2;0;3e-9];
        
        xbin1=40;
        x1=[min(b):(max(b)-min(b))/xbin1:max(b)-(max(b)-min(b))/xbin1];
        ybin1=xbin1;
        y1=[min(tr):(max(tr)-min(tr))/ybin1:max(tr)-(max(tr)-min(tr))/ybin1];
        z1=hist3([b,tr],[xbin1,ybin1]);
        z1(1,1) = 0;
        z1(end,end) = 0;
        z1 = (load_type-1)*100+(100*z1/max(max(z1)));
        
        
        t = [99:-1:0]'/99; %load Switch
        r = ones(length(t),1).*t;
        g = ones(length(t),1).*t;
        bw = ones(length(t),1).*t;
        c1 = [r,g,bw];
        t = [99:-1:0]'/99; %load 2 Bias
        r = ones(length(t),1).*t;
        g = ones(length(t),1).*t;
        bw = ones(length(t),1);
        c2 = [r,g,bw];
        t = [99:-1:0]'/99; %load 3 Diode
        r = ones(length(t),1).*t;
        g = ones(length(t),1);
        bw = ones(length(t),1).*t;
        c3 = [r,g,bw];
        t = [99:-1:0]'/99; %load 4 Bulk
        r = ones(length(t),1);
        g = ones(length(t),1).*t;
        bw = ones(length(t),1).*t;
        c4 = [r,g,bw];
        colormap([c1;c2;c3;c4])
        
        hold on
        sh(1) = subplot(2,1,1);
        [c h] = contour(x1,y1,z1','Fill', 'on');
        set(h,'LineColor','none')
        hp = findobj(h,'Type','Patch');
        set(hp(end),'FaceAlpha',0);
        xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
        ylabel('DELAY (ns)','FontSize', 12,'FontWeight','bold')
        ylim([0 3e-9])
        xlim([0 0.4])
        
        xbin2=40;
        x2=[min(b):(max(b)-min(b))/xbin2:max(b)-(max(b)-min(b))/xbin2];
        ybin2=xbin2;
        y2=[min(n):(max(n)-min(n))/ybin1:max(n)-(max(n)-min(n))/ybin1];
        z2=hist3([b,n],[xbin2,ybin2]);
        z2(1,1) = 0;
        z2(end,end) = 0;
        z2 = (load_type-1)*100+(100*z2/max(max(z2)));
        
        hold on
        sh(2) = subplot(2,1,2);
        [c h] = contour(x2,y2,z2','Fill', 'on');
        set(h,'LineColor','none')
        hp = findobj(h,'Type','Patch');
        set(hp(end),'FaceAlpha',0);
        xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
        ylabel('CELL VOLTAGE DROP (V)','FontSize', 12,'FontWeight','bold')
        ylim([0 0.7])
        xlim([0 0.4])
        
        clear n b tr
    end
    sh(1) = subplot(2,1,1);
    legend('Bias Load','Switch Load','Diode Load','Bulk Load')
    
%     annotation_pinned('rectangle',[0 0 0.08 3e-9],'FaceAlpha',0.5,'FaceColor',[1 0 0.2],'Color','none','axes',sh(1));
%     annotation_pinned('rectangle',[0 0 0.08 0.7],'FaceAlpha',0.5,'FaceColor',[1 0 0.2],'Color','none','axes',sh(2));
    
    function [data] = find_element(element)
        data = load('./LoadAnalysis/loadanalysis_allmcdata.mat');
        allmcdata = data.allmcdata;
        allmcdata(isnan(allmcdata))=1000;
        element(isnan(element))=1000;
        i = strmatch(element(1,1:4),allmcdata(:,1:4));
        data = load(strjoin({'./LoadAnalysis/mc_raw/loadanalysis_mc',num2str(i),'.mat'},''));
    end
    
end

function [] = mc_pointplot(elements,figurenb)
    show_3d = 0;
    c = [[0,0,0];[0,0,255/255];[50/255,205/255,50/255];[255/255,0,0]]; %color
    s = 5e15;
    
    ia = find(elements(:,1)==1);
    ib = find(elements(:,1)==2);
    ic = find(elements(:,1)==3);
    id = find(elements(:,1)==4);
    elements(:,end+1:end+3) = repmat([1,0,0],length(elements(:,1)),1);
    elements(ia,end-2:end) = repmat(c(1,:),length(ia),1);
    elements(ib,end-2:end) = repmat(c(2,:),length(ib),1);
    elements(ic,end-2:end) = repmat(c(3,:),length(ic),1);
    elements(id,end-2:end) = repmat(c(4,:),length(id),1);
    
    
    
    fig1 = figure(figurenb);
    sh(1) = subplot(2,1,1);
    hold on
    a = scatter(elements(ia,5),elements(ia,6),elements(ia,8)*s,elements(ia,end-2:end));
    b = scatter(elements(ib,5),elements(ib,6),elements(ib,8)*s,elements(ib,end-2:end));
    c = scatter(elements(ic,5),elements(ic,6),elements(ic,8)*s,elements(ic,end-2:end));
    d = scatter(elements(id,5),elements(id,6),elements(id,8)*s,elements(id,end-2:end));
    ylim([0 3e-9])
    xlim([0 0.4])
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
    ylabel('DELAY (ns)','FontSize', 12,'FontWeight','bold')
    legend([a,b,c,d],'Switch Load','Bias Load','Diode Load','Bulk Load')
    
    sh(2) = subplot(2,1,2);
    hold on
    e = scatter(elements(ia,5),elements(ia,7),elements(ia,8)*s,elements(ia,end-2:end));
    f = scatter(elements(ib,5),elements(ib,7),elements(ib,8)*s,elements(ib,end-2:end));
    g = scatter(elements(ic,5),elements(ic,7),elements(ic,8)*s,elements(ic,end-2:end));
    h = scatter(elements(id,5),elements(id,7),elements(id,8)*s,elements(id,end-2:end));
    ylim([0 0.7])
    xlim([0 0.4])
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 12,'FontWeight','bold')
    ylabel('CELL VOLTAGE DROP (V)','FontSize', 12,'FontWeight','bold')
    legend([a,b,c,d],'Switch Load','Bias Load','Diode Load','Bulk Load')
    
%     annotation_pinned('rectangle',[0 0 0.08 3e-9],'FaceAlpha',0.5,'FaceColor',[1 0 0.2],'Color','none','axes',sh(1));
%     annotation_pinned('rectangle',[0 0 0.08 0.7],'FaceAlpha',0.5,'FaceColor',[1 0 0.2],'Color','none','axes',sh(2));
%     
    data = [];
    
    if show_3d
        figure
        scatter3(elements(:,5),elements(:,6),elements(:,7),s,elements(:,1))
        %plot3(elements(:,5),elements(:,6),elements(:,7))
        xlabel('BL VOLTAGE DIFF','FontSize', 10,'FontWeight','bold')
        ylabel('DELAY','FontSize', 10,'FontWeight','bold')
        zlabel('CELL VOLTAGE DIFF','FontSize', 10,'FontWeight','bold')
    end
    
end

function [] = mc_distributionplot(element,figurenb1,figurenb2)
      
    
    data = find_element(element)
    
    n(:,1) = [data.n_all(:,1);data.n_all(:,2)];
    n(:,2) = [data.n_all(:,3);data.n_all(:,4)];
    b(:,1) = [data.b_all(:,1);data.b_all(:,2)];
    b(:,2) = [data.b_all(:,3);data.b_all(:,4)];
    tr(:,1) = [data.tr_all(:,1);data.tr_all(:,2)];
    tr(:,2) = [data.tr_all(:,3);data.tr_all(:,4)];
        
    x = [0:0.005:1];
    dist_type = 'LogNormal';
    
    p1 = fitdist(b(:,1),dist_type);
    cdf_blow = cdf(p1,x);
    [y i1] = min(abs(cdf_blow-0.001));
    [y b1] = min(abs(cdf_blow-0.5));
    
    p2 = fitdist(b(:,2),dist_type);
    cdf_blow = cdf(p2,x);
    [y i2] = min(abs(cdf_blow-0.999));
    [y b2] = min(abs(cdf_blow-0.5));
    
    figure(figurenb1)
    hold on
    plot(x,pdf(p1,x),'LineWidth',3)
    plot([x(i1),x(i1)],[0,6],'r','LineWidth',3)
    plot(x,pdf(p2,x),'LineWidth',3)
    plot([x(i2),x(i2)],[0,6],'r','LineWidth',3)
    xlabel('Bitline Voltage (V)','FontSize',  12,'FontWeight','bold')
    ylabel('PDF','FontSize', 12,'FontWeight','bold')
    
    
    dist_type = 'LogNormal';
    x = 0:1e-12:6e-9;
    
    p1 = fitdist(tr(:,1),dist_type);
    p2 = fitdist(tr(:,2),dist_type);
    p3 = fitdist([tr(:,2);tr(:,1)],dist_type);
    cdf_tr = cdf(p3,x);
    [y i3] = min(abs(cdf_tr-0.999));
    
    figure(figurenb2)
    hold on
    plot(x,pdf(p1,x),'LineWidth',3)
    plot(x,pdf(p2,x),'LineWidth',3)
    plot(x,pdf(p3,x),'Color',[0 0.7 0],'LineWidth',3)
    plot([x(i3),x(i3)],[0,1e9],'r','LineWidth',3)
    xlabel('Time (ns)','FontSize', 12,'FontWeight','bold')
    ylabel('PDF','FontSize', 12,'FontWeight','bold')
    
    function [data] = find_element(element)
        data = load('./LoadAnalysis/loadanalysis_allmcdata.mat');
        allmcdata = data.allmcdata;
        allmcdata(isnan(allmcdata))=1000;
        element(isnan(element))=1000;
        i = strmatch(element(1,1:4),allmcdata(:,1:4));
        data = load(strjoin({'./LoadAnalysis/mc_raw/loadanalysis_mc',num2str(i),'.mat'},''));
    end
end

function [] = mc_analize_data()
    warning off
    
    %DATA AFTER PARETO
    data = load('./LoadAnalysis/loadanalysis_frontdatamc.mat');
    elements_all = data.best_elements;
    f1 = figure
    mc_pointplot(elements_all,f1)
    r = 150; % pixels per inch
    set(f1, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(f1,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/mc_pareto.png');
    
    %DATA AFTER PARETO + select only bias load
    data = load('./LoadAnalysis/loadanalysis_frontdatamc.mat');
    elements_bias = data.best_elements;
    elements_bias = elements_bias(find(elements_bias(:,1)==2),:);
    elements_bias = elements_bias(find(elements_bias(:,4)==0),:);
    f2 = figure
    mc_pointplot(elements_bias,f2)
    r = 150; % pixels per inch
    set(f2, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(f2,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/mc_biasloads.png');
    
    %DATA TO SHOW MC AREA
    format long
    element_bias = elements_bias(2,:); %   2.000000000000000   0.000000100000000   0.000000180000000  0   0.250000000000000   0.000000001938000   0.351954746151612     0.000000000000013   0.080000000000000   0.058924686423743   0.089155067750199   0.000000003926000
    
    elements_switch = elements_all(find(elements_all(:,1)==1),:);
    element_switch = elements_switch(1,:); %    1.000000000000000   0.000000470000000                 NaN                 NaN   0.005000000000000   0.000000000338000   0.529134392938566   0.000000000000021  -0.020000000000000   0.003470326039140   0.004601011446407   0.000000000405000
    
    elements_diode = elements_all(find(elements_all(:,1)==3),:);
    element_diode = elements_diode(3,:); %      3.000000000000000   0.000000100000000   0.000000450000000                 NaN   0.090000000000000   0.000000000988000   0.203168794663963   0.000000000000025   0.035000000000000   0.029661952191271   0.042635627342392   0.000000001548000
    
    elements_bulk = elements_all(find(elements_all(:,1)==4),:)
    element_bulk = elements_bulk(2,:);  %       4.000000000000000   0.000000100000000   0.000000100000000                 NaN   0.205000000000000   0.000000001489000   0.337645639875065   0.000000000000009   0.060000000000000   0.055914956257906   0.068670809895980   0.00000000350900
    
    
    format short
    f3 = figure
    mc_contourplot([element_bias;element_switch;element_diode;element_bulk],f3)
    r = 150; % pixels per inch
    set(f3, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(f3,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/mc_spaceplot.png');
    
   f4 = figure
   f5 = figure
   mc_distributionplot(element_bias,f4,f5)
    
    data = load('./LoadAnalysis/loadanalysis_mcref.mat')
    x = [0:0.005:1];
    p = fitdist(data.b_all,'LogNormal')
    cdf_blow = cdf(p,x);
    [y i1] = min(abs(cdf_blow-0.001));
    [y i2] = min(abs(cdf_blow-0.999));
    
    r = 150; % pixels per inch
    set(f4, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 500]/r);
    print(f4,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/mc_objectives1.png');
    r = 150; % pixels per inch
    set(f5, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 500]/r);
    print(f5,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/mc_objectives2.png');
    
    figure(f4)
    hold on
    plot(x,pdf(p,x),'LineWidth',3,'Color',[0 0.7 0])
    plot([x(i1),x(i1)],[0,6],'Color',[0 0.4 0],'LineWidth',3)
    plot([x(i2),x(i2)],[0,6],'Color',[0 0.4 0],'LineWidth',3)
    xlim([0.1 0.7])
    r = 150; % pixels per inch
    set(f4, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 500]/r);
    print(f4,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/mc_finalload_bl.png');
    
end

function [] = mc_finalload(param)
    element = [2.000000000000000   0.000000100000000   0.000000180000000  0   0.250000000000000   0.000000001938000   0.351954746151612     0.000000000000013   0.080000000000000   0.058924686423743   0.089155067750199   0.000000003926000];
    param.fullmcsim = 'noo';
%     mc_run_finalload(element,param,500,'loadanalysis_mc_finalload.mat')
   
     data = load('./LoadAnalysis/loadanalysis_mc_finalload.mat');
     b_memhigh = data.b_min;
     b_memlow = data.b_max;
     b_refhigh = data.b_refmax;
     b_reflow = data.b_refmin;
     switch_vt = data.vt1;
     switch_i = data.ip1;
     bias_vt = data.vt2;
     bias_i = data.ip2;
     
%      x = [-1:0.005:1];
%     figure
%     p_diff_bl = fitdist(b_memhigh(:)-b_memlow(:),'Kernel');
%     plot(x,pdf(p_diff_bl,x),'LineWidth',3)
%     xlim([0,0.2])
%     xlabel('CDF(HRS)<0.001 - CDF(LRS)>0.999 (V)','FontSize', 12,'FontWeight','bold')
%     ylabel('PDF','FontSize', 12,'FontWeight','bold')
%     
%     figure
%     hold on
%     p_diff_bl = fitdist(b_memhigh(:)-b_refhigh(:),'Normal');
%     plot(x,pdf(p_diff_bl,x),'LineWidth',3)
%     area([-1:0.005:0],pdf(p_diff_bl,[-1:0.005:0]),'FaceColor','r')
%     xlim([-0.2,0.2])
%     xlabel('CDF(HRS)<0.001 - CDF(LRS)>0.999 (V)','FontSize', 12,'FontWeight','bold')
%     ylabel('PDF','FontSize', 12,'FontWeight','bold')
%     
%     figure
%     hold on
%     p_diff_bl = fitdist(b_reflow(:)-b_memlow(:),'Normal');
%     plot(x,pdf(p_diff_bl,x),'LineWidth',3)
%     area([-1:0.005:0],pdf(p_diff_bl,[-1:0.005:0]),'FaceColor','r')
%     xlim([-0.2,0.2])
%     xlabel('CDF(HRS)<0.001 - CDF(LRS)>0.999 (V)','FontSize', 12,'FontWeight','bold')
%     ylabel('PDF','FontSize', 12,'FontWeight','bold')
%     
%     i1 = find((b_memhigh(:)-b_refhigh(:))<0)
%     i2 = find((b_memhigh(:)-b_memlow(:))<0.1)
%     i3 = find((b_reflow(:)-b_memlow(:))<0)
    
    
    
    f1 = figure
    hold on
    [B, IX] = sort(b_memhigh)
    plot(b_refhigh(IX),'r')
    plot(b_reflow(IX),'r')
    plot(b_memhigh(IX))
    plot(b_memlow(IX))
    ylim([0.2,0.6])
    ylabel('BL voltage (V)','FontSize', 12,'FontWeight','bold')
    xlabel('SAMPLES','FontSize', 12,'FontWeight','bold')
    
    r = 150; % pixels per inch
    set(f1, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 500]/r);
    print(f1,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/fl_samples_blv.png');
    
    f2 = figure
    subplot(2,1,1)
    hold on
    [B, IX] = sort(b_memhigh)
    plot(b_memhigh(IX))
    plot(b_memlow(IX))
    ylim([0.2,0.6])
    ylabel('BL voltage (V)','FontSize', 12,'FontWeight','bold')
    xlabel('SAMPLES','FontSize', 12,'FontWeight','bold')
    subplot(2,1,2)
    plot(switch_vt(IX)./(sqrt(100e-9*45e-9)))
    ylabel('Vt mismatch voltage SWITCH (V)','FontSize', 12,'FontWeight','bold')
    xlabel('SAMPLES','FontSize', 12,'FontWeight','bold')
    
    r = 150; % pixels per inch
    set(f2, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(f2,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/fl_samples_blv2.png');

%     
%     x = 1:500;
%     p1 = 2.7403e-16
%     p2 = -4.2881e-13
%     p3 = 2.5664e-10
%     p4 = -7.1197e-08
%     p5 = 8.5495e-06
%     p6 = -6.5232e-05
%     p7 = 0.38017
    %     y = p1*x.^6 + p2*x.^5 + p3*x.^4 + p4*x.^3 + p5*x.^2 + p6*x + p7
%     plot(x,y,'g')
%     
%     p1 = -7.6044e-21
%     p2 = 1.555e-17
%     p3 = -1.2866e-14
%     p4 = 5.5018e-12
%     p5 = -1.2846e-09
%     p6 = 1.5919e-07
%     p7 = -9.7478e-06
%     p8 = 0.00045537
%     p9 = 0.31245
%     
%     y = p1*x.^8 + p2*x.^7 + p3*x.^6 + p4*x.^5 + p5*x.^4 + p6*x.^3 + p7*x.^2 + p8*x + p9
%     plot(x,y,'g')

    f3 = figure
    sp = 2
    subplot(sp,1,1)
    hold on
    [B, IX] = sort(b_refhigh-b_reflow)
    plot(b_memhigh(IX))
    plot(b_memlow(IX))
    plot(b_refhigh(IX),'r')
    plot(b_reflow(IX),'r')
    ylim([0.2,0.6])
    ylabel('BL voltage (V)','FontSize', 12,'FontWeight','bold')
    xlabel('SAMPLES','FontSize', 12,'FontWeight','bold')
    subplot(sp,1,2)
    plot(switch_vt(IX)./(sqrt(100e-9*45e-9)))
           
%     r = 150; % pixels per inch
%     set(f2, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
%     print(f2,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/fl_samples_blv2.png');

%% PLOT verband in mem
xst = 'switch_vt';
yst = 'bias_vt';
zst = 'b_memhigh';

x = switch_vt./(sqrt(100e-9*45e-9));
y = bias_vt./(sqrt(180e-9*45e-9));
z = b_memhigh
xlin = linspace(min(x),max(x),33);
ylin = linspace(min(y),max(y),33);
[X,Y] = meshgrid(xlin,ylin);
f = scatteredInterpolant(x',y',z');
Z = f(X,Y);

f1 = figure
subplot(3,3,1:6)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
subplot(3,3,7)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(0, 0);
subplot(3,3,8)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(90, 0);
subplot(3,3,9)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(0,90);

x = switch_vt./(sqrt(100e-9*45e-9));
y = bias_vt./(sqrt(180e-9*45e-9));
z = b_memlow
xlin = linspace(min(x),max(x),33);
ylin = linspace(min(y),max(y),33);
[X,Y] = meshgrid(xlin,ylin);
f = scatteredInterpolant(x',y',z');
Z = f(X,Y);

figure(f1)
hold on
subplot(3,3,1:6)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
subplot(3,3,7)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(0, 0);
subplot(3,3,8)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(90, 0);
subplot(3,3,9)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(90,90);

r = 150; % pixels per inch
set(f2, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
print(f1,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/fl_mem_distribution.png');

%% PLOT verband in ref
xst = 'switch_vt';
yst = 'bias_vt';
zst = 'b_refhigh,b_reflow ';

x = switch_vt./(sqrt(100e-9*45e-9));
y = bias_vt./(sqrt(180e-9*45e-9));
z = b_refhigh;
xlin = linspace(min(x),max(x),33);
ylin = linspace(min(y),max(y),33);
[X,Y] = meshgrid(xlin,ylin);
f = scatteredInterpolant(x',y',z');
Z = f(X,Y);

f1 = figure
subplot(3,3,1:6)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
subplot(3,3,7)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(0, 0);
subplot(3,3,8)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(90, 0);
subplot(3,3,9)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(0,90);

x = switch_vt./(sqrt(100e-9*45e-9));
y = bias_vt./(sqrt(180e-9*45e-9));
z = b_reflow;
xlin = linspace(min(x),max(x),33);
ylin = linspace(min(y),max(y),33);
[X,Y] = meshgrid(xlin,ylin);
f = scatteredInterpolant(x',y',z');
Z = f(X,Y);

figure(f1)
hold on
subplot(3,3,1:6)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
subplot(3,3,7)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(0, 0);
subplot(3,3,8)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(90, 0);
subplot(3,3,9)
mesh(X,Y,Z) %interpolated
axis tight; hold on
plot3(x,y,z,'.','MarkerSize',15) %nonuniform
xlim([-0.08,0.08])
ylim([-0.08,0.08])
xlabel(xst,'FontSize', 12,'FontWeight','bold','interpreter','none')
ylabel(yst,'FontSize', 12,'FontWeight','bold','interpreter','none')
zlabel(zst,'FontSize', 12,'FontWeight','bold','interpreter','none')
view(90,90);

r = 150; % pixels per inch
set(f2, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
print(f1,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/fl_ref_distribution.png');

end

function [] = mc_analize_ref()
   refcellnb = 18;
   
   f = figure;
   hold on
   l = refcellnb;
   cc = [[(1-(1/l)):-(1/l):0]',ones(l,1)*0,[0:(1/l):(1-(1/l))]'];
   for i = refcellnb:-1:1
       data = load(strjoin({'./LoadAnalysis/mc_ref/loadanalysis_mcref',num2str(i),'.mat'},''));
       b = data.b_all;
       
       x = [0.24:0.001:0.5];
       p_b = fitdist(b(:),'Normal');
       plot(x,pdf(p_b,x),'LineWidth',3,'Color',cc(i,:));
       xlim([0.25,0.5]);
       
       if i == refcellnb
          cdf_blow = cdf(p_b,x);
           [y i1] = min(abs(cdf_blow-0.999));
           [y i2] = min(abs(cdf_blow-0.001));
           plot([x(i1),x(i1)],[0,30],'b','LineWidth',3)
           plot([x(i2),x(i2)],[0,30],'b','LineWidth',3) 
           x(i2)-x(i1)
       end
   end
   cdf_blow = cdf(p_b,x);
   [y i1] = min(abs(cdf_blow-0.999));
   [y i2] = min(abs(cdf_blow-0.001));
   plot([x(i1),x(i1)],[0,30],'r','LineWidth',3)
   plot([x(i2),x(i2)],[0,30],'r','LineWidth',3)
   x(i2)-x(i1)
   ylabel('PDF','FontSize', 12,'FontWeight','bold')
   xlabel('BL voltage (V)','FontSize', 12,'FontWeight','bold')
   
   r = 150; % pixels per inch
   set(f, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 700]/r);
   print(f,'-dpng',sprintf('-r%d',r), './LoadAnalysis/fig/ref_distr.png');
end

function [] = find_unitbit_param(param,noplot)
    param.stoptime = 70*10^-9;
    
    Cunit = 0.18e-15;
    
    nb_cells = 2.^([1:15]);
    C = nb_cells*Cunit;
    
    % load settings
    param.wswitchswitch = 100e-9;
    param.wswitchbias = 100e-9;
    param.wswitchdiode = 100e-9;
    param.wswitchbulk = 100e-9;
    
    param.wbias = 100e-9;
    param.wdiode = 100e-9;
    param.wbulk = 100e-9;
    
    for i = 1:length(C)
        param.Cbl = C(i)
        
        runspice(param);
        
        [sim tree] = readPsfAscii('./LoadAnalysis/spice/load_analysis.raw/ana.tran', '.*');
        
        [b,tr] = gatherdata(sim,'switch');
        tr_switch(i) = mean(tr);
        e_switch(i) = C(i)*mean(b)^2;
        [b,tr] = gatherdata(sim,'bias');
        tr_bias(i) = mean(tr);
        e_bias(i) = C(i)*mean(b)^2;
        [b,tr] = gatherdata(sim,'diode');
        tr_diode(i) = mean(tr);
        e_diode(i) = C(i)*mean(b)^2;
        [b,tr] = gatherdata(sim,'bulk');
        tr_bulk(i) = mean(tr);
        e_bulk(i) = C(i)*mean(b)^2;
        
    end
    
    if noplot
        bit_delay = [nb_cells',tr_switch',tr_bias',tr_diode',tr_bulk'];
        save ./ArchitectureAnalysis/bitdelay.mat bit_delay
        bit_energy = [nb_cells',e_switch',e_bias',e_diode',e_bulk'];
        save ./ArchitectureAnalysis/bitenergy.mat bit_energy
    else
        figure
        plot(nb_cells,tr_switch)
        title('Delay ifv number of cells, load:switch','FontSize', 14,'FontWeight','bold');
        xlabel('number of cells','FontSize', 10,'FontWeight','bold')
        ylabel('avg delay','FontSize', 10,'FontWeight','bold')
        
        figure
        plot(nb_cells,tr_bias)
        title('Delay ifv number of cells, load:bias','FontSize', 14,'FontWeight','bold');
        xlabel('number of cells','FontSize', 10,'FontWeight','bold')
        ylabel('avg delay','FontSize', 10,'FontWeight','bold')
        
        figure
        plot(nb_cells,tr_diode)
        title('Delay ifv number of cells, load:diode','FontSize', 14,'FontWeight','bold');
        xlabel('number of cells','FontSize', 10,'FontWeight','bold')
        ylabel('avg delay','FontSize', 10,'FontWeight','bold')
        
        figure
        plot(nb_cells,tr_bulk)
        title('Delay ifv number of cells, load:bulk','FontSize', 14,'FontWeight','bold');
        xlabel('number of cells','FontSize', 10,'FontWeight','bold')
        ylabel('avg delay','FontSize', 10,'FontWeight','bold')
    end
    %TODO curve fit
    % vergeet in een (0,0) punt in te voegen
    
    function [b,tr] = gatherdata(sim,branch)
        
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
        
        b = [b_hh,b_hl,b_lh,b_ll];
        tr = [tr_hh,tr_hl,tr_lh,tr_ll];
        
    end
    
end

function [] = data_stats(elements)
    [nelements1,centers1] = hist(elements(:,1),[1,2,3,4]);
    [nelements2,centers2] = hist(elements(:,8));
    
    nb_plots = 2;
    figure
    subplot(nb_plots,1,1)
    bar(centers1,nelements1)
    set(gca,'XTickLabel',{'switch', 'bias', 'diode', 'bulk'})
    subplot(nb_plots,1,2)
    bar(centers2,nelements2)
    xlabel('area')
end
