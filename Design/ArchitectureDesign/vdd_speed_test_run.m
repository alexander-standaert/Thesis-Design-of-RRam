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
        
        vdd = param.simulation_space(s,1);
        t = param.simulation_space(s,2);
        [param] = generate_signals(param,t,vdd);
        
        param.RMEMvalue = 'RMEMLow';
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
            wavetemp = makewave(strcat('wave',num2str(i)),[1,4]*1e-9,[0,testvectorin(i)]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);      
            wave = calcwaves(wavetempgroup);
            wavein{i}=getfield(wave,strcat('wave',num2str(i)));
        end
        param.wavesin = wavein;
        
        wavetempgroup=[];
        for k=1
            wavetemp = makewave('samplehold',[1+t*1e9-2,2,1.5]*1e-9,[0,1,0]);
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
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/decoder.sp /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/senseamplifier.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/ArchitectureDesign/SPICE/CMOSlogic.scs /tmp/',rnddirname,'/spice/'},''));
        
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
        
        system(strjoin({'source ~/Thesis-Design-of-RRam/Design/bashrc_thesis.rc;spectre ',spicepath,'SpiceFile.sp'},''));
        clear inputfile currentpath mat2spicepath spicepath
        
    end

    function [param] = evaluate_simulation(param,t,vdd,appendparam)
        memout = zeros(param.numruns,1);
        membl = zeros(param.numruns,1);
        cellvalue = zeros(param.numruns,1);
        for k = 1:param.numruns
            istr=num2str(k+1000);
            istr=istr(end-2:end);
            [sim, ~] = readPsfAscii(strjoin({'/tmp/',param.rnddirname,'/spice/SpiceFile.raw/mymc-',istr,'_mytran.tran'},''), '.*');
                       
            sig = sim.getSignal('InOut_0');
            sigx = sig.getXValues*10^9;
            sigy = sig.getYValues;
            
            [Y i] = min(abs(sigx-(1+(t + param.t_checkout)*1e9)));
            simmemvalue = sigy(i);
            
            memout(k) = simmemvalue;
            
            sig = sim.getSignal('xGB0.xLB0.BL_0');%xGB0.BLout_0
            sigx = sig.getXValues*10^9;
            sigy = sig.getYValues;
            
            [Y i] = min(abs(sigx-(1+(t)*1e9)));
            simblvalue = sigy(i);
            
            membl(k) = simblvalue;
            
            if strcmp(param.RMEMvalue,'RMEMHigh')
                cellvalue(k) = 1;
            else
                cellvalue(k) = 0;
            end
               
        end
        
        if appendparam
            param.memout = [param.memout;memout];
            param.membl = [param.membl;membl];
            param.cellvalue = [param.cellvalue;cellvalue];
        else
            param.memout = memout;
            param.membl = membl;
            param.cellvalue = cellvalue;
        end
        
        system(strjoin({'rm -rf /tmp/',param.rnddirname,'/'},''));
    end

    function [] = store_simulation(param,t,vdd)
        memout = param.memout;
        membl = param.membl;
        cellvalue = param.cellvalue;
        save(strjoin({'./ArchitectureDesign/vdd_speed_test/',param.sim_name,'/vddspeedtest_',num2str(vdd),'_',num2str((t + param.t_checkout)*1e9),'.mat'},''),'memout','membl','cellvalue')
    end
end
