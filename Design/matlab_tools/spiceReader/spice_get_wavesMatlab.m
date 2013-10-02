function [ sim ] = spice_get_wavesMatlab( file ) 

    fid = fopen( file, 'r' );
    
    names = '';
    readingNodeNames=0;
    % skip junk at start
    while 1
        line=fgetl( fid );
        if findstr( 'TIME', line )
            readingNodeNames=1;
            
            index = findstr( 'TIME', line );  % sometimes, there are some numbers before TIME ... 1 1 1 8 8 8 ...
            line
            line = line( index:end );
            line
            
        end
        if readingNodeNames
            names=sprintf( '%s %s', names, line );
        end
        
        if findstr( '$&%#', line ) 
            break;
        end
    end
    
    %fprintf( '"%s\n"', names );
    
    yNames = regexp( strtrim(names), '\s*', 'split' );
    yNames = yNames(1:(end-1)) ;

    L = length( yNames );
    
    [A,COUNT] = fscanf( fid, '%11g', [ L inf ] );
    
    A
    %COUNT
    
    timesteps = floor( COUNT/L ); % discard last timestep value
    
    sim.yNames=yNames;
    for i=1:L
        sim.yValues{ i } = A( i, 1:timesteps );       
        sim.yUnits{i} = '?';
    end
    sim.xValues = sim.yValues{1};
    sim.xName=yNames{1};
    sim.xUnit='s';
    
    
end