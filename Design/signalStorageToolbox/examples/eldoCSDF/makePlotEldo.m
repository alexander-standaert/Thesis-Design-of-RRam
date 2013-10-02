function [ sim tree ] = makePlot( ) 

    try
        
        filter = '.*N.*';    
        
        % transient
        filename = 'RC_csdf.tr1';        
        [ sim tree ] = readCSDF( filename, filter );   
        makePlots( sim, 1 );
        
        %dc
        filename = 'RC_csdf.sw0';        
        [ sim tree ] = readCSDF( filename, filter );   
        makePlots( sim, 2 );
        
        
    catch e
        fprintf( 'Failed to load data and make plot.\n' );
        fprintf( 'Make sure you added the matlab scripts to the matlab path.\n' );
        fprintf( 'Make sure you added SignalStorage.jar to the java path.\n' );
        
        fprintf( ' > cd ..\n > setupPaths \n' );
                
        rethrow(e);
    end
       
end


function [ ] = makePlots( sim, basePlotId ) 

    n1 = sim.getSignal( 'V(N1)' );
    n2 = sim.getSignal( 'V(N2)' );
    n3 = sim.getSignal( 'V(N3)' );
    n4 = sim.getSignal( 'V(N4)' );
    n5 = sim.getSignal( 'V(N5)' );
    
    fprintf( 'X: %s [%s] ;  Y= %s [%s] \n', char( n1.getXName() ) , char( n1.getXUnit() ), ...
                                            char( n1.getYName() ) , char( n1.getYUnit() ) );
    
    figure( basePlotId ); 
    plotSignal( n1, '--r', 'lineWidth', 2 );
    hold on; grid on;
    plotSignal( n2, '-g' );
    plotSignal( n3, '-b' );
    plot( n4.getXValues(), n4.getYValues(), '-k' );        
    plotSignal( n5, '-g' );

    l = { 'n1', 'n2', 'n3', 'n4', 'n5' };
    legend( l );
    
end


