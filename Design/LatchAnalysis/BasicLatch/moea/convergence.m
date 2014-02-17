function [conv,new_area] = convergence( chromosome , prev_area, threshold_area, threshold_1D, pop, iteration_cycle, iteration_limit, convergence_crit, convergence_extreme_limit,checkback)
%CONVERGENCE Checks if the 2-D optimisation problem has converged


global V M;


if(iteration_cycle >= convergence_extreme_limit)
    conv = 1;
    new_area=-1;
else
    if(convergence_crit == 1) % pre defined number of steps
        new_area = -1;
        if(iteration_cycle >= iteration_limit)
            conv = 1;
        else
            conv = 0;
        end
    elseif(convergence_crit == 2) % spread convergence
        temp=[];
        new_area = -1;
        for i=1:pop
            cd = chromosome(i,end);
            if( (cd ~= inf) && (~isnan(cd)) )
               temp = [temp ; cd]; 
            end
        end
        cd_mean = mean(temp);
        cd_std = std(temp);
        if( (cd_std/cd_mean) < 0.65)
            conv = 1;
        else
            conv = 0;
        end
    elseif(convergence_crit == 3) % area difference convergence
        
        %indices = find(chromosome(:,V+M+1)==1);
        %x_temp = [];
        %for k=1:size(indices,1)
        %    x_temp = [x_temp ; chromosome(indices(k),:)];
        %end
        x_temp = chromosome(chromosome(:,V+M+1)==1,:);
        
        if(size(x_temp,1) == 1)
            new_area = x_temp(1,V+1)*x_temp(1,V+2);
        else
            new_area = trapz(x_temp(:,V+1),x_temp(:,V+2));
        end
        diff_area = new_area - prev_area;
        diff_th = threshold_area * new_area;
        if(abs(diff_area) > abs(diff_th))
            conv = 0;
        else
            if(size(x_temp,1) >= 0.99*pop)
                conv=1;
            else
                conv=0;
            end
        end
    elseif(convergence_crit == 4) % convergence for 1D
        temp = sortrows(chromosome(:,V+1),1);
        new_area = [prev_area;temp(1)];
        if max(size(new_area)) > checkback
            new_area = new_area(end-checkback+1:end);
        end
        if(sum(abs(diff(new_area)))/new_area(end) <= threshold_1D)
            conv = 1;
        else
            conv = 0;
        end
    end
end
    
end