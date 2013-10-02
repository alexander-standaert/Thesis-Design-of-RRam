function [resultVector] = isNear( vector, value )
%
% Returns a vector the same size as vector
% element = 0 when distance to value is smaller than 1e-14
% element = 1 when distance to value is larger than 1e-14

eps=1e-14;

resultVector = ( vector>= (value-eps) ) .* ( vector<= (value+eps) );

end

