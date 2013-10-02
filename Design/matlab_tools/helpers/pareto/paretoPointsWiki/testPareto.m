%% generate a toy data set
scaleR = 1:2:20;
vddR   = 0.5:0.1:1;

L1 = length( scaleR );
L2 = length( vddR   );

options = zeros( L1*L2, 2 );

for i=1:L1
    for j=1:L2
        options( i+(j-1)*L1, : ) = [ scaleR(i) vddR(j) ];
    end
end

scale = options( :,1 );
vdd   = options( :,2 );


Cload = 10e-15;
Vt = 0.4;
IonPerfF = 500e-6;

Ctotal = Cload + 1e-15 * scale;
Idrive = scale .* (vdd-Vt) * IonPerfF;

energy = Ctotal .* (vdd.^2);
delay  = Ctotal ./ Idrive;

%% visualise the results
%plot all points
figure(1); 
for j=1:L2
    range = ( (j-1)*L1+1 ) : ( (j)*L1 );
    plot( energy(range), delay(range), '.-'  );
    labeltje = sprintf( 'vdd=%gV', vddR(j) );
    text( energy(range(1)), delay(range(1)), labeltje );
    hold on;
end
xlabel( 'energy [J]' );
ylabel( 'delay [s]' );
title('toy dataset');
grid on;


%% in this dataset, find the pareto points, the points for which there are no
%  other points with a smaller delay for the same or smaller energy 

goalEnergy = -1;  % smaller is better
goalDelay  = -1;  % smaller is better

I = findParetoPoints( energy, delay, goalEnergy, goalDelay );

%% visualise the results
%plot pareto curve
figure(1);
hold on;
plot( energy(I), delay(I), 'ro' );
for i=I
   labeltje = sprintf('[%d]',i);
   text( energy(i), delay(i), labeltje ); 
end



%% write a table with optimal settings
for i=I
   fprintf( '%d  scale=%2.3f, vdd=%2.3f ==> Energy=%3.3ffJ, delay=%3.3fps\n', ...
            i, scale(i), vdd(i), energy(i)*1e15, delay(i)*1e12 );
end
    
