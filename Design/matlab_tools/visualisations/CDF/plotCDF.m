function plotCDF( name, vector, plotId )
%function plotCDF( name, vector, plotId )

L = length( vector );
percentile = 1:2:L*2-1;
percentile = percentile / (2*L) ;

mu = sum( vector ) / L;


sigma = sqrt( 1/(L-1) * sum( (vector-mu ).^2 ) );
m = min( vector );
M = max( vector );
test = m:(M-m)/1000:M;

if plotId>0
  figure( plotId );
  plot( sort( vector ), percentile, '.' );
  hold on;
  plot( test, normcdf( test, mu, sigma), 'r' );
  legend('data set', 'fitted normal distribution');
  ylabel( 'cdf' );
  xlabel( name );
  title( name );
  grid on;
end

fprintf( 1, '%s: mu=%e sigma=%e m=%e M=%e\n', name, mu, sigma, m, M );
