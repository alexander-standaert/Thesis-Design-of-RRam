list = zeros(1,100);
while 1
    pause(2)
   [a,b] = system('ls /users/start2012/s0211331/Thesis-Design-of-RRam/Design/LatchAnalysis/BasicLatch/UltimateSweep/outputs -F |wc -l'); 
    list = [list(2:end),str2num(b)];
    figure(1)
    plot(list)
end