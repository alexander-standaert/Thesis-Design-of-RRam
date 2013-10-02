
lambdas= [ 180 130 90 65 45 32 22 16 10 ]*1e-9;
techs = getHighSpeedTechnologies( lambdas );

figure( 1 );
plot( lambdas/1e-9, [ techs.CgPer2Lambda      ]/1e-15, '.r-', 'displayName', 'Cg per 2 lambda' );
hold on;
plot( lambdas/1e-9, [ techs.CdrainPer2Lambda  ]/1e-15, 'ob-', 'displayName', 'Cd per 2 lambda' );
plot( lambdas/1e-9, [ techs.CsourcePer2Lambda ]/1e-15, '+m-', 'displayName', 'Cs per 2 lambda' );
title( 'C per 2 lambda' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'C [fF]' );


figure( 2 );
plot( lambdas/1e-9, [ techs.invDelay ]/1e-12, '.r-', 'displayName', 'intrinsic INV delay' );
hold on;
plot( lambdas/1e-9, [ techs.FO4Delay ]/1e-12, 'ob-', 'displayName', 'FO-4 INV delay' );

title( 'delays' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'delay [ps]' );


figure( 3 );
plot( lambdas/1e-9, [ techs.NMOS_IonPerMeter ], '.r-', 'displayName', 'NMOS ' );
hold on;
plot( lambdas/1e-9, [ techs.PMOS_IonPerMeter ], 'ob-', 'displayName', 'PMOS' );
title( 'Ion per meter' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'Ion per meter [A/m]=[uA/um]' );


figure( 4 );
plot( lambdas/1e-9, [ techs.NMOS_IonPer2Lambda ]/1e-6, '.r-', 'displayName', 'NMOS ' );
hold on;
plot( lambdas/1e-9, [ techs.PMOS_IonPer2Lambda ]/1e-6, 'ob-', 'displayName', 'PMOS' );
title( 'Ion per 2F' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'Ion per 2F [uA/2F]' );



figure( 5 );
plot( lambdas/1e-9, [ techs.NMOS_RonPerMeter ]/1e-6, '.r-', 'displayName', 'NMOS ' );
hold on;
plot( lambdas/1e-9, [ techs.PMOS_RonPerMeter ]/1e-6, 'ob-', 'displayName', 'PMOS' );
title( 'Ron per meter' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'Ron per meter [uOhm/m]' );

figure( 6 );
plot( lambdas/1e-9, [ techs.NMOS_RonPer2Lambda ]/1e3, '.r-', 'displayName', 'NMOS ' );
hold on;
plot( lambdas/1e-9, [ techs.PMOS_RonPer2Lambda ]/1e3, 'ob-', 'displayName', 'PMOS' );
title( 'Ron per 2 lambda' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'Ron per 2F [kOhm/2F]' );


figure( 7 );
plot( lambdas/1e-9, [ techs.Advt ]/1e-9, '.r-', 'displayName', 'Advt' );
hold on;
title( 'pelgrom constant' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'Advt [mVum]' );


figure( 8 );
plot( lambdas/1e-9, [ techs.sigmaVt2Lambda ]/1e-3, '.r-', 'displayName', 'sigma' );
hold on;
title( 'sigma Vt for Fx2F transistors' );
grid on;
legend show;
xlabel( '{\lambda} [nm]' );
ylabel( 'sigma Vt [mV]' );