function [ output ] = busN( name, indices )
%% output = bus( name, indices )
%% 
%% example:
%% busN( 'a', [ 1:3 5 ] )
%% results in 'a_1 a_2 a_3 a_5'

text = '';
for i=indices
    text = sprintf( '%s %s_%d', text, name, i ); 
end 
  
output = text;
