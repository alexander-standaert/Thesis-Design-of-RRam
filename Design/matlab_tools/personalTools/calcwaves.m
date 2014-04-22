function [ wavestrucs ] = calcwaves( wavegroups)
    risetime = 0.1e-9;
    falltime = 0.05e-9;
    vdd = 1;
    TALT = 5.5e-9;
    
    
    wavenames = [];
    %find all wavenames
    for i=1:length(wavegroups)
        wavegroup = wavegroups(i);
        wavenames = [{wavegroup.waves.name} wavenames];
    end
    wavenames = unique(wavenames);
    
    %gen big waves
    for i=1:length(wavenames)
        totalwave{i}.name = wavenames(i);
        totalwave{i}.time = [];
        totalwave{i}.values = [];
        totalwave{i}.id = 'wave';
        for k=1:length(wavegroups)
            wavegroup = wavegroups(k);
            if ismember(totalwave{i}.name,{wavegroup.waves.name})
                for l=1:length(wavegroup.waves)
                    if strcmp([wavegroup.waves(l).name],num2str(cell2mat(totalwave{i}.name)))
                        totalwave{i}.time = [totalwave{i}.time wavegroup.waves(l).time];
                        totalwave{i}.values = [totalwave{i}.values wavegroup.waves(l).values];
                    end
                end
            else
                if isempty(totalwave{i}.time)
                    totalwave{i}.time = [wavegroup.grouptime];
                elseif isempty(totalwave{i}.values)
                    totalwave{i}.time = [totalwave{i}.time wavegroup.grouptime];
                else
                    totalwave{i}.time = [totalwave{i}.time wavegroup.grouptime];
                    totalwave{i}.values = [totalwave{i}.values totalwave{i}.values(end)];
                end
            end
        end
        if length(totalwave{i}.time) ~= length(totalwave{i}.values)
            totalwave{i}.values = [totalwave{i}.values(1)*ones(1,length(totalwave{i}.time)-length(totalwave{i}.values)) totalwave{i}.values];
        end
    end
     
%     set absolute time + wavegen
%     try
%         wavestrucs = [];
%         for i=1:length(totalwave)
%             totalwave{i}.time = cumsum([0 totalwave{i}.time(1:end-1)]);
%             residu=[];
%             for j=1:length(totalwave{i}.time)-1
%                 if totalwave{i}.values(j) == totalwave{i}.values(j+1)
%                     if totalwave{i}.values(j) ==1
%                         residu(end+1)=j;
%                     end
%                 end
%             end
%             timenew=totalwave{i}.time;
%             timenew(residu)=[];
%             valuesnew=totalwave{i}.values;
%             valuesnew(residu)=[];
%             
%             wavevalues = wavegen([timenew;valuesnew],risetime, falltime, 0, vdd, TALT);
%             wavestrucs.(num2str(cell2mat(totalwave{i}.name))) = wavevalues;
%             
%             
%         end
%     catch
        wavestrucs = [];
        for i=1:length(totalwave)
            totalwave{i}.time = cumsum([0 totalwave{i}.time(1:end-1)]);
            wavevalues = wavegen([totalwave{i}.time;totalwave{i}.values],risetime, falltime, 0, vdd, TALT);
            wavestrucs.(num2str(cell2mat(totalwave{i}.name))) = wavevalues;
        end
%     end
end

