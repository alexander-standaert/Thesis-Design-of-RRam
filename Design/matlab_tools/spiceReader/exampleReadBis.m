% spice_get_wavesMatlab
% marginally tested only

% to be able to use this reader, add 
% .OPTIONS POST=ASCII
% to your hspice netlist

sim = spice_get_wavesMatlab('RC.tr0');

sim

n1 = getSignal( sim, 'n1' );
n2 = getSignal( sim, 'n2' );
n3 = getSignal( sim, 'n3' );
n4 = getSignal( sim, 'n4' );


plot( n1.xValues, n1.yValues, 'r-' );
hold on; grid on;
plot( n2.xValues, n2.yValues, 'b-' );
plot( n3.xValues, n3.yValues, 'k-' );
plot( n4.xValues, n4.yValues, 'r--', 'lineWidth', 2 );
