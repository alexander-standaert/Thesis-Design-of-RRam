function [ basename ] = dropExtension( filename )
%function [ basename ] = dropExtension( filename )
%
%   e.g. dropExtension( 'this/is/a.test' )
%   becomes   'this/is/a'  (notice: without the end dot)

    [ path name ext version ] = fileparts( filename );    
    basename = fullfile( path, name );

end