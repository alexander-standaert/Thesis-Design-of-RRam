function [ netlist ] = ...
  excitationBar( name, numberOfBits, values, low, high, period, risetime )
%function [ netlist ] = ...
%  excitation( name, indices, values, low, high, period, risetime )
%
% generates a PWL for each name_index and name_index
%   with index 0...numberOfBits-1
%
% generate error when a value does not fit in numberOfBits
%
% featuring the requested values.  
% values(0) is the initial condition
% values(i) is applied from (i-1)*period to i*period
% low is the voltage used when signal is logic 0, high when logic 1
%

for k=1:length(values)
  if values(k)<0 || values(k)>((2^numberOfBits)-1)
    error( 'value %g does not fit in %d number of bits\n', values(k) , numberOfBits );
  end
end

netlist = sprintf( '\n\n' );

for i=1:numberOfBits
  bitIndex=i-1;  
    
  netlist = sprintf( '%sV%s_%d ( %s_%d 0 ) vsource type=pwl wave=[ \n+   ', netlist, name, bitIndex, name, bitIndex );   
  
  % write out first value
  time0 = 0;
  v0 = getVoltageBar( values(1), bitIndex, low, high );
  netlist = sprintf( '%s%g %g', netlist, time0, v0);   

  for j=2:length(values)
    if( mod( j,4 ) == 0 )
      netlist = sprintf('%s\n+   ', netlist);
    end
    time0 = (period)*(j-2)+risetime;
    v0    = getVoltageBar( values(j), bitIndex, low, high );
    time1 = (period)*(j-1);
    v1    = v0;
    netlist = sprintf( '%s %g %g %g %g  ', netlist, time0,v0, time1,v1 ) ; 
  end
  netlist = sprintf( '%s ]\n', netlist);

end

end



function [ bit ] = getBit( value, bitIndex )
% return the bit at index bitIndex ( starting at 0 for the LSB )
  bit = mod( floor( value/(2^bitIndex)),2 );
end


function [ v ] = getVoltageBar( value, bitIndex, low, high )
  bit = getBit( value, bitIndex );
  %note: swapped
  if bit==0
    v=high;
  else
    v=low;
  end
  
end
