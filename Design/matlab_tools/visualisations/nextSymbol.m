function [ symbol ] = nextStyle( setIndex  )
% function [ symbol ] = nextSymbol( [ setIndex ] )
%
% get a new matlab symbol character, e.g '.' or 'd'
% 
% if no parameters are provided; their previous value is used.  The index
% is increased by one
%
%   setIndex : force to use this index, next call without parameters, this
%              index will be used as calculation basis

    persistent index;    
    
    if isempty( index )
       index=1; 
    end
    
    if nargin>0
        index=setIndex; 
    end
    
    symbols = { '.', 'o', 'x', 'd', 's', '+', '*', '<', '>', '^', 'h', 'p' } ;
    
    L = length( symbols );
    i = mod( (index-1), L ) + 1;
    
    symbol = symbols{i};
    
    
    index=index+1;    

end
