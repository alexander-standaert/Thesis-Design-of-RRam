function [ vsource ] = makeVsource( name, nodes, type, voltage )
% function [ vsource ] = makeVsource( name, nodes, type, voltage )
% 
% returns a device structure with following fields:
%
%  t.name  : device name
%  t.nodes : (n1 n2)
%  t.type  : structure with fields .name  
%            todo: add mismatch
%            should be obtained from getIdealDevices().c
%  t.paramNames  = { 'dc' }
%  t.paramValues = [ voltage ]
%

vsource.name=name;
vsource.nodes=nodes;
vsource.type=type;
vsource.paramNames = { 'dc' };
vsource.paramValues = [ voltage ];  

vsource.class = 'Vsource';

end
