function [] = makeLambdaPlot( xValues, yValues, varargin )
% function [] = makeLambdaPlot( xValues, yValues, varargin )
%
% make a plot with decreasing lambda on the x-axis, and the
% correct lambda-values on the x-axis label
%
% xValues should be expressed in m, e.g. 90e-9

    xValues = xValues / 1e-9;

    xMin = min( xValues );
    xMax = max( xValues );
    
    lambdas = [ 1000 750 500 350 250 180 130 90 65 45 32 22 16 12 8 6 4 ];
    
    [ lambdaOldest Ioldest ] = find( lambdas>=xMax, 1, 'last' );
    [ lambdaNewest Inewest ] = find( lambdas<=xMin, 1, 'first' );
    
    lambdaTicks = lambdas( Ioldest:Inewest);
    lambdaTickLabels = getLambdaLabels( lambdaTicks );
    
    lambdaPositions = log( lambdaTicks(1)./lambdaTicks ) / log( sqrt(2) );
    
    [ ~, Isort ] = sort( -xValues );
    
    
    xValuesSorted    = xValues( Isort );
    xPositionsSorted = log( lambdaTicks(1)./xValuesSorted ) / log(sqrt(2) );
    yValuesSorted = yValues( Isort );
    
    plot( xPositionsSorted, yValuesSorted, varargin{:} );
    hold on;
    set(gca, 'XTick'     , lambdaPositions   );
    set(gca, 'XTickLabel', lambdaTickLabels );    
    xlabel( 'technology \lambda [nm]' );
    grid on;
    

end


function [ lambdaLabels ] = getLambdaLabels( lambdaTicks )
% get string representation of the lambda-values

    L = length( lambdaTicks );
    lambdaLabels = cell( 1,L );
    for i=1:L
        lambda = lambdaTicks(i);
        if round( lambda ) == lambda
            lambdaLabels{i} = sprintf( '%d', lambda );
        else
            lambdaLabels{i} = sprintf( '%3.1f', lambda );
        end
    end

end