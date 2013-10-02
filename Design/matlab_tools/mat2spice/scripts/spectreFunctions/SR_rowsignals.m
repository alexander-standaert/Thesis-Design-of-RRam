function [ output ] = SR_rowsignals( prefix, SR )
%% output = SR_rowsignals( prefix, SR )
%% 
%% example:
%% bus(  'Dp_', SR )
%% with 
%%   SR.segment_names   = { 'A', 'B' }
%%   SR.segment_lengths = [ 2  . 1   ]
%
%% results in 'Dp_A_0 Dp_ABar_0 Dp_A_1 Dp_ABar_1    Dp_B_0 Dp_BBar_0'

text = '';
firstEntry = 1;

for i=1:length( SR.segment_names )
    name = sprintf( '%s%s', prefix, SR.segment_names{i} );    
    for j= 1:SR.segment_lengths( i )
      if( firstEntry==1 ) 
        firstEntry=0;
        text = sprintf( '%s_%d %sBar_%d', name, j-1, name, j-1 );         
      else
        text = sprintf( '%s %s_%d %sBar_%d', text, name, j-1, name, j-1 ); 
      end
    end 
  
end
output = text;
