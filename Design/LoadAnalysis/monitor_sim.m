system('ls ./LoadAnalysis/mc_raw > ./LoadAnalysis/monitor.txt')

fid = fopen('./LoadAnalysis/monitor.txt');

sim_done = [];
i = 1;
tline = fgets(fid);
while ischar(tline)
    [C,matches] = strsplit(tline,{'mc','_','.mat'});
    sim_done(i,1) = str2num(cell2mat(C(2)));
    sim_done(i,2) = str2num(cell2mat(C(3)));
    system(strjoin({'cp ./LoadAnalysis/mc_raw/loadanalysis_mc',num2str(sim_done(i,1)),'_',num2str(sim_done(i,2)),'.mat',' ./LoadAnalysis/mc_raw2/loadanalysis_mc',num2str(i),'.mat'},''))
    tline = fgets(fid);
    i = i+1;
end

fclose(fid);

sim_done2 = [];
for i = 1:20
    sim_done2(i) = 100*length(find(sim_done(:,1)==i))/63;
end

close all
figure
bar(sim_done2)


% DONE  mc1 
% DONE  mc2 
% DONE  mc3 
% DONE  mc4 
% DONE  mc5      
% DONE  mc6 
% DONE  mc7       
% DONE  mc8  
%       mc9 v      
%       mc10 v
%       mc11 pc1-7
% DONE  mc12    
% DONE  mc13 
% DONE  mc14 
% DONE  mc15 
% DONE  mc16 
% DONE  mc17
% DONE  mc18 
%       mc19 
% DONE  mc20 
