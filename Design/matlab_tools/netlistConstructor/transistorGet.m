function [ value ] = transistorGet( transistor, fieldName )
% function [ value ] = transistorGet( transistor, fieldName )
%  fieldName = 'w', 'l', 'shiftVt', shiftBeta'

  i = find( strcmp( fieldName, transistor.paramNames ) );

  if length(i)==0
    error( 'no field "%s" in transistor.paramNames\n', fieldName );
  end

  value = transistor.paramValues( i(1) );

end
