function chromosome = crop_chromosome(intermediate_chromosome,pop)

[~,s_end] = size(intermediate_chromosome);
intermediate_chromosome = sortrows(intermediate_chromosome,[s_end-1 -s_end]);

chromosome = intermediate_chromosome(1:pop,:);

end