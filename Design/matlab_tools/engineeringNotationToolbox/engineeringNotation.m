function [ string ] = engineeringNotation( number, options )
% function [ string ] = engineeringNotation( number, options )
%
% see e.g. http://en.wikipedia.org/wiki/Engineering_notation
%
% there is a shorthand eN( number, options ) that points to this function
%
% the options structure can be used to specify how the output should look like
% A standard template should be obtained with engineeringNotationTemplate(),
% eNT
%


  power   = [ -24 -21 -18 -15 -12 -9 -6 -3 0 3 6 9 12 15 18 21 24 ];   %unit value = 10^power(i)
  prefix  = { 'yocto-', 'zepto-', 'atto-', 'femto-', 'pico-', 'nano-', 'micro-', 'milli-', ...
              '', ...
              'kilo-', 'mega-', 'giga-', 'tera-', 'peta-', 'exa-', 'zetta-', 'yotta-' };
  symbol  = { 'y', 'z', 'a', 'f', 'p', 'n', 'u', 'm', ...
              '', ...
              'k', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y' };
  
  if number==0
     string=['0' options.spaceBeforeUnit options.unitString ];
     return;
  end
          
          
  numberPower = floor( log10( abs( number ) ) )+1 ;  

  % 0.01 ..  0.099 -> -2
  % 0.1  ..  0.999 -> -1
  % 1              ->  0  
  % >1   ..  9.999 ->  1 
  % 10   .. 99.999 ->  2

  numberSign = sign( number );
  signS = options.plusSign;
  if( numberSign<0 )
    signS = options.minusSign;
  end

  %engineeringExp = -3+floor( (numberPower)/3 )*3
  %coefficient = (10^3)*abs(number) / ( 10^(engineeringExp) )
  
  if( (numberPower > 0)  && (~options.forceShift) ) 
      d = 1;
  else
      d = options.preferShift;
  end
      engineeringExp = ( floor( (numberPower-d)/3 )*3 ) ;
      coefficient = abs(number) / ( 10^(engineeringExp ) );

  

  % number of characters after dot in coefficient representation depends
  % on trade-off between number of significant digits and 
  % maxDigitsAfterDot
  coefficientPower = numberPower-engineeringExp;

  digitsAfterDotWithMaxDigits = options.maxDigits-coefficientPower;
  digitsAfterDot = min( digitsAfterDotWithMaxDigits, options.maxDigitsAfterDot );
  format = sprintf( '%%3.%df', digitsAfterDot );

  coefficientS = sprintf( format, coefficient );

%  expS = '';
  if( engineeringExp<options.minExp || engineeringExp>options.maxExp ) 
    %use 1e21 notation
    expS=sprintf('1e%d',engineeringExp);
  else
    %use symbol notation
    i = find( power==engineeringExp );
    expS = [ options.spaceBeforeSymbol symbol{i} ];
  end

  unitS = [ options.spaceBeforeUnit options.unitString ];

  string = [ signS coefficientS expS unitS ];

end
