function [ mu sigma meanV ] = getMuSigma_IS( values, weights )
% function [ mu sigma mean ] = getMuSigma_IS( values, weights )
%   <values> is a vector of values as obtained with importance sampling
%   monte carlo (IS MC).  With this method, different samples get 
%   different <weights>, depending on the probability they are picked
%   in the actual distributions versus in the used distributions.  
%
%   This method approximates <mu> and <sigma> of the original population
%   (with non-distorted distributions), based on the results of 
%   a IS MC run.  Use with care.
%
%  if <values> contains NaN; inf or -inf, a warning is printed and
%  these values are dropped from the vector

    %values
    %weights

    % drop NaN and +-inf    
    indicesNaN = find( isnan( values ) );
    indicesInf = find( isinf( values ) );
    if ~isempty( indicesNaN ) ||  ~isempty( indicesInf )
        fprintf( 'getMuSigma_IS: values vector contains %d NaN-values\n', length( indicesNaN ) );        
        fprintf( 'getMuSigma_IS: values vector contains %d +-infinity-values\n', length( indicesNaN ) );        
        indicesToKeep = find( (~isnan(values)) .* (~isinf(values)) );
        values  =  values( indicesToKeep );
        weights = weights( indicesToKeep );
    end
        
    wTotal = sum(weights);
    mu = sum( weights .* values )./wTotal ;
    sigma = sqrt( sum(  ( weights.*(values-mu).^2 )  )./ wTotal );

    meanV = mean( values );
    
end

