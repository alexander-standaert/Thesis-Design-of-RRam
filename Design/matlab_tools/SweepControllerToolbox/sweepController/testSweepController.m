function [ sc results ] = testSweepController()
    sc = SweepController();
    sc = sc.setName( 'test controller' );
    sc = sc.addParameter( 'resistance', [ 1 2 3 ] );
    sc = sc.addParameter( 'capacitance', 1e-15 );
    sc = sc.addParameter( 'color', {'red', 'green', 'blue' } );
    m1.a=5; m1.b='m1'; m2.a=7; m2.b='m2-b';
    sc = sc.addParameter( 'control', { m1, m2 } );

    sc

    for i=1:sc.getNumberOfCombinations
        fprintf( 'i=%d\n', i );
        sc.getCombinationIndices( i );
        combination = sc.getCombination( i )        
    end
    
    results = sc.loop( @myMetricsCalculator );
    sc.loop( @myMetricsCalculator, [ 1 4 ] );

end

function [result ] = myMetricsCalculator( combination )
    fprintf( 'myMetricsCalculator called:\n' );
    combination
    
    result.R = combination.resistance;
    result.C = combination.capacitance;
    result.color = combination.color;
    result.control.a = combination.control.a;
    result.control.b = combination.control.b;
    result.control.x = 3;
end