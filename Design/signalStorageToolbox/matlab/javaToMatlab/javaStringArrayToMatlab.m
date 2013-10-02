function [ result ] = javaStringArrayToMatlab( javaStringArray, N )
%function [ result ] = javaStringListToMatlab( javaStringArray [,N] )
%
% convert the java object String[] to an equivalent matlab 
% cell array of matlab strings
%
% step is optional, and allows to set the number of lines with
% which the 'vectorized' conversion is performed.
% 
% reduce N in case of memory problems
%
% NOT FINISHED


    if nargin==1
        N=1000; 
    end

    L = javaStringArray.length;
    result = cell( 1, L );
    
    fullIterations = floor(L/N);
    
    for i=1:fullIterations;
        baseI = (i-1)*N+1;        
        %size( cellstr( char( javaStringArray( (baseI):(baseI+N-1) ) ) ) )
        %size( result( baseI:(baseI+N-1) ) )
        result( baseI:(baseI+N-1) ) = cellstr( char( javaStringArray( (baseI):(baseI+N-1) ) ) )';  % matlab uses 1-based indices for java arrays...
    end
    
    baseI = (fullIterations)*N+1;        
    if( baseI<L )
        result( baseI:end ) = cellstr( char( javaStringArray( baseI:end ) ) )';
    end

end