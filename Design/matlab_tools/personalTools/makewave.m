function [ wavestruc ] = makewave( name,relative_time,values)
wavestruc.name = name;
wavestruc.time = relative_time;
wavestruc.values = values;
wavestruc.id = 'wave';

if length(relative_time) ~= length(values)
   error('ERROR length of time and value vector should be equal') 
end
end

