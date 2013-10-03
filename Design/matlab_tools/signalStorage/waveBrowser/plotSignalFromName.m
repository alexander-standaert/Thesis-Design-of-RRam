function [] = plotSignalFromName(simulation , treename , varargin )
%
% function [] = PlotSignalFromTree(simulation , treename , varargin )
%
% plot the fuction whose name is treename, fetched from the simulation
% simset. in addition, the DysplayName of the plot will be the same as the
% tree name.
% additionnal varargins are passed to the plot function...

if(nargin >2 )
    u = length(varargin);
else
    u= 0;
end
for i=1:size(simulation) 
    varargin{u+1} = 'DisplayName';
    varargin{u+2} = treename;
    if(~simulation(i).isSignalLoaded(treename))
        simulation(i).loadByName(treename)
    end
    plotSignal(simulation(i).getSignal(treename),varargin{:}  );
end