function [ results weights settings ] = performIS_MC( circuit, numberOfRuns, sigmaMultiplier, seedSubstream, outputBasename, saveInterval, priorResults )
% [ results weights settings ] = ...
%     performIS_MC( circuit, numberOfRuns, [ sigmaMultiplier ], ...
%                   [ seedSubstream ], [ outputBasename], [saveInterval], ...
%                   [ priorResults ])
% returns the results of the requested importance sampling monte carlo
% simulations
%
% <results> is an array of structures result, e.g. result = results(i);
% the fields that result contains are defined by the custom routine to 
% start and parse simulations, as defined by <circuit> 
% 
% if result contains a scalar field 'a', you can get a scalar vector of the 
% 'a'-results with the assignement
% aVector = [ results.a ]
% if it contains a non-scalar entry 'b', you get a cell array with
% bCell = { results.b }
%
% <seedSubstream> is used to select the substream from the random stream.
% For more information, see
% http://blogs.mathworks.com/loren/2008/11/05/new-ways-with-random-numbers-part-i/
% By default, <seedSubstream>=1 is used
%
% Depending on <saveInterval>, the results are also saved as a .mat file
% in the provided output folder.
%  (as a result.mat file) to 
% the provided <outputBasename> ( whose directory is created if necessary )
% 
% if <saveInterval> is not provided, no intermediate save files are created
% only 'result.mat' is created at the end of the function call
%
% if <priorResults> is provided, it should be a structure with 
% priorResults.results
% priorResults.weights 
% priorResults.settings
%
% it should be possible to load this entry from intermediately saved data 
% with priorResults=load('results_i.mat')
%

    %% check input parameters and initialise all parameters
    if nargin<2 
        error( 'circuit and numberOfRuns are required arguments' );
    end
    if nargin<3
        sigmaMultiplier = 1;
    end
    if nargin<4
        seedSubstream   = 1;
    end
    if nargin<5
        outputBasename  = '';
    else
        [ path ] =  fileparts( outputBasename ); %[ path name ext version ]
        if( ~exist( path, 'file' ) )  % file or directory
            mkdir( path );
        end
    end

    if nargin<6
        saveInterval = ceil( numberOfRuns/10 );
    end

    if nargin==7
        fprintf( 'extending prior simulationResults\n' );          
        results = priorResults.results;    
        weights = priorResults.weights;
        settings = priorResults.settings;
        runId   = length( weights )+1;
    else
        %a new simulation run
        runId=1;
        % n, weights and results will be created in the loop    
        results  = [];  % will become an array of structs
        weights  = [];  % a double vector
        settings = [];  % will become an array of structs  
    end

    randomStream = RandStream('mrg32k3a');  % uses default seed of 0
    randomStream.Substream = seedSubstream + runId;

    %% the loop
    for i=runId:numberOfRuns
        
        fprintf( '==> start MC run i=%d \n', i );      
        
        [ circuitX weight nX deltaX fx gx] = addMismatchToCircuit( circuit, sigmaMultiplier, randomStream ) ;
        
        settings(i).circuit = circuitX;
        settings(i).weight  = weight;
        settings(i).nX      = nX;
        settings(i).deltaX  = deltaX;
        settings(i).fx      = fx;
        settings(i).gx      = gx;
        
        weights(i) = weight;
        
        %% perform all simulations for this instance and collect the
        %  results
        result = circuitX.performRun( circuitX, i );      
        
        %% expand the result-structure into result
        names = fieldnames( result );
        for j=1:length( names ) 
            fname = names{j};
            value = result.(fname); %getfield( result, fname );
            results = setfield( results, {i}, fname, value );
        end       
               
        %% intermediary save
        if mod( i, saveInterval )==0
            if ~isempty( outputBasename )
                filename = sprintf( '%s_%d.mat', outputBasename, i );
                save( filename, 'results', 'weights', 'settings' );
            end            
        end
        
    end
    
    %% final save
    if ~isempty( outputBasename )
        filename = sprintf( '%s.mat', outputBasename );
        save( filename, 'results', 'weights', 'settings' );
    end        
    
end

