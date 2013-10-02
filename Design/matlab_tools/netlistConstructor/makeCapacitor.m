function [ cap ] = makeCapacitor( name, nodes, type, capacitance )
% function [ cap ] = makeCapacitor( name, nodes, type, capacitance )
% 
% returns a device structure with following fields:
%
%  t.name  : transistor name
%  t.nodes : (n1 n2)
%  t.type  : structure with fields .name  
%            todo: add mismatch
%            should be obtained from getIdealDevices().c
%  t.paramNames  = { 'c' }
%  t.paramValues = [ capacitance ]
%

cap.name=name;
cap.nodes=nodes;
cap.type=type;
cap.paramNames = { 'c' };
cap.paramValues = [ capacitance ];  

cap.class = 'capacitor';

end
