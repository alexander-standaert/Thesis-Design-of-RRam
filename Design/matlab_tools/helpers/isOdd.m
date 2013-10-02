function [ result ] = isOdd( value )
%function [ result ] = isOdd( value )
%
%  if value is an odd  integer, return 1
%  if value is an even integer, return 0
%  if value is not an integer, throw exception

    if value==round(value)
       result = ( round( value/2 )~=value/2 ); 
    else
        error( 'isOdd only accepts integer values. Value=%g', value );
    end
    
end
