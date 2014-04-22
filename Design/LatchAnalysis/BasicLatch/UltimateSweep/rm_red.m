
while 1
    
    system('ls /users/start2012/s0211331/Thesis-Design-of-RRam/Design/LatchAnalysis/BasicLatch/UltimateSweep/outputs/ > ./LatchAnalysis/monitor.txt');
    fid = fopen('./LatchAnalysis/monitor.txt');
    
    sim_done = [];
    i = 1;
    tline = fgets(fid);
    totaldata = [];
    while ischar(tline)
        try
            [C,matches] = strsplit(tline,{'outputs_','_','.mat'});
            index1 = str2num(cell2mat(C(2)));
            index2 = str2num(cell2mat(C(3)));
            
            data(i,1) = index1;
            data(i,2) = index2;
            
        catch
            
        end
        tline = fgets(fid);
        i = i+1;
    end
    
    fclose(fid);
    
    for i = 0:19
        datamax(i+1,1) = i;
        datamax(i+1,2) = max(data(find(data(:,1) == i),2));
    end
    
    for i = 1:length(data)
        
        [~,indx]=ismember(data(i,:),datamax,'rows');
        
        if indx == 0
            system(strjoin({'rm /users/start2012/s0211331/Thesis-Design-of-RRam/Design/LatchAnalysis/BasicLatch/UltimateSweep/outputs/outputs_',num2str(data(i,1)),'_',num2str(data(i,2)),'.mat'},''));
        end
    end
    
    system('rm ./LatchAnalysis/monitor.txt');
    
    pause(20)
end