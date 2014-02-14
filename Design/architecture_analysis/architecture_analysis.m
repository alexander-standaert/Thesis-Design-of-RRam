function [] = architecture_analysis()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
memsize = 2097152;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

solutions = calc_solutions(memsize,1);
eval_solutions = eval_solutions(solutions);
plot_solutions(eval_solutions)
end

function [total_delay] = calc_delay(nb_wordlines,nb_branches,nb_localblocks,nb_globalblocks)
decoder_wl_type = log10(nb_wordlines)/log10(2);
decoder_bl_type = log10(nb_branches)/log10(2);
decoder_lb_type = log10(nb_localblocks)/log10(2);
decoder_gb_type = log10(nb_globalblocks)/log10(2);

decoder_wl_delay = decoder_delay(decoder_wl_type);
decoder_bl_delay = decoder_delay(decoder_bl_type);
decoder_lb_delay = decoder_delay(decoder_lb_type);
decoder_gb_delay = decoder_delay(decoder_gb_type);

controlsignal_delay = max(max(decoder_bl_delay,decoder_lb_delay)+decoder_gb_delay,decoder_wl_delay);
bitsignal_delay = analog_delay(nb_wordlines,nb_branches) + digital_delay(nb_globalblocks);

total_delay = controlsignal_delay + bitsignal_delay;

    function [delay] = decoder_delay(decoder_type)
       switch decoder_type
            case 1
                delay = 1;
            case 2
                delay = 2;
            case 3
                delay = 3;
            case 4
                delay = 4;
            case 5
                delay = 5;
            case 6
                delay = 6;
            case 7
                delay = 7;
            case 8
                delay = 8;
            case 9
                delay = 9;
            case 10
                delay = 10;
            case 11
                delay = 11;
            otherwise
                delay = 1;
                error('unknown decoder type')
        end
    end

    function [delay] = analog_delay(nb_bits,nb_branches)
       unitdelay_bit = 1;
       unitdelay_branch = 2;
       unitdelay_SA = 4;
       
       delay = unitdelay_bit*nb_bits + unitdelay_branch*nb_branches + unitdelay_SA;
    end

    function [delay] = digital_delay(nb_globalblocks)
       unitdelay_globalblock = 1;
       
       delay = unitdelay_globalblock*nb_globalblocks;
    end

end

function [total_energy] = calc_energy(nb_wordlines,nb_branches,nb_localblocks,nb_globalblocks)
decoder_wl_type = log10(nb_wordlines)/log10(2);
decoder_bl_type = log10(nb_branches)/log10(2);
decoder_lb_type = log10(nb_localblocks)/log10(2);
decoder_gb_type = log10(nb_globalblocks)/log10(2);

decoder_wl_energy = decoder_energy(decoder_wl_type)*nb_globalblocks;
decoder_bl_energy = decoder_energy(decoder_bl_type)*nb_globalblocks*nb_localblocks;
decoder_lb_energy = decoder_energy(decoder_lb_type)*nb_globalblocks;
decoder_gb_energy = decoder_energy(decoder_gb_type);

controlsignal_energy = decoder_wl_energy + decoder_bl_energy + decoder_lb_energy + decoder_gb_energy;
bitsignal_energy = analog_energy(nb_wordlines);

total_energy = controlsignal_energy + bitsignal_energy;

    function [energy] = decoder_energy(decoder_type)
       switch decoder_type
            case 1
                energy = 1;
            case 2
                energy = 2;
            case 3
                energy = 3;
            case 4
                energy = 4;
            case 5
                energy = 5;
            case 6
                energy = 6;
            case 7
                energy = 7;
            case 8
                energy = 8;
            case 9
                energy = 9;
            case 10
                energy = 10;
            case 11
                energy = 11;
            otherwise
                energy = 1;
                error('unknown decoder type')
        end
    end

    function [energy] = analog_energy(nb_bits)
       unitcap = 1; 
       unitvoltage = 2; 
       
       energy  = unitcap*nb_bits*unitvoltage;
    end

end

function [total_area] = calc_area(nb_wordlines,nb_branches,nb_localblocks,nb_globalblocks)
decoder_wl_type = log10(nb_wordlines)/log10(2);
decoder_bl_type = log10(nb_branches)/log10(2);
decoder_lb_type = log10(nb_localblocks)/log10(2);
decoder_gb_type = log10(nb_globalblocks)/log10(2);

decoder_wl_area = decoder_area(decoder_wl_type)*nb_globalblocks;
decoder_bl_area = decoder_area(decoder_bl_type)*nb_globalblocks*nb_localblocks;
decoder_lb_area = decoder_area(decoder_lb_type)*nb_globalblocks;
decoder_gb_area = decoder_area(decoder_gb_type);

unitarea_cell = 0.1;
unitarea_SA = 2;

cell_area = unitarea_cell*nb_wordlines*nb_branches*nb_localblocks*nb_globalblocks;
SA_area = unitarea_SA*nb_globalblocks;


total_area = decoder_wl_area + ...
             decoder_bl_area + ...
             decoder_lb_area + ...
             decoder_gb_area + ...
             cell_area + ...
             SA_area;
    function [area] = decoder_area(decoder_type)
       switch decoder_type
            case 1
                area = 1;
            case 2
                area = 2;
            case 3
                area = 3;
            case 4
                area = 4;
            case 5
                area = 5;
            case 6
                area = 6;
            case 7
                area = 7;
            case 8
                area = 8;
            case 9
                area = 9;
            case 10
                area = 10;
            case 11
                area = 11;
            otherwise
                area = 1;
                error('unknown decoder type')
        end
    end
end

function [solutions] = calc_solutions(memsize, full_address_range)
maxdecoder = 11;
if full_address_range
    cell_options = 2.^[1:maxdecoder];
    branch_options = 2.^[1:maxdecoder];
    localblock_options = 2;
    globalblock_options = 2.^[1:maxdecoder];
else
    cell_options = 2.^[6:15];
    branch_options = 2.^[6:15];
    localblock_options = 2;
    globalblock_options = 2.^[6:15];
end

all_solutions = allcomb(cell_options,branch_options,localblock_options,globalblock_options);
all_solutions = [all_solutions prod(all_solutions,2)];

solutions = all_solutions(find(all_solutions(:,5)==memsize),:);

solutions = solutions(:,1:4);
end

function [eval_solutions] = eval_solutions(solutions)
eval_solutions = [solutions,zeros(length(solutions(:,1)),3)];
    
for i = 1:length(solutions(:,1))
    eval_solutions(i,5) = calc_delay(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
    eval_solutions(i,6) = calc_energy(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
    eval_solutions(i,7) = calc_area(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
end

end

function [] = plot_solutions(solutions)
figure
area = solutions(:,7);
s = exp(5*area/max(area))
%s = linspace(1,50,10);
scatter(solutions(:,5),solutions(:,6),s)
xlabel('ENERGY','FontSize', 10,'FontWeight','bold')
ylabel('DELAY','FontSize', 10,'FontWeight','bold')


end