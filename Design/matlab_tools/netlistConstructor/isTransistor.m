function [ result ] = isTransistor( device )
% function [ result ] = isTransistor( device )
% 
% <result>=1 if device.class=='transistor'
% <result>=0 otherwise

  if strcmp( device.class, 'transistor' )
      result=1;
  else
      result=0;
  end
  
end
