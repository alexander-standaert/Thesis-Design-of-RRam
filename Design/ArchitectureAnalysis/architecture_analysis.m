function [] = architecture_analysis()
    %start walltime 9.20
    all_solutions = calc_solutions(4194304);
%      all_solutions = eval_solutions(all_solutions)
%     check_delay(all_solutions)
    extract_de(all_solutions)
    
    function [solutions] = calc_solutions(memsize)
        maxdecoder = 9;
        range_wordlines = 2.^[3:maxdecoder]; %WL
        range_bitlines = 2.^[3:maxdecoder]; %BL
        range_globalblock = 2.^[3:maxdecoder]; %GL
        range_ref = min(range_bitlines)
        
        all_solutions = allcomb(range_wordlines,range_bitlines,range_globalblock,range_ref);
        all_solutions = [all_solutions prod(all_solutions(:,1:3)*2,2)];
        
        solutions = all_solutions(find(all_solutions(:,5)==memsize),:);
        solutions = solutions(find(solutions(:,1)>=solutions(:,2)),:);
        
        
        solutions = solutions(:,1:4)
    end
    
    function [eval_solutions] = eval_solutions(solutions)
        diary(strjoin({'./ArchitectureAnalysis/delay_calc/diary.log'},''))
        
        eval_solutions = [solutions,zeros(length(solutions(:,1)),3)];
        data = load(strjoin({'./ArchitectureAnalysis/t_sa.mat'},''));
        t_array = data.d;
        
        for h = 14%:length(solutions(:,1));
            param = setup_sim(solutions(h,1),solutions(h,2),solutions(h,3),solutions(h,4));
            t = t_array(h)*1e-9+0.2e-9
            param = generate_signals(param,t);
            param = run_simulation(param);
            evaluate_simulation(param)
        end
        
        
        function [sp] = setup_sim(WL,BL,GB,REF)
            % Architecture parameters
            sp.NoWLpB=WL;
            sp.NoBLpLB=BL;
            sp.NoGB=1;
            sp.NoreelGB=GB;
            sp.PercentageHighRef = 0.5; %getal tussen 0 en 1
            sp.PercentageUsedRef = REF/BL; %getal tussen 0 en 1
            
            % TransistorWith parameters
            sp.WChargeBL=300e-9;
            sp.LChargeBL=195e-9;
            sp.WDischargeBL=100e-9;
            sp.WDischargeSL=500e-9;
            
            sp.PWn=100e-9;
            sp.PWp=100e-9;
            sp.PWpenable=100e-9;
            sp.PWnenable=100e-9;
            
            sp.PWMmuxLB=200e-9;
            sp.PWMmuxGB=200e-9;
            sp.vdd = 1;
            
            %Simulation parameters
            sp.MismatchOn=0;
            sp.numruns=1;
            sp.simlength=16e-9;%*(3+0*2*sp.NoGB*sp.NoBLpLB*sp.NoWLpB);
            sp.randomizecells =0;
            
            
            sp.refcells = zeros(1,sp.NoBLpLB);
            sp.refcells(1:round(sp.NoBLpLB*sp.PercentageUsedRef*sp.PercentageHighRef)) = 1;
            
            sp.RMEMvalue = 'RMEMHigh';
        end
        
        function [param] = generate_signals(param,t)
            i=3;
            param.thold = 0.2e-9;
            
            testvectorin = zeros(1,param.NoGB+log2(param.NoWLpB)+log2(param.NoBLpLB)+2);
            
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
            currentpath = '~/Thesis-Design-of-RRam/Design/ArchitectureDesign'; %fileparts(which(mfilename));
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
        
        function [param] = evaluate_simulation(param)
            istr=num2str(1+1000);
            istr=istr(end-2:end);
            [sim] = readPsfAscii(strjoin({'/tmp/',param.rnddirname,'/spice/SpiceFile.raw/mymc-',istr,'_mytran.tran'},''), '.*');
            
            sig_inout = sim.getSignal('InOut_0');
            sig_inoutbar = sim.getSignal('InOutbar_0');
            sig_blmem = sim.getSignal('xGB0.xLB0.BL_0');
            sig_blref = sim.getSignal('xGB0.xLB1.BL_0');
            sig_ilogic = sim.getSignal('Vvdd_0:p');
            sig_isa = sim.getSignal('Vvdd_1:p');
            sig_imem = sim.getSignal('Vvdd_2:p');
            sig_ibuffer = sim.getSignal('Vvdd_3:p');
%             sig = sim.getSignal('InOut_0');
%             sigx1 = sig.getXValues*10^9;
%             sigy1 = sig.getYValues;
%             
%             sig = sim.getSignal('InOutbar_0');
%             sigx3 = sig.getXValues*10^9;
%             sigy3 = sig.getYValues;
%             
%             
%             sig = sim.getSignal('xGB0.xLB0.BL_0');
%             sigx2 = sig.getXValues*10^9;
%             sigy2 = sig.getYValues;
%             
%             sig = sim.getSignal('xGB0.xLB1.BL_0');
%             sigx4 = sig.getXValues*10^9;
%             sigy4 = sig.getYValues;
            
            %             figure
            %             hold all
            %             plot(sigx1,sigy1)
            %             plot(sigx2,sigy2)
            %             plot(sigx3,sigy3)
            %             plot(sigx4,sigy4)
            save(strjoin({'./ArchitectureAnalysis/delay_calc/delay_calc_',num2str(param.NoWLpB),'_',num2str(param.NoBLpLB),'_',num2str(param.NoreelGB),'.mat'},''),'sig_inout','sig_inoutbar','sig_blmem','sig_blref','sig_ilogic','sig_isa','sig_imem','sig_ibuffer')
        
