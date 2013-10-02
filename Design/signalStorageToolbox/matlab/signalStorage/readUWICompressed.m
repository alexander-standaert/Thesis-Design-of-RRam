function [ simulation tree ] = readUWICompressed( fileName, filter, exactNames, header )
% function [ simulation [tree] ] = readUWICompressed( fileName )
% function [ simulation [tree] ] = readUWICompressed( fileName, filter )
% function [ simulation [tree] ] = readUWICompressed( fileName, filter, exactNames )
% function [ simulation [tree] ] = readUWICompressed( fileName, filter, exactNames, header )
%
% <simulation> will be a java object of class
% be.kuleuven.micas.signalStorage.interfaces.LoadableSignalDatabase
%
%   <fileName> is the name of the file to be loaded.  If no <header> is 
%   provided, this method will attempt to read fileBaseName.HDR, where
%   fileBaseName is <fileName> without extension.
%
%   If <header> is provided, it should be a java SimulationHeader, which
%   matches the content of fileName, or it should be a string that
%   contains the filename of the header to read
% 
% use simulation.getHeader() and simulation.getBody() to get to the
% SimulationHeader and the SimulationBody.
%
% use simulations.getSignal( Name ) to get the signal with the given name
% 
% <filter> (optional argument) is a java regular expression, e.g. 'V.*|Xinv1\..*:p'        
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
%
%   <exactNames> is a list of names that will be matched exactly (no
%   wildcards allowed).  This match is faster than a large OR in the
%   regular expression <filter>.  e.g. exactNames = {'a0', 'a1'};
%       
% if output argument <tree> is requested, a hierarchical tree is generated 
%   from the signal names.  Only use this for small simulations!
%
% This method can read the following homebrew UWI formats, recognised by their extension:
%    COD  compressed Double
%    COF  compressed Float
%    COA  compressed Ascii
%    COH  compressed halfprecision (hpf allows values from +-5.96046×10−8 to +-65504)
%         we scale by 1024

    if( nargin<2 )
        filter='.*';
    end

    if( nargin<3 )
        exactNames={};
    end    

    %% read the file
    try
        %import stratocas.simulationOutputReaders.readers.*        
        import be.kuleuven.micas.signalStorage.formats.UWI.*; 
        if( nargin<4 )
            tic;
            simulation = SimulationCompressedUWI.read( fileName, filter, exactNames );
            toc;
        else 
            tic;
            simulation = SimulationCompressedUWI.readFromFileAndHeader( fileName, header, filter, exactNames ); % Header could be a string (the filename of the header) or a SimulationHeader
            toc;
        end
            
    catch exception
        fprintf('ReadUWICompressed.m: can''t execute java binary \n');
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
        
end

