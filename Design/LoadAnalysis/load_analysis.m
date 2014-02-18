function [] = load_analysis()
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SET PARAM
param = init_param([]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSIS
param = gen_sig(param,6);
%plot_controlsig({'sel_pulldown','sel_load','wl_3','bl_bulk'})
%plot_controlsig({'sel_pulldown','sel_load','wl_1','sel_sl'})
%plot_controlsig({'wl_1','wl_2','wl_3','wl_4'})
%plot_controlsig({'bl_switch'})

%iterate_size(100e-9,10e-9,500e-9,100e-9,10e-9,500e-9,0,0.1,1,param,1)

%data = reduce_data()
%  data = load('./LoadAnalysis/loadanalysis_alldata.mat');
%  data = data.all_elements
%  plot_data(data)
data = load('./LoadAnalysis/loadanalysis_frontdata.mat');
data = data.best_elements
% selecteddata = plot_data(data)
run_mc(data,param,200,1,19,20)



%find_unitbit_param(gen_sig(param,15),1)

%data_stats(data)

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
system('spectre -format psfascii ./LoadAnalysis/spice/load_analysis.sp');

end

function [param] = gen_sig(param,sensetime)
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
[sim tree] = readPsfAscii('./LoadAnalysis/spice/load_analysis.raw/ana.tran', '.*');

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
    
    param.wswitchswitch = k
    param.wswitchbias = k;
    param.wswitchdiode = k;
    param.wswitchbulk = k;

    i2=1;
    for p = wlstart:wlstep:wlstop
        param.wbias = p
        param.wdiode = p;
        param.wbulk = p;

        i3 = 1;
        for o = vstart:vstep:vstop
            param.vbias = o
            wave_sel_bias = makewave('vsel_bias',[2,param.senstime]*1e-9,[param.vbias,0]);
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
    save ./LoadAnalysis/loadanalysis1.mat ws wl v b_switch tr_switch n_switch b_bias tr_bias n_bias b_diode tr_diode n_diode b_bulk tr_bulk n_bulk
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

function [best_elements] = reduce_data()

%     all_elements = organize_data(1);
     data = load('./LoadAnalysis/loadanalysis_alldata.mat');
     best_elements = sort_data(data.all_elements,1)

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
        
        switch_elements = [ones(length(ws),1),ws',ones(length(ws),1)*nan,ones(length(ws),1)*nan,b_switch(:,2)-b_switch(:,3),tr_switch(:,4),b_switch(:,4)-n_switch(:,4),ws'*45e-9];
        
        bias_elements = [];
        for k = 1:length(wl)
            for l = 1:length(v)
                bias_elements = [bias_elements;[ones(length(ws),1)*2,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*v(l),b_bias(:,k,l,2)-b_bias(:,k,l,3),tr_bias(:,k,l,4),b_bias(:,k,l,4)-n_bias(:,k,l,4),(ws'+wl(k))*45e-9]];
            end
        end
        
        diode_elements = [];
        bulk_elements = [];
        for k = 1:length(wl)
            diode_elements = [diode_elements;[ones(length(ws),1)*3,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*nan,b_diode(:,k,2)-b_diode(:,k,3),tr_diode(:,k,4),b_diode(:,k,4)-n_diode(:,k,4),(ws'+wl(k))*45e-9]];
            bulk_elements = [bulk_elements;[ones(length(ws),1)*4,ws',ones(length(ws),1)*wl(k),ones(length(ws),1)*nan,b_bulk(:,k,2)-b_bulk(:,k,3),tr_bulk(:,k,4),b_bulk(:,k,4)-n_bulk(:,k,4),(ws'+wl(k))*45e-9]];
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

function [data] = plot_data(elements)
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
    
    
    
    fig1 = figure(1)
    sh(1) = subplot(2,1,1)
    hold on
    a = scatter(elements(ia,5),elements(ia,6),elements(ia,8)*s,elements(ia,end-2:end));
    b = scatter(elements(ib,5),elements(ib,6),elements(ib,8)*s,elements(ib,end-2:end));
    c = scatter(elements(ic,5),elements(ic,6),elements(ic,8)*s,elements(ic,end-2:end));
    d = scatter(elements(id,5),elements(id,6),elements(id,8)*s,elements(id,end-2:end));
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 10,'FontWeight','bold')
    ylabel('DELAY (ns)','FontSize', 10,'FontWeight','bold')
    legend([a,b,c,d],'Switch Load','Bias Load','Diode Load','Bulk Load')
   
    
    sh(2) = subplot(2,1,2)
    hold on
    e = scatter(elements(ia,5),elements(ia,7),elements(ia,8)*s,elements(ia,end-2:end));
    f = scatter(elements(ib,5),elements(ib,7),elements(ib,8)*s,elements(ib,end-2:end));
    g = scatter(elements(ic,5),elements(ic,7),elements(ic,8)*s,elements(ic,end-2:end));
    h = scatter(elements(id,5),elements(id,7),elements(id,8)*s,elements(id,end-2:end));
    xlabel('BL(hrs) - BL(lrs) (V)','FontSize', 10,'FontWeight','bold')
    ylabel('CELL VOLTAGE DROP (V)','FontSize', 10,'FontWeight','bold')
    legend([a,b,c,d],'Switch Load','Bias Load','Diode Load','Bulk Load')
    

     data = []
    
    if show_3d
        figure
        scatter3(elements(:,5),elements(:,6),elements(:,7),s,elements(:,1))
        %plot3(elements(:,5),elements(:,6),elements(:,7))
        xlabel('BL VOLTAGE DIFF','FontSize', 10,'FontWeight','bold')
        ylabel('DELAY','FontSize', 10,'FontWeight','bold')
        zlabel('CELL VOLTAGE DIFF','FontSize', 10,'FontWeight','bold')
    end
    
     dcm_obj = datacursormode(fig1);
     set(dcm_obj,'UpdateFcn',@myUpdateFcn1)
     set(dcm_obj, 'enable', 'on')
    
    function txt = myUpdateFcn1(dummy,event_obj)
        pos = get(event_obj,'Position');
        i = find(elements(:,5) == pos(1) & elements(:,6) == pos(2))
        elements(i,end-2:end) = [0.5,1,1];
        data(end+1,:) = elements(i,:)

        sh(2) = subplot(2,1,2)
        p = plot(elements(i,5),elements(i,7),'o')
        txt = {''};
    end
    
end

function [] = run_mc(elements,param,mc_runs,noplot,id,nb_id)
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


for i = 36:length(elements(:,1))
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

    % Run spice
    system(strjoin({'mv ./LoadAnalysis/spice/load_analysis.sp /tmp/s0211331-loadana/spice/load_analysis',num2str(id),'.sp'},''));
    system(strjoin({'spectre -format psfascii /tmp/s0211331-loadana/spice/load_analysis',num2str(id),'.sp'},''));
    
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
    save(strjoin({'./LoadAnalysis/mc_raw/loadanalysis_mc',num2str(id),'_',num2str(i),'.mat'},''),'b_all','tr_all','n_all','element')
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