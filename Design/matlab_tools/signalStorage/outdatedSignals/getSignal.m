function [ signal ] = getSignal( simulation, name, start, stop, move )
% function [ signal ] = getSignal( simulation, name, start, stop,move )
% get a signal out of a simulation
%
%   start, stop, move are optional arguments (but all or none)
%   if ommited, the entire range of the signal is used,
%
%   otherwise, only the specified part is returned
%   ( xValues start from start and end at stop )
%   start,stop only works for waves with monotonically increasing xValue
%
%   if move is true (not 0), start is subtracted from all  xValues
%
%  this method supports both simulation structures with
%  (sim.xValues{i}, sim.yValues{i}) pointvectors and simulation
%  structures with shared x-values ( sim.xValues, sim.yValues{i} )
%
%  Notice: if sim is a java object, getSignal( sim, name ) will be passed
%  on to java immediately as sim.getSignal(name) , 
%  without passing through this method!


  indices = find( strcmp( name, simulation.yNames ), 1 );
  if length( indices )==0
    msg = sprintf( 'error: no signal with the given name [%s]', name );
    error(msg);
  end
  

  index = indices(1);

  signal.xName = simulation.xName;
  signal.xUnit = simulation.xUnit;
  signal.yName = simulation.yNames{index};
  signal.yUnit = simulation.yUnits{index};

  if( iscell( simulation.xValues ) ) 
      xValues = simulation.xValues{index};
  else 
      xValues = simulation.xValues;
  end
  
  if nargin==2  % ] -inf, +inf [
    signal.xValues = xValues;
    signal.yValues = simulation.yValues{index};    
  end

  if nargin>2  % [ start stop ]
    inBounds = (xValues>=start) .* ...
               (xValues<=stop);
    indicesToUse = find( inBounds );
    signal.xValues = xValues( indicesToUse );
    signal.yValues = simulation.yValues{index}( indicesToUse );
    if move
      signal.xValues = signal.xValues - start;
    end
  end 

end 
