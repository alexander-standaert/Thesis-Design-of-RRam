function [ bool ] = existsParameter( params, paramName )
% function [ bool ] = existsParameter( params, paramName )
%  returns true if params has a field called paramName
%  returns false otherwise

if sum(strcmp( paramName, params.names ) )>0
   bool=true;
else
    bool=false;
end

end