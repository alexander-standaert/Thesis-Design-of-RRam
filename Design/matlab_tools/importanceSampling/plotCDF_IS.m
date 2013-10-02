function [mu sigma meanV ] = plotCDF_IS( name, values, weights, plotId, style, fitstyle )
% function [mu sigma mean ] = ...
% plotCDF_IS( name, values, weights [, plotId, style, fitstyle ] )
%
% make a cumulative densitiy function of the result of a IS MC run.
% <values> is a vector with the performance of each run
% <weights> is a vector with the weight that is attributed to each sample
%
% <plotId> is the graph on which to plot
% <style> is the style to use to plot the data, e.g. 'r.'
% <fitstyle> is the style to use to plot the fit, e.g. 'r--'
%

    if nargin>3
        figure( plotId );
    end
    if nargin<5 
        style = '.' ;
    end
    if nargin<6
        fitstyle = '-';
    end
       
    
    %% calculate mu and sigma
    [ mu sigma meanV ] = getMuSigma_IS( values, weights );
    
    %% sort the values to construct the CDF
    [ x I ] = sort( values );
    w = weights( I );
    
    wTotal = sum(w);    
    percentile = cumsum( w ) ./ wTotal ;


    plot( x, percentile, style );
    hold on;      
 
%     m = min( values );
%     M = max( values );        
    a=axis();
    x0 = a(1);
    x1 = a(2);
    test = x0:(x1-x0)/1000:x1;
    plot( test, normcdf( test, mu, sigma), fitstyle ); %, 'lineWidth', 2 );
    %plot( [ mu mu ], [0 1], 'b--', 'linewidth', 2 );    

    axis( [ a(1:2)  -0.05 1.05 ] );
    
    ylabel( 'cdf' );
    xlabel( name );
    
    %axis( [ x0 x1 0 1 ] );
 
    grid on;
    %set( gca, 'ytick', 0:0.2:1 );

    
end

