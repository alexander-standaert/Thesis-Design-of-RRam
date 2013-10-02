function [ ] = plotGraph( plotS, plotId )
% function [ ] = plotGraph( plotS, plotId )
%
%  plot the given plotS structure to the given figure 
%
%  marker spacing is only thinned when linestyle is not empty

figure( plotId );
close( plotId );
figure( plotId );

myLegend = {};

xm = plotS.xmult;
ym = plotS.ymult;

% plotS.name
% length( plotS.name )

% go over the list once and plot the first points to generate the legend
for i=1:length( plotS.name )
  if( plotS.type{i}~=1 ) 
      continue;
  end
  
  if ( length( plotS.name{i} )>0 )
    xv = plotS.xvalues{i}(1);
    yv = plotS.yvalues{i}(1);      
  
    style = sprintf( '%s%s%s', plotS.lineStyle{i}, plotS.color{i}, plotS.marker{i} );
     
    if( plotS.lineWidth{i} > 0 )
        plot( xv*xm, yv*ym, style, 'lineWidth', plotS.lineWidth{i}, 'markerSize', 9  );
    else
        plot( xv*xm, yv*ym, style, 'markerSize', 9 );
    end 
    hold on;
    myLegend{end+1} = plotS.name{i};
  end
end

legend( myLegend );

% go over the list to plot the lines and the markers, including for nameless graphs
for i=1:length( plotS.name  )
    if( plotS.type{i}~=1 ) 
        continue;
    end
    
    %plotS.name{i}
    
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
      plot( xv*xm, yv*ym, style,  'markerSize', 9 );
      hold on;
    end

    xv = plotS.xvalues{i};
    yv = plotS.yvalues{i};        
    
    if( length( plotS.lineStyle{i})>0 )
        style = sprintf( '%s%s', plotS.lineStyle{i}, plotS.color{i} );  % plot lines, no markers
        if( plotS.lineWidth{i} > 0 )
            plot( xv*xm, yv*ym, style, 'lineWidth', plotS.lineWidth{i}  );
            hold on;
        else
            plot( xv*xm, yv*ym, style );
            hold on;
        end 
    end
end
  
  title( plotS.title );

  xlabel( plotS.xlabel );
  ylabel( plotS.ylabel );
  grid on;
  
  a = axis();
  axis(a);
  
  %% now add the areas
for i=1:length( plotS.name  )
    if( plotS.type{i}~=2 ) 
        continue;
    end
    
    fprintf('====> plotting area : %s\n', plotS.name{i} );
    
    props = plotS.properties{i}
    xv = plotS.xvalues{i};
    yv = plotS.yvalues{i};            
    
    
    f=area( xv*xm, yv*ym, 'FaceColor', props.color );
    h = findobj(gca,'Type','patch');    
    set(h,'facealpha',plotS.properties{i}.faceAlpha, 'edgeAlpha', props.edgeAlpha );
        
    if( props.fillAll==1 )        
        f=area( xv*xm, -yv*ym, 'FaceColor', props.color );
        h = findobj(gca,'Type','patch');    
        set(h,'facealpha',plotS.properties{i}.faceAlpha, 'edgeAlpha', props.edgeAlpha );        
    end
    
    if( props.labelType==1 ) 
       if( props.labelYPosition>0 ) 
         crossingsUp   = findCrossesUp( yv, props.labelYposition );
         crossingsDown = findCrossesDown( yv, props.labelYposition );
         if length( crossingsUp )>0
            I1 = crossingsUp(1);       
            text( xv(I1)*xm, yv(I1)*ym, plotS.name{i}  );
         end
       else
         crossingsUp   = findCrossesUp( -yv, props.labelYPosition );
         crossingsDown = findCrossesDown( -yv, props.labelYPosition );
         if length( crossingsDown )>0
            I1 = crossingsDown(1);       
            text( xv(I1)*xm, -yv(I1)*ym, plotS.name{i}  );
         end
       end
       
       
    end
end  
  

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
    if ( abs(x1-x0)>=maxXMarkerDistance ) || ...
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
