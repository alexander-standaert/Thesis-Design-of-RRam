function [ result ] = sweepSA( SA, calculateOffset, range, only )
%function [ result ] = sweepSA( SA, calculateOffset, [range], [only] )
%
%  sweeps 
%
%  result.nominal.energy
%    nominal.energy
%    nominal.delay
%    nominal.offset
%
%
%  result.sweeps
%
%    sweep = sweeps{i}
%      sweep.range      %( steps used in sweep [ expressed in number of
%                          sigmas of parameter ] )
%
%    sweep.sigma         % e.g. 0.009
%    sweep.sigmaUnit     % e.g. 'V' or '*100%'
%    sweep.device        % device 
%    sweep.param         % 'Vt' or 'Beta'
%
%    sweep.delay(j)
%    sweep.energy(j)
%    sweep.offset(j)
%
%    delay(j), energy(j), offset(j) match range(j) 
%
%
%  sensitivities added in post-processing step 
%
%    sweep.delayB  :  max sensitivity coefficient when using normalised input
%                     parameters  ( delta delay / (1 sigma Vt) )
%    sweep.energyB : 
%    sweep.offsetB :
%
%    sweep.delayS  :  max sensitivity coefficients for this parameter:
%                     parameters  ( e.g. delta delay / ( 1V ) )
%    sweep.energyS : 
%    sweep.offsetS :



[ energy delay ] = analyseEDSinglePointSA( SA  )


[ offset ] = analyseOffsetSinglePointSA( SA )

result.nominal.energy = energy;
result.nominal.delay  = delay;
result.nominal.offset = offset;

if nargin<3
    range = -10:2:10;
end
if nargin<4
    only = {}; %do them all
end
    
result.sweeps = {};


for i= 1:length( SA.devices ) 
    
    
    device = SA.devices{i};
    
    sweep.range = range;
    sweep.sigma = getTransistorBB0Sigma( device );
    sweep.sigmaUnit = '100%';
    sweep.device = device;
    sweep.param = 'Beta';

    sweep.delay  = range*0;
    sweep.energy = range*0;
    sweep.offset = range*0;
        
    fprintf( ' -------------- sweep for device %s ; sigmaBeta = %3.3f%%\n', device.name, sweep.sigma*100 );
    
    for k=1:length(range)
        n=range(k);
        SA.devices{i} = transistorSet( SA.devices{i}, 'shiftBeta', n*sweep.sigma );
        
        if length(only)==0 || isInList( device.name, only )
            [ energy delay ] = analyseEDSinglePointSA( SA );
        else
            energy=0;
            delay =0;
        end
     
        if calculateOffset 
            if length(only)>0
              if isInList( device.name, only )
                  [ offset ] = analyseOffsetSinglePointSA( SA );
              else
                  % do nothing
                  offset = 0;
              end              
            else
              [ offset ] = analyseOffsetSinglePointSA( SA );
            end
        else
            offset=0;
        end
        sweep.delay(k)  = delay ;
        sweep.energy(k) = energy;
        sweep.offset(k) = offset;
    end
    
    result.sweeps{ end+1 }  = sweep;

    SA.devices{i} = transistorSet( SA.devices{i}, 'shiftBeta', 0 );
    
end


for i= 1:length( SA.devices ) 
    
    device = SA.devices{i};
    
    sweep.range = range;
    sweep.sigma = getTransistorVtSigma( device );
    sweep.sigmaUnit = 'V';
    sweep.device    = device;
    sweep.param     = 'Vt';
    
    sweep.delay  = range*0;
    sweep.energy = range*0;
    sweep.offset = range*0;
        
    fprintf( ' -------------- sweep for device %s ; sigmaVt = %3.3fmV\n', device.name, sweep.sigma*1000 );
    
    for k=1:length(range)
        n=range(k);
        
               
            SA.devices{i} = transistorSet( SA.devices{i}, 'shiftVt', n*sweep.sigma );
        
        if length(only)==0 || isInList( device.name, only )
            [ energy delay ] = analyseEDSinglePointSA( SA );
        else
            energy=0;
            delay =0;
        end
        
        if calculateOffset 
            if length(only)>0
              if isInList( device.name, only )
                  [ offset ] = analyseOffsetSinglePointSA( SA );
              else
                  % do nothing
                  offset = 0;
              end              
            else
              [ offset ] = analyseOffsetSinglePointSA( SA );
            end
        else
            offset=0;
        end

        sweep.delay(k)  = delay ;
        sweep.energy(k) = energy;
        sweep.offset(k) = offset;
        
    end
    
    result.sweeps{ end+1 }  = sweep;
    SA.devices{i} = transistorSet( SA.devices{i}, 'shiftVt', 0 );    
end

save( SA.result, 'result', 'SA' );

end

function [ inList ] = isInList( name, list )

  for i=1:length(list)
     if( length( regexp( name, list{i} ) ) ) 
         inList=1;
         return
     end
  end
  inList=0;
end