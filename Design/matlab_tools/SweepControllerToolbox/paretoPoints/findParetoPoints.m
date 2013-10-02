function [ indices ] = findParetoPoints( X, Y, goalX, goalY ) 
%%function [ indices ] = findParetoPoints( X, Y, goalX, goalY ) 
%% find the indices of the points that are pareto-optimal in the given set.
%%   if( goalX>0 ), a larger X is desired
%%   if( goalX<0 ), a smaller X is desired
%%   idem for goalY
%%
%%  The function returns the indices of points 'on' the pareto-curve, sorted
%%  according to their X-value


Xeff = X * (-sign(goalX));
Yeff = Y * (-sign(goalY));

%size( Xeff )
%size( Yeff )

%% smaller Xeff and Yeff are better ...

%% we can remove all points ( X, Y )for which there exists another point 
%% (X2,Y2) exists so that X2<X1 and Y2<Y1

%% points that are nan, +inf or -inf  will be removed by making them + infinite 
removeI = find( 1 - (isfinite( Xeff ) ) .* ( isfinite( Yeff ) ) );
Xeff( removeI ) = inf;
Yeff( removeI ) = inf;

indices = [];

[ Xsorted XI ] = sort( Xeff );
[ Ysorted YI ] = sort( Yeff );

% start at the lowest X value and find the associated Y-value
% this is certainly a pareto-point
%
% now, we can drop all points that have a larger Y-value than this
% point's Y

smallestY=inf;


for i=1:length(Xsorted)
  Xi = Xsorted(i);
  index = XI(i);
  Yi = Yeff( index );
  
  if Yi<smallestY
    %there is no point with a smaller X that has a smaller or equal Y
    smallestY=Yi;
    indices(end+1)=index;
  end

end
