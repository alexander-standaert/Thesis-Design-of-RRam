function [ line ] = writeWave( wave, nodeName )
% function [ line ] = writeWave( wave, nodeName )
%   return a text line for a pwl-type vsource, driving the specified nodeName, 
%
%    wave.values = [ 1 0 0 1 0   1 0 0 0 1   0 1 0 1 0   0 0 1 0 1  0 0 ]
%    wave.period = 2e-9;
%    wave.rt = 50e-12;
%    wave.v  = 1
%
%    transistion happens from   i*period-rt to i*period, with i=0,1,2,...
%    
%    values must be 0/1 ; are transformed to 0/v

  v=wave.v;

  line = sprintf( 'V%s ( %s 0 ) vsource type=pwl\n', nodeName, nodeName ) ;
  line = sprintf( '%s+ wave=[\n', line ); 
  
  t0 = 0*wave.period;
  t1 = 1*wave.period-wave.rt;
  t2 = 1*wave.period;
    
  line = sprintf( '%s+ %g %g   %g %g  %g %g\n', line, ...
         t0, wave.values(1)*v, t1, wave.values(1)*v, t2, wave.values(2)*v );   
  
    
  for i=2:( length(wave.values)-1 ) 
    t1 = (i  )*wave.period-wave.rt;
    t2 = (i  )*wave.period;
    
    line = sprintf( '%s+ %g %g   %g %g \n', line, ...
                         t1, wave.values(i)*v, t2, wave.values(i+1)*v );   
  end
  line = sprintf( '%s+ ]\n',line); 

end
