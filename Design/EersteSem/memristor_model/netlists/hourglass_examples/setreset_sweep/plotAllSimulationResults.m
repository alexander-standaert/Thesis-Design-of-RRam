function [ ] = plotAllSimulationResults( ) 
% function [ ] = plotAllSimulationResults(  ) 
%
% Author: Stefan Cosemans

    summaryPlotOnly = false; %if true, only make the graph f(Vrme) with all ramprates combined

    addpath( '../../matlabHelpers' );
    testAndSetupEnvironment()
        
    [ settings, rampRates ] = simulationSettings();
    
    for i=1:length(rampRates.rampRates)
    %for i=1:1        
        simName  = rampRates.simNames{i};
        rampRate = rampRates.rampRates(i);
        color    = rampRates.colors{i};
        
        baseplotId = i*100+1;
        
        plotSimulationResults( simName, baseplotId, color, settings, rampRate, summaryPlotOnly )        
    end
    
end


function [ sim ] = plotSimulationResults( simName, baseplotId, color, settings, rampRate, summaryPlotOnly )
    simulationFile = sprintf( 'generated/UWI/%s/transient1.tran.NCD', simName);    
    try        
        fprintf( 'loading simulation database [%s]\n', simulationFile );
        tic;        
        printLastFileUpdate( simulationFile );            
        sim = readUWI( simulationFile );
        toc;        
    catch e
        fprintf( '============================================================\n' );
        fprintf( 'Unknown file format or non-existing file "%s".              \n', simulationFile );
        fprintf( '============================================================\n' );        
        rethrow(e);
    end
    
    try
        makePlots( sim, baseplotId, simName, color, settings, summaryPlotOnly );
    catch e
        errorMakePlotMessage( sim, e );
    end
       
end


