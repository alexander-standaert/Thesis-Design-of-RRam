function [ optionsMatrix ] = makeAllCombinations( vectors )
% function [ optionsMatrix ] = makeAllCombinations( vectors )
% vectors{1} = [ 1 2 4 ]
% vectors{2} = [ 5 6 7 ]
% ==> optionsMatrix = [ 1 5 ]
%                     [ 1 6 ]
%                     [ 1 7 ]
%                     [ 2 5 ]
%                     [ 2 6 ]
%                     [ 2 7 ]
%                     [ 4 5 ]
%                     [ 4 6 ]
%                     [ 4 7 ]

Nv = length( vectors );
Ni = zeros( 1, Nv );

for i=1:Nv
  Ni(i) = length( vectors{i} );
end

rows = prod( Ni );

optionsMatrix = zeros( rows, Nv );


for i=0:(rows-1)
  for k=1:Nv 
    divider = prod( Ni(k+1:end) );
    t = floor( i/divider );
    o = mod(t, Ni(k) );
    optionsMatrix(i+1, k ) = vectors{k}(o+1);
  end
end
