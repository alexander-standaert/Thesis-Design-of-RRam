function [tdel,correct] = calcYieldSpeed( v,t,highlow )
%CALCYIELDSPEED Summary of this function goes here
%   Detailed explanation goes here
if highlow ==0
    tdel = t(min(find(v<0.001)));
    if size(tdel,1) ==0
        correct=0;
    else
        correct=1;
    end
else
    tdel = t(min(find(v>0.999)));
    if size(tdel,1) ==0
        correct=0;
    else
        correct=1;
    end
end

