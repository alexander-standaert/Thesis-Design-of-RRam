function [ chain ] = getChainForR( Rdesired, tech )
% function [ chain ] = getChainForR( Rdesired, tech )
%
% estimate the properties for a buffer chain in which the last stage needs
% an Rout of Rdesired

    chain.Rmin = tech.NMOS_RonPer2Lambda;
    
    chain.ratio = chain.Rmin / Rdesired;
    
    chain.stages = round( log( chain.ratio ) / log(4) ); % first one does not count, last one with Rdesired does
    chain.a      = chain.ratio^(1/chain.stages);
    
    sum=1;
    for i=1:chain.stages
        sum=sum+chain.a^i;
    end
         
    chain.CgateTotal  = 3* tech.CgPer2Lambda     * sum ; % times 3 for inverter
    chain.CdrainTotal = 3* tech.CdrainPer2Lambda * sum ; % times 3 for inverter
    
    chain.Ctotal = chain.CgateTotal + chain.CdrainTotal;

    chain.delay = tech.FO4Delay * chain.stages;
    
    chain.energyPerUpDownCycle = chain.Ctotal * (tech.Vdd)^2;
    % actually, should substract the drain of the last one for transmission line interconnect...
                   

end