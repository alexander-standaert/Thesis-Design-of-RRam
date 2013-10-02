function [ string ] = eN( number, options )
% function [ string ] = eN( number, options )
  
  
  if( nargin< 2 ) 
    options = eNT();
  end

  string = engineeringNotation( number, options );

end 
