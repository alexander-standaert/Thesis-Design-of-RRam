function makePlotDynamic( SimVariableName , fig )
%
%   function makePlotDynamic( SimVariableName , fig )
%
% Makes the figure given in fig dynamically refreshable. To refresh the
% data on the figure, use the 'refreshdata' function.
%
% Refreshing the data will make matlab fetch the latest waveform
%
% the figure will update its graph by using simulation loaded from the
% simulation whose variable name is SimVariableName...


if(nargin <2)
   fig = gcf;
end
%
%  get a handle on all the plots of the figure...
  axis = findobj(fig,'Type','axes','Tag','');
  plots = findobj(axis,'Type','line','Tag','');
UWIViewerObject = evalin( 'base', 'UWIViewerObject' );

for  i=1:length(plots)
   plot = plots(i);
   pName = get(plot,'DisplayName');
   if(UWIViewerObject.doesSignalExist(pName))
       set(plot,'XDataSource',sprintf('%s.getSignal(''%s'').getXValues',SimVariableName,pName));
       set(plot,'YDataSource',sprintf('%s.getSignal(''%s'').getYValues',SimVariableName,pName));
   else
       warning('%s doesnt exist (any more ?)\n',pName);
   end
end
%try refreshing the data...
refreshdata(fig);
