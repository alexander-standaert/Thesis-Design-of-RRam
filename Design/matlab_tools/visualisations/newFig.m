function [] = newFig( id, name, showNumber )
% function [] = newFig( id, name, showNumber )
%
% create a new figure with the given id [ uses figure(id) ]
% sets the window title to the provided name
% if numberFormat is true, the name is prefixed with the figure id.
%    default is true

    if( ~exist( 'showNumber', 'var') )
        showNumber = true;
    end
    
    figure( id ); 
    if showNumber
        set( gcf, 'Name', sprintf( '%d. %s', id, name ) );
    else
        set( gcf, 'Name', sprintf( '%s', name ) );
    end    
    set( gcf, 'NumberTitle', 'off' );
    
end