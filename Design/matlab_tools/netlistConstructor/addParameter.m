function [ paramsOut ] = addParameter( params, paramName, paramValue )
%function [ paramsOut ] = addParameter( params, paramName, paramValue )
%
% pass params='' to create new parameter structure 
%
% result is 
% params.names  = { 'p1', 'p2' }
% params.values = [  v1    v2  ]

  if length( params ) == 0 
    paramsOut.names  = {}; 
    paramsOut.values = [];
  else
    paramsOut = params;
  end
 
  paramsOut.names{  end+1 } = paramName;
  paramsOut.values( end+1 ) = paramValue;

end
