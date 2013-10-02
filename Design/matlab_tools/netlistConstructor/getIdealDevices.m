function [ types ] = getIdealDevices() 
%
% returns a structure with idealised devices
% to use these, include the file "idealDevices.scs" in your spectre
% netlist
%
%  types.R
%  %%types.L
%  types.C
%  types.switch
%  types.vsource


% -- splvt
types.capacitor.name = 'capacitor';

types.resistor.name = 'resistor';

types.switch.name  = 'myswitch';

types.vsource.name  = 'vsource type=dc ';

end
