function [ doesStartWith ] = startsWith( longString, startString )
%
%% function [ doesStartWith ] = startsWith( longString, startString )
%% 
%%   true (1) if the first tokens of longString match startString
%%   false (0) otherwise.

doesStartWith=0;
LS = length( startString );
if LS <= length( longString )
  if strcmp( longString(1:LS), startString )
    doesStartWith=1;
  end
end
