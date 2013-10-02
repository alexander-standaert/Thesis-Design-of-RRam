function [ SIM SVM WTI WTV SIM1 SIM2 SVM1 SVM2 WTI1 WTI2 WTV1 WTV2 ] = ...
  findNcurveMetrics(  InWhenQFixed, InWhenQBarFixed, ...
                      plotHandle1, style1, ...
                      plotHandle2, style2 )
%
%  InWhenQFixed is a signal. yValues=current from the voltage source on node Q
%                            xValues=the fixed value at node Q
%  InWhenQBarFixed is the current from the voltage source on node QBar
%  It is a signal, with in the x-values the fixed value at node QBar
%  InWhenQBarFixed is the current from the voltage source on node QBar
%
%  plotHandle1, plotHandle2
%    ==-1 if you do not want to plot anything
%  (must be subplot-handles ...)
%  
%  style1 = style to plot everything associated with first n-curve
%  style2 = style to plot everything associated with second n-curve
%
%  note: a cell has two n-curves.  One for each side being swept.
%        only for symmetric cells without variations, the two curves
%        are equal
%
%  for the definitions of SIM, SVM and WTI, WTV: see paper evelyn
%  (Static current margin, static voltage margin and 
%   Write trip current and write trip voltage)
%  All values are positive when the curve behaves as expected ...
%  
%  note:  I-curve has to be inverted before we plot / start
%         because this is the other way round as compared 
%
%  note:  only curves measured for static read operations should be passed to
%         this function (e.g. bitlines fixed in precharge...)

   
 [ SIM1 SVM1 WTI1 WTV1 ] = ...
    findNcurveMetricsSingle(  InWhenQFixed, plotHandle1, style1 );
 [ SIM2 SVM2 WTI2 WTV2 ] = ...
    findNcurveMetricsSingle(  InWhenQBarFixed, plotHandle2, style2 );

  SIM = min( SIM1, SIM2 );
  SVM = min( SVM1, SVM2 );
  WTI = min( WTI1, WTI2 );   % should be max ?? most problematic to write
  WTV = min( WTV1, WTV2 );   % should be max ??

end


% ------------------------------------
function [ SIM SVM WTI WTV ] = ...
  findNcurveMetricsSingle(  InWhenQxFixed, plotHandle, style )
  % note: with fishy bitline voltages, n-curves can have multiple
  %       stable crossing points, 
  % e.g.: 1 stable, 1 metastable, 1 stable, 1 metastable, 1 stable
  %
  % SIM and SVM are measured between the first stable and metastable point
  % WTI and WTV are measured between this first metastable and last stable point

  xValues = InWhenQxFixed.xValues;

  xmax = max( xValues );
  xmin = min( xValues );

  step=(xmax-xmin)/200;
  xv = xmin:step:xmax;
  iSignal = resampleSignal( InWhenQxFixed, xv );
  iSignal.yValues = -iSignal.yValues;  %invert the signal
  
  positive = iSignal.yValues >= 0 ;
  negative = iSignal.yValues <  0 ;

  % find first positive area.  This is the area where Imargin and
  % Vmargin has to be measured
  index1 = find( positive, 1 );
  index2 = find( negative( index1:end ), 1  ) + index1 - 1 ;
  
  if length(index2)==0  
    %     no negative part after the first positive crossing...
    % ==> only one stable point, data is lost ...
    
    fprintf( 1, 'no negative part after first positive part\n');

    SVM=0;
    SIM=0;
    WTI=0;
    WTV=0;
    
  else

    SVM = iSignal.xValues( index2 ) - iSignal.xValues( index1 ); 
    [ SIM SIMindex] = max( iSignal.yValues( index1:index2 ) ); 
    SIMindex = SIMindex + index1 -1;
    
  
    index3 = find( negative, 1, 'last' ) ;

    [ WTI WTIindex ] = min( iSignal.yValues( index2:index3 ) );
    WTI= -WTI;
    WTIindex = WTIindex + index2 - 1 ; 
    WTV = iSignal.xValues( index3 ) - iSignal.xValues( index2 )  ;

  end
  
  if( plotHandle ~= -1 )
    subplot( plotHandle )
 
    plot( iSignal.xValues, iSignal.yValues, style );
    hold on;
    grid on;
    xlabel('Q or QBar [V]' );
    ylabel('current through Vn [A]');

    % SVM
    if( SVM~=0 )
      x1 = iSignal.xValues( index1 );
      x2 = iSignal.xValues( index2 )
      plot( [x1], [0], 'dr' );
      plot( [x2], [0], 'dr' );
    end
    
    % SIM 
    if( SIM~=0 )
      x = iSignal.xValues( SIMindex );
      line( [ x x ] , [0 SIM ] );
      plot( [x],[SIM], 'sr' );
    end
 
    % WTV
    if( WTV~=0 )
      x2 = iSignal.xValues( index2 );
      x3 = iSignal.xValues( index3 );
      plot( [x2], [0], 'ok' );
      plot( [x3], [0], 'ok' );
    end
    
    % WTI
    if( WTI~=0 )
      x = iSignal.xValues( WTIindex );
      line( [ x x ] , [ 0 -WTI ] );
    end
  end

end
  
