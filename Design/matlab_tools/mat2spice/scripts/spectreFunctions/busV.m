function [ output ] = busV( name, indices )
%% output = bus( name, indices )
%% 
%% example:
%% bus( 'a', [ 1:3 5 ] )
%% results in 'a_1 a_2 a_3 a_5'
%
% faulty version used by Vibhu that does not put underscores automatically


text = '';
firstEntry = 1;
for i=indices
  if( firstEntry==1 ) 
    firstEntry=0;
    text = sprintf( '%s%d', name, i ); 
  else
    text = sprintf( '%s %s%d', text, name, i ); 
  end
end 
  
output = text;

