function [ status x_i y_i ] = linearInterpolation( paramNames, maxDistances, paramValues, X, Y, Xeps, Yeps, point )
%% function [ status x_i y_i ] = linearInterpolation( paramNames, maxDistances, paramValues, X, Y, Xeps, Yeps, point )
%%
%% paramNames is a cell vector with the parameter names (dimension names)
%%
%% maxDistances is a vector with the maximal distance we allow between point and point* 
%%  (projected on each dimension) to use point* in the estimation of point
%%  This is a very basic safeguard against pruning away optima when four
%%  points at approx the same X-value are available, but there is a peak
%%  inbetween them...
%%
%% paramValues is a matrix with on each row a point p_i in the source domain
%%
%% X and Y are vectors with each item x_i being associated with p_i
%%
%% point is the point in the source domain for which we try to obtain
%%   an approximation
%%
%% Xeps and Yeps are the relative deviations we accept for X and Y (should
%% be around 0.01 ... 0.001
%%
%% status == 0 if no reliable interpolation is 'possible'
%% status == 2 if a reliable interpolation has been performed
%% (status == 1 would indicate a simulation has been performed)
%%
%% We only interpolate if we have at least a previously determined point on
%%  4 different sides of the point available ==> THIS is not enough, since
%%  it will always trim away local optima !
%% ==> We only interpolate if we have at least a plane available in 
%% T and in B or in L and in R.  Point on the diagonals count for both
%%
%%
%%
%% for this, we try all parameter-dimension combinations
%% (p1,p2) (p1,p3) ... (p1,pn)      n-1
%%         (p2,p3) ... (p2,pn)      n-2
%%          ...
%%                    (pn-1,pn)     1
%%
%% this are (n)*(n-1)/2 options:  
%% if n=7:  6+5+4+3+2+1 = 21   ;  (7*6)/2 = 21
%% if n=4:  3+2+1       = 6    ;  (4*3)/2 = 6
%%
%%
%% with different sides of the point, we mean
%%      \ T /
%%       \ /
%%     L  X R
%%       / \
%%      / B \
%%


%paramValues

[ rows cols ] = size( paramValues );

if(rows<3) 
    status=0;
    x_i=0;
    y_i=0;
    return;
end

fprintf('starting rows =%d\n',rows);


%% 1. find the distance from all points to this point        
pointCopy = ones( rows, 1 ) * point ;

diff = paramValues-pointCopy;        
absdiff = abs( diff );        
squaredDif = diff.^2;               

distance = sqrt( sum( squaredDif, 2 ) );

[ distanceS, I ] = sort( distance );
absdiffS = absdiff(I, :);
diffS = diff(I, :);
paramValuesS = paramValues(I, :);
XS = X( I );
YS = Y( I );

for p1=1:length( point )
    d1 = diffS( :, p1 );   
    absd1 = absdiffS( :,p1 );
    maxd1 = maxDistances( p1 );

    for p2=(p1+1):length(point)
        d2 = diffS( :, p2 );
        absd2 = absdiffS( :,p2 );
        maxd2 = maxDistances( p2 );

        trim = (absd1<=maxd1) .* (absd2<=maxd2);
                
        for k = 1:length(point)
            if (k==p1) || (k==p2)
                %ok
            else
                trim = trim .* ( 1-(diffS(:, k)==point(k) ) );
            end
        end
        selectI = find( trim );
        
        d1_trimmed = d1( selectI );
        d2_trimmed = d2( selectI );       
        X_trimmed = XS( selectI );
        Y_trimmed = YS( selectI );
        absd1_trimmed = absd1( selectI );
        absd2_trimmed = absd2( selectI );
        
%        [ d1_trimmed d2_trimmed X_trimmed' ]
        
        selectR = find( (d1_trimmed>0) .* (absd2_trimmed<=absd1_trimmed) );                
        [ indicesR, pointsR ] = findClosest3PointsNotOnOneLine( d1_trimmed, d2_trimmed, selectR );        
        selectL = find( (d1_trimmed<0) .* (absd2_trimmed<=absd1_trimmed) );       
        [ indicesL, pointsL ] = findClosest3PointsNotOnOneLine( d1_trimmed, d2_trimmed, selectL );       
        selectT = find( (d2_trimmed>0) .* (absd1_trimmed<=absd2_trimmed) );        
        [ indicesT, pointsT ] = findClosest3PointsNotOnOneLine( d1_trimmed, d2_trimmed, selectT );        
        selectB = find( (d2_trimmed<0) .* (absd1_trimmed<=absd2_trimmed) );        
        [ indicesB, pointsB ] = findClosest3PointsNotOnOneLine( d1_trimmed, d2_trimmed, selectB );        
        
        fprintf( 'R:%d - L:%d - T:%d - B:%d\n', length(selectR), length(selectL), length(selectT), length(selectB));
        fprintf( 'R:%d - L:%d - T:%d - B:%d\n', length(indicesR),length(indicesL),length(indicesT),length(indicesB));
        
        %% try wether (R and L) are complete
        if ( length(indicesR)>=3 ) && ( length(indicesL)>=3 )

            XR = findEstimationThroughPoints( pointsR, point-point, X_trimmed( indicesR ) );
            YR = findEstimationThroughPoints( pointsR, point-point, Y_trimmed( indicesR ) );

            XL = findEstimationThroughPoints( pointsL, point-point, X_trimmed( indicesL ) );
            YL = findEstimationThroughPoints( pointsL, point-point, Y_trimmed( indicesL ) );
            
            pointsLS = [ pointsR ; pointsL ];
            indicesLS = [ indicesR indicesL ];
            
            XLS = findEstimationThroughLS( pointsLS, point-point, X_trimmed( indicesLS ) ); 
            YLS = findEstimationThroughLS( pointsLS, point-point, Y_trimmed( indicesLS ) );
            
            Xavg = sum(X_trimmed( indicesLS ) ) / length(indicesLS);
            Yavg = sum(Y_trimmed( indicesLS ) ) / length(indicesLS);
            
%            point
%            R = [ pointsR X_trimmed( indicesR )' ]
%            L = [ pointsL X_trimmed( indicesL )' ]
            
            if (abs(XL -XR) < abs( Xavg * Xeps ) ) && ...
               (abs(XLS-XL) < abs( Xavg * Xeps ) ) && ...
               (abs(YL -YR) < abs( Yavg * Yeps ) ) && ...
               (abs(YLS-YL) < abs( Yavg * Yeps ) )

               x_i = (XL+XR+XLS)/3;
               y_i = (YL+YR+YLS)/3;
               status=2;
               return;
            end 
        end
        
        %% try wether (T and B) are complete
        if ( length(indicesT)>=3 ) && ( length(indicesB)>=3 )

        
            
            XT = findEstimationThroughPoints( pointsT, point-point, X_trimmed( indicesT ) )
            YT = findEstimationThroughPoints( pointsT, point-point, Y_trimmed( indicesT ) );

            XB = findEstimationThroughPoints( pointsB, point-point, X_trimmed( indicesB ) );
            YB = findEstimationThroughPoints( pointsB, point-point, Y_trimmed( indicesB ) );
            
            pointsLS = [ pointsT ; pointsB ];
            indicesLS = [ indicesT indicesB ];
            
            XLS = findEstimationThroughLS( pointsLS, point-point, X_trimmed( indicesLS ) ); 
            YLS = findEstimationThroughLS( pointsLS, point-point, Y_trimmed( indicesLS ) );
            
            Xavg = sum(X_trimmed( indicesLS ) ) / length(indicesLS);
            Yavg = sum(Y_trimmed( indicesLS ) ) / length(indicesLS);
            
            if (abs(XT -XB) < abs( Xavg * Xeps ) ) && ...
               (abs(XLS-XB) < abs( Xavg * Xeps ) ) && ...
               (abs(YT -YB) < abs( Yavg * Yeps ) ) && ...
               (abs(YLS-YB) < abs( Yavg * Yeps ) )

               x_i = (XT+XB+XLS)/3;
               y_i = (YT+YB+YLS)/3;
               status=2;
               return;
            end
        end            
    end        
end

status=0;
x_i=0;
y_i=0;

end

function [ indices, points ] = findClosest3PointsNotOnOneLine( u, v, select )
%%
%% find the smallest 3 indices i1,i2,i3 that occur in select so that 
%% ( u(i1), v(i1) )  ( u(i2), v(i2) )  ( u(i3), v(i3) )  
%% descibe a single plane
%%
%% and there exists an alpha_b so that  select(alpha_b)=indices(b)
%%
%% returns an empty matrix if no three such indices exist
%%
%% points(b) is constructed as [ u(indices(b)) v(indices(b)) ]
%%
    if length( select )<3
        indices = [];
        points = [];
        return; 
    else
        points(1, :) = [ u( select(1) ) v( select(1) ) ]; 
        points(2, :) = [ u( select(2) ) v( select(2) ) ];
        v1 = points(2,:)-points(1,:);
        for k=3:length(select) 
            p = [ u( select(k) ) v( select(k) ) ];
            v2 = p - points(1,:);
            
            if norm(v1)>0 && norm(v2)>0
                dotprod = (dot( v2, v1 ) / (norm(v1)*norm(v2)));                
                if  abs(dotprod) >= (1-1e-6)
                    %%this point is not an option since it is allmost on one
                    %%line with the previous two points      
                else
                   points(3, :) = p;
                   indices = [ 1 2 select(k) ];
%                   points
%                   v2
%                   v1
%                   dotprod
                   return;
                end
            end
        end           
    end        

    indices=[];
    points =[];
    
end

function [ Xest ] = findEstimationThroughPoints( points, point, X );
%%
%% points is an array with 3 rows, each row contains the coordinates of a point in
%% 2D-space
%%
%% point is a vector with the coordinates of a point in 2D space
%%
%% X is a vector that contains the fuction value for each point in points


[A B C D]= findPlane( points( 1,1 ), points( 1,2), X(1), ...
                      points( 2,1 ), points( 2,2), X(2), ...
                      points( 3,1 ), points( 3,2), X(3) );

if C==0                  
   [ A B C D ]
   points
   X
end
                  
Xest = (D - A * point(1) - B*point(2))/C;

end

function [Xest] = findEstimationThroughLS( points, point, X ); 
%%
%% points is an array with 3 or more rows, each row contains the coordinates of a point in
%% 2D-space
%%
%% point is a vector with the coordinates of a point in 2D space
%%
%% X is a vector that contains the fuction value for each point in points

%% we assume that not all points will be on a single line,
%% so we can simply solve the least-square matrix

%%first, we assume D!=0 (chose=1) and we solve
%% [ x0 y0 z0 ] [ A ]   [1]
%% ...          [ B ] = ...
%% [ xn yn zn ] [ C ]   [1]
%% in a least-squares fashion

[rows cols] = size(points);
Bm = ones( rows, 1 );

Am = [ points X' ];
P = Am\Bm;
A = P(1);
B = P(2);
C = P(3);
D = 1;

%%if D in reality was 0, the least squares fit should result in problems
%%for A,B or C
%% for now, we just return +inf for Xest
if isfinite( A ) && ...
   isfinite( B ) && ...
   isfinite( C ) 
    
    Xest = (D - A*point(1) -B*point(2)) / C;
else
    Xest = inf;
    fprintf(1, 'warning: unable to find least-squares solution with D=1\n' );
    points
    X    
end





end