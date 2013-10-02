function [ xtickLabel ] = makeXtickAndLabel( xtick, xtickLabelPositions, format )
%  function [ xtickLabel ] = makeXtickAndLabel( xtick, xtickLabelPositions, format )
%  format = '%d'
%  call with xtick = 0:50:1000
%  and xtickLabelPositions = 0:100:1000
%  xtickLabel = 0   '' 100 '' ...
    xtickLabel = cell( 1, length(xtick) );

    for i=1:length( xtick )
        if sum( xtickLabelPositions==xtick(i) ) >0
            xtickLabel{i} = sprintf( format, xtick(i) );
        else
            xtickLabel{i}='';
        end
    end
end