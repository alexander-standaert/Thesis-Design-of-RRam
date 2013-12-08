clear all

sp.Vdd       = 1;
sp.step_small = 0.01;
sp.step_big = 10e-9;

    
sp.w_values = 100e-9:sp.step_big:300e-9
sp.Vds_sweep  = -0.0:sp.step_small:sp.Vdd;

sp.nmosL = 45e-9;
sp.pmosL = 45e-9;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[currentpath,~,~] = fileparts(which(mfilename))
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
mat2spice( 'res_sweep_nmos.m2s', spicepath, sp );
mat2spice( 'res_sweep_pmos.m2s', spicepath, sp );

close all
system('spectre -format psfascii ./technology_models/res_cap_extraction/spice/res_sweep_nmos.sp');
system('spectre -format psfascii ./technology_models/res_cap_extraction/spice/res_sweep_pmos.sp');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% --------------------------------- Vds sweep
w = sp.w_values;    
Ncurves2 = length(w);    
for i=1:Ncurves2
    simulationFile = sprintf( './technology_models/res_cap_extraction/spice/res_sweep_nmos.raw/swp-%s_mysweep.dc', fixedNumberOfDigits(i-1, 3,'0') );    
    sim_Vds_sweep(i) = readPsfAscii( simulationFile );            
end
    

%Vds = sim_Vds_sweep(end).getSignal('Vsource:p').getXValues;
%Ids = sim_Vds_sweep(end).getSignal('Vsource:p').getYValues; 

%plot(Vds,Vds./Ids,'r')

%fitobj = polyfit(Vds,Vds./Ids,6)

 
   
%x = Vds;
%plot(x,polyval(fitobj,x))
   
%sum(polyval(fitobj,x))/length(polyval(fitobj,x))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --------------------------------- Vds sweep
w = sp.w_values;    
Ncurves = length(w);    
for i=1:Ncurves
    simulationFile = sprintf( './technology_models/res_cap_extraction/spice/res_sweep_pmos.raw/swp-%s_mysweep.dc', fixedNumberOfDigits(i-1, 3,'0') );    
    sim_Vds_sweep(i) = readPsfAscii( simulationFile );            
end
    
res_vds = 0.8;

figure
hold on
subplot(1,3,[1,2])
for i=1:Ncurves
    Vds = sim_Vds_sweep(i).getSignal('Vdrain:p').getXValues;
    Ids = sim_Vds_sweep(i).getSignal('Vdrain:p').getYValues;  
    plot(Vds,Vds./Ids,'b')
    hold on
    ix = find(Vds==res_vds);
    plot(Vds(ix),Vds(ix)/Ids(ix),'o')
    res(i) = Vds(ix)/Ids(ix);
end

res_fit = polyfit(w,res,6)

subplot(1,3,3)
plot(w,res)
hold on
plot(w,polyval(res_fit,w),':','color','r')




    
