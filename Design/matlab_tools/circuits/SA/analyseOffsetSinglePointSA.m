function [ offset ] = analyseOffsetSinglePointSA( SA )

%     V_in    = getParameter( SA.params, 'V_in'    );
%     V_inBar = getParameter( SA.params, 'V_inBar' );
%     Vindc = (V_in + V_inBar)/2;
%     SA.params = updateParameter( SA.params, 'V_in'    , Vindc   );
%     SA.params = updateParameter( SA.params, 'V_inBar' , Vindc  );    

    Vprech    = getParameter( SA.params, 'Vprech'    );
    Vswing    = getParameter( SA.params, 'Vswing' );

    Vprech    = Vprech - Vswing/2;
    
    SA.params = updateParameter( SA.params, 'Vprech' , Vprech   );
    SA.params = updateParameter( SA.params, 'Vswing' , 0  );    
    
    SA.params = addParameter( SA.params, 'vskew', 0 );

    if existsParameter( SA.params, 'offsetRange' )
        bl= -getParameter( SA.params, 'offsetRange' );   
        bh=  -bl;
    else
        bl= -0.4;   
        bh=  0.4;
    end

    %% find offset loop
    
%    [ resultLow delayD energyD ] = performSingleRun( SA, bl );    
    
        
    SA.params = updateParameter( SA.params, 'vskew', bh );    
    [ result ] = SA.performRun( SA, sprintf( 'skew_%3.5f', bh ) );
    resultHigh = result.result;
    delayD     = result.delay;
    energyD    = result.energy;
    
    while abs( bh-bl ) > 0.0001  
        test = ( bh+bl ) / 2    ;
        
        SA.params = updateParameter( SA.params, 'vskew', test );            
        [ result ] = SA.performRun( SA, sprintf( 'skew_%3.5f', test ) );
        resultTest = result.result;
        delayD     = result.delay;
        energyD    = result.energy;
       
        if sign( resultTest ) == sign( resultHigh ) 
          bh=test;
          %fprintf( 'adjusting higher bound to %3.2fmV\n', test*1000 );
        else
          bl=test; 
          %fprintf( 'adjusting lower bound to %3.2fmV\n', test*1000 );
        end
       
    end
    
    offset = ( bh+bl )/2;
%    fprintf( 'offset is within [%g - %g ] range \n', bl, bh );
    fprintf( 'offset ~= %3.1fmV\n', 1000*offset );
    
end
