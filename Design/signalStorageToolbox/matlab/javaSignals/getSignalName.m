function [ name ] = getSignalName( signal )
% function [ name ] = getSignalName( signal )
%
% return a matlab string of signal.getYName()
% signal is a java Signal as used in the signalStorageToolkit

    name = char( signal.getYName() );


end