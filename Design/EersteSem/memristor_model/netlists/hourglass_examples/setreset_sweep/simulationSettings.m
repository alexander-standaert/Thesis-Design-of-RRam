function [ settings, rampRates ] = simulationSettings()
% function [ settings rampRates ] = simulationSettings()
%
% The settings in this file will are used by the netlist writing script as well as
% by the visualization script.

    settings = cellSettings();
    settings = circuitSettings( settings );
        
    settings.cycles = 4;
        
    settings.enable_stochastics = 1;
    settings.initial_seed       = 253;
    settings.verbose_logfile    = 0;
            
    %rampRates.rampRates = [  1   1e3    1e4    1e5    1e6 ];  % V/s
    %rampRates.simNames  = { '1', '1K', '10K', '100K', '1M' };    
    rampRates.rampRates = [  1e3   1e6   1e9   ];  % V/s
    rampRates.simNames  = { '1K', '1M', '1G' };
    
    rampRates.colors    = { [ 1 0 0 ] , [0 1 0 ], [ 0 0 1], [ 0 0 0 ], [ 0.5 0.5 0] };
end

function [ settings ] = circuitSettings( settings )
    settings.Rload = 27600;
    settings.Cload = 0;  % aid simulation stability -- set to 0 to not add capacitor
    settings.Tambient  = 297;
    settings.Vmax  =  1.25;
    settings.Vmin  = -1.75;
    
    settings.fluxLimitInPeriod = 10000; % this is translated to flux_limit. Difficult interpretation! 
                                        % Check flux reduction plot after simulation and increase if necessary
    
    settings.returnTimeFraction = 0.001; % Time to return from maximal voltage to 0, as fraction of time to go from 0 to max
    settings.flatTime = 0.01 / 100; % percentage of time added at peak voltage    
    
end

function [ settings ] = cellSettings()
    
    settings.model = 'HOURGLASS';
    settings.modelFile = '../../../../verilog/RME_QMMODEL_ANALYTICAL/HOURGLASS.va';
   
    %parameters for 20nm x 20nm cell, 27600ohm as discussed with Robin November 16th    
    n_total  = 37;
    
    settings.n_CO     = 5;
    settings.n_BR     = 2;
    settings.n_TR     = n_total - settings.n_CO - settings.n_BR;

    settings.TR_size    = 30;       % don't use N_TR, spice is not case sensitive!
	settings.BR_size    = 2 ;
    
    if( settings.n_TR > settings.TR_size || ...
        settings.n_BR > settings.BR_size || ...
        settings.n_TR<0 || settings.n_BR<0 || settings.n_CO<0 )
    
       settings
       error('something wrong with particle / reservoir settings\n');
    end
    
    settings.omega_x   = 9e14;
	settings.omega_y_0 = 9e15;
	settings.V0        = -0.05;

    settings.Rthermal  = 1.2e10;
    settings.c_thermal = 0.0075;
	settings.Ea        = 1.05*getQ();    
	settings.alpha_0   = 0.03;
    settings.m_n       = 2.0;
    settings.f0        = 1e13;

    %settings.model = 'HOURGLASS_0000_900THz_m0050_000uV';
    %settings.modelFile = '../../../../verilog/RME_QMMODEL_TABLES/HOURGLASS_0000_900THz_m0050_000uV.va';

end

function [q] = getQ()
    q = 1.6022e-19;
end