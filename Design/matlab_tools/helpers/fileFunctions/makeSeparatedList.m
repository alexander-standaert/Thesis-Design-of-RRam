function [ list ] = makeSeparatedList( vector, separator )
%function [ list ] = makeSeparatedList( vector, separator )
%
list='';

if length(vector)~=0
   list = num2str( vector(1) ); 
end

for i=2:length(vector)
    list=sprintf('%s%s%s', list, separator, num2str( vector(i) ) );
end

