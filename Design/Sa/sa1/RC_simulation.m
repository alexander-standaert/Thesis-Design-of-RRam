clear al
close all

t_ofset = 1e-9;
t_step = 5e-12; 
t_stop = 7e-9;

Vout_init = 0; 
Vload = 1;
Rmem = 10000;
Rhigh = 35000;
Rlow = 5000;
Rload = 100;
Cload = 18e-15;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot optimum sample time.

[Vout_bll,Vout_blr,time] = rc_bitline(Vout_init,Vload,Cload,Rload,Rmem,Rhigh,Rlow,'~',t_ofset,t_stop,t_step);
t_latch = rc_latch(abs(Vout_bll-Vout_blr),0,0,0);
t_tot = t_latch + time;
[x,y] = min(t_tot);

figure(1)
subplot(3,1,1)
plot(time*10^9,abs(Vout_bll-Vout_blr))
hold on
plot(time(y)*10^9,abs(Vout_bll(y)-Vout_blr(y)),'o')
xlabel('time [ns]')
ylabel('Voltage differance bitlines [V]')

subplot(3,1,2)
plot(time*10^9,t_latch*10^9)
hold on
plot(time(y)*10^9,t_latch(y)*10^9,'o')
xlabel('time [ns]')
ylabel('computation time latch with Vdiff a time t [ns]')

subplot(3,1,3)
plot(time*10^9,t_tot*10^9)
hold on
plot(time(y)*10^9,t_tot(y)*10^9,'o')
xlabel('time [ns]')
ylabel('total computation time with latch Vdiff a time t [ns]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  plot t_tot  for one t1 and Rmos

st = 1e-9;
tmp = abs(time-(st+t_ofset));
[x sti] = min(tmp);

figure(2)
hold on
xlabel('Rpmos [Kohm]')
ylabel('total computation time with latch Vdiff a time t1 [ns]')


for r=1e4:1e3:7e4
	[Vout_bll,Vout_blr,time] = rc_bitline(Vout_init,Vload,Cload,Rload,Rmem,Rhigh,Rlow,r,t_ofset,t_stop,t_step);
        t_latch = rc_latch(abs(Vout_bll-Vout_blr),0,0,0);
        t_tot = t_latch+st;

	plot(r*10^-3,t_tot(sti)*10^9,'o')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  plot t_tot  for different t and optimum Rmos

figure(3)
hold on 
xlabel('time [ns]')
ylabel('total computation time with optimal Rpmos and sample time t [ns]')

for st=0.1e-9:0.1e-9:2e-9
	tmp = abs(time-(st+t_ofset));
	[x sti] = min(tmp);

	t_tot_min = 1000;
	r_min = 0;

	for r=1e4:1e3:7e4
		[Vout_bll,Vout_blr,time] = rc_bitline(Vout_init,Vload,Cload,Rload,Rmem,Rhigh,Rlow,r,t_ofset,t_stop,t_step);
		t_latch = rc_latch(abs(Vout_bll-Vout_blr),0,0,0);
		t_tot = t_latch+st;

		if t_tot(sti) < t_tot_min
			t_tot_min = t_tot(sti);
			r_min = r;
		end
	end

	plot(st*10^9,t_tot_min*10^9,'o')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot optimum Rmos voor Rmem at t1

st = 1e-9;
tmp = abs(time-(st+t_ofset));
[x sti] = min(tmp);

figure(4)
hold on
xlabel('Rmem [Kohm]')
ylabel('Rpmos optimum at sample time t1 [Kohm]')


for res_mem=5000:100:10000
	
	res_opt = 0;
	t_tot_min = 100;

        for r=1e4:1e3:7e4
                [Vout_bll,Vout_blr,time] = rc_bitline(Vout_init,Vload,Cload,Rload,res_mem,Rhigh,Rlow,r,t_ofset,t_stop,t_step);
                t_latch = rc_latch(abs(Vout_bll-Vout_blr),0,0,0);
                t_tot = t_latch+st;

                if t_tot(sti) < t_tot_min
        	        t_tot_min = t_tot(sti);
                	res_opt = r;
	        end
	end
	plot(res_mem*10^-3,res_opt*10^-3,'o')
end


for res_mem=30000:100:35000

        res_opt = 0;
        t_tot_min = 100;

        for r=1e4:2e3:7e4
                [Vout_bll,Vout_blr,time] = rc_bitline(Vout_init,Vload,Cload,Rload,res_mem,Rhigh,Rlow,r,t_ofset,t_stop,t_step);
                t_latch = rc_latch(abs(Vout_bll-Vout_blr),0,0,0);
                t_tot = t_latch+st;

                if t_tot(sti) <= t_tot_min
                        t_tot_min = t_tot(sti);
                        res_opt = r;
                end
        end
        plot(res_mem*10^-3,res_opt*10^-3,'o')
end

