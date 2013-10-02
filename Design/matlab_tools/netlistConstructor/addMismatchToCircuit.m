function [ circuitX weight nX deltaX fx gx] = addMismatchToCircuit( circuit, sigmaMult, randomStream ) 
% function [ circuitX  weight nX deltaX fx gx ] = addMismatchToCircuit( circuit [,  sigmaMult [, randomStream ]] ) 
%
%  add mismatch to all paramameters (beta, Vt) of all transistors in the
%  <circuit>.  Deviations for each parameter are picked randomly from a 
%  deformed distribution, more specifically from their mismatch
%  distribution with wider sigma (realSigma multiplied with <sigmaMult>)
%
%  Today, only transistor mismatch is applied, but this method should be
%  extended to also apply mismatch to other components (such as capacitors
%  and resistors )
%
%  random samples are created with the provided <randomStream> in a
%  deterministic order (for a fixed <circuit>), which allows you to
%  replay pseudo-random scenarios.
%  if no <randomStream> is provided, the default stream is used
%   
%  With <sigmaMult>=1, the default value, this method can be used for
%  traditional monte carlo simumations.
%  In this case, fx=gx and can be ignored
%
%  With <sigmaMult> larger than 1, this method can be used for importance
%  sampling monte carlo (see e.g. 
%  T. Doorn, E. ter Maten, J. Croon, A. Di Bucchianico, and O. Wittich, 
%  “Importance sampling Monte Carlo simulations for accurate estimation 
%   of SRAM yield,” ESSCIRC 2008 )
%
%  <fx> = [ fx_P1 fx_P2 ... fx_Pk ]
%  <gx> = [ gx_P1 gx_P2 ... gx_Pk ]
%  <nx> = [ nx_P1 nx_P2 ... nx_Pk ]
%  <deltaX> = nx .* sigma_Params
%  With fx_P1 the probability density of parameter k in the selected point in the original distribution
%  and gx_P1 the probability density of the parameter in the distorted
%  input distribution
%
%  importance sampling MC assigns a weight to the sample, which is
%  <weight> = prod( fx./gx )
%
%  notice that with 12 parameters and sigma_mult=2,
%  a point at the origin gets a huge weight of
%  2.^12 ; such large weights result in large steps in the CDF yValues 
%  close to the nominal value.  This is not necessarilly a problem,
%  but it is probably best to avoid using large number of parameters with 
%  large values of sigma_mult
%  
%  You can use printMismatchValues( circuitX ) to inspect the aplied
%  changes

    if nargin==1
       sigmaMult=1; 
    end
    if nargin<3
       randomStream = RandStream.getDefaultStream();
    end

    fx=[];
    gx=[];
    deltaX=[];
    nX=[];
    
    circuitX = circuit;

    for i= 1:length( circuitX.devices ) 
        device = circuitX.devices{i};        
        if ~isTransistor( device )
            continue;            
        end
        
        %% beta
        sigma = getTransistorBB0Sigma( device );
        
        deltaBetaBeta0=randomStream.randn( 1, 1) * sigma * sigmaMult;
        %normrnd( 0, sigma*sigmaMult );
                
        fx(end+1) = normpdf( deltaBetaBeta0, 0, sigma           );        
        gx(end+1) = normpdf( deltaBetaBeta0, 0, sigma*sigmaMult );
        deltaX(end+1) = deltaBetaBeta0;
        nX(end+1) = deltaBetaBeta0 / sigma ;
        
        circuitX.devices{i} = transistorSet( circuitX.devices{i}, 'shiftBeta', deltaBetaBeta0 );
        
        %% Vt
        sigma = getTransistorVtSigma( device );

        deltaVt=randomStream.randn( 1,1 )*sigma*sigmaMult; 
        %normrnd( 0, sigma*sigmaMult );
        
        fx(end+1) = normpdf( deltaVt, 0, sigma           );        
        gx(end+1) = normpdf( deltaVt, 0, sigma*sigmaMult );
        deltaX(end+1) = deltaVt;
        nX(end+1) = deltaVt / sigma;
        
        circuitX.devices{i} = transistorSet( circuitX.devices{i}, 'shiftVt', deltaVt );
        
    end
    
    %printMismatchValues( circuitX );
    weight = getWeight( fx, gx );
    
%     weight 
%     nX 
%     deltaX 
%     fx 
%     gx
    
end


function [ weight ] = getWeight( fx, gx )
    weight = prod( fx./gx );        
end
