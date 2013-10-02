function [ tail head ] = tailHead( full )
%
% function [ head tail ] = headTail( full )
%
% full = t3.t2.t1.head
% ==> head="head"
% ==> tail="t3.t2.t1"

index = find( full=='.', 1, 'last' );

if length(index)==0 
    tail='';
    head=full;
    return;
end

tail = full(1:index-1);
head = full(index+1:end);

