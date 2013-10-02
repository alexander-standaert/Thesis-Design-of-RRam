function [string] = prettyPrintInteger( value, digits )
% function [string] = prettyPrintInteger( value, digits )
% prints value which has to be positive integer, and pads with leading zeros
% if value contains more digits than <digits>, it will output xxx

if( value<0 || round(value)~=value || 10^digits<value )
  fprintf( '----------------------------- ERROR ---------------------\n')
  fprintf( '----------------------------- ERROR ---------------------\n')
  fprintf( 'invalid prettyPrintInteger( %g, %g )\n', value, digits );
  string=repeatString('x', digits);
  fprintf( '----------------------------- ERROR ---------------------\n')
  fprintf( '----------------------------- ERROR ---------------------\n')
else
  string = sprintf( '%d', value );
  L = length(string);
  string = sprintf( '%s%s', repeatString('0',digits-L), string );
end

