function [] = SizingSim(process_id)
    try
    system(strjoin({'rm -rf ./DecoderDesign/OptimizeDecoder/log/diary_log',num2str(process_id)},''));
    diary(strjoin({'./DecoderDesign/OptimizeDecoder/log/diary_log',num2str(process_id)},''));
    catch
    end
    data = load(strjoin({'./DecoderDesign/OptimizeDecoder/inputs/inputs_',num2str(process_id),'.mat'},''));
    mega = data.data;
    
    for i = 1:length(mega)
        [~,t,e]=simdata(mega(i,1),mega(i,3),mega(i,4),mega(i,2));
        if isempty(t)
            blacklist = 1;
            energy=0;
            delay=0;
        else
            blacklist = 0;
            energy=e;
            delay=t;
        end
        datamatrix = [mega(i,:),delay,energy,blacklist];
        save(strjoin({'./DecoderDesign/OptimizeDecoder/outputs/outputs_',num2str(mega(i,1)),'_',num2str(mega(i,2)),'_',num2str(mega(i,3)),'_',num2str(mega(i,4)),'.mat'},''),'datamatrix')
    end
    
    function [sim,delay,energy] = simdata(NoI,NoIS,multfac,NoBLpLB)
        %%
        % NoI=10;
        sp.NoI=NoI;
        sp.NoISTRING = int2spelledstring(NoI);
        sp.CL = 0.18e-15*NoBLpLB;
        
        sp.MismatchOn=0;
        sp.numruns=1;
        sp.simlength=3e-9;   %2^sp.NoI*3e-9;
        
        sp.NoIS = NoIS;
        
        testvectorin = zeros(2^sp.NoI,sp.NoI);
        
        sp.sizingcell = cell(decoderparameters(NoI),1);
        for i=1:decoderparameters(NoI)
            sp.sizingcell{i} = 1^((decoderparameters(NoI)-i)/decoderparameters(NoI));
        end
        
        sp.sizingcell{1}=sp.sizingcell{1}/5*3;
        % sp.sizingcell{2}=80;
        % sp.sizingcell{3}=1;
        % sp.sizingcell{4}=1;
        % sp.sizingcell{5}=1;
        % sp.sizingcell{6}=1;
        
        sp.invsize = cell(sp.NoIS,1);
        for i=1:sp.NoIS
            sp.invsize{i}=multfac^((i-1)/sp.NoIS);
        end
        
        
        j=1;
        for i=2:2^sp.NoI
            jstr=dec2bin(j,sp.NoI);
            for k=1:sp.NoI
                testvectorin(i,k)=str2num(jstr(k));
            end
            j=j+1;
        end
        
        wavein = cell(sp.NoI,1);
        for i=1:sp.NoI
            wavetempgroup=[];
            for k=3             %1:2^sp.NoI
                wavetemp = makewave(strcat('wave',num2str(i)),[1,1,1]*1e-9,[0,testvectorin(k,sp.NoI+1-i),0]);
                wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
                wavetempgroups(1) = wavetempgroup;
            end
            wave = calcwaves(wavetempgroups);
            wavein{i}=getfield(wave,strcat('wave',num2str(i)));
        end
        clear wave
        wavetempgroup=[];
        for k=1         %:2^sp.NoI
            wavetemp = makewave('enable',[1,1,1]*1e-9,[0,1,0]);
            wavetempgroup = makewavegroup('tempgroup',[wavetemp]);
            wavetempgroups(k) = wavetempgroup;
        end
        wave = calcwaves(wavetempgroups);
        
        sp.enablewave = wave.enable;
        sp.wavesin = wavein;
        
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
        
        a=sim.getSignal('OUT_2');
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