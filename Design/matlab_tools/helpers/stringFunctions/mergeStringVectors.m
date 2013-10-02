function [ v3 ] = mergeStringVectors( v1, v2 )
% function [ v3 ] = mergeStringVectors( v1, v2 )
% v3 is a cell array of strings so that 
%   each element in v3 also occurs
%   in v1, v2 or both 
%   Each element in v1 is also in v3
%   Each element in v2 is also in v3
% No string occurs twice in v3
%
% implementation at this point is brute-force

v3={};

for i=1:length(v1)
  s = v1{i};
  matchIndex = find( strcmp( v3, s ), 1);
  if length(matchIndex)==0
    v3{end+1}=s;
  else
    %already in v3
  end
end

for i=1:length(v2)
  s = v2{i};
  matchIndex = find( strcmp( v3, s ), 1);
  if length(matchIndex)==0
    v3{end+1}=s;
  else
    %already in v3
  end
end