function [ ] = makePlots( sim, basePlot, simName, color, settings, summaryPlotOnly ) 
        
    if ~summaryPlotOnly
        left  = 0.1;
        width = 0.8;   
        space = 0.015;

        % ==============================================================================
        % plot transient signals on single plot (x=time); y=voltage, current, #particles
        % ==============================================================================

        fig=figure(basePlot);

        bottom = 0.05; height=0.15;
        ax(1) = plot_time_voltage( sim, [ left bottom width height] );
        xlabel('time [ns]' );

        bottom = bottom+height+space; height=0.15;
        ax(end+1) = plot_time_current( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );   

        bottom = bottom+height+space; height=0.2;
        ax(end+1) = plot_time_particles( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );   

        bottom = bottom+height+space; height=0.15;
        ax(end+1) = plot_time_temperature( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        bottom = bottom+height+space; height=0.15;
        ax(end+1) = plot_time_flux( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        title( [ 'simulation ' simName ] );    
        set( fig, 'Name', sprintf( '%d. %s A(t)', basePlot, simName ), 'NumberTitle', 'off' );


        % ==============================================================================
        % plot transient signals on single plot (x=time); y=less important stuff
        % ==============================================================================
        fig=figure(basePlot+1);

        bottom = 0.05; height=0.1;
        ax(end+1) = plot_time_voltage( sim, [ left bottom width height] );
        xlabel('time [ns]' );

        bottom = bottom+height+space; height=0.1;
        ax(end+1) = plot_time_current( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );   

        bottom = bottom+height+space; height=0.125;
        ax(end+1) = plot_time_fluxReductionFactor( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        bottom = bottom+height+space; height=0.125;
        ax(end+1) = plot_time_timestep( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        bottom = bottom+height+space; height=0.125;
        ax(end+1) = plot_time_omega_y( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        bottom = bottom+height+space; height=0.125;
        ax(end+1) = plot_time_counters( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        bottom = bottom+height+space; height=0.125;
        ax(end+1) = plot_time_thresholds( sim, [ left bottom width height] );    
        removeXTicks( ax(end) );    

        title( [ 'simulation ' simName ] );    
        set( fig, 'Name', sprintf( '%d. %s B(t)', basePlot+1, simName ), 'NumberTitle', 'off' );

        % link all time-axes together    
        linkaxes( ax, 'x' );
    end
    
    % ==============================================================================
    % x=Vrme, y=current, particles, temperature    ;; separate graph ; all sweeps on one graph
    % ==============================================================================
    
    if ~summaryPlotOnly
        autocolor=true;
        name = sprintf( '%d. %s f(Vrme)', basePlot+2, simName );
        plot_Vrme_all( sim, basePlot+2, autocolor, color, name, settings );
    end
    
    % now put it all on figure, making 1 plot that contains all ramp rates    
    autocolor = false;
    name = sprintf( '%d. ALL f(Vrme)', 1050 );
    plot_Vrme_all( sim, 1050, autocolor, color, name, settings );    
    
    % =================================================
    % x=Vexternal, y=current
    % =================================================     
    %figure( basePlot+21 );
    %plotCurrentVersusVexternal( sim, '.r-' );    
    %legend show;
    
    % =================================================
    % x=time, y=timestep
    % =================================================     

    
    
        
end

function [  ] = plot_Vrme_all( sim, plotId, autocolor, color, name, settings )
    % with autocolor=true, the curve is colored continuously to indicate time information
    % otherwise, provided color will be used for entire trace
    
    fig = figure( plotId );
    
    left=0.1; width=0.8; space = 0.02;
    
    bottom = 0.05; height=0.3;
    ax(1) = plot_Vrme_current( sim, [ left bottom width height], autocolor, color, settings );
    xlabel( 'V_{RME} [V]' );
    
    bottom = bottom+height+space; height=0.3;
    ax(end+1) = plot_Vrme_particles( sim, [ left bottom width height], autocolor, color, settings );    
    removeXTicks( ax(end) );   
    
    bottom = bottom+height+space; height=0.25;
    ax(end+1) = plot_Vrme_temperature( sim, [ left bottom width height], autocolor, color, settings );    
    removeXTicks( ax(end) );   
    
    axis( ax, 'auto' );
    linkaxes( ax, 'x' ); % link all Vrme-axes together    
    
    title( name );
    set( fig, 'Name', name, 'NumberTitle', 'off' );
end





function [ ax ] = plot_time_voltage( sim, position )
    ax = subplot( 'position', position );
    
    Vexternal  = sim.getSignal( 'external' );
    Vrme = sim.getSignal( 'top_electrode' );
        
    plot( Vexternal.getXValues()/1e-9, Vexternal.getYValues(), 'r-' , 'displayName', 'Vexternal', 'lineWidth', 1 );
    hold on;
    plot( Vrme.getXValues()/1e-9     , Vrme.getYValues(), 'b-' , 'displayName', 'Vrme', 'lineWidth', 2 );    
    grid on;        
    
    ylabel( 'voltage [V]' );
    legend show;    
end

function [ ax ] = plot_time_current( sim, position )
    ax = subplot( 'position', position );
    
    current = sim.getSignal( 'Vexternal:p' );
    plot( current.getXValues()/1e-9, -current.getYValues()/1e-6, 'r-' , 'displayName', 'current' );
    hold on;    
    grid on;            
    ylabel( 'current [uA]' );
    legend show;
end

function [ ax ] = plot_time_particles( sim, position )
    ax = subplot( 'position', position );
    
    n_CO = sim.getSignal( 'Xrme.n_CO' );
    n_TR = sim.getSignal( 'Xrme.n_TR' );
    n_BR = sim.getSignal( 'Xrme.n_BR' );
    n_total = n_CO.add( n_TR ).add( n_BR );
    
    plot( n_CO.getXValues()/1e-9, n_CO.getYValues(), 'r-', 'displayName', 'n_{CO}' );
    hold on;
    plot( n_TR.getXValues()/1e-9, n_TR.getYValues(), 'b-', 'displayName', 'n_{TR}' );
    plot( n_BR.getXValues()/1e-9, n_BR.getYValues(), 'm-', 'displayName', 'n_{BR}' );    
    plot( n_total.getXValues()/1e-9, n_total.getYValues(), 'k--', 'displayName', 'n_{total}' );
    legend show;
    grid on;    
    ylabel( '#particles' );
end

function [ ax ] = plot_time_temperature( sim, position )
    ax = subplot( 'position', position );
    
    temperature = sim.getSignal( 'Xrme.temperature');
    plot( temperature.getXValues()/1e-9, temperature.getYValues(), 'r-', 'displayName', 'temperature' );        
    legend show;
    grid on;    
    ylabel( 'temperature [K]' );
    
end

function [ ax ] = plot_time_flux( sim, position )
    ax = subplot( 'position', position );
    
    flux_BR_to_CO     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_BR_to_CO_plus1000' ] ));
    flux_CO_to_BR     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_CO_to_BR_plus1000' ] ));
    flux_TR_to_CO     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_TR_to_CO_plus1000' ] ));
    flux_CO_to_TR     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_CO_to_TR_plus1000' ] ));

    semilogy( flux_BR_to_CO.getXValues()/1e-9, flux_BR_to_CO.getYValues(), 'r-', 'displayName', 'flux BR to CO' );    
    hold on;
    semilogy( flux_CO_to_BR.getXValues()/1e-9, flux_CO_to_BR.getYValues(), 'b-', 'displayName', 'flux CO to BR' );
    semilogy( flux_TR_to_CO.getXValues()/1e-9, flux_TR_to_CO.getYValues(), 'm-', 'displayName', 'flux TR to CO' );
    semilogy( flux_CO_to_TR.getXValues()/1e-9, flux_CO_to_TR.getYValues(), 'k-', 'displayName', 'flux CO to TR' );

    legend show;
    grid on;    
    ylabel( 'jumps/second [Hz]' );    

end

function [ ax ] = plot_time_fluxReductionFactor( sim, position )
    ax = subplot( 'position', position );

    flux_reduction_factor = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_reduction_factor_plus1000' ] ));
    semilogy( flux_reduction_factor.getXValues()/1e-9, flux_reduction_factor.getYValues(), 'r-', 'displayName', 'flux reduction factor' );
    hold on;
    grid on;    
    ylabel( 'flux reduction' );    
    legend show;
end
    

function [ ax ] = plot_time_timestep( sim, position )
    ax = subplot( 'position', position );
    
    temperature = sim.getSignal( 'Xrme.temperature'); % any signal would do (for a non-compressed format)
    time = temperature.getXValues()';
    step = diff(time);    
    semilogy( time/1e-9, [ NaN step ]/1e-12, '.r', 'displayName', 'timestep')    
    ylabel( 'timestep [ps]' );
    grid on;
end
    

function [ ax ] = plot_time_omega_y( sim, position )
    ax = subplot( 'position', position );
    
    omega_y = sim.getSignal( 'Xrme.log10_omega_y' );
    plot( omega_y.getXValues()/1e-9, omega_y.getYValues(), 'r-' , 'displayName', 'log10(omega_y)' );
    hold on; 
    grid on;
    ylabel( 'log_{10}(omega_y)' );
    legend show;  
end

function [ ax ] = plot_time_counters( sim, position )
    ax = subplot( 'position', position );
    counter_BR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_counter_BR_to_CO_plus1000'  ));
    counter_CO_to_BR = normalizeLog( sim.getSignal( 'Xrme.log10_counter_CO_to_BR_plus1000'  ));
    counter_TR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_counter_TR_to_CO_plus1000'  ));
    counter_CO_to_TR = normalizeLog( sim.getSignal( 'Xrme.log10_counter_CO_to_TR_plus1000'  ));

    jumps_BR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_BR_to_CO_plus1000' ));
    jumps_CO_to_BR = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_CO_to_BR_plus1000' ));
    jumps_TR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_TR_to_CO_plus1000' ));
    jumps_CO_to_TR = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_CO_to_TR_plus1000' ));

    postfix = '';

    logPlot = false;
    if( logPlot )
        semilogy( counter_BR_to_CO.getXValues()/1e-9, counter_BR_to_CO.getYValues(), 'r-', 'displayName', [ 'counter BR to CO ' postfix ] );    
        hold on;
        semilogy( counter_CO_to_BR.getXValues()/1e-9, counter_CO_to_BR.getYValues(), 'b-', 'displayName', [ 'counter CO to BR ' postfix ] );
        semilogy( counter_TR_to_CO.getXValues()/1e-9, counter_TR_to_CO.getYValues(), 'm-', 'displayName', [ 'counter TR to CO ' postfix ] );
        semilogy( counter_CO_to_TR.getXValues()/1e-9, counter_CO_to_TR.getYValues(), 'k-', 'displayName', [ 'counter CO to TR ' postfix ] );

        semilogy( jumps_BR_to_CO.getXValues()/1e-9, jumps_BR_to_CO.getYValues(), 'r--', 'displayName', [ 'jumps BR to CO ' postfix ] );        
        semilogy( jumps_CO_to_BR.getXValues()/1e-9, jumps_CO_to_BR.getYValues(), 'b--', 'displayName', [ 'jumps CO to BR ' postfix ] );
        semilogy( jumps_TR_to_CO.getXValues()/1e-9, jumps_TR_to_CO.getYValues(), 'm--', 'displayName', [ 'jumps TR to CO ' postfix ] );
        semilogy( jumps_CO_to_TR.getXValues()/1e-9, jumps_CO_to_TR.getYValues(), 'k--', 'displayName', [ 'jumps CO to TR ' postfix ] );
        ylabel( 'counter or number of jumps' );
    else
        plot( counter_BR_to_CO.getXValues()/1e-9, counter_BR_to_CO.getYValues(), 'r-', 'displayName', [ 'counter BR to CO ' postfix ] );    
        hold on;
        plot( counter_CO_to_BR.getXValues()/1e-9, counter_CO_to_BR.getYValues(), 'b-', 'displayName', [ 'counter CO to BR ' postfix ] );
        plot( counter_TR_to_CO.getXValues()/1e-9, counter_TR_to_CO.getYValues(), 'm-', 'displayName', [ 'counter TR to CO ' postfix ] );
        plot( counter_CO_to_TR.getXValues()/1e-9, counter_CO_to_TR.getYValues(), 'k-', 'displayName', [ 'counter CO to TR ' postfix ] );

        plot( jumps_BR_to_CO.getXValues()/1e-9, jumps_BR_to_CO.getYValues(), 'r--', 'displayName', [ 'jumps BR to CO ' postfix ] );        
        plot( jumps_CO_to_BR.getXValues()/1e-9, jumps_CO_to_BR.getYValues(), 'b--', 'displayName', [ 'jumps CO to BR ' postfix ] );
        plot( jumps_TR_to_CO.getXValues()/1e-9, jumps_TR_to_CO.getYValues(), 'm--', 'displayName', [ 'jumps TR to CO ' postfix ] );
        plot( jumps_CO_to_TR.getXValues()/1e-9, jumps_CO_to_TR.getYValues(), 'k--', 'displayName', [ 'jumps CO to TR ' postfix ] );
        ylabel( 'counters and number of jumps' );
    end        
    legend show;
    grid on;    
end
    
function [ ax ] = plot_time_thresholds( sim, position )
    ax = subplot( 'position', position );
            
    threshold_BR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_BR_to_CO_plus1000'  ));
    threshold_CO_to_BR = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_CO_to_BR_plus1000'  ));
    threshold_TR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_TR_to_CO_plus1000'  ));
    threshold_CO_to_TR = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_CO_to_TR_plus1000'  ));
    
    plot( threshold_BR_to_CO.getXValues()/1e-9, threshold_BR_to_CO.getYValues(), 'r-', 'displayName', 'BR to CO' );    
    hold on;
    plot( threshold_CO_to_BR.getXValues()/1e-9, threshold_CO_to_BR.getYValues(), 'b-', 'displayName', 'CO to BR' );
    plot( threshold_TR_to_CO.getXValues()/1e-9, threshold_TR_to_CO.getYValues(), 'm-', 'displayName', 'TR to CO' );
    plot( threshold_CO_to_TR.getXValues()/1e-9, threshold_CO_to_TR.getYValues(), 'k-', 'displayName', 'CO to TR' );    
    ylabel('threshold []' );
    legend show;
    grid on;    
end
    

function [ ax ] = plot_Vrme_current( sim, position, autocolor, color, settings )
    ax = subplot( 'position', position );
    
    Vrme    = sim.getSignal( 'top_electrode' );
    current = sim.getSignal( 'Vexternal:p' );
    
    if autocolor
        time = Vrme.getXValues();
        plotAutoColor( Vrme.getYValues(), -current.getYValues()/1e-6, time, settings );
    else
        plot( Vrme.getYValues(), -current.getYValues()/1e-6, '-', 'Color', color, 'displayName', 'rme' );
    end
    
    hold on;    
	grid on;    
    ylabel( 'current [uA]' );    
end


function [ ax ] = plot_Vrme_particles( sim, position, autocolor, color, settings )
    ax = subplot( 'position', position );
    
    Vrme    = sim.getSignal( 'top_electrode' );
    n_CO    = sim.getSignal( 'Xrme.n_CO' );
    
    if autocolor
        time = Vrme.getXValues();
        plotAutoColor( Vrme.getYValues(),  n_CO.getYValues(), time, settings );
    else
        plot( Vrme.getYValues(),  n_CO.getYValues(), '-', 'Color', color, 'displayName', 'rme' );
    end
    
    hold on;    
	grid on;    
    ylabel( 'n_{CO} []' );    
end

function [ ax ] = plot_Vrme_temperature( sim, position, autocolor, color, settings )
    ax = subplot( 'position', position );
    
    Vrme    = sim.getSignal( 'top_electrode' );
    T       = sim.getSignal( 'Xrme.temperature' );
    
    if autocolor
        time = Vrme.getXValues();
        plotAutoColor( Vrme.getYValues(),  T.getYValues(), time, settings );
    else
        plot( Vrme.getYValues(),  T.getYValues(), '-', 'Color', color, 'displayName', 'rme' );
    end
    
    hold on;    
	grid on;    
    ylabel( 'Temperature [K]' );   
end

function [] = plotAutoColor( x, y, time, settings )
    
    L = length(x);    
    
    % split time in # cycles parts
    cycles = settings.cycles;
    
    totalTime = max(time);
    cycleTime = totalTime/cycles;
    
    colors = hsv( cycles );
    for i=1:cycles
        startTime =(i-1)*cycleTime;
        stopTime  =(i  )*cycleTime;
        indices = find( (time>=startTime).*(time<=stopTime) );
        plot( x(indices), y(indices), '.-', 'color', colors(i,:), 'displayName', sprintf('cycle %d', i ) );
        hold on;
    end
    legend show;
end


function [ signal ] = normalizeLog( log10_plus1000 )
% signals are saved to database as log10(x+1000). 
% this method retreives x    
    yValues = log10_plus1000.getYValues();
    xValues = log10_plus1000.getXValues();
    newYValues = 10.^( yValues ) - 1000;        
    import be.kuleuven.micas.signals.*;
    signal = Signal( xValues, 'time', 's', newYValues, 'values', '?' );
end

function [] = removeXTicks( h )
    set(h,'XTickLabel', {} );
end




% function [] = plotCurrentVersusVexternal( sim, style )
%     Vexternal = sim.getSignal( 'external' );
%     current   = sim.getSignal( 'Vexternal:p' );
%     plot( Vexternal.getYValues(), -current.getYValues()/1e-6, style, 'displayName', 'rme' );
%     hold on;    
% 	grid on;
%     xlabel( 'V_{external} [V]' );
%     ylabel( 'current [uA]' );    
% end


% function [] = plotFluxesAndCounters( sim )
%     
%     try
%         subplot( 3,1 ,1 );
%         
%         flux_BR_to_CO     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_BR_to_CO_plus1000' ] ));
%         flux_CO_to_BR     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_CO_to_BR_plus1000' ] ));
%         flux_TR_to_CO     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_TR_to_CO_plus1000' ] ));
%         flux_CO_to_TR     = normalizeLog( sim.getSignal( [ 'Xrme.log10_flux_CO_to_TR_plus1000' ] ));
%         
%         semilogy( flux_BR_to_CO.getXValues()/1e-9, flux_BR_to_CO.getYValues(), 'r-', 'displayName', 'flux BR to CO' );    
%         hold on;
%         semilogy( flux_CO_to_BR.getXValues()/1e-9, flux_CO_to_BR.getYValues(), 'b-', 'displayName', 'flux CO to BR' );
%         semilogy( flux_TR_to_CO.getXValues()/1e-9, flux_TR_to_CO.getYValues(), 'm-', 'displayName', 'flux TR to CO' );
%         semilogy( flux_CO_to_TR.getXValues()/1e-9, flux_CO_to_TR.getYValues(), 'k-', 'displayName', 'flux CO to TR' );
%                 
%         legend show;
%         grid on;
%         xlabel( 'time [ns]' );
%         ylabel( 'jumps per second [Hz]' );
% 
%         
%         subplot( 3,1 ,2 );
%         counter_BR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_counter_BR_to_CO_plus1000'  ));
%         counter_CO_to_BR = normalizeLog( sim.getSignal( 'Xrme.log10_counter_CO_to_BR_plus1000'  ));
%         counter_TR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_counter_TR_to_CO_plus1000'  ));
%         counter_CO_to_TR = normalizeLog( sim.getSignal( 'Xrme.log10_counter_CO_to_TR_plus1000'  ));
% 
%         jumps_BR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_BR_to_CO_plus1000' ));
%         jumps_CO_to_BR = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_CO_to_BR_plus1000' ));
%         jumps_TR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_TR_to_CO_plus1000' ));
%         jumps_CO_to_TR = normalizeLog( sim.getSignal( 'Xrme.log10_jumps_CO_to_TR_plus1000' ));
% 
%         postfix = '';
%         
%         logPlot = false;
%         if( logPlot )
%             semilogy( counter_BR_to_CO.getXValues()/1e-9, counter_BR_to_CO.getYValues(), 'r-', 'displayName', [ 'counter BR to CO ' postfix ] );    
%             hold on;
%             semilogy( counter_CO_to_BR.getXValues()/1e-9, counter_CO_to_BR.getYValues(), 'b-', 'displayName', [ 'counter CO to BR ' postfix ] );
%             semilogy( counter_TR_to_CO.getXValues()/1e-9, counter_TR_to_CO.getYValues(), 'm-', 'displayName', [ 'counter TR to CO ' postfix ] );
%             semilogy( counter_CO_to_TR.getXValues()/1e-9, counter_CO_to_TR.getYValues(), 'k-', 'displayName', [ 'counter CO to TR ' postfix ] );
% 
%             semilogy( jumps_BR_to_CO.getXValues()/1e-9, jumps_BR_to_CO.getYValues(), 'r--', 'displayName', [ 'jumps BR to CO ' postfix ] );        
%             semilogy( jumps_CO_to_BR.getXValues()/1e-9, jumps_CO_to_BR.getYValues(), 'b--', 'displayName', [ 'jumps CO to BR ' postfix ] );
%             semilogy( jumps_TR_to_CO.getXValues()/1e-9, jumps_TR_to_CO.getYValues(), 'm--', 'displayName', [ 'jumps TR to CO ' postfix ] );
%             semilogy( jumps_CO_to_TR.getXValues()/1e-9, jumps_CO_to_TR.getYValues(), 'k--', 'displayName', [ 'jumps CO to TR ' postfix ] );
%             ylabel( 'counter or number of jumps' );
%         else
%             plot( counter_BR_to_CO.getXValues()/1e-9, counter_BR_to_CO.getYValues(), 'r-', 'displayName', [ 'counter BR to CO ' postfix ] );    
%             hold on;
%             plot( counter_CO_to_BR.getXValues()/1e-9, counter_CO_to_BR.getYValues(), 'b-', 'displayName', [ 'counter CO to BR ' postfix ] );
%             plot( counter_TR_to_CO.getXValues()/1e-9, counter_TR_to_CO.getYValues(), 'm-', 'displayName', [ 'counter TR to CO ' postfix ] );
%             plot( counter_CO_to_TR.getXValues()/1e-9, counter_CO_to_TR.getYValues(), 'k-', 'displayName', [ 'counter CO to TR ' postfix ] );
% 
%             plot( jumps_BR_to_CO.getXValues()/1e-9, jumps_BR_to_CO.getYValues(), 'r--', 'displayName', [ 'jumps BR to CO ' postfix ] );        
%             plot( jumps_CO_to_BR.getXValues()/1e-9, jumps_CO_to_BR.getYValues(), 'b--', 'displayName', [ 'jumps CO to BR ' postfix ] );
%             plot( jumps_TR_to_CO.getXValues()/1e-9, jumps_TR_to_CO.getYValues(), 'm--', 'displayName', [ 'jumps TR to CO ' postfix ] );
%             plot( jumps_CO_to_TR.getXValues()/1e-9, jumps_CO_to_TR.getYValues(), 'k--', 'displayName', [ 'jumps CO to TR ' postfix ] );
%             ylabel( 'counters and number of jumps' );
%         end        
%         legend show;
%         grid on;
%         xlabel( 'time [ns]' );
%         
% 
%         
%         subplot( 3,1 ,3 );
%         threshold_BR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_BR_to_CO_plus1000'  ));
%         threshold_CO_to_BR = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_CO_to_BR_plus1000'  ));
%         threshold_TR_to_CO = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_TR_to_CO_plus1000'  ));
%         threshold_CO_to_TR = normalizeLog( sim.getSignal( 'Xrme.log10_threshold_CO_to_TR_plus1000'  ));
%         plot( threshold_BR_to_CO.getXValues()/1e-9, threshold_BR_to_CO.getYValues(), 'r-', 'displayName', 'BR to CO' );    
%         hold on;
%         plot( threshold_CO_to_BR.getXValues()/1e-9, threshold_CO_to_BR.getYValues(), 'b-', 'displayName', 'CO to BR' );
%         plot( threshold_TR_to_CO.getXValues()/1e-9, threshold_TR_to_CO.getYValues(), 'm-', 'displayName', 'TR to CO' );
%         plot( threshold_CO_to_TR.getXValues()/1e-9, threshold_CO_to_TR.getYValues(), 'k-', 'displayName', 'CO to TR' );
%         xlabel('time [ns]');
%         ylabel('threshold []' );
%         legend show;
%         grid on;
%                 
%         
%     catch e
%         rethrow( e );
%         %fprintf( 'WARNING: instance %d does not exist\n', index );
%     end
% end

% 
% function [ current ] = localGetCurrent( sim, index ) 
%     current = sim.getSignal( sprintf('Vin%d:p',index) ).multiply(-1);
% end

% function [ temperature ] = localGetTemperature( sim, index ) 
%     try
%         temperature = sim.getSignal( sprintf( 'Xsetup%d.Xrme.temperature', index ) );
%     catch e
%         temperature = sim.getSignal( sprintf( 'Xsetup%d.Xrme.temperature', 1 ) ).multiply(0);        
%     end
% end

