s = size( previouslyGuessedResults ) 
rows = s(1);
for p = 1:rows
  F1Guessed = previouslyGuessedResults( p, 1 );  
  F2Guessed = previouslyGuessedResults( p, 2 );  
  F1Simulated = simulatedResults(p, 1);
  F2Simulated = simulatedResults(p, 2);

  if( F1Guessed ~=0 )
    fprintf(1, '%4d. F1Guessed=%g ; F1Simulated=%g [%4.1f%%]; ; ; F2Guessed=%g ; F2Simulated=%g [%4.1f%%]\n', ...
               p, F1Guessed, F1Simulated, F1Guessed/F1Simulated*100, ...
                  F2Guessed, F2Simulated, F2Guessed/F2Simulated*100 );
  end
end
