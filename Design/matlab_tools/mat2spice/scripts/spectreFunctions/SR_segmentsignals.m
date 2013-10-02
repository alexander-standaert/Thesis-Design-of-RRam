function [ output ] = SR_segmentsignals( prefix, SR, segmentIndices )
%% output = SR_rowsignals( prefix, SR )
%% 
%% example:
%% bus(  'Dp_', SR, segmentIndices )
%% with 
%%   SR.segment_names   = { 'A', 'B' }
%%   SR.segment_lengths = [ 2  . 1   ]
%%   segmentIndices = [ 2 ]
%%
%% results in 'Dp_B_0 Dp_BBar_0'   
% segmentIndices=[ 2 ] means that only the names of segment 2 (the second
% segment as we start at index 1) are written

text = '';
firstEntry = 1;

for i=segmentIndices
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
