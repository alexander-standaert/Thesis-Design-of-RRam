function [ output ] = busC( name, indices )
%% output = bus( name, indices )
%% 
%% example:
%% busC( 'a', [ 1:3 5 ] )
%% results in 'a_1 aBar_1 a_2 aBar_2 a_3 aBar_3 a_5 aBar_5'

text = '';
for i=indices
  text = sprintf( '%s %s_%d  %sBar_%d', text, name, i, name, i ); 
end 
  
output = text;
