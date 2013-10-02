function plotCDF_r( name, vector, plotIt )

L = length( vector );
mu = sum( vector ) / L;

v2 = vector / mu;

plotCDF( name, v2, plotIt );
