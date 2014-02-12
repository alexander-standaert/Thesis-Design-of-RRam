function f = initialize_variables(N,pro,M,V)
%
% N - Population size
% problem - takes integer values where,
%           '1' for MOP1
%           '2' for MOP2
%           '3' for SPICE


f = rand(N,V);
for i=1:N
    f(i,V+1:V+M) = evaluate_objective(f(i,1:V),pro);
end

% This function initializes the population with N individuals and each
% individual having V decision variables based on the selected problem. 
% M = 6 for problem MOP1 and
% M = 12 for problem MOP2. 
% The objective space for MOP1 is 2 dimensional while for MOP2 is 3 dimensional.
% Both the MOP's have 0 to 1 as its range for all the decision variables.

end