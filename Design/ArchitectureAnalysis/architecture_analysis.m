function [] = architecture_analysis()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
memsize = 2097152;

global bitparam
bitparam.loadtype = 2; %(switch,bias,diode,bulk)
bitparam.bit_delay = getfield(load('./ArchitectureAnalysis/bitdelay.mat'),'bit_delay');
bitparam.bit_energy = getfield(load('./ArchitectureAnalysis/bitenergy.mat'),'bit_energy');
global decoderparam
decoderparam.decoderdata = getfield(load('./ArchitectureAnalysis/decoderdata.mat'),'DecoderData'); %inputs,delay,energy,area
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
        global decoderparam
        delay = decoderparam.decoderdata(find(decoderparam.decoderdata(1,:)==decoder_type),2);
    end

    function [delay] = analog_delay(nb_bits,nb_branches)
        global bitparam
        unitdelay_branch = 1e-9;
        unitdelay_SA = 1e-9;
        
        i = find(bitparam.bit_delay(:,1)==nb_bits);
        loadtype = bitparam.loadtype;
        
        delay = bitparam.bit_delay(i,1+loadtype) + unitdelay_branch*nb_branches + unitdelay_SA;
    end

    function [delay] = digital_delay(nb_globalblocks)
        unitdelay_globalblock = 0;
        
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
        global decoderparam
        energy = decoderparam.decoderdata(find(decoderparam.decoderdata(1,:)==decoder_type),3);
    end

    function [energy] = analog_energy(nb_bits)
        global bitparam
        i = find(bitparam.bit_energy(:,1)==nb_bits);
        loadtype = bitparam.loadtype;
        
        energy  = bitparam.bit_energy(i,1+loadtype);
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

% AREA CELL
%
unitarea_cell = (1.5*6*45e-9)*(2*6*45e-9);
% volgens presentatie van stefan, indien SL//BL
% length = 1.5*6F
% width = 2*6F

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
        global decoderparam
        area = decoderparam.decoderdata(find(decoderparam.decoderdata(1,:)==decoder_type),4);
    end
end

function [solutions] = calc_solutions(memsize, full_address_range)
maxdecoder = 7;
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

all_solutions = allcomb(cell_options,branch_options,localblock_options,globalblock_options)
all_solutions = [all_solutions prod(all_solutions,2)]

solutions = all_solutions(find(all_solutions(:,5)==memsize),:);

solutions = solutions(:,1:4)
end

function [eval_solutions] = eval_solutions(solutions)
eval_solutions = [solutions,zeros(length(solutions(:,1)),3)];

for i = 1:length(solutions(:,1))
    eval_solutions(i,5) = calc_delay(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4))
    eval_solutions(i,6) = calc_energy(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
    eval_solutions(i,7) = calc_area(solutions(i,1),solutions(i,2),solutions(i,3),solutions(i,4));
end

end

function [] = plot_solutions(solutions)
figure
area = solutions(:,7)
s = 1;%exp(5*area/max(area));
scatter(solutions(:,5),solutions(:,6),s)
xlabel('ENERGY','FontSize', 10,'FontWeight','bold')
ylabel('DELAY','FontSize', 10,'FontWeight','bold')


end