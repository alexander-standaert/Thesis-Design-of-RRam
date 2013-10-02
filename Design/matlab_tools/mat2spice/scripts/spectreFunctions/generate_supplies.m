function [ string ] = generate_supplies( supplies ) 
%
% function [ string ] = generate_supplies( supplies ) 
%   example
%    supplies.names  = { 'vdd'    , 'vss', 'vddBulk' , 'vssBulk' };
%    supplies.values = [ sp.supply, 0    ,  sp.supply, 0         ];
%   ==> string = "Vvdd (vdd 0) vsource type=dc dc=$<sp.supply>$ \n... "
string='';

for i=1:length(supplies.names)
  name  = supplies.names{i};
  value = supplies.values(i);
  string = sprintf( '%sV%s (%s 0) vsource type=dc dc=%g\n', ...
                    string, name, name, value );
end

