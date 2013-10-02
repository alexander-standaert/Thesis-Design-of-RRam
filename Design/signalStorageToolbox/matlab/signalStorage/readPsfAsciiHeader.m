function [ simulationHeader tree ] = readPsfAsciiHeader( fileName )
% function [ header  ] = readPsfAsciiHeader( fileName ) 
% function [ header  tree ] = readPsfAsciiHeader( fileName ) 
%
% read the header of the file identified by filename, which should
% be a psfAscii file of a DC sweep or transient simulation
%
% after completion, header is a java object of class 
% be.kuleuven.micas.signalStorage.interfaces.NamesIndex
%
% with yNames = header.getAllNames(),
% yNames adheres to the same order as in which waves are written to the 
% data file
    

    try
        import be.kuleuven.micas.signalStorage.formats.psfAscii.*        
        tic;
        header =  SimulationPsfAscii.readFileHDR( fileName );        
        toc;        

    catch exception
        fprintf('ReadPsfAsciiHeader.m: error executing java binary \n');
        error('message: %s\n', exception.message );        
    end


    import stratocas.spectreHelpers.*
    javaSim = ReadPsfAsciiHeader.readPsfAsciiHeader( fileName );
    simulationHeader = javaSimulationHeaderToMatlabSimulationHeader( javaSim );
   
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

