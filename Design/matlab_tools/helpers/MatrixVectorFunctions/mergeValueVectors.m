function [ v3 ] = mergeValueVectors( v1, v2 )
% function [ v3 ] = mergeValueVectors( v1, v2 )
% v3 is a normal array of values so that 
%   each element in v3 also occurs
%   in v1, v2 or both 
%   Each element in v1 is also in v3
%   Each element in v2 is also in v3
% No value occurs twice in v3
%
% implementation at this point is brute-force (very stupid)
% better implementation would sort both vectors and
% run over both in parallel.
% Probably better pre-allocate an array of size L1+L2 and create
% the vector of length L3 at the end

v3=[];

for i=1:length(v1)
  s = v1(i);
  matchIndex = find( v3==s, 1);
  if length(matchIndex)==0
    v3(end+1)=s;
  else
    %already in v3
  end
end

for i=1:length(v2)
  s = v2(i);
  matchIndex = find( v3==s, 1);
  if length(matchIndex)==0
    v3(end+1)=s;
  else
    %already in v3
  end
end
