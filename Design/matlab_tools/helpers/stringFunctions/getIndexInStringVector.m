function [ index ] = getIndexInStringVector( key, v )
% function [ index ] = getIndexInStringVector( key, v )
% index is the lowest index of key in v, or -1 if no match
% v = e.g. { 'key1', 'test', 'green' }

index = -1;
indices = find( strcmp( key , v ), 1 )

if length(indices)==0 
  index=-1
else
  index=indices(1);
end

