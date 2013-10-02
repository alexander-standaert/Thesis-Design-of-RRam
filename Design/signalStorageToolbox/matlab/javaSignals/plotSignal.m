function [] = plotSignal( signal, varargin )
% plotSignal( signal, style, ... )
% or 
% plotSignal( signal, optionsStruct, style, ... )
%
% signal:   a java Signal object ( from signalStorageToolbox )
%
% advanced usage
% ==============
%
% if the second parameter is a structure, it is used to pass additional
% information
% optionsStruct.xScale : multiply xValues with this factor
%                        e.g. use xScale = 1e12 to express time in ps
% optionsStruct.yScale : multiply yValues with this factor
%                        e.g. use yScale=1e6 to express currents in uA
%
% all additional parameters are passed to matlab's native plot method
%
% if displayName is not provided in the varargin list, the default 
% signal.getYName() is added as displayName
%
%
% deprecated
% ==========
%
% For legacy support, this method also allows a matlab structure for 
% signal.  This structure should have the following fields:
%
% signal.xValues
% signal.yValues
% signal.xName
% signal.yName
% signal.xUnit
% signal.yUnit

if isjava( signal ) 
    xValues = signal.getXValues();
    yValues = signal.getYValues();
    yName = char( signal.getYName() );
else
    if( isstruct( signal ) )
        xValues = signal.xValues;    
        yValues = signal.yValues;
        yName = signal.yName;
    else
        signal
        error('not a valid signal'); 
    end
end

v = varargin;

% ====================================
% interprete optionsStruct
% ====================================
if ~isempty( varargin ) && isstruct( varargin{1} )
    optionsStruct = varargin{1};
    if isfield( optionsStruct, 'xScale' )
       xValues = xValues * optionsStruct.xScale ;        
    end
    if isfield( optionsStruct, 'yScale' )
       yValues = yValues * optionsStruct.yScale ;        
    end
    
    v = { varargin{2:end} };
end

% ==============================================
% add default displayName unless one is provided
% ==============================================
if sum( strcmpi( 'displayName', v ) )==0
    v = [ v, { 'displayName', yName } ];
end

plot( xValues, yValues, v{:} );  % write varargin as comma seperated list

end

