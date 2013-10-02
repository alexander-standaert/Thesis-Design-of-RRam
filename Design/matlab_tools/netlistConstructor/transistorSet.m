function [ transistor ] = transistorSet( transistor, fieldName, value )
%function [] = transistorSet( transistor, fieldName, value )
%  fieldName = 'w', 'l', 'shiftVt', shiftBeta'
%  
%  change the given field to the given value

  i = find( strcmp( fieldName, transistor.paramNames ) );

  if isempty(i)
      error( 'no field "%s" in transistor.paramNames\n', transistor.paramNames );
  end

  transistor.paramValues( i(1) ) = value ;

end

