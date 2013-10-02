function [ plotS ] = ...
  addGraph( plotS, xvalues, yvalues, name, lineStyle, color, marker, ...
  lineWidth, maxXMarkerDistance, maxYMarkerDistance )
%function [ plotS ] = ...
%  addGraph( plotS, xvalues, yvalues, lineStyle, color, marker, ...
%  lineWidth, maxXMarkerDistance, maxYMarkerDistance )
%
% 
%  lineWidth=0 or left out for default
%  minXMarkerDistance=0 or left out for default
%
%  add the given graph to the current plotS structure
% 
%  if name = '', it is not added to the legend

if length( xvalues) ~= length( yvalues )
    error( 'different length for xvalues and yvalues' );
end

if( ~isstruct(plotS) )
        plotS=newGraph( '', 1, '', 1 );
end

plotS.type{end+1} = 1;  % unique id for graph
plotS.properties{end+1}.dummmy=1;

plotS.xvalues{end+1} = xvalues;
plotS.yvalues{end+1} = yvalues;

plotS.name{end+1} = name;

plotS.lineStyle{end+1}=lineStyle;
plotS.color{end+1}=color;

if nargin>=7
  plotS.marker{end+1}=marker;
else

  plotS.marker{end+1}='';
end
if nargin>=8
  plotS.lineWidth{end+1}=lineWidth;
else
  plotS.lineWidth{end+1}=0;
end
  
if nargin>=9
  plotS.maxXMarkerDistance{end+1}=maxXMarkerDistance;
else
  plotS.maxXMarkerDistance{end+1}=inf;
end

if nargin>=10
  plotS.maxYMarkerDistance{end+1}=maxYMarkerDistance;
else
  plotS.maxYMarkerDistance{end+1}=inf;
end


end

