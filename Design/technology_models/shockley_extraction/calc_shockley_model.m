

sp.Vdd       = 1;
sp.step_small = 0.01;
sp.step_big = 0.1;

sp.Vds_values = -0.0:sp.step_big:sp.Vdd;
sp.Vgs_sweep  = -0.0:sp.step_small:sp.Vdd;
    
sp.Vgs_values = 0.6:sp.step_big:sp.Vdd;
sp.Vds_sweep  = -0.0:sp.step_small:sp.Vdd;

sp.nmosL = 45e-9;
sp.nmosW = 50e-9;
sp.pmosL = 45e-9;
sp.pmosW = 50e-9;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[currentpath,~,~] = fileparts(which(mfilename));
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');
mat2spice( 'sweep_nmos.m2s', spicepath, sp );
mat2spice( 'sweep_pmos.m2s', spicepath, sp );

close all
system('spectre -format psfascii ./technology_models/shockley_extraction/spice/sweep_nmos.sp');
system('spectre -format psfascii ./technology_models/shockley_extraction/spice/sweep_pmos.sp');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shockley VOOR NMOS

% --------------------------------- Vgs sweep

Vds = sp.Vds_values;    
Ncurves1 = length(Vds); 
for i=1:Ncurves1
    simulationFile = sprintf( './technology_models/shockley_extraction/spice/sweep_nmos.raw/swpA-%s_mysweepA.dc', fixedNumberOfDigits(i-1, 3,'0') );    
    sim_Vgs_sweep(i) = readPsfAscii( simulationFile );        
end
    
    
% --------------------------------- Vds sweep
Vgs = sp.Vgs_values;    
Ncurves2 = length(Vgs);    
for i=1:Ncurves2
    i
    simulationFile = sprintf( './technology_models/shockley_extraction/spice/sweep_nmos.raw/swpB-%s_mysweepB.dc', fixedNumberOfDigits(i-1, 3,'0') )
    
    sim_Vds_sweep(i) = readPsfAscii( simulationFile );            
end
    
    
%extract Id0 (Ids when Vgs and Vds = Vdd
Id = sim_Vds_sweep(Ncurves2).getSignal('Vsource:p').getYValues;
Id0 = Id(end);
    
%extraction Vth
Vgs = sim_Vgs_sweep(Ncurves1).getSignal('g').getYValues;
Id = sim_Vgs_sweep(Ncurves1).getSignal('Vsource:p').getYValues;

figure(1)
subplot(1,5,[1,2]);
plot(Vgs,Id);
xlabel('Vgs [V]');
ylabel('Id [A]');
title('NMOS Vgs-Id');

Vg1 = 0.6;
Id1 = Id( find(Vgs == Vg1));

Vg2 = 0.7;
Id2 = Id( find(Vgs == Vg2));

Vg3 = 0.8;
Id3 = Id( find(Vgs == Vg3));

Vth = bisection(['log10(',num2str(Id1),'/',num2str(Id2),')*log10((',num2str(Vg2),'-Vth)/(',num2str(Vg3),'-Vth))-log10(',num2str(Id2),'/',num2str(Id3),')*log10((',num2str(Vg1),'-Vth)/(',num2str(Vg2),'-Vth))'], ...
'Vth',0.2,sp.Vdd,10^-9,1000);


Vds = sim_Vds_sweep(end).getSignal('Vdrain:p').getXValues;
Ids = sim_Vds_sweep(end).getSignal('Vdrain:p').getYValues; 

Vds = Vds(end/2:end);
Ids = Ids(end/2:end);

fitobj = fit(Vds,Ids,'poly1');

p1 = -1*fitobj.p1;
p2 = -1*fitobj.p2;

A = (sp.Vdd-Vth)^2;
Vsat = 0.4;

K1 = (p2+p1*Vsat)/A
gamma = p1/(A*K1)


Vds = sim_Vds_sweep(end).getSignal('Vsource:p').getXValues;
Ids = sim_Vds_sweep(end).getSignal('Vsource:p').getYValues; 


Vds = Vds(1:(end/2));
Ids = Ids(1:(end/2));

fitobj = fit(Vds,Ids,[num2str((sp.Vdd-Vth)^2),'*p1*x-(p1/2)*x^2'])

K2 = fitobj.p1



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOT Shochley VOOR NMOS

%plot the alpha model resuts
figure(1)
subplot(1,5,[3,5]);
hold on;
Ncurves = length(sim_Vds_sweep);    
for i=1:Ncurves
    x = sim_Vds_sweep(i).getSignal('Vsource:p').getXValues;
    y = sim_Vds_sweep(i).getSignal('Vsource:p').getYValues;  
    plot(x,y,'b')
end

Vgs = sp.Vgs_values;
Vds = 0:0.01:sp.Vdd;
Ncurves = length(Vgs);
for i=1:Ncurves
    Ids1 = K2*((((Vgs(i)-Vth)^2)*Vds)-((Vds.^2)/2));
    Ids2 = K1*((Vgs(i)-Vth)^2)*(1+gamma*(Vds-Vsat));
    plot(Vds,Ids2,'r');
    hold on
    %plot(Vds,Ids1,'r');
end

xlabel('Vds [V]')
ylabel('Id [A]')
title('NMOS Vds-Id')


figure(3)
hold on



for i=1:Ncurves
    x = sim_Vds_sweep(i).getSignal('Vsource:p').getXValues;
    y = sim_Vds_sweep(i).getSignal('Vsource:p').getYValues;  
    plot(x,x./y,'g')
end

Vds = sim_Vds_sweep(end).getSignal('Vsource:p').getXValues;
Ids = sim_Vds_sweep(end).getSignal('Vsource:p').getYValues; 

plot(Vds,Vds./Ids,'r')

fitobj = polyfit(Vds,Vds./Ids,6)

 
   
x = Vds;
plot(x,polyval(fitobj,x))
   
sum(polyval(fitobj,x))/length(polyval(fitobj,x))