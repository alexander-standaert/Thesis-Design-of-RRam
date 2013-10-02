[hFig, hMatrix] = datamatrix(magic(3));
datamatrix(magic(3),{'alpha','beta','gamma'},{'row 1','row 2','row3'});
datamatrix(magic(3),'xlabels',{'alpha','beta','gamma'},'xrotation',30,'xtitle','My data');
datamatrix([i,2-i,nan;1,2*i,3],'ylabels',{'ert','tyu'});        % test complex data
datamatrix([true,true,false;false,true,false],'color','m');     % test logical data
datamatrix([1,2,3;4,nan,5;7,6,8],'color',[.5,.73,.85]);         % 2nd color format; NaN
datamatrix(magic(3),'datatips',{'row#1/col#1','row#1/col#2'});  % datatips (2 elements only)
datamatrix(magic(3),'mindata',6,'callbacks',{'12',{@disp,34}}); % callbacks; data clamp