function [] = errorMakePlotMessage( sim, e )
%function [] = errorMakePlotMessage( sim, e )
%
% The warning that is printed when we the makePlot function fails
% the workspace variable "debugSim" is set to sim.

    fprintf( '============================================================\n' );        
    fprintf( 'ERROR: Failed to make the plots.                            \n' );
    fprintf( '- Most often, a signal was not saved to the database        \n' );
    fprintf( '- Different simulators and different simulator options      \n' );
    fprintf( '  save different signal and under different names.          \n' );        
    fprintf( '  The code wil have to be updated                           \n' );
    fprintf( 'NOTE: you can use debugSim.getAllNames() in the workspace   \n' );
    fprintf( '============================================================\n' );        
    assignin( 'base', 'debugSim', sim );
    rethrow(e);
end