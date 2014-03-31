function [total_area] = area_calc()
     
    
    all_solutions = calc_solutions(4194304);
    save('./ArchitectureAnalysis/all_sol.mat','all_solutions')
    all_solutions = eval_solutions(all_solutions)
    save('./ArchitectureAnalysis/area_sol.mat','all_solutions')
    plot(all_solutions)
    
    function [a] = a_cell()
        a = (1.5*6*45e-9)*(2*6*45e-9);
        % volgens presentatie van stefan, indien SL//BL
        % length = 1.5*6F
        % width = 2*6F
    end
    
    function [a] = a_branchlogic()
        p_lmin = 45e-9;
        n_lmin = 45e-9;
        p_wmin = 100e-9;
        n_wmin = 100e-9;
        
        a_inv = p_lmin*2*p_wmin + n_lmin*n_wmin;
        a_2nand = 8*p_lmin*4*p_wmin;
        a_2nor = 10*4*p_lmin*2*p_wmin;
        a_3nand = 15*6*p_lmin*2*p_wmin;
        a_3nor = 21*4*p_lmin*2*p_wmin;
        
        a = a_2nor + a_inv*4;
    end
    
    function [a] = a_gblogic()
        p_lmin = 45e-9;
        n_lmin = 45e-9;
        p_wmin = 100e-9;
        n_wmin = 100e-9;
        
        a_inv = p_lmin*2*p_wmin + n_lmin*n_wmin;
        a_2nand = 8*p_lmin*4*p_wmin;
        a_2nor = 10*4*p_lmin*2*p_wmin;
        a_3nand = 15*6*p_lmin*2*p_wmin;
        a_3nor = 21*4*p_lmin*2*p_wmin;
        
        a = a_2nand*4 + a_inv*4;
    end
    
    function [a] = a_decoder(outputs)
        decoder_type = log10(outputs)/log10(2);
        a_all_decoder = [2.06190000000000e-12;4.09410000000000e-12;1.01700000000000e-11;1.79406000000000e-11;3.15792000000000e-11;5.90769000000000e-11;1.11617100000000e-10;2.03757300000000e-10];
        a = a_all_decoder(decoder_type-1);
    end
    
    function [a] = a_branch(nb_wordlines)
        a = nb_wordlines*a_cell() + a_branchlogic();
    end
    
    function [a] = a_REFbuffer(nb_wordlines)
        p_lmin = 45e-9;
        n_lmin = 45e-9;
        p_wmin = 100e-9;
        n_wmin = 100e-9;
        
        a_inv = p_lmin*2*p_wmin + n_lmin*n_wmin;
        buffer_type = log10(nb_wordlines)/log10(2);
        mult = [0;5;20;20;85;85;340;340;1365]; %2,3,4,5,6,7,8,9
        a = a_inv*mult(buffer_type-1);
    end
    
    function [a] = a_WLbuffer(nb_wordlines)
        p_lmin = 45e-9;
        n_lmin = 45e-9;
        p_wmin = 100e-9;
        n_wmin = 100e-9;
        
        a_inv = p_lmin*2*p_wmin + n_lmin*n_wmin;
        buffer_type = log10(nb_wordlines)/log10(2);
        mult = [0;5;5;20;20;85;85;340;340]; %2,3,4,5,6,7,8,9
        a = a_inv*mult(buffer_type-1);
    end
    
    function [a] = a_sa()
        wp = 1000e-9;
        lp = 45e-9;
        wn = 1000e-9;
        ln = 45e-9;
        wenp = 1000e-9;
        lenp = 45e-9;
        wenn = 500e-9;
        lenn = 45e-9;
        wpas = 500e-9;
        lpas = 45e-9;
        
        a = 2*wp*lp+2*wn*ln+2*wpas*lpas+wenp*lenp+wenn*lenn;
    end
    
    function [a] = a_localblock(nb_wordlines,nb_bitlines,nb_ref)
        a = a_branch(nb_wordlines) + a_decoder(nb_wordlines) + nb_wordlines*a_WLbuffer(nb_wordlines) + a_REFbuffer(nb_ref) + a_decoder(nb_bitlines);
    end
    
    function [a] = a_globalblock(nb_wordlines,nb_bitlines,nb_ref)
        a = 2*a_localblock(nb_wordlines,nb_bitlines,nb_ref) + a_sa() + a_gblogic();
    end
    
    function [a] = a_total(nb_wordlines,nb_bitlines,nb_globalblock,nb_ref)
        a = nb_globalblock*a_globalblock(nb_wordlines,nb_bitlines,nb_ref);
    end
    
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
        eval_solutions = [solutions,zeros(length(solutions(:,1)),3)];
        
        for i = 1:length(solutions(:,1))
            %             eval_solutions(i,5) = calc_delay(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
            %             eval_solutions(i,6) = calc_energy(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
            eval_solutions(i,7) = a_total(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4))*1e10;
        end
         eval_solutions = eval_solutions(:,7);
    end
end