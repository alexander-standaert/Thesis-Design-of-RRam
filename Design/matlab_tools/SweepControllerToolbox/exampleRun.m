function [ sc results ] = exampleRun()

    fprintf( '\n\n-----------------\n  creating sweep controller and performing simulation loop\n' );
    tic;
    % ---- define and execute a parameter sweep
    sc = SweepController();
    sc = sc.setName( 'test controller' );
    sc = sc.addParameter( 'resistance', [ 1 2 3 5 10 100 ] );  % ohm
    sc = sc.addParameter( 'capacitance', (1:20)*1e-15 ); % F    
    sc = sc.addParameter( 'vdd', (0.5:0.05:1) ); % V
    
    %testResults = sc.loop( @myMetricsCalculator, 1:3 )        
    fprintf( 'number of combinations = %d\n', sc.getNumberOfCombinations() );
    results = sc.loop( @myMetricsCalculator );
    toc;
    
    fprintf( '\n\n-----------------\n  making first pareto plot\n' );
    tic;    
    % ---- determine pareto-optimal points    
    % to use default values, do not fill out the optional fields 
    ppOptions.fields        = { 'tau'                   , 'energy'      }; % X,Y that should be optimized
    ppOptions.desiredValues = [ -1                        -1            ]; %-1: smaller values are better
    ppOptions.fieldLabels   = { 'time constant tau [ps]', 'energy [fJ]' };
    ppOptions.multipliers   = [ 1e12                      1e15          ];         
    
    ppOptions.showNormalPoints = 1; % 0(show only pareto points) or 1 (show all points)
    ppOptions.styleNormalPoints = { 'r.', 'markerSize', 10 };  
    % either a cell array with parameters that are passed as varargin to the plotting function
    % either a function handle to a function that returns such a structure    
    ppOptions.styleParetoPoints = @myStyleFunction; % - can include a line style, points are ordered along X-values    
    ppOptions.constraints       = @myConstraints  ;
    
    ppOptions.makePlot  = 1; % -- put to 0 if you do not want the plot
    ppOptions.makeTable = 1; % -- put to 0 if you do not want the table
    
    figure(1);
    indices1 = paretoPlot( ppOptions, sc, results );
    toc;
    
    fprintf( '\n\n-----------------\n  making second pareto plot\n' );
    tic;    
    ppOptions.showNormalPoints=0;
    ppOptions = rmfield( ppOptions, 'constraints' );
    ppOptions.fields    = { @getTau , 'energy' }; % X,Y that should be optimized
    figure(2);
    subplot( 2,1,2 );
    indices2 = paretoPlot( ppOptions, sc, results );    
    
    toc;
    
end

function [result ] = myMetricsCalculator( combination )
    
    result.tau    = combination.resistance .* combination.capacitance;
    result.size   = 1./combination.resistance .* (1./(combination.vdd-0.4));
    result.energy = (combination.capacitance+ (result.size*5*1e-15) ) * combination.vdd.^2;

end

function [ meetsConstraints ] = myConstraints(  result, combination, results, controller )
    if combination.vdd >=0.6
        meetsConstraints=1;
    else 
        meetsConstraints=0;
    end
end

function [ tau ] = getTau( result, combination, results, controller )
    tau = result.tau ;
end

function [ style ] = myStyleFunction( result, combination, results, controller )
    vddColor = ( combination.vdd / 1 ) ;
    R = combination.resistance;
    s = 10+R^(1/2);
    style = { 'o', 'Color', [ 1 1 0 ], 'MarkerFaceColor', [ vddColor vddColor vddColor ], 'markerSize', s };
end