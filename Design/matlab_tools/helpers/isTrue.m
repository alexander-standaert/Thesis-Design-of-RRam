function [ true ] = isTrue( boolean )
% function [ true ] = isTrue( boolean )
%
% check whether the provided value (should be integer) is true (1) or false (0)
% if "boolean" is anything else than 0 or 1, an exception is thrown 

    if boolean==0
       true = 0;  
    elseif boolean==1
       true = 1;
    else         
        error( 'ERROR: isTrue() - input is not a boolean ( 0 or 1)' );
    end

end