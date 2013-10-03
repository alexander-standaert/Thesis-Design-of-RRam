function [ times indices fractions  ]  = findCrossesTime( xvals, yvals, threshold )
%function [ times indices fractions  ] = findCrossesTime( xvals, yvals, threshold )
%
% find the times and indices where the yvals vector crosses the threshold,
%    ( (1-fractions(i))*yvals(i) + fractions(i) yvals(i+1) == threshold )
%
% the returned time values are obtained by linear interpolation,

  indices   = [];
  fractions = [];
  times     = [];

  for i=1:length(yvals)-1
    if ( yvals(i) <= threshold && yvals(i+1) > threshold ) || ...
       ( yvals(i) >= threshold && yvals(i+1) < threshold )
      indices(end+1)=i;
      fractions(end+1) = (threshold - yvals(i))/(yvals(i+1)-yvals(i));
      times(end+1) = xvals(i) + fractions(end)* (xvals(i+1)-xvals(i));  
    end
  end

 
  
end
    
