function [ styleString ] = getStyleByIndex( index, order )
%function [ styleString ] = getStyleByIndex( index, order )
%
%  Get a unique style (matlab plot string) for each given index
%  wraps around after a relatively large index ...
%
%  if order==1
%  first cycles through dot styles,
%  next cycles through colors
%  finally through lines
%
%  if order==2
%  first cycles through colors
%  next cycles through dot styles,
%  finally through lines
%
%  if order==3
%    cycle only true colors and linestyles,
%    do not use symbols
%    first colors, than linestyles
%
%   DEFAULT: order==1

    if nargin<2
        order=1;
    end


    dots   = { '.', 'o', 'x', '+', '*', 's', 'd', 'h' };
    colors = { 'b', 'g', 'r', 'c', 'm', 'y', 'k' };
    lines = { '-', '-.', '--', ':' };

    LD = length( dots );
    LC = length( colors );
    LL = length( lines );

    %index = mod( index, LD*LC*LL ) + 1;
    if order==1
        i1 = mod( index, LD ) + 1;
        i2 = mod( floor( index/LD ) , LC ) + 1;
        i3 = mod( floor( index/LD/LC), LL ) + 1;
        styleString = [ dots{i1} colors{i2} lines{i3} ];
    elseif order==2
        i1 = mod( index, LC ) + 1;
        i2 = mod( floor( index/LC ) , LD ) + 1;
        i3 = mod( floor( index/LD/LC), LL ) + 1;
        styleString = [ dots{i2} colors{i1} lines{i3} ];
    elseif order==3
        i = mod( index, LC*LL )+1;
        i1 = mod( i, LC ) + 1;
        i2 = mod( floor( i/LC ) , LL ) + 1;
        styleString = [ colors{i1} lines{i2} ];
    else
        error('unknown style type %d', order );
    end

end


