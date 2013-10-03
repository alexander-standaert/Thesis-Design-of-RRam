function [ snm snm1 snm2 square1 square2 ] = findSNM( QBarWhenQFixed, QWhenQBarFixed, doPlot )
% square1.x1 .y1 .x2 .y2
% square2.x1 .y1 .x2 .y2

  X1 = QBarWhenQFixed.getXValues();
  Y1 = QBarWhenQFixed.getYValues();
  X2 = QWhenQBarFixed.getXValues();
  Y2 = QWhenQBarFixed.getYValues();
  
  import be.kuleuven.micas.signals.*;
  c1 = Signal( X1, 'QBarWhenQFixed.Q', 'V', Y1, 'QBarWhenQFixed.QBar', 'V' );
  c2 = Signal( Y2, 'QWhenQBarFixed.Q', 'V', X2, 'QWhenQBarFixed.QBar', 'V' );
  
  %c1 = QBarWhenQFixed;
  %c2 = QWhenQBarFixed;
  %c2.setXValues( QWhenQBarFixed.getYValues() );
  %c2.setYValues( QWhenQBarFixed.getXValues() );
  
  if doPlot
    figure(2);
    hold on;
    plotSignal( c1, '.r-');
    hold on;
    plotSignal( c2, '.k-');
  end

  rot1 = rotateSignal( c1, 0,0, pi/4 );
  rot2 = rotateSignal( c2, 0,0, pi/4 );
  
  if doPlot
    figure(3);
    hold on;
    plotSignal( rot1 , 'or-' );
    hold on;
    plotSignal( rot2 , 'ok-' );
  end

  xmin = max( min( rot1.getXValues() ), min( rot2.getXValues() ) );
  xmax = min( max( rot1.getXValues() ), max( rot2.getXValues() ) );
  step=(xmax-xmin)/200;
  xv = xmin:step:xmax;
  r1 = resampleSignal( rot1, xv );
  r2 = resampleSignal( rot2, xv );

  if doPlot
    plotSignal( r1 , '.r--' );
    plotSignal( r2 , '.k--' );
  end

  [ snm snm1 snm2 sq1 sq2 ]= readSimpleSNMAfterRotation( r1, r2, doPlot );

  if doPlot
    fprintf(1, 'SNM = %g\n', snm );
  end
  
  % rotate square1 and square2 back, put in Xvalues, Yvalues format
  [ x1 y1 ] = rotatePoint( sq1.x1, sq1.y1, 0,0, -pi/4 );
  [ x2 y2 ] = rotatePoint( sq1.x2, sq1.y2, 0,0, -pi/4 );
  square1.xValues = [ x1 x1 x2 x2 x1 ];
  square1.yValues = [ y1 y2 y2 y1 y1 ];
  
  [ x1 y1 ] = rotatePoint( sq2.x1, sq2.y1, 0,0, -pi/4 );
  [ x2 y2 ] = rotatePoint( sq2.x2, sq2.y2, 0,0, -pi/4 );
  square2.xValues = [ x1 x1 x2 x2 x1 ];
  square2.yValues = [ y1 y2 y2 y1 y1 ];
  
  
end
