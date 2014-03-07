function [] = vdd_speed_test()
    %% MAIN function to perform and analyse the Vdd/Speed test
    
    %% SET FUNCTION MODE
    % function_mode = simulation : performs the actual simulation, the
    %                 matlab script can run simultainiously on multiple computers and they
    %                 will automaticly work together as one cluster
    % function_mode = evaluation : evaluates the generated data from the
    %                 simulation
    %
    % sim_name : a unique name for your simulation, this allows you to run
    %            multiple simulations of different architecture configurations at the same time
    clc
    close all
    
    function_mode = 'simulation';
    sim_name = 'bestsimever';
    
    if strcmp(function_mode,'simulation')
        % set parameters and run simulation
        param = [];
        param.sim_name = sim_name;
        param = set_vdd_speed_test_param(param);
        param = set_memory_architecture_param(param);
        run_test(param)        
    else
        % read and plot results
        param = [];
        param.sim_name = sim_name;
        param = set_vdd_speed_test_param(param);
        results = read_results(param);
        plot_results(results,param)
    end

end

function [param] = set_vdd_speed_test_param(param)
    %% Function sets all the parameters for the vdd/speed test simulation
    
    %% SET PARAMETER
    
    % vdd_min: mimimal vdd used in test
    % vdd_max: maximal vdd used in test
    % vdd_step: vdd step used in test
    %
    % t_min: min time to trigger SA after address is given 
    % t_max: max time to trigger SA after address is given
    % t_step: time step used interation between t_min and t_max
    % t_checkout: time to check output of SA after SA is triggered
    %
    % [t_min:t_step:t_max] + t_checkout = the total read time
    %
    % mc_runs: number of Monte Carlo simulations on each vdd/speed point
    % (MUST be a even number because half of the mc simulations are with a LRH and half with a HRS)
    
    vdd_min = 0.8;
    vdd_max = 1.2;
    vdd_step = 0.1;
    
    t_min = 10e-9;
    t_max = 20e-9;
    t_step = 1e-9;
    t_checkout = 3e-9;
    
    mc_runs = 1;
    
    %% GENERATE THE RIGHT PARAM STRUC
    vdd_range = vdd_min:vdd_step:vdd_max;
    t_range = t_min:t_step:t_max;
    
    param.vdd_range = vdd_range;
    param.t_range = t_range + t_checkout;
    param.simulation_space = [allcomb(vdd_range,t_range),t_checkout*ones(size(allcomb(vdd_range,t_range),1),1)];
    param.numruns = mc_runs;
    param.MismatchOn = 0;
    param.simlength = 1e-9 + t_max + t_checkout + 1e-9;
end

function [param] = set_memory_architecture_param(param)
    param.address = 1;
    
    % Architecture parameters
    param.NoWLpB=4;
    param.NoBLpLB=4;
    param.NoGB=1;
    
    % TransistorWith parameters
    param.WChargeBL=100e-9;
    param.WBias=1.5*100e-9;
    param.WDischargeBL=180e-9;
    param.WDischargeSL=1.5*150e-9;
    
    param.PWn=100e-9;
    param.PWp=100e-9;
    param.PWpenable=100e-9;
    param.PWnenable=100e-9;
    
    param.PWMmuxLB=200e-9;
    param.PWMmuxGB=200e-9;

end

function [] = run_test(param)
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
    try
        system(strjoin({'mkdir ./ArchitectureDesign/vdd_speed_test/',param.sim_name,'/'},''))
    catch
        
    end
    
    for i = 1:size(param.simulation_space,1)
        
        vdd = param.simulation_space(i,1);
        t = param.simulation_space(i,2);
        [param] = generate_signals(param,t,vdd);
        param = run_simulation(param);
        [nb_of_passes] = evaluate_simulation(param);
