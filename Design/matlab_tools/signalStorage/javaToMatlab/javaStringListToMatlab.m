function [ result ] = javaStringListToMatlab( javaList, N )
%function [ result ] = javaStringListToMatlab( javaList [,N] )
%
% convert the java object List<String> to an equivalent matlab 
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

    L = javaList.size();
    result = cell( 1, L );
    
    for i=1:1:L
        result{ i } = char( javaList.get( i-1 ) );
    end

end