function mating_pool = tournament_selection(chromosome,nb_mp,tour_crit)
% nb_mp : size of the to-generate offspring

global V M;

N = size(chromosome,1);
mating_pool = [];
if tour_crit == 1
    for i =1 : nb_mp
        r=randi(N,1,2);
        if chromosome(r(1),V+M+1) > chromosome(r(2),V+M+1)
            mating_pool=[mating_pool; chromosome(r(2),:)];
        elseif chromosome(r(1),V+M+1) < chromosome(r(2),V+M+1)
            mating_pool=[mating_pool; chromosome(r(1),:)];
        else
            if chromosome(r(1),V+M+2) > chromosome(r(2),V+M+2)
                mating_pool=[mating_pool; chromosome(r(1),:)];
            else
                mating_pool=[mating_pool; chromosome(r(2),:)];
            end
        end
    end
elseif tour_crit == 2
    x = 3:-2/N:1;
    P = log(x);
    P = P/norm(P);
    for i =1 : nb_mp
        repeat=1;
        while repeat
            r=randi(N);
            randy = rand;
            if randy < P(r)
                mating_pool=[mating_pool; chromosome(r,:)];
                repeat=0;
            end
        end
     end
end
end
   

%{

for i=1:nb_mp
    pp = zeros(N);
    p = pp(:,1);
    pool_temp = [];
    for j=1:tour_size
        flag = 1;
        while(flag == 1)
            p_temp = randi(N);
            flag = 0;
            for k=1:j-1
                if(p(k) == p_temp)
                    flag = 1;
                    break;
                end
            end
            if(flag == 0)
                p(j) = p_temp; 
                pool_temp = [pool_temp ; chromosome(p_temp,:)];
            end
        end
    end
    lowest = inf;
    pool_lowest = [];
    for l=1:tour_size
        if(pool_temp(l,end-1) < lowest)
            lowest = pool_temp(l,end-1);
            pool_lowest = [];
            pool_lowest = [pool_lowest ; l];
        else if(pool_temp(l,end-1) == lowest)
            pool_lowest = [pool_lowest ; l];
        end
        end
    end
    
    lowest = pool_temp(pool_lowest(1,1),end-1);
    best = pool_temp(pool_lowest(1,1),:);
    for z=2:size(pool_lowest,1)
        index = pool_lowest(z,1);
        if(pool_temp(index,end) > lowest)
            lowest = pool_temp(index,end-1);
            best = pool_temp(index,:);
        end
    end
    
    mating_pool = [mating_pool ; best];
    
end

end


%}