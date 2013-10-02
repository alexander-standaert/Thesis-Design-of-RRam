function [ header ] = exampleJavaHeader()
% function [ header ] = exampleJavaHeader()
%
% returns an example java header (NamesIndex) object
% this allows tab completion in the workspace and the editor

    
    thisScript = which( 'exampleJavaSimulation' );    
    [ pathstr name ext version ] = fileparts( thisScript );
    headerFile = fullfile( pathstr , 'exampleSimulation', 'simulation.HDR' )
    header = readUWI( headerFile );
    
end