function [ sim tree ] = makeLongPlot( ) 

    try
        
        filter = 'V\(n.*\)';    
        filename = 'generatedNetlist/RClong.tr0';
        
        [ sim tree ] = readCSDF( filename, filter );        
        
   
        makePlots( sim, 1 );
    catch e
        fprintf( 'Failed to load data and make plot.\n' );
        fprintf( 'Make sure you added the matlab scripts to the matlab path.\n' );
        fprintf( 'Make sure you added SignalStorage.jar to the java path.\n' );
        
        fprintf( ' > cd ..\n > setupPaths \n' );
                
        rethrow(e);
    end
       
end


function [ ] = makePlots( sim, basePlotId ) 
    
    figure( basePlotId ); 
    
    for i=1:1000
        ni = sim.getSignal( sprintf( 'V(n%d)', i)  );
        plotSignal( ni, '--r' );
        hold on;
    end    
    
end


