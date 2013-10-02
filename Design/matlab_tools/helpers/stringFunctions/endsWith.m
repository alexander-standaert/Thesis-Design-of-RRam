function [ doesEndWith ] = endsWith( longString, endString )
%
%% function [ doesEndWith ] = endsWith( longString, endString )
%% 
%%   true (1) if the lqst tokens of longString matches endString
%%   false (0) otherwise.

doesEndWith=0;
LS = length( endString );
if LS <= length( longString )
  L=length( longString );
  endOfLong = longString((L-LS+1):L);
  if strcmp( endOfLong, endString )
    doesEndWith=1;
  end
end
