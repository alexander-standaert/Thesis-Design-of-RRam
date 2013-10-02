function [ result ] = processAndDisplaySweeps( result, minRange, maxRange, plotId, limit )  
%function [ result ] = processAndDisplaySweeps( result, minRange, maxRange, plotId, limit )  
%  
% plot sweep results on figure <plotId+ 1:3 >  and 
% calculate linear sensitivities for the Vt of each device
%
% sweep = result.sweeps{i}   %see sweepSA.m
%
% This method adds sweep.delayNS( j ), sweep.energyNS(j) , sweep.offsetNS(j) 
% (normalized sensitivity, delta delay/(sigma) )
% matching sweep.range(j)
%
% Also adds sweep.delayS( j ), energyS( j ) , offsetS(j)
% ( non-normalized sensitivities, delta delay/1V or delta delay/100% )
%
%  worst sensitivities are calculated over minRange:maxRange
%  based on these worst sensitivities, total sigma_delay etc. are
%  calculated (assuming independent normally distributed input parameters)
%  result.sigma_delay, result.sigma_energy, result.sigma_offset
%  These sigma-values should be overestimations ...

if nargin<5
   limit=inf;  % plot all curves 
end

  % unfiltered : plot everything
  
  worstDelayS = [];
  worstEnergyS = [];
  worstOffsetS = [];
  

  
  
  %% first run: only calculate sensitivities, don't plot
  for i=1:length( result.sweeps ) 
    sweep = result.sweeps{i};   
   
    [ result.sweeps{i}.delayNS worstDelayNS(i) ] = calculateSensitivities( sweep.range, sweep.delay, 0, i, 1e12, 'delay [ps]', minRange,maxRange );
    result.sweeps{i}.delayS  = result.sweeps{i}.delayNS / sweep.sigma ;
    
    
    [ result.sweeps{i}.energyNS worstEnergyNS(i) ] = calculateSensitivities( sweep.range, sweep.energy, 0, i, 1e15, 'energy [fJ]', minRange,maxRange );
    result.sweeps{i}.energyS  = result.sweeps{i}.energyNS / sweep.sigma ;

    fprintf( 'temporary hack, processAndDisplaySweeps.m: NaN delay ignored for calculation of offset' );
    %sweep.offset( find( isnan(sweep.delay) ) ) = NaN;
    
    
    [ result.sweeps{i}.offsetNS worstOffsetNS(i) ] = calculateSensitivities( sweep.range, sweep.offset, 0, i, 1e3, 'offset [mV]', minRange,maxRange );
    result.sweeps{i}.offsetS  = result.sweeps{i}.offsetNS / sweep.sigma ;
    

    
  end
  
  %% second run : plot limit most important values, ordered by importance
  %               for Voffset
  [ worstOffsetNS_sorted Iorder ] = sort( worstOffsetNS, 'descend' );
  worstOffsetNS
  [ Iorder' worstOffsetNS_sorted' ]
  if limit<length( Iorder )
     Iorder = Iorder(1:limit)
  end

  myLegend = {};
  for i=Iorder
    sweep = result.sweeps{i};   
    
    fprintf( 'temporary hack, processAndDisplaySweeps.m: NaN delay ignored for calculation of offset' );
    %sweep.offset( find( isnan(sweep.delay) ) ) = NaN;
   
    
    if( plotId )
        pId=[ plotId plotId+1 plotId+2 ];
    else
        pId=[ 0 0 0 ];
    end    
        
    calculateSensitivities( sweep.range, sweep.delay , pId(1), i, 1e12, 'delay [ps]' , minRange,maxRange );
    calculateSensitivities( sweep.range, sweep.energy, pId(2), i, 1e15, 'energy [fJ]', minRange,maxRange );    
    calculateSensitivities( sweep.range, sweep.offset, pId(3), i, 1e3 , 'offset [mV]', minRange,maxRange );
    
    myLegend{ end+1 } = sprintf( '%s.%s', result.sweeps{i}.device.name, result.sweeps{i}.param );    
  end

  if( plotId~=0 )
    figure( plotId+0 ); legend( myLegend );
    figure( plotId+1 ); legend( myLegend );
    figure( plotId+2 ); legend( myLegend );
  end
  
  %% total sigma (overestimation)
  worstOffsetNS
  
  result.sigma_offset = sqrt( sum( worstOffsetNS.^2 ) );
  result.sigma_delay  = sqrt( sum( worstDelayNS.^2 ) );
  result.sigma_energy = sqrt( sum( worstEnergyNS.^2 ) );
  
  %% write table in normal order 
  fid=1;
    
  fprintf( fid, 'sigma_offset\t=\t%s\n', eN( result.sigma_offset, eNT('V') ) );
  fprintf( fid, 'sigma_delay \t=\t%s\n', eN( result.sigma_delay , eNT('s') ) );
  fprintf( fid, 'sigma_energy\t=\t%s\n', eN( result.sigma_energy, eNT('J') ) );

