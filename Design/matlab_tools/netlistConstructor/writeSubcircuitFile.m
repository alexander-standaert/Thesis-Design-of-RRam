function [] = writeSubcircuitFile( circuit, fileName )
%  function [] = writeSubcircuitFile( circuit, fileName )
%
%    write the given subcircuit <circuit> to the given <filename>
%
%   <circuit> should have the following fields:
%   <circuit.subcircuitName>
%   <circuit.terminals>
%   <circuit.devices>
%
%    note: only spectre syntax supported for now
%

  %fileName=sprintf('%s.scs', SA.subcircuitName);

  %file    = sprintf( '%s%s', SA.runMap, fileName );
  
  name    = circuit.subcircuitName;
  nodes   = circuit.terminals;
  devices = circuit.devices;
  

  fid = fopen( fileName, 'w' ); 
  
  if fid==-1
     error( 'can''t open file %s for write\n', file );
  end
 
  
  fprintf( fid, '//Auto-generated netlist for subcircuit *%s*\n\n\n', name );
  fprintf( fid, 'simulator lang=spectre\n\n' );
  

  fprintf( fid, 'subckt %s ( \n', name );
  for i=1:length(nodes)
    fprintf( fid, '+ %s \n', nodes{i} );
  end  
  fprintf( fid, '+ ) \n\n' );

  for i=1:length(devices)
    fprintf( fid, '%s', writeDevice( devices{i} ) );
  end   
  
  fprintf( fid, '\n' );
  fprintf( fid, 'ends %s \n\n', name );

  fclose( fid );
end


function [ line ] = writeDevice( device )
  nodes = '';
  for i=1:length(device.nodes)
    nodes=sprintf( '%s %s', nodes, device.nodes{i} );
  end 
  
  params=''; 
  for i=1:length(device.paramNames)
    params=sprintf( '%s %s=%g', params, device.paramNames{i}, device.paramValues(i) );
  end 

  line=sprintf( '%s ( %s ) %s %s \n', device.name, nodes, device.type.name, params );

end
