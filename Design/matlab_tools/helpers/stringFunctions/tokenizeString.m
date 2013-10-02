function [ tokens ] = tokenizeString( line )
%% function [ tokens ] = tokenizeString( line )
%% 
%% Splits the given line in whitespace-seperated tokens
%% The function leaves '...' unaltered
%% 'a=b', is split as 'a', '=', 'b'
%% 'a = b' is split as 'a', '=', 'b'  -- notice: no whitespaces anymore

filteredLine = strtrim( removeDoubleWhiteSpace( line ) );

tokens = {};

lastSplitIndex = 0;
withinBrackets = 0;


skipnext=0;

for i=1:length( filteredLine )

  if skipnext 
    skipnext=0;
    continue;
  end

  c = filteredLine(i);

  if withinBrackets==1
    if strcmp(c, '''')
      withinBrackets=0;
      continue;
    end

  else  %not within brackets

    if strcmp(c, '''')
      withinBrackets=1;
      continue
    end
    if strcmp(c, ' ')
     tokens{end+1}=filteredLine( (lastSplitIndex+1):(i-1) );
     lastSplitIndex=i;
     continue;
    end
    if strcmp( c, '=')
       if lastSplitIndex==(i-1)
         % token before '=' was a space
         tokens{end+1}='=';
       else
         % token before '=' was not a space
         tokens{end+1}=filteredLine( (lastSplitIndex+1):(i-1) );
         tokens{end+1}='=';
       end
       if( length(filteredLine)>i )
         if strcmp( filteredLine(i+1), ' ')
           lastSplitIndex=i+1;
           skipnext=1;
           continue;
         else
         end 
       end
       lastSplitIndex=i;
       continue;
    end

  end
end

if lastSplitIndex < length( filteredLine )
  tokens{end+1} = filteredLine( (lastSplitIndex+1):end );
end