%   fprintf( fid, '\n\n' );
% 
%   writeTable( fid, 'energy', 'J', result, worstEnergyNS, result.sigma_energy );
%   writeTable( fid, 'delay' , 's', result, worstDelayNS , result.sigma_delay  );
%   writeTable( fid, 'offset', 'V', result, worstOffsetNS, result.sigma_offset );

  fprintf( fid, '\n\n' );
  
  writeOrderedTable( fid, 'energy', 'J', result, worstEnergyNS, result.sigma_energy );
  writeOrderedTable( fid, 'delay' , 's', result, worstDelayNS , result.sigma_delay  );
  writeOrderedTable( fid, 'offset', 'V', result, worstOffsetNS, result.sigma_offset );

  
%   %% plot only params that are important for offset
%   
%   [ Offset Indices ] = sort( worstOffsetNS, 2, 'descend' )
%   
%   scale = 10;
%   
%   L = find( Offset > (Offset(1) / scale ), 1, 'last' );
%   myLegend = {};
%   
%   for i=Indices( 1:L ) 
%      
%     sweep = result.sweeps{i};   
%    
%     calculateSensitivities( sweep.range, sweep.delay, plotId+10, i, 'delay [s]', minRange,maxRange );        
%     calculateSensitivities( sweep.range, sweep.energy, plotId+11, i, 'energy [J]', minRange,maxRange );
%     calculateSensitivities( sweep.range, sweep.offset, plotId+12, i, 'offset [V]', minRange,maxRange );    
%     
%     myLegend{ end+1 } = sprintf( '%s.%s', result.sweeps{i}.device.name, result.sweeps{i}.param );
%     
%   end
%   figure( plotId+10 ); legend( myLegend );
%   figure( plotId+11 ); legend( myLegend );
%   figure( plotId+12 ); legend( myLegend );
      

end

function [ sensitivities worstNormalisedSensitivity ] = ...
    calculateSensitivities( range, values, plotId, i, plotYmultiplier, functionLabel, minRange,maxRange )
% we calculate sensitivities compared to sigma=0.  We assume sigma=0 is
% part of the range vector
% sensitivity is y / n sigma
%
% plotYmultiplier is only used for making the plot, and should match with
% 1 over the unit ( femto, pico, milli) provided in functionLabel

    range 
    values

    if plotId~=0
        figure( plotId );
        hold on;    
        [ style markersize ] = getStyle(i);
        plot( range, plotYmultiplier*values, style,'MarkerSize', markersize );
        grid on;
        
        xlabel( 'parameter [number of \sigma s]' );
        ylabel( functionLabel );

    end
        
    centerI = find( range==0 );
    if length( centerI ) ~= 1
       error( 'zero not part of range vector ...'); 
    end
    
    sensitivities = ( values - values(centerI) ) ./ ( range - range( centerI ) );    
    sensitivities( centerI ) = 0;
    
    Is = find( (range>=minRange) .* (range<=maxRange) );
        
    worstNormalisedSensitivity = max( abs( sensitivities(Is) ) );   
end





