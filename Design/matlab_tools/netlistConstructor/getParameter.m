function [ value ] = getParameter( params, paramName )
%function [ value ] = getParameter( params, paramName )


  i = find( strcmp( paramName, params.names ) );

  if length(i)==0
    params
    error( 'no parameter "%s" in params\n', paramName );
  end

  value = params.values( i(1) );



end
