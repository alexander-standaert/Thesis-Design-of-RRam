function [out] = plotSignal( signal, varargin )
% out = plotSignal( signal, style, ... )
%
% signal should be a structure with
%
% signal.xValues
% signal.yValues
% signal.xName
% signal.yName
% signal.xUnit
% signal.yUnit
%
% OR
%
% a java Signal object, that provides signal.getXValues() and
% signal.getYValues()
%
%   all additional parameters are passed to matlab's native plot method


% if nargin==1
%   style = ':b.';
% end

global useNewStrip;
global gridOn;
global updateLegend;
global holdAll;

if ~holdAll
    hold off
end


if isjava( signal ) 
    xValues = signal.getXValues();
    yValues = signal.getYValues();
else
    if( isstruct( signal ) )
        xValues = signal.xValues;    
        yValues = signal.yValues;
    else
        signal
        error('not a valid signal'); 
    end
end

if useNewStrip
    out = plotStripped( xValues, yValues, varargin{:} );  % write varargin as comma seperated list
else
    out = plot( xValues, yValues, varargin{:} );  % write varargin as comma seperated list
end

if gridOn
   grid on
else
    grid off
end

if updateLegend
   legend off
   legend show
end

if holdAll
    hold all
end

end

