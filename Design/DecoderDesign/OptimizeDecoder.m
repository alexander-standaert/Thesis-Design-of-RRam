NoBLpLB = 2.^[4:10];
NoI=[2:10];
multfacnorm=[1e-1:1e-1:1];
NoIS=[2:2:8];

mega=allcomb(NoI,NoBLpLB,NoIS,multfacnorm);
mega(:,4)=mega(:,4).*mega(:,2)*100/1024;

A=find(mega(:,4)<1.1);
mega(A,:)=[];

energy=zeros(length(mega),1);
delay=zeros(length(mega),1);

blacklist = [];

for i = 1:length(mega)
    [~,t,e]=SizingSim(mega(i,1),mega(i,3),mega(i,4),mega(i,2));
    if isempty(t)
        blacklist = [blacklist;i];
    else
        energy(i)=e;
        delay(i)=t;
    end
end

datamatrix = [mega,delay,energy];
datamatrix(blacklist,:)=[];
save('./ArchitectureAnalysis/decodersizing.mat','datamatrix')