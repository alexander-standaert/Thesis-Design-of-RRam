function [] = gvim( name )
% function [] = gvim( name )
%
%   start gvim from the shell, with the given name as filename to open

    command = sprintf( '!gvim %s', name );
    eval( command );
    
end