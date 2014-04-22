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



%plot_data(x)
x = [solutions,s,area,delay',energy']

N = size(x,1);

M = 3;
V = 5;

x(:,V+M+1) = ones(N,1);

[c2,ia,ic] = unique(x(:,V+1:V+M),'rows');
x = x(ia,:);

out_of_fronts = 0;
front = 1;
while out_of_fronts == 0
    x_index = find(x(:,V+M+1) == front);
    N_new = size(x_index,1);
    
    if isempty(x_index)
        out_of_fronts = 1;
    else
        for i = 1:N_new
            continu = 1;
            x_index_temp = x_index;
            x_index_temp(i) = [];
            x_temp = x(x_index_temp,:);
            k = 0;
            while k < M && continu
                k=k+1;
                f = x(x_index(i),V+k);
                x_temp = x_temp(find(x_temp(:,V+k) <= f),:);
                if isempty(x_temp)
                    continu = 0;
                elseif k == M
                    x(x_index(i),V+M+1) = front + 1;
                end
            end
        end
    end
    front = front+1;
end


best_elements = x(find(x(:,(V+M+1))==1),1:V+M)

figure
hold on
scatter(best_elements(:,8),best_elements(:,7),best_elements(:,5),'MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0 0 1])
for i = 1:length(best_elements(:,1))
    mss = sprintf(strjoin({'WL:',num2str(best_elements(i,1)),'\nBL:',num2str(best_elements(i,2)),'\nGB:',num2str(best_elements(i,3))},''));
    %    text(energy(i)+s(i)/3,delay(i),mss,'FontWeight','bold')
    text(best_elements(i,8)+10e-15,best_elements(i,7),mss,'FontWeight','bold')
end
xlabel('ENERGY','FontSize', 10,'FontWeight','bold')
ylabel('DELAY','FontSize', 10,'FontWeight','bold')
