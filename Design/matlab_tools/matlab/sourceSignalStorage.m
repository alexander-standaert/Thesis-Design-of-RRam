% ------------------------------------------------------------------------------
% sourceSignalStorage.m
% ------------------------------------------------------------------------------

% ----------------------------
% set up the java path.
% javaaddpath() needs requires an absolute path...
% ----------------------------

currentPath = pwd();
cd( '~' );
home = pwd();
cd( currentPath );

%javaaddpath( [ home '/matlab/java/' ] );
%javaaddpath( [ home '/matlab/java/SignalStorage.jar' ] );
javaaddpath( [ currentPath '/matlab_tools/matlab/java/SignalStorage.jar' ] );
import be.kuleuven.micas.signals.*;
import be.kuleuven.micas.signalStorage.interfaces.*;
import be.kuleuven.micas.signalStorage.simulationBrowser.*


% ----------------------------
% set up the matlab path
% ----------------------------
%addpath(genpath('~/matlab/signalStorage'))
% this adds ~/matlab/signalStorage and all its subdirectories to the matlab path

fprintf( 'SignalStorageToolbox initialized \n ');
%fprintf( '+-------------------------------------------------------------------+ \n' );
%fprintf( '|  SignalStorageToolbox initialized                                 | \n' );
%fprintf( '|                                                                   | \n' );
%fprintf( '|  Copyright 2009-2011 Katholieke Universiteit Leuven, ESAT-MICAS.  | \n' );
%fprintf( '|  All rights reserved.    (see license.txt)                        | \n' );
%fprintf( '|  Main authors: Stefan Cosemans, Anselme Vignon, Bram Rooseleer    | \n' );
%fprintf( '+-------------------------------------------------------------------+ \n' );
