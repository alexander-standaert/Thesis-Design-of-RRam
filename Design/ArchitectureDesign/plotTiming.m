function [] = plotTiming(sim)
    nb_subplots = 12;
    yshift = 0.017;
    labelshift = [0.02 0 0];
    ylimits = [-0.05 1.15];
    xlimits = [1 4];%[3.2 3.7];%[1 4];
    
    f1 = figure;
    set(gca, 'ActivePositionProperty', 'OuterPosition');
    
    ax(1) = subplot(nb_subplots,1,1);
    sig = sim.getSignal('xGB0.xLB1.SelREF_b');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.BLencLine_1','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(2) = subplot(nb_subplots,1,2);
    sig = sim.getSignal('xGB0.SelREF_1');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.Refenable_1','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(3) = subplot(nb_subplots,1,3);
%     sig = sim.getSignal('xGB0.xLB1.temp_0');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*2; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.xLB1.temp_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(4) = subplot(nb_subplots,1,4);
    sig = sim.getSignal('xGB0.xLB1.SelL_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*3; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.SelL_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(5) = subplot(nb_subplots,1,5);
%     sig = sim.getSignal('xGB0.Delay');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*4; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.Delay','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
     ax(6) = subplot(nb_subplots,1,6);
%     sig = sim.getSignal('xGB0.xLB1.SelLbarbarbar_0');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*5; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.xLB1.SelLbarbarbar_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(7) = subplot(nb_subplots,1,7);
    sig = sim.getSignal('xGB0.xLB1.SelLbar_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*6; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.SelLbar_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
     ax(8) = subplot(nb_subplots,1,8);
%     sig = sim.getSignal('xGB0.xLB1.SelLbarbar_0');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*7; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.xLB1.SelLbarbar_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(9) = subplot(nb_subplots,1,9:10);
    sig = sim.getSignal('xGB0.xLB1.BL_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*8; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.BL_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(10) = subplot(nb_subplots,1,11:12);
    sig = sim.getSignal('xGB0.BLout_1');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*9; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.BLout_1','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    xlabel('time (ns)','interpreter','none','FontSize', 10,'FontWeight','bold');
    set(ax(10),'ActivePositionProperty','OuterPosition')
    
    linkaxes([ax(1) ax(2) ax(3) ax(4) ax(5) ax(6) ax(7) ax(8) ax(9) ax(10) ],'x');
    
%     r = 150; % pixels per inch
%     set(f1, 'PaperUnits', 'inches', 'PaperType','<custom>','PaperSize',[8 11],'ActivePositionProperty','OuterPosition');
%     print(f1,'-dpng',sprintf('-r%d',r), strjoin({'./ArchitectureDesign/fig/timing_diagram.png'},''));

    f1 = figure;
    set(gca, 'ActivePositionProperty', 'OuterPosition');
    
    ax(1) = subplot(nb_subplots,1,1);
    sig = sim.getSignal('xGB0.xLB0.selBL_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.BLencLine_1','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(2) = subplot(nb_subplots,1,2);
    sig = sim.getSignal('xGB0.xLB0.selWL_b_3');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('WL3','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
     ax(3) = subplot(nb_subplots,1,3);
%     sig = sim.getSignal('xGB0.xLB0.temp_0');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*2; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.xLB1.temp_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(4) = subplot(nb_subplots,1,4);
    sig = sim.getSignal('xGB0.xLB0.SelL_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*3; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.SelL_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
     ax(5) = subplot(nb_subplots,1,5);
%     sig = sim.getSignal('xGB0.Delay');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*4; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.Delay','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
     ax(6) = subplot(nb_subplots,1,6);
%     sig = sim.getSignal('xGB0.xLB0.SelLbarbarbar_0');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*5; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.xLB1.SelLbarbarbar_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(7) = subplot(nb_subplots,1,7);
    sig = sim.getSignal('xGB0.xLB0.SelLbar_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*6; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.SelLbar_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
     ax(8) = subplot(nb_subplots,1,8);
%     sig = sim.getSignal('xGB0.xLB0.SelLbarbar_0');
%     sigx = sig.getXValues*10^9;
%     sigy = sig.getYValues;
%     plot(sigx,sigy,'LineWidth',3);
%     ylim(ylimits);xlim(xlimits);
%     set(gca,'XTickLabel',{''})
%     pos=get(gca,'Position');
%     pos(2)=pos(2)+yshift*7; 
%     set(gca,'Position',pos);
%     ylabh = get(gca,'YLabel');
%     ylabel('xGB0.xLB1.SelLbarbar_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(9) = subplot(nb_subplots,1,9:10);
    sig = sim.getSignal('xGB0.xLB0.BL_0');
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    set(gca,'XTickLabel',{''})
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*8; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.xLB1.BL_0','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    
    ax(10) = subplot(nb_subplots,1,11:12);
    sig = sim.getSignal('LBenable_0'); %BLout_0
    sigx = sig.getXValues*10^9;
    sigy = sig.getYValues;
    plot(sigx,sigy,'LineWidth',3);
    ylim(ylimits);xlim(xlimits);
    pos=get(gca,'Position');
    pos(2)=pos(2)+yshift*9; 
    set(gca,'Position',pos);
    ylabh = get(gca,'YLabel');
    ylabel('xGB0.BLout_1','Rotation',0,'Position',get(ylabh,'Position')-labelshift,'interpreter','none','FontSize', 10,'FontWeight','bold'); 
    xlabel('time (ns)','interpreter','none','FontSize', 10,'FontWeight','bold');
    set(ax(10),'ActivePositionProperty','OuterPosition')
    
    linkaxes([ax(1) ax(2) ax(3) ax(4) ax(5) ax(6) ax(7) ax(8) ax(9) ax(10) ],'x');
end

