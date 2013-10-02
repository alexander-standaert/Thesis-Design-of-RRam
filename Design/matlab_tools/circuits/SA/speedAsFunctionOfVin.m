function [ delay energy ] = speedAsFunctionOfVin( SA, Vin )
% function [ delay energy ] = speedAsFunctionOfVin( SA, Vin )
%
% This function calculates delay ( as measured in the analysis script
% mentioned in the SA structure ) and energy for the given values of Vin
% ( Vin is a vector )


for i=1:length(Vin)
    %SA.params = updateParameter( SA.params, 'Vprech' , Vprech   );
    SA.params = updateParameter( SA.params, 'Vswing' , Vin(i)  );    
    
    [ energy_i delay_i ] = analyseEDSinglePointSA( SA  )
    energy(i) = energy_i;
    delay(i) = delay_i;
end

figure(10);
plot( Vin*1000, delay*1e12, '-k.' );
hold on;
grid on;
xlabel( 'Vin [mV]'   );
ylabel( 'delay [ps]' );

figure(11);
semilogx( Vin*1000, delay*1e12, '-k.' );
hold on;
grid on;
xlabel( 'Vin [mV]'   );
ylabel( 'delay [ps]' );


figure(12);
plot( Vin*1000, energy*1e15, '-k.' );
hold on;
grid on;
xlabel( 'Vin [mV]'   );
ylabel( 'energy [fJ]' );

figure(13);
semilogx( Vin*1000, energy*1e15, '-k.' );
hold on;
grid on;
xlabel( 'Vin [mV]'   );
ylabel( 'energy [fJ]' );


end
