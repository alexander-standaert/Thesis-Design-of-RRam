classdef SweepController
    % SweepController
    %
    % A class that provides a simple interface to loop over all combinations of a set of parameters    
    %
    % basic usage:
    %   sc=SweepController();   
    %   sc.setName( 'funny sweep' );
    %   sc.addParameter( 'resistance', [ 1 10 100 ] ); 
    %   sc.addParameter( 'capacitance', 10e-15 );
    %   sc.addParameter( 'colors', { 'red', 'green', 'blue' } );
    %   m1.a=5; m1.b='m1'; m2.a=7; m2.b='m2-b';
    %   sc.addParameter( 'controls', { m1, m2 } );
    %   results = sc.loop( @calculateMetrics );
    %
    %   sc.loop loops over all possibilities of the parameter combinations.
    %   For each combination, the provided function pointer is called as
    %     calculateMetrics( structure );
    %   Where structure contains values structure.resistance, structure.controls etc...
    %
    %   calculateMetrics must return a structure with the desired metrics.
    %   All calls to calculateMetrics must contain the same fields.
    %
    %   results is a structure vector, where results(i) corresponds to sc.getCombination(i);
    %   
    %   note: paramater 'index' is a reserved name
    
    
    properties
        
    end
    
    %properties ( SetAccess=private, GetAccess=private )
    properties ( SetAccess=private )
        currentIndex = 1; % used when performing the internal loops
        parameterNames  = {}; % cell array with the names of the parameters
        parameterValues = {}; % parameterValues{i} is a double vector or cell array
                              % that corresponds to the option(s) for parameters{i}
        name = 'no name set';            
        
        % ---- 
        numberOfOptions = [];
        cumulativeNumberOfOptions=[];
        % e.g. p1: 3 options ; p2: 2 options p3: 2 options
        % p1 = 1 2 3   1 2 3   1 2 3   1  2  3
        % p2 = 1       2       1       2
        % p3 = 1               2
        % i:   1 2 3   4 5 6   7 8 9   10 11 12
        % numberOfOptions = [3 2 2]
        % cumulativeNumberOfOptions = [ 3 6 12 ]
    end
    
    
    methods
        function obj=SweepController()
           fprintf( 'constructing a SweepController\n' );           
        end
        
        
        function value = getParameterNames( obj )                       
           value =  obj.parameterNames;
        end
        
        function value = getParameterValues( obj )
           value =  obj.parameterValues;
        end
        
        function value = getParameterName( obj, i )  
           value =  obj.parameterNames{ i };
        end
        
        function value = getParameterOptions( obj, i )
           value =  obj.parameterValues{i};
        end
        
        function value = getParameterValue( obj, parameterIndex, optionIndex )
            % get the j-th option for parameter i
            % e.g. if parameterNames{  parameterIndex }='resistance' and
            %         parameterValues{ parameterIndex } = [ 1 2 3 ]
            % getParameterValue( parameterIndex, 2 ) --> 2
            values = obj.getParameterOptions( parameterIndex );
            if iscell( values )
                value = values{optionIndex};
            else
                value = values(optionIndex);
            end
            
        end
        
        function value = getName( obj )
           value =  obj.name;
        end
        
        function obj = setName( obj, name )
           obj.name = name;
        end
        
        function numberOfParameters = getNumberOfParameters( obj )
            numberOfParameters = length( obj.parameterNames );
        end
        
        function numberOfCombinations = getNumberOfCombinations( obj )
             numberOfCombinations = obj.cumulativeNumberOfOptions( end );
        end
        
        function obj = addParameter( obj, parameterName, parameterValues )
           obj.parameterNames{end+1}  = parameterName;
           obj.parameterValues{end+1} = parameterValues;
           obj.numberOfOptions(end+1) = length( parameterValues );      
           L =length( obj.parameterNames );
           if L==1
              prev_cnoo = 1;
           else
              prev_cnoo = obj.cumulativeNumberOfOptions( L-1 );
           end
           obj.cumulativeNumberOfOptions(end+1) =  prev_cnoo * length( parameterValues );
           
           fprintf( 'added a parameter \n');           
           
        end
        
        function combinationIndices = getCombinationIndices( obj, combinationIndex )
            % split combinationIndex into i1 i2 i3 ...                        
            
            %L  = getNumberOfCombinations();
            NP = obj.getNumberOfParameters();
            Lleft = combinationIndex;
            indicesLF = zeros(1,NP); % first calculate the highest, then go down
            for i=1:NP
                if i<NP
                    cnp = obj.cumulativeNumberOfOptions( NP-i );
                else
                    cnp=1;
                end              
                indicesLF(i) = floor( (Lleft-1) /cnp )+1;
                Lleft = Lleft - (indicesLF(i)-1)*cnp;
            end               
            combinationIndices = indicesLF( end:-1:1 );
        end
        
        function combination = getCombination( obj, combinationIndex )
            combinationIndices = obj.getCombinationIndices( combinationIndex );
            NP = obj.getNumberOfParameters();
            for parameterIndex=1:NP
                pname       = obj.parameterNames{ parameterIndex };
                optionIndex = combinationIndices( parameterIndex );
                value       = obj.getParameterValue( parameterIndex, optionIndex );
                combination.(pname) = value;
            end
        end
        
        function results = loop( obj, calculateMetrics, combinationIndexVector );
        % SweepController.results = loop( obj, calculateMetrics, [combinationIndexVector] );
        %
        % loop over de combinationIndices from combinationIndexVector
        % is no combinationIndexVector is provided, the loop is performed over all indices
        %
        % calculateMetrics must be a function handle to a function that accepts
        % a combination structure and that returns a result structure
        % 
        % the results are stored in results( combinationIndex ), so that you can
        % request the original combination by calling sc.getCombination( combinationIndex )
        
            if nargin<3
                combinationIndexVector = 1:obj.getNumberOfCombinations();        
            end            
            
            for combinationIndex = combinationIndexVector
               combination = obj.getCombination( combinationIndex );
               combination.index = combinationIndex;
               results( combinationIndex ) = calculateMetrics( combination );
            end        
            
        end
            
    end
    
end