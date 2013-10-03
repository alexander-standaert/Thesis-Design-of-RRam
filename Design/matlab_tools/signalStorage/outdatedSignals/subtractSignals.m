function [ d r1 r2 ] = subtractSignals( s1, s2 )
% return a new signal with d.xValues = s1.xValues union s2.xValues,
% but excluding values  outside the bounds of either s1 or s2
%
% and d.yValues ~= s1.yValues - s2.yValues
%
% also returns the two resampled signals
%

x = union( s1.xValues, s2.xValues ) ;

I1 = find( ( x >= s1.xValues(1)   ) .* ...
           ( x <= s1.xValues(end) ) .* ...
           ( x >= s2.xValues(1)   ) .* ...
           ( x <= s2.xValues(end) ) );        

x = x( I1 );

y1 = interp1( s1.xValues, s1.yValues, x );
y2 = interp1( s2.xValues, s2.yValues, x );

dy = y1-y2;

d = s1;
d.xValues = x;
d.yValues = dy; 

r1=s1;
r1.xValues=x;
r1.yValues=y1;

r2=s2;
r2.xValues=x;
r2.yValues=y2;

end
