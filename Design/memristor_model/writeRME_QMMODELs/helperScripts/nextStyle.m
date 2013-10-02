function [ style ] = nextStyle( setOrder, setIndex  )
% function [ style ] = nextStyle( setOrder, setIndex  )
%
% get a new matlab style string, e.g '.r--'.
% 
% if no parameters are provided; their previous value is used.  The index
% is increased by one
%
%   setIndex : force to use this index, next call without parameters, this
%              index will be used as calculation basis
%   setOrder : select from different styleLists

    persistent index;
    persistent order;
    
    if isempty( index )
       index=0; 
    end
    if isempty( order )
        order=2;
    end
    
    if nargin>0
        order=setOrder;
    end
    
    if nargin>1 
        index=setIndex; 
    end
    
    
    style = getStyleByIndex( index, order );
    index=index+1;    

end
