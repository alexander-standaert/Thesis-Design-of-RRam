function [ Matrix ] = decoderblocks( NoI)
%DECODERBLOCKS Summary of this function goes here
%   Detailed explanation goes here

In = zeros(2^NoI,NoI);
Out = flip(eye(2^NoI));

j=1;
for i=1:2^NoI-1
    jstr=dec2bin(j,NoI);
    for c=1:NoI
        In(i+1,c)=str2num(jstr(c));
    end
    j=j+1;
end
        




end

