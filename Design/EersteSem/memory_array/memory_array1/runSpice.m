inputfile = 'memory_array1.m2s';

[currentpath,~,~] = fileparts(which(mfilename));

mat2spicepath = strcat(currentpath,'/',inputfile);
spicepath = strcat(strrep(currentpath,pwd,''),'/spice');

% Dimentions memory array							
number_of_wl=5;									
number_of_bl=5;										
														
% Resistor values										
mode='random'; %fixed/high/low/random					
R_fixed = 10000; %in Ohm									

mat2spice(mat2spicepath,spicepath,number_of_wl,number_of_bl,mode,R_fixed)

clear inputfile currentpath mat2spicepath spicepath
clear number_of_wl number_of_bl mode R_fixed