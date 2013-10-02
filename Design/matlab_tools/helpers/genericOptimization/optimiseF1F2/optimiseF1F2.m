function [ simulatedPoints, simulatedResults, previouslyGuessedResults,...
           pointsToEvaluate, guessedPerformance, ...
           lastSimulatedIndexInIteration ] = ...
   optimiseF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
                 parameterNames, parameterRanges, sp, ...
                 basename, numberOfMCs, ...
                 L , iterations, P, scale, Xcs )
% Find pareto-curve for f1 and f2 in the provided searchspace using
% the provided spectre-m2s file
%
% f1Name = name of first target function, e.g. 'energy'
% f2Name = name of second target function, e.g. 'delay'
%   These are the names that have to be used in the spectre export-block
% f1Sigmas:  use f1c = mu_f1+ f1Sigmas * std( f1 )
% f2Sigmas:  use f2c = mu_f2+ f2Sigmas * std( f2 )
% parameterNames  = cell vector with parameter names
% parameterRanges = matrix with one row per parameterName
%                   each row contains two elements: [ min max ] 
% sp = structure with all other parameters to pass on the the m2s-file
% basename = the basename of the m2s file - e.g. 'latches' for 'latches.m2s'
% numberOfMCs: number of simulations on which to base mu and std values
%
% algorithm tweak parameters
% L = number of points to keep when going to the next iteration
%     a as-good-as-possible spread in search-space is made
%     (for now, you should only optimise similar type of parameters
%      because this spread function could be pretty much wrong for
%      other situations - might want to use the distance in F1-F2 
%      space instead)
%     typical value: ~ 5 ... 15
% iterations  = number of iterations to perform 
%               2(base on estimates) or 3(base on simulated points)
%               should suffice when scale = 0.3
% P = number of points to sample in the approximated neighbourhood
%     of each center-point.  50000 worked fine for 6 parameters
% scale = a parabolic approximation is constructed around Xc,
%         using points at Xc-scale*lambda_i and Xc+scale*lambda_i
%         Here lambda is the max-range vector - the min-range vector
%         and lambda_i=lambda*0; lambda_i( i ) = lambda(i) 
%    CHANGED INTERPRETATION OF SCALE:
%         now we look between Xm=Xc-Xci+Xci/(1+scale) and XM=Xc-Xci+Xci*(1+scale)
%
% Xcs:  a matrix of start points.  One point (parametervalues per row)
%       this parameter is optional.  If not provided, the middle point of the 
%       range is used as startpoint.
%
% RESULTS:
% simulatedPoints: each row contains the parameterValues of a simulated point
% simulatedResults: each row contains the associated outcome 
%                   [ f1c, f2c, muf1,muf2,stdf1,stdf2 ]
% previouslyGuessedResults: each row contains the guess that was made in
%                           the previous iteration for this point that was
%                           simulated afterwards. [f1c f2c]
% pointsToEvaluate: each row contains a point (parameterValues)that would be 
%                   evaluated in the next iteration
% guessedPerformance: each row contains the estimated performance of the 
%                     associated row in pointsToEvaluate
%
% lastSimulatedIndexInIteration = for each iteration, the last index in
%                                 simulatedPoints that belongs to this iteration
%
%  this function saves some information in mat-files in the current
%  directory, so watch out with mat-files already standing there ...

% Idee: set centrale punten in de rijen van X, met maximale lengte L 


%L = 15;  %beschouw op elk moment hoogstens L punten als centraal punt
%iterations=4;
%P = 50000; % points to sample randomly around each simulated sample
%scale=0.3; %lambda = scale*range
%
%basename='latches';
%
%sp.stopTime=800e-12;
%sp.voeding=1;
%sp.value=0;
%
%
%
%paramNames    = {};
%paramRanges   = zeros(0,2);
    
