% system('ls -F ~/Desktop/UltimateSweep/outputs/ |wc -l')

% system('ls ~/Desktop/UltimateSweep/outputs/ > ./LatchAnalysis/monitor.txt')
%
% fid = fopen('./LatchAnalysis/monitor.txt');
%
% sim_done = [];
% i = 1;
% tline = fgets(fid);
% totaldata = [];
% while ischar(tline)
%     try
%     [C,matches] = strsplit(tline,{'outputs_','.mat'});
%     indexI = str2num(cell2mat(C(2)))
%
%     data = load(strjoin({'/users/start2012/s0211331/Desktop/UltimateSweep/outputs/outputs_',num2str(indexI),'.mat'},''));
%     totaldata(i,:) = data.datamatrix;
%     catch
%
%     end
%     tline = fgets(fid);
%     i = i+1;
% end
%
% fclose(fid);

data = load(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/donedata.mat'},''));
donedata = data.totaldata;

DeltaV=[0.035:0.005:0.1];
Wuppair=[2:0.5:20];
Wdownpair=[2:0.5:20];
Wtop=[2:15];
Wdown=[2:15];

mega=allcomb(DeltaV,Wuppair,Wdownpair,Wtop,Wdown);

A=find(mega(:,1)<0.05);
B=find(mega(:,2)<10);
C=find(mega(:,3)<10);
mega(intersect(intersect(B,C),A),:)=[]; %DeltaV kleiner dan 50mV en diff pair kleiner dan 1000nm -> weg
A=find(mega(:,1)>0.075);
B=find(mega(:,2)>2.5);
C=find(mega(:,3)>2.5);
mega(intersect(intersect(B,C),A),:)=[]; %DeltaV groter dan 80mV en diff pair groter dan 250nm -> weg
A=find(mega(:,5)>mega(:,4));
mega(A,:)=[]; %nmos driver groter dan pmos driver -> weg
A=find(mega(:,4)>mega(:,2));
mega(A,:)=[]; %pmos driver groter dan pmos diff pair -> weg
A=find(mega(:,5)>mega(:,3));
mega(A,:)=[]; %nmos driver groter dan nmos diff pair -> weg
A=find(2*mega(:,5)<mega(:,4));
mega(A,:)=[]; %nmos driver 2x kleiner dan pmos driver -> weg
A=find(mega(:,2)>2*mega(:,3));
mega(A,:)=[]; %pmos diff pair groter dan 2x nmos diff pair -> weg
A=find(mega(:,2)< mega(:,3));
mega(A,:)=[]; %pmos diff pair kleiner dan nmos diff pair -> weg
A=find(2*mega(:,4) < mega(:,2));
mega(A,:)=[]; %pmos driver kleiner dan 3x pmos diff pair -> weg

[C,ia,ib] = intersect(donedata(:,5:end),mega,'rows')

mega(ib,:) = []


data = mega;
nb_of_blocks = 20;

totaldata = data;
blok_size = ceil(size(totaldata,1)/nb_of_blocks);
split_matrix = ones(1,nb_of_blocks)*blok_size;
oversize = (blok_size*nb_of_blocks-size(totaldata,1));
split_matrix(1:oversize) = split_matrix(1:oversize)-1;

if split_matrix(end) == 0
    error('Split is badly conditioned, please use an other number of blocks to split')
end

split_space = mat2cell(totaldata,split_matrix,5);

for i = 1:nb_of_blocks
    data = split_space{i};
    save(strjoin({'./LatchAnalysis/BasicLatch/UltimateSweep/inputs/inputs_',num2str(i-1),'.mat'},''),'data');
end
NoSims = size(mega,1);

