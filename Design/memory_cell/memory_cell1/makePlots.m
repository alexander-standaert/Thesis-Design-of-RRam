close all
[sim tree] = readPsfAscii('./memory_cell/memory_cell1/memory_cell1_testbench.raw/ana.tran', '.*')

bl = sim.getSignal('bl');
blx = bl.getXValues;
bly = bl.getYValues;

 sl = sim.getSignal('sl');
 slx = sl.getXValues;
 sly = sl.getYValues;
 
 wl = sim.getSignal('wl');
 wlx = wl.getXValues;
 wly = wl.getYValues;
 
 blI = sim.getSignal('vbl:p');
 blIx = blI.getXValues;
 blIy = blI.getYValues;
 
 figure
 hold on
 plot(slx,sly,'r')
 plot(blx,bly,'g')
 plot(blIx,blIy*10e3,'b')
 hleg1 = legend('selectline','bitline','current');
 hold off
 
 figure
 plot(blIx,blIy*10e6,'b')
 hleg1 = legend('current uA');
 ylim([-250 50])
