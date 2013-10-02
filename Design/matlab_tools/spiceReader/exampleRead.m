% type 
% >> spice_get_waves
% >> spice_list_waves
% inside matlab for help (do not use "help spice_get_waves")

% readers have been tested on linux x86 only

% to be able to use these readers, add 
% .OPTIONS POST=ASCII
% to your hspice netlist

[ names ] = spice_list_waves('RC.tr0');
names



[data names ] = spice_get_waves('RC.tr0');
data
names

time = data.TIME{1};

plot( time, data.n1{1}, 'r-' );
hold on; grid on;
plot( time, data.n2{1}, 'b-' );
plot( time, data.n3{1}, 'k-' );
plot( time, data.n4{1}, 'r--', 'lineWidth', 2 );
