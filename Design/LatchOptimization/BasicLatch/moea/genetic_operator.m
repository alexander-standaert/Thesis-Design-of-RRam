function children  = genetic_operator(parent_chromosome,pc,pm,nb_offspring, sigma, pro,operator, mutator)

% This function is utilized to produce offsprings from parent chromosomes.
% The genetic operators crossover and mutation which are carried out with
% slight modifications from the original design. For more information read
% the document enclosed.
global V;
global M;

[N,~] = size(parent_chromosome);

children = [];

for i = 1 : nb_offspring
    if(rand < pc) % mate
        
        p1 = randi(N);
        p2 = randi(N);
        
        while(p1 ==  p2)
           p2 = randi(N); 
        end
        parent1 = parent_chromosome(p1,:);
        parent2 = parent_chromosome(p2,:);
        
        child = parent1;
        
        if(operator == 1) % simple crossover method
            for j=randi(M):M
               child(j) = parent2(j); 
            end
        elseif(operator == 2) % interpolating method
            child = parent1;
            for j=1:V
                p = rand;
                child(j) = p*parent1(j) + (1-p)*parent2(j);
                if(child(j) > 1)
                    child(j) = 1;
                elseif(child(j) < 0)
                    child(j) = 0;
                end
            end
        elseif(operator == 3) % SBX
            u = rand;
            nu = 0.5;
            p = rand;
            if(u > 0.5)
                beta = 1 / ( (2*(1-u))^(1/(nu+1)) );
            else
                beta = (2*u)^(1/(nu+1));
            end
            for j=1:V
                if(p > 0.5)
                    child(j) = 0.5*( (1-beta)*parent1(j) + (1+beta)*parent2(j) );
                else
                    child(j) = 0.5*( (1+beta)*parent1(j) + (1-beta)*parent2(j) );
                end
                if(child(j) > 1)
                    child(j) = 1;
                elseif(child(j) < 0)
                    child(j) = 0;
                end
            end
        elseif(operator == 4) % self
            parent_chance = 0.5;
            parent_chance_imp = 0.3;
            if(parent1(end-1) ~= parent2(end-1)) % different rank
                if(parent1(end-1) > parent2(end-1))
                   parent_chance = parent_chance_imp; % more chance that parent 2 is choosen
                else
                    parent_chance = 1-parent_chance_imp; % more chance that parent 1 is choosen
                end
            else % same rank --> look at crowding distance
                if(parent1(end) > parent2(end))
                    parent_chance = 1-parent_chance_imp; % more chance that parent 1 is choosen
                elseif(parent1(end) < parent2(end))
                    parent_chance = parent_chance_imp; % more chance that parent 2 is choosen
                end
            end
            for j=1:V
                p = rand; 
                if(p < parent_chance) % parent1
                   gen = parent1(j);
                else % parent2
                    gen = parent2(j);
                end
                %gen = gen + abs(parent1(j)-parent2(j))/10*randn;
                gen = gen+randn/10;
                
                if(gen > 1)
                    gen = 1;
                else if(gen < 0)
                    gen = 0;
                    end
                end
                child(j) = gen;
            end
        end
            
        
    else % mutate
        child = parent_chromosome(randi(N),:);
        if(mutator == 1) % uniform distributed mutation
            for j=1:V
                if(rand < pm)
                   child(j) = rand; 
                end
            end
        elseif(mutator == 2) % normal distributed mutation
            for j=1:V
               if(rand < pm) % mutatie op dit gen
                   p = child(j) + (sigma)*randn;
                   if(p > 1)
                       p = 1;
                   else if(p < 0)
                       p = 0;
                       end
                   end
                   child(j) = p;
               end
            end
        end
    end
    child = child(1:V);
    child_M = evaluate_objective(child,pro);
    children = [children ; child child_M 0 0];
end

end