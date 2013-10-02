function [ SA ] = getSAForTech( DVin, nSigmaMismatch, nSigmaNoise, tech )
% function [ SA ] = getSAForTech( DVin, tech )
% 
% return a sense amplifier structure that can sense the given differential input signal
% with <nSigmaOffset> variability constraint + <nSigmaNoise> noise constraint
%
% reasonable parameters:
%   nSigmaOffset = 6.1
%   nSigmaNoise  = 10    ( without ECC)
%
% No additional margins are included
%
% For information about the SA design, see Stefan Cosemans's dissertation
%
% multi-size SA redundancy with N=2 is used. The small SA is designed for 2-sigma,
% hence if noise is not relevant, it is 9x smaller than the big SA 
% (which is designed for 5.5 sigma).  This combination gives the same yield as a single
% SA designed for 6.1 sigma.
%
% noise is assumed to be sqrt(2)/Apre  sqrt( kT/C0 ), with C0 the capacitance on the
% internal nodes of the SA ( C0 is the capacitance of one node ).
%
% Apre is fixed to 2.5x, which can be obtained with the pulsed current source SA at an 
% energy/decision of 14fJ/decision in 90nm technology for 15mV sigma-Voffset.

 
% note: If tech assumes Advt ~ sqrt( lambda ), SA energy (without thermal noise)
%       scales as lambda, identical to other energy contributions
%       With thermal noise, the internal node capacitance needs to stay constant, hence only
%       reductions in Vdd will help
%       With Apre=2.5x, 10-sigma Vt for a 1fF internal node capacitance is 10mV

% To keep things managable, 
% we assume DVin > nSigmaMismatch * sigmaVoffset,mismatch + nSigmaNoise * sigmaVoffset,thermal
%
% we just  scan values of C0, calculate DVin,effective = DVin - nSigmaNoise * sigmaVoffset,thermal, and
% from this calculate the minimal size of the 2-sigma SA.  We take the largest value of C0 and the offset calculation.
% then we select the SA with C0 that corresponds to the minimal total energy.
%
% We ignore the additional energy due to the 5% SAs that must switch to the big SA.

% base design is the 90nm , 14fJ design for 20mV sigma-Voffset,mismatch  ( mismatch Advt=4mVum )
% C0=4.1fF
% We assume all 14fJ is needed for mismatch ~(Avt)^2

    nRatioCalibration=3; % 3 for N=2 multi-sized SA redundancy ; 1 for no calibration
    Apre = 2.5;
    

    constants = getConstants();   

    C0noise = 0.1e-15 * 2.^(0:0.1:10);  % 0.1fF .. 100fF
    %Apre = 2.5; % 1 for drain-input latch-type, 2.5 for pulsed current SA
    T = 273+75;  
    
    sigmaNoise = (sqrt(2)/Apre) .* sqrt( constants.k .* T ./ C0noise );
    DVineffective = DVin - nSigmaNoise * sigmaNoise;

    if max( DVineffective ) <=0 
       error( 'no viable solutions for DVin=%3.3fmV due to thermal noise\n', DVin*1000 );
    end
    
    I = find( DVineffective>0 );
    C0noise = C0noise(I);
    DVineffective= DVineffective( I );
    
    AvtRatio = ( tech.Advt / 4e-9 );  % smaller than 1 for more recent tech
    
    % design for 2 sigma:
    scale = ( AvtRatio )^2 * ...               % correction for improved Avt
            (nSigmaMismatch/nRatioCalibration)^2/6.1^2 * ...   % correctoin for calibration
            (20e-3./(DVineffective/nSigmaMismatch)).^2  ;        % correction for effective input signal
    
    C0mismatch = 4.1e-15 * scale;
    
    C0combined = max( C0noise, C0mismatch );
    [ C0 Iopt ] = min(C0combined);
    
    SA.energyVector = C0combined .* tech.Vdd^2 * (14/4.1);  %4.1fF ~ 14fJ
    SA.energy = SA.energyVector( Iopt );
    
    SA.Iopt = Iopt;
    SA.C0noise = C0noise;
    SA.C0mismatch = C0mismatch;
    SA.Vdd = tech.Vdd;
    SA.scale = scale;
    SA.DVineffective = DVineffective;
    SA.Apre = Apre;
    SA.T = T;
    SA.lambda = tech.lambda;
    
    if( C0noise(Iopt)>C0mismatch(Iopt) )
       SA.dominatedBy = 'noise' ; 
    else
       SA.dominatedBy = 'mismatch' ; 
    end
    
end