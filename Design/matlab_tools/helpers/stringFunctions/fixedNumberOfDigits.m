function [ string ] = fixedNumberOfDigits( value, numberOfDigits, padSymbol )
%function [ string ] = fixedNumberOfDigits( value, numberOfDigits, padSymbol )
%
%  padSymbol='0', numberOfDigits=5, value=13 gives
%    00013
%
%  if the number does not fit in het provided numberOfDigits, more
%  digits are used.


  test = sprintf( '%d', value );
  L= length(test);

  for i=(L+1):numberOfDigits
    test=sprintf( '%s%s', padSymbol, test );
  end

  string = test;
end
