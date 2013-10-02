function [] = printMismatchValues( circuit )
%function [] = printMismatchValues( circuit )
%
% print the applied parameter shifts for all transistors in the given 
% circuit.  at this moment, the parameters are:
% ( shiftBeta ( which is a percentage, deltaBeta/Beta0 ) and shiftVt )


    for i= 1:length( cell.devices ) 
        device = cell.devices{i};
        
        if ~isTransistor( device )
            continue;            
        end
               
        deltaBetaBeta0 = transistorGet( device, 'shiftBeta' );
        sigmaBetaBeta0 = getTransistorBB0Sigma( device );
        nBetaBeta0 = deltaBetaBeta0 / sigmaBetaBeta0;
        
        deltaVt  = transistorGet( device, 'shiftVt' );
        sigmaVt = getTransistorVtSigma( device );
        nVt = deltaVt / sigmaVt;
        
        name = device.name;
        
        fprintf('%s: deltaVt = %4.2fmV [%2.2f sigma], (delta Beta)/Beta0=%3.2f%% [%2.2f sigma]\n', ...
                    name, deltaVt*1000, nVt, deltaBetaBeta0*100, nBetaBeta0 );
    end       


end

