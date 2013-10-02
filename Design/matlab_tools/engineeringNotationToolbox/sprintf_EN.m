function [ result ] = sprintf_EN( formatString, varargin )
%function [ result ] = sprintf_EN( formatString, varargin )
%
%  like sprintf, but with engineering notation support
%
%  e.g.
%  sprintf_EN( '%s = %g, but in engineering notation it is %[A]\n', ...
%              'current', 1.2e-9, 1.2e-9 )
%  will give 'current = 1.2e-9, but in engineering notation it is 1.200nA'
%
%  the trigger symbol is %[ .... ] anything on the .... is interpreted as
%  the unit.
%
%  see engineeringNotation and engineeringNotationTemplate for information
%  about the conversion
%

    [ allIndices fieldIndices literalStrings fields ] = findFields( formatString );

    if length( varargin ) ~= length( allIndices )
       varargin
       error( 'wrong number of arguments to fill out %s\n', formatString ); 
    end    
    
    newPattern = literalStrings{1};    
    for i=1:length( fields )
        indexToReplace     = fieldIndices(i);
        locationInVarargin = find( allIndices==indexToReplace );        
        %fprintf('\n fields  :\n') ; fields
        %fprintf('\n varargin:\n') ; varargin
        fieldResult = fillOut( fields{i}, varargin{ locationInVarargin } );
        newPattern = sprintf( '%s%s%s', newPattern, fieldResult, literalStrings{i+1} );
    end
    
    remainingArguments={};
    for i=1:length( allIndices )
        index = allIndices( i );
        if isempty( find( fieldIndices==index ) )
            remainingArguments{end+1} = varargin{ i };
        end
    end

    %newPattern
    result = sprintf( newPattern, remainingArguments{:} ); 
    % must use {:} to transform remainingArguments into a comma-separated
    % list
    
end


function [ allIndices fieldIndices literalStrings fields ] = findFields( formatString )
%
% Note: a field is the  ... inside %[ ... ]
%
% allIndices are the indices of all non-escaped %-signs that are not inside fields
% fieldIndices are the indices of all non-escaped %[ - signs
% literalStrings are the strings before, between and after %[ ... ] segments
%   if %[ .. ] is the start of the format, '' is prepended to the list
%   if %[ .. ] is the end   of the format; '' is appended to the list
%
% Stupid! "\%" doesn't exist, it is %% instead

    inField=false;  % true if inside %[ ... before first ]
    previousWasUnescapedPercentage=false; 
    % percentage-signs inside %[ ... are ignored
    % in "%%", the first% makes the second % escaped
    %
    % can only add index when next char has been analysed
    
    fieldIndices  = [];
    fieldClosures = [];
    allIndices = [];
    
    for i=1:length( formatString )        
        c = formatString(i);        
        %fprintf( 'pwuPercentage: %d ; inField = %d ; c=%s\n', previousWasUnescapedPercentage, inField, c );
        
        if ~inField
            if previousWasUnescapedPercentage 
                if c=='%'  % we are in '%%'
                    previousWasUnescapedPercentage = 0;
                    continue;
                end
                % the previous char was a non-escaped '%'
                allIndices( end+1 ) = i-1;
                previousWasUnescapedPercentage = 0;
                if c=='['  % we start a new field                    
                    fieldIndices(end+1) = i-1;
                    inField=1;                
                    continue;       
                end
                continue;
            else %  ~previousWasUnescapedPercentage
                if c=='%'
                    previousWasUnescapedPercentage=1;
                end
                continue;
            end
            
            
        end
        if inField
            if c==']'
                fieldClosures(end+1) = i;
                inField=0 ;
                continue;
            end
        end        
    end

    if length( fieldIndices ) > length( fieldClosures )
        error( 'not all fields "\%[..." are terminated with ] in "%s"', formatString);
    end
    
    Nfields = length( fieldIndices );
    literalStrings = {};
    fields = {};
    previousLiteralStart = 1;
    for i=1:Nfields
        fI = fieldIndices( i );
        fC = fieldClosures( i );
        literalStrings{i} = formatString( previousLiteralStart:(fI-1) ); %gives empty string if fI-1<start
        fields{i} = formatString( fI:fC );        
        previousLiteralStart = fC+1;        
    end
    literalStrings{Nfields+1} = formatString( previousLiteralStart:end );
        
end
    

function [ string ] = fillOut( pattern, value )

    if ( ~isnumeric( value ) ) || ( length( value )>1 )
        fprintf( '============= value:\n' );
        value
        error( 'value for pattern "%s" should be a single numeric value \n', pattern );
    end

    %strip brackets: %[  and ]    
    unitString = pattern( 3:end-1 );
    
    template = engineeringNotationTemplate( unitString );
    string = engineeringNotation( value, template );
    
end