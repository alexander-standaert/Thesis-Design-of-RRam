function [t_process] = rc_latch(Vdiff,Cload,gpmos,gnmos)

	t_process = log(1./Vdiff)*10^-9;

end
