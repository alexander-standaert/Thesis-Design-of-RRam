function [ paretoIndices ] = paretoPlot( ppOptions, sc, results )
% function [ paretoIndices ] = paretoPlot( ppOptions, sc, results )
%
% make a pareto-plot, a table with pareto-optimal settings and return the indices in results that
% correspond to pareto-optimal points
%
% options are passed in the ppOptions structure:
%   ppOptions.fields        = { 'tau'                   , 'energy'      }; % X,Y that should be optimized
%   ppOptions.desiredValues = [ -1                        -1            ]; %-1: smaller values are better
%   ppOptions.fieldLabels   = { 'time constant tau [ps]', 'energy [fJ]' };
%   ppOptions.multiplier    = [ 1e12                      1e15          ];     
%    
%   ppOptions.showNormalPoints = 1; % 0(show only pareto points) or 1 (show all points)
%   ppOptions.styleNormalPoints = { 'r.', 'markerSize', 20 };  
%   % either a cell array with parameters that are passed as varargin to the plotting function
%   % either a function handle to a function that returns such a structure    
%   ppOptions.styleParetoPoints = @myStyleFunction; % - can include a line style, points are ordered along X-values    
%   ppOptions.constraints       = @myConstraints  ;
%   ppOptions.constraintMask    = [ 0 0 1 1 0 ... ] % - 0 values are removed from the list of points. index i corresponds to sc.getCombination( i )
%   
%   ppOptions.makePlot  = 1; % -- put to 0 if you do not want the plot
%   ppOptions.makeTable = 1; % -- put to 0 if you do not want the table


    % get basic X-vector and Y-vector without filtering
    nC = sc.getNumberOfCombinations();
    X = zeros( 1, nC );
    Y = zeros( 1, nC );
    
    xField = ppOptions.fields{1};
    yField = ppOptions.fields{2};
    if isa( xField, 'function_handle' )
       for i=1:nC
           result = results( i );
           combination = sc.getCombination( i );
           X(i) = xField( result, combination, results, sc );
       end
    else
        for i=1:nC
           X(i) = results(i).(xField); 
        end
    end
    
    if isa( yField, 'function_handle' )
       for i=1:nC
           result = results( i );
           combination = sc.getCombination( i );
           Y(i) = yField( result, combination, results, sc );
       end
    else
        for i=1:nC
           Y(i) = results(i).(yField); 
        end
    end
    
    % filter points based on constraints -- X and Y values are put to NaN
    if isfield( ppOptions, 'constraints' )
        for i=1:nC
            result = results( i );
            combination = sc.getCombination( i );
            if ppOptions.constraints( result, combination, results, sc )
                % point is ok -- nothing to doe
            else
                % point does not satisfy constraints -- remove it
                X(i)=NaN;
                Y(i)=NaN;
            end
        end
    end
    
    % filter points based on mask 
    if isfield( ppOptions, 'constraintMask' )
        indicesToDrop = find( ppOptions.constraintMask==0 );
        X( indicesToDrop )=NaN;
        Y( indicesToDrop )=NaN;            
    end
    
    
    % find pareto-optimal points
    goalX = ppOptions.desiredValues(1);  % -1: smaller is better ; +1: larger is better
    goalY = ppOptions.desiredValues(2);  % -1: smaller is better ; +1: larger is better

    I = findParetoPoints( X, Y, goalX, goalY );
    paretoIndices=I;

    
    % ---- make plot
    if isfield( ppOptions, 'makePlot' ) && ppOptions.makePlot==0
       % - do not make the plot
    else
        makeParetoPlot( ppOptions, X, Y, paretoIndices, results, sc );
    end

    % ---- write table        
    if isfield( ppOptions, 'makeTable' ) && ppOptions.makeTable==0
       % - do not write the table
    else    
        for i=paretoIndices
            combination = sc.getCombination( i );
            result      = results(i);
            pointLabel = getPointLabel( i, combination, result );
            fprintf( '%s\n', pointLabel );
        end
    end
    
end

function [] = makeParetoPlot( ppOptions, X, Y, paretoIndices, results, sc )

    nC = sc.getNumberOfCombinations();

    if isfield( ppOptions, 'multipliers' )
        xMultiplier = ppOptions.multipliers( 1 );
        yMultiplier = ppOptions.multipliers( 2 );
    else
        xMultiplier = 1;
        yMultiplier = 1;
    end
    
    if isfield( ppOptions, 'showNormalPoints' ) && ppOptions.showNormalPoints==0
        % do not plot all points
    else
        % plot all points
        style = ppOptions.styleNormalPoints;
        if isa( style, 'function_handle' )
            styleIsFunction=1;
            styleFunction = style;
        else
            styleIsFunction=0;
        end
        
        for i=1:nC
            combination = sc.getCombination( i );
            result      = results(i);
            pointLabel = getPointLabel( i, combination, result );
            if styleIsFunction                
               style = styleFunction( result, combination, results, sc ); 
            end            
            if iscell( style )
                plot( X(i)*xMultiplier, Y(i)*yMultiplier, style{:}, 'displayName', pointLabel );
            else
                plot( X(i)*xMultiplier, Y(i)*yMultiplier, style, 'displayName', pointLabel );
            end
            hold on;
        end    
    end
    
    % plot pareto points
    style = ppOptions.styleParetoPoints;
    if isa( style, 'function_handle' )
        styleIsFunction=1;
        styleFunction = style;
    else
        styleIsFunction=0;
    end

    for i=paretoIndices
        combination = sc.getCombination( i );
        result      = results(i);
        pointLabel = getPointLabel( i, combination, result );
        if styleIsFunction                
           style = styleFunction( result, combination, results, sc ); 
        end        
        if iscell( style )
            plot( X(i)*xMultiplier, Y(i)*yMultiplier, style{:}, 'displayName', pointLabel );
        else
            plot( X(i)*xMultiplier, Y(i)*yMultiplier, style, 'displayName', pointLabel );
        end
        hold on;
    end        
    
    xlabel( ppOptions.fieldLabels{1} );
    ylabel( ppOptions.fieldLabels{2} ); 
    grid on;
    
end


function [ pointLabel ] = getPointLabel( index, combination, result )
    combinationDescription = getCombinationDescription( combination );
    resultDescription = getResultDescription( result );
    pointLabel = sprintf( '%4d. %s --> %s', index, combinationDescription, resultDescription );    
end

function [ resultDescription ] = getResultDescription( result )
    fieldNames = fieldnames( result );
    resultDescription='';
    for i=1:length( fieldNames )
       field = fieldNames{i};
       resultDescription = sprintf( '%s %s=%g', resultDescription, field, result.(field) );
    end        
end


function [ combinationDescription ] = getCombinationDescription( result )
    fieldNames = fieldnames( result );
    combinationDescription='';
    for i=1:length( fieldNames )
       field = fieldNames{i};
       combinationDescription = sprintf( '%s %s=%g', combinationDescription, field, result.(field) );
    end        
end