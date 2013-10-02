function [ result ] = performStandardSingleRun( circuit, id )
%function [ result ] = performStandardSingleRun( circuit, id )
%
%   perform the simulations as defined by the fields in <circuit>
%   <id> is a number or a string that can be used to distinguish the run
%   directories for different requests.
%   If you already have unique names in circuit or don't need different
%   run directories, this can be ''
%
%   If your circuit has certain needs that can't be formulated in
%   the flow of this default method, you can provide a different 
%   method in circuit.performRun, which should then be used by all
%   simulationControllers.
%
%   The results of the simulation are stored in the <result> structure.
%   This is done by the function provided in circuit.parseResultFunction()
%
%   This default implementation provides the following features:
%
%
%   1) The runMap <circuit.runMap> is used as basename for the output 
%      folder.  The <id> is appended to this runMap, followed with a slash
%      runMap can be absolute or relative to the current matlab path.
%
%   2) create a parameter file for inclusion in the netlist.
%      The file is created as <circuit.paramsFilename> (in the run folder)
%      and contains, the parameters defined in <circuit.params>, a 
%      structure created with ~/matlab/netlistConstructor/addParameter();
%
%   3) write the subcircuit <circuit> to the file <circuit.subcircuitFilename>
%       in the run folder.
%       
%   4) copy the files mentioned in <circuit.filesToCopy> to the output
%       folder.  The paths in filesToCopy can be absolute, or relative
%       to the current matlab path (not relative to the run folder)
%
%       Normally, filesToCopy contains strings. if an entry in entry 
%       filesToCopy{i} is not a string but a cell array, we copy 
%       entry{1} to runMap/entry{2}
%
%   5) copy the testNetlists and execute 
%       '<circuit.simulator> testNetlists(i) > testNetlists(i).out '
%       You could provide additional stuff, like '!spectre -uwi ...'
%       to <circuit.simulator>.  It is possible to specify a separate
%       simulation command, replace circuit.simulator with a cell 
%       array with one simulator command for each testNetlist
%       testNetlists for which 
%       <circuit.performSimulations(i)>==0 are skipped 
%
%   6) call custom parseResultFunction <circuit.parseResultFunction>
%       this function should have the signature
%       [ result ] = parseResultFunction( circuit, runMap )
%       This call is made AFTER all simulations identified in 
%       <circuit.testNetlists> have been performed
%           
%   7) If simulation and result extraction is successful, the simulation
%      folder is removed if <circuit.keepSimulationFolder>==0 AND if the
%      output folder did not exist before the execution of this script.
%      (that is, we try to avoid to accidental delete of the wrong directories...)
%      
%  If parseResultFunction throws an exception, the entire program is
%  re-executed ( needed because of license issues with spectre...)
%  Unless ... cell.throwErrors==1  
%

    startMap = pwd();

    %% 1) create runMap
    runMap = circuit.runMap;
    if ~isempty( id )
        if isnumeric( id ) 
            idstring = num2str( id );
        else
            idstring = id;            
        end            
        runMap = [ runMap idstring '/' ];
    end
    if runMap(end)~='/'
       runMap = [ runMap '/' ]; 
    end
    if ~exist( runMap ,'dir')
      mkdir( runMap );
      weCreatedRunMap=1;
    else
      weCreatedRunMap=0;  
    end
    

    %% 2) create parameter file
    params = circuit.params;      
    writeParamsFile( [ runMap circuit.paramsFilename ] , params );       
    
    %% 3) write subcircuit file
    writeSubcircuitFile( circuit, [ runMap circuit.subcircuitFilename ] );
    
    %% 4) copy files in <circuit.filesToCopy>
    for i=1:length( circuit.filesToCopy ) 
        entry = circuit.filesToCopy{i};        
        if( iscell( entry ) )
           if( length( entry )~=2 )
                error( 'illegal entry in circuit.filesToCopy{%d}', i );
           end
           fileFrom = entry{1};
           fileTo   = entry{2};
        else
           fileFrom = entry;
           fileTo   = '';  % copy to identical filename
        end
        if( ~exist( fileFrom, 'file' ) )  % checks file or directory
            fprintf( 'WARNING: file %s was not found\n', fileFrom );
        end
        copyCommand = [ '!cp -r ' fileFrom  ' ' runMap fileTo ];
        eval( copyCommand );
    end
    
    %% 5) copy the testNetlists and execute simulator    
    for i=1:length( circuit.testNetlists ) 
        if( circuit.performSimulations(i)==0 )
            continue; % skip this simulation
        end
        netlist = circuit.testNetlists{i};
        if( ~exist( netlist, 'file' ) )  % checks file or directory            
            fprintf( 'WARNING: file %s was not found\n', netlist );            
        end
        eval( [ '!cp ' netlist  ' ' runMap ] );
      
        % find simulator statement to use
        if( iscell( circuit.simulator ) )
            simulator = circuit.simulator{ i };
        else
            simulator = circuit.simulator;
        end

        %%runMap
        % simulate
        eval( [ 'cd ' runMap ] );
        netlistOnly = dropPath( netlist );
        eval( sprintf( '%s %s > %s_%d.out', simulator, netlistOnly, netlistOnly, i )  );
        eval( [ 'cd ' startMap ] );
    end
    
    %% 6) call custom parseResultFunction: read results, plot results if plotId~=0
    try
        [ result ] = circuit.parseResultFunction( circuit, runMap );        
        successful = 1;
    catch e
        fprintf( 'WARNING: failed to parse results for runMap=%s\n',runMap );
        
        if isfield( circuit, 'throwErrors' ) 
            if circuit.throwErrors
                rethrow( e )
            end
        end
        fprintf( '============= RELAUNCHING run\n' );
        [ result ] =  performStandardSingleRun( circuit, id );
        successful =1;
        %%%rethrow( e );
        %display( e.message );
        %successful = 0;
    end

    %% 7) clean up run directory
    if successful
       if  circuit.keepSimulationFolder==0
          if weCreatedRunMap 
              eval( [ '!rm  -r ' runMap ] );
          else
              fprintf( 'note: runMap "%s" not deleted because it already existed\n', runMap);
          end
       end
    end
    
end