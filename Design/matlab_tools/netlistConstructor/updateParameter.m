function [ params ] = updateParameter( params, name, value )
% function [ params ] = updateParameter( params, name, value )

  i = find( strcmp( params.names, name ),1 )  ;
  if length(i)==0
    params
str    error( 'updating unknown parameter %s\n',name );
  end

  params.values(i) = value;

end

