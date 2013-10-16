function [ waveformstring ] = wavegen( wavebitmatrix,risetime, falltime, timeoffset, vdd, TALT)
% WAVEGEN --- Wouter Diels --- 16/10/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% wavebitmatrix is a 2 by n matrix
% The first column is the timevector, it indicates transition times of
% binary signals. The first number must be zero.
% The second column is a vector consisting of alternating 0's or 1's.
% The function generates a waveform string designed for spectre pwl signals 
% Addition parameters are the rise and falltimes of the binary signals and
% an offset for the transition times
% TALT stands for 'time after last transition' indicating how long the
% waveform keeps running after the last transition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time = wavebitmatrix(1,:);
bits = vdd*wavebitmatrix(2,:);

n = size(time,2);

waveformvector = zeros(1,4*n);
for i=2:n-1
    if bits(i)==0
        waveformvector(4*i-3)=timeoffset+time(i)+falltime;
    else
        waveformvector(4*i-3)=timeoffset+time(i)+risetime;
    end
    waveformvector(4*i-2)=bits(i);
    waveformvector(4*i-1)=timeoffset+time(i+1);
    waveformvector(4*i)=bits(i);
end
waveformvector(1)=time(1);
waveformvector(2)=bits(1);
waveformvector(3)=timeoffset+time(2);
waveformvector(4)=bits(1);
if bits(n) ==0
    waveformvector(4*n-3)=timeoffset+time(n)+falltime;
else
    waveformvector(4*n-3)=timeoffset+time(n)+risetime;
end
waveformvector(4*n-2)=bits(n);
waveformvector(4*n-1)=timeoffset+time(n)+TALT;
waveformvector(4*n)=bits(n);

waveformstring = mat2str(waveformvector);


end

