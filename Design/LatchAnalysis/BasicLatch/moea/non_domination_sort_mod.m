function output = non_domination_sort_mod(chromosome)

%% Non-Donimation Sort
% This function sort the current population based on non-domination. All the
% individuals in the first front are given a rank of 1, the second front
% individuals are assigned rank 2 and so on. After assigning the rank the
% crowding in each front is calculated.

global M V;
x = chromosome(:,V+1:V+M);

[N,~] = size(x);

f = zeros(N,1);
% Find all the successive fronts :
		% 1. Find the front : non-dominated solutions
		% 2. Remove the front from the set
% Find the points of the first front
front=1;
elements = N;
while (elements > 0)
    
    for i=1:N
       flag = 1;
       equal = 0;
       if f(i,1)==0
           for j=1:N 
                if( (i ~= j) && ( (f(j) == 0 ) || (f(j) == front ) ) )
                    equal = 1;
                    flag = 0;
                    for k=1:M
                        if(x(j,k) > x(i,k))
                           flag = 1; 
                        end
                        if(x(j,k) ~= x(i,k))
                           equal = 0; 
                        end

                    end 
                    if(flag == 0 && (~equal))
                       break; 
                    end
                end
           end
           if( (flag == 1) || equal)
                f(i) = front;
                elements = elements - 1;
           end
       end
    end

	front=front+1;      
end

f = [chromosome(:,1:M+V) f];

% Compute the crowding-distance front by front

output = [];

for i = 1:front-1
    
    indices = find(f(:,end)==i);
    x_temp = [];
    for k=1:size(indices)
        x_temp = [x_temp ; [f(indices(k),:) 0]];
    end
    
    for j=1:M
       x_temp = sortrows(x_temp,V+j);
       x_temp(1,end) = inf;
       x_temp(end,end) = inf;
       
       for l=2:size(indices)-1
            x_temp(l,end) = x_temp(l,end) + (x_temp(l+1,V+j)-x_temp(l-1,V+j))/(x_temp(end,V+j)-x_temp(1,V+j)); 
       end
    
    end
    
    
    output = [output ; x_temp];
    
end



end
