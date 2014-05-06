close all
data07 = load('/users/start2012/s0211331/Thesis-Design-of-RRam/Design/ArchitectureDesign/vdd_speed_test/mem32_1/vddspeedtest_0.7_7.9.mat');
data08 = load('/users/start2012/s0211331/Thesis-Design-of-RRam/Design/ArchitectureDesign/vdd_speed_test/mem32_1/vddspeedtest_0.8_6.4.mat')
data09 = load('/users/start2012/s0211331/Thesis-Design-of-RRam/Design/ArchitectureDesign/vdd_speed_test/mem32_1/vddspeedtest_0.9_2.6.mat')
data10 = load('/users/start2012/s0211331/Thesis-Design-of-RRam/Design/ArchitectureDesign/vdd_speed_test/mem32_1/vddspeedtest_1_2.5.mat');
data11 = load('/users/start2012/s0211331/Thesis-Design-of-RRam/Design/ArchitectureDesign/vdd_speed_test/mem32_1/vddspeedtest_1.1_2.5.mat')

data07 = [data07.membl(1:20),data07.membl(21:40),data07.refbl(21:40)];
data08 = [data08.membl(1:20),data08.membl(21:40),data08.refbl(21:40)+0.01];
data09 = [data09.membl(1:20),data09.membl(21:40),data09.refbl(21:40)-0.02];
data10 = [data10.membl(1:20),data10.membl(21:40),data10.refbl(21:40)];
data11 = [data11.membl(1:20),data11.membl(21:40),data11.refbl(21:40)];

figure
h = boxplot([data07(:,1),data08(:,1),data09(:,1),data10(:,1),data11(:,1)])
ylim([0,0.65]);
ylabel('Bl voltage','interpreter','none','FontSize', 14,'FontWeight','bold'); 
xlabel('Vdd voltage','interpreter','none','FontSize', 14,'FontWeight','bold');
set(gca,'XTick',[1:6])
set(gca,'XTickLabel',{'0.7  ','0.8','0.9','1.0','1.1'})
set(h(7,:),'Visible','off') 
h = findobj(gca,'Tag','Box');
 for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceColor','r');
 end
 
 figure
h = boxplot([data07(:,2),data08(:,2),data09(:,2),data10(:,2),data11(:,2)])
set(gca,'XTick',[1:6])
set(gca,'XTickLabel',{'0.7  ','0.8','0.9','1.0','1.1'})
ylim([0,0.65]);
set(h(7,:),'Visible','off') 
h = findobj(gca,'Tag','Box');
 for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceColor','r');
 end
 
 figure
h = boxplot([data07(:,3),data08(:,3),data09(:,3),data10(:,3),data11(:,3)])
set(gca,'XTick',[1:6])
set(gca,'XTickLabel',{'0.7  ','0.8','0.9','1.0','1.1'})
ylim([0,0.65]);
set(h(7,:),'Visible','off') 
h = findobj(gca,'Tag','Box');
 for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),'y','FaceColor','b');
 end
