function [handle]=progbar(pb, progress, msg)

% progbar.m
%   general purpose progress bar for MATLAB. type 'progbar
%   demo' to get started. progbar has similar functionality
%   to the built-in "waitbar", but has better performance
%   for tight loops (since it ignores updates that come
%   faster than some fixed "period", default 100msec).
%
% USAGE:
%
% h = progbar                 initialises a new progbar (default settings)
% h = progbar(info)           initialises a new progbar
%     progbar(h,progress)     updates an existing progbar (progress in %)
%     progbar(h,progress,msg) update the progress and message on an existing progbar
%     progbar(h,-1)           closes an existing progbar (no error if already closed by user)
%
% info, if supplied, should be a structure with some
% or all of the following fields (listed as =<default>)
%
%    title='Progress'  title
%    msg=''            message
%    size=1            small integer dictating size of bar
%    period=0.1        a time in seconds dictating the minimum update
%                      rate of the progress bar
%    pos='centre'      any of 'topleft,top,top right,centreleft,centre,
%                        centreright,bottomleft,bottom,bottomright'. note
%                        american spelling accepted, but frowned upon.
%    color='blue'      RGB triple in MATLAB format, [R G B]. if you have
%                        the color tool 'rgb.m' on your path, you may use
%                        any format that rgb accepts. rgb.m is available
%                        at www.mathworks.com/matlabcentral
%    clearance=0       number between 0 and 1, affects appearance
%
% DEMOS:
%
% "progbar demo" - usage demonstration.
% "progbar perfdemo" - performance comparison with waitbar
%   (thanks to Bob Bemis).

% VERSION:  12/05/2010
% AUTHOR:   ben mitch
%
% CHANGES:
%   12/05/2010
%     * slight performance improvement suggested by Bob Bemis.
%     * some code tidying and improved commenting
%     * fixed slight bug in demo
%     * slightly improved help
%     * inspired by Bob Bemis, made changes for much
%     improved performance (twice as fast) during
%     ignored-by-time-period updates by (a) using cputime
%     instead of clock and (b) using try/catch instead of an
%     explicit call to ishandle().
%     * added perfdemo
%     * added testdemo (for testing, not for user)
%     * changed appearance to be, well, nicer
%     * new version confirmed to work in R14 (also thanks to Bob).



% update form
if nargin == 2 || nargin == 3

	% in case user has already closed it
	%
	% an alternative way to check is:
	%   if ~ishandle(pb) return; end
	%
	% this alternative is much faster IF the user HAS closed
	% the bar, but much slower if they haven't. since the user
	% closing the bar is the unlikely case, it makes more
	% sense to use the try/catch method, which is much faster
	% if the user HAS NOT closed the bar.
	try

		% get info
		info=get(pb, 'userdata');

	catch

		% ignore in that case
		return

	end

	% close
	if(progress==-1) close(pb); return; end

	% get out fast
	if (info.period)
		if (cputime - info.lastclock)<info.period return; end
		info.lastclock=cputime;
		set(pb,'userdata',info);
	end

	% check types
	if ~isnumeric(pb)
		error('pb should be a progress bar handle');
	end
	if ~isnumeric(progress)
		error('progress should be numeric');
	end

	% constrain
	if(progress<=0) progress=0.001; end
	if(progress>100) progress=100; end

	% do update
	BarHandle=get(get(pb,'Children'),'Children');
	set(BarHandle,'position',[0 0 progress 1],'visible','on');
	progress=ceil(progress-0.5);
	if isempty(info.title)
		set(pb,'name',[int2str(progress) '%']);
	else
		set(pb,'name',[int2str(progress) '% - ' info.title]);
	end

	% handle msg
	if nargin == 3
		ax=get(pb, 'children');
		ti=get(ax, 'title');
		set(ti, 'string', msg);
	end

	% ok
	drawnow
	return

end

