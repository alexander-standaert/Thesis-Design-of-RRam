function [ header tree ] = readHeader( fileName ) 
% function [ header  ] = readHeader( fileName ) 
% function [ header  tree ] = readHeader( fileName ) 
%
% read the header identified by filename.  In case filename is a known
% simulation format ('.COA', '.COD', '.COF', '.COH', 
%                    '.NCA', '.NCD', '.NCF', '.NCH' ), the extension
% is changed into '.HDR'.  Otherwise, filename is used "as is"
%
% The header file can be either a "compressed" file or a plain header file
% 
% format is:
% >title
% >[
% >#1 subset 1
% >...
% >0 wave1 unit
% >1 Xinv#
% >...
% >]
%
% after completion, header is a java object of class 
% be.kuleuven.micas.signalStorage.interfaces.NamesIndex
%
% with yNames = header.getAllNames(),
% yNames adheres to the same order as in which waves are written to the 
% data file
    
    %% do some filename magic
    parts = regexp( fileName, '\.', 'split' );
    extension = parts{end};
    
    if( strcmp( extension, 'COA' ) || strcmp( extension, 'COD' ) || ...
        strcmp( extension, 'COF' ) || strcmp( extension, 'COH' ) || ...
        strcmp( extension, 'NCA' ) || strcmp( extension, 'NCD' ) || ...
        strcmp( extension, 'NCF' ) || strcmp( extension, 'NCH' ) )
        fileName = [ fileName(1:end-3) 'HDR' ];
    end

    %% read the file
    try
        import be.kuleuven.micas.signalStorage.formats.UWI.*        
        tic;
        header =  ReaderHDR.readFileHDR( fileName );        
        toc;        

    catch exception
        fprintf('ReadUWIHeader.m: error executing java binary \n');
        error('message: %s\n', exception.message );        
    end
    
    %% construct tree if desired
    if nargout>1
        fprintf( 'constructing tree, can take a long time\n' );
        yNames = javaStringArrayToMatlab( header.getAllNames() );        
        tree= getTree( yNames );
    end
    
end
