
lambdas= (10:2:90)*1e-9;

styles = { '.r-', 'b-', 'm-', 'k-', 'r--', 'b--', 'm--', 'k--' };

%DVinV=[ 30 40 50 75 100 ]*1e-3
%DVinV=[ 10 20 30 ]*1e-3
DVinV=[ 30 30 30 ]*1e-3
for k=1:length( DVinV );
    DVin = DVinV(k);    

    for i=1:length(lambdas)
        lambda=lambdas(i);
        tech = getHighSpeedTechnologies( lambda );

        SA = getSAForTech( DVin, 6.1, 10, tech );
        energy(i) = SA.energy;
        SA
    end
    name = sprintf( '{\\Delta}Vin=%3dmV', round(DVin*1000) );
    makeLambdaPlot( lambdas, energy/1e-15, styles{k}, 'displayName', name, 'lineWidth', 2 );
    ylabel( 'energy/decision [fJ]' );
end
grid on;
legend show;
a=axis();
axis( [ a(1:3) 350 ] );