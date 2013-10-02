function [ browser ] = signalStorageBrowser( argument )
% function [ browser ] = signalStorageBrowser( [signalStorageDatabase | path | file ] ))
% 
% open a new signalStorageBrowser window.
%
% If a signalStorageDatabase is provided (previously loaded), this 
% database is browsed.
%
% If a pathname (string) is provided, the wavebrowser will start with a 
% file selection window, starting in that directory.
%
% If no argument is provided, the browser is started in the current directory.
%
%   author:     Stefan Cosemans
%   created:    11/10/2011

    import be.kuleuven.micas.signalStorage.simulationBrowser.*
    import be.kuleuven.micas.signalStorage.SimulationLoader;
    
    if( nargin==0 )
        browser = SimulationBrowser( pwd() );
    elseif( isjava( argument ) ) 
        browser = SimulationBrowser( argument );
    elseif( isa( argument, 'char' ) )
        if exist( argument, 'dir' )
            browser = SimulationBrowser( argument );
        elseif exist( argument, 'file' )
            SimulationLoader.loadSimulation(argument);
            sim = SimulationLoader.loadSimulation(argument);
            browser = SimulationBrowser( sim );
        else
            fprintf( [ 'WARNING (signalStorageBrowser): Can''t find file "' argument '"\n' ] );
            browser = SimulationBrowser( pwd() );    
        end
    else
        fprintf( 'WARNING (signalStorageBrowser): I don''t understand the provided argument\n' );
        browser = SimulationBrowser( pwd() );
    end        

    setGlobal( 'holdAll', 0 );
    setGlobal( 'useNewStrip', 0 );
    setGlobal( 'gridOn', 1' );
    setGlobal( 'updateLegend', 1 );

    UWIViewerObject = browser.getSimulationObject;
    assignin( 'base', 'UWIViewerObject', UWIViewerObject )

end