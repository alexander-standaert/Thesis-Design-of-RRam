function [] = writeLinesToFile( lines, filename )
% function [] = writeLinesToFile( lines, filename )
%  output the cell array of lines to a file <filename>
    
    fid = fopen( filename, 'w' );
    if fid==-1
       error( 'could not open %s for write', filename ); 
    end
    
    for i=1:length(lines)
        fprintf( fid, '%s\n', lines{i} );
    end

    fclose( fid );
    
end