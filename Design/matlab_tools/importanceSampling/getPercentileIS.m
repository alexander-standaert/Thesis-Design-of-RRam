function [ percentile ] = getPercentileIS( values, weights, p )
% function [ percentile ] = getPercentileIS( values, weights, p )
%
% get the approximate p-th percentile of the given <values> which are 
% assigned corresponding <weights>, as is typical for importance sampling
%
% the p-th percentile is A for which E[ x<A ]=p
% to calculate B for which E[ x>B ]=p', pas p=1-p'
%
% p can be a vector:
% function [ percentiles ] = getPercentileIS( values, weights, pVector )


    [ sortedValues sortedIndices ] = sort( values );
    sortedWeights = weights( sortedIndices ) / sum( weights );
    
    cdf = cumsum( sortedWeights );
    %figure( 1155 );
    
    plot( sortedValues, cdf );
    
    percentile = zeros( 1, length( p ) );
    
    for i=1:length( p )
        pi = p( i );
        
        indexOfFirstLargerProbability =find( cdf>=pi, 1, 'first' );
        percentile(i) = sortedValues( indexOfFirstLargerProbability );        
    end

end