if nargin<2

	if nargin==0 info.dummy='dummy'; end
	if nargin==1 info=pb; end

	% check type
	if isa(info, 'char')
		if strcmp(info, 'demo')
			progbar_demo
			return
		end
		if strcmp(info, 'perfdemo')
			progbar_perfdemo
			return
		end
		if strcmp(info, 'testdemo')
			progbar_testdemo
			return
		end
	end

	if ~isstruct(info)
		error('Single argument should be an info structure or ''demo''');
	end

	% extract
	if ~isfield(info,'title') info.title=''; end
	if ~isfield(info,'msg') info.msg=''; end
	if ~isfield(info,'size') info.size=1; end
	if ~isfield(info,'period') info.period=0.1; end
	if ~isfield(info,'pos') info.pos='centre'; end
	if ~isfield(info,'color') info.color=[0 0 192]/255; end
	if ~isfield(info,'clearance') info.clearance=0; end

	% check values
	if floor(info.size)~=info.size | info.size<1 | info.size>5
		error('size should be a small integer (1-5)');
	end
	if info.period<0
		error('period should not be negative');
	end
	if info.clearance<0 | info.clearance>1
		error('clearance should be between 0 and 1');
	end

	spars=get(0,'screensize');
	sl=spars(1);
	sb=spars(2);
	sw=spars(3);
	sh=spars(4);

	pw=200*info.size; % progress bar width
	ph=16*info.size; % progress bar height
	mh=~isempty(info.msg)*30;	% message bar height
	border=16;
	th=border+ph+border+mh; % total height
	tw=border+pw+border; % total width

	% check position
	switch info.pos
		case {'center','centre'}
			x=sl+sw/2;
			y=sb+sh/2;
		case {'centerleft','centreleft'}
			x=sl+sw/4;
			y=sb+sh/2;
		case {'centerright','centreright'}
			x=sl+3*sw/4;
			y=sb+sh/2;
		case {'top'}
			x=sl+sw/2;
			y=sb+3*sh/4;
		case {'topleft'}
			x=sl+sw/4;
			y=sb+3*sh/4;
		case {'topright'}
			x=sl+3*sw/4;
			y=sb+3*sh/4;
		case {'bottom'}
			x=sl+sw/2;
			y=sb+sh/4;
		case {'bottomleft'}
			x=sl+sw/4;
			y=sb+sh/4;
		case {'bottomright'}
			x=sl+3*sw/4;
			y=sb+sh/4;
		otherwise
			error(['pos ''' info.pos ''' was not recognised']);
	end

	info.lastclock=cputime;
	info.id='progbar';
	handle=figure(...
		'MenuBar','none',...
		'numbertitle','off',...
		'userdata',info,...
		'name',info.title);
	set(handle,'position',[x-tw/2 y-th/2 tw th]);
	set(handle,'resize','off');

	% get color
	color=info.color;
	if ~isempty(which('rgb.m'))
		color=rgb(color);
	end

	% check color
	if ~isa(color,'double') | size(color,1)~=1 | size(color,2)~=3
		close(handle);
		error('Unrecognised color');
	end

	rectangle('position',[0 0 0.001 1],'facecolor',color,'edgecolor',color,'visible','off')
	set(gca,'position',[border/tw border/th pw/tw ph/th])
	axis([0 100 -info.clearance 1+info.clearance])
	set(gca,'Xtick',[]);
	set(gca,'Ytick',[]);
	set(gca,'box','on');

	title(info.msg);
	drawnow
	return

end





% unrecognised call
error('incorrect usage - see "help progbar"');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% USAGE DEMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function progbar_demo

disp([10 'progbar.m demonstration: press a key to move on' 10]);
disp('Simple usage:');
disp([10 'p=progbar;'])
p=progbar;
pause
disp(['progbar(p,20)']);
progbar(p,20);
pause
disp(['progbar(p,70)']);
progbar(p,70);
pause
disp(['progbar(p,100)']);
progbar(p,100);
pause
disp(['progbar(p,-1)']);
progbar(p,-1)
pause
disp([10 'Set some parameters:']);
disp([10 'info.color=[1 0 0]']);
disp(['info.title=''LMS''']);
disp(['info.size=2']);
disp([10 'p=progbar(info)']);
disp(['progbar(p,50)']);
info.color=[1 0 0];
info.title='LMS';
info.size=2;
info.period=0; % force instant update for this demo
p=progbar(info);
progbar(p,50);
pause
disp('progbar(p,-1)')
progbar(p,-1)
pause
disp([10 'Set some more parameters:']);
disp([10 'info.clearance=0.5']);
disp('info.msg=''Processing Least Mean Square algorithm''');
disp('p=progbar(info);');
disp('progbar(p,20)');
info.clearance=0.5;
info.msg='Processing Least Mean Square algorithm';
info.period=0; % force instant update for this demo
p=progbar(info);
progbar(p,20);
pause
disp('progbar(p,-1)')
progbar(p,-1)
pause
disp([10 'For other uses of color and period, and detailed help, type help progbar' 10]);





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PERFORMANCE DEMO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function progbar_perfdemo

disp([10 'progbar.m performance demonstration' 10]);

N = 1e4;

disp('Tight loop using waitbar:');
disp('for n = 1:N');
disp('	waitbar(n/N, h);');
disp('end');

h = waitbar(0);
tic
for n = 1:N
	waitbar(n/N, h);
end
disp(['loop total time: ' num2str(toc)]);
close(h)
disp(' ')

disp('Tight loop using progbar:');
disp('for n = 1:N');
disp('	progbar(h, n/N*100);');
disp('end');

h = progbar;
tic
for n = 1:N
	progbar(h, n/N*100);
end
disp(['loop total time: ' num2str(toc)]);
progbar(h, -1)
disp(' ')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TEST DEMO (for, well, testing - not for the user)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function progbar_testdemo

N = 5e4;

disp('Tight loop using progbar:');

h = progbar;
tic
for n = 1:N
	progbar(h, n/N*100);
end
disp(['loop total time: ' num2str(toc)]);
progbar(h, -1)
disp(' ')




