function [] = OptimizeDecoder()
    
NoSims = sim_setup()  ;
% SizingSim(0);
   sim_evaluate(NoSims);
end

function [NoSims] = sim_setup()
    NoBLpLB = 2.^[4:10];
    multfacnorm=[1e-1:1e-1:1];
    NoIS=[2:2:8];
    
    mega=allcomb(NoBLpLB,NoIS,multfacnorm);
    mega(:,3)=mega(:,3).*mega(:,1)*100/1024;
    
    A=find(mega(:,3)<1.1);
    mega(A,:)=[];
    
    split_data(mega,1) 
    
    function [] = split_data(data,nb_of_blocks)
    totaldata = data;
    blok_size = ceil(size(totaldata,1)/nb_of_blocks);
    split_matrix = ones(1,nb_of_blocks)*blok_size;
    oversize = (blok_size*nb_of_blocks-size(totaldata,1));
    split_matrix(1:oversize) = split_matrix(1:oversize)-1;
    
    if split_matrix(end) == 0
       error('Split is badly conditioned, please use an other number of blocks to split') 
    end
    
    split_space = mat2cell(totaldata,split_matrix,3);
    
    for i = 1:nb_of_blocks
        data = split_space{i};
        save(strjoin({'./DecoderDesign/OptimizeDecoder/inputs/inputs_',num2str(i-1),'.mat'},''),'data');
    end    
    NoSims = size(mega,1);
end

end

function [] = sim_evaluate(NoSims)
    data = zeros(NoSims,6);
    for i=1:NoSims
        temp = load(strjoin({'./DecoderDesign/OptimizeDecoder/outputs/outputs_',num2str(i),'.mat'},''));
        data(i,:) = temp.datamatrix;
    end
    A=find(data(:,6)==0);
    data=data(A,1:5);

    x=data(:,[1,4:5]);
    N=size(data,1);
    f = zeros(N,1);
    front=1;
    elements = N;
    while (elements > 0)
        for i=1:N
            flag = 0;
            if f(i)==0
                rowi = x(i,:);
                for j=1:N
                    if( (i ~= j) & ( (f(j) == 0 ) | (f(j) == front ) ) )
                        rowj = x(j,:);
                        
                        if( all(rowj-rowi <= 0) )
                            if(all(rowj-rowi ~= 0))
                                flag = 1;
                                break;
                            end
                        end
                        
                    end
                end
                
                if(flag == 0)
                    f(i) = front;
                    elements = elements - 1;
                end
                
            end
        end
        front=front+1;
    end
    
    1;
    
end


