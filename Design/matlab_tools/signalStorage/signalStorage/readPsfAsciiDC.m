function [ simulation tree ] = readPsfAsciiDC( fileName, filter, exactNames )
% function [ simulation [tree] ] = readPsfAsciiDC( fileName )
%
% <simulation> will be a java object of class
% be.kuleuven.micas.signalStorage.interfaces.SignalDatabase
%
%   <fileName> is the name of the PsfAscii file to be loaded.  It should be
%   the output of a simulation with a single dc point (rather than a dc sweep)
% 
%   use simulation.getHeader() and simulation.getBody() to get to the
%   SimulationHeader and the SimulationBody.
%
%   use simulations.getSignal( Name ) to get the signal with the given name.
%   The signal will contain xValues and yValues with a single value
%
% if output argument <tree> is requested, a hierarchical tree is generated 
%   from the signal names.  Only use this for small simulations!
%
   
   %% read the file
    try
        %import stratocas.simulationOutputReaders.readers.*        
        import be.kuleuven.micas.signalStorage.formats.psfAscii.*; 
        tic;
        simulation = SimulationPsfAsciiDC.read( fileName );
        toc;
    catch exception
        fprintf('readPsfAsciiDC.m: can''t execute java binary \n');
        rethrow( exception );
    end


    %% construct tree if desired
    if nargout>1        
        tstart = tic;
        header = simulation.getHeader();
        yNames = javaStringArrayToMatlab( header.getAllNames() );        
        tree= getTree( yNames );
        telapsed =toc(tstart);
        if( telapsed>0.1 ) 
            fprintf( 'constructing tree took %3.3fs\n', telapsed );
        end
    end
        
    return

end

