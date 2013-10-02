function [ energy delay ] = analyseEDSinglePointSA( SA )

    
    SA.params = addParameter( SA.params, 'vskew', 0 );

    %% simulation for energy and delay
    [ result ] = SA.performRun( SA, 'ED' );
    
    energy = result.energy;
    delay  = result.delay;
    
    if( SA.expectedResult ~= result.result )
        delay=NaN;
    end
       
    fprintf( 'delay=%4.3fps, energy=%4.3ffJ\n', delay*1e12, energy*1e15 );    
    
end
