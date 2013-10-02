function [ output ] = SR_lastRowSignalName( prefix, SR )
%% output = SR_lastRowSignalName( prefix, SR )
%% 
%% example:
%% bus(  'Dp_', SR )
%% with 
%%   SR.segment_names   = { 'A', 'B' }
%%   SR.segment_lengths = [ 2  . 1   ]
%
%% results in 'Dp_B_0'

text = '';
firstEntry = 1;

i=length( SR.names )
name = sprintf( '%s%s', prefix, SR.names{i} );    
j= SR.segment_lengths( i )
output = sprintf( '%s_%d', name, j );         

end