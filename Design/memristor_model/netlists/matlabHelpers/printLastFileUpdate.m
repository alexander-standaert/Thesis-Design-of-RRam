function [ dateString ] = printLastFileUpdate( filename )
% function [ dateString ] = printLastFileUpdate( filename )

    d=dir( filename );
    if isempty(d)
        fprintf( 'WARNING: [printLastFileUpdate] file %s does not exist\n', filename );
    else
        dateString = d.date;
        fprintf( 'file "%s" was last updated on %s\n', filename, dateString );    
    end
    
end