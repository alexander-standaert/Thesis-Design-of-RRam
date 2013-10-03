function AX = gotoSubPlot(nbSubPlot, fig )
%
% AX  = gotoSubPlot(nbSubPlot, fig )
% access the nbsubplot of the figure fig
%

if(nargin < 2)
        fig = gcf;
end
AllAxes = get(fig,'Child');

axes(AllAxes(nbSubPlot));
AX = gca;

end