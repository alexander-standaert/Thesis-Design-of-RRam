function [ output ] = grid( name, indices1, indices2)
% function [ output ] = bus( name, indices )
% 
% example:
% bus( 'a', [ 1:3 5 ] )
% results in 'a_1 a_2 a_3 a_5'

%fprintf('WARNING: mat2spice bus function should be standardized\n' );

text = '';
firstEntry = 1;
for i=indices1
  for h=indices2
      k = strcat(num2str(i),'_',num2str(h));
      if( firstEntry==1 ) 
        firstEntry=0;
        text = sprintf( '%s_%s', name, k); 
      else
        text = sprintf( '%s %s_%s', text, name, k); 
      end
  end
end 
  
output = text;

%fprintf( 'ERROR: bus function used!!! "%s" \n',name );
