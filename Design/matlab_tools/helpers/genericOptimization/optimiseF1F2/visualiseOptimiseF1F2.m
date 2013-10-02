function [] = visualiseOptimiseF1F2( ...
   f1Name, f2Name, f1Sigmas, f2Sigmas, ...
   paramNames, paramRanges, sp, ...
   basename, numberOfMCs, ...
   simulatedPoints, simulatedResults, previouslyGuessedResults,...
   pointsToEvaluate, guessedPerformance, ...
   lastSimulatedIndexInIteration )


rs = [ 'k' 'r' 'b' 'g' 'c' ];


%figure(1);


% plot the simulated results (TODO: iteration per iteration)

simulatedF2 = simulatedResults( :, 2);
simulatedF1 = simulatedResults( :, 1);

iterations = length(lastSimulatedIndexInIteration);
pprevious=0;
for iteration = 1:iterations
  style = ['.' rs( 1+mod(iteration-1,length(rs)))];
  pnext=lastSimulatedIndexInIteration(iteration);
  sF1 = simulatedF1(pprevious+1:pnext);
  sF2 = simulatedF2(pprevious+1:pnext);
  plot( sF1, sF2, style );
  hold on;
  pprevious=pnext;
end

% plot the final estimated pareto points
guessedF2  = guessedPerformance( :, 2);
guessedF1 = guessedPerformance( :, 1);
plot( guessedF1, guessedF2, '.r--' );
hold on;

xlabel( [ f1Name ' []'] );
ylabel( [ f2Name ' []'] );


fprintf( 1, 'All %s values are mean+%2.2f*std\n', f1Name, f1Sigmas);
fprintf( 1, 'All %s values are mean+%2.2f*std\n', f2Name, f2Sigmas);
fprintf( 1, 'std and mean are based on %d simulations\n', numberOfMCs );

% plot the simulated pareto points
sPI = findParetoPoints( simulatedF1, simulatedF2, -1, -1 );
plot( simulatedF1(sPI), simulatedF2(sPI), 'go--' );
% print out the simulated pareto points
fprintf(1, '------ simulated pareto points ------\n');
fprintf(1, '-------------------------------------\n');
for k=1:length(sPI)
  I = sPI(k);
  fprintf(1, '%4d. %s=%7g[], %s=%7g[] [ ', k, ...
             f1Name, simulatedF1(I), f2Name, simulatedF2(I) );
  for i=1:length(paramNames)
    name = paramNames{i};
    fprintf( 1, '%s=%7g ', name, simulatedPoints(I,i) );
  end
  fprintf( 1, ']\n');
end

% print out the estimated pareto points
ePI = findParetoPoints( guessedF1, guessedF2, -1, -1 );
fprintf(1, '------ estimated pareto points ------\n');
fprintf(1, '-------------------------------------\n');
for k=1:length(ePI)
  I = ePI(k);
  fprintf(1, '%4d. %s=%7g[], %s=%7g[] [ ', k, ...
             f1Name, guessedF1(I), f2Name, guessedF2(I) );
  for i=1:length(paramNames)
    name = paramNames{i};
    fprintf( 1, '%s=%7g ', name, pointsToEvaluate(I,i) );
  end
  fprintf( 1, ']\n');

end



fprintf( 1, 'performed %d simulations in total\n', ...
             lastSimulatedIndexInIteration(end) );


% print out the simulated pareto points in an excell-readable form
fprintf(1, '------ simulated pareto points ------\n');
fprintf(1, '-------------------------------------\n');

fprintf(1, 'id %s %s ', f1Name,f2Name );
   
for i=1:length(paramNames)
    name = paramNames{i};
    fprintf( 1, '%s ', name );
end
fprintf(1, '\n' );

for k=1:length(sPI)
  I = sPI(k);
  fprintf(1, '%d %g %g ', k, ...
             simulatedF1(I), simulatedF2(I) );
  for i=1:length(paramNames)
    name = paramNames{i};
    fprintf( 1, '%g ', simulatedPoints(I,i) );
  end
  fprintf( 1, '\n');
end



% print out the estimated pareto points
ePI = findParetoPoints( guessedF1, guessedF2, -1, -1 );
fprintf(1, '------ estimated pareto points ------\n');
fprintf(1, '-------------------------------------\n');

fprintf(1, 'id\t%s\t%s\t', f1Name,f2Name );
for i=1:length(paramNames)
    name = paramNames{i};
    fprintf( 1, '%s\t', name );
end
fprintf(1, '\n' );

for k=1:length(ePI)
  I = ePI(k);
  fprintf(1, '%d\t%g\t%g\t', k, ...
             guessedF1(I), guessedF2(I) );
  for i=1:length(paramNames)
    name = paramNames{i};
    fprintf( 1, '%g\t', pointsToEvaluate(I,i) );
  end
  fprintf( 1, '\n');

end
