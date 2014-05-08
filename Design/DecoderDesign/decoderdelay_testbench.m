clear
% sp.decodertype = ''; % '' or 2
% 
% inputfile = 'decoderdelay_testbench.m2s';
% %  inputfile = 'decoder2.m2s';
% [currentpath,~,~] = fileparts(which(mfilename));
% mat2spicepath = strcat(currentpath,'/',inputfile);
% spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
% mat2spice(mat2spicepath,spicepath,sp)
% clear inputfile currentpath mat2spicepath spicepath
% 
% system('spectre -64 +aps ./DecoderDesign/SPICE/decoderdelay_testbench.sp')
% 
% [sim, ~] = readPsfAscii(strjoin({'./DecoderDesign/SPICE/decoderdelay_testbench.raw/ana.tran'},''), '.*');
% 
% for i = 4:9
% sig = sim.getSignal(strjoin({'out_',num2str(i),'_',num2str(2)},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues;
% [Y I] = min(abs(sigy-0.98));
% delay1(i) = sigx(I)-1e-9;
% sig = sim.getSignal(strjoin({'vvdd_',num2str(i),':p'},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues*-1;
% energy1(i) = trapz(sigx,sigy)  
% 
% end
% 
% sp.decodertype = 2; % '' or 2
% 
% inputfile = 'decoderdelay_testbench.m2s';
% %  inputfile = 'decoder2.m2s';
% [currentpath,~,~] = fileparts(which(mfilename));
% mat2spicepath = strcat(currentpath,'/',inputfile);
% spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
% mat2spice(mat2spicepath,spicepath,sp)
% clear inputfile currentpath mat2spicepath spicepath
% 
% system('spectre -64 +aps ./DecoderDesign/SPICE/decoderdelay_testbench.sp')
% 
% [sim, ~] = readPsfAscii(strjoin({'./DecoderDesign/SPICE/decoderdelay_testbench.raw/ana.tran'},''), '.*');
% 
% for i = 4:9
% sig = sim.getSignal(strjoin({'out_',num2str(i),'_',num2str(2)},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues;
% [Y I] = min(abs(sigy-0.98));
% delay2(i) = sigx(I)-1e-9
% sig = sim.getSignal(strjoin({'vvdd_',num2str(i),':p'},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues*-1;
% energy2(i) = trapz(sigx,sigy)  
% 
% end

% save('./DecoderDesign/comp_e_d.mat','energy1','energy2','delay1','delay2')

% sp.decodertype = '2b'; % '' or 2
% 
% inputfile = 'decoderdelay_testbench.m2s';
% %   inputfile = 'decoder2b.m2s';
% [currentpath,~,~] = fileparts(which(mfilename));
% mat2spicepath = strcat(currentpath,'/',inputfile);
% spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
% mat2spice(mat2spicepath,spicepath,sp)
% clear inputfile currentpath mat2spicepath spicepath
% 
% system('spectre -64 +aps ./DecoderDesign/SPICE/decoderdelay_testbench.sp')
% 
% [sim, ~] = readPsfAscii(strjoin({'./DecoderDesign/SPICE/decoderdelay_testbench.raw/ana.tran'},''), '.*');
% 
% for i = 4:9
% sig = sim.getSignal(strjoin({'vvdd_',num2str(i),':p'},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues*-1;
% energy2(i) = trapz(sigx(3:end),sigy(3:end))  
% 
% sig = sim.getSignal(strjoin({'vvddb_',num2str(i),':p'},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues*-1;
% energy2b(i) = trapz(sigx(3:end),sigy(3:end)) 
% 
% end
% 
% save('./DecoderDesign/energy_decoder2.mat','energy2','energy2b')


% sp.decodertype = ''; % '' or 2
% 
% inputfile = 'vgl_tree_line_buffer.m2s';
% %   inputfile = 'decoder2b.m2s';
% [currentpath,~,~] = fileparts(which(mfilename));
% mat2spicepath = strcat(currentpath,'/',inputfile);
% spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
% mat2spice(mat2spicepath,spicepath,sp)
% clear inputfile currentpath mat2spicepath spicepath
% 
% system('spectre -64 +aps ./DecoderDesign/SPICE/vgl_tree_line_buffer.sp')
% 
% [sim, ~] = readPsfAscii(strjoin({'./DecoderDesign/SPICE/vgl_tree_line_buffer.raw/ana.tran'},''), '.*');
% 
% sig = sim.getSignal(strjoin({'vvdd1:p'},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues*-1;
% energy2line = trapz(sigx(3:end),sigy(3:end))  
% 
% sig = sim.getSignal(strjoin({'vvdd2:p'},''));
% sigx = sig.getXValues;
% sigy = sig.getYValues*-1;
% energy2tree = trapz(sigx(3:end),sigy(3:end)) 




close all

f1 = figure
hold on
data = load('./DecoderDesign/energy_decoder2.mat')
data2 = load('./DecoderDesign/comp_e_d.mat')
plot([4:9],data.energy2b(4:9))
plot([4:9],data2.energy2(4:9),'r')
xlim([3.5,9.5])
legend('energy buffers inside decoder','total energy decoder')
ylabel('Energy (J)','FontSize', 12,'FontWeight','bold')
xlabel('Number of inputs of decoder','interpreter','none','FontSize', 12,'FontWeight','bold')

f1 = figure
data = load('./DecoderDesign/comp_e_d.mat')
[ha,l1,l2] = plotyy([4:9],data.delay1(4:9),[4:9],data.energy1(4:9))
set(l1,'Color','r')
set(l2,'Color','r','LineStyle','--')
set(ha(1),'XLim',[3.5,9.5])
set(ha(2),'XLim',[3.5,9.5])
set(ha(1),'YLim',[0.1e-9,2e-9])
set(ha(2),'YLim',[-3e-13,3.5e-13])
set(ha,{'ycolor'},{'k';'k'})
hold on
[ha,l1,l2] = plotyy([4:9],data.delay2(4:9),[4:9],data.energy2(4:9))
set(l1,'Color','b')
set(l2,'Color','b','LineStyle','--')
set(ha(1),'XLim',[3.5,9.5])
set(ha(2),'XLim',[3.5,9.5])
set(ha(1),'YLim',[0.1e-9,2e-9])
set(ha(2),'YLim',[-3e-13,3.5e-13])
ylabel(ha(1),'Delay (s)','interpreter','none','FontSize', 12,'FontWeight','bold')
ylabel(ha(2),'Energy (J)','interpreter','none','FontSize', 12,'FontWeight','bold')
xlabel(ha(1),'Number of inputs of decoder','interpreter','none','FontSize', 12,'FontWeight','bold')
set(ha,{'ycolor'},{'k';'k'})




bufferdelay = [0.08,0.081,0.15,0.16,0.16,0.25]*1e-9
decoderdelay = data.delay2(4:9);
wldelay = repmat(decoderdelay',1,6) + repmat(bufferdelay,6,1)

figure
hold all
cmp = [ones(7,1)*0.7,zeros(7,1),[0:0.14:0.14*6]']
for i = 1:6
    plot([4:9],wldelay(i,:),'Color',cmp(i,:))
end
plot([4:9],decoderdelay+0.1e-9,'b')
xlim([3.5,9.5])
ylim([0,9]*1e-10)
legend({'WL decoder 4 delay','WL decoder 5 delay', ...
       'WL decoder 6 delay','WL decoder 7 delay', ...
       'WL decoder 8 delay','WL decoder 9 delay', ...
       'BL decoder delay'},'interpreter','none')
ylabel('Delay (s)','interpreter','none','FontSize', 12,'FontWeight','bold')
xlabel('Number of inputs of BL decoder','interpreter','none','FontSize', 12,'FontWeight','bold')