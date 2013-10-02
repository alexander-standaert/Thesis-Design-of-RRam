addpath(genpath('../Design'))



 bordeaux =  [0.4,0,0.4] ; 
 greenish =  [0,0.4,0.4];
 violet = [0.5,0,1];
 reddish = [0.7 0 0.3] ;
 darkblue =   [0.1 0 0.6]  ;

colmap = [bordeaux; reddish; violet; greenish; darkblue;];
%colormap(colmap);

%set up a few defaults values for plotting
set(0,'DefaultLineLineWidth',2)
set(0, 'DefaultAxesLineStyleOrder','-|--|:|-.');
fprintf('paths added\n')
