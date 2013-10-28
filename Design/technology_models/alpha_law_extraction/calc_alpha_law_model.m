

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
system('spectre -format psfascii ./technology_models/alpha_law_extraction/spice/sweep_nmos.sp');
system('spectre -format psfascii ./technology_models/alpha_law_extraction/spice/sweep_pmos.sp');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALPHA MODEL LAW VOOR NMOS

% --------------------------------- Vgs sweep

Vds = sp.Vds_values;    
Ncurves1 = length(Vds); 
for i=1:Ncurves1
    simulationFile = sprintf( './technology_models/alpha_law_extraction/spice/sweep_nmos.raw/swpA-%s_mysweepA.dc', fixedNumberOfDigits(i-1, 3,'0') );    
    sim_Vgs_sweep(i) = readPsfAscii( simulationFile );        
end
    
    
% --------------------------------- Vds sweep
Vgs = sp.Vgs_values;    
Ncurves2 = length(Vgs);    
for i=1:Ncurves2
    simulationFile = sprintf( './technology_models/alpha_law_extraction/spice/sweep_nmos.raw/swpB-%s_mysweepB.dc', fixedNumberOfDigits(i-1, 3,'0') );    
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
'Vth',0.2,sp.Vdd,10^-12,100000);

%extraction alpha
alpha = log(Id2/Id3)/log((Vg2-Vth)/(Vg3-Vth));

%extraction Vd0
Vd0 = sp.Vdd-Vth%K*sqrt(Vgs-Vth);

disp('=================================')
disp(' ALPHA MODEL PARAMETERS FOR NMOS ')
disp(' ')
disp(['ID0   = ', num2str(Id0)])
disp(['VD0   = ', num2str(Vd0)])
disp(['Vth   = ', num2str(Vth)])
disp(['alpha = ', num2str(alpha)])
disp(' ')
disp('=================================')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOT ALPHA MODEL LAW VOOR NMOS

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
    ID0 = ones(1,length(Vds))*Id0*((Vgs(i)-Vth)./(sp.Vdd-Vth)).^alpha;
    VD0 = ones(1,length(Vds))*(0.5*(Vgs(i)-Vth).^(1/2)).*((Vgs(i)-Vth)./(sp.Vdd-Vth)).^(alpha/2);
    RD0 = (1.6*ID0./VD0).*Vds;
    I = find((ID0-RD0)>0);
    p = I(end);
    ID0tot = [RD0(1:p) ID0(p+1:end)];
    plot(Vds,ID0tot,'r');
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALPHA MODEL LAW VOOR PMOS

% --------------------------------- Vgs sweep

Vds = sp.Vds_values;    
Ncurves1 = length(Vds); 
for i=1:Ncurves1
    simulationFile = sprintf( './technology_models/alpha_law_extraction/spice/sweep_pmos.raw/swpA-%s_mysweepA.dc', fixedNumberOfDigits(i-1, 3,'0') );    
    sim_Vgs_sweep(i) = readPsfAscii( simulationFile );        
end
    
    
% --------------------------------- Vds sweep
Vgs = sp.Vgs_values;    
Ncurves2 = length(Vgs);    
for i=1:Ncurves2
    simulationFile = sprintf( './technology_models/alpha_law_extraction/spice/sweep_pmos.raw/swpB-%s_mysweepB.dc', fixedNumberOfDigits(i-1, 3,'0') );    
    sim_Vds_sweep(i) = readPsfAscii( simulationFile );            
end
    
    
%extract Id0 (Ids when Vgs and Vds = Vdd
Id = sim_Vds_sweep(Ncurves2).getSignal('Vdrain:p').getYValues;
Id0 = Id(end);
    
%extraction Vth
Vgs = sim_Vgs_sweep(Ncurves1).getSignal('g').getYValues;
Id = sim_Vgs_sweep(Ncurves1).getSignal('Vdrain:p').getYValues;

figure(2)
subplot(1,5,[1,2]);
plot(Vgs,Id)
xlabel('Vgs [V]')
ylabel('Id [A]')
title('PMOS Vgs-Id')

Vg1 = 0.2;
Id1 = Id( find(Vgs == Vg1));

Vg2 = 0.3;
Id2 = Id( find(Vgs == Vg2));

Vg3 = 0.4;
Id3 = Id( find(Vgs == Vg3));

Vth = bisection(['log10(',num2str(Id1),'/',num2str(Id2),')*log10((',num2str(Vg2),'-Vth)/(',num2str(Vg3),'-Vth))-log10(',num2str(Id2),'/',num2str(Id3),')*log10((',num2str(Vg1),'-Vth)/(',num2str(Vg2),'-Vth))'], ...
'Vth',0.2,sp.Vdd,10^-9,1000);

%extraction alpha
alpha = log10(Id1/Id2)/log10((Vg1-Vth)/(Vg2-Vth));

%extraction Vd0
%Vd0 = K*sqrt(Vgs-Vth);

disp('=================================')
disp(' ALPHA MODEL PARAMETERS FOR PMOS ')
disp(' ')
disp(['ID0   = ', num2str(Id0)])
disp(['VD0   = ', num2str(Vd0)])
disp(['Vth   = ', num2str(Vth)])
disp(['alpha = ', num2str(alpha)])
disp(' ')
disp('=================================')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOT ALPHA MODEL LAW VOOR PMOS

%plot the alpha model resuts
figure(2)
subplot(1,5,[3,5]);
hold on
Ncurves = length(sim_Vds_sweep);    
for i=1:Ncurves
    x = sim_Vds_sweep(i).getSignal('Vdrain:p').getXValues;
    y = sim_Vds_sweep(i).getSignal('Vdrain:p').getYValues;  
    plot(x,y,'b')
end

Vgs = sp.Vgs_values;
Vds = 0:0.01:sp.Vdd;
Ncurves = length(Vgs);    
for i=1:Ncurves
    ID0 = ones(1,length(Vds))*Id0*((Vgs(i)-Vth)./(sp.Vdd-Vth)).^alpha;
    VD0 = ones(1,length(Vds))*(0.5*(Vgs(i)-Vth).^(1/2)).*((Vgs(i)-Vth)./(sp.Vdd-Vth)).^(alpha/2);
    RD0 = (ID0./VD0).*Vds;
    I = find((ID0-RD0)>0);
    p = I(end);
    ID0tot = [RD0(1:p) ID0(p+1:end)];
    plot(Vds,ID0tot,'r');
end

xlabel('Vds [V]')
ylabel('Id [A]')
title('PMOS Vds-Id')
axis([-Inf Inf 0 Inf])


figure(4)
hold on



for i=1:Ncurves
    x = sim_Vds_sweep(i).getSignal('Vdrain:p').getXValues;
    y = sim_Vds_sweep(i).getSignal('Vdrain:p').getYValues;  
    plot(x,x./y,'g')
end

Vds = sim_Vds_sweep(end).getSignal('Vdrain:p').getXValues;
Ids = sim_Vds_sweep(end).getSignal('Vdrain:p').getYValues; 

plot(Vds,Vds./Ids,'r')

fitobj2 = polyfit(Vds,Vds./Ids,6)

 
   
x = Vds;
plot(x,polyval(fitobj2,x))
   
sum(polyval(fitobj2,x))/length(polyval(fitobj2,x))




    