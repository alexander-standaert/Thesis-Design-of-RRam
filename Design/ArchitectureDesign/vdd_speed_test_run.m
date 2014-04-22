function [] = vdd_speed_test_run(process_id,sim_name)
    %% MAIN function for the simulation
    % the simulation is done as follows:
    % 1) choose an unused occurance in the simulation space: this is one Vdd and
    %    one t instance : this done in the for loop
    % 2) generate the requiered control signals
    % 3) performs N monte carlo simulations, where only the output signal
    %    and the resistance values are saved
    % 4) read the spectre results of the mc simulations and determin is the
    %    Vdd/t occurance is a PASS or FAIL
    % 5) write the result under the write sim name
    % 6) go to step 1 and repeat until all occurances in the simulation
    %    space are done
    system(strjoin({'rm -rf ./ArchitectureDesign/vdd_speed_test/log/diary_log',num2str(process_id)},''))
    diary(strjoin({'./ArchitectureDesign/vdd_speed_test/log/diary_log',num2str(process_id)},''))
    data = load(strjoin({'./ArchitectureDesign/vdd_speed_test/input_',sim_name,'_',num2str(process_id),'.mat'},''));
    param = data.param;
    
    system('source /users/start2012/s0211331/Thesis-Design-of-RRam/Design/bashrc_thesis.rc')
    try
        system(strjoin({'mkdir ./ArchitectureDesign/vdd_speed_test/',param.sim_name,'/'},''));
    catch
        
    end
    
    for s = 1:size(param.simulation_space,1)
        param.debugon = 1
        vdd = param.simulation_space(s,1)
        t = param.simulation_space(s,2)
        [param] = generate_signals(param,t,vdd);
        
        param.RMEMvalue = 'RMEMHigh';
        param = run_simulation(param);
        [param] = evaluate_simulation(param,t,vdd,0);
        
        param.RMEMvalue = 'RMEMHigh';
        param = run_simulation(param);
        [param] = evaluate_simulation(param,t,vdd,1);
                
        store_simulation(param,t,vdd);
    end
        
    %% SIMULATION HELP FUNCTIONS
    
    function [param] = generate_signals(param,t,vdd)
        param.vdd = vdd;
        
        testvectorin = zeros(1,param.NoGB+log2(param.NoWLpB)+log2(param.NoBLpLB)+2);
        i=param.address;
        a=floor(i/(2*param.NoBLpLB*param.NoWLpB)); %set GB
        b=floor((i-a*(2*param.NoBLpLB*param.NoWLpB))/(param.NoBLpLB*param.NoWLpB)); %set LB
        c=floor((i-a*(2*param.NoBLpLB*param.NoWLpB)-b*(param.NoBLpLB*param.NoWLpB))/param.NoWLpB); %set BL
        d=i-a*(2*param.NoBLpLB*param.NoWLpB)-b*(param.NoBLpLB*param.NoWLpB)-c*param.NoWLpB; %set WL
        
        testvectorin(a+1)=1;
        testvectorin(param.NoGB+b+1)=1;
        cstr=dec2bin(c,log2(param.NoBLpLB));
        for k=1:log2(param.NoBLpLB)
            testvectorin(param.NoGB+2+log2(param.NoBLpLB)+1-k)=str2num(cstr(k));
        end
        dstr=dec2bin(d,log2(param.NoWLpB));
        for k=1:log2(param.NoWLpB)
            testvectorin(param.NoGB+2+log2(param.NoBLpLB)+log2(param.NoWLpB)+1-k)=str2num(dstr(k));
        end
        
        wavein = cell(param.NoGB+log2(param.NoWLpB)+log2(param.NoBLpLB)+2,1);
        for i=1:param.NoGB+log2(param.NoWLpB)+log2(param.NoBLpLB)+2
            wavetempgroup=[];
            wavetemp = makewave(strcat('wave',num2str(i)),[1,t*1e9+0.2,4]*1e-9,[0,testvectorin(i),0]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);      
            wave = calcwaves(wavetempgroup);
            wavein{i}=getfield(wave,strcat('wave',num2str(i)));
        end
        param.wavesin = wavein;
        
        wavetempgroup=[];
        for k=1
            wavetemp = makewave('samplehold',[1+t*1e9-param.thold*1e9,param.thold*1e9,1.5]*1e-9,[0,1,0]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        param.SA_SH=getfield(wave,'samplehold');
        for k=1
            wavetemp = makewave('enableSAN',[1+t*1e9,1.4]*1e-9,[0,1]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        param.en_SAN=getfield(wave,'enableSAN');
        for k=1
            wavetemp = makewave('enableSAP',[1+t*1e9,1.4]*1e-9,[1,0]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        param.en_SAP=getfield(wave,'enableSAP');
        
        param.randomizecells = 0;
        
    end

    function [param] = run_simulation(param)
        
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
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/cell.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/load.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/delay.sp /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/decoder.sp /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/decoder2.sp /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/senseamplifier.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/CMOSlogic.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/buffers_INVNOR.sp /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/buffers_WL.sp /tmp/',rnddirname,'/spice/'},''));
        
        spicepath = strjoin({'../../../../../tmp/',rnddirname,'/spice/'},'');
        [currentpath,~,~] = fileparts(which(mfilename));
        sp = param;
        
        inputfile = 'branch.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        inputfile = 'localblock.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        inputfile = 'globalblock.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        inputfile = 'SpiceFile.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        inputfile = 'parameters.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        inputfile = 'drivers.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        system(strjoin({'source ~/Thesis-Design-of-RRam/Design/bashrc_thesis.rc;spectre -64 +aps ',spicepath,'SpiceFile.sp'},''));
        clear inputfile currentpath mat2spicepath spicepath
        
    end

    function [param] = evaluate_simulation(param,t,vdd,appendparam)
        memout = zeros(param.numruns,1);
        membl = zeros(param.numruns,1);
        memhold = zeros(param.numruns,1);
        refbl = zeros(param.numruns,1);
        refhold = zeros(param.numruns,1);
        cellvalue = zeros(param.numruns,1);
        energy0 = zeros(param.numruns,1);
        energy1 = zeros(param.numruns,1);
        energy2 = zeros(param.numruns,1);
        energy3 = zeros(param.numruns,1);
        for k = 1:param.numruns
            istr=num2str(k+1000);
            istr=istr(end-2:end);
            [sim] = readPsfAscii(strjoin({'/tmp/',param.rnddirname,'/spice/SpiceFile.raw/mymc-',istr,'_mytran.tran'},''), '.*');
            
                        
            sig = sim.getSignal('InOut_0');
            sigx1 = sig.getXValues*10^9;
            sigy1 = sig.getYValues;
            [Y i] = min(abs(sigx1-(1+(t + param.t_checkout)*1e9)));
            simmemvalue = sigy1(i);
            memout(k) = simmemvalue;
            
            sig = sim.getSignal('xGB0.xLB0.BL_0');
            sigx2 = sig.getXValues*10^9;
            sigy2 = sig.getYValues;
            [Y i] = min(abs(sigx2-(1+t*1e9)));
            simblvalue = sigy2(i);
            membl(k) = simblvalue;
            
            sig = sim.getSignal('xGB0.BLout_0');
            sigx3 = sig.getXValues*10^9;
            sigy3 = sig.getYValues;
            [Y i] = min(abs(sigx3-(1+t*1e9)));
            simholdvalue = sigy3(i);
            memhold(k) = simholdvalue;
            
            sig = sim.getSignal('xGB0.xLB1.BL_0');
            sigx4 = sig.getXValues*10^9;
            sigy4 = sig.getYValues;
            [Y i] = min(abs(sigx4-(1+t*1e9)));
            simrefblvalue = sigy4(i);
            refbl(k) = simrefblvalue;
            
            sig = sim.getSignal('xGB0.BLout_1');
            sigx5 = sig.getXValues*10^9;
            sigy5 = sig.getYValues;
            [Y i] = min(abs(sigx5-(1+t*1e9)));
            simrefholdvalue = sigy5(i);
            refhold(k) = simrefholdvalue;
            
            sig = sim.getSignal('Vvdd_0:p');
            sigxi0 = sig.getXValues;
            sigyi0 = -1*sig.getYValues;
            energy0(k) = trapz(sigxi0,sigyi0*vdd);
                        
            sig = sim.getSignal('Vvdd_1:p');
            sigxi1 = sig.getXValues;
            sigyi1 = -1*sig.getYValues;
            energy1(k) = trapz(sigxi1,sigyi1*vdd);
            
            sig = sim.getSignal('Vvdd_2:p');
            sigxi2 = sig.getXValues;
            sigyi2 = -1*sig.getYValues;
            energy2(k) = trapz(sigxi2,sigyi2*vdd);
            
            sig = sim.getSignal('Vvdd_3:p');
            sigxi3 = sig.getXValues;
            sigyi3 = -1*sig.getYValues;
            energy3(k) = trapz(sigxi3,sigyi3*vdd);          
            
            

            if param.debugon
                sig = sim.getSignal('xGB0.xLB1.BL_1');
                sigx6 = sig.getXValues*10^9;
                sigy6 = sig.getYValues;
                close all    
                
                figure
                hold all
                plot(sigx1,sigy1)
                plot(sigx2,sigy2)
                plot(sigx3,sigy3)
                plot(sigx4,sigy4)
                plot(sigx5,sigy5)
                plot(sigx6,sigy6)
                plot([1,1],[-0.1,vdd],'r')
                plot([(1+(t)*1e9-param.thold*1e9),(1+(t)*1e9-param.thold*1e9)],[-0.1,vdd],'r')
                plot([(1+(t)*1e9),(1+(t)*1e9)],[-0.1,vdd],'r')
                plot([(1+(t + param.t_checkout)*1e9),(1+(t + param.t_checkout)*1e9)],[-0.1,vdd],'r')
                legend('out','membl','memhold','refbl_high','refhold','refbl_low','T:enabledecoder','T:enablehold','T:enableSA','T:checkout')
                
                figure 
                hold all
                plot(sigxi0,sigyi0)
                plot(sigxi1,sigyi1)
                plot(sigxi2,sigyi2)
                plot(sigxi3,sigyi3)
                legend('Ilogic','ISA','Imemarray','IBuffers')
                
                plotTiming(sim)
                 error('ssdfsdfsd')
            end
            
            if strcmp(param.RMEMvalue,'RMEMHigh')
                cellvalue(k) = 1;
            else
                cellvalue(k) = 0;
            end
               
        end
        
        if appendparam
            param.memout = [param.memout;memout];
            param.membl = [param.membl;membl];
            param.memhold = [param.memhold;memhold];
            param.refbl = [param.refbl;refbl];
            param.refhold = [param.refhold;refhold];
            param.cellvalue = [param.cellvalue;cellvalue];
            param.energy0 = [param.energy0;energy0];
            param.energy1 = [param.energy1;energy1];
            param.energy2 = [param.energy2;energy2];
            param.energy3 = [param.energy3;energy3];
        else
            param.memout = memout;
            param.membl = membl;
            param.memhold = memhold;
            param.refbl = refbl;
            param.refhold = refhold;
            param.cellvalue = cellvalue;
            param.energy0 = energy0;
            param.energy1 = energy1;
            param.energy2 = energy2;
            param.energy3 = energy3;
        end
        
        system(strjoin({'rm -rf /tmp/',param.rnddirname,'/'},''));
    end

    function [] = store_simulation(param,t,vdd)
        memout = param.memout;
        membl = param.membl;
        memhold = param.memhold;
        refbl = param.refbl;
        refhold = param.refhold;
        cellvalue = param.cellvalue;
        energy0 = param.energy0;
        energy1 = param.energy1;
        energy2 = param.energy2;
        energy3 = param.energy3;
        save(strjoin({'./ArchitectureDesign/vdd_speed_test/',param.sim_name,'/vddspeedtest_',num2str(vdd),'_',num2str((t + param.t_checkout)*1e9),'.mat'},''),'memout','membl','memhold','refbl','refhold','cellvalue','energy0','energy1','energy2','energy3')
    end
end
