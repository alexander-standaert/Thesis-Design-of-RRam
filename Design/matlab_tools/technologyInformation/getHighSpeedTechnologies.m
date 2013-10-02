function [ technologies ] = getHighSpeedTechnologies( lambdas )
% function [ technologies ] = getHighSpeedTechnologies( lambdas )
%
% Return a structure with an estimated performance for each
% of the requested technologies, as specified by lambdas=F=tech node
%
% lambda must be expressed in meters, e.g. 90e-9 for 90nm
% 
% down to 90nm, full scaling is used ( vdd ~ lambda )
% from 90nm onward, vdd is kept at 1V
% 
% for recent technology nodes, intel is used as reference technology
% 

    for i=1:length( lambdas )
       lambda = lambdas(i);
       tech = getTechnology( lambda );
       technologies(i) = tech;
    end

end

function [ tech ] = getTechnology( lambda )

    [ CgPerMeter CgPer2Lambda Cox ] = getCg( lambda );    
    
    tech.lambda = lambda;
    
    tech.CgPerMeter = CgPerMeter; 
    tech.CgPer2Lambda  = CgPer2Lambda;
    tech.Cox        = Cox;
    
    tech.CdrainPerMeter  = tech.CgPerMeter * 1.4; % crude estimation - started from 2lambda, probably overstimation
    tech.CsourcePerMeter = tech.CgPerMeter * 1.4; % crude estimation
    
    tech.CdrainPer2Lambda  = tech.CgPer2Lambda * 1.4; % crude estimation
    tech.CsourcePer2Lambda = tech.CgPer2Lambda * 1.4; % crude estimation
    
    tech.invDelay = 7e-12 * lambda / 90e-9;
    % IBM: 7ps in 90nm bulk - 5ps at 90nm SOI, but that is SOI
    tech.FO4Delay = 2*10e-12 * lambda / 90e-9;
    
    
    
    if lambda>100e-9
        tech.Vdd       = lambda*10e6;        
        tech.NMOS_IonPerMeter = 1000;  %uA/um = A/m -- constant: V and L both go down
        tech.PMOS_IonPerMeter =  700;  %uA/um = A/m -- constant: V and L both go down
    else
        tech.Vdd       = 1;
        tech.NMOS_IonPerMeter = 1000*(lambda*1e9/90)^(-1/2.5);  %uA/um = A/m
        % linear fit through (90nm, 1000) ; (32nm, 1500) -- constant: V and L both go down
        tech.PMOS_IonPerMeter = 700*(lambda*1e9/90)^(-1/2);  %uA/um = A/m
        % linear fit through (90nm, 700) ; (32nm, 1200) -- constant: V and L both go down
    end
    
    tech.NMOS_IonPer2Lambda = tech.NMOS_IonPerMeter * 2 * lambda;
    tech.PMOS_IonPer2Lambda = tech.PMOS_IonPerMeter * 2 * lambda;
    
    tech.NMOS_RonPerMeter   = tech.Vdd / tech.NMOS_IonPerMeter;
    tech.PMOS_RonPerMeter   = tech.Vdd / tech.PMOS_IonPerMeter;
    tech.NMOS_RonPer2Lambda = tech.NMOS_RonPerMeter / (2 * lambda);
    tech.PMOS_RonPer2Lambda = tech.PMOS_RonPerMeter / (2 * lambda);    
    
    Advt90nm = 4e-3*1e-6; % 1mVum -- this is divided by sqrt( 2*w*l )
    tech.Advt = Advt90nm *sqrt( lambda/90e-9 );
    tech.sigmaVt2Lambda = tech.Advt / sqrt(2*lambda*2*lambda);
    
    %pelgrom constant    
    
end

function [ CgPerMeter CgPer2Lambda Cox ] = getCg( nodeLambda ) 
% 
% node=F=lambda, expressed in meters
%
% reference point: 90nm ~  0.3fF for W=200nm L=80nm
%                  ==> 1.5nF/m ; 1.5fF / um
%
% note that ITRS gives an almost 3x smaller value, probably without overlap
% capacitances - even so, 10um^2*0.1*0.2=0.2fF
% with 10um^2 * 0.07 * 0.16=0.11fF
%
% Cox = 10fF/um^2 at 90nm, scales as 1/lambda  [ expressed in F / m^2 ]
%
% using traditional formulas:
%   CgPerMeter   * Cox * L * 1m ~ cte
%   CgPer2Lambda = Cox * W * L  ~ lambda 

    CgPerMeter90nm = 0.3e-15 / 200e-9;
    CgPerMeter = CgPerMeter90nm;
    
    CgPer2Lambda = CgPerMeter * (2 * nodeLambda);
    
    Cox90nm = 10e-15/(1e-6)^2;
    
    Cox = Cox90nm * 90e-9 / nodeLambda;

end

