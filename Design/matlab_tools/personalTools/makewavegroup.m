function [ groupstruc ] = makewavegroup( name, waves)
grouptimes = [];
for i=1:length(waves)
    grouptimes(i) = sum(waves(i).time);
end
grouptime = max(grouptimes);
for i=1:length(waves)
   if sum(waves(i).time) ~= grouptime
       waves(i).time(end) = waves(i).time(end) + grouptime - sum(waves(i).time);
       test = '  sdsdfsdfsdf';
       warning(strcat('extending signal time    ',waves(i).name,'  in the group   ', name))
   end
end

groupstruc.name = name;
groupstruc.waves = waves;
groupstruc.grouptime = grouptime;
groupstruc.id = 'wavegroup';

end

