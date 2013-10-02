function [ options ] = eNT( unitString ) 
%  function [ options ] = eNT( unitString ) 
%
%  see 
%  help engineeringNotationTemplate

  if nargin<1  
      options = engineeringNotationTemplate( );
  else      
      options = engineeringNotationTemplate( unitString );
  end
  return

end
