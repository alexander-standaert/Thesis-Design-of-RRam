function [f1c f2c f1mu f2mu f1std f2std] = ...
  simulateF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
                parameterNames, parameterValues, sp, ...
                basename,  suffix, numberOfMCs )
%function [f1c f2c f1mu f2mu f1std f2std] = ...
%  simulateF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
%                parameterNames, parameterValues, sp, ...
%                basename,  suffix, numberOfMCs )
%
% f1Name = name of first target function, e.g. 'energy'
% f2Name = name of second target function, e.g. 'delay'
%   These are the names that have to be used in the spectre export-block
% f1Sigmas:  use f1c = mu_f1+ f1Sigmas * std( f1 )
% f2Sigmas:  use f2c = mu_f2+ f2Sigmas * std( f2 )
% parameterNames  = cell vector with parameter names
% parameterValues = vector with the value for each of the parameters in 
%                   parameterNames
% sp = structure with all other parameters to pass on the the m2s-file
% basename = the basename of the m2s file - e.g. 'latches' for 'latches.m2s'
% suffix = an identifier string used to construct the working directory for
%          this run
% numberOfMCs: number of monte carlo simulations to perform (used to estimate
%              sigma)
%
%
% RESULTS
% f1c = f1mu + f1Sigmas * f1std
% f2c = f2mu + f2Sigmas * f2std
% f1mu
% f2mu
% f1std
% f2std

  sp.numruns=numberOfMCs;

  pathNow = pwd;

  %update sp       
  for k=1:length( parameterNames )                
    command = sprintf( 'sp.%s=%g;', parameterNames{k}, parameterValues(k) ); 
    eval(command);
  end


  map = sprintf( 'simulateED/run_%s_%s', basename, suffix );       
  runfile = sprintf( '%s_run.m', basename );
  m2s = sprintf('%s.m2s', basename );  
  
  mat2spice( m2s, map, sp);
  moveRunFile = sprintf('!mv %s %s', runfile, map );


  eval( moveRunFile );
  t1 = now;
  change = sprintf('cd %s', map );
  eval(change);
  command = sprintf('!spectre %s.sp >out', basename );
  eval(command);
  

  raw = sprintf( '%s.raw',basename);
  [measurementNames, values] =...
      readMonteCarloResults( raw, 'mymc' );
%  measurementNames
%  values
   save results.mat measurementNames values sp
   command = sprintf( '!rm -rf %s.raw', basename);
   eval(command);
   !rm out


   command = sprintf( 'cd %s', pathNow );
   eval(command);
   t2=now;
%   fprintf('simulation took approx %6.2f seconds\n', (t2-t1)*3600*24 );

f1I = find( strcmp(measurementNames, f1Name ) ); 
f2I = find( strcmp(measurementNames, f2Name ) );
if length(f1I)~=1
  fprintf( 1, 'ERROR: simulation %s should provide *%s* measurement\n',...
              basename, f1Name);
end
if length(f2I)~=1
  fprintf( 1, 'ERROR: simulation %s should provide *%s* measurement\n',...
              basename, f2Name);
end

f1 = values(:, f1I );
f2 = values(:, f2I );
% To avoid losing direction when only a few MC simulations result in NAN,
% we just punish the performance severely when such a thing occurs
IToKeep = find( isfinite( f1 ) );
f1 = f1( IToKeep );
f2 = f2( IToKeep );
IToKeep = find( isfinite( f2 ) );
f1 = f1( IToKeep );
f2 = f2( IToKeep );

removedSims = numberOfMCs - length(IToKeep);
if (removedSims>0)
  fprintf( 1, '**** WARNING: had to remove %d failing simulations from %d total MC sims\n', ...
              removedSims, numberOfMCs );
  fprintf( 1, '****          please provide better bounds or pray\n');
end

f1mu  = mean( f1 );
f2mu  = mean( f2 );
f1std = std( f1 );
f2std = std( f2 );

f1c = f1mu + f1Sigmas * f1std + removedSims*f1mu*2 ;
f2c = f2mu + f2Sigmas * f2std + removedSims*f2mu*2 ;
