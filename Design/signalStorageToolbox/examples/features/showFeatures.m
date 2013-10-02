function [ sim tree ] = showFeatures( ) 

    try
        doit();
    catch e
        fprintf( 'Failed to load data and make plot.\n' );
        fprintf( 'Make sure you added the matlab scripts to the matlab path.\n' );
        fprintf( 'Make sure you added SignalStorage.jar to the java path.\n' );

        fprintf( ' > cd ..\n > setupPaths \n' );
                
        rethrow(e);
    end
       
end


function [ ] = doit( ) 

    %% you can load only the UWI header  -- this is a NamesIndex
    [ header ] = readUWIHeader( 'UWI/tran1.tran.HDR' );
    header.getNumberOfSignalNames()    
    javaStrings = header.getAllNames()
    matlabStrings = javaStringArrayToMatlab( javaStrings )
    
    % you can use java regular expressions to filter for specific names
    header.getNamesForFilter( '^V.*|a.' )    
    
    %% you can also construct a tree.  This can take quite some time,
    %  but if you pass tree to your workspace, you can use tab-completion
    %  for signal names
    [ header tree ] = readUWIHeader( 'UWI/tran1.tran.HDR' );
    fprintf( 'example tree leaf content: tree.Xdecoder.Xand_0_2.outBar="%s"\n', tree.Xdecoder.Xand_0_2.outBar );
    
    
    %% you can reuse the UWI header to load a corresponding datafile
    %  without reloading the header.  This can be a time-saver for
    %  repetitive simulations, such as a sweep.
    %
    %  you can also request the UWI library plugin to not write out 
    %  headers by specifying UWI_HEADER=NH
    
    filter = '';
    %exactNames = { 'a0' };
    exactNames = { };
    %[ sim tree2 ] = readUWICompressed( 'UWI/tran1.tran.COF', filter, exactNames, header );
    [ sim tree2 ] = readUWINonCompressed( 'UWI/tran1.tran.NCF', filter, exactNames, header );
    
    %% When a signal that is not loaded is requested, an exception is
    %  thrown.  The exception can either say that the name does not
    %  exist (based on the header information), or that the signal has
    %  not been loaded from disk
    try 
        sim.getSignal( 'a1' );
    catch e        
        fprintf( 'when a requested signal exists but is not loaded from disk, an exception is thrown:\n%s\n\n', e.message );
    end
    
    try 
        sim.load( 'Vbanaan' );
    catch e        
        fprintf( 'when a requested signal does not exist (according to the header), an exception is thrown:\n%s\n\n', e.message );
    end
    
    %sim.load( [ 'signal_name' , 'Vbanaan' ] );
    
    %% you can later load additional signals, by filter and/or by exactNames
    sim.load( { 'a1', 'a2' }  );
    %sim.load( { 'a1', 'a2' }  );
    sim.load( '^V.*' );
    % or directly as
    sim.load( '^V.*', { 'a1', 'a2' }  );
    
    %% when an unkown signal is requested, an exception is thrown
    try 
        sim.load( { 'Vbanaan', 'a1', 'a2' }  );
    catch e        
        fprintf( 'when an unkown signal is requested, an exception is thrown:\n%s', e.message );
    end
    %sim.load( { 'a1', 'a2' }  );
    sim.load( { 'a1', 'a2' }  );  % doesn't reload signals if they are already available ...
    
    
    
    %% after a simulation changed on disk, you can reload all signals
    sim.reload();
    
    %% to get a Signal (java object) :
    a1 = sim.getSignal( 'a1' );
    
    %% get yValues and xValues ( auto-converted to matlab )
    plot( a1.getXValues(), a1.getYValues(), '-ro' );    
    hold on;
    
    %% wrapper function to plot a signal
    plotSignal( a1, '-b', 'lineWidth', 2 );
    
    %% request id of source file
    char( sim.getSourceDescription() )
    
    fprintf( '================================== end reached\n');
    
end


