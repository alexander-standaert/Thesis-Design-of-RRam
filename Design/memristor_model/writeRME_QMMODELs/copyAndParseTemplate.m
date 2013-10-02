function [] = copyAndParseTemplate( sourceFilename, targetFilename, commands )
% function [] = copyAndParseTemplate( sourceFilename, targetFilename, commands )
%
% fill out a 'template' provided in sourceFilename, perform the specified 'commands'
% and write to the provided targetFilename
%
% Supported features:
%  - literal replacement
%    - commands.replace{1} = { '@@information' , information               };
%  - nothing else yet    
    
    fidTemplate = fopen( sourceFilename, 'r' );
    fidOut      = fopen( targetFilename, 'w' );
    
    if( fidTemplate==-1 )
        error( 'ERROR: copyAndParseTemplate: can''t open "%s" for reading', sourceFilename );
    end
    if( fidOut==-1 )
        error( 'ERROR: copyAndParseTemplate: can''t open "%s" for writing', targetFilename );
    end
        
    while 1
    	tline = fgetl(fidTemplate);
        if ~ischar(tline)
            break
        end
        result = processLine( tline, commands );
        fprintf( fidOut, '%s\n', result );
    end
    
    fclose( fidOut      );
    fclose( fidTemplate );
    
    
end

function [ result ] = processLine( line, commands )
    
    replacements = commands.replace;
    
    previousResult = line;
    
    for i=1:length( replacements )
        replacement = replacements{i};
        pattern     = replacement{1};
        replaceWith = replacement{2};
        
        result = strrep( previousResult, pattern, replaceWith );
        if ~strcmp( result, previousResult )
            %fprintf( 'replaced %s\n', pattern );
        end            
        previousResult = result;
    end
    
end