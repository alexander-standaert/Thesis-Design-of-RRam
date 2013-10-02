function [A B C D] = findPlane( x0, y0, z0, x1, y1, z1, x2, y2, z2 )
%%function [A B C D] = findPlane( d1R, d2R, YR, d1L, d2L, YL, d1T, d2T, YT )
%%
%%  returns A,B,C,D so that A*x+B*y+C*z=D is true for 
%%  (x0, y0, z0), (x1, y1, z1), (x2, y2, z2)
%%
%%  with (A,B,C,D)!=(0,0,0,0)
%%


%% First, we find A B C  from calculating the normal on the plane

v1 = [ x1-x0  y1-y0  z1-z0 ];
v2 = [ x2-x0  y2-y0  z2-z0 ];

try 
    n = cross( v1, v2 );
catch
    v1
    v2
    error('error in cross');
end

A = n(1);
B = n(2);
C = n(3);

%% now, find D by inserting point 0
D = A * x0 + B * y0 +C * z0;
