name = 'example';

map = sprintf( 'test/run_%s', name );        
m2s = sprintf( '%s.m2s', name );

fprintf( 'converting %s and dropping it in %s\n', m2s, map );

mat2spice( m2s, map );