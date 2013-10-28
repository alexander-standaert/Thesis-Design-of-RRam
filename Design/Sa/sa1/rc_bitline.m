function [Vout_bll, Vout_blr, time] = rc_bitline(Vout_init,Vload,Cload,Rload,Rmem,Rhigh,Rlow,Rpmos,t_ofset,t_stop,t_step)

	Vout_bll = zeros(1,t_stop/t_step);
	Vout_blr = Vout_bll;
	time = zeros(1,t_stop/t_step);

	Rfitnmos =  1.0e+06 * [-1.3860 4.4639 -5.4951 3.1829 -0.8474 0.1332 0.0074];
	Rfitpmos =  1.0e+07 * [-0.2850 0.9297 -1.1662 0.6958 -0.1952 0.0296 0.0016];
	
	if Rpmos == '~'
		Rnmos = polyval(Rfitnmos,0.2);
		Rpmos = polyval(Rfitpmos,0.9);
	elseif Rpmos == 'opt'
		Rnmos = polyval(Rfitnmos,0.2);
                Rpmos = 23486.01425; %13781.48590 ;
	else
		Rnmos = polyval(Rfitnmos,0.2);
                Rpmos = Rpmos;
	end


	Rref = (Rhigh + Rlow)/2;

	for i=1:(t_stop/t_step)
    		time(i+1) = i*t_step;
        
    		tau_l = Cload*(Rload*Rmem+Rload*Rnmos+Rpmos*Rnmos+Rpmos*Rmem)/(Rmem+Rnmos+Rload+Rpmos);
    		V0_l = (Rmem+Rnmos)*Vload/(Rmem+Rnmos+Rpmos+Rload);
    
    		Vout_bll(i+1) = V0_l*(Vload-exp(-i*t_step/tau_l));

		%tau_r = (1/2)*Cload*(Rload*Rhigh*Rlow+Rload*Rhigh*Rnmos+Rload*Rnmos*Rlow+Rload*Rnmos^2+Rpmos*Rhigh*Rlow+Rpmos*Rhigh*Rnmos+Rpmos*Rnmos*Rlow+Rpmos*Rnmos^2)/(2*Rhigh*Rlow+2*Rhigh*Rnmos+2*Rnmos*Rlow+2*Rnmos^2+Rload*Rhigh+Rload*Rlow+2*Rload*Rnmos+Rpmos*Rhigh+Rpmos*Rlow+2*Rpmos*Rnmos);
	        %V0_r = (Rhigh+Rnmos)*(Rlow+Rnmos)*Vload/((Rhigh+Rlow+2*Rnmos)*((Rhigh+Rnmos)*(Rlow+Rnmos)/(Rhigh+Rlow+2*Rnmos)+(1/2)*Rload+(1/2)*Rpmos));

		tau_r = Cload*(Rload*Rref+Rload*Rnmos+Rpmos*Rnmos+Rpmos*Rref)/(Rref+Rnmos+Rload+Rpmos);
                V0_r = (Rref+Rnmos)*Vload/(Rref+Rnmos+Rpmos+Rload);


                
		Vout_blr(i+1) = V0_r*(Vload-exp(-i*t_step/tau_r));

	end

	time_ofset = 0:t_step:t_ofset;
	time = time + t_ofset;
	time = [time_ofset time];

	Vout_ofset = zeros(1,length(time_ofset));
	Vout_bll = [Vout_ofset Vout_bll];
	Vout_blr = [Vout_ofset Vout_blr];
end

