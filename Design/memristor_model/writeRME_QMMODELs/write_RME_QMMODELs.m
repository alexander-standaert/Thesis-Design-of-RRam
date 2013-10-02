function [] = write_RME_QMMODELs()
% function [] = write_RME_QMMODELs()
%
% * write a generic model ../verilog/RME_QMMODEL.va, which can be used for any value 
%    (omega_x, V0). It uses the analytical QM I-V conduction equations. 
%    omega_x and V0 are provided in the netlist.
%    This model has problems with convergence in hspice
% * Lookup-table based models for the (omega_x, V0) combinations specified in this file
%
% both types of model are generated from the same template RME
%
% please check the quality of the fit in the generated graphs...

    setupPaths();    

    [ omega_y_V Vrme ] = getRange1();
    
    %generatePlots=0;
    generatePlots=1;
    
    %basePlotId = 100*generatePlots;
    %omega_x = 9e14;
    %V0      = -0.050;
    %write_table_RME_QMMODEL( omega_x, V0, Vrme, omega_y_V, basePlotId );

    %basePlotId = 200*generatePlots;
    %omega_x =  6e14;
    %V0      =  0.250; 
    %write_table_RME_QMMODEL( omega_x, V0, Vrme, omega_y_V, basePlotId );
    
    write_analytical_RME_QMMODEL();

    fprintf( '------------- generated the requested model files in ./generated    \n' );
    fprintf( '------------- please check for weird behavior in the generated plots\n' );
    fprintf( '------------- [if no plots are generated, set generatePlots to 1 in \n' );
    fprintf( '-------------  write_RME_QMMODELs                                  ]\n' );
    fprintf( '------------- if the results are ok, run ./installModels.sh         \n' );
    fprintf( '------------- (or !./installModels.sh from within matlab)           \n' );
end

function [ omega_y_V Vrme ] = getRange1( )
% (omega_y, Vrme) range over which the lookup table will be constructed
%
% points are spaced in a non-linear way to get a better fit with fewer points
    %omega_y_V =  1e13 * ( 10.^(0:0.1:3) );
    omega_y_V =  1e12 * ( 10.^(0:0.01:4) );  %with less detail and interpolation "1,1", we get "wavy" currents in reset example...
    Vrme      =  1e-4 * ( 10.^(0:0.05:4.5) );
    Vrme      = sort( unique( [ Vrme 0 -Vrme ] ) );
    
    %omega_y_V =  1 * ( 10.^(0:0.1:15) );  
    %Vrme = 0:0.1:1;
end

function [] = setupPaths() 
    addpath( 'helperScripts' );
    if ~( exist( 'sourceSignalStorage' ) == 2 )
        error( 'ERROR: signalStorageToolbox is not correctly installed\n' );
    else
        sourceSignalStorage();
    end
    

end

