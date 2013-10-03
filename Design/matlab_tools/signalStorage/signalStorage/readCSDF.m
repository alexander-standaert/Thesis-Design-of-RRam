function [ simulation tree ] = readCSDF( fileName, filter, exactNames )
% function [ simulation [tree] ] = readCSDF( fileName )
% function [ simulation [tree] ] = readCSDF( fileName, filter )
% function [ simulation [tree] ] = readCSDF( fileName, filter, exactNames )
%
% <simulation> will be a java object of class
% be.kuleuven.micas.signalStorage.interfaces.LoadableSignalDatabase
%
%   <fileName> is the name of the hspice Ascii (transient) file to be loaded.
% 
%   use simulation.getHeader() and simulation.getBody() to get to the
%   SimulationHeader and the SimulationBody.
%
%   use simulations.getSignal( Name ) to get the signal with the given name
% 
%   <filter> (optional argument) is a java regular expression, e.g. 'V.*|Xinv1\..*:p'        
%       waves whose name matches the filter are loaded from file.  The
%       header is always loaded entirely, only data is skipped
%       Whe calling getSignal( name ) for a signal that is not loaded, 
%       null will be returned.
%       Use '.*' to match any text part
%       '.' is any token.  Use '\.' to request a litteral dot
%       Use '^' for the beginning of the text, use '$' for the end of the
%       text, e.g. '^Xinv\..*Bar$' to match every signal that starts with
%       'Xinv.' and ends with 'Bar'
%       To match no signals at all with filter, pass ''
%
%   <exactNames> is a list of names that will be matched exactly (no
%   wildcards allowed).  This match is faster than a large OR in the
%   regular expression <filter>.  e.g. exactNames = {'a0', 'a1'};
%       
% if output argument <tree> is requested, a hierarchical tree is generated 
%   from the signal names.  Only use this for small simulations!
%

    % --- requires java to be enabled
    % ----- see updateJava.m and ~/matlab/java/*.jar
    if( nargin<2 )
        filter='.*';
    end

    if( nargin<3 )
        exactNames={};
    end    
   
   %% read the file
    try
        %import stratocas.simulationOutputReaders.readers.*        
        import be.kuleuven.micas.signalStorage.formats.spice.*; 
        %tic;
        simulation = SimulationHSpiceCSDF.read( fileName, filter, exactNames );
        %toc;
    catch exception
        if ~exists( fileName, 'file' )
            fprintf('readCSDF.m: requested file "%s" not found.\n', fileName );
            rethrow( exception );
        end        
        fprintf('readCSDF.m: can''t execute java binary.  Likely causes: \n');        
        fprintf(' - signalStorage.jar not added to java path \n');
        rethrow( exception );
    end


    %% construct tree if desired
    if nargout>1        
        tstart = tic;
        header = simulation.getHeader();
        yNames = javaStringArrayToMatlab( header.getAllNames() );        
        tree= getTree( yNames );
        telapsed =toc(tstart);
        if( telapsed>0.1 ) 
            fprintf( 'constructing tree took %3.3fs\n', telapsed );
        end
    end
        
    return

end

