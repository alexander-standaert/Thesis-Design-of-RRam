function [] = writeParamsFile( file, params )
%function [] = writeParamsFile( file, params )
%    write the parameters to the file 'file'
%
%    params.names
%    params.values

  fid = fopen( file, 'w' ); 
 
  
  fprintf( fid, '//Auto-generated parameter file \n\n\n' );
  fprintf( fid, 'simulator lang=spectre\n\n' );
  
  if prod( size( params ) )==0
    fprintf( fid, '//no parameters to write\n\n' );    
  else
    for i=1:length(params.names)
      fprintf( fid, 'parameters %s=%g\n', params.names{i}, params.values(i) );
    end
  end
  fprintf( fid, '\n' );

  fclose(fid);
end

