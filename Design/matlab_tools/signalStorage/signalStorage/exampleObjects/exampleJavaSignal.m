function [ signal ] = exampleJavaSignal() 
% function [ signal ] = exampleJavaSignal() 
%
% returns an example java signal (Signal) object
% this allows tab completion in the workspace and the editor

    import be.kuleuven.micas.signals.*;
    signal = Signal( [ 0 ], 'X', '[]', [ 0 ], 'exampleSignal', '[]' );

end