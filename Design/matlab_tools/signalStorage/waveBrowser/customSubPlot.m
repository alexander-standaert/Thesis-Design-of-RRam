function customSubPlot(fig,stripAxes) 
    %
    % function customSubPlot([fig,stripXAxes ]) 
    %
    % Shift all the present axes,and creates a new one below the
    % existing...
    %
    % is stripAxes=1, the xlabels of the middle axes are removed...
    %
    
    if(nargin < 1)
        fig = gcf;
    end
    
    if(nargin < 2)
        stripAxes = 0;
    end
    
    %margin high and low are given, as proportion of the total figure
    margin_high  = 0.11;
    %margin_low is added to the already present margin_middle.
    margin_low = 0.14;
    %margin_middle is given, as proportion of the subfigure size
    if ( stripAxes )
        margin_middle = 0.1;
    else
        margin_middle = 0.1;
    end
    
    left_margin = 0.13;
    width = 0.7750;
    axesHandle = zeros(0,1);
    otherHandle= zeros(0,1);
    
    everyHandles = get(fig,'Child');
    for i = 1:length(everyHandles)
        H = everyHandles(i);
       if ( strcmp(get(H,'Tag'), '' ))
        axesHandle(end+1) = (H);
       else
        otherHandle(end+1) = (H);
       end
    end
    
    nbAxes = length(axesHandle);
    
    %compute the size of the new axes
    new_nbAxes = nbAxes + 1 ;
    per_figure = (1) / ( new_nbAxes +margin_high +margin_low -margin_middle) ;
    
    scaled_margin_low  = margin_low  *per_figure ; 
    scaled_margin_high = margin_high *per_figure ;
    scaled_margin_middle  = margin_middle * per_figure;
    scaled_height = (1 - margin_middle) * per_figure;
    
    
    for i=1:nbAxes
        AX = axesHandle(i);
        if i == 1
            anchor = 1-scaled_margin_high - scaled_height;
            set(AX,'Position',[ left_margin  anchor  width scaled_height] );
            cumulated = 1- (scaled_margin_high + scaled_height);
        else
            anchor = cumulated - (  scaled_margin_middle + scaled_height);
            set(AX,'Position',[ left_margin anchor  width scaled_height] );
            cumulated = cumulated - (scaled_margin_middle + scaled_height);
        end  
        if(stripAxes)
            set(AX,'XTickLabel',[])
        end
        %TODO: add the option to remove the X axis.
    end
    %new_one = axes;
    new_one = axes('position',[left_margin scaled_margin_low width scaled_height]);

    %Keep the order right
    set(gcf,'Child', [axesHandle new_one otherHandle]');
   %new_one  = 
    %set (new_one,'Position',)
  
end
   %set(new_one,);
    
    
