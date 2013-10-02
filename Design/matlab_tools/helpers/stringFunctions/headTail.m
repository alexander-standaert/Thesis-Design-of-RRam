function [ head tail ] = headTail( full )
%
% function [ head tail ] = headTail( full )
%
% full = head.t1.t2.t3
% ==> head="head"
% ==> tail="t1.t2.t3"

index = find( full=='.', 1 );

if length(index)==0 
    tail='';
    head=full;
end

head = full(1:index-1);
tail = full(index+1:end);

