function [ myswitch ] = makeSwitch( name, nodes, type, Ron, Roff, Cgs, Cgd, Csb, Cdb )
% function [ myswitch ] = makeSwitch( name, nodes, type, Ron, Roff, Cgs, Cgd, Csb, Cdb )
% 
% returns a device structure with following fields:
%
%  t.name  : name of switch instance
%  t.nodes : (s g d b)
%  t.type  : structure with fields .name
%            should be obtained from getIdealDevices().switch
%  t.paramNames  = { 'Ron', 'Roff'    , 'Cgs', 'Cgd', 'Csb', 'Cdb' }
%  t.paramValues = [ width length  0          0 ]
%

%note: current switch has Von=1V, Voff=0V, switching in the middle 0.4-0.6
%      region from Roff to Ron . Control voltage is Vgb

myswitch.name=name;
myswitch.nodes=nodes;
myswitch.type=type;
myswitch.paramNames = { 'Ron', 'Roff', 'Cgs', 'Cgd', 'Csb', 'Cdb' };
myswitch.paramValues = [  Ron  Roff     Cgs    Cgd    Csb    Cdb ];  

end