%   % 
%   
% 
%   voltTemplate = eNT( 'V' );
% 
%   fprintf( '\n\n------------------ starting %s \n', functionName );
% 
%   figure( plotNumber );
%   hold on;
% 
% 
%   worstSensitivity  = zeros( 1, length(devices) );
%   sensitivityVector = cell( 1, length(devices) );
% 
%   functionLabel = sprintf( '%s [ %s ]', functionName, unitTemplate.unitString );
%   
%   mylegend = {};
%   
%   for i = 1:length( devices );
%       [ worstS sensitivityV ] = postProcessSingleDevice( devices{i}, range, fs{i}, functionLabel, i );
%       worstSensitivity(i)  = worstS;
%       sensitivityVector{i} = sensitivityV;
%       
%       fprintf( 'device=%s , param=Vt [n-sigma], worstSensitivity = %s / sigmaVt \n', devices{i}.name, eN( worstS, unitTemplate ) );
% 
%       sigmaVt = getTransistorVtSigma( devices{i} );
%       worstSmV = (worstS/ (sigmaVt*1000) ); % 1000 to obtain unit/mV instead of unit/V
%       fprintf( 'device=%s , param=Vt [mV], worstSensitivity = %s / mV  ( sigmaVt=%s )\n', ...
%                 devices{i}.name, eN( worstSmV, unitTemplate ), ...
%                                  eN( sigmaVt , voltTemplate ) );
%       
%       mylegend{i} = devices{i}.name;
%       
%       
%   end
%   
%   legend( mylegend );
%   
% end
% 
% function [ worstSensitivity sensitivities ] = postProcessSingleDevice( device, range, functionValues, functionLabel, k )
% % we calculate sensitivities compared to sigma=0.  We assume sigma=0 is
% % part of the range vector
% % sensitivity is y / n sigma
% 
%     plot( range, functionValues', getStyle(k) );
% 
%     textLabel = sprintf( '%s', device.name ); 
%     text( range(end), functionValues(end), textLabel );
%     grid on;
%     
%     centerI = find( range==0 );
%     if length( centerI ) ~= 1
%        error( 'zero not part of range vector ...'); 
%     end
%     
%     sensitivities = ( functionValues - functionValues(centerI) )./ ( range - range( centerI ) );    
%     sensitivities( centerI ) = 0;
% 
% %    sensitivities;
% 
%     worstSensitivity = max( abs( sensitivities ) );
%     
%     
%     
% end


function [ style markersize ] = getStyle( k )

  k=k-1;  %k starts at 1, we want to start at index 0

  symbols = 'odh*v><^p+sx';
%  symbols = '.od';
  colors  = 'rbkm';
  lines   = { '-', '--' };
  
  i1 = mod( k, length(symbols) ) + 1;
  i2 = mod( k, length(colors ) ) + 1;
  %i3 = mod( k, length(lines  ) ) + 1;

  lsymb = length(symbols);
  i3 = mod( floor(k/lsymb), length(lines) ) +1;
  
  style = [ symbols(i1) colors(i2) lines{i3} ];
     

  markercycle = floor( k/(lsymb*length(lines)) );

  markersize = 9 * 1/(1+markercycle);
  
end


function [] = writeTable( fid, targetName, targetUnit, result, worstNormalisedSensitivities, targetSigma )
    fprintf( fid, 'table for %s ( sigma = %s )\n', targetName, eN( targetSigma, eNT( targetUnit) ) );
    for i=1:length( worstNormalisedSensitivities )
       device = result.sweeps{i}.device;
       deviceName = device.name ;
       param = result.sweeps{i}.param ;
       
       sigmaSource = eN( result.sweeps{i}.sigma, eNT( result.sweeps{i}.sigmaUnit )   );
       W = transistorGet( device, 'w' );
       L = transistorGet( device, 'l' );
       
       ns = worstNormalisedSensitivities( i );
       fprintf( fid, '%s \t %s \t NS= \t %s/sigma \t %2.2f%% \t ( W=%s, L=%s ; sigma=%s )\n', deviceName, param, ...
                eN( ns, eNT( targetUnit ) ), ...
                (ns / targetSigma)*100, ...
                eN( W, eNT('m')), eN( L, eNT('m')), sigmaSource );                 
    end
    fprintf( fid, '\n' );
    
%     for i=1:length( worstNormalisedSensitivities )
%        device = result.sweeps{i}.device.name ;
%        param = result.sweeps{i}.param ;
%        ns = worstNormalisedSensitivities( i );
%        fprintf( fid, '%s \t %s \t NS= \t %s \t %2.2f \t \n', device, param, ...
%                 eN( ns, eNT( targetUnit ) ), ...
%                 (ns / targetSigma) );                 
%     end
%     fprintf( fid, '\n' );
end

function [] = writeOrderedTable( fid, targetName, targetUnit, result, worstNormalisedSensitivities, targetSigma )

    [ values set ] = sort( worstNormalisedSensitivities, 2, 'descend' );

    fprintf( fid, 'ordered table for %s ( sigma = %s )\n', targetName, eN( targetSigma, eNT( targetUnit) ) );
    for i=set
       
       device = result.sweeps{i}.device;
       deviceName = device.name ;
       param = result.sweeps{i}.param ;
       
       sigmaSource = eN( result.sweeps{i}.sigma, eNT( result.sweeps{i}.sigmaUnit )   );
       W = transistorGet( device, 'w' );
       L = transistorGet( device, 'l' );
       
       ns = worstNormalisedSensitivities( i );
       fprintf( fid, '%s \t %s \t NS= \t %s/sigma \t %2.2f%% \t ( W=%s, L=%s ; sigma=%s )\n', deviceName, param, ...
                eN( ns, eNT( targetUnit ) ), ...
                (ns / targetSigma)*100, ...
                eN( W, eNT('m')), eN( L, eNT('m')), sigmaSource );                 
    end
    fprintf( fid, '\n' );
    
    
%     for i=set
%        device = result.sweeps{i}.device.name ;
%        param = result.sweeps{i}.param ;
%        ns = worstNormalisedSensitivities( i );
%        fprintf( fid, '%s \t %s \t NS= \t %s \t %2.2f \t \n', device, param, ...
%                 eN( ns, eNT( targetUnit ) ), ...
%                 (ns / targetSigma) );                 
%     end
%     fprintf( fid, '\n' );
    
end