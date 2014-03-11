NoBLpLB = 2.^[2:10];
NoI=[2:10];
multfacnorm=[1e-1:1e-1:1];
NoIS=[2:2:8];

mega=allcomb(NoI,NoBLpLB,NoIS,multfacnorm);
mega(:,4)=mega(:,4).*mega(:,2)*100/1024;
    