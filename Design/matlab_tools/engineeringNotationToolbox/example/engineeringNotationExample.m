% example of sprintf_EN and fprintf_EN

text = sprintf_EN( '%s = %g, but in engineering notation it is %[A]\n', ...
                   'current', 1.2e-9, 1.2e-9 );

fprintf( 'text="%s"', text );

fprintf_EN( '%s = %g, but in engineering notation it is %[V]\n', ...
            'voltage', 0.99, 0.99 );



% example of underlying 
% - engineeringNotationTemplate  (eNT)
% - engineeringNotation          (eN )
fprintf( '==== if you need more flexibility than what is currently \n');
fprintf( '==== provided by sprintf_EN,  you can tweak the formatting rules yourself: \n');

tA = eNT( 'A' );
s = eN( 26.2e-6, tA )


tA.maxDigits=6;
tA.maxDigitsAfterDot=3;
s = eN( 26.2e-6, tA )

tV = eNT('V');
tV.preferShift=1;
s = eN( 0.99, tV )

tV.preferShift=0;
s = eN( 0.99, tV )
s = eN( 1   , tV )

tV.preferShift=3;
tV.forceShift=true;
s = eN( 1.2, tV )

