
lambdas=[ 90 65 45 32 22 16 12 10 8 ]*1e-9;
Z0 = 95;
%RV= Z0 * [ 0.5 1 2.5 5 10 ];
RV= Z0 * [ 1 2.5 5 10 ];

styles = { '.r-', 'b-', 'm-', 'k-', 'r--', 'b--', 'm--', 'k--' };

for k=1:length(RV);
    R=RV(k);
    
    energyPerUpDownCycle = lambdas*0;
    Rmin = lambdas*0;
    ratio = lambdas*0;
    
    for i=1:length( lambdas )
        lambda = lambdas(i);        
        tech = getHighSpeedTechnologies( lambda );
        chain = getChainForR( R, tech );
        energyPerUpDownCycle(i) = chain.energyPerUpDownCycle;
        Rmin(i) = chain.Rmin;
        ratio(i) = chain.ratio;
    end
    figure(1);
    name=sprintf('Rout=%3d Ohm', round(R) );
    makeLambdaPlot( lambdas, energyPerUpDownCycle/1e-15, styles{k}, 'displayName', name );
    
    figure(2);
    makeLambdaPlot( lambdas, Rmin, styles{k} );
    figure(3);
    makeLambdaPlot( lambdas, ratio, styles{k} );
    
    
end
figure(1);
grid on;
ylabel( 'energy per up-down cycle [fJ]' );
legend show;
grid on;

figure(2);
grid on;
ylabel( 'Rmin [Ohm]' );
grid on;

figure(3);
grid on;
ylabel( 'ratio' );
grid on;