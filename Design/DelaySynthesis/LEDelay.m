
sp.fanout = 2.^[3:10];
sp.stageeffort = 4;
sp.cload = 0+3+0; % NOR + INV + CAP
sp.buffertype = 'WL';
max_N = round(log10(sp.fanout(end)*sp.cload/3)/log10(sp.stageeffort)) % geld enkel voor NOR output
sp.sizing = cumprod([1 ones(1,max_N-1)*4])

sp.debugon = 0;

inputfile = 'LEDelay.m2s';
[currentpath,~,~] = fileparts(which(mfilename));
mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/SPICE');
mat2spice(mat2spicepath,spicepath,sp)
clear inputfile currentpath mat2spicepath spicepath

if sp.debugon
   [sim, ~] = readPsfAscii('./DelaySynthesis/SPICE/LEDelay.raw/ana.tran', '.*'); 
   
   close all
   f1 = figure
   hold on
   cmp = [[1:-0.1:0]',zeros(11,1),[0:0.1:1]']
      
   sig = sim.getSignal('out_buffered_8');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(1,:))
   
   sig = sim.getSignal('out_notbuffered_8');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(1,:))
   
   sig = sim.getSignal('out_buffered_16');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(2,:))
   
   sig = sim.getSignal('out_notbuffered_16');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(2,:))
   
   sig = sim.getSignal('out_buffered_32');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(3,:))
   
   sig = sim.getSignal('out_notbuffered_32');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(3,:))
   
   sig = sim.getSignal('out_buffered_64');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(4,:))
   
   sig = sim.getSignal('out_notbuffered_64');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(4,:))
   
   sig = sim.getSignal('out_buffered_128');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(5,:))
   
   sig = sim.getSignal('out_notbuffered_128');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(5,:))
    
   sig = sim.getSignal('out_buffered_256');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(6,:))
   
   sig = sim.getSignal('out_notbuffered_256');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(6,:))
   
   sig = sim.getSignal('out_buffered_512');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(7,:))
   
   sig = sim.getSignal('out_notbuffered_512');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(7,:))
   
   sig = sim.getSignal('out_buffered_1024');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'Color',cmp(8,:))
   
   sig = sim.getSignal('out_notbuffered_1024');
   sigx = sig.getXValues*10^9;
   sigy = sig.getYValues;
   plot(sigx,sigy,'--','Color',cmp(8,:))
   xlim([1,5])
   ylim([-0.05,1.1])
   xlabel('Time (ns)','interpreter','none','FontSize', 10,'FontWeight','bold'); 
   ylabel('Voltage (V)','interpreter','none','FontSize', 10,'FontWeight','bold'); 
   
   legend({'out_buffered_8','out_notbuffered_8', ...
       'out_buffered_16','out_notbuffered_16', ...
       'out_buffered_32','out_notbuffered_32', ...
       'out_buffered_64','out_notbuffered_64', ...
       'out_buffered_128','out_notbuffered_128', ...
       'out_buffered_256','out_notbuffered_256', ...
       'out_buffered_512','out_notbuffered_512', ...
       'out_buffered_1024','out_notbuffered_1024'},'interpreter','none')
else
   system(strjoin({'cp ./DelaySynthesis/SPICE/LEDelay.sp ./ArchitectureDesign/SPICE/buffers_',sp.buffertype,'.sp'},'')) 
end