function [ transistor ] = makeTransistor( name, nodes, type, width, length )
% function [ transistor ] = makeTransistor( name, nodes, type, width, length )
% 
% returns a device structure with following fields:
%
%  t.name  : transistor name
%  t.nodes : (s g d b)
%  t.type  : structure with fields .name, .Advt (V*m), .Adbb0 ( m,that is: %/100 )
%  t.paramNames  = { 'w', 'l'    , 'shiftVt', 'shiftBeta' }
%  t.paramValues = [ width length  0          0 ]
%  t.class : 'transistor'
%

transistor.name=name;
transistor.nodes=nodes;
transistor.type=type;
transistor.paramNames = { 'w', 'l', 'shiftVt', 'shiftBeta' };
transistor.paramValues = [ width length 0 0 ];  

transistor.class = 'transistor';

end
