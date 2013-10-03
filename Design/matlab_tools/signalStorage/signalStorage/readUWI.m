function [ sim tree ] = readUWI( fileName, varargin )


    optargin = size( varargin, 2 );
    %fprintf( 'number of options in varargin: %d \n', optargin ); 
    
    
    [pathstr,name,ext,versn] = fileparts(fileName);
    
    if ( strcmp( ext, '.COF') || strcmp(ext, '.COH') || ...
         strcmp( ext, '.COD') || strcmp(ext, '.COA') )
        %fprintf( 'compressed\n');
        functionToCall=@readUWICompressed;
    else
        %fprintf( 'non compressed\n');
        functionToCall=@readUWINonCompressed;
    end
            
    if nargout==1
        [ sim ] = functionToCall( fileName, varargin{:} );        % flatten varargin, because otherwise #params inside function will always be 2
    else
        [ sim tree ] = functionToCall( fileName, varargin{:} );        
    end
    
end