%         store_simulation(param,nb_of_passes);
%         [vdd,t,sim_not_finished] = choose_occurence(param,sim_name);
    end
    
    disp('========================================================')
    disp('  ')
    disp('SIM FINISHED')
    disp('  ')
    disp('========================================================')
    
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
            wavetemp = makewave('samplehold',[1+t,0.5,1.5]*1e-9,[0,1,0]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        param.SA_SH=getfield(wave,'samplehold');
        for k=1
            wavetemp = makewave('enableSAN',[1+t+0.5,1.4,0.1]*1e-9,[0,1,0]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        param.en_SAN=getfield(wave,'enableSAN');
        for k=1
            wavetemp = makewave('enableSAP',[1+t+0.5,1.4,0.1]*1e-9,[1,0,1]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        param.en_SAP=getfield(wave,'enableSAP');
        
        param.RMEMvalue = 'RMEMHigh';
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
        mat2spice(mat2spicepath,spicepath,sp)
        
        inputfile = 'localblock.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice(mat2spicepath,spicepath,sp)
        
        inputfile = 'globalblock.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice(mat2spicepath,spicepath,sp)
        
        inputfile = 'SpiceFile.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice(mat2spicepath,spicepath,sp)
        
        inputfile = 'parameters.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice(mat2spicepath,spicepath,sp)
        
        inputfile = 'drivers.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice(mat2spicepath,spicepath,sp)
        
         
        system(strjoin({'spectre -64 +aps ',spicepath,'SpiceFile.sp'},''));
        clear inputfile currentpath mat2spicepath spicepath
        
    end

    function [nb_of_passes] = evaluate_simulation(param)
        nb_of_passes = 0;
        for k = 1:param.numruns
            istr=num2str(k+1000);
            istr=istr(end-2:end);
            [sim, ~] = readPsfAscii(strjoin({'/tmp/',param.rnddirname,'/spice/SpiceFile.raw/mymc-',istr,'_mytran.tran'},''), '.*');
            
            sig = sim.getSignal('InOut_0');
            sigx = sig.getXValues*10^9;
            sigy = sig.getYValues;
            
            plot(sigx,sigy)
            pause
            
            %TODO read file + extract passes
            
%             if %...
%                 nb_of_passes = nb_of_passes + 1;
%             end
        end
        
        system(strjoin({'rm -rf /tmp/',param.rnddirname,'/'},''));
    end

    function [] = store_simulation(param,nb_of_passes)
        nb_of_passes
        save(strjoin({'./ArchitectireDesign/vdd_speed_test/',param.sim_name,'/vddspeedtest_',num2str(param.vdd),'_',num2str(param.t + param.t_checkout)},''),'nb_of_passes')
    end
end

function [results] = read_results(param)
    sim_name = param.sim_name;


    results = round(rand(length(param.t_range),length(param.vdd_range)));

end

function [] = plot_results(results,param)
    sim_name = param.sim_name;
    % plots and saves results
    
    results = [flipud(results) zeros(size(results,1),1);zeros(1,size(results,2)+1)];

    f1 = figure;
    colormap([0.9,0,0;0,0.7,0])
    pcolor(results)   
    xlabel('Vdd voltage (V)','FontSize', 12,'FontWeight','bold','interpreter','none')
    ylabel('Read frequency (Mhz)','FontSize', 12,'FontWeight','bold','interpreter','none')
    set(gca, 'XAxisLocation', 'top')
    set(gca,'xtick',[1:length(param.vdd_range)]+0.5)
    set(gca,'xtickLabel',{param.vdd_range})
    set(gca,'ytick',[1:length(param.t_range)]+0.5)
    set(gca,'ytickLabel',{1e-6./param.t_range})
    
    r = 150; % pixels per inch
    set(f1, 'PaperUnits', 'inches', 'PaperPosition', [0 0 1080 1080]/r);
    print(f1,'-dpng',sprintf('-r%d',r), strjoin({'./ArchitectureDesign/fig/results_vdd_speed_test_',sim_name,'.png'},''));

end