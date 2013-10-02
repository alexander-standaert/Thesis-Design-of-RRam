function names = getPlotNames(fig )
%
%  function names = getPlotNames( )
%  function names = getPlotNames(fig )
%
%  return an array containing the name of the signals, thata have been
%  plotted in the fig figure. if no figure is given, the plots inside gca
%  are given
%

if(nargin <1)
   axis = gca;
else
   axis =  get(fig,'CurrentAxes');
end
%give the name of every plot objects from the figure...
names = get(findobj(axis,'Type','line','Tag',''),'DisplayName');

end