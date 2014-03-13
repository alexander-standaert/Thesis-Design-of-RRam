function [] = SizingSim(process_id)
    try
    system(strjoin({'rm -rf ./DecoderDesign/OptimizeDecoder/log/diary_log',num2str(process_id)},''));
    diary(strjoin({'./DecoderDesign/OptimizeDecoder/log/diary_log',num2str(process_id)},''));
    catch
    end
    data = load(strjoin({'./DecoderDesign/OptimizeDecoder/inputs/inputs_',num2str(process_id),'.mat'},''));
    mega = data.data;
    
    for z = 1:length(mega)
        z
        [~,t,e]=simdata(mega(z,2),mega(z,3),mega(z,1));
        if isempty(t)
            blacklist = 1;
            energy=0;
            delay=0;
        else
            blacklist = 0;
            energy=e;
            delay=t;
        end
        datamatrix = [mega(z,:),delay,energy,blacklist];
        save(strjoin({'./DecoderDesign/OptimizeDecoder/outputs/outputs_',num2str(z),'.mat'},''),'datamatrix')%save(strjoin({'./DecoderDesign/OptimizeDecoder/outputs/outputs_',num2str(mega(i,1)),'_',num2str(mega(i,2)),'_',num2str(mega(i,3)),'.mat'},''),'datamatrix')
    end
    
    function [sim,delay,energy] = simdata(NoIS,multfac,NoBLpLB)
        %%

        sp.CL = 0.18e-15*NoBLpLB;
        
        sp.MismatchOn=0;
        sp.numruns=1;
        sp.simlength=3e-9;
        
        sp.NoIS = NoIS;
        
        sp.invsize = cell(sp.NoIS,1);
        for i=1:sp.NoIS
            sp.invsize{i}=multfac^((i-1)/sp.NoIS);
        end
        
        wavetemp = makewave('in',[1,1,1]*1e-9,[1,0,1]);
        wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
        wave = calcwaves(wavetempgroup);

        sp.wavein = wave.in;
        
        clear wave
        
        
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
        
        inputfile = 'parameters2.m2s';
        [currentpath,~,~] = fileparts(which(mfilename));
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        inputfile = 'sizingsim.m2s';
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        system(strjoin({'source ~/Thesis-Design-of-RRam/Design/bashrc_thesis.rc;spectre ',spicepath,'sizingsim.sp'},''));
        clear inputfile currentpath mat2spicepath spicepath
        
        [sim] = readPsfAscii(strjoin({'/tmp/',param.rnddirname,'/spice/sizingsim.raw/mymc-001_mytran.tran'},''), '.*');
        
        a=sim.getSignal('OUT');
        v=a.getYValues;
        t=a.getXValues;
        [~, tstart] = min(abs(t - 1e-9));
        [~, tstop] = min(abs(t - 2*1e-9));
        delay=t(tstart+min(find(v(tstart:end)>0.9)))-1e-9
        
        c=sim.getSignal('Vvdd:p');
        t2=c.getXValues;
        idd=c.getYValues;
        [~, t2start] = min(abs(t2 - 1e-9));
        [~, t2stop] = min(abs(t2 - 2*1e-9));
        energy=trapz(t2(t2start:t2stop),-idd(t2start:t2stop))
        
    end
end