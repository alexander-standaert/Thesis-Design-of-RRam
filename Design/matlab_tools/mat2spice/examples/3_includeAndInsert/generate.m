
sp.key   = 'myKey';
sp.value = 5;

name = 'example';

map = sprintf( 'test/run_%s', name );        
m2s = sprintf( '%s.m2s', name );

mat2spice( m2s, map, sp );
