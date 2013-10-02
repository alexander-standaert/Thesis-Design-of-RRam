function [style] = getStyle( vector ) 
%%function [style] = getStyle( vector ) 
%%
%% returns a style-structure as used by myplot
%% 
%% vector = [ symbol_style, symbol_size, face_color, edge_color ]
%% where vector(i) is an index into the possible options
%% and we use a simple modulo-wrap around scheme


%% style.base = '--r.'
%% style.MarkerSize = 1..
%% style.MarkerEdgeColor = 'k', 'b', ...
%% style.MarkerFaceColor = 'k', 'b', ...

l = length(vector);

if l<4
   vector = [ vector ones( 1, 4-l) ];
end

symbols = { 'o', 's', 'd', 'h', 'p', '>', '<', '^', 'v', '.', '+','x', '*' };
colors = { 'k', 'b', 'r', 'g', 'm', 'c' , 'y' };

symbolIndex = mod( vector(1), length( symbols ) )+1;
c1Index = mod( vector(2), length( colors ) )+1;
c2Index = mod( vector(3), length( colors ) )+1;

style.base = sprintf( 'r%s',symbols{ symbolIndex } );
style.MarkerSize = 5 + vector(4)*2;
style.MarkerEdgeColor = colors{ c1Index };
style.MarkerFaceColor = colors{ c2Index };
