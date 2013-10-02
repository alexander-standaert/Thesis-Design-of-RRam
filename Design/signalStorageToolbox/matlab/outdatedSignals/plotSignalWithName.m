function [] = plotSignalWithName( simulation, name, varargin )
% function [] = plotSignalWithName( simulation, name, varargin )
%
% plot the signal with the given name from the given signalStorageDatabase
%
% if the signal name does not exist in the signalStorageDatabase;
% an exception is thrown
%
% it the signal exists but is not loaded, we attempt to load the signal
% from the signalStorageDatabase.  This only works if the database is
% loadable and if the source data has not been changed.
% you should not rely on this feature.
%
% NOTE: unlike Anselme's method, this function does not yet support plotting 
%       values from multiple simulations at the same time.
%
    
    if ~simulation.isSignalAvailable( name )
        simulation.loadByName( name );
        fprintf( 'warning: plotSignalWithName: implicitly loaded signal %s\n', name );
    end
    signal = simulation.getSignal( name );
    plotSignal( signal, varargin{:} );
    
end
