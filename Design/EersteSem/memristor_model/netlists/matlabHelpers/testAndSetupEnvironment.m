function [] = testAndSetupEnvironment()
% function [] = testAndSetupEnvironment()
%
% test whether the required scripts are available and add them to the matlab and java
% path

    % signalStorageToolbox
    if ~exist( 'sourceSignalStorage', 'file' ) % kind 'file' includes xyz.m files in the matlab path
        error( 'ERROR: signalStorageToolbox is not correctly installed\n' );
    end

    if ~signalStorageToolboxAlreadySourced()
        sourceSignalStorage();
    end
    
end

function [ alreadySourced ] = signalStorageToolboxAlreadySourced()
% very minimalistic check, but probably good enough

    if ~exist( 'readCSDF', 'file' )
        alreadySourced = false;
        return;
    end
    
    paths = javaclasspath( '-all' );
    inPath=false;
    for i=1:length(paths)
        p = paths{i};
        if strfind( p, 'SignalStorage.jar' )
           inPath = true;
        end
    end
    if inPath    
        alreadySourced = true;
    else 
        alreadySourced = false;
    end
    
end