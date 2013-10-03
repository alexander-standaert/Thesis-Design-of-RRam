function [ x2 y2 ] = rotatePoint( x1, y1, xc, yc, angle )
% function [ rotated ] = rotatePoint( x1,y1, xc,yc, angle )
%   rotate the point (x1,y1) counterclockwise over an angle 'angle' 
%   (expressed in radians), around the given point ( xc,yc )
%

curve = [ x1 - xc; y1 - yc ]' ;
rot=[cos(angle) -sin(angle) ; sin(angle) cos(angle) ];

% rot
% size( curve )

rotxy = (rot * curve')';

x2 = rotxy( :, 1 );
y2 = rotxy( :, 2 );

end


%r=sqrt(xv.^2+yv.^2);
%theta = atan( yv ./ xv ) + pi .* (xv<0) ;
%
%rotated.xValues = (r.* cos( theta+angle )) + xc;
%rotated.yValues = (r.* sin( theta+angle )) + yc;



