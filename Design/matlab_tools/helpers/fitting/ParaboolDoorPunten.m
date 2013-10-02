function [A B C] = ParaboolDoorPunten( x0,x1,x2, y0,y1,y2 )
% function [A B C] = ParaboolDoorPunten( x0,x1,x2, y0,y1,y2 )
%
% documentation not verified
%
% return the coefficients of the parabola through the three given points
% parabola is A x^2 + B x + C
%
% source ??

if x1==x0 | x2==x0 | x1==x2
  A=nan;
  B=nan;
  C=nan;

else 

noemer = -x1*x2^2+ x1* x0^2+ x0* x2^2+ x2* x1^2- x2* x0^2- x0* x1^2;
Ateller= x2*y1 - x1*y2 - x0*y1 + x0*y2 - x2*y0 + x1*y0;
Bteller=-(-x1^2*y2 + x1^2*y0 + x0^2*y2 - y0* x2^2+ y1* x2^2- y1* x0^2);
Cteller=-x1^2*x0*y2 + x1^2*x2*y0 + x0^2*x1*y2 - y0*x1*x2^2+ ...
        y1*x0*x2^2- x0^2*x2*y1;

noemer = -x1*x2^2+ x1* x0^2+ x0* x2^2+ x2* x1^2- x2* x0^2- x0* x1^2;

A=Ateller/noemer;
B=Bteller/noemer;
C=Cteller/noemer;

end


