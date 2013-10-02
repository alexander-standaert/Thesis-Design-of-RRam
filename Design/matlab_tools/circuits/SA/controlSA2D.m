calculateOffset = 1;




SA_supply = 1;
V_inlow  =  0e-3;
V_inhigh = 100e-3;

expectedResult = -1;  % +1 or -1

devices= getSA1();

range1 = -10:2:10;
L1 = length(range1);
range2 = -10:2:10;
L2 = length(range2);

Renergy   = zeros( L1, L2 );
Rdelay    = zeros( L1, L2 );
Roffset   = zeros( L1, L2 );

%param1 = 'Mup Vt'
i1 = 2;
%param2 = 'Mdown Vt'
i2 = 4;



device1 = devices{i1};
device2 = devices{i2};

sigmaVt1 = getTransistorVtSigma( device1 );
sigmaVt2 = getTransistorVtSigma( device2 );

for k1 = 1:length( range1 )
    n1 = range1(k1);
    fprintf( '\n----- starting parameter 1 = %d sigma (%g V) \n', n1, n1*sigmaVt1 );
    devices{i1}.paramValues(3) = n1*sigmaVt1;
    
    for k2 = 1:length( range2 )
        n2 = range2(k2);
        fprintf( '-- starting parameter 2 = %d sigma (%g V) \n', n2, n2*sigmaVt2 );
        devices{i2}.paramValues(3) = n2*sigmaVt2;        
        
        [ energy delay ] = analyseEDSinglePointSA( devices, SA_supply, V_inlow, V_inhigh,  expectedResult );
        if calculateOffset
            [ offset ] = analyseOffsetSinglePointSA( devices, SA_supply, V_inlow, V_inhigh );
        else
            offset=0;
        end
        Renergy(k1,k2) = energy;
        Rdelay(k1,k2)   = delay;
        Roffset(k1,k2)  = offset;
        
    end
end
    
save results2D.mat 

figure(101);
contourf( range1, range2, Rdelay );  %note: gives very confusing output around failing regions...
hold on; colorbar();
figure(102);
contourf( range1, range2, Renergy );
hold on; colorbar();
figure(103);
contourf( range1, range2, Roffset );
hold on; colorbar();

figure(110);
for i1=1:length( range1 )
   plot( range2, Roffset( i1, : ), '.k-' );
   hold on;
   xlabel( 'parameter 2 [number of sigmas ]' );
end

figure(111);
for i2=1:length( range2 )
   plot( range1, Roffset( :, i2 ), '.k-' );
   hold on;
   xlabel( 'parameter 1 [number of sigmas ]' );
end

figure(120);
for i1=1:length( range1 )
   plot( range2, Rdelay( i1, : ), '.k-' );
   hold on;
   xlabel( 'parameter 2 [number of sigmas ]' );
end

figure(121);
for i2=1:length( range2 )
   plot( range1, Rdelay( :, i2 ), '.k-' );
   hold on;
   xlabel( 'parameter 1 [number of sigmas ]' );
end


