function [ snm snm_1 snm_2 ] = readSNMAfterRotation( c1, c2, doPlot )
% function [ snm ] = readSNMAfterRotation( c1, c2, doPlot )
%
%   c1 and c2 are the rotated butterfly curves
%   with x-points sampled at the same xvalues in the same order
%   

  [ m1 i1 ] = max( c1.yValues );
  [ m2 i2 ] = max( c2.yValues );

  if doPlot
    figure(4);
    hold on;
    plotSignal(c1, 'k-');
    hold on;
    plotSignal(c2, 'g-');
  end

  snm_1 = findSNM_1( c1, c2, m1, i1,doPlot );
  snm_2 = findSNM_1( c1, c2, m2, i2,doPlot );

  snm=min( snm_1, snm_2 );

end



function [ snm ] = findSNM_1( c1, c2, m, index,doPlot )

  sx=0;
  % increase sx (the horizontal stretch in index-units until 
  % the square becomes less tall than wide 
  x1 = c1.xValues;
  y1 = c1.yValues;
  x2 = c2.xValues;
  y2 = c2.yValues;

  h=abs( y2-y1 );

  size(x1)

  while true
    i1=index-sx;
    i2=index+sx;

 

    width =  x1( i2 ) - x1( i1 );
    height = min( h( i2 ) , h( i1 ) ); 

    if( height<=width )
      snm=height;
      if doPlot
        rectX = [ x1(i1)  x1(i2)  x2(i2) x2(i1) x1(i1) ];
        rectY = [ y1(i1)  y1(i2)  y2(i2) y2(i1) y1(i1) ];
        plot( rectX, rectY, 'or-' ); 
      end
      return;
    end
    sx=sx+1;
  end
end
