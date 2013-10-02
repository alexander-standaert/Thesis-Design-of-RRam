function [ plotS ] = ...
  addPolygon( plotS, polyX, polyY, lineStyle, color, lineWidth )
%function [ plotS ] = ...
%  addPolygon( plotS, polyX, polyY, lineStyle, color, lineWidth )
%
%  connect points ( polyX{i}, polyY{i} ) 
%
%  lineWidth=0 or left out for default
%

if( ~isstruct(plotS) )
        plotS=newGraph( '', 1, '', 1 );
end


plotS.type{end+1} = 1;  % unique id for graph / polygon
plotS.properties{end+1}.dummmy=1;

plotS.xvalues{end+1} = polyX;
plotS.yvalues{end+1} = polyY;

plotS.name{end+1} = '';

plotS.lineStyle{end+1}=lineStyle;
plotS.color{end+1}=color;

plotS.marker{end+1}='';

if nargin>=6
  plotS.lineWidth{end+1}=lineWidth;
else
  plotS.lineWidth{end+1}=0;
end
  
plotS.maxXMarkerDistance{end+1}=inf;
plotS.maxYMarkerDistance{end+1}=inf;

end

