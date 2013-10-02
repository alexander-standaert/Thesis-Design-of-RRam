function [ yValues ] = interpolateSignal( in, xValues )
%  function [ yValues ] = interpolateSignal( in, xValues )
%
%    look up a linearly interpolated value for the given xValues

x = in.xValues;
y = in.yValues;

yValues = interp1( x, y, xValues );


end
