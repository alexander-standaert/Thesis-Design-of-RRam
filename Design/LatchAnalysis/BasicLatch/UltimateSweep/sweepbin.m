function [] = sweepbin(process_id)
try
    system(strjoin({'rm -rf ./LatchAnalysis/BasicLatch/UltimateSweep/log/diary_log',num2str(process_id)},''));
    diary(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/log/diary_log',num2str(process_id)},''));
catch
end
data = load(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/inputs/inputs_',num2str(process_id),'.mat'},''));
mega = data.data;

for z = 1:length(mega)
    
    [yield,tdelay,E,Pstat]=simdata(mega(z,1),mega(z,2),mega(z,3),mega(z,4),mega(z,5));
    
    datamatrix = [yield,tdelay,E,Pstat,mega(z,:)];
    save(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/outputs/outputs_',num2str(process_id*length(mega)+z),'.mat'},''),'datamatrix')%save(strjoin({'./DecoderDesign/OptimizeDecoder/outputs/outputs_',num2str(mega(i,1)),'_',num2str(mega(i,2)),'_',num2str(mega(i,3)),'.mat'},''),'datamatrix')
end

    function [yield,delay,energy,Pstat] = simdata(DeltaV,Wuppair,Wdownpair,Wtop,Wbottom)
        %%
        
        sp.numruns = 250;
        
        sp.Pmult=Wuppair;
        sp.Nmult=Wdownpair;
        sp.Pmultenable=Wtop;
        sp.Nmultenable=Wbottom;
        
        sp.inout = 0.4-DeltaV;
        sp.inoutbar = 0.4;
        
        starttransition = 0.5e-9;
        
        sp.lep = wavegen([0,starttransition;1,0],0.1e-9,0.05e-9,0,1,5e-9); %pmos gate
        sp.len = wavegen([0,starttransition;0,1],0.1e-9,0.05e-9,0,1,5e-9); %nmos gate
        
        
        rng('shuffle');
        rnddirname = num2str(randi(1000000)); % make unique random temp folder
        
        
        % make Sim folders
        system(strjoin({'mkdir /tmp/',rnddirname,'/'},''));
        system(strjoin({'mkdir /tmp/',rnddirname,'/spice'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_models.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/monte_carlo_res.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/tech_wrapper.lib /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_HP.pm /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/technology_models/45nm_LP.pm /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/LatchAnalysis/BasicLatch/test.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/LatchAnalysis/BasicLatch/latch.scs /tmp/',rnddirname,'/spice/'},''));
        system(strjoin({'cp ~/Thesis-Design-of-RRam/Design/LatchAnalysis/BasicLatch/inverter.scs /tmp/',rnddirname,'/spice/'},''));
        
        spicepath = strjoin({'../../../../../tmp/',rnddirname,'/spice/'},'');
        
        inputfile = 'parameters.m2s';
        [currentpath,~,~] = fileparts(which(mfilename));
        mat2spicepath = strcat(currentpath,'/',inputfile);
        mat2spice2(mat2spicepath,spicepath,sp)
        
        
        system(strjoin({'source ~/Thesis-Design-of-RRam/Design/bashrc_thesis.rc;spectre ',spicepath,'test.scs'},''));
        clear inputfile currentpath mat2spicepath spicepath
        

        sim=[];
        
        tdelayvector=zeros(sp.numruns,1);
        correctvector=zeros(sp.numruns,1);
        Evector=zeros(sp.numruns,1);
        Pstatvector=zeros(sp.numruns,1);
        
        for i=1:sp.numruns
            istr=num2str(i+1000);
            istr=istr(end-2:end);
            [sim] = readPsfAscii(strcat('/tmp/',rnddirname,'/spice/test.raw/mymc-',istr,'_mytran.tran'), '.*');
            a=sim.getSignal('inout');
            b=sim.getSignal('inoutbar');
            t=a.getXValues;
            v1=a.getYValues;
            v2=b.getYValues;
            
            c=sim.getSignal('Vvdd:p');
            idd=c.getYValues;
            
            starttransindex = min(find(t>starttransition));
            
            [tdel1,correct,tdelindex1]=calcYieldSpeed(v1,t,0);
            [tdel2,correct2,tdelindex2]=calcYieldSpeed(v2,t,1);
                        
            if correct==1
                tdelayvector(i)=max(tdel1,tdel2);
                E=trapz(t(starttransindex:max(tdelindex1,tdelindex2)),-idd(starttransindex:max(tdelindex1,tdelindex2)));
                Pstat=trapz(t(max(tdelindex1,tdelindex2):end),-idd(max(tdelindex1,tdelindex2):end))/(t(end)-t(max(tdelindex1,tdelindex2)));
            end
            
            correctvector(i)=correct;
            Evector(i) = E;
            Pstatvector(i) = Pstat;
            
        end
        
        yield=mean(correctvector);
        delay=mean(tdelayvector);
        energy=mean(Evector);
        Pstat=mean(Pstatvector);
        
        system(strjoin({'rm -rf /tmp/',rnddirname,'/'},''));
    end
end