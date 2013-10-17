function [] = plotwave(sim,sig )
s = sim.getSignal(sig);
sx = s.getXValues;
sy = s.getYValues;
figure
plot(sx,sy)
end

