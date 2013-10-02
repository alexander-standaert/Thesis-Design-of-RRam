function [ rotated ] = rotateSignal( in, xc, yc, angle )
% function [ rotated ] = rotateSignal( in, angle )
%   rotate the signal counterclockwise over an angle 'angle' 
%   (expressed in radians), around the given point ( xc,yc )
%

if( ~isjava( in ) )

    curve = [ in.xValues - xc; in.yValues - yc ]' ;
    rot=[cos(angle) -sin(angle) ; sin(angle) cos(angle) ];
    %c45=cos(pi/4);
    %rot=[c45 -c45 ; c45 c45];

    % rot
    % size( curve )

    rotxy = (rot * curve')';

    rotated=in;

    rotated.xValues = rotxy( :, 1 );
    rotated.yValues = rotxy( :, 2 );
else
    curve = [ in.getXValues()' - xc; in.getYValues()' - yc ]' ;
    rot=[cos(angle) -sin(angle) ; sin(angle) cos(angle) ];    
    rotxy = (rot * curve')';
    
    rotated.xValues = rotxy( :, 1 );
    rotated.yValues = rotxy( :, 2 );    
    
    import be.kuleuven.micas.signals.*;
    rotated = Signal( rotated.xValues, in.getXName(), in.getXUnit(), ...
                      rotated.yValues, in.getYName(), in.getYUnit() );
    
end



%r=sqrt(xv.^2+yv.^2);
%theta = atan( yv ./ xv ) + pi .* (xv<0) ;
%
%rotated.xValues = (r.* cos( theta+angle )) + xc;
%rotated.yValues = (r.* sin( theta+angle )) + yc;



