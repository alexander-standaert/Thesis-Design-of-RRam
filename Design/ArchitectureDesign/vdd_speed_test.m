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
%     function_mode = 'simulation';
    sim_name = 'bestsimever';
    
    if strcmp(function_mode,'simulation')
        % set parameters and run simulation
        param = [];
        param = set_memory_architecture_param(param);
        param = set_vdd_speed_test_param(param);
        param.sim_name = sim_name;
        param = split_param(param,9);
        generate_codor_job_file(param)
%         vdd_speed_test_run(1,sim_name);       
    elseif strcmp(function_mode,'evaluation')
        % read and plot results
        param = [];
        param.sim_name = sim_name;
        param = set_vdd_speed_test_param(param);
        results = read_results(param);
        plot_results(results,param)
        analyse_node(1,5,param)
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
    
    vdd_min = 0.4;
    vdd_max = 1.2;
    vdd_step = 0.1;
    
    t_min = 2e-9;
    t_max = 7e-9;
    t_step = 1e-9;
    t_checkout = 3e-9;
    
    mc_runs = 50;
    
    %% GENERATE THE RIGHT PARAM STRUC
    vdd_range = vdd_min:vdd_step:vdd_max;
    t_range = t_min:t_step:t_max;
    
    param.vdd_range = vdd_range;
    param.t_range = t_range + t_checkout;
    param.t_checkout = t_checkout;
    param.simulation_space = [allcomb(vdd_range,t_range),t_checkout*ones(size(allcomb(vdd_range,t_range),1),1)];
    param.numruns = mc_runs;
    param.MismatchOn = 1;
    param.simlength = 1e-9 + t_max + t_checkout + 1e-9;
end

function [param] = set_memory_architecture_param(param)    
%     % Architecture parameters
%     param.NoWLpB=4;
%     param.NoBLpLB=4;
%     param.NoGB=1;
%     
%     % TransistorWith parameters
%     param.WChargeBL=300e-9;
%     param.LChargeBL=195e-9;
%     param.WDischargeBL=100e-9;
%     param.WDischargeSL=500e-9;
%     
%     param.PWn=100e-9;
%     param.PWp=100e-9;
%     param.PWpenable=100e-9;
%     param.PWnenable=100e-9;
%     
%     param.PWMmuxLB=200e-9;
%     param.PWMmuxGB=200e-9;
    
    data = load('./ArchitectureDesign/architecture_param');
    param = data.sp;
    param.address = 1;
end

function [param] = split_param(param,nb_of_blocks)
    param.nb_of_blocks = nb_of_blocks;
    totalparam = param;
    blok_size = ceil(size(param.simulation_space,1)/nb_of_blocks);
    split_matrix = ones(1,nb_of_blocks)*blok_size;
    split_matrix(end) = split_matrix(end) - (blok_size*nb_of_blocks-size(param.simulation_space,1));
    
    if split_matrix(end) == 0
       error('Split is badly conditioned, please use an other number of blocks to split') 
    end
    
    split_space = mat2cell(totalparam.simulation_space,split_matrix,3);
    
    for i = 1:nb_of_blocks
        param = totalparam;
        param.simulation_space = split_space{i};
        save(strjoin({'./ArchitectureDesign/vdd_speed_test/input_',totalparam.sim_name,'_',num2str(i-1),'.mat'},''),'param');
    end    
end

function [] = generate_codor_job_file(param)
       
    fileID = fopen('./ArchitectureDesign/vdd_speed_test.job','w');
    fprintf(fileID,'Universe         = vanilla \n');
    fprintf(fileID,'RequestCpus      = 2 \n');
    fprintf(fileID,'RequestMemory    = 4G \n');
    fprintf(fileID,'+RequestWalltime = 7200 \n');
    %fprintf(fileID,'Requirements = machine == "idesbald.esat.kuleuven.be" \n');
    fprintf(fileID,'Requirements = machineowner == "PSI/Spraak" \n');
    fprintf(fileID,'Requirements = distribution == "CentOS" \n');
    fprintf(fileID,'Initialdir       = /users/start2012/s0211331/Thesis-Design-of-RRam/Design \n');
    fprintf(fileID,'Executable = /software/bin/matlab2013b \n');
    fprintf(fileID,strjoin({'Arguments = " -nodisplay -r ',char(39),'maxNumCompThreads(2);startup;vdd_speed_test_run($(Process),',char(39),char(39),param.sim_name,char(39),char(39),');exit();',char(39),' " \n'},''));
    
    fprintf(fileID,'NiceUser = true \n');
    fprintf(fileID,strjoin({'Error        = ./ArchitectureDesign/vdd_speed_test/log/',param.sim_name,'.$(Process).err \n'},''));
    fprintf(fileID,strjoin({'Queue ',num2str(param.nb_of_blocks),' \n'},''));
    
    fclose(fileID);
end

function [results] = read_results(param)
    results = zeros(length(param.t_range),length(param.vdd_range));
    for k  = 1:length(param.t_range)
       for l = 1:length(param.vdd_range) 
          t = param.t_range(k)*1e9;
          vdd = param.vdd_range(l);
          try
              data = load(strjoin({'./ArchitectureDesign/vdd_speed_test/',param.sim_name,'/vddspeedtest_',num2str(vdd),'_',num2str((t)),'.mat'},''));
              
              numruns = length(data.cellvalue);
              results(k,l) = sum(((data.cellvalue(1:numruns/2)*vdd-data.memout(1:numruns/2)/vdd))<0.01)/(numruns/2);
              results(k,l) = sum(((data.cellvalue((numruns/2)+1:end)*vdd-data.memout((numruns/2)+1:end))/vdd)<0.01)/(numruns/2);
          catch
              results(k,l) = nan;
          end
       end
    end    
end

function [] = plot_results(results,param)
    sim_name = param.sim_name;
    % plots and saves results
    results
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

function [] = analyse_node(vdd,t,param)
    data = load(strjoin({'./ArchitectureDesign/vdd_speed_test/',param.sim_name,'/vddspeedtest_',num2str(vdd),'_',num2str((t)),'.mat'},''));
              
    numruns = length(data.cellvalue);
    memout_low = data.memout(1:numruns/2);
    memout_high = data.memout((numruns/2)+1:end);
    membl_low = data.membl(1:numruns/2);
    membl_high = data.membl((numruns/2)+1:end);
    
    figure
    subplot(3,1,1)
    bar([memout_low,membl_low])
    subplot(3,1,2)
    bar([memout_high,membl_high])
    subplot(3,1,3)
    hold on
    hist(membl_high,20)
    hist(membl_low,20)
    
end