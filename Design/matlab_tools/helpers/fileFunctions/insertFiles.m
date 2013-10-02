function [] = insertFiles( fileIn, fileOut )
% function [] = insertFiles( fileIn, fileOut )
%   simple function that replaces all occurences of 
%   &insert "file"
%   with the contents of "file"
%   fileIn and fileOut can be the same filename


inId = fopen( fileIn, 'r' );
if inId==-1
  msg=sprintf('can''t open file [%s]\n', fileIn );
  error(msg);
end
tline={};
while 1
  line = fgetl(inId);
  if ~ischar(line), break, end
  tline{end+1}=line;
end
fclose(inId);



outId = fopen( fileOut, 'w' );
if outId==-1
  msg=sprintf('can''t open file [%s]\n', fileOut );
  error(msg);
end

for i=1:length(tline)
  line = strtrim( tline{i} );
  ind = strfind( line, '&insert' );
  if length(ind)==1 && ind(1)==1 
    indices = strfind( line, '"' );
    if length( indices ) == 2
      fileToInsert= line( indices(1)+1:indices(2)-1 );
      insertThis( outId, fileToInsert );
    else
      msg = sprintf( 'ERROR: illegal include in file %s, line %d [%s]\n', ...
                      fileIn, i, line); 
      error(msg);
    end
  else
    fprintf( outId, '%s\n', tline{i} );
  end
end

fclose( outId );

end



%% ===================================================
%% ===================================================
%% insertThis 
%% ===================================================
%% ===================================================
function [] = insertThis( targetFileId, fileToInsert )

inId = fopen( fileToInsert, 'r' );
if inId==-1
  msg=sprintf('can''t open file [%s]\n', fileToInsert );
  error(msg);
end

tline={};
while 1
  line = fgetl(inId);
  if ~ischar(line), break, end
  tline{end+1}=line;
end
fclose(inId);


for i=1:length(tline)
  fprintf( targetFileId, '%s\n', tline{i} );
end

end
