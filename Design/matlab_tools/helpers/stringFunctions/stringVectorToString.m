function [ s ] = stringVectorToString( v )
% function [ s ] = stringVectorToString( v )
%   when v = { 'a', 'test' , 'b' },
%   s becomes {'a','test','b'}

s = '{';

for i=1:length( v)
  vi = v{i};
  s=sprintf('%s%s',s,vi);
  if i<length(v) 
    s=sprintf('%s,',s);
  end
end

s=sprintf('%s}',s);
