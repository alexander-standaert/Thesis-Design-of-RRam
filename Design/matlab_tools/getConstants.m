function [ constants units] = getConstants()
% function [ constants units] = getConstants()



% boltzmann constant (google calculator)
constants.k = 1.3806503e-23; 
units.k = { 'm2 kg s-2 K-1 ' , 'Joule/Kelvin' };

% elementary charge  (wikipedia)
constants.q = 1.602176487e-19;  
units.q =  { 'Coulomb' };

constants.eps0 = 8.854187817e-12; % F/m
units.eps0 = { 'F/m' };


% permittivity of silicon, eps_s (Yannis Tsividis)
constants.eps_s = 0.104e-15/1e-6; % 0.104fF/um , 
units.eps_s= { 'F/m' };

% permittivity of silicon dioxide, eps_ox (Yannis Tsividis)
constants.eps_ox = 0.0345e-15/1e-6; % 0.0345fF/um , 
units.eps_ox= { 'F/m' };



% planck constant
constants.h =  6.62606896e-34 ; % Js
units.h = { 'J s' };
constants.h_eV = constants.h / constants.q; % eV s
units.h_eV = { 'eV s' };

constants.hbar = constants.h / (2*pi);
units.hbar = units.h;
constants.hbar_eV = constants.hbar / constants.q; % eV s
units.hbar_eV = units.h_eV;

%speed of light in vacuum
constants.c = 299792458;
units.c = { 'm/s' };

% 
constants.u0   = 4*pi*1e-7; % V s/(A m)
units.u0 = {'V s / (A m)' };


% electron
constants.electronMass = 9.10938e-31; %kg
units.electronMass = { 'kg' };


end

