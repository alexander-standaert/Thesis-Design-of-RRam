function [] = cellPrintResultStructure( result )
% function [] = cellPrintResultStructure( result )
%
% print <result>, the performance values for a 6T cell
%

    eNT_A = eNT('A');

    try
        fprintf( 'read: SNM1=%3.0fmV, SNM2=%3.0fmV ==> SNM=%3.0fmV\n', ...
            1000*result.SNM_1, 1000*result.SNM_2, 1000*result.SNM  );
        %fprintf( 'read: SINM1=%3.0fuA, SINM2=%3.0fuA ==> SINM=%3.0fuA\n', ...
        %    1e6*result.SINM_1, 1e6*result.SINM_2, 1e6*result.SINM );
        %fprintf( 'read: SVNM1=%3.0fmV, SVNM2=%3.0fmV ==> SVNM=%3.0fmV\n', ...
        %    1000*result.SVNM_1, 1000*result.SVNM_2, 1000*result.SVNM ); 
    catch e
        fprintf( 'read operation (SNM, nCurve) not available\n');
        disp( e.message );
    end
    
    try
        fprintf( 'hold: SNM1=%3.0fmV, SNM2=%3.0fmV ==> SNM=%3.0fmV\n', ...
            1000*result.SNMhold_1, 1000*result.SNMhold_2, 1000*result.SNMhold );
        %fprintf( 'hold: SINM1=%3.0fuA, SINM2=%3.0fuA ==> SINM=%3.0fuA\n', ...
        %    1e6*result.SINMhold_1, 1e6*result.SINMhold_2, 1e6*result.SINMhold );
        %fprintf( 'hold: SVNM1=%3.0fmV, SVNM2=%3.0fmV ==> SVNM=%3.0fmV\n', ...
        %    1000*result.SVNMhold_1, 1000*result.SVNMhold_2, 1000*result.SVNMhold ); 
    catch e
        fprintf( 'hold operation (SNMhold, nCurve hold) not available\n');
        disp( e.message );
    end

    
    
    try
        fprintf( 'WTP_0=%3.0fmV, WTP_1=%3.0fmV, WTP=%3.0fmV\n',...
            result.WTP_0*1000, result.WTP_1*1000, result.WTP*1000 );
        %fprintf( 'WTPI_0=%3.0fuA, WTPI_1=%3.0fuA, WTPI=%3.0fuA\n',...
        %    result.WTPI_0*1e6, result.WTPI_1*1e6, result.WTPI*1e6 );
    catch e
        fprintf( 'write trip point (WTP) not simulated\n');
        disp( e.message );
    end

    
    try
        fprintf( 'read 0: V(Q)=%4.0fmV, V(QBar)=%4.0fmV, Iread=%3.1fuA\n', ...
            result.read0_Q*1000, result.read0_QBar*1000, result.read0_Iread*1e6 );
        fprintf( 'read 1: V(Q)=%4.0fmV, V(QBar)=%4.0fmV, Iread=%3.1fuA\n', ...
            result.read1_Q*1000, result.read1_QBar*1000, result.read1_Iread*1e6 );  

        fprintf( 'hold 0: V(Q)=%4.4fmV, V(QBar)=%4.4fmV, Ileak=%s\n', ...
            result.hold0_Q*1000, result.hold0_QBar*1000, eN( result.hold0_Ileak, eNT_A ) );      
        fprintf( 'hold 1: V(Q)=%4.4fmV, V(QBar)=%4.4fmV, Ileak=%s\n', ...
            result.hold1_Q*1000, result.hold1_QBar*1000, eN( result.hold1_Ileak, eNT_A ) );     
    catch e
        fprintf( 'currents not simulated\n');
        disp( e.message );
    end
        
        
%   fprintf( 'write: WTV1=%dmV, WTV2=%dmV ==> WTV=%dmV\n', ...
%             round( 1000*resultNcurve.WTV_1 ), ...  
%             round( 1000*resultNcurve.WTV_2 ), ...  
%             round( 1000*resultNcurve.WTV   ) );       
%  

%   fprintf( 'write: WTI1=%duA, WTI2=%duA ==> WTI=%duA\n', ...
%             round( 1e6*resultNcurve.SINM_1 ), ...  
%             round( 1e6*resultNcurve.SINM_2 ), ...  
%             round( 1e6*resultNcurve.SINM   ) );

end