%             save(strjoin({'./ArchitectureAnalysis/delay_calc/delay_calc_',num2str(param.NoWLpB),'_',num2str(param.NoBLpLB),'_',num2str(param.NoreelGB),'.mat'},''),'sigx1','sigy1','sigx2','sigy2','sigx3','sigy3','sigx4','sigy4')
        end
        
    end
    
    function [] = check_delay(solutions)
        close all
        
        for h = 1:length(solutions(:,1));
            data = load(strjoin({'./ArchitectureAnalysis/delay_calc/delay_calc_',num2str(solutions(h,1)),'_',num2str(solutions(h,2)),'_',num2str(solutions(h,3)),'.mat'},''));
            
            [Y,I] = min(abs(data.sigx3-16));
            vsh = data.sigy2(1:I)-data.sigy4(1:I);
            vsh(vsh<0) = 0;
            [Y,I2] = min(abs(vsh-0.1));
            d(h) = data.sigx4(I2)-1
            
            
            
            figure
            hold all
            
            plot([data.sigx4(I),data.sigx4(I)],[0,1])
            plot(data.sigx1,data.sigy1)
            plot(data.sigx2,data.sigy2)
            plot(data.sigx3,data.sigy3)
            plot(data.sigx4,data.sigy4)
            plot([d(h)+1,d(h)+1],[-0.1,1.1])
            plot([1,1],[-0.1,1.1])
            pause
            
        end
        figure
        plot(d)
    end
    
    function [] = extract_de(solutions)
        close all
        d = ones(1,length(solutions(:,1)))*10e-9;
        energy_buffer = ones(1,length(solutions(:,1)))*10e-13;
        energy_sa = ones(1,length(solutions(:,1)))*10e-13;
        energy_mem = ones(1,length(solutions(:,1)))*10e-13;
        energy_logic = ones(1,length(solutions(:,1)))*10e-13;
        for h = 1:length(solutions(:,1));
           try
            data = load(strjoin({'./ArchitectureAnalysis/delay_calc/delay_calc_',num2str(solutions(h,1)),'_',num2str(solutions(h,2)),'_',num2str(solutions(h,3)),'.mat'},''));
            
            [Y,I] = min(abs(data.sig_blmem.getXValues-2e-9));
            a= data.sig_blmem.getYValues;
            [Y,I1] = min(abs(data.sig_blmem.getXValues-1e-9));
            b= data.sig_blmem.getXValues;
            [Y,I2] = min(abs(a(I:end)-0.01));
            a = data.sig_blmem.getXValues;
            d(h) = a(I+I2)-1e-9;
            
            figure
            hold all
            plot(data.sig_inout.getXValues,data.sig_inout.getYValues)
            plot(data.sig_inoutbar.getXValues,data.sig_inoutbar.getYValues)
            plot(data.sig_blmem.getXValues,data.sig_blmem.getYValues)
            plot(data.sig_blref.getXValues,data.sig_blref.getYValues)
            plot([a(I+I2),a(I+I2)],[-0.1,1.1])
            plot([b(I1),b(I1)],[-0.1,1.1])
            
%             figure
%             hold all
%             plot(data.sig_ibuffer.getXValues,data.sig_ibuffer.getYValues)
%             plot(data.sig_isa.getXValues,data.sig_isa.getYValues)
%             plot(data.sig_ilogic.getXValues,data.sig_ilogic.getYValues)
%             plot(data.sig_imem.getXValues,data.sig_imem.getYValues)

            vdd = 1;
            energy_buffer(h) = trapz(data.sig_ibuffer.getXValues,data.sig_ibuffer.getYValues*-vdd); 
            energy_sa(h) = trapz(data.sig_isa.getXValues,data.sig_isa.getYValues*-vdd); 
            energy_logic(h) = trapz(data.sig_ilogic.getXValues,data.sig_ilogic.getYValues*-vdd); 
            energy_mem(h) = trapz(data.sig_imem.getXValues,data.sig_imem.getYValues*-vdd);
            catch
               
               
           end
        end
        energy_tot = energy_buffer + energy_sa + energy_logic + energy_mem;
        save(strjoin({'./ArchitectureAnalysis/delay_sol.mat'},''),'d')
        save(strjoin({'./ArchitectureAnalysis/energy_sol.mat'},''),'energy_tot')
    end
end

function [] = plot_solutions(solutions)
    figure
    area = solutions(:,7);
    s = exp(5*area/max(area));
    scatter(solutions(:,5),solutions(:,6),s)
    xlabel('ENERGY','FontSize', 10,'FontWeight','bold')
    ylabel('DELAY','FontSize', 10,'FontWeight','bold')
    
    
end