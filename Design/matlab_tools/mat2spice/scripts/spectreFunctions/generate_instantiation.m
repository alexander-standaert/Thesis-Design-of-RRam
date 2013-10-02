function [string] = generate_instantiation( topName, nodes, subcktName )
% function [string] = generate_instantiation( topName, nodes, subcktName )
%   topName = 'Xchain'
%   nodes = { 'vdd', 'vss', 'vddBulk', 'vssBulk', ...
%             'in', 'out' };
%   subcktName = 'chain';
%
%   No support for parameters for now
% 
%   Xchain ( vdd vss vddBulk vssBulk in out ) chain 

%NOTE: seems outdated

string= sprintf( '%s ( ', topName );

Lp = 0;

for i=1:length(nodes) 
  string = sprintf('%s %s',string, nodes{i} );
  if ( length(string)-Lp ) > 80
   Lp = length(string);
   string = sprintf('%s\n+  ', string ); 
  end
end

string= sprintf( '%s ) %s', string, subcktName );

end
