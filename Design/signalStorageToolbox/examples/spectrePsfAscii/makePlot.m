function [ sim tree ] = makePlot( ) 

    try
        filter = '.*';
           
        [ sim tree ] = readPsfAscii( 'decoder.raw/tran1.tran', filter );
        sim.load( '.*' );
        makePlots( sim, 1 );
        
        [ simInvertorSweep tree ] = readPsfAscii( 'invertor.raw/mysweep.dc', filter );
        %simInvertorSweep.load( '.*' );
        figure(5);
        simInvertorSweep.getAllNames()
        in = simInvertorSweep.getSignal( 'in' );        
        out = simInvertorSweep.getSignal( 'out' );
        plotSignal( in, '-r' );
        hold on;        
        plotSignal( out, '--b.' );
        
        
        
        [ simInvertorDC tree ] = readPsfAsciiDC( 'invertor.raw/mydc.dc' );        
        in = simInvertorDC.getSignal( 'in' );
        out = simInvertorDC.getSignal( 'out' );
        plot( in.getYValues(), out.getYValues(), 'mx', 'markerSize', 20 );
        
        % note: single DC point is not yet supported, as it has
        % a slighly different file format ...
        
    catch e
        fprintf( 'Failed to load data and make plot.\n' );
        fprintf( 'Make sure you added the matlab scripts to the matlab path.\n' );
        fprintf( 'Make sure you added SignalStorage.jar to the java path.\n' );

        fprintf( ' > cd ..\n > setupPaths \n' );
                
        rethrow(e);
    end
       
end


function [ ] = makePlots( sim, basePlotId ) 

    a0 = sim.getSignal( 'a0' );
    a1 = sim.getSignal( 'a1' );
    a2 = sim.getSignal( 'a2' );
    a3 = sim.getSignal( 'a3' );
    
    figure( basePlotId ); 
    plotSignal( a0, '--r', 'lineWidth', 2 );
    hold on; grid on;
    plotSignal( a1, '-g' );
    plotSignal( a2, '-b' );
    plot( a3.getXValues(), a3.getYValues(), '-k' );    
    
    l = { 'a0' , 'a1', 'a2', 'a3' };
    try 
        int03 = sim.getSignal( 'Xdecoder.Xand_0_3.outBar' );        
        plotSignal( int03, '-b.' );
        l{end+1} = 'Xdecoder.Xand_0_3.outBar';
    catch e
        fprintf('signal Xdecoder.Xand_0_3.outBar not available\n' );       
        
    end
    legend( l );
    
    
    
    figure( basePlotId+1 );   
    colors = 'bgrk';
    for i=0:15
        S = sim.getSignal( [ 'S_', num2str(i) ] );        
        plotSignal( S, [ colors( mod(i-1,4)+1 ) '-' ] ); 
        hold on; grid on;
    end
    title( 'output signals');
    
    try 
        VddI = sim.getSignal( 'Vvdd:p');    
        figure(basePlotId+2);
        plotSignal( VddI , 'r-' );
        hold on; grid on;
    
        VssI = sim.getSignal( 'Vvss:p');
        plotSignal( VssI , 'b-' );
        
        legend( { char( VddI.getYName() ) , char(  VssI.getYName() ) } );
    catch e        
        fprintf( 'not all currents are available\n'); 
        rethrow( e );
    end

end


