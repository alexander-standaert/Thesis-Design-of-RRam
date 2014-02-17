function f = evaluate_objective(x,problem)


global V;
% Function to evaluate the objective functions for the given input vector
% x. x has the decision variables
switch problem

%% TESTCASES
    case 1
        f = [];
        
        Wnmax = 10;
        Wnmin = 1;
        Wpmax = 10;
        Wpmin = 1;
        DeltaVmax=0.1;
        DeltaVmin=0.001;
        
        Wp = Wpmax-Wpmin;
        Wn = Wnmax-Wnmin;
        DeltaV = DeltaVmax-DeltaVmin;
        
        Wpin = Wpmin + Wp * x(1);
        Wnin = Wnmin + Wn * x(2);
        DeltaVin = DeltaVmin + DeltaV * x(3);

        [f(1),f(2),f(3)]=MClatch(DeltaVin,Wpin,Wnin);
        f(1)=-f(1);
        f(4)=DeltaVin;
        
        
end
