function [ output ] = bus( name, indices )
% function [ output ] = bus( name, indices )
% 
% example:
% bus( 'a', [ 1:3 5 ] )
% results in 'a_1 a_2 a_3 a_5'

fprintf('WARNING: mat2spice bus function should be standardized\n' );

text = '';
firstEntry = 1;
for i=indices
  if( firstEntry==1 ) 
    firstEntry=0;
    text = sprintf( '%s_%d', name, i ); 
  else
    text = sprintf( '%s %s_%d', text, name, i ); 
  end
end 
  
output = text;

%fprintf( 'ERROR: bus function used!!! "%s" \n',name );
