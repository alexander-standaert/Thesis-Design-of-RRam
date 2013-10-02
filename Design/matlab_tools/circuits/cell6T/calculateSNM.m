function [ SNM SNM_1 SNM_2 square1 square2 ] = calculateSNM( sim, figureId )
% function [ SNM_1 SNM_2 SNM ] = 
%   calculateSNM( sim, figureId );
%
% 

    % calculate SNM
    % -------------
       
    signalQBarWhenQFixed=getSignal( sim, 'QBar1' ); 
    signalQWhenQBarFixed=getSignal( sim, 'Q2'    );

    doPlot=( figureId ~= 0 );  %detailed internal plots ... 1=enable, 0=disable
    
    [ SNM SNM_1 SNM_2 square1 square2 ] = ...
      findSNM( signalQBarWhenQFixed, signalQWhenQBarFixed, doPlot );


    if doPlot
        fprintf( 1, 'SNM=%4.2fmV, SNM1=%4.2fmV, SNM2=%4.2fmV\n', SNM*1000, SNM_1*1000,SNM_2*1000);

        figure( figureId );
        title( 'butterfly curves' );
    
        % sweep Q
        Q    = signalQBarWhenQFixed.xValues;
        QBar = signalQBarWhenQFixed.yValues;        
%        plot( Q, QBar , style );
        plot( Q, QBar , 'k-', 'LineWidth', 2 );

        % sweep QBar
        hold on;
        QBar = signalQWhenQBarFixed.xValues;
        Q    = signalQWhenQBarFixed.yValues;        
%        plot( Q,  QBar , style );
        plot( Q,  QBar , 'r--', 'LineWidth', 2 );
        grid on;
        
        xlabel('V_{l} [V]');
        ylabel('V_{r} [V]');
        
        legend( {'V_{r} when V_{l} fixed', 'V_{l} when V_{r} fixed' } );
        title( 'Butterfly curve');
        
        set(gca, 'GridLineStyle', '--' );  
        
    end

    
    
end