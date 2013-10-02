function [ output ] = busNegated( name, indices )
%% output = busNegated( name, indices )
%% 
%% example:
%% busN( 'a', [ 1:3 5 ] )
%% results in 'aBar_1 aBar_2 aBar_3 aBar_5'

text = '';
firstEntry = 1;
for i=indices
  if( firstEntry==1 ) 
    firstEntry=0;
    text = sprintf( '%sBar_%d', name, i ); 
  else
    text = sprintf( '%s %sBar_%d', text, name, i ); 
  end
end 
  
output = text;
