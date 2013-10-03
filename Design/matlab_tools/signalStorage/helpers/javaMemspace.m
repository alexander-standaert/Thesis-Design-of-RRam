function [ mem ]=javaMemspace() 
%function [ mem ]=javaMemspace() 
%
%  output the memory footprint and allowed footprint of the JVM inside
%  matlab

    mem.max   = java.lang.Runtime.getRuntime.maxMemory;
    mem.total = java.lang.Runtime.getRuntime.totalMemory;
    mem.free  = java.lang.Runtime.getRuntime.freeMemory;

    megabyte=1024*1024;
    
    fprintf( 'max   = %i Mbyte\n',round( mem.max  / megabyte ) );
    fprintf( 'total = %i Mbyte\n',round( mem.total/ megabyte ) );
    fprintf( 'free  = %i Mbyte\n',round( mem.free / megabyte ) );
end