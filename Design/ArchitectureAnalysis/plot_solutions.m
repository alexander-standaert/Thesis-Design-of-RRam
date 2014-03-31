close all
data = load('./ArchitectureAnalysis/area_sol.mat');
area = data.all_solutions;

data = load('./ArchitectureAnalysis/delay_sol.mat');
delay = data.d;

data = load('./ArchitectureAnalysis/energy_sol.mat');
energy = data.energy_tot

data = load('./ArchitectureAnalysis/all_sol.mat');
solutions = data.all_solutions;


figure
hold on
s = 1000*area/max(area);
scatter(energy,delay,s,'MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0 0 1])
for i = 1:length(area)
   mss = sprintf(strjoin({'WL:',num2str(solutions(i,1)),'\nBL:',num2str(solutions(i,2)),'\nGB:',num2str(solutions(i,3))},''));
%    text(energy(i)+s(i)/3,delay(i),mss,'FontWeight','bold')
   text(energy(i)+10e-15,delay(i),mss,'FontWeight','bold')
end
xlabel('ENERGY','FontSize', 10,'FontWeight','bold')
ylabel('DELAY','FontSize', 10,'FontWeight','bold')
xlabel('ENERGY','FontSize', 10,'FontWeight','bold')
ylabel('DELAY','FontSize', 10,'FontWeight','bold')
