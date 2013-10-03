function [Q] = integrateSignal( i, startIndex, stopIndex )
% calculate Q=int( i,  startIndex:stopIndex ) 
%
% i is a (current) signal
% Q is the integrated charge
%
%  if startIndex and stopIndex are ommitted, 1 and end are used

if nargin<3
  startIndex = 1;
  stopIndex = length( i.xValues );
end

dx = i.xValues(startIndex+1:stopIndex)-i.xValues(startIndex:(stopIndex-1));
y  = ( i.yValues(startIndex+1:stopIndex)+...
       i.yValues(startIndex:(stopIndex-1)) )/2; 

Q = sum( y .* dx );
