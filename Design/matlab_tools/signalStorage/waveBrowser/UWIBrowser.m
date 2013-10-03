function [] = UWIBrowser()
%UWIVIEWER Opens the UWI wave viewer.
%
%   author:     Bram Rooseleer
%   created:    11/04/2011
%   last edit:  12/04/2011
%   status:     beta
%
%   See also REFRESHUWIPLOT.
%
%   Start a new browser.
%   If the current directory contains a UWI output folder, the browser will open this file
%   Otherwise, an empty browser session is started.

import be.kuleuven.micas.signalStorage.simulationBrowser.*

if exist( './out/UWI', 'dir' )
    folder = 'out/UWI';
elseif exist( './UWI', 'dir' )
    folder = 'UWI';
else
    folder = '.';
end

if exist( [folder '/sim.tran.NCF'], 'file' ) && ~exist( [folder '/sim.tran.COF'], 'file' )
    file = '/sim.tran.NCF';
elseif exist( [folder '/sim.tran.COF'], 'file' ) && ~exist( [folder '/sim.tran.NCF'], 'file' )
    file = '/sim.tran.COF';
else
    d = dir( folder );
    names = {d.name};
    f = 0;
    file = '';
    for i=1:numel( names )
        [~, ~, e] = fileparts( names{i} );
        if strcmp( e, '.COF' ) || strcmp( e, '.NCF' )
            if f == 0
                file = ['/' names{i}];
                f = 1;
            else
                file = '';
            end
        end
    end
end

if isempty( file )
    browser = SimulationBrowser( [pwd '/' folder] );
else
    browser = SimulationBrowser( readUWI( [pwd '/' folder file] ) );
end

setGlobal( 'holdAll', 0 );
setGlobal( 'useNewStrip', 0 );
setGlobal( 'gridOn', 1' );
setGlobal( 'updateLegend', 1 );

UWIViewerObject = browser.getSimulationObject;
assignin( 'base', 'UWIViewerObject', UWIViewerObject )