%paramNames{end+1} = 'voeding';
%paramRanges(end+1, :) = [ 1 0.6];
%paramNames{end+1} = 'SlatchInUp';
%paramRanges(end+1, :) = [ 1 6 ];
%paramNames{end+1} = 'SlatchHoldUp';
%paramRanges(end+1, :) = [ 1 6 ];
%paramNames{end+1} = 'SlatchHoldDown';
%paramRanges(end+1, :) = [ 1 8 ];
%paramNames{end+1} = 'SlatchInDown';
%paramRanges(end+1, :) = [ 1 6 ];
%paramNames{end+1} = 'SlatchBlock';
%paramRanges(end+1, :) = [ 1 6 ];

useParallel = 0;  %1 or 0

Xmin = parameterRanges(:,1)';
Xmax = parameterRanges(:,2)';

switch nargin
    case 13
      X1 = (parameterRanges(:,2)+parameterRanges(:,1))'/2;
    case 14
      X1 = Xcs;
end

lambda = (parameterRanges(:,2)-parameterRanges(:,1))'*scale;

s = size(parameterRanges);
numberOfParameters = s(1);
numberOfDimensions= length( lambda )

simulatedPoints  = zeros( 0, numberOfDimensions ); 
simulatedResults = zeros( 0, 6 ); %[f1c f2c f1_mu f2_mu f1_std f2_std]
previouslyGuessedResults = zeros( 0, 2 ); %[f1c f2c]

pointsToEvaluate   = zeros( 0, numberOfDimensions );
guessedPerformance = zeros( 0, 2 );

nps = size( X1 );
np = nps(1);

pointsToEvaluate(end+1:end+np,:) = X1; 
guessedPerformance(end+1:end+np,:) = [ 0 0 ];

lastSimulatedIndexInIteration = [ ];

for it = 1:iterations
  fprintf(1, '---------------- starting iteration %d --------\n', it);
  fprintf(1, '-----------------------------------------------\n');
  s=size(pointsToEvaluate);
  numberOfCenterPoints = s(1);

  points   = zeros( 0, numberOfDimensions );
  f1f2_est = zeros( 0, 2 ); 
  
  for xi=1:numberOfCenterPoints
    Xc  = pointsToEvaluate(xi,:);
    ESTc = guessedPerformance(xi,:);
    fprintf(1, '============== iteration %d / %d; centerpoint %d / %d\n', ...
               it, iterations, xi, numberOfCenterPoints );
    fprintf(1, '->evaluating (');
    for i=1:numberOfDimensions
      fprintf( 1, '%s=%d; ', parameterNames{i}, Xc(i) );  
    end
    fprintf(1, ')\n' );
    
    suffix = sprintf( '_%d_%d_c', it, xi);
    [f1c f2c f1mu f2mu f1std f2std ] = ...
       simulateF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
                   parameterNames, Xc, sp, ...
                   basename, suffix, numberOfMCs );

    simulatedPoints(end+1,:) = Xc;
    simulatedResults(end+1, :) = [ f1c f2c f1mu f2mu f1std f2std ];
    previouslyGuessedResults(end+1, :) = ESTc;

    fprintf(1, '  estimated f1=%g, simulated f1=%g\n', ESTc(1), f1c );
    fprintf(1, '  estimated f2=%g, simulated f2=%g\n', ESTc(2), f2c );


    coefficientsF1_A = zeros( 1, numberOfDimensions );
    coefficientsF1_B = zeros( 1, numberOfDimensions );
    coefficientsF1_C = 0;
    
    coefficientsF2_A = zeros( 1, numberOfDimensions );
    coefficientsF2_B = zeros( 1, numberOfDimensions );
    coefficientsF2_C = 0;

    for dimensioni = 1:numberOfDimensions
      fprintf(1, '  --- simulating for dimension %s\n', ...
                 parameterNames{dimensioni} );
      lambdai = lambda*0;
      lambdai( dimensioni ) = lambda( dimensioni );
      Xci = Xc*0;
      Xci( dimensioni ) = Xc( dimensioni ); 
