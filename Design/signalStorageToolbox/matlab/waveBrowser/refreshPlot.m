function answer = refreshPlot(fig)

if(nargin <1)
    fig=gcf;
end

currentSimuObject = evalin( 'base', 'UWIViewerObject' );

currentSimuObject.reload
makePlotDynamic( 'UWIViewerObject' , fig)
answer = 0;