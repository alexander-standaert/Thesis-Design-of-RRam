function [] = plot_vdd_speed_test()
    close all
    vdd_range = [0.75:0.05:1.1];
    t_range = [5.5:-0.1:2.0];
    
    results = zeros(length(t_range),length(vdd_range));
    
    results = add_point(0.80,5.5,vdd_range,t_range,results)
    results = add_point(0.85,4.3,vdd_range,t_range,results)
    results = add_point(0.90,2.9,vdd_range,t_range,results)
    results = add_point(0.95,2.4,vdd_range,t_range,results)
    results = add_point(1,2.3,vdd_range,t_range,results)
    results = add_point(1.05,2.2,vdd_range,t_range,results)
    results = add_point(1.1,2.2,vdd_range,t_range,results)
    
    results = flipud(results)
    results = [results zeros(size(results,1),1);zeros(1,size(results,2)+1)];
    t_range = fliplr(t_range*1e-9)
    
    f1 = figure;
    colormap([0.9,0,0;0,0.7,0])
    pcolor(results)
    xlabel('Vdd voltage (V)','FontSize', 12,'FontWeight','bold','interpreter','none')
    ylabel('Read frequency (Mhz)','FontSize', 12,'FontWeight','bold','interpreter','none')
    set(gca, 'XAxisLocation', 'top')
    set(gca,'xtick',[1:length(vdd_range)]+0.5)
    set(gca,'xtickLabel',{vdd_range})
    set(gca,'ytick',[1:length(t_range)]+0.5)
    ttick1 = [1e-6./t_range]
    for i = 1:length(ttick1)
       if mod(i-1,5) == 0
        ttick{i} = num2str(round(ttick1(i)))
       else
           ttick{i} = ' '
       end
    end
    set(gca,'ytickLabel',ttick)
    
end

function [results] = add_point(vdd,t,vdd_range,t_range,results)
    abs(vdd_range-vdd)
    [Y Ivdd] = min(abs(vdd_range-vdd));
    [Y It] = min(abs(t_range-t));
    
    results(1:It,Ivdd) = ones(It,1);
end