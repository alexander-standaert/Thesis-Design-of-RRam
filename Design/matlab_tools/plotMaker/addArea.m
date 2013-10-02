function [ plotS ] = ...
  addArea( plotS, xvalues, yvalues, name, fillAll, labelType, ...
           labelYPosition, color, faceAlpha, edgeAlpha )
%function [ plotS ] = ...
%  addGraph( plotS, xvalues, yvalues, name, fillAll, labelType, ...
%            labelYPosition, color, faceAlpha, edgeAlpha )
%
% ps = addArea( ps, phase_1.xValues, (phase_1.xValues>0.5), 'phase_1', 
%               fillAll, labelType, -0.3, [0.9 0.4 0.4 ], faceAlpha, edgeAlpha );
% 
%  add the given area to the current plotS structure
% 
%  if name = '', it is not added to the legend
%
% only supported for linear graph for now
%
%  fillAll=1 fills the entire y-axis where yvalues>0 ; 
%  fillAll=0 only fills the area between yvalues and y=0;
%  
%  labelType=0 does not plot any label
%  labelType=1 plots a label at the first labelYPosition
%  labelType=2 plots a label at all labelYPosition 

if( ~isstruct(plotS) )
        plotS=newGraph( '', 1, '', 1 );
end

plotS.xvalues{end+1} = xvalues;
plotS.yvalues{end+1} = yvalues;

plotS.name{end+1} = name;

plotS.type{end+1} =2    ; %unique id for area

plotS.properties{end+1}.color=color; %tuple!
plotS.properties{end}.fillAll=fillAll; 
plotS.properties{end}.labelType=labelType; 
plotS.properties{end}.faceAlpha=faceAlpha; 
plotS.properties{end}.edgeAlpha=edgeAlpha; 
plotS.properties{end}.labelType=labelType; 
plotS.properties{end}.labelYPosition=labelYPosition; 



plotS.color{end+1}   ='';
plotS.lineStyle{end+1}='';

plotS.marker{end+1}   ='';
plotS.lineWidth{end+1}=0 ;
  
plotS.maxXMarkerDistance{end+1}=inf;
plotS.maxYMarkerDistance{end+1}=inf;


end

