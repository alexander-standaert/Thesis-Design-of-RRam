function [ out ] = repeatString( in, n )
% function [ out ] = repeatString( in, n )
% n=number of times to repeat string <in>
% n=3
% in = 'Test'
% out = TestTestTest

out='';
for i=1:n
  out = sprintf( '%s%s', out, in); 
end
