function [ line ] = writeWaveBlock( waveBlock, baseName )
% function [ line ] = writeWave( waveBlock, baseName )
%   return a set of text lines representing pwl-type vsources, driving the wires specified
%   by nodeName and the number of columns in waveBlock.values,   e.g.
%
%    waveBlock.values = [ 1 0  ;  0 0  ;  0 1 ]
%    waveBlock.period = 2e-9;
%    waveBlock.rt = 50e-12;
%    waveBlock.v  = 1.2;
%
%    writeWaveBlock( waveBlock, 'A' )
%      gives:
%      VA_0    ( A_0    0 ) vsource type=pwl wave=[ .... ]  % ( 1 0 )
%      VABar_0 ( ABar_0 0 ) vsource type=pwl wave=[ .... ]  % ( 0 1 )
%      VA_1    ( A_1    0 ) vsource type=pwl wave=[ .... ]  % ( 0 0 )
%      VABar_1 ( ABar_1 0 ) vsource type=pwl wave=[ .... ]  % ( 1 1 )
%      VA_2    ( A_2    0 ) vsource type=pwl wave=[ .... ]  % ( 0 1 )
%      VABar_2 ( ABar_2 0 ) vsource type=pwl wave=[ .... ]  % ( 1 0 )
%
%    transistion happens from   i*period-rt to i*period, with i=0,1,2,...
%
%    v is the voltage level.  Values in waveBlock.values must be 0/1, they 
%    are replaced with 0/v

s = size( waveBlock.values );
c = s(2);

line = '';

for k=1:c
    
    nodeName= sprintf( '%s_%d', baseName, k-1 );    
    wave.values = waveBlock.values( :, k );
    wave.v= waveBlock.v;
    wave.period = waveBlock.period;
    wave.rt     = waveBlock.rt;    
    line=sprintf( '%s%s\n', line, writeWave( wave, nodeName ) ); 
    
    nodeName= sprintf( '%sBar_%d', baseName, k-1 );
    wave.values = 1-waveBlock.values( :, k );
    line=sprintf( '%s%s\n', line, writeWave( wave, nodeName ) ); 

end
