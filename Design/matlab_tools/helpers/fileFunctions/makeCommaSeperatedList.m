function [ list ] = makeCommaSeperatedList( vector )
%function [ list ] = makeCommaSeperatedList( vector )
%
list='';

if length(vector)~=0
   list = num2str( vector(1) ); 
end

for i=2:length(vector)
    list=sprintf('%s,%s', list, num2str( vector(i) ) );
end

