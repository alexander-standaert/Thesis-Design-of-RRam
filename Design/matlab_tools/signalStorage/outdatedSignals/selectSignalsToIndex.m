function [ indexSignal ] = selectSignalsToIndex( selectSignals, thresholdLow, thresholdHigh, indices, oneCold, resampleX )
% function [ indexSignal ] = selectSignalsToIndex( selectSignals, thresholdLow, thresholdHigh, indices, oneCold, resampleX )
%
% creates a new java Signal which indicates which of the selectSignals is
% activated at each moment in time.
%
% required parameters:
% ====================
% selectSignals : a cell array of Signals.
% thresholdLow  : all yValues below this value are interpreted as 0
% thresholdHigh : all yValues above this value are interpreted as 1
%
% If there are yValues between thresholdLow and thresholdHigh, indexSignal
% will contain NaN 
%
% optional parameters:
% ====================
% indices       : a vector with the index of each signal.  Typically 1:N or
%                 0:(N-1).  This is the number that will be returned in
%                 indexSignal.  
%                 DEFAULT=0:(N-1)
% onCold        : if 0 (default), signals are oneHot ( the selected wire is
%                 high, the other wires are low )
%                 if 1, signals are oneCold ( the selected wire is low, all
%                 other wires are high )
%                 DEFAULT: 0 ( one hot )
% resampleX     : the indexSignal is only sampled at the xValues in
%                 resampleX.  If resampleX is empty, we don't resample
%                 DEFAULT: do not resample
%
% WARNING: at this time, there is no check for the simultaneous activation
%          of multiple select wires.  If Si and Sj are high at the same
%          time, the reported index will be i+j  Behaviour might change in
%          the future
%
% WARNING: if there is a signal with index 0, you cannot distinguish
%          between the situation in which 0 is selected and the situation
%          in which no wire is selected.
%          you can use 
%               indices' = indices+A ; 
%               indexSignal = indexSignal.subtract(A); 
%          instead.  When no signal is selected, indexSignal will be -A
%          ==> automatically implemented to make index when no signal is
%          selected equal aan NaN

    if nargin<3
       error( 'selectSignalsToIndex requires at least parameters selectSignals, thresholdLow, thresholdHigh' );
    end
    L = length( selectSignals );
    if L==0
       error( 'selectSignalsToIndex requires at least one signal in selectSignals' );       
    end   
    
    if nargin<4       
       indices=0:(L-1);
    else
        if L ~= length( indices )
            error( 'selectSignalsToIndex: length of selectSignals and indices does not match' );           
        end
    end
    
    if nargin<5
        oneCold=0;
    end 
    
    doResample=0;
    sameBase=0;
    if nargin==6
        if( ~isempty( resampleX ) )
            doResample=1;
            sameBase=1;
        end
    end
    
    A = min( indices );
    indices = indices-A+1;  % lowest index moves to 1
    
    signal = selectSignals{1};
    if doResample
        signal = signal.resample( resampleX );
    end
    signal = signal.digitize( thresholdLow, thresholdHigh, NaN );   
    if oneCold
        unitSignal = signal.createConstantSignal( 1 );
        signal = unitSignal.subtract( signal, sameBase );
    end
    
    indexSignal = signal.multiply( indices(1) );
    
    for i=2:L
        signal = selectSignals{i};
        if doResample
            signal = signal.resample( resampleX );            
        end
        signal = signal.digitize( thresholdLow, thresholdHigh, NaN );  
        if oneCold
            unitSignal = signal.createConstantSignal( 1 );
            signal = unitSignal.subtract( signal, sameBase );
        end       
        signal = signal.multiply( indices(i) );
        indexSignal = indexSignal.add( signal, sameBase );
    end
    
    % if indexSignal is lower than 1, no signal is selected. Replace with
    % NaN
    indexSignal = indexSignal.replaceValuesStrictlyBelow( 0.5, NaN );
    indexSignal = indexSignal.add( A-1 );
    
end