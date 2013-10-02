function [] = replaceInFile( inFile, outFile, inList, outList )
%  function [] = replaceInFile( inFile, outFile, inList, outList )
%    copies inFile to outFile and replaces all occurences in 
%    inList with the corresponding version in outList
%    Does not do any tokenchecks etc.

in  = fopen( inFile, 'rt' );
out = fopen( outFile, 'w' );

if in==-1
  msg=sprintf('could not open [%s] in [%s]', inFile, pwd );
  error (msg);
end

if out==-1
  msg=sprintf('could not open [%s] in [%s]', outFile, pwd );
  error(msg); 
end

while 1
  line = fgetl(in);
  if ~ischar(line)
    break;
  end
  for k=1:length( inList )
    line = strrep( line, inList{k}, outList{k} );
  end
  fprintf( out, '%s\n', line );
end

fclose( in  );
fclose( out );


end
