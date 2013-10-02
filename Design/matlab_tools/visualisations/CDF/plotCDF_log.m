function [ mu sigma m M ] = plotCDF_log( name, vector, plotId, style )
% function [ mu sigma m M ] = plotCDF_log( name, vector, plotId, style )

switch nargin
    case 4

    case 3
      style = '.';
end

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
  semilogy( sort( vector ), 1-percentile, style );
  hold on;
  semilogy( test, 1-normcdf( test, mu, sigma), 'r' );
  legend('data set', 'fitted normal distribution');
  ylabel( '1-cdf' );
  xlabel( name );
  title( name );
end

fprintf( 1, '%s: mu=%e sigma=%e m=%e M=%e\n', name, mu, sigma, m, M );

end