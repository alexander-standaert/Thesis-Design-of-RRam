

basename='latches';

sp.stopTime=800e-12;
sp.voeding=1;
sp.value=0;



paramNames    = {};
paramRanges   = zeros(0,2);
%paramNames{end+1} = 'voeding';
%paramRanges(end+1, :) = [ 1 0.6];
paramNames{end+1} = 'SlatchInUp';
paramRanges(end+1, :) = [ 1 6 ];
paramNames{end+1} = 'SlatchHoldUp';
paramRanges(end+1, :) = [ 1 6 ];
paramNames{end+1} = 'SlatchHoldDown';
paramRanges(end+1, :) = [ 1 8 ];
paramNames{end+1} = 'SlatchInDown';
paramRanges(end+1, :) = [ 1 6 ];
paramNames{end+1} = 'SlatchBlock';
paramRanges(end+1, :) = [ 1 6 ];

f1Name = 'energy';
f1Sigmas=1;  % averages out, so we don't really care
f2Name = 'delay';
f2Sigmas=5;  

L = 10;  %beschouw op elk moment hoogstens L punten als centraal punt
iterations=3;
P = 50000; % points to sample randomly around each simulated sample
scale=0.3; %lambda = scale*range

numberOfMCs=10;

[ simulatedPoints, simulatedResults, previouslyGuessedResults,...
  pointsToEvaluate, guessedPerformance, lastSimulatedIndexInIteration ] = ...
   optimiseF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
                 paramNames, paramRanges, sp, ...
                 basename, numberOfMCs, ...
                 L , iterations, P, scale )

