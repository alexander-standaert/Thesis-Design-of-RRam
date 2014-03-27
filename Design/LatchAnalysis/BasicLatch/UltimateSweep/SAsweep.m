function [] = SAsweep()
    
[NoSims] = sim_setup()  ;
% sweepbin(0);
sim_evaluate(NoSims);
end

function [NoSims] = sim_setup()
    DeltaV=[0.035:0.005:0.1];
    Wuppair=[2:0.5:20];
    Wdownpair=[2:0.5:20];
    Wtop=[2:15];
    Wdown=[2:15];
    
    mega=allcomb(DeltaV,Wuppair,Wdownpair,Wtop,Wdown);
    
    A=find(mega(:,1)<0.05);
    B=find(mega(:,2)<10);
    C=find(mega(:,3)<10);
    mega(intersect(intersect(B,C),A),:)=[]; %DeltaV kleiner dan 50mV en diff pair kleiner dan 1000nm -> weg
    A=find(mega(:,1)>0.075);
    B=find(mega(:,2)>2.5);
    C=find(mega(:,3)>2.5);
    mega(intersect(intersect(B,C),A),:)=[]; %DeltaV groter dan 80mV en diff pair groter dan 250nm -> weg
    A=find(mega(:,5)>mega(:,4));
    mega(A,:)=[]; %nmos driver groter dan pmos driver -> weg
    A=find(mega(:,4)>mega(:,2));
    mega(A,:)=[]; %pmos driver groter dan pmos diff pair -> weg
    A=find(mega(:,5)>mega(:,3)); 
    mega(A,:)=[]; %nmos driver groter dan nmos diff pair -> weg
    A=find(2*mega(:,5)<mega(:,4)); 
    mega(A,:)=[]; %nmos driver 2x kleiner dan pmos driver -> weg
    A=find(mega(:,2)>2*mega(:,3));
    mega(A,:)=[]; %pmos diff pair groter dan 2x nmos diff pair -> weg
    A=find(mega(:,2)< mega(:,3));
    mega(A,:)=[]; %pmos diff pair kleiner dan nmos diff pair -> weg
    A=find(2*mega(:,4) < mega(:,2));
    mega(A,:)=[]; %pmos driver kleiner dan 3x pmos diff pair -> weg
    
    
    split_data(mega,20) 
    
    function [] = split_data(data,nb_of_blocks)
    totaldata = data;
    blok_size = ceil(size(totaldata,1)/nb_of_blocks);
    split_matrix = ones(1,nb_of_blocks)*blok_size;
    oversize = (blok_size*nb_of_blocks-size(totaldata,1));
    split_matrix(1:oversize) = split_matrix(1:oversize)-1;
    
    if split_matrix(end) == 0
       error('Split is badly conditioned, please use an other number of blocks to split') 
    end
    
    split_space = mat2cell(totaldata,split_matrix,5);
    
    for i = 1:nb_of_blocks
        data = split_space{i};
        save(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/inputs/inputs_',num2str(i-1),'.mat'},''),'data');
    end    
    NoSims = size(mega,1);
end

end

function [] = sim_evaluate(NoSims)
    data = zeros(NoSims,9);
    for i=1:NoSims
        temp = load(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/outputs/outputs_',num2str(i),'.mat'},''));
        data(i,:) = temp.datamatrix;
    end
    A=find(data(:,1)~=1);
    data(A,:)=[];

    x=data(:,[2,3,5]);
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
    
    pareto = data(find(f==1),:);
    
    save('./LatchAnalysis/BasicLatch/UltimateSweep/pareto.mat','pareto')
end


