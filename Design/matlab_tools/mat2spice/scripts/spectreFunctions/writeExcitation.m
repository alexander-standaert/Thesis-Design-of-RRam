function [ line ] = writeExcitation( signal, nodeName )
% function [ line ] = writeExcitation( signal, nodeName )
%   return a text line for a pwl-type vsource  for the given signal, 
%   applied to the given nodeName
%

  line = sprintf( 'V%s ( %s 0 ) vsource type=pwl\n', nodeName, nodeName ) ;
    line = sprintf( '%s+ wave=[\n', line ); 
  for i=1:length(signal.xValues)
    line = sprintf( '%s+ %g %g\n', line, signal.xValues(i), signal.yValues(i) );   
  end
  line = sprintf( '%s+ ]\n',line); 

end
