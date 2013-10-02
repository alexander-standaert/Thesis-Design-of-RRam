function [] = stringVectorToFile( filename, strings ) 
% function [] = stringVectorToFile( filename, strings ) 
%
% create a new file <filename>
% write all strings to the file, one per line, only newlines
%   >strings{1}
%   >strings{2} 
%   >...
%
% uses 'binary mode'
%
% directories are not created automatically at this time

    fid = fopen( filename, 'w' );

    if fid==-1
       error( 'could not open file "%s" for writing\n', filename );
    end

    for i=1:length(strings);
        fprintf( fid, '%s\n', strings{i} );
    end


end