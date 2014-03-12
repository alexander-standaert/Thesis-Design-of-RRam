function [] = OptimizeDecoder()
    
  sim_setup()  
%   sim_evaluate()
end

function [] = sim_setup()
    NoBLpLB = 2.^[4:10];
    NoI=[2:10];
    multfacnorm=[1e-1:1e-1:1];
    NoIS=[2:2:8];
    
    mega=allcomb(NoBLpLB,NoIS,multfacnorm,NoI);
    mega = [mega(:,4),mega(:,1),mega(:,2),mega(:,3)];
    mega(:,4)=mega(:,4).*mega(:,2)*100/1024;
    
    A=find(mega(:,4)<1.1);
    mega(A,:)=[];
    
    split_data(mega,10) %Getal niet veranderen of aan alex vragen
    
    function [] = split_data(data,nb_of_blocks)
    totaldata = data;
    blok_size = ceil(size(totaldata,1)/nb_of_blocks);
    split_matrix = ones(1,nb_of_blocks)*blok_size;
    split_matrix(end) = split_matrix(end) - (blok_size*nb_of_blocks-size(totaldata,1));
    
    if split_matrix(end) == 0
       error('Split is badly conditioned, please use an other number of blocks to split') 
    end
    
    split_space = mat2cell(totaldata,split_matrix,4);
    
    for i = 1:nb_of_blocks
        data = split_space{i};
        save(strjoin({'./DecoderDesign/OptimizeDecoder/inputs/inputs_',num2str(i-1),'.mat'},''),'data');
    end    
end

end

function [] = sim_evalute()
    
end


