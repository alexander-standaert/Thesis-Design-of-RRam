function [ ] = semilogxGraph( plotS, plotId )
% function [ ] = semilogxGraph( plotS, plotId )
%
%  plot the given plotS structure to the given figure 
%    with x-axis on a log-scale
%  marker spacing is only thinned when linestyle is not empty
%
%  for checking x-spacing, log10 of the xvalues is taken
%  e.g. to plot a marker at 1, 10, 100 and 1000, xmarkerdistance should
%       be 1

figure( plotId );
close( plotId );
figure( plotId );

myLegend = {};

xm = plotS.xmult;
ym = plotS.ymult;

% go over the list once and plot the first points to generate the legend
for i=1:length( plotS.name )
  if length( plotS.name{i} )>0
    xv = plotS.xvalues{i}(1);
    yv = plotS.yvalues{i}(1);      
  
    style = sprintf( '%s%s%s', plotS.lineStyle{i}, plotS.color{i}, plotS.marker{i} );
     
    if( (plotS.lineWidth{i} > 0)  )
      semilogx( xv*xm, yv*ym, style, 'lineWidth', plotS.lineWidth{i}, 'markerSize', 9  );
    else
      semilogx( xv*xm, yv*ym, style, 'markerSize', 9 );
    end 
    hold on;
    myLegend{end+1} = plotS.name{i};
  end
end


legend( myLegend );

% go over the list to plot the lines and the markers, including for nameless graphs
for i=1:length( plotS.name )
    if  ( length( plotS.lineStyle{i} )>0 ) && ...
        ( plotS.maxXMarkerDistance{i}>0 )
      [ xv yv ] = sparsify( plotS.xvalues{i}, plotS.yvalues{i}, ...
                            plotS.maxXMarkerDistance{i}, ...
                            plotS.maxYMarkerDistance{i});
    else
      xv = plotS.xvalues{i};
      yv = plotS.yvalues{i};      
    end

    if length( plotS.marker{i} )>0
      style = sprintf( '%s%s', plotS.color{i}, plotS.marker{i} );  % plot markers sparsely, no lines     
      semilogx( xv*xm, yv*ym, style,  'markerSize', 9 );
    end

    xv = plotS.xvalues{i};
    yv = plotS.yvalues{i};          
    style = sprintf( '%s%s', plotS.lineStyle{i}, plotS.color{i} );  % plot lines, no markers
    if( plotS.lineWidth{i} > 0 )
      semilogx( xv*xm, yv*ym, style, 'lineWidth', plotS.lineWidth{i}  );
    else
        semilogx( xv*xm, yv*ym, style );
    end 
end

  title( plotS.title );
  
  xlabel( plotS.xlabel );
  ylabel( plotS.ylabel );
  grid on;

end
      

function [ xv yv ] = sparsify( xvalues, yvalues, maxXMarkerDistance, maxYMarkerDistance )

  x0 = xvalues( 1 );
  y0 = yvalues( 1 );

  xv=[];
  yv=[];
  xv(1)=x0;
  yv(1)=y0;

  for i=2:length( xvalues );
    x1 = xvalues( i );
    y1 = yvalues( i );
    if ( log10( abs(x1-x0)/abs(x0) )>=maxXMarkerDistance ) || ...
       ( abs(y1-y0)>=maxYMarkerDistance )
     
      xv(end+1)=x1;
      yv(end+1)=y1;
      x0=x1;
      y0=y1;       
    else
      %nothing
    end
    
  end

end
