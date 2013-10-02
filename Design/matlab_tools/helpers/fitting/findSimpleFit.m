function [ A B alpha ] = findSimpleFit( En, Y )
%% function [ A B alpha ] = findSimpleFit( En, Y )
%%  find a least-squares fit of the form Y =~ A + B * En^alpha

error = inf;

for alphat = 0:0.05:2
    Enp = En.^alphat;
    
    M = [ ones( length(Enp), 1 )  Enp' ];
    
    X = M \ Y'; 
    
    At = X(1);
    Bt = X(2);
    
    errort = sum( (M*X - Y').^2 );
    
    if errort<error
       error=errort;
       A=At;
       B=Bt;
       alpha=alphat;       
    end    
end


