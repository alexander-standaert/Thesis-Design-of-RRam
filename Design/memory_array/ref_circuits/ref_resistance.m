function [] = ref_resistance()
%% param
Rlow_low = 5000;
Rlow_high = 10000;
Rlow_mean = (Rlow_low + Rlow_high)/2;
Rlow_var = 2500;

Rhigh_low = 30000;
Rhigh_high = 35000;
Rhigh_mean = (Rhigh_low + Rhigh_high)/2;
Rhigh_var = 2500;

n = 15000; %number of sim

randtype = 'cont';
if randtype == 'cont'
    arg1 = [Rlow_low 2*Rlow_var];
    arg2 = [Rhigh_low 2*Rhigh_var];
elseif randtype == 'gaus'
    arg1 = [Rlow_mean Rlow_var];
    arg2 = [Rhigh_mean Rhigh_var];
end

%% monte carlo Rlow//Rhigh

for i=1:n
   rlow = getrand(randtype,arg1);
   rhigh = getrand(randtype,arg2);
   
   rtot(i) = (rlow*rhigh)/(rlow+rhigh);
end
figure(1)
hist(rtot)

%% monte carlo Rhigh//Rhigh

for i=1:n
   rhigh1 = getrand(randtype,arg2);
   rhigh2 = getrand(randtype,arg2);
   
   rtot(i) = (rhigh1*rhigh2)/(rhigh1+rhigh2);
end
figure(2)
hist(rtot)

%% monte carlo Rhigh+Rlow//Rhigh+Rlow

for i=1:n
   rlow1 = getrand(randtype,arg1);
   rlow2 = getrand(randtype,arg1);
   rhigh1 = getrand(randtype,arg2);
   rhigh2 = getrand(randtype,arg2);
   
   r1 = rlow1+rhigh1;
   r2 = rlow2+rhigh2;
   
   rtot(i) = (r1*r2)/(r1+r2);
end
figure(3)
hist(rtot)

%% monte carlo Rhigh+Rtran//Rhigh+Rtran

for i=1:n
   rtran = 3e4;
   rhigh1 = getrand(randtype,arg1);
   rhigh2 = getrand(randtype,arg1);
   
   r1 = rtran+rhigh1;
   r2 = rtran+rhigh2;
   
   rtot(i) = (r1*r2)/(r1+r2);
end
figure(4)
hist(rtot)

end


function [rand_nb] = getrand(randtype, arg)
if randtype == 'cont'
    rand_nb = arg(1) + rand*arg(2);
elseif randtype == 'gaus'
    rand_nb = arg(1) + arg(2)*randn(1);
end
end