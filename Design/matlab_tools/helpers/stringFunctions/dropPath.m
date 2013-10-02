function [ name ] = dropPath( filename )
%function [ name ] = dropPath( filename )
%
%   e.g. dropExtension( 'this/is/a.test' )
%   becomes   'a.test'  

    %[ path name ext version ] = fileparts( filename );    
    %name = [name ext version ];
    
    [ path name ext ] = fileparts( filename );    
    name = [name ext ];

end