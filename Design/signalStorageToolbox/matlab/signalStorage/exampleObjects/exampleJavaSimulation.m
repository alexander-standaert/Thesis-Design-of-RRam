function [ simulation ] = exampleJavaSimulation()
% function [ header ] = exampleJavaSimulation()
%
% returns an example java simulation (LoadableSignalDatabase) object
% this allows tab completion in the workspace and the editor

    thisScript = which( 'exampleJavaSimulation' );    
    [ pathstr name ext version ] = fileparts( thisScript );
    simulationFile = fullfile( pathstr , 'exampleSimulation', 'simulation.COF' )
    simulation = readUWI( simulationFile );
    
end