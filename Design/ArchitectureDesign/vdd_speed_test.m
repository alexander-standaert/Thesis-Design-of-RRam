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
    
    function_mode = 'evaluation';
    sim_name = 'bestsimever';
    
    if strcmp(function_mode,'simulation')
        % set parameters and run simulation
        param = [];
        param = set_vdd_speed_test_param(param);
        param = set_memory_architecture_param(param);
        run_test(param,sim_name)        
    else
        % read and plot results
        param = [];
        param = set_vdd_speed_test_param(param);
        results = read_results(param,sim_name);
        plot_results(results,param,sim_name)
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
    
    mc_runs = 50;
    
    %% GENERATE THE RIGHT PARAM STRUC
    vdd_range = vdd_min:vdd_step:vdd_max;
    t_range = t_min:t_step:t_max;
    
    param.vdd_range = vdd_range;
    param.t_range = t_range + t_checkout;
    param.simulation_space = [allcomb(vdd_range,t_range),t_checkout*ones(size(allcomb(vdd_range,t_range),1),1)];
    param.mc_runs = mc_runs;
    
end

function [param] = set_memory_architecture_param(param)
     
end

function [] = run_test(param,sim_name)
    %% MAIN function for the simulation
    % the simulation is done as follows:
    % 1) choose an unused occurance in the simulation space: this is one Vdd and
    %    one t instance
    % 2) generate the requiered control signals
    % 3) performs N monte carlo simulations, where only the output signal
    %    and the resistance values are saved
    % 4) read the spectre results of the mc simulations and determin is the
    %    Vdd/t occurance is a PASS or FAIL
    % 5) write the result under the write sim name
    % 6) go to step 1 and repeat until all occurances in the simulation
    %    space are done
    
    [vdd,t,sim_not_finished] = choose_occurence(param,sim_name);
    
    while sim_not_finished
        [param] = generate_signals(param,vdd,t);
        run_simulation(param);
        [nb_of_passes] = evaluate_simulation(param);
        store_simulation(param,sim_name,nb_of_passes);
        [vdd,t,sim_not_finished] = choose_occurence(param,sim_name);
    end
    
    disp('========================================================')
    disp('  ')
    disp('SIM FINISHED')
    disp('  ')
    disp('========================================================')
    
    %% SIMULATION HELP FUNCTIONS
    
    function [vdd,t,sim_not_finished] = choose_occurence(param,sim_name)
        system('ls ./ArchitectireDesign/vdd_speed_test/ > ./ArchitectireDesign/vdd_speed_test/monitor.txt')
        
        fid = fopen('./ArchitectireDesign/vdd_speed_test/monitor.txt');
        
        sim_done = [];
        i = 1;
        tline = fgets(fid);
        while ischar(tline)
            [C,matches] = strsplit(tline,{'tripel_','.mat'});
            sim_done(i,1) = str2num(cell2mat(C(2)));
            sim_done(i,2) = str2num(cell2mat(C(2)));
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
        end
        
    end

    function [param] = generate_signals(param)
        %TODO
    end

    function [] = run_simulation(param)
        
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
        
        %TODO mat2spice files to rnd temp folder
        %TODO run spice
        
        
    end

    function [nb_of_passes] = evaluate_simulation(param)
        nb_of_passes = 0;
        for k = 1:param.mc_runs
            %TODO read file + extract passes
            
%             if %...
%                 nb_of_passes = nb_of_passes + 1;
%             end
        end
        
        system(strjoin({'rm -rf /tmp/',param.rnddirname,'/'},''));
    end

    function [] = store_simulation(param,sim_name)
        save(strjoin({'./ArchitectireDesign/vdd_speed_test/',sim_name,'_',num2str(param.vdd),'_',num2str(param.t + param.t_checkout)},''),'nb_of_passes')
    end
end

function [results] = read_results(param,sim_name)
    


    results = round(rand(length(param.t_range),length(param.vdd_range)))

end

function [] = plot_results(results,param,sim_name)
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