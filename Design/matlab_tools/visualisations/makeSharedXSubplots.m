function [ axes ] = makeSharedXSubplots( xlabel_, numberOfRows )
% function [ axes ] = makeSharedSubplots( xlabel_, numberOfRows )
%
% Create the requested numberOfRows subplots in the current figure window.
% x-axes of the subplots are linked.
% only the bottom axis (=axes(1)) shows the x-axis.
%
% notice: axes(i) is the i-th axes ( counting starts at bottom )
%         notice the round brackets! not a cell array.

    marginBottom = 0.1;
    totalSpacing = 0.05;
    
    left   = 0.1;
    width  = 0.85;
    height = (1-marginBottom-totalSpacing)/numberOfRows;
    pitch  = (1-marginBottom)/numberOfRows;
    
    axes = zeros( 1, numberOfRows );
    for i=1:numberOfRows
        bottom = marginBottom + (i-1)*pitch;
        axes(i) = subplot( 'position', [ left bottom width height ] );
        %grid on; -- problems with semilogy if enabled
        %hold on;
        if i>1
           set( gca, 'xTickLabel', {} ); 
        end
        if i==1
            xlabel( xlabel_ );
        end
    end
    
    
    
    linkaxes( axes, 'x' );

end