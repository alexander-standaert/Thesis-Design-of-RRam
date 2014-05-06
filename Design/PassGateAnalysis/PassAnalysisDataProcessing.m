close all

load('./PassGateAnalysis/diff1.mat')
load('./PassGateAnalysis/diff2.mat')
load('./PassGateAnalysis/diff3.mat')
load('./PassGateAnalysis/diff4.mat')
load('./PassGateAnalysis/diff5.mat')
load('./PassGateAnalysis/diff6.mat')

levels=[1e-11:0.05:0.5];
% levels=[levels(1) 1e-9 levels(2:end)];

contour(in,outinit,vec2mat(abs(diff1),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
rectangle('Position',[in(1),outinit(1),in(end)-in(1),outinit(end)-outinit(1)],'FaceColor',[0,0,149/255])
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Initial voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Error complementary LVT passgates','FontWeight','bold','FontSize',14);
colorbar
figure
contour(in,outinit,vec2mat(abs(diff2),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
rectangle('Position',[in(1),outinit(1),in(end)-in(1),outinit(end)-outinit(1)],'FaceColor',[0,0,149/255])
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Initial voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Error complementary HVT passgates','FontWeight','bold','FontSize',14);
colorbar
figure
contour(in,outinit,vec2mat(abs(diff3),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Initial voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Error nMOS LVT passgates','FontWeight','bold','FontSize',14);
colorbar
figure
contour(in,outinit,vec2mat(abs(diff4),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Initial voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Error pMOS LVT passgates','FontWeight','bold','FontSize',14);
colorbar
figure
contour(in,outinit,vec2mat(abs(diff5),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Initial voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Error nMOS HVT passgates','FontWeight','bold','FontSize',14);
colorbar
figure
contour(in,outinit,vec2mat(abs(diff6),21)','LineColor',[0 0 0],'LevelStep',0.02,'LevelList',levels,'Fill','on');
xlabel('Voltage low impedance node [V]','FontWeight','bold','FontSize',14);
ylabel('Initial voltage high impedance node [V]','FontWeight','bold','FontSize',14);
title('Error pMOS HVT passgates','FontWeight','bold','FontSize',14);
colorbar