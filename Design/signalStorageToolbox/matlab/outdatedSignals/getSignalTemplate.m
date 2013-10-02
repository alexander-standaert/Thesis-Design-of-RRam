function [ signal ] = getSignalTemplate( name )
% function [ signal ] = getSignal( name )
% create an empty signal with the correct fields and the given name

  signal.xName = 'x';
  signal.xUnit = 'ux';
  signal.yName = name;
  signal.yUnit = 'uy';

  signal.xValues = [];
  signal.yValues = [];

end 
