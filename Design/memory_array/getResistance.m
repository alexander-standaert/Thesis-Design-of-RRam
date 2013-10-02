function [ Rout ] = getResistance(mode,Rin)
% random = random real memristor resistance
% high = a high real memristor resistance
% low = a low real memristor resistance
% fixed = a fixed resistance specified with Rin
R_fixed_high = 11000;
R_fixed_low = 2000;

if strcmp(mode,'high')
	Rout=R_fixed_high;
elseif strcmp(mode,'low')
	Rout=R_fixed_low;
elseif strcmp(mode,'random')
	Rout=round(rand*(R_fixed_high-R_fixed_low)+R_fixed_low);
elseif strcmp(mode,'fixed')
	Rout=Rin;
else
	Rout='error';
end
end

