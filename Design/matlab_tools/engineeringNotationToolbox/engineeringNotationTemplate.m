function [ options ] = engineeringNotationTemplate( unitString ) 
% 
% function [ options ] = engineeringNotationTemplate( unitString ) 
%
% make a template to write values with unit <unitString> in
% engineering notation  ( nA, pA, uA, ... )
%
%
% usage:
% template = eNT( 'A' );
% valueString = eN( value, template )



  if nargin < 1 
    options.unitString='';
  else
    options.unitString=unitString;
  end

  options.plusSign='';
  options.minusSign='-';
  
  options.spaceBeforeSymbol='';
  options.spaceBeforeUnit  ='';
  

  options.maxDigits=4;
  options.maxDigitsAfterDot=3;
  
  options.maxExp=12;  % replace up to tera
  options.minExp=-18;  %use up to atto

%  options to shift theshold point at which to change exponent value for
%  values with abs(value)<1
  
%  options.preferShift = 0;  % 0.1 -> 0.1V, 0.099 -> 99mV
  options.preferShift = 1;  % 0.99 ->990mV, 1 -> 1V
  options.forceShift  = false;

%  usefull setting when all should be mV
%  options.preferShift = 3;  % 9.99V -> 9990mV, 10 -> 10V  
%  options.forceShift = true;

end
