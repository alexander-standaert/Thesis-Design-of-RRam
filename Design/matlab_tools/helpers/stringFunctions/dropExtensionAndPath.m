function [ name ] = dropExtensionAndPath( filename )
%function [ name ] = dropExtensionAndPath( filename )
%
%   e.g. dropExtensionAndPath( 'this/is/a.test' )
%   becomes   'a'  (notice: without the end dot)

    %[ path name ext version ] = fileparts( filename );    
    [ path name ext ] = fileparts( filename );    
    
end