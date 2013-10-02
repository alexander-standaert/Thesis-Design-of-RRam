function [ indices ] = findAfter( vector, afterIndex, n ) 
% function [ indices ] = findAfter( vector, afterIndex, n ) 
%
% find the (first) (at most) n indices in the subvector <afterIndex>:end.
% afterIndex itself can be returned

  indices = find( vector(afterIndex:end), n ) +afterIndex - 1;

end
