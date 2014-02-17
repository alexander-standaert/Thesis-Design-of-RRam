%function multi_objective_genetic_algorithm
%% Main Function
% Main program to run the MOEA.
% Read the corresponding documentation to learn more about multiobjective
% optimization using evolutionary algorithms.
% initialize_variables has two arguments; First being the population size
% and the second the problem number. '1' corresponds to MOP1 and '2'
% corresponds to MOP2.


%% Initialize the variables
% Declare the variables and initialize their values
% pop - population
% gen - generations
% pro - problem number
% nb_mp - number of parents
% nb_offspring - number of offspring

% close all
pop = 100;
gen =50;
pro = 1;
nb_mp = 50;
nb_offspring = 50;
pc = 0.5; % 1-pc = crossoverprobability
tour_crit = 2; % parent selection criterium: 1 - random binary selection
               %                             2 - distributed binary selection
operator = 3; % the crossover algorithm: 1 - simple crossover
              %                          2 - interpolating crossover
              %                          3 - SBX
              %                          4 - Own
mutator = 2;  % the mutation algorithm: 1 - uniformly distributed mutation
              %                         2 - Gaussian mutation
threshold_1D = 1e-4; % threshold for convergence  (1D convergence)
threshold_area = 0.05; % threshold for convergence (procentual difference in area)
iter_step = 5; % the amount of iteration steps after which convergence is checked
convergence_crit = 1; % convergence criterium: 1 - no criterium, amount of iterations = gen
                      %                        2 - spread convergence
                      %                        3 - area convergence
                      %                        4 - one dimensional convergence
convergence_extreme_limit=2000; % maximum number of iteration steps ( against too strong convergence criterium)
checkback = 15; % the amount of data the 1D convergence function looks back to when deciding if algorithm has converged

tic;
global M; % amount of objectives
global V; % amount of variables


switch pro
    case 1
        % M is the number of objectives.
        M = 4;
        % V is the number of decision variables. In this case it is
        % difficult to visualize the decision variables space while the
        % objective space is just two dimensional.
        V = 3;

end
%% Initialize the population

chromosome = initialize_variables(pop,pro,M,V);


%% Sort the initialized population
% Sort the population using non-domination-sort. This returns one or two columns
% for each individual which are the rank and (optionally) the crowding distance
% corresponding to their position in the front they belong. 

chromosome = non_domination_sort_mod(chromosome);

%% Start the evolution process

% The following are performed in each generation
% Select the parents
% Perform crossover and Mutation operator
% Perform Selection

i = 0;
conv = 0;  
prev_area = 0;
while(conv == 0)
i = i + 1;
%for i = 1 : gen
    sigma = 1/log(i);
    %% Select the parents
    % Parents are selected for reproduction to generate offspring. Traditionally 
    % a binary tournament selection is used.
    % But to see the effect of tournament 
    % size this is kept arbitary, to be chosen by the user.


    parent_chromosome = tournament_selection(chromosome,nb_mp,tour_crit);

    %% Perfrom crossover and Mutation operator
    % The original algorithm uses Simulated Binary Crossover (SBX) and
    % Polynomial crossover. Crossover probability 1-pc and mutation
    % probability is pm = 1/n, where n is the number of decision variables.
    pm = 1/V;
    offspring_chromosome = genetic_operator(parent_chromosome,pc,pm,nb_offspring,sigma,pro,operator,mutator);
    intermediate_chromosome = [chromosome ; offspring_chromosome];

    
    %% Non-domination-sort of intermediate population
    % The intermediate population is sorted again based on non-domination sort
    % before the replacement operator is performed on the intermediate
    % population.

    intermediate_chromosome = non_domination_sort_mod(intermediate_chromosome);
    
    %% Perform Selection
    % Once the intermediate population is sorted only the best solution is
    % selected based on it rank and (optionally) crowding distance. Each front is filled in
    % ascending order until the addition of population size is reached. The
    % last front is included in the population based on the individuals with
    % biggest crowding distance
    chromosome = crop_chromosome(intermediate_chromosome,pop);
    
    fprintf('%d\n',i)
    
    if(mod(i,iter_step) == 0)
        [conv,prev_area] = convergence(chromosome,prev_area,threshold_area, threshold_1D, pop, i, gen, convergence_crit, convergence_extreme_limit,checkback);
    end

end
fprintf('Done ')
i
 chromosome(1,V+1)
toc

%% Result
% Save the result in ASCII text format.
save solution.txt chromosome -ASCII

%% Visualize
% The following is used to visualize the result for the given problem.
switch pro
    case 1
        plot(chromosome(:,V + 1),chromosome(:,V + 2),'*');
        title('MOP1');
        xlabel('f(x_1)');
        ylabel('f(x_2)');

end
