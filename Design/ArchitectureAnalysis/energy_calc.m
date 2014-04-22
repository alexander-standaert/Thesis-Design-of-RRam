function [] = architecture_analysis()
    %start walltime 9.20
    all_solutions = calc_solutions(4194304);
    extract_e(all_solutions)
    
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
    
    function [] = extract_e(solutions)
        close all
        energy_buffer = ones(1,length(solutions(:,1)))*10e-13;
        energy_sa = ones(1,length(solutions(:,1)))*10e-13;
        energy_mem = ones(1,length(solutions(:,1)))*10e-13;
        energy_logic = ones(1,length(solutions(:,1)))*10e-13;
        for h = 1:length(solutions(:,1));
           try
            data = load(strjoin({'./ArchitectureAnalysis/delay_calc/delay_calc_',num2str(solutions(h,1)),'_',num2str(solutions(h,2)),'_',num2str(solutions(h,3)),'.mat'},''));
            
           
            
              figure
%             hold all
%             plot(data.sig_ibuffer.getXValues,data.sig_ibuffer.getYValues)
%             plot(data.sig_isa.getXValues,data.sig_isa.getYValues)
%              plot(data.sig_ilogic.getXValues,data.sig_ilogic.getYValues)
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
        energy = [energy_buffer',energy_sa',energy_logic',energy_mem']
        bar(energy,'stacked');
    end
end