%         now we look between Xm=Xc-Xci+Xci/(1+scale) and XM=Xc-Xci+Xci*(1+scale)
          

      Xm = Xc-Xci+Xci/(1+scale);
      %Xm = Xc-lambdai;
      if Xm(dimensioni) < parameterRanges(dimensioni, 1)
        Xm(dimensioni) = parameterRanges(dimensioni, 1);
      end 
      %XM = Xc+lambdai;
      XM = Xc - Xci + Xci*(1+scale);
      if XM(dimensioni) > parameterRanges(dimensioni, 2)
        XM(dimensioni) = parameterRanges(dimensioni, 2);
      end 

      suffix = sprintf( '_%d_%d_%d_m', it, xi, dimensioni );
      [f1m f2m f1mum f2mum f1stdm f2stdm ] = ...
         simulateF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
                     parameterNames, Xm, sp, ...
                     basename, suffix, numberOfMCs );
      
      suffix = sprintf( '_%d_%d_%d_M', it, xi, dimensioni );
      [f1M f2M f1muM f2muM f1stdM f2stdM ] = ...
         simulateF1F2( f1Name, f2Name, f1Sigmas, f2Sigmas, ...
                     parameterNames, XM, sp, ...
                     basename, suffix, numberOfMCs );
  
      fprintf(1, 'f1c=%g, f1m=%g, f1M=%g\n', f1c, f1m, f1M);
      fprintf(1, 'f2c=%g, f2m=%g, f2M=%g\n', f2c, f2m, f2M);

      di=dimensioni;
      X1=Xm(di)-Xc(di);
      X2=0;
      X3=XM(di)-Xc(di);

      [ A B C ] = ParaboolDoorPunten( X1,X2,X3, f1m, f1c, f1M );
      coefficientsF1_A( dimensioni ) = A;   
      coefficientsF1_B( dimensioni ) = B;  
      coefficientsF1_C = C;   

      [ A B C ] = ParaboolDoorPunten( X1,X2,X3, f2m, f2c, f2M ); 
      coefficientsF2_A( dimensioni ) = A;   
      coefficientsF2_B( dimensioni ) = B;   
      coefficientsF2_C = C;   
      
      simulatedPoints(end+1,:) = Xm;
      simulatedResults(end+1, :) = [f1m f2m f1mum f2mum f1stdm f2stdm ];
      previouslyGuessedResults(end+1, :) = [0 0];
      
      simulatedPoints(end+1,:) = XM;
      simulatedResults(end+1, :) = [f1M f2M f1muM f2muM f1stdM f2stdM ];
      previouslyGuessedResults(end+1, :) = [0 0];
    end
   
    %
    %
    %
    fprintf(1, '  +++ sampling points with estimations\n' ); 
    points_local   = zeros( P, numberOfDimensions );
    f1f2_est_local = zeros( P, 2 ); 
    for k=1:P
      point = (1-2*rand( 1, numberOfDimensions)) .* lambda + Xc; % random point in region lambda around Xc
      point = min( point, Xmax-scale*lambda/10 );
      point = max( point, Xmin+scale*lambda/10 );

      diffPoint=point-Xc;
      f1_estimate = coefficientsF1_A * (diffPoint').^2 + ...
                    coefficientsF1_B * (diffPoint') + ...
                    coefficientsF1_C;
      f2_estimate = coefficientsF2_A * (diffPoint').^2 + ...
                    coefficientsF2_B * (diffPoint') + ...
                    coefficientsF2_C;
      

      points_local(k,:)=point;
      f1f2_est_local(k,:) = [ f1_estimate f2_estimate ];  

    end
    
    %now, find the pareto-points in this set
    PI = findParetoPoints( f1f2_est_local(:,1), f1f2_est_local(:,2), -1, -1 );
    count = length(PI);
    points( (end+1):(end+count), :) = points_local( PI, : ); 
    f1f2_est( (end+1):(end+count), :) = f1f2_est_local( PI, : ); 
    
    %fclose('all');  -- problem should be solved
  end % Xc

  
  F1 = f1f2_est( :, 1);
  F2 = f1f2_est( :, 2);
 
  PI = findParetoPoints( F1, F2, -1, -1 );


  figure( it );
  plot( F1, F2, '.b' );
  hold on;
  plot( F1(PI), F2(PI), '.k' );

  contenders = points( PI,: );
  contendersEstimates = f1f2_est( PI, : );

  s=size(contenders);
  NOC = s(1);


  if NOC>L 
    fprintf( 1, 'Limiting the number of pareto points ... (%d found, %d allowed)\n', ...
                NOC, L );
 
    numberToRemove=NOC-L;
%    removed = zeros( 1, numberToRemove );

    % do filtering in F1-F2 space
    f1_x = contendersEstimates( :, 1 );    
    f2_x = contendersEstimates( :, 2 ); 
  
    [ f1_xs If1 ] = sort( f1_x );
    f2_xs = f2_x( If1 );
    
    contendersEstimates = contendersEstimates( If1, : );
    contenders          = contenders( If1, : );
    
    keepIndex = ones( 1, NOC );  %0 of this index must be removed

    %distance function has to be weighted between f1, f2
    %%f1_min = f1_xs(1) 
    %%f2_min = f2_xs(end) 
    distance = ( (f1_xs(2:end)-f1_xs(1:end-1))./f1_xs(1:end-1) ).^2 + ...
               ( (f2_xs(2:end)-f2_xs(1:end-1))./f2_xs(2:end)   ).^2;
   
    distance 
    for removeId=1:numberToRemove
      [mindist minIndex] = min( distance );
      if( minIndex==1 )
        minIndex=2;
      end
%      removed(removeId) = minIndex;
      keepIndex( minIndex ) = 0;
      distance( minIndex )=inf;
      
%      firstPointBeforeI= find( keepIndex(1:minIndex), 1, 'last' );
%      firstPointAfterI = minIndex+find(keepIndex(minIndex+1:end), 1, 'first' );
%      fPBI = firstPointBeforeI;
%      fPAI = firstPointAfterI;
      fPBI = minIndex-1;
      fPAI = minIndex+1;
      distance( minIndex-1 ) = ...
          ( (f1_xs(fPAI)-f1_xs(fPBI))/f1_xs( fPBI ) ).^2 + ...
          ( (f2_xs(fPAI)-f2_xs(fPBI))/f2_xs( fPAI ) ).^2;

      IToKeep = find( keepIndex );
      keepIndex = keepIndex( IToKeep );
      contenders = contenders( IToKeep, : );
      contendersEstimates = contendersEstimates( IToKeep, : );
      f1_xs = f1_xs( IToKeep );      
      f2_xs = f2_xs( IToKeep );      

      IToKeepDist = find( isfinite(distance) );
      distance = distance( IToKeepDist );
      
      fprintf( 1, 'mindist=%g, minIndex=%d, count=%d\n', ...
                  mindist, minIndex,sum(keepIndex) );
    end

    %distance 

    %IToKeep = find( keepIndex )
%    contenders = contenders( IToKeep,: );
%    contendersEstimates = contendersEstimates( IToKeep, : );

%    for removeId=1:numberToRemove
%      smallestDistance = zeros(1,NOC)+inf;
%      for j=1:NOC
%        thisPoint = contenders( j, : );
%        for k=(j+1):NOC
%          otherPoint = contenders( k, : );
%          distance = sum((thisPoint-otherPoint).^2); %squared distance
%          if( distance<smallestDistance(j) )
%            smallestDistance(j)=distance;
%          end
%        end
%      end
%      %TODO: implement more efficiently
%      [sorted, Iordered] = sort( smallestDistance );
%      IToKeep = Iordered( 2:end ); 
%      contenders = contenders( IToKeep,: );
%      contendersEstimates = contendersEstimates( IToKeep, : );
%      NOC=NOC-1;
%    end    

  end
  
  plot( contendersEstimates(:,1), contendersEstimates(:,2), 'or--' );
  
  pointsToEvaluate = contenders;
  guessedPerformance = contendersEstimates;


%  lambda=lambda/2;

  s = size( simulatedPoints );
  lastSimulatedIndexInIteration( it ) = s(1); 

  command = [ 'save results_iteration' num2str(it) ];
  eval(command);


%  scale=scale*0.75  ;
%% not originally here

end %iteration

save results_optimise_F1F2.mat

%output results
